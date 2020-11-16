Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDEB2B4B0A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:28:46 +0100 (CET)
Received: from localhost ([::1]:45480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehMz-0002UU-TG
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3h-0000A9-93
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:49 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:43261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3e-0007s1-7R
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:48 -0500
Received: by mail-wr1-x444.google.com with SMTP id s8so19244567wrw.10
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aHtpQRU3H8qXd2uvyEa+TFGGzXeXygeYRFKCnGAFOiY=;
 b=Thn+dm+ZO0TrYHQlTvaQ4VzGkVaWnLuvydHfSoJ+yjvYVpb0xU0c/oS3rxUK4e37id
 KDPW+v6Hi6G50IR02aXSv104DfYj35r6oQ58JndUeetO9ok7lJ3YzjnGGk5eOOpIjOP1
 2K0kYq3i26Gzx76lQ7BgpsMkZWkyePoN2eDx3dqBdZszMOw7t8RcJb3IjReHi1mK2QiJ
 AJxKM4dZ+GTxYMOuwIky57yn37lTsFdqBtWtW0JY5aCXqUmRxLrq2+3t2sM5TgSDnGnA
 GTDnnhWhsr+Q5L4efYhGSSL2NnpcccOApcjBrF80eodvwzaiP+VrwQsUVrWhQmEr7sw0
 i98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aHtpQRU3H8qXd2uvyEa+TFGGzXeXygeYRFKCnGAFOiY=;
 b=b6nlTgWVCGfqLobhN/Q+VNNPw0SGUNFQ1mtuPfRmS1vG5hS0MyiCWSMfLZ8aXMqxDr
 335xEpGE98PSlg54ge0GCuP90flY07SbUiC0W0GExcbInEsZfUvqcNU3Fyrdd02696Jz
 Y2l8f/irqYHoz34VQeePiUdCDLLhk5IiQbeUhfuvnZpuq4Rb9u1kqiuioHekZX65LnIq
 rwxXv9TXgu4G5X7vT/UH+Rh9d8fiwM9pgDQFKV8YNHbCArv7xaf+YFcUuQTpGRznjYdt
 Mc3iOEGpY91NnQc6eNPqtMSi4XiW9/x3kZRl9ofS9Slu+gi1vSPQTl4lSFnNKIG5eg0t
 a2pw==
X-Gm-Message-State: AOAM533fIs7HkI7Lmdyv1AiYsRuBm1ikHg1/T1jxGVVoUQYkzCJc6XXV
 4WbKG8NC1YX1eNlZD+0GUKQMDnBtNau9/Q==
X-Google-Smtp-Source: ABdhPJwezl7TBLITZpqjDkGzJ2covezL9PcIMp/fJ71ZVDcc28lHmaKujTPQXGF1Gdy0/UwqtAxYpg==
X-Received: by 2002:adf:eb07:: with SMTP id s7mr19207487wrn.320.1605542924788; 
 Mon, 16 Nov 2020 08:08:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/15] target/arm: Implement VLDR/VSTR system register
Date: Mon, 16 Nov 2020 16:08:25 +0000
Message-Id: <20201116160831.31000-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the new-in-v8.1M VLDR/VSTR variants which directly
read or write FP system registers to memory.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp.decode          | 14 ++++++
 target/arm/translate-vfp.c.inc | 89 ++++++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)

diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 51f143b4a51..45e3023840b 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -84,6 +84,20 @@ VLDR_VSTR_hp ---- 1101 u:1 .0 l:1 rn:4 .... 1001 imm:8      vd=%vd_sp
 VLDR_VSTR_sp ---- 1101 u:1 .0 l:1 rn:4 .... 1010 imm:8      vd=%vd_sp
 VLDR_VSTR_dp ---- 1101 u:1 .0 l:1 rn:4 .... 1011 imm:8      vd=%vd_dp
 
+# M-profile VLDR/VSTR to sysreg
+%vldr_sysreg 22:1 13:3
+%imm7_0x4 0:7 !function=times_4
+
+&vldr_sysreg rn reg imm a w p
+@vldr_sysreg .... ... . a:1 . . . rn:4 ... . ... .. ....... \
+             reg=%vldr_sysreg imm=%imm7_0x4 &vldr_sysreg
+
+# P=0 W=0 is SEE "Related encodings", so split into two patterns
+VLDR_sysreg  ---- 110 1 . . w:1 1 .... ... 0 111 11 ....... @vldr_sysreg p=1
+VLDR_sysreg  ---- 110 0 . . 1   1 .... ... 0 111 11 ....... @vldr_sysreg p=0 w=1
+VSTR_sysreg  ---- 110 1 . . w:1 0 .... ... 0 111 11 ....... @vldr_sysreg p=1
+VSTR_sysreg  ---- 110 0 . . 1   0 .... ... 0 111 11 ....... @vldr_sysreg p=0 w=1
+
 # We split the load/store multiple up into two patterns to avoid
 # overlap with other insns in the "Advanced SIMD load/store and 64-bit move"
 # grouping:
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 5d880d12116..cc115f1d35d 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -912,6 +912,95 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
     return true;
 }
 
+static void fp_sysreg_to_memory(DisasContext *s, void *opaque, TCGv_i32 value)
+{
+    arg_vldr_sysreg *a = opaque;
+    uint32_t offset = a->imm;
+    TCGv_i32 addr;
+
+    if (!a->a) {
+        offset = - offset;
+    }
+
+    addr = load_reg(s, a->rn);
+    if (a->p) {
+        tcg_gen_addi_i32(addr, addr, offset);
+    }
+
+    if (s->v8m_stackcheck && a->rn == 13 && a->w) {
+        gen_helper_v8m_stackcheck(cpu_env, addr);
+    }
+
+    gen_aa32_st32(s, value, addr, get_mem_index(s));
+    tcg_temp_free_i32(value);
+
+    if (a->w) {
+        /* writeback */
+        if (!a->p) {
+            tcg_gen_addi_i32(addr, addr, offset);
+        }
+        store_reg(s, a->rn, addr);
+    } else {
+        tcg_temp_free_i32(addr);
+    }
+}
+
+static TCGv_i32 memory_to_fp_sysreg(DisasContext *s, void *opaque)
+{
+    arg_vldr_sysreg *a = opaque;
+    uint32_t offset = a->imm;
+    TCGv_i32 addr;
+    TCGv_i32 value = tcg_temp_new_i32();
+
+    if (!a->a) {
+        offset = - offset;
+    }
+
+    addr = load_reg(s, a->rn);
+    if (a->p) {
+        tcg_gen_addi_i32(addr, addr, offset);
+    }
+
+    if (s->v8m_stackcheck && a->rn == 13 && a->w) {
+        gen_helper_v8m_stackcheck(cpu_env, addr);
+    }
+
+    gen_aa32_ld32u(s, value, addr, get_mem_index(s));
+
+    if (a->w) {
+        /* writeback */
+        if (!a->p) {
+            tcg_gen_addi_i32(addr, addr, offset);
+        }
+        store_reg(s, a->rn, addr);
+    } else {
+        tcg_temp_free_i32(addr);
+    }
+    return value;
+}
+
+static bool trans_VLDR_sysreg(DisasContext *s, arg_vldr_sysreg *a)
+{
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+        return false;
+    }
+    if (a->rn == 15) {
+        return false;
+    }
+    return gen_M_fp_sysreg_write(s, a->reg, memory_to_fp_sysreg, a);
+}
+
+static bool trans_VSTR_sysreg(DisasContext *s, arg_vldr_sysreg *a)
+{
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+        return false;
+    }
+    if (a->rn == 15) {
+        return false;
+    }
+    return gen_M_fp_sysreg_read(s, a->reg, fp_sysreg_to_memory, a);
+}
+
 static bool trans_VMOV_half(DisasContext *s, arg_VMOV_single *a)
 {
     TCGv_i32 tmp;
-- 
2.20.1


