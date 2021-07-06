Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EE83BE002
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:03:05 +0200 (CEST)
Received: from localhost ([::1]:50470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0v1s-0003ys-Ak
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up6-0001Kb-CF
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:52 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:41684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uoz-0006dx-DD
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:52 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 oj10-20020a17090b4d8ab0290172f77377ebso507980pjb.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uYCxAUoRWyRn/9euH4vCsN2ms/pTKei5OwvPABaSm8o=;
 b=Q8w551VA/ZasYQxd8/aaaxJx19ojVZdG2AMt5TU2qrs0u2VyYWY2q3hLbs1454pO5C
 Ut1NW76rbF2EKQ8FYJM2pCf4725Uz20UoUM3wOXS9cVoTjcBzDjV72rXYvR3mvkeafGH
 e0EOAU57YP0oDYvbu6SxZPpkDb+7lxXOfMGUOnmiO0/qllZYm6JIayWnoA+Ac8VBK8LG
 pXPIeGIV0QANw2OuIHAnMPsysewTzqDQxeRwLp6faMM64PYgNW6MJ6zmZD6RvcMpAxOt
 qV7aRcCt86+So0LqCl+MEYeEruv+QBDwVVSruu2FaTltEAjusxcO5H5FlZrtNsX7/8WB
 LomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uYCxAUoRWyRn/9euH4vCsN2ms/pTKei5OwvPABaSm8o=;
 b=ML8FLkpinhfKRkQMoBAOg3od5ll00Q7EkB/OO/o8CpfLgH+EarsaNfhRD9u0Luz5Va
 RmLbRIlG25EorFXQROf19UNHfzmBf7Zfao7S5Mpry4bjaoO3fDKrBk+KLNpttU9ecnXs
 4xKSfxDNtNJ8QBnhWeL6PErSvvnycQgqCnU+0q9DKW3aUQtB+rH/tzw6tkynOqbaATTQ
 IBVs2r32rf/BUTTVr8yF+re3vUdgHOSHjZjaFbDkEo3WphzODG9mU0FgERM7jdc3WI1C
 IvaNEUajWGsmKWY+06GBoq62RfkfCXWkB+q93A+A+h22y+Ex/1hHybyuvBZvZ2Npt7lt
 GoKg==
X-Gm-Message-State: AOAM531iSiQN/F0QOcK2f2RDmJwp8OyC6qUbnHj0PRT3vyuFp2MOW2N6
 RO13LwWtazrK7bJKSmplSCcqGdCHv+2gyA==
X-Google-Smtp-Source: ABdhPJzh/oExuiyy2KRjQgE8MmO928qEzS04C6zF9R9ygC3Rr413PnrwzzqRy5Or8lXPkkUfZPwdhg==
X-Received: by 2002:a17:902:e0d4:b029:129:acad:4552 with SMTP id
 e20-20020a170902e0d4b0290129acad4552mr4661349pla.55.1625615383487; 
 Tue, 06 Jul 2021 16:49:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/36] target/arm: Add isar_feature_aa32_a32
Date: Tue,  6 Jul 2021 16:49:11 -0700
Message-Id: <20210706234932.356913-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a probe for whether A32 mode is supported.
Fill in the field for the pre-v5 cpus.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     | 5 +++++
 target/arm/cpu_tcg.c | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index be9a4dceae..33f7ce9bc5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3802,6 +3802,11 @@ static inline bool isar_feature_aa32_i8mm(const ARMISARegisters *id)
     return FIELD_EX32(id->id_isar6, ID_ISAR6, I8MM) != 0;
 }
 
+static inline bool isar_feature_aa32_a32(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_pfr0, ID_PFR0, STATE0) != 0;
+}
+
 static inline bool isar_feature_aa32_ras(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_pfr0, ID_PFR0, RAS) != 0;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index d2d97115ea..980f62f35d 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -73,6 +73,8 @@ static void arm926_initfn(Object *obj)
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSP, 1);
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
+    /* Similarly, we need to set STATE0 for A32 support.  */
+    cpu->isar.id_pfr0 = FIELD_DP32(cpu->isar.id_pfr0, ID_PFR0, STATE0, 1);
 }
 
 static void arm946_initfn(Object *obj)
@@ -86,6 +88,9 @@ static void arm946_initfn(Object *obj)
     cpu->midr = 0x41059461;
     cpu->ctr = 0x0f004006;
     cpu->reset_sctlr = 0x00000078;
+
+    /* We need to set STATE0 for A32 support. */
+    cpu->isar.id_pfr0 = FIELD_DP32(cpu->isar.id_pfr0, ID_PFR0, STATE0, 1);
 }
 
 static void arm1026_initfn(Object *obj)
@@ -115,6 +120,8 @@ static void arm1026_initfn(Object *obj)
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSP, 1);
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
+    /* Similarly, we need to set STATE0 for A32 support.  */
+    cpu->isar.id_pfr0 = FIELD_DP32(cpu->isar.id_pfr0, ID_PFR0, STATE0, 1);
 
     {
         /* The 1026 had an IFAR at c6,c0,0,1 rather than the ARMv6 c6,c0,0,2 */
-- 
2.25.1


