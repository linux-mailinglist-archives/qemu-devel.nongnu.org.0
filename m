Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28E84BD8B3
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:52:58 +0100 (CET)
Received: from localhost ([::1]:49536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5NJ-000101-OK
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:52:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zO-00086I-SC
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:14 -0500
Received: from [2a00:1450:4864:20::42d] (port=35596
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zM-00010r-6V
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:14 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v12so25925939wrv.2
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Xfcy31MSFDcBP73xxb5IfXxX1Gf18FiCDI/7Lu5FhBI=;
 b=fcdzAo0rpXDanUC4juAr749SZrU8Ngo0l596WJN5G5qWY7oICuU1BLxg5JYC0m3KXu
 CfG+1AcEGG0MfMdc2d5X55kLjKvH4aTaLengjJv0CvLodG0m0GZztoX4CzfmRyVmrrPZ
 Qf4sS998+ueSLkWDDtyc6hy+zh1B29tlBnrc2Bbanyb8RY5CtXOjJMWrKwwLF7bhhyhh
 Sgk7sshIWF5V6GFM2xIyBAvhEBp364xdIR2lBZ0V6BKBrkwRkcA6MilGCR83ke30+hq1
 6kWVwbCVeJ7vzd6gKlEdgfRt2H/iVXJcgETNS1kNk/OuG/acBww39YTqEwZJuWg1myn/
 PaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xfcy31MSFDcBP73xxb5IfXxX1Gf18FiCDI/7Lu5FhBI=;
 b=5QELaxNc3o4ColrgNZzlNYKrJUYPAI0HdkbLIbEeohaB4yMView1MkqCIoAJUgrUWf
 xVGCamCm7f1Omq6MSKIeBE1tgoRzwVqpmvVh3SNtH1DNB12uEoqZ9odsosW2xm8x+h7g
 F6d+M5BW1rYDmt0XBkTvldP2oGEGZPQW3s8s86fhpz5yIA8IS8UGUc4iLfz/Tz3T+CXI
 HY5Tg4tmuS1cItQDAVM6qhoFNepkZcoi0fZjvvYOXLqWVqcIYMtbB2XZ9Fp4/jptH/T4
 DySXmtrRfY+8Ld0zIT18TeMBK6a42+9cT93Yf6abqCk8eRypnzD9Y29TWrw0SRnFG5yt
 UHWA==
X-Gm-Message-State: AOAM530MZh4N04CuRUpSMLLVZlTDC8ytKzIjpVchBlupBzZALa69jvU0
 u9I8R4Bzr9BLMpsM0jHIS9vehZ77CXRbTA==
X-Google-Smtp-Source: ABdhPJxtIGOunnOYJBkCdDJ47QqukxPy8McfEm68Fa/IFQwN8XMqIrmJNDHTQIJvhNyh6KF9USIdbw==
X-Received: by 2002:adf:f68d:0:b0:1e1:db49:a721 with SMTP id
 v13-20020adff68d000000b001e1db49a721mr15101300wrp.297.1645435690841; 
 Mon, 21 Feb 2022 01:28:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/26] target/arm: Unindent unnecessary else-clause
Date: Mon, 21 Feb 2022 09:27:44 +0000
Message-Id: <20220221092800.404870-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the if() branch of the condition in aarch64_max_initfn()
returns early, we don't need to keep the rest of the code in
the function inside an else block. Remove the else, unindenting
that code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220204165506.2846058-5-peter.maydell@linaro.org
---
 target/arm/cpu64.c | 289 +++++++++++++++++++++++----------------------
 1 file changed, 146 insertions(+), 143 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index ae2e431247f..2280e476fd7 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -707,176 +707,179 @@ static void aarch64_host_initfn(Object *obj)
 static void aarch64_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    uint64_t t;
+    uint32_t u;
 
     if (kvm_enabled()) {
         /* With KVM, '-cpu max' is identical to '-cpu host' */
         aarch64_host_initfn(obj);
         return;
-    } else {
-        uint64_t t;
-        uint32_t u;
-        aarch64_a57_initfn(obj);
+    }
 
-        /*
-         * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
-         * one and try to apply errata workarounds or use impdef features we
-         * don't provide.
-         * An IMPLEMENTER field of 0 means "reserved for software use";
-         * ARCHITECTURE must be 0xf indicating "v7 or later, check ID registers
-         * to see which features are present";
-         * the VARIANT, PARTNUM and REVISION fields are all implementation
-         * defined and we choose to define PARTNUM just in case guest
-         * code needs to distinguish this QEMU CPU from other software
-         * implementations, though this shouldn't be needed.
-         */
-        t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
-        t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
-        t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
-        t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
-        t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
-        cpu->midr = t;
+    /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
 
-        t = cpu->isar.id_aa64isar0;
-        t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2); /* AES + PMULL */
-        t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2); /* SHA512 */
-        t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);
-        t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
-        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2); /* FEAT_TLBIRANGE */
-        t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
-        cpu->isar.id_aa64isar0 = t;
+    aarch64_a57_initfn(obj);
 
-        t = cpu->isar.id_aa64isar1;
-        t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);
-        t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
-        t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
-        t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
-        cpu->isar.id_aa64isar1 = t;
+    /*
+     * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
+     * one and try to apply errata workarounds or use impdef features we
+     * don't provide.
+     * An IMPLEMENTER field of 0 means "reserved for software use";
+     * ARCHITECTURE must be 0xf indicating "v7 or later, check ID registers
+     * to see which features are present";
+     * the VARIANT, PARTNUM and REVISION fields are all implementation
+     * defined and we choose to define PARTNUM just in case guest
+     * code needs to distinguish this QEMU CPU from other software
+     * implementations, though this shouldn't be needed.
+     */
+    t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
+    t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
+    t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
+    t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
+    t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
+    cpu->midr = t;
 
-        t = cpu->isar.id_aa64pfr0;
-        t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
-        t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
-        t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
-        t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
-        t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);
-        cpu->isar.id_aa64pfr0 = t;
+    t = cpu->isar.id_aa64isar0;
+    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2); /* AES + PMULL */
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2); /* SHA512 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);
+    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+    t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2); /* FEAT_TLBIRANGE */
+    t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
+    cpu->isar.id_aa64isar0 = t;
 
-        t = cpu->isar.id_aa64pfr1;
-        t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
-        t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);
-        /*
-         * Begin with full support for MTE. This will be downgraded to MTE=0
-         * during realize if the board provides no tag memory, much like
-         * we do for EL2 with the virtualization=on property.
-         */
-        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);
-        cpu->isar.id_aa64pfr1 = t;
+    t = cpu->isar.id_aa64isar1;
+    t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);
+    t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
+    t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
+    cpu->isar.id_aa64isar1 = t;
 
-        t = cpu->isar.id_aa64mmfr0;
-        t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 5); /* PARange: 48 bits */
-        cpu->isar.id_aa64mmfr0 = t;
+    t = cpu->isar.id_aa64pfr0;
+    t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
+    t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
+    t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
+    t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
+    t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);
+    cpu->isar.id_aa64pfr0 = t;
 
-        t = cpu->isar.id_aa64mmfr1;
-        t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
-        t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
-        t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);
-        t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2); /* ATS1E1 */
-        t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* VMID16 */
-        t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1); /* TTS2UXN */
-        cpu->isar.id_aa64mmfr1 = t;
+    t = cpu->isar.id_aa64pfr1;
+    t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
+    t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);
+    /*
+     * Begin with full support for MTE. This will be downgraded to MTE=0
+     * during realize if the board provides no tag memory, much like
+     * we do for EL2 with the virtualization=on property.
+     */
+    t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);
+    cpu->isar.id_aa64pfr1 = t;
 
-        t = cpu->isar.id_aa64mmfr2;
-        t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
-        t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
-        t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
-        cpu->isar.id_aa64mmfr2 = t;
+    t = cpu->isar.id_aa64mmfr0;
+    t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 5); /* PARange: 48 bits */
+    cpu->isar.id_aa64mmfr0 = t;
 
-        t = cpu->isar.id_aa64zfr0;
-        t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
-        t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
-        t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
-        t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);
-        t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
-        t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
-        t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
-        t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
-        t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
-        cpu->isar.id_aa64zfr0 = t;
+    t = cpu->isar.id_aa64mmfr1;
+    t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
+    t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
+    t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);
+    t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2); /* ATS1E1 */
+    t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* VMID16 */
+    t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1); /* TTS2UXN */
+    cpu->isar.id_aa64mmfr1 = t;
 
-        /* Replicate the same data to the 32-bit id registers.  */
-        u = cpu->isar.id_isar5;
-        u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
-        u = FIELD_DP32(u, ID_ISAR5, SHA1, 1);
-        u = FIELD_DP32(u, ID_ISAR5, SHA2, 1);
-        u = FIELD_DP32(u, ID_ISAR5, CRC32, 1);
-        u = FIELD_DP32(u, ID_ISAR5, RDM, 1);
-        u = FIELD_DP32(u, ID_ISAR5, VCMA, 1);
-        cpu->isar.id_isar5 = u;
+    t = cpu->isar.id_aa64mmfr2;
+    t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
+    t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
+    t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
+    cpu->isar.id_aa64mmfr2 = t;
 
-        u = cpu->isar.id_isar6;
-        u = FIELD_DP32(u, ID_ISAR6, JSCVT, 1);
-        u = FIELD_DP32(u, ID_ISAR6, DP, 1);
-        u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
-        u = FIELD_DP32(u, ID_ISAR6, SB, 1);
-        u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
-        u = FIELD_DP32(u, ID_ISAR6, BF16, 1);
-        u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
-        cpu->isar.id_isar6 = u;
+    t = cpu->isar.id_aa64zfr0;
+    t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
+    t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
+    t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
+    t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);
+    t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
+    t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
+    t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
+    t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
+    t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
+    cpu->isar.id_aa64zfr0 = t;
 
-        u = cpu->isar.id_pfr0;
-        u = FIELD_DP32(u, ID_PFR0, DIT, 1);
-        cpu->isar.id_pfr0 = u;
+    /* Replicate the same data to the 32-bit id registers.  */
+    u = cpu->isar.id_isar5;
+    u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
+    u = FIELD_DP32(u, ID_ISAR5, SHA1, 1);
+    u = FIELD_DP32(u, ID_ISAR5, SHA2, 1);
+    u = FIELD_DP32(u, ID_ISAR5, CRC32, 1);
+    u = FIELD_DP32(u, ID_ISAR5, RDM, 1);
+    u = FIELD_DP32(u, ID_ISAR5, VCMA, 1);
+    cpu->isar.id_isar5 = u;
 
-        u = cpu->isar.id_pfr2;
-        u = FIELD_DP32(u, ID_PFR2, SSBS, 1);
-        cpu->isar.id_pfr2 = u;
+    u = cpu->isar.id_isar6;
+    u = FIELD_DP32(u, ID_ISAR6, JSCVT, 1);
+    u = FIELD_DP32(u, ID_ISAR6, DP, 1);
+    u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
+    u = FIELD_DP32(u, ID_ISAR6, SB, 1);
+    u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
+    u = FIELD_DP32(u, ID_ISAR6, BF16, 1);
+    u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
+    cpu->isar.id_isar6 = u;
 
-        u = cpu->isar.id_mmfr3;
-        u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
-        cpu->isar.id_mmfr3 = u;
+    u = cpu->isar.id_pfr0;
+    u = FIELD_DP32(u, ID_PFR0, DIT, 1);
+    cpu->isar.id_pfr0 = u;
 
-        u = cpu->isar.id_mmfr4;
-        u = FIELD_DP32(u, ID_MMFR4, HPDS, 1); /* AA32HPD */
-        u = FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
-        u = FIELD_DP32(u, ID_MMFR4, CNP, 1); /* TTCNP */
-        u = FIELD_DP32(u, ID_MMFR4, XNX, 1); /* TTS2UXN */
-        cpu->isar.id_mmfr4 = u;
+    u = cpu->isar.id_pfr2;
+    u = FIELD_DP32(u, ID_PFR2, SSBS, 1);
+    cpu->isar.id_pfr2 = u;
 
-        t = cpu->isar.id_aa64dfr0;
-        t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
-        cpu->isar.id_aa64dfr0 = t;
+    u = cpu->isar.id_mmfr3;
+    u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
+    cpu->isar.id_mmfr3 = u;
 
-        u = cpu->isar.id_dfr0;
-        u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
-        cpu->isar.id_dfr0 = u;
+    u = cpu->isar.id_mmfr4;
+    u = FIELD_DP32(u, ID_MMFR4, HPDS, 1); /* AA32HPD */
+    u = FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
+    u = FIELD_DP32(u, ID_MMFR4, CNP, 1); /* TTCNP */
+    u = FIELD_DP32(u, ID_MMFR4, XNX, 1); /* TTS2UXN */
+    cpu->isar.id_mmfr4 = u;
 
-        u = cpu->isar.mvfr1;
-        u = FIELD_DP32(u, MVFR1, FPHP, 3);      /* v8.2-FP16 */
-        u = FIELD_DP32(u, MVFR1, SIMDHP, 2);    /* v8.2-FP16 */
-        cpu->isar.mvfr1 = u;
+    t = cpu->isar.id_aa64dfr0;
+    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
+    cpu->isar.id_aa64dfr0 = t;
+
+    u = cpu->isar.id_dfr0;
+    u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = u;
+
+    u = cpu->isar.mvfr1;
+    u = FIELD_DP32(u, MVFR1, FPHP, 3);      /* v8.2-FP16 */
+    u = FIELD_DP32(u, MVFR1, SIMDHP, 2);    /* v8.2-FP16 */
+    cpu->isar.mvfr1 = u;
 
 #ifdef CONFIG_USER_ONLY
-        /* For usermode -cpu max we can use a larger and more efficient DCZ
-         * blocksize since we don't have to follow what the hardware does.
-         */
-        cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
-        cpu->dcz_blocksize = 7; /*  512 bytes */
+    /*
+     * For usermode -cpu max we can use a larger and more efficient DCZ
+     * blocksize since we don't have to follow what the hardware does.
+     */
+    cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
+    cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
 
-        bitmap_fill(cpu->sve_vq_supported, ARM_MAX_VQ);
-    }
+    bitmap_fill(cpu->sve_vq_supported, ARM_MAX_VQ);
 
     aarch64_add_pauth_properties(obj);
     aarch64_add_sve_properties(obj);
-- 
2.25.1


