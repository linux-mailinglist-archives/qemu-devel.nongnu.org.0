Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CE94FA09E
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 02:22:05 +0200 (CEST)
Received: from localhost ([::1]:34306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncyrc-0005t6-Hg
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 20:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydv-0008Se-Pb
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:55 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydu-0003Tx-4b
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:55 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 ms15-20020a17090b234f00b001cb61350f05so651398pjb.5
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SSn6XnYEyRgUaQ5RFjGEN5zTQZu0eCBb7h/2LLfdbHk=;
 b=KuWG4ENa+In6mc7edeh+l6ChPSrqCT3X2p5wtlGpgLd6EokE6ecXXbVFYdJTdcWrjN
 7IA2GBJZ/D/gMaW48MQjfeGSe4QI2J+HqIBMDeUHlVzCqB61csMz5Xj1XpVhuKLc+OLS
 wNWMA6SCNTh3jQ3D2Y8F+7nWn1SRKdYXVP16x/0Avj4Gt67ACvAO/7xQm3nY1ZyPDWnM
 AwF3SorI8QEMvqTleZaIIy8e+UPhOAK2uERRQTyTbtYAY9JZ83TPi30REI9oY3d8IdSB
 21me4PDeQ/3VofzyDfSazfW2HwGIpNlmr16a+lFkQ+9HXTvSTHAQF0cFutlbWZ+tLvO7
 9T8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SSn6XnYEyRgUaQ5RFjGEN5zTQZu0eCBb7h/2LLfdbHk=;
 b=EnlXi4YEw1DVv2wJcbVAK4gZyaFR1VUon4EdNztUCl+wPmimQMLVWpFfzQWyQRYBvD
 xBJa8SBhj6+FUuQyos6K0VJ0O377qw0uAPLv+FS6oHZ5N4yi8/N1S1ohra4BplT3SC0i
 hyqpj4+4pBsikYGM52/Q9uq8dJZXE8WjJnlJAr27qmlNfEW0jsn7AZF1pbmgORgqv3se
 I5yvCgrY7CszTGJel31rEy6FBdCIF8wT7Lx1NCp0XRIcgnVASKtb5oj7Qs6Y0CrtGqML
 fuoAZF8ckH3+N1O+SNuwS/crQ67YYzq00t94EVuc7kR4hguk24qtzaQyE7IznNftWAie
 jiWw==
X-Gm-Message-State: AOAM531UPdWPIH8MzCVAnTa3zbMeJeE3RQymNtlRb6NXQJrw/dd5l/4x
 TWm71d6yuCTd/h0BUViVHbDmG7CLsugM8Q==
X-Google-Smtp-Source: ABdhPJxmrbVWaN1hLhe1DpEawelMr4uX3y5SKeTv57Sq42091GyIxJJGFm3ikJ0G4KHnFVBPJjMPtQ==
X-Received: by 2002:a17:902:f545:b0:156:b8ae:d4c with SMTP id
 h5-20020a170902f54500b00156b8ae0d4cmr21532619plf.171.1649462872744; 
 Fri, 08 Apr 2022 17:07:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/16] target/arm: Add isar_feature_{aa64,any}_ras
Date: Fri,  8 Apr 2022 17:07:36 -0700
Message-Id: <20220409000742.293691-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the aa64 predicate for detecting RAS support from id registers.
We already have the aa32 version from the M-profile work.
Add the 'any' predicate for testing both aa64 and aa32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9c456ff23a..890001f26b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4208,6 +4208,11 @@ static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >= 2;
 }
 
+static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) != 0;
+}
+
 static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
@@ -4430,6 +4435,11 @@ static inline bool isar_feature_any_debugv8p2(const ARMISARegisters *id)
     return isar_feature_aa64_debugv8p2(id) || isar_feature_aa32_debugv8p2(id);
 }
 
+static inline bool isar_feature_any_ras(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_ras(id) || isar_feature_aa32_ras(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
-- 
2.25.1


