Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBBE629BFB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:24:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouwqw-00072l-Gm; Tue, 15 Nov 2022 09:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pw4Z=3P=lse.epita.fr=xdbob@cri.epita.fr>)
 id 1ouwqt-0006wZ-Mh
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:23:51 -0500
Received: from mail.cri.epita.fr ([91.243.117.197]
 helo=mail-2.srv.cri.epita.fr)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pw4Z=3P=lse.epita.fr=xdbob@cri.epita.fr>)
 id 1ouwqq-0004j2-Mw
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:23:51 -0500
Received: from localhost (unknown [185.123.26.202])
 (Authenticated sender: damhet_a)
 by mail-2.srv.cri.epita.fr (Postfix) with ESMTPSA id 2E9123FB8A;
 Tue, 15 Nov 2022 15:23:41 +0100 (CET)
From: antoine.damhet@shadow.tech
To: qemu-devel@nongnu.org
Cc: vm@shadow.tech,
	Antoine Damhet <antoine.damhet@shadow.tech>
Subject: [PATCH 0/2] TLS: fix read stall with large buffers
Date: Tue, 15 Nov 2022 15:23:27 +0100
Message-Id: <20221115142329.92524-1-antoine.damhet@shadow.tech>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=91.243.117.197;
 envelope-from=SRS0=Pw4Z=3P=lse.epita.fr=xdbob@cri.epita.fr;
 helo=mail-2.srv.cri.epita.fr
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Antoine Damhet <antoine.damhet@shadow.tech>

At least with the TCP backend the tls implementation can stall because
the current notification mechanism is based on the readyness status of
the underlying file descriptor but gnutls can read all the data
available while the consumer has only handled part (eg: the TCP
implementation is capped to 4096 bytes per read).

We encountered the bug on the real world using encrypted
USB-redirection but we could reproduce it with virtio-serial.

On the host side:

```
$ mkdir /tmp/tls-test
$ echo 'test:8e6da54b954357236ec2eed1df0dc3542163dd03bf9c94f2d90781a3a3e443c9' > /tmp/tls-test/keys.psk
$ qemu-system-x86_64 -m 4G -enable-kvm -device virtio-serial \
	-object tls-creds-psk,id=tls0,endpoint=server,dir=/tmp/tls-test \
	-chardev socket,server=on,wait=off,id=serial-sock,port=4242,host=127.0.0.1,tls-creds=tls0 \
	-device virtserialport,chardev=serial-sock,name=test.serial \
	-cdrom archlinux-2022.11.01-x86_64.iso
# The sleep is to keep the socket open during the test
$ python -c 'print(8192 * "a"); import time; time.sleep(600);' | \
	openssl s_client -connect 127.0.0.1:4242 \
	-psk 8e6da54b954357236ec2eed1df0dc3542163dd03bf9c94f2d90781a3a3e443c9 \
	-psk_identity test
```

On the guest side:

```
# The socket is forced open, we stop cat manually
$ cat /dev/virtio-ports/test.serial > test.data
^C
# only part of the data was readable
$ wc -c test.data
4096
```

Antoine Damhet (2):
  crypto: TLS: introduce `check_pending`
  io/channel-tls: fix handling of bigger read buffers

 crypto/tlssession.c         | 14 ++++++++
 include/crypto/tlssession.h | 11 +++++++
 io/channel-tls.c            | 66 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 90 insertions(+), 1 deletion(-)

-- 
2.38.1


