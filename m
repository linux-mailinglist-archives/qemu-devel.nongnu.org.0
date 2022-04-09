Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856F24FA07B
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 02:13:55 +0200 (CEST)
Received: from localhost ([::1]:44720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncyji-0001sr-KS
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 20:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncye1-00005g-50
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:08:01 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:33346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydz-0003Vp-O0
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:08:00 -0400
Received: by mail-pg1-x532.google.com with SMTP id k14so9132559pga.0
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e+gf4njBlT4aculnG55HysMJzlBG+wUfm2aGsCO3sRk=;
 b=zqS+U8QkUzgNwKxjFsjN6LoAxPPFoVnxUIRUOF/cV3VLDTShiR5ODafF83uydhHuiD
 MBkJnIURFf1eh+ELCQWRPCXfUviOSEmlRoU8FvcKgaMNECKgeIWQ9xYVaVQUt1oOQ+TW
 f/9wulUGrZRWZmHJSBSUX8r6yfhEKEjLqo3LsipQxkPpZo5emmZt+d+M4GbKO36M7Hz0
 HhXstYx2XzPinK+9k8zkKOdKBBnxXPYmSEawy/UVa0GmYHofzus2rrHP6TlBB5WkxJHR
 bjMm8JqwZQ6Q/K4bwtO3ePIE4R7KmppJWw2KSl76qC9WckvprB1IDEc7r2WJqUMB0utP
 E5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e+gf4njBlT4aculnG55HysMJzlBG+wUfm2aGsCO3sRk=;
 b=FneiHTxMS4UAgN3UgdIweH6pyyKJko5VhnA5Ij7J6D0rh2dNwrvpLLcZZ3Dl1HMORw
 zTKxBIi5ZSOWKBAgMveChJlBa9IXrL/Xm8+meYPHfWLhbMF10272a9kXgAp71Ev1Ev/o
 W309SsjzohSAC1qcfQf9QQniqCcZ+TwlTKw0M8zp+ivV2vXbeJgD2gQ8U0C5zob+B3xx
 XmQPMzqO3aSsfc9ctVsPh3ELdGhXW5KWSjRA7hHE2pyJpucmOvWXaUDDiDdacdrQnEP3
 s37pqG8Trc8YNcuao46Rr+vfmC3TyJwcNrqkrCx3sz0QVWOi8ClZlic3OMH2C5WDpIx0
 Zv9w==
X-Gm-Message-State: AOAM533AV2AKsmWtXQrkg6XhVCuZk1oX9yB/AtElmnJDUk1GZOe9W3Vp
 PB4hHUBo8NnMsXVtmdPowWIznp7MckpUtA==
X-Google-Smtp-Source: ABdhPJyzTLizXy21DCdvKVzZkIOR1P09Pwkma8pWP3C0kJ2nfH/8Z4P1wcMqmcFicuEcAcWidod1xg==
X-Received: by 2002:a63:6e0b:0:b0:397:f965:64a7 with SMTP id
 j11-20020a636e0b000000b00397f96564a7mr17399056pgc.581.1649462877460; 
 Fri, 08 Apr 2022 17:07:57 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/16] target/arm: Enable FEAT_RAS for -cpu max
Date: Fri,  8 Apr 2022 17:07:41 -0700
Message-Id: <20220409000742.293691-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c   | 1 +
 target/arm/cpu_tcg.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f20fb6d9e1..03c6707111 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -801,6 +801,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64pfr0;
     t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
+    t = FIELD_DP64(t, ID_AA64PFR0, RAS, 1);       /* FEAT_RAS */
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index a443e8c48a..5cce9116d0 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -72,6 +72,7 @@ void arm32_max_features(ARMCPU *cpu)
 
     t = cpu->isar.id_pfr0;
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
+    t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
-- 
2.25.1


