Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668B9606BA1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:52:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleOn-0007WX-AU
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:52:25 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ole9o-0006z6-1Q
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9X-0006J3-M4
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:36:41 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9V-0000zh-DZ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:36:38 -0400
Received: by mail-pf1-x42d.google.com with SMTP id h13so857772pfr.7
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwpoipf+qBrSAl33zLnSt6wN4K7EGIfNiIUVkyXEfCo=;
 b=Lmicci696IKMBvZgx93J+hVCqmL79oGx8gUoSuqD9GiOmb+XlY/b6MirgLdk079ec4
 o7M11FedTnKDIOCeDn35vIOa0aiuNYPsEgPUbK3gGwVKSRrzPb0ldgp3KkdEiV17r/HQ
 6ILqAIkWG4+vVZpxhgkLQkWy08oL06ANSCOhtywO77zy0+ZnBocAJb0U07KFhtJVlWMv
 wKqEKG4frpSubqcToPDzmNQeyCS24bS67u0qXOT6qgAb+iCzcjEVzgpF/pgu5OjtF/kL
 oyMMfoy3VXnDugcqxYfvL0jReopF5ltOaq0Hz5Dp8ep5WAzM/5AqGDNJ9xnrTo2osf1r
 y4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwpoipf+qBrSAl33zLnSt6wN4K7EGIfNiIUVkyXEfCo=;
 b=yeT+jC2rWWNTHe8fY0G7HRJKqyorT9xiwlIDPdKHN99Ey2WUfeqhDzBVeRm737O3+6
 5DyCagmE1E1DhMiI8zjwtC/3Sna4cbATfzx+86+AyRG1QH4qvPJXghfMO6OxuEP7ZnYX
 3jT6UZVf/dz46F1J2JfzdeALFQh+QVRVzcRhs8F7SNh6CBAa9FX+V1olFemPwAPlrgjF
 SoJRqbCokgn8Cu3Ho0oGWuiENWzoPL6E4U75GYqi8C8tOwxxbyCRanKCnWLnps9VUB5L
 5oPr0sKg6Fi7Y9H0OxGf7/+GR3CvnIijXnq0+lyCIzJnpIAvAFwPy/V15utFPUn/JFdr
 vhCg==
X-Gm-Message-State: ACrzQf1Ln3iDgGUJFc96GPuYwbuDL/C7WlFHZ9Z2MpdKsCmHakGhAo/7
 JsxvRRplPIQ66TrriMP5z7FSnwPy8p3cRg+l
X-Google-Smtp-Source: AMsMyM7353x8NkAH1XLrYIEcp/NAFHHK71a0d0ohQUAguWum15GKbyID1u/WLuqCgsA/y+NpdmOVtA==
X-Received: by 2002:a62:144b:0:b0:562:38de:9a0e with SMTP id
 72-20020a62144b000000b0056238de9a0emr16192773pfu.78.1666305395559; 
 Thu, 20 Oct 2022 15:36:35 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:36:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 03/14] target/arm: Add isar predicates for FEAT_HAFDBS
Date: Fri, 21 Oct 2022 08:35:37 +1000
Message-Id: <20221020223548.2310496-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The MMFR1 field may indicate support for hardware update of
access flag alone, or access flag and dirty bit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 64fc03214c..0eeb4abe53 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4139,6 +4139,16 @@ static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
 }
 
+static inline bool isar_feature_aa64_hafs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) != 0;
+}
+
+static inline bool isar_feature_aa64_hdbs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) >= 2;
+}
+
 static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
-- 
2.34.1


