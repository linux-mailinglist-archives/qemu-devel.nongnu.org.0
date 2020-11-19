Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25BE2B9D52
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 23:05:35 +0100 (CET)
Received: from localhost ([::1]:36122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfs3a-0001fS-OE
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 17:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfruy-0000kG-St
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:41 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfruq-0004Az-CS
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:35 -0500
Received: by mail-wm1-x344.google.com with SMTP id a186so5772143wme.1
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=opCzeDjiGx7OhE/oRP6OxBZouGB0q+W7fnmO9TQA2f8=;
 b=DnyxAwOt3qo/5R8xN/DI/1otRLHGaffGampfIR2NhhRfk5rcGxtz9gu5Vv4dSZXWFk
 AA03zyxijF9rnmIVVHEztuBInt55RxSvWLeKkFlDtf+pzptR2RC4JrA1HF1w72vxrBDv
 rCYaY5NUJ8rxOpuotB0YV6Wa0QCjLsSuVI9YbwVHlyRyGASf9oXXbVavdn/H35yQYakc
 owd7hW5daN9Y4wDKhNTFUVbMs1+5IpEYxwVRx0WOW2timUlkYZhiSLjs2Rd0C0LwofCh
 SDz3vHZKP3fOCDqcK3gDUbDXf/+i/1lifTCNRWWKN3s/7va41XRWJP/Ww+415eyHCBlP
 2cKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=opCzeDjiGx7OhE/oRP6OxBZouGB0q+W7fnmO9TQA2f8=;
 b=phllxMN1Q6PsDnC4zQS3Hb7l1KQ0ufdBYQyGWJdYSduYPgZsrYnaYlJ2nmCQVF//4l
 ICE/KnagJY3B53nRCWtL/bUpZIcCJ9/+x5bEPc0YtqKfms6aeMfW1MdtcSnjcILqg4Ao
 kotyMIPvyHNuu6I1prVC7XQGfDPMIDI9TCwcGGUYukV5p1DG81Unm9cycCm4WLra3fZb
 ZLIhqtXPgSug9Iyc8JnOzNH7xZAb4W1Pq0xeOHAaXdKubKYBZ+B4P2ujc/n9SwzdhQ56
 GkVrloH96WxDyXvaX2a7ZYQn3wcnu4vURQjPOU2Aiw+LeX3kDw7baC4RK+5rLz+8sJDu
 zSaQ==
X-Gm-Message-State: AOAM533UBTkY5m6+pBPzBJ5p9xYtAZx1e+OlLwwKbSHDSPkUMb1Xmks7
 4O7ylncdnonY53uk7KwxmM94SNGISbdBdw==
X-Google-Smtp-Source: ABdhPJxVxPpNphSJK9xbveE4tszKOWjJnL8VpNvHcs7dF0jp3FE7qX8H2VRZXY+Cv5C+w2lpaC1aYA==
X-Received: by 2002:a1c:e907:: with SMTP id q7mr6607945wmc.161.1605822990883; 
 Thu, 19 Nov 2020 13:56:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 09/28] target/arm: Implement VLDR/VSTR system register
Date: Thu, 19 Nov 2020 21:55:58 +0000
Message-Id: <20201119215617.29887-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
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
index 2d201ad0888..dc26759ab95 100644
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


