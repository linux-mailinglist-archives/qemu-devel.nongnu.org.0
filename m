Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BEF4E85FD
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Mar 2022 07:37:23 +0200 (CEST)
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYLac-0007q9-4D
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 01:37:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xen0n@gentoo.org>) id 1nYLZV-0007B9-WF
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 01:36:14 -0400
Received: from [2001:470:ea4a:1:5054:ff:fec7:86e4] (port=37645
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <xen0n@gentoo.org>) id 1nYLZS-0004Rm-4M
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 01:36:13 -0400
From: WANG Xuerui <xen0n@gentoo.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Fix address space range declaration on n32
Date: Sun, 27 Mar 2022 13:34:55 +0800
Message-Id: <20220327053456.2552855-1-xen0n@gentoo.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2001:470:ea4a:1:5054:ff:fec7:86e4 (failed)
Received-SPF: pass client-ip=2001:470:ea4a:1:5054:ff:fec7:86e4;
 envelope-from=xen0n@gentoo.org; helo=smtp.gentoo.org
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Andreas=20K=20=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 WANG Xuerui <xen0n@gentoo.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This bug is probably lurking there for so long, I cannot even git-blame
my way to the commit first introducing it.

Anyway, because n32 is also TARGET_MIPS64, the address space range
cannot be determined by looking at TARGET_MIPS64 alone. Fix this by only
declaring 48-bit address spaces for n64, or the n32 user emulation will
happily hand out memory ranges beyond the 31-bit limit and crash.

Confirmed to make the minimal reproducing example in the linked issue
behave.

Closes: https://gitlab.com/qemu-project/qemu/-/issues/939
Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: Andreas K. Hüttel <dilfridge@gentoo.org>
---
 target/mips/cpu-param.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/cpu-param.h b/target/mips/cpu-param.h
index 9c4a6ea45e2..1aebd01df9c 100644
--- a/target/mips/cpu-param.h
+++ b/target/mips/cpu-param.h
@@ -12,7 +12,7 @@
 #else
 # define TARGET_LONG_BITS 32
 #endif
-#ifdef TARGET_MIPS64
+#ifdef TARGET_ABI_MIPSN64
 #define TARGET_PHYS_ADDR_SPACE_BITS 48
 #define TARGET_VIRT_ADDR_SPACE_BITS 48
 #else
-- 
2.35.1


