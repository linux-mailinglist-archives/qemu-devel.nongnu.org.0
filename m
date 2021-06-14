Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58D93A6A21
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:27:12 +0200 (CEST)
Received: from localhost ([::1]:58376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoUZ-0002HU-OX
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEk-0001VP-LG
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:50 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEU-0000Pn-Re
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:50 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 k5-20020a05600c1c85b02901affeec3ef8so13363756wms.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Pv2v36D+L11hWelZsT2n1Q+Aj9ncHiuRY7ahbWByeo=;
 b=om7krBZNbouTCdrG3ZbX/1uYYU3YRU8EX+er8jB2kU8WdKgIg8eyBCxTy3m2Ww8Yv0
 OvwwQzZZzNz+PRYVkoNh3PppATYlzvQMcbQwAXdH845xCZruk3+0SnHPWpzzUZojt5x8
 2e/+Ti+A5zer9wQhLOnF889y1GZmkpu0wE66BqEinhk3RiUg4AHbA5edD+6eZrqERk9m
 jMSs0DK4eBp+8csqkDbq292PirRJqRxv8Nx49dtxRK7OT7lcW+M4ik/QCiBGszd4TMwR
 JLuQqLhLqiFSpblv41iTsAVXf8kaOuLXicUgi/0V7wF0SYWe9znH299AAebTbuyt7G0D
 LypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Pv2v36D+L11hWelZsT2n1Q+Aj9ncHiuRY7ahbWByeo=;
 b=g4LptzAInl/ztPby3Z/pToNItD+d23A9cEg1jwJtJM3FGm05NXFNNylZKO5j0SpwDV
 /TaOsGHrwP49wrzbeVx8MikkQdFWbvfPbpFOmeIGRtBLlwp/80nXEOO1jFq5MIk5SeV0
 xSFz7if73bbBihrK3mWfX9iGktJ3q/3t8NiYWVmXFR44qs1NlXtKtZQ949cC7pVkVDY6
 aRZPNqMuTlWMgIbfzZlXXLMJ96MBWcM/JArA1ZTZRp17cFL0Q+L3QcHk0OihxApVe4/Y
 /VgcGmTGUPCNBTol1WM887GGJeTr5vL5viVoBZqFioMvhbTtFEMbe0XVa1IDdIsUWyEf
 r+DQ==
X-Gm-Message-State: AOAM533nM8iIE9j55n2aTVwBQB+SpKnVC4s5BuRgBk/l494562DqBHDA
 PCmoZ32BxySIeEY80Aasg6uwRA==
X-Google-Smtp-Source: ABdhPJwRFiBmUIC9Wo9NXih/5+rD3SO1gIJX8k4ZTmGHszQHJmk184nrXcaYECb4bcjb4tpt2+o2Vg==
X-Received: by 2002:a05:600c:499a:: with SMTP id
 h26mr17426713wmp.32.1623683433497; 
 Mon, 14 Jun 2021 08:10:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 28/57] target/arm: Implement MVE VABD
Date: Mon, 14 Jun 2021 16:09:38 +0100
Message-Id: <20210614151007.4545-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VABD insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 7 +++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 5 +++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 17 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 5181d3b9413..5cd4e7d736d 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -109,3 +109,10 @@ DEF_HELPER_FLAGS_4(mve_vminsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vabdsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabdsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabdsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabdub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vabduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 42d5504500c..087d3db2a31 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -93,6 +93,9 @@ VMAX_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 0 ... 0 @2op
 VMIN_S           111 0 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
 VMIN_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
 
+VABD_S           111 0 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
+VABD_U           111 1 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index d9f40438be9..85122c00664 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -439,3 +439,8 @@ DO_2OP_S(vmaxs, DO_MAX)
 DO_2OP_U(vmaxu, DO_MAX)
 DO_2OP_S(vmins, DO_MIN)
 DO_2OP_U(vminu, DO_MIN)
+
+#define DO_ABD(N, M)  ((N) >= (M) ? (N) - (M) : (M) - (N))
+
+DO_2OP_S(vabds, DO_ABD)
+DO_2OP_U(vabdu, DO_ABD)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 369eff998c9..ffed902625f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -355,3 +355,5 @@ DO_2OP(VMAX_S, vmaxs)
 DO_2OP(VMAX_U, vmaxu)
 DO_2OP(VMIN_S, vmins)
 DO_2OP(VMIN_U, vminu)
+DO_2OP(VABD_S, vabds)
+DO_2OP(VABD_U, vabdu)
-- 
2.20.1


