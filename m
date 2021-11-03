Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C42D44433C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:16:46 +0100 (CET)
Received: from localhost ([::1]:55096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miH4G-0007w8-8r
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwi-00029Q-ET
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:56 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:42533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwf-0004yG-M8
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:56 -0400
Received: by mail-qk1-x729.google.com with SMTP id bm28so2356327qkb.9
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3GSy2kvUvNsh+WtyFYrRefI0IkOd8hdjsqXAQKDL2Tk=;
 b=D1cQeN7ga/4wQ/QM8+2uB0FcUGKrUgcL9/oRKc6ejSJKDVodak1d4I3vTk6NCqWNCT
 P09p1P7KTlaHpCszO2h212qDoqPk/O60+PfgPTFzPvilFLjvCdUWQ4f2VRlVAsGOLESt
 mdiN5JesBD9LiYfPLNNXdndLygBXU6rDA7U5gyzKPhvR1x6wLG/rjiaSuK2ogNrV5+Ye
 NzScQNZLv3TvXOT+NTGAEEIjRb85ulTv6CcuPLhcC/6t+hYHp5vsj89f9Dnhaib0AuoX
 W4qClPbs/J7hIDkasYbeMwYAmYGJa7iEc2URZXT8DIrCpzsgHYXN9gEAGQbl4AqF5uTO
 J2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3GSy2kvUvNsh+WtyFYrRefI0IkOd8hdjsqXAQKDL2Tk=;
 b=q/XrTOHz0QNO26ZaqrpxUtcqltqokZkjdSuuFLcwt3wKarqKMxWoCP0JYLkCh3ifiw
 i7e90K2r6WP+6VHCuU2nU7CvdLOcvppAjG9RquQ7E/OLOQ72b1iM7HtRexC/h6RQwE6T
 Yt7SA9L7rNdlNkxrJ2WydqFj20dIhJAlcG98xGQyeq2d9kduP7ByLHMte+agGA6u1ozR
 6b58ThEyrVqy/M0f5oeujFnXsvtEEz+ZhgzMvHb52aPt5E5hI7CTpCn9iavPVTUjp7oe
 82viQSdpu5lEmp4ZVwPM2KqhxwNS5jSKxYGvU1EMonItKGY/buKV7r9bFNxxqEy/px5w
 sxfA==
X-Gm-Message-State: AOAM533cGJrVYRRinbbNTlvCYB6ub3PuW736b8dzkg4deor8TZOyoOnu
 ehbew0DP4+5HQB3QkB9ADV7Mf5UWJHyvTA==
X-Google-Smtp-Source: ABdhPJyI+PimmiSrsfqS9q1+pHmbIgvlOR7UddeCtrCdCHUk0u/lpiKv8V2MuN0EqT0YWDA4MbqhGw==
X-Received: by 2002:a37:9b83:: with SMTP id
 d125mr34331678qke.374.1635948532811; 
 Wed, 03 Nov 2021 07:08:52 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:08:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/23] linux-user/hppa: Use the proper si_code for PRIV_OPR,
 PRIV_REG, OVERFLOW
Date: Wed,  3 Nov 2021 10:08:30 -0400
Message-Id: <20211103140847.454070-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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

These si_codes have been properly set by the kernel since the beginning.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/cpu_loop.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index b09caa1111..8e13f84a64 100644
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


