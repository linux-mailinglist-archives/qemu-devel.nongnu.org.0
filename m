Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B790362B0B
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 00:25:35 +0200 (CEST)
Received: from localhost ([::1]:54326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWu6-0003sR-GP
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 18:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVsJ-0001IK-15
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:19:39 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:37557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVsH-0001kO-AY
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:19:38 -0400
Received: by mail-pf1-x432.google.com with SMTP id o123so19166532pfb.4
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0MbRdnRJn0x9uVTH+qro7/oyKU7eLBQcZeSxN6NVvH4=;
 b=qaXmsrGpI9i5K8Edy6l7VAnAbkhP/t+MCdGi+211l8uLRVZYWu38GBc8aq5kqgtCTR
 8qPnoZlRs2qP36+W9LhuS/8sUhpsvNuGRUAyKQXYHKTO8340E5+QFkZ+7G4sMTakAaqI
 2VUWK1ZlLN7N8pu1EvXmuFzAYDjILxnUVaN9btg6rB1kp7Z0OyfRVJELzMsIK91+SqT8
 0iRrllnrFHVAVF4lfMZFWGm/lXYnw/5MEmqbt7gQTTuUOKT4pPJ7fTDPGbzKlPgMxwYj
 SwieOtpt0EV+HkqPPdi4DB0EAK7oBQqA5FVd4tNMOv86uSBQmng5alA4XA1Cms2vKoLo
 iJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0MbRdnRJn0x9uVTH+qro7/oyKU7eLBQcZeSxN6NVvH4=;
 b=Ulc9OZdBCX0QUf4UGi0+fhAHIPytKe2z5SKsASoam40zvWZAZVav8tD5I+Yph8eq9x
 MIc3psj7nuXsBRkbcc3X4UP7Dxveq8Y7WivA+L5anb+ZySOC5VNN2s/FFp74vmpBoIT8
 mS2pvFJjSH9rVHji6qGgBz0ntzkaArBdPVC5ygDGYHkRW+hxO2CSskCA7mOAXQOwtDcj
 ZMZZVQ6L5c1orduhBilpGXBfemAwFG6x+r2aRYtmfd0CluGjZQ+LnqrEHcCi4VCIeoTu
 iS9y7V4muw32sZkePC1D6kijJLdptO5g9fnlgz88SFI+CQBTcG58prRlU69Fd56CjwVY
 1Eng==
X-Gm-Message-State: AOAM533O8Fqj2R1s5VaiNhPffDQFI2boKunj2KQ338v9e5DAvUhKHA4c
 LdIqBBa/LkgZ5GLa86yqjw8ZDyQU2vq+0w==
X-Google-Smtp-Source: ABdhPJx8gj7TataENWAhZt1o6ke6Bh8eIxNoBhc5+iVogUE3JDvi6gNOKl3X0So/WblPnzIut8VfOA==
X-Received: by 2002:a62:4e96:0:b029:248:effc:9a4d with SMTP id
 c144-20020a624e960000b0290248effc9a4dmr9428224pfb.71.1618607976014; 
 Fri, 16 Apr 2021 14:19:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id i28sm5648479pgi.42.2021.04.16.14.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:19:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 81/81] target/arm: Enable SVE2 and some extensions
Date: Fri, 16 Apr 2021 14:19:34 -0700
Message-Id: <20210416211934.1591764-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


