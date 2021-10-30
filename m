Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4003440923
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 15:32:42 +0200 (CEST)
Received: from localhost ([::1]:38088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgoTR-0003G3-Gx
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 09:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mgoQs-0002Rv-O1
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 09:30:02 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40992
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mgoQr-00029F-30
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 09:30:02 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mgoQN-0003Ry-H8; Sat, 30 Oct 2021 14:29:35 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 30 Oct 2021 14:29:43 +0100
Message-Id: <20211030132943.21362-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH] target/i386: ensure EXCP0D_GPF is propagated back to the guest
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the case where mmu_translate() returns EXCP0D_GPF ensure that handle_mmu_fault()
returns immediately to propagate the fault back to the guest instead of returning
EXCP0E_PAGE.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 661ff4879e ("target/i386: extract mmu_translate")
Closes: https://gitlab.com/qemu-project/qemu/-/issues/394
---

[Paolo: this appears to fix the regression booting Windows 7 on TCG that appeared in 6.1
 as per the above Gitlab issue. Unfortunately as I'm not really familiar with x86 it will
 probably need a better implementation/description but it should at least indicate what
 the problem is.]

 target/i386/tcg/sysemu/excp_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 7af887be4d..0170f7f791 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -439,6 +439,10 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
                                 prot, mmu_idx, page_size);
         return 0;
     } else {
+        if (cs->exception_index == EXCP0D_GPF) {
+            return 1;
+        }
+
         if (env->intercept_exceptions & (1 << EXCP0E_PAGE)) {
             /* cr2 is not modified in case of exceptions */
             x86_stq_phys(cs,
-- 
2.20.1


