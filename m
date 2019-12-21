Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845A8128A65
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Dec 2019 17:25:18 +0100 (CET)
Received: from localhost ([::1]:40526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iihZ7-0007fw-Ff
	for lists+qemu-devel@lfdr.de; Sat, 21 Dec 2019 11:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56441)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter@lekensteyn.nl>) id 1iihVW-0006D6-1i
 for qemu-devel@nongnu.org; Sat, 21 Dec 2019 11:21:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter@lekensteyn.nl>) id 1iihVU-0003iy-1g
 for qemu-devel@nongnu.org; Sat, 21 Dec 2019 11:21:33 -0500
Received: from mail.lekensteyn.nl ([2a02:2308::360:1:25]:55261)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter@lekensteyn.nl>) id 1iihVT-0003UU-GW
 for qemu-devel@nongnu.org; Sat, 21 Dec 2019 11:21:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lekensteyn.nl; s=s2048-2015-q1; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=0ISQZaogL7p0l6Pcf319hHDRm/Mr9e12UiuUyUubt9k=; 
 b=VJYeFlYd2mi5Nur8d5RjUHWevgmN+adLZc1GGphFbIHvW3ok5KbuaxGXW1k6ewzfwkGZTbItgjmqdmqqVTFmm1e/zpynrzZQoU0oEQCGHZAuQsG1TU4MeYbuAeMMIkZCsRLsSH54N/QdVzbOxogZ2xJW8lSgkxDqirfs3PQmnluCrjADSz6Brjff4PuTo/ZCpJ0Uuw8YaX38OBvwudkcDya8r7gxjWbMhSAY6D8g9rc6XbSv58HRQReNvUnZBPQdDy1hhBnkTfV4AEL/AO6g1ZmutMW9zHXrSswTh3t7VJ2BaIwPe/WSCyK4gdKabtuS/3qSShwrJB9vUOfdCU8caw==;
Received: by lekensteyn.nl with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <peter@lekensteyn.nl>)
 id 1iihVO-0005LB-W3; Sat, 21 Dec 2019 17:21:27 +0100
From: Peter Wu <peter@lekensteyn.nl>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/i386/pc: fix regression in parsing vga cmdline parameter
Date: Sat, 21 Dec 2019 17:21:24 +0100
Message-Id: <20191221162124.1159291-1-peter@lekensteyn.nl>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a02:2308::360:1:25
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Sergio Lopez <slp@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the 'vga=' parameter is succeeded by another parameter, QEMU 4.2.0
would refuse to start with a rather cryptic message:

    $ qemu-system-x86_64 -kernel /boot/vmlinuz-linux -append 'vga=792 quiet'
    qemu: can't parse 'vga' parameter: Invalid argument

It was not clear whether this applied to the '-vga std' parameter or the
'-append' one. Fix the parsing regression and clarify the error.

Fixes: 133ef074bd ("hw/i386/pc: replace use of strtol with qemu_strtoui in x86_load_linux()")
Cc: Sergio Lopez <slp@redhat.com>
Signed-off-by: Peter Wu <peter@lekensteyn.nl>
---
Hi,

This fixes a regression in QEMU 4.2.0 where my existing scripts would
fail to boot while it worked fine with QEMU 4.1.1.

I do wonder whether QEMU has any business in strictly enforcing the
contents of the kernel command line. Perhaps it should only warn about
the issue, and not exit? Previously it would silently ignore bad values.

Kind regards,
Peter
---
 hw/i386/x86.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 394edc2f72..121650ae51 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -508,6 +508,7 @@ void x86_load_linux(X86MachineState *x86ms,
     vmode = strstr(kernel_cmdline, "vga=");
     if (vmode) {
         unsigned int video_mode;
+        const char *end;
         int ret;
         /* skip "vga=" */
         vmode += 4;
@@ -518,10 +519,9 @@ void x86_load_linux(X86MachineState *x86ms,
         } else if (!strncmp(vmode, "ask", 3)) {
             video_mode = 0xfffd;
         } else {
-            ret = qemu_strtoui(vmode, NULL, 0, &video_mode);
-            if (ret != 0) {
-                fprintf(stderr, "qemu: can't parse 'vga' parameter: %s\n",
-                        strerror(-ret));
+            ret = qemu_strtoui(vmode, &end, 0, &video_mode);
+            if (ret != 0 || (*end && *end != ' ')) {
+                fprintf(stderr, "qemu: invalid 'vga=' kernel parameter.\n");
                 exit(1);
             }
         }
-- 
2.24.1


