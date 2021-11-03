Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5995A444354
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:21:21 +0100 (CET)
Received: from localhost ([::1]:35310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miH8i-0005Eh-Gu
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwm-0002Mx-BW
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:00 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:46943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwk-000552-5Q
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:09:00 -0400
Received: by mail-qt1-x835.google.com with SMTP id s1so884639qta.13
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ta3Ko9zxfZ4eRR7LoDI2ksYw0ZQI5fINkcgZmVZuQY0=;
 b=ezRZnNXGQD9chZo/0QDTYGe+ZSgaxdt5jwZ2b3uwqbnPlSLSxm7gWchIGieVhjXiud
 BHqFjEMpGXP8Ws16zss3KxESk3agJnmZCKE6uGniItxzxoLcF3gw0sP9kUNW7bRAe+CI
 a8MLsQWpgMUXHENUisn9Zceo/ua4NX1lVVHXcIobC5JkM4Z8iOxdGXnwNWr9J/fDA6sZ
 nDgLS5FE5Z6k7JzXmD6xVXvZ5SysH2sqItK0U1pdrUdDpfqwYUtV74hTFSZdWKS9UoJ5
 FNtBl9li8YXgADA5hay1Etki51H3iogZEcjvwJntv8UAHqTjUcTTzncb/zjHzeodoeLR
 SV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ta3Ko9zxfZ4eRR7LoDI2ksYw0ZQI5fINkcgZmVZuQY0=;
 b=SEAmPkNelRm3qFU/QlSwCWhpFv/nYmXhlgESlNuKnelt6pm0zRQFgL/Q0bOWb6PVai
 zhkOZJo6tkbdBWhWrAu+CtZ5hNKoSqH/TtzyBhyD6X2Ri67K4K1XkrLDTepFKqvqg/Ma
 Sd1xrYTS/Ul57sBOvV0DSkwz8jMJIi0YuxKs+uXI24JFqm8pbO6P0Mdt9J2WVqM+h7H7
 0IVj/GiGeKyMhBp7o0EFoGRP433pCHuvO/coJxoD3TdRIdAAkq9kZ3nVWHdi/1G9i4fu
 B2gekUGew8ybmlCRLrfRihFVN7Zeni/DVw6C02KiqXrGhl/pZWRyNW0gQnsiRP7F0cCw
 b5nA==
X-Gm-Message-State: AOAM533ni2E2Zs0ooJIfdaIRN+ltHeN1nxBaMTRIHHJYCjHyVR7kIvs7
 I0V/HsdLfFfuuC4mEr8kgZ0OUgfriVr28g==
X-Google-Smtp-Source: ABdhPJwjoojt2Bdnr+dBi8ofCfb206dbpKaoEmbzrniYto41GkcM09XkeCXOPhbx7oFaCXHjqhct0g==
X-Received: by 2002:ac8:203:: with SMTP id k3mr46408053qtg.384.1635948537137; 
 Wed, 03 Nov 2021 07:08:57 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:08:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/23] linux-user/microblaze: Fix SIGFPE si_codes
Date: Wed,  3 Nov 2021 10:08:36 -0400
Message-Id: <20211103140847.454070-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a typo for ESR_EC_DIVZERO, which is integral not floating-point.
Fix the if ladder for decoding floating-point exceptions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/microblaze/cpu_loop.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index 263b68aea1..cf1668a45f 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -77,15 +77,25 @@ void cpu_loop(CPUMBState *env)
             env->iflags &= ~(IMM_FLAG | D_FLAG);
             switch (env->esr & 31) {
             case ESR_EC_DIVZERO:
-                si_code = TARGET_FPE_FLTDIV;
+                si_code = TARGET_FPE_INTDIV;
                 break;
             case ESR_EC_FPU:
-                si_code = 0;
-                if (env->fsr & FSR_IO) {
+                /*
+                 * Note that the kernel passes along fsr as si_code
+                 * if there's no recognized bit set.  Possibly this
+                 * implies that si_code is 0, but follow the structure.
+                 */
+                si_code = env->fsr;
+                if (si_code & FSR_IO) {
                     si_code = TARGET_FPE_FLTINV;
-                }
-                if (env->fsr & FSR_DZ) {
+                } else if (si_code & FSR_OF) {
+                    si_code = TARGET_FPE_FLTOVF;
+                } else if (si_code & FSR_UF) {
+                    si_code = TARGET_FPE_FLTUND;
+                } else if (si_code & FSR_DZ) {
                     si_code = TARGET_FPE_FLTDIV;
+                } else if (si_code & FSR_DO) {
+                    si_code = TARGET_FPE_FLTRES;
                 }
                 break;
             default:
-- 
2.25.1


