Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E61B4C1EAF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:37:18 +0100 (CET)
Received: from localhost ([::1]:42980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0G5-0006on-9d
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:37:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0Al-0006TP-Pz
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:47 -0500
Received: from [2607:f8b0:4864:20::1032] (port=41617
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0Ai-0001C4-Oh
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:47 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so387082pjb.0
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E1rlJYYazfRdVeynNKa6RTb/vpD+L0sCNF3QpW/Zvp8=;
 b=Jb8iHIsIPgJb0kC0LfCP9SJnJck4aqWMbmw/XpGeid3EnFq4BbyLek50qTwCz4jzsL
 MbLEYLA9kl71q2MqYL45ut7A977P1YFzlla+viEkLLGv53epD6EbGxqsR5YlLaOzc5Y0
 2aiQAkjaUCgPaCIW/GMSfoI4py9OvHalkO2IQbrfzYd8jyGH4/qeXzLb4wlJSBkcIwhX
 s3HY8pubrIuFbaKlMonhNG7e+5DB0eClggee4SrKDdIkXjlLJLpshZj2CvwLMJQ1YcU1
 yMv4tTvk90wGhhqvx7765UA1NM1EF3NPU4qRSP2hw6E2eeDUQtDQiGdGY3xvCEYAd20+
 XTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E1rlJYYazfRdVeynNKa6RTb/vpD+L0sCNF3QpW/Zvp8=;
 b=SFPp39gXT5OS/GtkTtX/0JsqRXr8QuQfwosv+E3neg6NBl9flsnP5npNim4b+97Mhi
 u6hQEbIaH/Sr5acALBoFVKkLKxTX2QlsO33whx+5wVbqeHg2CgRdyGHIutvHC3rf8SyC
 rSxILgAm4ne+f3pvx4TpyXiY5Y7XwniI8Mqdaw01IffZYac0Z+UQXibpA+XDj8gwMauA
 Tmnx3sJ2yT/6Gx+Wbr6J4j4AyUIYa161RieKKodBdMzwPpCNxWaaYnmY3bWtNudl2WgH
 f4UngNooIVj3C+fFge+ZxQqkmeB2w5Ne8Mz0qN/yuzAw2h5g1wvrrWc/rT+bdtdT8HpM
 Z/wg==
X-Gm-Message-State: AOAM531CK4DtQeUgtGagmnBWLMVuKSYD5RvNHrMJ3nl5tABTAb+aVE93
 4SoKk9Wr+HkoSQos6SuvihdRP6X5EZaaWw==
X-Google-Smtp-Source: ABdhPJyQT2mwJELw7spYq2ce9Y8IPCO1lNtgttw5A6uBgkG+gRYRwzkvrSpqwV+7z/E3M3nuHZv17w==
X-Received: by 2002:a17:903:11cc:b0:14d:a0d5:76f with SMTP id
 q12-20020a17090311cc00b0014da0d5076fmr1687482plh.109.1645655503471; 
 Wed, 23 Feb 2022 14:31:43 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:31:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/17] target/arm: Set TCR_EL1.TSZ for user-only
Date: Wed, 23 Feb 2022 12:31:22 -1000
Message-Id: <20220223223137.114264-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set this as the kernel would, to 48 bits, to keep the computation
of the address space correct for PAuth.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c085dc10ee..e251f0df4b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -206,10 +206,11 @@ static void arm_cpu_reset(DeviceState *dev)
                 aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
         }
         /*
+         * Enable 48-bit address space (TODO: take reserved_va into account).
          * Enable TBI0 but not TBI1.
          * Note that this must match useronly_clean_ptr.
          */
-        env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
+        env->cp15.tcr_el[1].raw_tcr = 5 | (1ULL << 37);
 
         /* Enable MTE */
         if (cpu_isar_feature(aa64_mte, cpu)) {
-- 
2.25.1


