Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4396767ECE6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:58:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSxD-00018V-Uf; Fri, 27 Jan 2023 12:55:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSx1-0000xc-Uc
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:48 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwo-00066b-SC
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:47 -0500
Received: by mail-wr1-x434.google.com with SMTP id r2so5666122wrv.7
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zdjx41xGEJWHuXAOMwfC1PKZLRxR5ZaPbQIwstZaQaA=;
 b=sK5xPSca5wFXODqoHTHNvMNPmQi7vO29knbgLsugNHWpgkwkG0KLdAr8LNSnnftd1T
 xt9zbRi8eP61dfFf3icjRVw9EBuWtrn/L2UXLXvj7IEhLF5NAwrzkAu0oLddc46RGH1b
 NjyQFxRI5ii/ymtzEsQYW6m6ZpyBVI5gBr/hWYWilKOKsqMNYoewYsghzebLwswcsA/D
 sscBFnYmsWvUGL33cv3O5JX/wQZxykEtDcM3DSiJ8Cjje3vTuJuc13BK3WqJlcSMWW/s
 BD/9zTYWe0D15NAr7EJrQSUGYtUXHVAhcwpaRFWQbW7Kd/PuCULqaPyDk5QioLJdXxzX
 CumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zdjx41xGEJWHuXAOMwfC1PKZLRxR5ZaPbQIwstZaQaA=;
 b=5VDtiEttnna2TDt4TX8iyi2CFmh98PwJk4RXbIgIfILqgpIUBjdIMe8agfcweJxqO5
 Nbz1JWK5WlNpmHyliOAOF44AbIuEtWk8si39rNVc16Bf/8zWpczgU+S0VwOq4yAWcUH7
 vt+5+e2jF9Qa7//dVBceFZIyzS6ZvjaIyRbdPRu0KOonwa0o2LeZ5SStBqgKfRIjax7a
 qire1/LV4WkCUEdmny6ZTYmXzmtH+VGDGZaYqO+hVSaaLHLNAUME0L9mYN/wkYyZzDW3
 3q4sus8efVI2vgbTiTIkH3Nyg3azO/S1QLg0mmKwcxspowHncVIVV+zb4TfAueYTonCj
 yf+g==
X-Gm-Message-State: AO0yUKVBcsLe8kTAtXES6avBTGQsj5u/mRjEjPqvcsXsNO2Xg875dxU6
 rVcay9MGCvJ/NyfGfWeLD7BH5OnN5jYHEgm0
X-Google-Smtp-Source: AK7set/9OdvGck6N9HpjlYrtEk9L5S3F2xT6eYfQaCTimZH4HwHFf6LyLmi4fmJi300YUzcnEm6WpA==
X-Received: by 2002:adf:b101:0:b0:2bf:bf27:2dd2 with SMTP id
 l1-20020adfb101000000b002bfbf272dd2mr7649087wra.45.1674842133664; 
 Fri, 27 Jan 2023 09:55:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 23/23] target/arm: Enable FEAT_FGT on '-cpu max'
Date: Fri, 27 Jan 2023 17:55:07 +0000
Message-Id: <20230127175507.2895013-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Update the ID registers for TCG's '-cpu max' to report the
presence of FEAT_FGT Fine-Grained Traps support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b33d7c28dc1..c76555f51a7 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -28,6 +28,7 @@ the following architecture extensions:
 - FEAT_ETS (Enhanced Translation Synchronization)
 - FEAT_EVT (Enhanced Virtualization Traps)
 - FEAT_FCMA (Floating-point complex number instructions)
+- FEAT_FGT (Fine-Grained Traps)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
 - FEAT_FP16 (Half-precision floating-point data processing)
 - FEAT_FRINTTS (Floating-point to integer instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0e021960fb5..4066950da15 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1224,6 +1224,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 2); /* 16k stage2 supported */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, FGT, 1);       /* FEAT_FGT */
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
-- 
2.34.1


