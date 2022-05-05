Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC4851BC33
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:32:21 +0200 (CEST)
Received: from localhost ([::1]:59550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXqO-0004DI-QM
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWt-0005K8-L2
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:11 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWs-0003Or-67
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:11 -0400
Received: by mail-wr1-x435.google.com with SMTP id c11so5216773wrn.8
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MaOeIv9GLNgP2YG/4viwRCAyaqZ3Xrc2Hu8qyXGGVPc=;
 b=cyLsUlB/lTC2YTqEFR6ZfBiOAJT0eVmAX0FLPuRSoqJCiH7GevEE7vgiOYqpbqSk2c
 DfPbHmRoX3Kglj4DTe/iD+XQ8IcU0rxpXYSC35/vUTfaeX5FxBNzdkFQ913a5YI808ss
 HiTbW/VW/UYuepH0tzjji5Iyfq3HMRZeXHHrBBIYvePDedKh68Qj4Iz1s+Nw0+m7WgIX
 DOywbmel2N2hS1VBf8SmGB6X/6RZB9AXv4MHD2FVruqWubn9vspJGmVEcaqJE/a/INB9
 a91RKK8VTNYAus/BUe+zxV5+4kl6DHKLO2x9y4t+CDZM+Sh5Gp4j4wf/d6qtYG5dikw8
 Tqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MaOeIv9GLNgP2YG/4viwRCAyaqZ3Xrc2Hu8qyXGGVPc=;
 b=A465MJGAbelNOwexnRE7/CTmzdlP0rC5A8BOeAamuo3u3XHN13uiOpNzXmGFjG5Gpn
 wWX3mnOKuvnPFX8V8pjt/HFn7nNsae3guinMd5Bf1GC3Bw8QBuA65ACNkJSxKDKt7G+M
 csB+zqg/hJNccjqTJCjRYvW3RnEstPAJxX07n/SdRA9Nzny4XwaEGewzKCUBCyVat+jn
 F9gbLmqY1Xswf/8TbOXdXCsrim3v/6W6f+ryuUS918NMBpykeb1tnygbNh6+3aYa4h6c
 3FvGCtiR79ElANlL9iv9nm4y3rRSFBtmSmnIc0dcLouWjqAoRsRLjwpFrBSLqoG39Yy1
 cVTA==
X-Gm-Message-State: AOAM533hfhecT4YsU1mZgzKmaw83US5JyLQNVnz6ZJBOc9klSdLVDNTq
 OlHZjxpm/dXN/ssA5SSLzk3VDD/eAuQNLg==
X-Google-Smtp-Source: ABdhPJymPFLlq/0SARUEVNGTvu3pvajNJq5/kqerzJulFT7VwBAkPnG1unmSxBC1HcNp99/Mmoat9A==
X-Received: by 2002:a5d:4f8b:0:b0:20c:6970:fb3c with SMTP id
 d11-20020a5d4f8b000000b0020c6970fb3cmr12688387wru.554.1651741928760; 
 Thu, 05 May 2022 02:12:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.12.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:12:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/23] target/arm: Add isar predicates for FEAT_Debugv8p2
Date: Thu,  5 May 2022 10:11:45 +0100
Message-Id: <20220505091147.2657652-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220501055028.646596-24-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d1b558385ce..7303103016f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3704,6 +3704,11 @@ static inline bool isar_feature_aa32_ssbs(const ARMISARegisters *id)
     return FIELD_EX32(id->id_pfr2, ID_PFR2, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa32_debugv8p2(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_dfr0, ID_DFR0, COPDBG) >= 8;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
@@ -4010,6 +4015,11 @@ static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa64_debugv8p2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, DEBUGVER) >= 8;
+}
+
 static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
@@ -4093,6 +4103,11 @@ static inline bool isar_feature_any_tts2uxn(const ARMISARegisters *id)
     return isar_feature_aa64_tts2uxn(id) || isar_feature_aa32_tts2uxn(id);
 }
 
+static inline bool isar_feature_any_debugv8p2(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_debugv8p2(id) || isar_feature_aa32_debugv8p2(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
-- 
2.25.1


