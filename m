Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0AF59C094
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 15:31:18 +0200 (CEST)
Received: from localhost ([::1]:39186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ7WP-0000OW-8B
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 09:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PS-0005s8-4i
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:06 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PQ-0001di-0k
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:05 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h24so13201125wrb.8
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 06:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=fYJRGJbHqfyzGRsSKt0/Tu4Z570kNymq2RC3ejv5XA8=;
 b=MQDLFPdiGKea+u64F0TyqoyISPHhSQtA1tHINcj2Q/HOxEX5f/QIt22vzWa+YZXrwM
 kCdf4d1evxnE4JEp0B+vkPrIV2kMA3WMwR28F2toIOdj8dtEMOhl6rNhY4pSlEA2Isq+
 H2xNh/y7pvqcTDtF30E10DfYoUx6oR/+7Yk3cwkRq9D2YC9tlGnP675GQFfq80di/zQM
 fJ7Ni8lhTZJ2oan6pJY6QNs3lt3oaOqle8cvARkbhFpsIEgjxIGca9QR/6PCQ/NbyY4E
 JltVFEGl+HtrIjYewmMHSgQPl7ZSgltJyS0cUHre4QnN/Av781Ty+omKM/5wFNx2mwpu
 b5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=fYJRGJbHqfyzGRsSKt0/Tu4Z570kNymq2RC3ejv5XA8=;
 b=o8m0droPTTmDzc8O+U7xxyWtQzAQI3C4Dp+R8HSPHX32/1pWB5M+cqUi/dXwu3+eC9
 VU0aLTVIWU0kJ83H97xFm8gZPkYE/JeQLrPkAtubchwHuhOXwQRlkaQT4IdmFfuDGiAc
 8l4RfhWyv5U444TlUd/1nBeU6u7CH7e0GrkaW4tvsHXI13gtWumVy2VFrYasi7e3wiJS
 PAriAsTbcqlnmZpJaHWtzrrVNorGNSQreqXtzIjzOxrQ2LLi3zsPSTRwfa6faO445v9O
 LsSwM4/4GnKMiCBc3FXCwYCSszXkDulvexq73QHAoJDdPRtXj84l8DGLRMc3MSOi/VJ7
 s4/g==
X-Gm-Message-State: ACgBeo0Na4wT/68ZTbRHbzMwg1YqgUv9kFHC/TJHiDY5mM0WoeibSEX3
 ki2FLUOut0yMIW8cerrr5ShDYLdiCYTRnA==
X-Google-Smtp-Source: AA6agR7Mm3R780kpiDrq1nGQY2A0RcuAQxS8PemB/ZF+ILQoW3HQ3jMo12cNj3x3B5kXZR29UUgizw==
X-Received: by 2002:adf:fb4c:0:b0:225:2033:b745 with SMTP id
 c12-20020adffb4c000000b002252033b745mr10272553wrs.447.1661174641624; 
 Mon, 22 Aug 2022 06:24:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adff98c000000b0021f13097d6csm11527946wrr.16.2022.08.22.06.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 06:24:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 01/10] target/arm: Don't corrupt high half of PMOVSR when
 cycle counter overflows
Date: Mon, 22 Aug 2022 14:23:49 +0100
Message-Id: <20220822132358.3524971-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822132358.3524971-1-peter.maydell@linaro.org>
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

When the cycle counter overflows, we are intended to set bit 31 in PMOVSR
to indicate this. However a missing ULL suffix means that we end up
setting all of bits 63-31. Fix the bug.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d7bc467a2a5..87c89748954 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1186,7 +1186,7 @@ static void pmccntr_op_start(CPUARMState *env)
         uint64_t overflow_mask = env->cp15.c9_pmcr & PMCRLC ? \
                                  1ull << 63 : 1ull << 31;
         if (env->cp15.c15_ccnt & ~new_pmccntr & overflow_mask) {
-            env->cp15.c9_pmovsr |= (1 << 31);
+            env->cp15.c9_pmovsr |= (1ULL << 31);
             pmu_update_irq(env);
         }
 
-- 
2.25.1


