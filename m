Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBB125A90D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 12:04:11 +0200 (CEST)
Received: from localhost ([::1]:42380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDPcg-0006ud-0z
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 06:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kDPbn-0006No-KZ
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 06:03:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:47606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kDPbl-0000OG-Nk
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 06:03:15 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1509FACA0;
 Wed,  2 Sep 2020 10:03:12 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Subject: meson build failure, configure without tcg, fixed by running make
 again
Message-ID: <c9971e27-fded-3e5d-d489-b1fb539b8ec1@suse.de>
Date: Wed, 2 Sep 2020 12:03:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 00:13:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi Paolo,

there seems to be some parallelism or race condition somewhere?

with master, commit 8d90bfc5c31ad60f6049dd39be636b06bc00b652
I am doing:

mkdir build-nontcg
cd build-nontcg
../configure --disable-tcg --enable-kvm --enable-hax
make -j120
make -j120 check

I am getting:

Compiling C object tests/qtest/libqos/libqos.a.p/arm-n800-machine.c.o
In file included from ../tests/qtest/libqos/libqtest.h:20:0,
                 from ../tests/qtest/libqtest.c:23:
/dev/shm/cfontana/qemu/include/qapi/qmp/qobject.h:35:10: fatal error: qapi/qapi-builtin-types.h: No such file or directory
 #include "qapi/qapi-builtin-types.h"
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
In file included from ../tests/qtest/libqos/libqtest.h:20:0,
                 from ../tests/qtest/libqos/i2c.h:12,
                 from ../tests/qtest/libqos/i2c.c:10:
/dev/shm/cfontana/qemu/include/qapi/qmp/qobject.h:35:10: fatal error: qapi/qapi-builtin-types.h: No such file or directory
 #include "qapi/qapi-builtin-types.h"
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
In file included from ../tests/qtest/libqos/libqtest.h:20:0,
                 from ../tests/qtest/libqos/malloc.h:17,
                 from ../tests/qtest/libqos/malloc.c:14:
/dev/shm/cfontana/qemu/include/qapi/qmp/qobject.h:35:10: fatal error: qapi/qapi-builtin-types.h: No such file or directory
 #include "qapi/qapi-builtin-types.h"
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
In file included from ../tests/qtest/libqos/libqtest.h:20:0,
                 from ../tests/qtest/libqos/e1000e.c:20:
/dev/shm/cfontana/qemu/include/qapi/qmp/qobject.h:35:10: fatal error: qapi/qapi-builtin-types.h: No such file or directory
 #include "qapi/qapi-builtin-types.h"
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../tests/qtest/libqos/libqtest.h:20:0,
                 from ../tests/qtest/libqos/usb.c:15:
/dev/shm/cfontana/qemu/include/qapi/qmp/qobject.h:35:10: fatal error: qapi/qapi-builtin-types.h: No such file or directory
 #include "qapi/qapi-builtin-types.h"
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
compilation terminated.
make: *** [Makefile.ninja:816: tests/qtest/libqos/libqos.a.p/.._libqtest.c.o] Error 1
make: *** Waiting for unfinished jobs....

make: *** [Makefile.ninja:833: tests/qtest/libqos/libqos.a.p/i2c.c.o] Error 1
Compiling C object tests/qtest/libqos/libqos.a.p/arm-sabrelite-machine.c.o
Compiling C object tests/qtest/libqos/libqos.a.p/arm-raspi2-machine.c.o
In file included from ../tests/qtest/libqos/libqtest.h:20:0,
                 from ../tests/qtest/libqos/virtio-mmio.c:11:
/dev/shm/cfontana/qemu/include/qapi/qmp/qobject.h:35:10: fatal error: qapi/qapi-builtin-types.h: No such file or directory
 #include "qapi/qapi-builtin-types.h"
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../tests/qtest/libqos/libqtest.h:20:0,
                 from ../tests/qtest/libqos/pci-pc.c:14:
/dev/shm/cfontana/qemu/include/qapi/qmp/qobject.h:35:10: fatal error: qapi/qapi-builtin-types.h: No such file or directory
 #include "qapi/qapi-builtin-types.h"
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
compilation terminated.

(repeated many many times).

This is fixed by re-running

make -j120

Ciao,

Claudio

-- 
Claudio Fontana
Engineering Manager Virtualization, SUSE Labs Core

SUSE Software Solutions Italy Srl

