Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FE253C0BD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:21:24 +0200 (CEST)
Received: from localhost ([::1]:60040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtBz-0003es-Kc
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgv-0004oK-Au
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:17 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgt-000059-9T
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:17 -0400
Received: by mail-pf1-x42f.google.com with SMTP id bo5so5798726pfb.4
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X6UniaTwDbuA5UKJMjAhDBE/HQvImNJGoq3x6BiPqWc=;
 b=YtN47zOi6GR70z+u5XEwOInZdwUc+wonASgIGlrm8JbWLaUltBuSuqeC0uXCsNGSLO
 lDYGcFJ1AseqmYJKz5xZnI47fzK/t4O0C2k5fRs7G9eV2Yml+Ldmpsizz7lP0KjqOghQ
 5uC4oTm5o078blBIRBMyPM+TFumYQp1qirSHmH0yakAEzMaQMpQ6JhtkBLoYQR9rPvgS
 6Xa65U7JraT1XE1thgyD62gR6PUgaGgwMXT3n/GeX7MovkEgceKC36HVJUtJmWhHlrfe
 2MguEOC0BzWuAzxxp5U4/RiTrGyGfVdqvMbLy6wcFN41YT2qCNDVRBrtkrUHExGaK78k
 kSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X6UniaTwDbuA5UKJMjAhDBE/HQvImNJGoq3x6BiPqWc=;
 b=aUcmCNT6qth78upMJxRMb7gIBzdGcKLO2PReykg33HR52W0e7AqXRWjzB9g1k4zIUL
 9pcHDUmGDDWAAqIQA2/jI1+aCaaCZWx64moATdNooxPvMWELZxTtlePyaRPAQ4dJxs2V
 C4hbvRnmHVZB66seVTGwlbDtQsDqV7rXHjfEX56W3y3DPlpNY3IPBlSSHETYl5tTtbK4
 cjNrTLJUelYcjF9XZPNrU7IGxHSuFshKniPYGiu/ng/KF026YY1OwXPIAUQMVcKti7Qm
 iGGkLN9TTXLHWNO/HfcTnaLDxnM0c/yh/5e3WF1kT59OW9b46Y/3HRPL4mGt6whgwSdQ
 Gb7w==
X-Gm-Message-State: AOAM530qBzgoPDxQSdNDrh7p8tDGeoFC60g1H46Q4RArYlrr0c2bygH2
 76WOGwBcaviskehNwyWnV80vKTPd3V/YNQ==
X-Google-Smtp-Source: ABdhPJxqWDENGl0TuEJhBEZmCJ2D2CnuNJdeKz84AM7E3aUjKx68M/hIGurqWSaumdYutXR2UajOsQ==
X-Received: by 2002:a63:ce58:0:b0:3fc:6966:b614 with SMTP id
 r24-20020a63ce58000000b003fc6966b614mr6095175pgi.234.1654206554509; 
 Thu, 02 Jun 2022 14:49:14 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 23/71] target/arm: Add syn_smetrap
Date: Thu,  2 Jun 2022 14:48:05 -0700
Message-Id: <20220602214853.496211-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

This will be used for raising various traps for SME.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 0cb26dde7d..4792df0f0f 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -48,6 +48,7 @@ enum arm_exception_class {
     EC_AA64_SMC               = 0x17,
     EC_SYSTEMREGISTERTRAP     = 0x18,
     EC_SVEACCESSTRAP          = 0x19,
+    EC_SMETRAP                = 0x1d,
     EC_INSNABORT              = 0x20,
     EC_INSNABORT_SAME_EL      = 0x21,
     EC_PCALIGNMENT            = 0x22,
@@ -68,6 +69,13 @@ enum arm_exception_class {
     EC_AA64_BKPT              = 0x3c,
 };
 
+typedef enum {
+    SME_ET_AccessTrap,
+    SME_ET_Streaming,
+    SME_ET_NotStreaming,
+    SME_ET_InactiveZA,
+} SMEExceptionType;
+
 #define ARM_EL_EC_SHIFT 26
 #define ARM_EL_IL_SHIFT 25
 #define ARM_EL_ISV_SHIFT 24
@@ -206,6 +214,11 @@ static inline uint32_t syn_sve_access_trap(void)
     return EC_SVEACCESSTRAP << ARM_EL_EC_SHIFT;
 }
 
+static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
+{
+    return (EC_SMETRAP << ARM_EL_EC_SHIFT) | (!is_16bit * ARM_EL_IL) | etype;
+}
+
 static inline uint32_t syn_pactrap(void)
 {
     return EC_PACTRAP << ARM_EL_EC_SHIFT;
-- 
2.34.1


