Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74FC45F0C9
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 16:35:01 +0100 (CET)
Received: from localhost ([::1]:48290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqdFc-00087E-PZ
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 10:35:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mqdCp-0006YO-CC
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 10:32:07 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:59414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1mqdCn-0003yP-5N
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 10:32:07 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 28DAD2191E;
 Fri, 26 Nov 2021 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637940722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oPB8AvfyF0Q8JFBZDraMVopEt6rLPektDnjB4N5qVIo=;
 b=cJlRj8yJt6swTfRXfzFcloQxylC2P7sgEZcJEZuYB7wn64eoZFfOy9KFDUzQClreABNhdw
 NCPeoIfY99J6etWMtaA/XZcgf2r1QSw/msSZVB1xrWlIpML0kxc6WnYMDIR1DIOgskXGTH
 QS+Pmio6XhFtCXGx1ZYxrJdlLrUqqoc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637940722;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oPB8AvfyF0Q8JFBZDraMVopEt6rLPektDnjB4N5qVIo=;
 b=pdtPoRGnl/vmsqxakXKns7Wv1G55V4dUZOevo4IrC29/10K5YOWChpFUM6GPW+SeBEuyWe
 q2b3HUGvgY41vECQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED1A913C65;
 Fri, 26 Nov 2021 15:32:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pt1uOPH9oGG8bgAAMHmgww
 (envelope-from <lizhang@suse.de>); Fri, 26 Nov 2021 15:32:01 +0000
From: Li Zhang <lizhang@suse.de>
To: quintela@redhat.com, dgilbert@redhat.com, cfontana@suse.de,
 qemu-devel@nongnu.org
Subject: [PATCH 0/2] migration: multifd live migration improvement
Date: Fri, 26 Nov 2021 16:31:52 +0100
Message-Id: <20211126153154.25424-1-lizhang@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Li Zhang <lizhang@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When testing live migration with multifd channels (8, 16, or a bigger number)
and using qemu -incoming (without "defer"), if a network error occurs
(for example, triggering the kernel SYN flooding detection),
the migration fails and the guest hangs forever.

The test environment and the command line is as the following:

QEMU verions: QEMU emulator version 6.2.91 (v6.2.0-rc1-47-gc5fbdd60cf)
Host OS: SLE 15  with kernel: 5.14.5-1-default
Network Card: mlx5 100Gbps
Network card: Intel Corporation I350 Gigabit (1Gbps)

Source:
qemu-system-x86_64 -M q35 -smp 32 -nographic \
        -serial telnet:10.156.208.153:4321,server,nowait \
        -m 4096 -enable-kvm -hda /var/lib/libvirt/images/openSUSE-15.3.img \
        -monitor stdio
Dest:
qemu-system-x86_64 -M q35 -smp 32 -nographic \
        -serial telnet:10.156.208.154:4321,server,nowait \
        -m 4096 -enable-kvm -hda /var/lib/libvirt/images/openSUSE-15.3.img \
        -monitor stdio \
        -incoming tcp:1.0.8.154:4000

(qemu) migrate_set_parameter max-bandwidth 100G
(qemu) migrate_set_capability multifd on
(qemu) migrate_set_parameter multifd-channels 16

The guest hangs when executing the command: migrate -d tcp:1.0.8.154:4000.

If a network problem happens, TCP ACK is not received by destination
and the destination resets the connection with RST.

No.     Time    Source  Destination     Protocol        Length  Info
119     1.021169        1.0.8.153       1.0.8.154       TCP     1410    60166 → 4000 [PSH, ACK] Seq=65 Ack=1 Win=62720 Len=1344 TSval=1338662881 TSecr=1399531897
No.     Time    Source  Destination     Protocol        Length  Info
125     1.021181        1.0.8.154       1.0.8.153       TCP     54      4000 → 60166 [RST] Seq=1 Win=0 Len=0

kernel log:
[334520.229445] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
[334562.994919] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
[334695.519927] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
[334734.689511] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
[335687.740415] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
[335730.013598] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.

There are two problems here:
1. When live migration fails, the guest hangs and no errors reported
   even if an error has happened.
2. The network problem causes the live migraiton failure when channel
   number is 8, 16, or larger.

So the two patches are to fix the two problems.

Li Zhang (2):
  multifd: use qemu_sem_timedwait in multifd_recv_thread to avoid
    waiting forever
  migration: Set the socket backlog number to reduce chance of live
    migration failure

 migration/multifd.c | 2 +-
 migration/socket.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.31.1


