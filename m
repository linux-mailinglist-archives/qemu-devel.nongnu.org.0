Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA09285B42
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 10:49:11 +0200 (CEST)
Received: from localhost ([::1]:48032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQ58I-0003B8-PD
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 04:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kQ53Y-00006Z-9Y
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 04:44:17 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:33771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kQ53V-0002eL-Ia
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 04:44:15 -0400
Received: by mail-pf1-x430.google.com with SMTP id q123so963140pfb.0
 for <qemu-devel@nongnu.org>; Wed, 07 Oct 2020 01:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ha6JYcH4xZlF9aw+AwVC+S+4YrzPRUQCmhT6v3Stm2k=;
 b=TLgCJs/Cv3YRQcGJq7hUYNvZrmUDH3N/HHxKkY7NhkdoCo41sH3CIPX0BWs9CqNal2
 Q61AU3ihCPuBNQ7SEeRAHbcLLRwuiolo9zvvNK50NW48dcDGbAkmhOKJTKJjkynnHFzL
 12XJJOpDtWmw+kRF6gnXupuTl2ournCotznP4XYS+mA/lhZrqAVZ29Ezm/+tQ9wgkwhz
 UkW4WIaFpgAthCOfJjs7A7xPu1C/eNebBGuzCWqVOndkm4qLXuOOJhXh2lT3FjDHEJ+/
 lHzujPm5dcMo/OJogwqx1WmEG6avGlcQhX4geQ8hOA+dKbEwLsNt3wvL/ZR8/DC7ZcLj
 hqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ha6JYcH4xZlF9aw+AwVC+S+4YrzPRUQCmhT6v3Stm2k=;
 b=Seuhp21GJom2ekJzru4RCvJzwkHekNpKcSHbTA0HtaOxkCXO1lON66k/neaAFazPah
 C3ks2Y3VI4rmtjdA5r3EZKcpiyRTatlI+8xs/YyqHszNyf6zEA2zQ8mfISmtPHgxntXO
 yK9UFUjvHQLmiShBNhUgQ5b9Xef5iHQKDz/bk0fC//xPBEeLgFkgUhRn+L/gYc2CRd38
 PazEd8mhcwKvwzlXoamT17mXmr+K23MYPwaeRE2MoY0g4+AATSR7wRY9WmpjW1dycVzP
 9Jy/DOXbwfhe1mDmn+xAAkHLfwWs8ZMm0rm7zU8rpGoUDU+WysRsc69EIha0Yn5Om+e7
 nKMA==
X-Gm-Message-State: AOAM532ANNhyK8c88mLO4vyHmgs9cCWeKBSKrSPoKUgEMXBiqQ1rMyK0
 gDnlb3ORUcfvFuPBjsCJDzA=
X-Google-Smtp-Source: ABdhPJxkrVN2jPd/XhotfM8f5G583nfQLfbReazOOdYVNhbP6LLTBF0c9jrzbMsVxEk5l/3Muy6RJw==
X-Received: by 2002:a65:53cc:: with SMTP id z12mr2186537pgr.333.1602060251441; 
 Wed, 07 Oct 2020 01:44:11 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
 by smtp.gmail.com with ESMTPSA id i9sm1999692pfq.53.2020.10.07.01.44.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Oct 2020 01:44:10 -0700 (PDT)
From: Huacai Chen <zltjiangshi@gmail.com>
X-Google-Original-From: Huacai Chen <chenhc@lemote.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Subject: [PATCH V13 6/9] target/mips: Add loongson-ext lsdc2 group of
 instructions
Date: Wed,  7 Oct 2020 16:39:32 +0800
Message-Id: <1602059975-10115-7-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1602059975-10115-1-git-send-email-chenhc@lemote.com>
References: <1602059975-10115-1-git-send-email-chenhc@lemote.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=zltjiangshi@gmail.com; helo=mail-pf1-x430.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@gmail.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

LDC2/SDC2 opcodes have been rewritten as "load & store with offset"
group of instructions by loongson-ext ASE.

This patch add implementation of these instructions:
gslbx: load 1 bytes to GPR
gslhx: load 2 bytes to GPR
gslwx: load 4 bytes to GPR
gsldx: load 8 bytes to GPR
gslwxc1: load 4 bytes to FPR
gsldxc1: load 8 bytes to FPR
gssbx: store 1 bytes from GPR
gsshx: store 2 bytes from GPR
gsswx: store 4 bytes from GPR
gssdx: store 8 bytes from GPR
gsswxc1: store 4 bytes from FPR
gssdxc1: store 8 bytes from FPR

Details of Loongson-EXT is here:
https://github.com/FlyGoat/loongson-insn/blob/master/loongson-ext.md

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/translate.c | 179 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 916b57f..4d42cfc 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -484,6 +484,24 @@ enum {
     OPC_GSSDRC1     = 0x7 | OPC_GSSHFS,
 };
 
+/* Loongson EXT LDC2/SDC2 opcodes */
+#define MASK_LOONGSON_LSDC2(op)           (MASK_OP_MAJOR(op) | (op & 0x7))
+
+enum {
+    OPC_GSLBX      = 0x0 | OPC_LDC2,
+    OPC_GSLHX      = 0x1 | OPC_LDC2,
+    OPC_GSLWX      = 0x2 | OPC_LDC2,
+    OPC_GSLDX      = 0x3 | OPC_LDC2,
+    OPC_GSLWXC1    = 0x6 | OPC_LDC2,
+    OPC_GSLDXC1    = 0x7 | OPC_LDC2,
+    OPC_GSSBX      = 0x0 | OPC_SDC2,
+    OPC_GSSHX      = 0x1 | OPC_SDC2,
+    OPC_GSSWX      = 0x2 | OPC_SDC2,
+    OPC_GSSDX      = 0x3 | OPC_SDC2,
+    OPC_GSSWXC1    = 0x6 | OPC_SDC2,
+    OPC_GSSDXC1    = 0x7 | OPC_SDC2,
+};
+
 /* BSHFL opcodes */
 #define MASK_BSHFL(op)              (MASK_SPECIAL3(op) | (op & (0x1F << 6)))
 
@@ -6172,6 +6190,165 @@ static void gen_loongson_lswc2(DisasContext *ctx, int rt,
     tcg_temp_free(t0);
 }
 
+/* Loongson EXT LDC2/SDC2 */
+static void gen_loongson_lsdc2(DisasContext *ctx, int rt,
+                                int rs, int rd)
+{
+    int offset = (int8_t)(ctx->opcode >> 3);
+    uint32_t opc = MASK_LOONGSON_LSDC2(ctx->opcode);
+    TCGv t0, t1;
+    TCGv_i32 fp0;
+
+    /* Pre-conditions */
+    switch (opc) {
+    case OPC_GSLBX:
+    case OPC_GSLHX:
+    case OPC_GSLWX:
+    case OPC_GSLDX:
+        /* prefetch, implement as NOP */
+        if (rt == 0) {
+            return;
+        }
+        break;
+    case OPC_GSSBX:
+    case OPC_GSSHX:
+    case OPC_GSSWX:
+    case OPC_GSSDX:
+        break;
+    case OPC_GSLWXC1:
+#if defined(TARGET_MIPS64)
+    case OPC_GSLDXC1:
+#endif
+        check_cp1_enabled(ctx);
+        /* prefetch, implement as NOP */
+        if (rt == 0) {
+            return;
+        }
+        break;
+    case OPC_GSSWXC1:
+#if defined(TARGET_MIPS64)
+    case OPC_GSSDXC1:
+#endif
+        check_cp1_enabled(ctx);
+        break;
+    default:
+        MIPS_INVAL("loongson_lsdc2");
+        generate_exception_end(ctx, EXCP_RI);
+        return;
+        break;
+    }
+
+    t0 = tcg_temp_new();
+
+    gen_base_offset_addr(ctx, t0, rs, offset);
+    gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
+
+    switch (opc) {
+    case OPC_GSLBX:
+        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_SB);
+        gen_store_gpr(t0, rt);
+        break;
+    case OPC_GSLHX:
+        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TESW |
+                            ctx->default_tcg_memop_mask);
+        gen_store_gpr(t0, rt);
+        break;
+    case OPC_GSLWX:
+        gen_base_offset_addr(ctx, t0, rs, offset);
+        if (rd) {
+            gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
+        }
+        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TESL |
+                            ctx->default_tcg_memop_mask);
+        gen_store_gpr(t0, rt);
+        break;
+#if defined(TARGET_MIPS64)
+    case OPC_GSLDX:
+        gen_base_offset_addr(ctx, t0, rs, offset);
+        if (rd) {
+            gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
+        }
+        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ |
+                            ctx->default_tcg_memop_mask);
+        gen_store_gpr(t0, rt);
+        break;
+#endif
+    case OPC_GSLWXC1:
+        check_cp1_enabled(ctx);
+        gen_base_offset_addr(ctx, t0, rs, offset);
+        if (rd) {
+            gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
+        }
+        fp0 = tcg_temp_new_i32();
+        tcg_gen_qemu_ld_i32(fp0, t0, ctx->mem_idx, MO_TESL |
+                            ctx->default_tcg_memop_mask);
+        gen_store_fpr32(ctx, fp0, rt);
+        tcg_temp_free_i32(fp0);
+        break;
+#if defined(TARGET_MIPS64)
+    case OPC_GSLDXC1:
+        check_cp1_enabled(ctx);
+        gen_base_offset_addr(ctx, t0, rs, offset);
+        if (rd) {
+            gen_op_addr_add(ctx, t0, cpu_gpr[rd], t0);
+        }
+        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_TEQ |
+                            ctx->default_tcg_memop_mask);
+        gen_store_fpr64(ctx, t0, rt);
+        break;
+#endif
+    case OPC_GSSBX:
+        t1 = tcg_temp_new();
+        gen_load_gpr(t1, rt);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_SB);
+        tcg_temp_free(t1);
+        break;
+    case OPC_GSSHX:
+        t1 = tcg_temp_new();
+        gen_load_gpr(t1, rt);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUW |
+                            ctx->default_tcg_memop_mask);
+        tcg_temp_free(t1);
+        break;
+    case OPC_GSSWX:
+        t1 = tcg_temp_new();
+        gen_load_gpr(t1, rt);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL |
+                            ctx->default_tcg_memop_mask);
+        tcg_temp_free(t1);
+        break;
+#if defined(TARGET_MIPS64)
+    case OPC_GSSDX:
+        t1 = tcg_temp_new();
+        gen_load_gpr(t1, rt);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEQ |
+                            ctx->default_tcg_memop_mask);
+        tcg_temp_free(t1);
+        break;
+#endif
+    case OPC_GSSWXC1:
+        fp0 = tcg_temp_new_i32();
+        gen_load_fpr32(ctx, fp0, rt);
+        tcg_gen_qemu_st_i32(fp0, t0, ctx->mem_idx, MO_TEUL |
+                            ctx->default_tcg_memop_mask);
+        tcg_temp_free_i32(fp0);
+        break;
+#if defined(TARGET_MIPS64)
+    case OPC_GSSDXC1:
+        t1 = tcg_temp_new();
+        gen_load_fpr64(ctx, t1, rt);
+        tcg_gen_qemu_st_i64(t1, t0, ctx->mem_idx, MO_TEQ |
+                            ctx->default_tcg_memop_mask);
+        tcg_temp_free(t1);
+        break;
+#endif
+    default:
+        break;
+    }
+
+    tcg_temp_free(t0);
+}
+
 /* Traps */
 static void gen_trap(DisasContext *ctx, uint32_t opc,
                      int rs, int rt, int16_t imm)
@@ -31055,6 +31232,8 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
                 /* OPC_JIC, OPC_JIALC */
                 gen_compute_compact_branch(ctx, op, 0, rt, imm);
             }
+        } else if (ctx->insn_flags & ASE_LEXT) {
+            gen_loongson_lsdc2(ctx, rt, rs, rd);
         } else {
             /* OPC_LWC2, OPC_SWC2 */
             /* COP2: Not implemented. */
-- 
2.7.0


