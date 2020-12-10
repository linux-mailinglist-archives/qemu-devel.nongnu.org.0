Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA552D59FB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:07:15 +0100 (CET)
Received: from localhost ([::1]:46828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKj4-0002Lw-L0
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR5-0001am-L8
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:39 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQs-00077J-FP
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:39 -0500
Received: by mail-wr1-x42e.google.com with SMTP id y17so5133446wrr.10
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oC9ZADiN58GfuZANtIRVD/N6F8RJXI0Q+vqpyz4GkZU=;
 b=oNPFP7xyz5PUEZYZ1fjrS1ELkDOHNl1yC46n9s70JQ9ul3VeqzWpClOVMQ8q1Crq2z
 s5w3DoVwEYoagd+A4qFWvlLqVIYt2aFEQE1VxlZ1tFycOu6mGPLaRJhjtpNOOrgjWrsY
 hztyXb82ZtuYaDrhkRsNAR9d2DP87zWCtHdYEl+yOpfBsCw/aQZuandKN8zbPp3RRkGm
 av+nxswSMCTEniXaQad2uSnfvZCoZdTxkf921B1wCmU6zCz9vH+A5BgyQ1gcwBqPeI9w
 dFy092aEg5zW8iFFw57MAtZyAozcoQz5rrV/tVTN9h7sihbhaWdDQk2/JXjuRp6yFHBO
 QJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oC9ZADiN58GfuZANtIRVD/N6F8RJXI0Q+vqpyz4GkZU=;
 b=MZM3+0WImAVlMFwM25GhamuWMOOnt0P6MScoUczEFqJI4br9Nh9nGmsjnw1NSbQbyM
 2lxDbllzGHIxhbHW83ceiADpu4IHMEqWsI0hE9vvEdgz5xGPyQvlZYBYZlWQf9NDMDBX
 9Tgx108zD8lP0y5eQ2l2qXq1LPurFQagP8cL6A/nE9EsUa+x0jNwwtWscBlM/w5h5UsY
 sHN1EN4az3mUDgPCHCYPuVqOqshokfyTx9WJqWn9MVFde05cwI0zzf8GyPK3YHUjCOoy
 CMcuP9PniRZF16+1kU+NQXRPWnsPa1gtl9DIdMQLQxs43FLXFIRQtUgVAsDJ4C0a0kTU
 L2WA==
X-Gm-Message-State: AOAM533m/ggJHaB+Mkae/8jmkPplw8pd35dj6kgcC1fssszEl8e79V/E
 aaMe+BSy+Q+a1gymcqNbMxQlHVGxHCaL9A==
X-Google-Smtp-Source: ABdhPJwaohm8uiXAKpBQRFn6o3s7Y1vs8bTliV1TPORbUaYRWENTqvmDL6YcJK94GoKS0LKsvSYiEA==
X-Received: by 2002:adf:f681:: with SMTP id v1mr5711782wrp.133.1607600901984; 
 Thu, 10 Dec 2020 03:48:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/36] target/arm: Implement VLDR/VSTR system register
Date: Thu, 10 Dec 2020 11:47:40 +0000
Message-Id: <20201210114756.16501-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-10-peter.maydell@linaro.org
---
 target/arm/vfp.decode          | 14 ++++++
 target/arm/translate-vfp.c.inc | 91 ++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 1300ba045dd..6f7f28f9a46 100644
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
index 7a0cbca6640..f884d680a03 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -913,6 +913,97 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
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
+    gen_aa32_st_i32(s, value, addr, get_mem_index(s),
+                    MO_UL | MO_ALIGN | s->be_data);
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
+    gen_aa32_ld_i32(s, value, addr, get_mem_index(s),
+                    MO_UL | MO_ALIGN | s->be_data);
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


