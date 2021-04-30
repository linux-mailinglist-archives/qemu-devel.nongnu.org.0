Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2001370331
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:49:11 +0200 (CEST)
Received: from localhost ([::1]:35514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcb0Z-00067u-1C
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZpA-0006n7-1P
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:33:20 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:35783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZot-0000s6-NZ
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:33:17 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so2392343pjz.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0MbRdnRJn0x9uVTH+qro7/oyKU7eLBQcZeSxN6NVvH4=;
 b=F+SFglPeAJACCHKXIlweuKO6pSv5yG7lT733zNeN4pdwHcJj5R7V860HrPZTh42ZBB
 pSfX+5LyPhGStoSrV75UOTBRoIUjosZwOlEPnaitPaAVKVQ/zDdfgoSli/OD32gkhEKl
 J4tS5paOK/yvcoftJ3pJkhplCI5M07gbvXNoqdVfcnTuTZhvg41WqPo8mwL29mZJjeYm
 jKbS+xTEijDvz2dtk9zTr5erHhJ6mMhQ+dahC9IqutIaqsz9wXWcHajJCh9fwETx+5L3
 Bn88bk4kVTHxAxphHdcBS+XlUlN9n1l4mQtVmM86W7/SdGAIHn93p82FvmsayBItqsyG
 oJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0MbRdnRJn0x9uVTH+qro7/oyKU7eLBQcZeSxN6NVvH4=;
 b=R+VQBWzX8SAlzvqnzv4ltQrmAfTjmoFqy7h//04DHsSOPSU92KT3KyYJdUfzpQcPyg
 PFkNQ15bbmFy9DUJo0kwJVL7kwDpLRp3unyaHbk/uz9PyZbZk3VbUm0h9tyyQRtQCxha
 P1s9nfMy1jgLqjfJ9P5j3AoEIetHU82SHF/GKNTIK16QUFM7NBIpN9ihcdxERSq2y8Kk
 vULGW92NVsGT7eWCC0l5umBINyvGs0pNv+T9ofBORncE2Etyy7NQnVn4A6lAtKi6r4S/
 MkXn+NpA/J76jGbE4hjABK/xNzGsTKfIxRbjdXbcVBpF9Gs2mCml4YtMxH1PiAgZnAHb
 6mmQ==
X-Gm-Message-State: AOAM530wzRMucqZ6C3QGdPv3cOBRlBr7QIYhhy0eDfA0ZX1/qnm+VrfW
 53ipsk/yJTipieEPzrCoA8t2ngwjAzhBBg==
X-Google-Smtp-Source: ABdhPJytaVSOWqzm8+4S3oD9VfWwethjpjh7upR0RiyjKBosSTXMHKfPVuGke8yUhD4R/8QqGWfFsg==
X-Received: by 2002:a17:90a:d184:: with SMTP id
 fu4mr16447281pjb.79.1619814782517; 
 Fri, 30 Apr 2021 13:33:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3792511pgt.42.2021.04.30.13.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:33:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 82/82] target/arm: Enable SVE2 and related extensions
Date: Fri, 30 Apr 2021 13:26:10 -0700
Message-Id: <20210430202610.1136687-83-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c   |  1 +
 target/arm/cpu64.c | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0dd623e590..30fd5d5ff7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1464,6 +1464,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
         u = cpu->isar.id_isar6;
         u = FIELD_DP32(u, ID_ISAR6, JSCVT, 0);
+        u = FIELD_DP32(u, ID_ISAR6, I8MM, 0);
         cpu->isar.id_isar6 = u;
 
         u = cpu->isar.mvfr0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9..379f90fab8 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -662,6 +662,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
+        t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
         cpu->isar.id_aa64isar1 = t;
 
         t = cpu->isar.id_aa64pfr0;
@@ -702,6 +703,17 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
         cpu->isar.id_aa64mmfr2 = t;
 
+        t = cpu->isar.id_aa64zfr0;
+        t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
+        t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
+        cpu->isar.id_aa64zfr0 = t;
+
         /* Replicate the same data to the 32-bit id registers.  */
         u = cpu->isar.id_isar5;
         u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
@@ -718,6 +730,7 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
         u = FIELD_DP32(u, ID_ISAR6, SB, 1);
         u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
+        u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
         cpu->isar.id_isar6 = u;
 
         u = cpu->isar.id_pfr0;
-- 
2.25.1


