Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B5C39260A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 06:20:52 +0200 (CEST)
Received: from localhost ([::1]:57470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm7Vr-00073x-5f
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 00:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PS-0001ZO-F6
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:16 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:40923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PP-0007Cz-2t
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:14 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 lr4-20020a17090b4b84b02901600455effdso433645pjb.5
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 21:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nT+GpFTOsWsQfC1YmI7kL70ZhWTUUU2ohdIk/CWngKU=;
 b=CMIL1BD0VotPQt8sA4mlXbiVKdWSM9vCbWTxOZqHQzzNQnnyKJHL1bD+6m2bgDdO8w
 ATqsrrr7nLMo+f4pzLkY8rpnStSOFLnrXp2jVc3j/wYHWRFqgPKO6HQxEYPszJJA8Hfl
 NBSWn9tUt+nIzBqglE0AAuuXPQ7anU2bcJ8vmCsDjXN/wEHOJZ9r2QJwu/mvf5WG/dDq
 GIdNrGpo6BkMNu9qqDh5uoBbb4huKTFJnydcK29c71EL9avBgoctoaG92/KQxOUV9i7b
 ozdtmzkERH4dlFOmHOaDNYmelBhTLtIS7f1BAah0BhddXOV0HDI64EuR33hP9IJe+ogQ
 uhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nT+GpFTOsWsQfC1YmI7kL70ZhWTUUU2ohdIk/CWngKU=;
 b=pCGNC2KDg47SJhk8HVG3zWq3Z6hIrQShCmJbz7F9GgBjnBChu8eCyFT+cwHwj9Oaux
 Hm+CZCKdNOSbFMfvXwGJ1i9CbzYRg6TVzwXfzlLRmpF90/cFAUI4AHPXxwzH8Se7CDI/
 tRU8qAo3nGRNgxqqUP4IPjP2zZi99pzaMaT/7FFHoicvfncPH3OwMueLGJzJINzh8kO3
 VnOt4X3oKdckr6KPYDg53nTyuJWrsnFjxlZNELm0JPxlyya8/H689VSqIciM9dt2mZkX
 fPYSURjdFWmy1ZxnfJagxOgJikVdeFIiAZsLECzKfcWluQ5BAOoR48Nj0mV2iTvLdRro
 hX2w==
X-Gm-Message-State: AOAM533AgSkn7ztRz1uCb4HCwUlDY+w7Ol9oJl2MRUgupglwsP3/Pbsr
 pbl2L1CuvVGeTuOMvA1z+Gn7kxIIClzMfQ==
X-Google-Smtp-Source: ABdhPJz71wpr2YSKFkULOeZHUwoG35USy3mqd2w2hZinuNsCxa8vAyYMI7zQYLrIh8GgCKOEf3o6Mw==
X-Received: by 2002:a17:90a:4105:: with SMTP id
 u5mr1594803pjf.45.1622088849541; 
 Wed, 26 May 2021 21:14:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id s1sm605959pfc.6.2021.05.26.21.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 21:14:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] target/i386: Use float_flag_inorm_denormal
Date: Wed, 26 May 2021 21:13:59 -0700
Message-Id: <20210527041405.391567-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527041405.391567-1-richard.henderson@linaro.org>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: alex.bennee@linaro.org, mmorrell@tachyum.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The FSR and MXCSR DE flags have the semantics of the new flag.
We get to remove a big fixme in update_mxcsr_from_sse_status
vs float_flag_iflush_denormal.

Reported-by: Michael Morrell <mmorrell@tachyum.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/fpu_helper.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index c9779a9fe0..edc550de55 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -148,7 +148,7 @@ static void merge_exception_flags(CPUX86State *env, uint8_t old_flags)
                        (new_flags & float_flag_overflow ? FPUS_OE : 0) |
                        (new_flags & float_flag_underflow ? FPUS_UE : 0) |
                        (new_flags & float_flag_inexact ? FPUS_PE : 0) |
-                       (new_flags & float_flag_iflush_denormal ? FPUS_DE : 0)));
+                       (new_flags & float_flag_inorm_denormal ? FPUS_DE : 0)));
 }
 
 static inline floatx80 helper_fdiv(CPUX86State *env, floatx80 a, floatx80 b)
@@ -1742,7 +1742,7 @@ void helper_fxtract(CPUX86State *env)
             int shift = clz64(temp.l.lower);
             temp.l.lower <<= shift;
             expdif = 1 - EXPBIAS - shift;
-            float_raise(float_flag_iflush_denormal, &env->fp_status);
+            float_raise(float_flag_inorm_denormal, &env->fp_status);
         } else {
             expdif = EXPD(temp) - EXPBIAS;
         }
@@ -2976,7 +2976,8 @@ void update_mxcsr_status(CPUX86State *env)
                               (mxcsr & FPUS_ZE ? float_flag_divbyzero : 0) |
                               (mxcsr & FPUS_OE ? float_flag_overflow : 0) |
                               (mxcsr & FPUS_UE ? float_flag_underflow : 0) |
-                              (mxcsr & FPUS_PE ? float_flag_inexact : 0),
+                              (mxcsr & FPUS_PE ? float_flag_inexact : 0) |
+                              (mxcsr & FPUS_DE ? float_flag_inorm_denormal : 0),
                               &env->sse_status);
 
     /* set denormals are zero */
@@ -2989,20 +2990,13 @@ void update_mxcsr_status(CPUX86State *env)
 void update_mxcsr_from_sse_status(CPUX86State *env)
 {
     uint8_t flags = get_float_exception_flags(&env->sse_status);
-    /*
-     * The MXCSR denormal flag has opposite semantics to
-     * float_flag_iflush_denormal (the softfloat code sets that flag
-     * only when flushing input denormals to zero, but SSE sets it
-     * only when not flushing them to zero), so is not converted
-     * here.
-     */
     env->mxcsr |= ((flags & float_flag_invalid ? FPUS_IE : 0) |
                    (flags & float_flag_divbyzero ? FPUS_ZE : 0) |
                    (flags & float_flag_overflow ? FPUS_OE : 0) |
                    (flags & float_flag_underflow ? FPUS_UE : 0) |
                    (flags & float_flag_inexact ? FPUS_PE : 0) |
-                   (flags & float_flag_oflush_denormal ? FPUS_UE | FPUS_PE :
-                    0));
+                   (flags & float_flag_inorm_denormal ? FPUS_DE : 0) |
+                   (flags & float_flag_oflush_denormal ? FPUS_UE | FPUS_PE : 0));
 }
 
 void helper_update_mxcsr(CPUX86State *env)
-- 
2.25.1


