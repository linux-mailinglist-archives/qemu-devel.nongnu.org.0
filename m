Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C9E28FEC6
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 09:00:04 +0200 (CEST)
Received: from localhost ([::1]:44506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTJid-0005w7-76
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 03:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kTJbc-0006Wp-JH
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 02:52:48 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:38151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kTJba-0000KU-Hw
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 02:52:48 -0400
Received: by mail-pl1-x629.google.com with SMTP id p11so753059pld.5
 for <qemu-devel@nongnu.org>; Thu, 15 Oct 2020 23:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2kY5ett+QWPLf7YSyh8jGdL92dxsYH5p3fXf42vrQcQ=;
 b=SUF9oGncipZtlx2uVPi4paV8eX+lklMqQHV3rUhJC6yeMAVzww2CzYGVQgW4Q3JtzG
 3yiFxdIimGOCtNkkvEi1jsXC+k6p648iXSnClkOLJPS6HVHiKPIRIJq/GCoFfaK8Vt6q
 Bodtcjow0tKhTsxcPN/rgIdotZ0QzkT5T8kYO2ZL9EFSfh8KLlcx3mBL/AhjYOQJkF1C
 /01pmQvnGgrSqMQAHv5zeIaGrvI9r8u0QXS/R2mKSy7ZIpKSZBT0BSfRSHxOOns4pV6J
 AEkyUlWLiXbu4tHNufwYhL+z/Vj8Am6loSZcpL21c76KPFdDzX+BhvIbEwdjPza0ZMK9
 eCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2kY5ett+QWPLf7YSyh8jGdL92dxsYH5p3fXf42vrQcQ=;
 b=UNfiZ53JKDk/28Fdv4vG3SlF80pN/eexCMu1cwCFjPXhGsvbEJVk5f9fop0kXZfOL6
 /+pBm6qYOqLdPY9RPC6ab+/LvoOldHDb7o4swPiunLnTXR/OMJD95iguTv0ch0U7qupW
 k86R7dXBbXbFxWYI1I2l9sc8h0WqxojJu4PhRQoGXY5s5JFjyQ8QX1XErJfXlAUuKapz
 oDvwLtRt3z4rko0/wxU4fjR9gu7wi/PbZIXA9sEXPB33aHuTbfpWH4YhMg+vNrCtWOCm
 5RfAhA08rwMS0qUnCNsSy7BL1zx8mqXGKIpS+v9R3h+Fv3yqL3nEiQzG6Za4kVKbJnQk
 FBrA==
X-Gm-Message-State: AOAM531YPWIxU1v93psJmT/g9shTmfvNa3ee1G5MYMeNmRZlrq9GDrfi
 5GYM7kgfY1YQP/oXdNnXfBY=
X-Google-Smtp-Source: ABdhPJzHQbMm0k60CdzmScBA4a2kkCxmSlNRptBjlK0oHOVVL6ZLqEqkIwCKwB8ovD7KAQyGTH8LTw==
X-Received: by 2002:a17:90b:3798:: with SMTP id
 mz24mr2525801pjb.46.1602831164992; 
 Thu, 15 Oct 2020 23:52:44 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
 by smtp.gmail.com with ESMTPSA id v21sm1552200pjg.44.2020.10.15.23.52.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 23:52:44 -0700 (PDT)
From: Huacai Chen <zltjiangshi@gmail.com>
X-Google-Original-From: Huacai Chen <chenhc@lemote.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Subject: [PATCH V14 4/8] target/mips: Add loongson-ext lsdc2 group of
 instructions
Date: Fri, 16 Oct 2020 14:51:56 +0800
Message-Id: <1602831120-3377-5-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1602831120-3377-1-git-send-email-chenhc@lemote.com>
References: <1602831120-3377-1-git-send-email-chenhc@lemote.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=zltjiangshi@gmail.com; helo=mail-pl1-x629.google.com
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
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
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

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 target/mips/translate.c | 179 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 25321d3c17..b2ce323e39 100644
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
+                               int rs, int rd)
+{
+    int offset = sextract32(ctx->opcode, 3, 8);
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
2.17.2


