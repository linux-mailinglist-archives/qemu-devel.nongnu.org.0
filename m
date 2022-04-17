Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F66750490D
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:52:37 +0200 (CEST)
Received: from localhost ([::1]:45030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngA0h-0007aM-Vu
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90V-0004ix-Uj
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:20 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:41896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90U-00045w-71
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:19 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 e8-20020a17090a118800b001cb13402ea2so12268554pja.0
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DoRumaxtRe3qsin4W3djn/6A+2lT9q58rZZ6KjoMUec=;
 b=jmlC4sOqvOtfOzkh6swWRWx8MeweAKGvhFO4hOjhRwDyYr4nlxBTYFGudoMQyO6zCQ
 GjRIxl5kH+SNWL4B2fPPgh0Z8JGwCL9PdjbFy5evEOL4ByzNH1Yx2T1DFdsJlqVwpKVR
 UfhcTMs1HZ6MWJ8jT0xNL5D8uKv+FK7f2VbZwUmVmrv4kmIa4/7kB3GwlVRFaGccgcQW
 4M4zU9xZwkS8yMB4sQ/QgAnhGSl6e7gqF+cnhj3Rbp2Wb3juuJJxtar1SkhBAEbkgdyM
 1M3azCIR4m0x8Uz3tDYyvoFRXWVBF/MXEZD53ljpPK9xahQNrHLsp/hT+W/LsRRnkj1O
 wlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DoRumaxtRe3qsin4W3djn/6A+2lT9q58rZZ6KjoMUec=;
 b=pieT3mhiKDcXlsx/L+EUgNYCDHvj++QgJhDA3PVPzRngkBkgza+7/IMDZJ2jc862RK
 htyIdCBqi5imzvRX1kajYDqFzFws6zIav2FsdHPsGXgQTnOzn7fAhIvNeVImCsGySdAc
 1Pu40G0VguxjwaOxuxmJ1vIAS4+9jD44lyZHlTMyD4rV65CztnC96kZ/36e3KPTF61DW
 7po6pOn8WnT5KlSStR/l1DkOvUIKbb3EtP58xbqxtj22sN6aKwexNablbl6QsxmO7rTW
 8ynlzfueH5DElKCTunUZ0YNIKes6t4io7uDbVNiBLPOLbFwWB8Bhs1tUWc54ruQUczW2
 rQoQ==
X-Gm-Message-State: AOAM532WBm32okQPaxSvLGDHJCun8Mx+MbSPT4oixo/hX+L45GCAAnCV
 FTV4aSpHYBGWAk91d72bXU+uFSpHdn7xSA==
X-Google-Smtp-Source: ABdhPJwIV27XMrPEilKMRIAvCsXx4CPYmK1lhUp3dQvumb5j0frpFTQz5ErhdRR+HDZnUsCf8qa6Tg==
X-Received: by 2002:a17:90b:3806:b0:1d2:6e95:f5cc with SMTP id
 mq6-20020a17090b380600b001d26e95f5ccmr6507650pjb.23.1650217696971; 
 Sun, 17 Apr 2022 10:48:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 54/60] target/arm: Enable FEAT_IESB for -cpu max
Date: Sun, 17 Apr 2022 10:44:20 -0700
Message-Id: <20220417174426.711829-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This feature is AArch64 only, and applies to physical SErrors,
which QEMU does not implement, thus the feature is a nop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 35b6f7d4de..ebd9e418cc 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -24,6 +24,7 @@ the following architecture extensions:
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
+- FEAT_IESB (Implicit error synchronization event)
 - FEAT_JSCVT (JavaScript conversion instructions)
 - FEAT_LOR (Limited ordering regions)
 - FEAT_LPA (Large Physical Address space)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 72fe7885f0..03fbb34e4e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -781,6 +781,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64mmfr2;
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
+    t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
     cpu->isar.id_aa64mmfr2 = t;
-- 
2.25.1


