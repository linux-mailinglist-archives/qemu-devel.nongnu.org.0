Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59C569ECED
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:37:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUexX-0007jo-Mn; Tue, 21 Feb 2023 21:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexU-0007hU-1Z
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:34:16 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexS-0001kY-Ep
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:34:15 -0500
Received: by mail-pj1-x1041.google.com with SMTP id
 i1-20020a17090ad34100b00234463de251so6994226pjx.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Ut/aS2oezKic9UZ9DAK+e9x8VNxmPUkA0viJdZ3AGc=;
 b=D/KwGTISZqqO7gR78XhTb4eOCbAoyguUE3dZK/gmYFTyFmSaupf90u95syivnLb8Qa
 i7+I1UIujJRs0ruYu5ovbgPTXGU4WPDBp7hRxO8AbRhXoWJliZmpt75ZgXtc1z6vm93J
 ouhqxE7VVpbzc9Xdbjpc8Aj/KNgWx8hKUWW8sn0J+vzbGpe2pUDR6eWGOC8N5/wYfTjr
 6v5VLNvSpHhfPhXvo02DsWLUwkrt+AU1Q+/+Y9ChSI/JbWu/sSJzM3U7hpjOqBAcGWLl
 DcrrH3+UB3EQTCKmOM3CfvshNWGraEQv/7+7F89z3kzjhn8zqZHHE1LtCmhwslGmhZHF
 LceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Ut/aS2oezKic9UZ9DAK+e9x8VNxmPUkA0viJdZ3AGc=;
 b=NyhDfbPx3UoploZLgGoC4JOrUbWgWK96VFErsxU714ki1LOVgZ7YtMPObMLDpOFuok
 UZ25h15fAV5j2xCCiFjQ0wsfT1C2OmGw4Stw7JdqbzMaXtVgh2qsOPcxfsZfVtjOGYUL
 JotGRWL2X7EFHVuOyaJz2iquLqipForvmkrWqS0AvoQnC7ZHopm5AzSwsEtO7ppw9jek
 UX9q8G18OXMNaj+Exmkwi4+164xtKJ0UTWbnNC0z+2pSOg7iAymWH/xaRE1khJXm3hX3
 pvnMG6tWoZer4io0160S6+TnLngdYLVfh7BLpQQJRkeX546wsM5uOhqZ63C1blxpH7aL
 +fIw==
X-Gm-Message-State: AO0yUKVww8wx31M48Cj12KhuxPaT2oTjam0ZC85UzZXBYBfqlOHO1WXq
 a1IQFDq2+QMkMYLJj2VufO4WJGqdUsHtHRNoFuNplw==
X-Google-Smtp-Source: AK7set/LySYPepSWuVWPiPC+SEXU2BgDfjX+naD3k+zGNP47vu7m2dwqOevAbTJAIIaas74H1RUiCQ==
X-Received: by 2002:a17:902:e545:b0:198:ec2c:d4e6 with SMTP id
 n5-20020a170902e54500b00198ec2cd4e6mr9378851plf.38.1677033252978; 
 Tue, 21 Feb 2023 18:34:12 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:34:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH NOTFORMERGE v3 24/25] target/arm: Enable RME for -cpu max
Date: Tue, 21 Feb 2023 16:33:35 -1000
Message-Id: <20230222023336.915045-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add a cpu property to set GPCCR_EL3.L0GPTSZ, for testing
various possible configurations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4066950da1..70c173ee3d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -672,6 +672,40 @@ void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
     cpu->isar.id_aa64mmfr0 = t;
 }
 
+static void cpu_max_set_l0gptsz(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t value;
+
+    if (!visit_type_uint32(v, name, &value, errp)) {
+        return;
+    }
+
+    /* Encode the value for the GPCCR_EL3 field. */
+    switch (value) {
+    case 30:
+    case 34:
+    case 36:
+    case 39:
+        cpu->reset_l0gptsz = value - 30;
+        break;
+    default:
+        error_setg(errp, "invalid value for l0gptsz");
+        error_append_hint(errp, "valid values are 30, 34, 36, 39\n");
+        break;
+    }
+}
+
+static void cpu_max_get_l0gptsz(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t value = cpu->reset_l0gptsz + 30;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
 static void aarch64_a57_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1200,6 +1234,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
+    t = FIELD_DP64(t, ID_AA64PFR0, RME, 1);       /* FEAT_RME */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
     cpu->isar.id_aa64pfr0 = t;
@@ -1301,6 +1336,8 @@ static void aarch64_max_initfn(Object *obj)
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL);
     qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
+    object_property_add(obj, "l0gptsz", "uint32", cpu_max_get_l0gptsz,
+                        cpu_max_set_l0gptsz, NULL, NULL);
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
-- 
2.34.1


