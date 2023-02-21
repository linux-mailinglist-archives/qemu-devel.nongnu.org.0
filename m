Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D27DA69E9FB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:20:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUayV-00069f-Al; Tue, 21 Feb 2023 17:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pUay5-0005vH-9f
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:18:37 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pUay3-0005ls-B9
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:18:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aZNIf8SUhPVCHgfGtfdH0W55b3rV4YfHsWUUCtHkfLk=; b=FE7W4Bh4G6JnLgISCuhj8yG2OJ
 NUlqcTujInv45Qgxo+T+hTZdlqV+nlwneMEmmOzyr4ZwbNzl8Y5/UYONVXVcsSoMU+Vv8tgaesD+O
 kgJMwYAzsPX+JO3RNNHhhwY69xmnPRX0b4luPviF1wNonW/sJ1Q/OqUMv5II/qW/mPHU=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 edgar.iglesias@gmail.com, philmd@linaro.org, shorne@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
Subject: [PATCH v2 05/27] include/exec: Replace `TARGET_TB_PCREL` with
 `CF_PCREL`
Date: Tue, 21 Feb 2023 23:17:56 +0100
Message-Id: <20230221221818.9382-6-anjo@rev.ng>
In-Reply-To: <20230221221818.9382-1-anjo@rev.ng>
References: <20230221221818.9382-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/exec-all.h | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 9186a58554..f1615af7cb 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -505,22 +505,20 @@ struct tb_tc {
 };
 
 struct TranslationBlock {
-#if !TARGET_TB_PCREL
     /*
      * Guest PC corresponding to this block.  This must be the true
      * virtual address.  Therefore e.g. x86 stores EIP + CS_BASE, and
      * targets like Arm, MIPS, HP-PA, which reuse low bits for ISA or
      * privilege, must store those bits elsewhere.
      *
-     * If TARGET_TB_PCREL, the opcodes for the TranslationBlock are
-     * written such that the TB is associated only with the physical
-     * page and may be run in any virtual address context.  In this case,
-     * PC must always be taken from ENV in a target-specific manner.
+     * If CF_PCREL, the opcodes for the TranslationBlock are written
+     * such that the TB is associated only with the physical page and
+     * may be run in any virtual address context.  In this case, PC
+     * must always be taken from ENV in a target-specific manner.
      * Unwind information is taken as offsets from the page, to be
      * deposited into the "current" PC.
      */
     target_ulong pc;
-#endif
 
     /*
      * Target-specific data associated with the TranslationBlock, e.g.:
@@ -614,22 +612,19 @@ struct TranslationBlock {
     uintptr_t jmp_dest[2];
 };
 
-/* Hide the read to avoid ifdefs for TARGET_TB_PCREL. */
-static inline target_ulong tb_pc(const TranslationBlock *tb)
-{
-#if TARGET_TB_PCREL
-    qemu_build_not_reached();
-#else
-    return tb->pc;
-#endif
-}
-
 /* Hide the qatomic_read to make code a little easier on the eyes */
 static inline uint32_t tb_cflags(const TranslationBlock *tb)
 {
     return qatomic_read(&tb->cflags);
 }
 
+/* Hide the read to avoid ifdefs for CF_PCREL. */
+static inline target_ulong tb_pc(const TranslationBlock *tb)
+{
+    assert(!(tb_cflags(tb) & CF_PCREL));
+    return tb->pc;
+}
+
 static inline tb_page_addr_t tb_page_addr0(const TranslationBlock *tb)
 {
 #ifdef CONFIG_USER_ONLY
-- 
2.39.1


