Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3965487E56
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 22:35:04 +0100 (CET)
Received: from localhost ([::1]:42102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5wt5-0007mQ-Hc
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 16:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqw-00058Q-Td
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:51 -0500
Received: from [2607:f8b0:4864:20::535] (port=36674
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wqv-0007nT-GD
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 16:32:50 -0500
Received: by mail-pg1-x535.google.com with SMTP id 200so6517343pgg.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 13:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+KhD9iBx1ZcOuJcsoctGGF86ynFPs7hIGRRqzI4Hcb0=;
 b=L2QpYOnJ657Az+NLFQx357QF+z8sWonSnsXHiL0wpbcTmIl7YJs2OJZYiU7VIUx2BQ
 BGtq0+bWfdZzndxikCxH9z9roKwTfXYWg3SA69WO4YifP1nH9vWPupnoqM7zGqaOQsZ4
 BHJV4Nz3z0KMJXTATtV71qtceiivvaYnJNIAJqDYf4ipVqoejdJkoeqNOk8RKz+6TkT7
 3NPMMrODljpXdT6APduxNPOE8O8F+v8etCvg6YNy0yQb2ee4xKegjSbueXWiOoA/v5zk
 fVrWwVE1khinZggsw19s9hQn9ebBJTPkvbHGeC2zXmdjlcgeywHvFQFvsCdGOKrLau1/
 9kJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+KhD9iBx1ZcOuJcsoctGGF86ynFPs7hIGRRqzI4Hcb0=;
 b=xbqkx9KijwTvfdbJZUzkb9QS01Jx1bnKlsuKfroSBbQ4s9gjumRfOJwIqAeYvjETjO
 MhI4pZz/9cP2awXH5ZxcKQx3+20F3tQN7Zt1TQ+hDxzbUsw6hkTERZDyla30Qe0/8F+F
 5quuaR7+TomdL698Ctn+frcpoGAeWjXUulToZfy77tvwGJrDiTV8ALu2CRISzO4PdCUr
 MlQ0n3WrxDgos0+1e7fvvPjCdcHHICilsCjxSu8uBgXddtsGAKLvYx1rMZLRIBh22Zgs
 xelwsNzm2iqAo6sbA35fS7J2EZmifQgf9YakdKpkQ+Qe6LjrGsikY5yWJgYyw+CLj87W
 HMcQ==
X-Gm-Message-State: AOAM5330677A5/k4DANdsH2X5PGDUxffHl9SNHT18Qa54Jc0aom+L3K+
 ByYqXpuFL2g5Qs6oXNv7K5YzakGp4OmkqQ==
X-Google-Smtp-Source: ABdhPJz1bGnCTbNZapOlLHbRbBxkVg+r/RIvn1jT4WMelmWqV04rdSfhM8jNg/o/IdlU+rioHk0fYQ==
X-Received: by 2002:a62:cfc5:0:b0:4ba:7a1e:9ae5 with SMTP id
 b188-20020a62cfc5000000b004ba7a1e9ae5mr66053387pfg.39.1641591168232; 
 Fri, 07 Jan 2022 13:32:48 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y11sm6633030pfi.80.2022.01.07.13.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:32:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/24] linux-user/hppa: Use the proper si_code for PRIV_OPR,
 PRIV_REG, OVERFLOW
Date: Fri,  7 Jan 2022 13:32:25 -0800
Message-Id: <20220107213243.212806-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107213243.212806-1-richard.henderson@linaro.org>
References: <20220107213243.212806-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These si_codes have been properly set by the kernel since the beginning.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/cpu_loop.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 4740da1b7a..a65e1571a0 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -144,11 +144,17 @@ void cpu_loop(CPUHPPAState *env)
             env->iaoq_b = env->gr[31] + 4;
             break;
         case EXCP_ILL:
-        case EXCP_PRIV_OPR:
-        case EXCP_PRIV_REG:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
             break;
+        case EXCP_PRIV_OPR:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->iaoq_f);
+            break;
+        case EXCP_PRIV_REG:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVREG, env->iaoq_f);
+            break;
         case EXCP_OVERFLOW:
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->iaoq_f);
+            break;
         case EXCP_COND:
         case EXCP_ASSIST:
             force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
-- 
2.25.1


