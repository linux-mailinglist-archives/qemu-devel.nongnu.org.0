Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE56352F749
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 03:11:34 +0200 (CEST)
Received: from localhost ([::1]:56644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsDeX-0005Un-T8
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 21:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1nsCQS-0005XH-CN; Fri, 20 May 2022 19:52:56 -0400
Received: from mout-u-107.mailbox.org ([80.241.59.207]:51761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1nsCQQ-0002h6-QA; Fri, 20 May 2022 19:52:56 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4L4k754QQLz9sSg;
 Sat, 21 May 2022 01:52:49 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-trivial@nongnu.org
Cc: Lev Kujawski <lkujaw@member.fsf.org>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org (open list:IDE),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] ide_ioport_read: Return lower octet of data register instead
 of 0xFF
Date: Fri, 20 May 2022 23:52:00 +0000
Message-Id: <20220520235200.1138450-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4L4k754QQLz9sSg
Received-SPF: pass client-ip=80.241.59.207; envelope-from=lkujaw@member.fsf.org;
 helo=mout-u-107.mailbox.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 20 May 2022 20:46:33 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prior to this patch, the pre-GRUB Solaris x86 bootloader would fail to
load on QEMU with the following screen output:

SunOS Secondary Boot version 3.00

prom_panic: Could not mount filesystem.
Entering boot debugger:
[136419]: _

This occurs because the bootloader issues an ATA IDENTIFY DEVICE
command, and then reads the resulting 256 words of parameter
information using inb rather than the correct inw. As the previous
behavior of QEMU was to return 0xFF and not advance the drive's sector
buffer, DRQ would never be cleared and the bootloader would be blocked
from selecting a secondary ATA device, such as an optical drive.

Resolves:
* [Bug 1639394] Unable to boot Solaris 8/9 x86 under Fedora 24

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
 hw/ide/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 3a5afff5d7..c2caa54285 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2166,7 +2166,11 @@ uint32_t ide_ioport_read(void *opaque, uint32_t addr)
     hob = bus->cmd & (IDE_CTRL_HOB);
     switch (reg_num) {
     case ATA_IOPORT_RR_DATA:
-        ret = 0xff;
+        /*
+         * The pre-GRUB Solaris x86 bootloader relies upon inb
+         * consuming a word from the drive's sector buffer.
+         */
+        ret = ide_data_readw(bus, addr) & 0xff;
         break;
     case ATA_IOPORT_RR_ERROR:
         if ((!bus->ifs[0].blk && !bus->ifs[1].blk) ||
-- 
2.34.1


