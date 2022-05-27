Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296C65366DB
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:17:45 +0200 (CEST)
Received: from localhost ([::1]:40604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nueWu-0001b0-6J
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueMA-00039V-JC
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:40 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM5-0001el-Ua
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:38 -0400
Received: by mail-pg1-x532.google.com with SMTP id 129so263155pgc.2
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CjwMy/u7BmGHWp6cphS1Ihq36Xg3IYexqKmZ8A6LwiQ=;
 b=K4EEWCfEZ/hXlpQPrsweVT7CTqYfwcQUYNfzz2D49gcp5KDv/brzDWhOgZrYJLAs7H
 /RLC1hrVE63byBLnC3R4u/QiQRMa5H45LRQPghqPAvqhuFBjp4JLwkVpGVWZEjo+p8sg
 WeVhMDdBMejryAJjiV2Yl6qWebSFcby2Cr5MTtYskm1MUPa84Ws/miNXN400I8Wh9Qk0
 5UXxNcHgGp2M4qr8V64CK3qBFellVVNCDcTKUGMSGiXUrGotRq6AoqYzfcqjVvr7+20V
 xolxBr3I9WvGdoPq3ybZYmmX7nZTxZgRh2b0vV39JJMvNciL9aa7BATpZCD2zIUKAtrS
 yj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CjwMy/u7BmGHWp6cphS1Ihq36Xg3IYexqKmZ8A6LwiQ=;
 b=qOr+HtyC3W6qeTTL5TwnZIhOaKAVUMPa34ZgiTagrhykggXmCluNDQjeGKgQUwvsBJ
 sXzRmcCTHFKFB/e+VsFW7bfcL4ycR3E+wQhTAtAHVcFYEGtGN9zohKAKJZYgrI5fWa3H
 atgcYFWYfb1LOT/gnKlq+Lp++pWOCEumClzsu8jRroBfR4hRPYvRZwjuob62zV/pfT9y
 9r24U165rDfeG67oZKCsokX2n+KkNEd2JJYU7d4e4mz9jLObdDfLAqoiKIN+AUicgiVs
 iLyKEV0bHosZUL7BOFSNyNnji+KW3D3e33TXmXoZBJIiKMCBwkunQnnnINmEjsbLYOFX
 CCkg==
X-Gm-Message-State: AOAM533Tfs7ymb6LYimwPcO/M+spUpVaGLKJGJMhwHWeGHEV+HYzG6i1
 oGBwox84VZHETFdsT7RmWNWjE5cEC8FF4w==
X-Google-Smtp-Source: ABdhPJy51ps61B1cQZx0xPaW+B9ChAAFnkiy0U23b+jJIrET8qGmeqzpRDCmx4C6mluJWqJZe6Z6uw==
X-Received: by 2002:a63:c116:0:b0:3fb:2109:f714 with SMTP id
 w22-20020a63c116000000b003fb2109f714mr7378527pgf.237.1653674792617; 
 Fri, 27 May 2022 11:06:32 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 09/15] target/arm: Use el_is_in_host for sve_vqm1_for_el
Date: Fri, 27 May 2022 11:06:17 -0700
Message-Id: <20220527180623.185261-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

The ARM pseudocode function NVL uses this predicate now,
and I think it's a bit clearer.  Simplify the pseudocode
condition by noting that IsInHost is always false for EL1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d1b6c2459b..69b10be480 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6230,8 +6230,7 @@ uint32_t sve_vqm1_for_el(CPUARMState *env, int el)
     ARMCPU *cpu = env_archcpu(env);
     uint32_t len = cpu->sve_max_vq - 1;
 
-    if (el <= 1 &&
-        (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+    if (el <= 1 && !el_is_in_host(env, el)) {
         len = MIN(len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
     }
     if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-- 
2.34.1


