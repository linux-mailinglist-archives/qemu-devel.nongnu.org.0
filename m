Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35EE4E8CF9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 06:08:50 +0200 (CEST)
Received: from localhost ([::1]:40798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYggS-0004iM-TA
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 00:08:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xen0n@gentoo.org>) id 1nYgXq-0002hS-8q
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 23:59:54 -0400
Received: from woodpecker.gentoo.org ([140.211.166.183]:44158
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <xen0n@gentoo.org>) id 1nYgXn-0000Mj-Kc
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 23:59:53 -0400
From: WANG Xuerui <xen0n@gentoo.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v2] target/mips: Fix address space range declaration
 on n32
Date: Mon, 28 Mar 2022 11:59:42 +0800
Message-Id: <20220328035942.3299661-1-xen0n@gentoo.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=140.211.166.183; envelope-from=xen0n@gentoo.org;
 helo=smtp.gentoo.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 "Andreas K . Huettel" <dilfridge@gentoo.org>,
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
Tested-by: Andreas K. Huettel <dilfridge@gentoo.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---

v2:
- Collect tags
- Make it clear this patch is for 7.0

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


