Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0293755BE70
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:25:38 +0200 (CEST)
Received: from localhost ([::1]:57230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63jE-0003CL-Lv
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kS-0002pF-8X
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:49 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:35665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kP-0003w0-5J
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:47 -0400
Received: by mail-pl1-x633.google.com with SMTP id o18so10001042plg.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VJKQ6WoqB0EGYqa/ELNpHbDiJmRFJHnsDZvzPsZOiDk=;
 b=uAebr7q01bnSUQKm6h+8ApekzzBlodGrdvM3f3JVJTMBkA3Z+Ro6IsOnicblepT4Ch
 O6+NK23iU/XOb/v32Btnz60FqhKvvGbs+504Fq0AwZSMyIwqekmzSebc7DbTlMvbcyM+
 rLh9lxpFZJXsEubk1s/xAdNPhYupGnJT9ISCjTXzRnqldMBPFmL0zLMDGAE2N2Q4vqWx
 zTjBFBbTAzdrGBvbYXe9poS3Djb4mbQ06+AKL/GV7dkWaazvbm23hrA5MEB0hcmerqtA
 EAZ4IEyOb+7f+Au5lG4S/PJ4t01HDPPhXpjsipl+/YzkL8mfMaFpxouVQc7Gk8x64alS
 VqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VJKQ6WoqB0EGYqa/ELNpHbDiJmRFJHnsDZvzPsZOiDk=;
 b=LgfI6F1NMpH4Q48NQLmHZewiy2B1BiOTEZWnvSz+wpkn98Gf5xCxr9MdcBHQluV7VO
 8IZNAR32S58iDEFyE++sQhPBmS4TrqYXYcG4VAWMzev63nP9ld+neVEaReJlfqceZwEv
 oxz11Bshdl6kHUf2Nb/BJYWGMKZfIx1EGoozTkvmezDhNMwWFisvmGVh8bLYSIjDZ/LL
 MHEVin7XMPBdsJ+VVpHNiKJRB9lTbEB0lY7tyqZ+sjhddAsjSr0ia2tUetH7h36R3cE6
 IKTvVqLpmkzBGJPrAMrO4jNKPmDSGT8b6vBquM72+rkBEXU5qbFjtrM4xPvRawyoCxLr
 fQGA==
X-Gm-Message-State: AJIora+RWvFqNNz9OZPJeGzh9SkEpbb53Z9S559xSt9niEOrDgOrho5F
 I4L9zfe1eBU0J+r3yLxuSb1R5jsXyojyFQ==
X-Google-Smtp-Source: AGRyM1vUAL6Hf85e3DD2OeEfDCKqA1pDyql36yC+BHNbA/yDOchJBYm6BIqVNuNldoABV0bUIcG/3w==
X-Received: by 2002:a17:90b:4c48:b0:1ec:a20e:a9bf with SMTP id
 np8-20020a17090b4c4800b001eca20ea9bfmr19918140pjb.209.1656390163547; 
 Mon, 27 Jun 2022 21:22:43 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 34/45] linux-user/aarch64: Reset PSTATE.SM on syscalls
Date: Tue, 28 Jun 2022 09:51:06 +0530
Message-Id: <20220628042117.368549-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 3b273f6299..4af6996d57 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -89,6 +89,15 @@ void cpu_loop(CPUARMState *env)
 
         switch (trapnr) {
         case EXCP_SWI:
+            /*
+             * On syscall, PSTATE.ZA is preserved, along with the ZA matrix.
+             * PSTATE.SM is cleared, per SMSTOP, which does ResetSVEState.
+             */
+            if (FIELD_EX64(env->svcr, SVCR, SM)) {
+                env->svcr = FIELD_DP64(env->svcr, SVCR, SM, 0);
+                arm_rebuild_hflags(env);
+                arm_reset_sve_state(env);
+            }
             ret = do_syscall(env,
                              env->xregs[8],
                              env->xregs[0],
-- 
2.34.1


