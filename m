Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC05E5684BE
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:08:42 +0200 (CEST)
Received: from localhost ([::1]:40560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91xY-0000l2-Tu
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90PQ-0000jJ-8D
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:29:20 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90PN-0001Eq-MT
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:29:19 -0400
Received: by mail-pf1-x42b.google.com with SMTP id y141so13732703pfb.7
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H9uf8O4CUiqyVcmvjic8DcvLpWT2fCMJa8CUUeRGTi0=;
 b=aOGczq1tt/UVP71V0gMVKd0nMKXqN+C/p5LVs6C9iwibSN388/y4P1lP67oi3eqniB
 6m9H2voeLZcxd5AUURcXYyTanWYVRhZDkFDKWB+/R1+qIeDmO/35TIQMQ/tSEX9/oz86
 YfM7ddoMNyYyFIn3z8hnvJwf3xBiFWUYgbkMT/WR/WiJgQC43GsJdBoibkVEimdJSDHB
 KZ4VzI1zDuA6PjpbHDZQYAfqpJ99wmC/dQ5Mr4TVbjsIdLOtPnDf7GOmviG3HhzjEN9A
 GN6rTXIvf0H6ofBTl+AcxMLezzkjmdRJP3l60bV2ok4cvzZgkL7RRj/sGYwa4BMDIohD
 vHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H9uf8O4CUiqyVcmvjic8DcvLpWT2fCMJa8CUUeRGTi0=;
 b=DG9vK+hzz6giq4eaGSbP3Vr7Onfk4Ntw8UK6+k8P0R8vgAulgtQdBvUVQB6Yx/VuvG
 UaiCKimW/L5vhFQDU6gkgnOdbg4r0vqlEiCy9BL8yhh1vMZI4D/Kfg+8UpRBWj13+wdJ
 pX8dJDnUAZqOd0WyVY5OKj/pUvSzlEyiB7y/upOfrVUX8nrz/G3SZmR6JUQCL/1VQZxM
 4Q7wb1xNWkWb3ykG40yroSlKi76niNrDX3T3mPRGhuHG2hgVd9sfZlKrEm4yfF6FmhY+
 ugumj+oxM8O3VFltdpu1N3AIgsNVLc96pdnvEvWBt9a8dPVA+AwM7LsSMnQpNag6QopO
 jAkA==
X-Gm-Message-State: AJIora9vR9EMhegJfU903SDsJjMRFisvlnSBUSXC9gPWI0yAPaelDl8C
 FBio5HH23QmORzsar+/u0JawBHrTwQgkvyxb
X-Google-Smtp-Source: AGRyM1t/B2hrKwXSG+0PeUKwunKXBSZZ3Z/FUrbIC0Gx+NoNNVSrI5HHRJ9e0UEUUCswOvujhJWfrA==
X-Received: by 2002:a05:6a00:2356:b0:525:7c6e:1dca with SMTP id
 j22-20020a056a00235600b005257c6e1dcamr45796713pfj.28.1657096156221; 
 Wed, 06 Jul 2022 01:29:16 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 c17-20020a170903235100b0016bdf53b303sm6700529plh.205.2022.07.06.01.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:29:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 43/45] target/arm: Only set ZEN in reset if SVE present
Date: Wed,  6 Jul 2022 13:54:09 +0530
Message-Id: <20220706082411.1664825-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

There's no reason to set CPACR_EL1.ZEN if SVE disabled.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9c58be8b14..9b54443843 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -204,11 +204,10 @@ static void arm_cpu_reset(DeviceState *dev)
         /* and to the FP/Neon instructions */
         env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
                                          CPACR_EL1, FPEN, 3);
-        /* and to the SVE instructions */
-        env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
-                                         CPACR_EL1, ZEN, 3);
-        /* with reasonable vector length */
+        /* and to the SVE instructions, with default vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
+            env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                             CPACR_EL1, ZEN, 3);
             env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
-- 
2.34.1


