Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C1150BF13
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:53:29 +0200 (CEST)
Received: from localhost ([::1]:39656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxTE-00060D-Th
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwan-0000At-MQ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:15 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:38721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwal-00080Z-N0
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:12 -0400
Received: by mail-io1-xd33.google.com with SMTP id n134so9202851iod.5
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rtZqSMWwTH4bx7pviC4q7DdFYgGahnZ3eKlGOA25mWs=;
 b=WgqHMRuBQOMQ8di3zqmE3sqB3LcJXuaKGTjvC0/EegA/pccK+hOgAjzHZeemau+Ga0
 uBwO0fj2m7IzK/jbVQsmIWcvyKJ4FQqC+kFu9TEm9mT2PKRDSq84aUI3UGXuW7/q3zz3
 T7u44F+Rpy0hlzFtWSCqM8ACNE6uWmVyPPeMW5SOzEnFDHLwjlWrKV8IFGTkmpeLF47k
 jZB92fFySm1iCN95AjC0HJRs17LriGkTAsaqKFgjUbmTnZjELGEo+F5iuDlx+QxeJIhe
 GGVO9rvH3iMxp5JHLGLi8DJ3QfZWrkWepO7/6t4750b/76LXZ0jpVX1D3tsLjEOaFnHG
 osow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtZqSMWwTH4bx7pviC4q7DdFYgGahnZ3eKlGOA25mWs=;
 b=0Y/6Z4nT7piyIDL7+iaE6NNBawnG2EeVfZgmJNudjEOc5GEKw7dVHpk0fuhb0gkcjg
 yfun4H3Hap6o+476g0SpHbMfckyuRCi59JeuF1YgCZkJYvtbhxVx7K2wnj11NYxEag/B
 2i9PIib5ztkHkBY5JJybNUur4a66LAddN+/6mVwE3KK+lcaID2cXcwikgj0igbBAigcR
 W6CuNg+CR88GkTGQlpHk3x/x67HUNsqjuYLfCc1SHSLfNTniXuWNXj4yGGhcghtswEQP
 gRWM+7V2TF6vw5e5kRnHRZRbUbRrcDZqMBOS5u/YwoZS2WFDY0VEa+gOa50TPftNFJkg
 Rzeg==
X-Gm-Message-State: AOAM530lPAUjihbSD6NeotO+moporBbf5hUKrMFVMHca1D9Joz40QQhH
 Pqny/aOTuve4iQeCZJcLDG65wO19tpsg2JhK
X-Google-Smtp-Source: ABdhPJwZvMPcIXX/jVjaioMCH1Zgf0C7Vj0NqQZE80p4jlsHnrigj+J8bz5KNEiNnAlzoeYewrfOUw==
X-Received: by 2002:a02:93e1:0:b0:326:7a7d:a2b0 with SMTP id
 z88-20020a0293e1000000b003267a7da2b0mr2459595jah.44.1650646630720; 
 Fri, 22 Apr 2022 09:57:10 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 50/68] target/nios2: Drop CR_STATUS_EH from tb->flags
Date: Fri, 22 Apr 2022 09:52:20 -0700
Message-Id: <20220422165238.1971496-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd33.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's nothing about EH that affects translation,
so there's no need to include it in tb->flags.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-47-richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 4d63006ffe..477a661f17 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -272,7 +272,7 @@ static inline void cpu_get_tb_cpu_state(CPUNios2State *env, target_ulong *pc,
 {
     *pc = env->pc;
     *cs_base = 0;
-    *flags = env->ctrl[CR_STATUS] & (CR_STATUS_EH | CR_STATUS_U);
+    *flags = env->ctrl[CR_STATUS] & CR_STATUS_U;
 }
 
 #endif /* NIOS2_CPU_H */
-- 
2.34.1


