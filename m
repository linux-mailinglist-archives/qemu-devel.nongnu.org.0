Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290455366D8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:14:34 +0200 (CEST)
Received: from localhost ([::1]:34860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nueTp-000678-8D
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueMH-0003Ki-F2
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:45 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:34429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM9-0001fm-4k
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:45 -0400
Received: by mail-pf1-x430.google.com with SMTP id c65so4387871pfb.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SGJcDxYDfQFpknZCT6eIqa5PjlEqkkDf5ogejS4BA6E=;
 b=eghCjvq/Z+0XSJGKJb2OFHQfReHyoUBz6ORz2J8XyZWyHk63pyfsLwjNq9Vh74ylQr
 9ERYN37oNmuP1hRtbAqK5P3DfQrZyLMGcoNtHFFPRzy0VMqMc6VEVE77mV+cz4xfxzpx
 cXLOP0+PIzoXUGUaxHFl1rIw7fj0aMql0xpiOdGHylOcM/0ISTo4sW9KipwKlYxVVtrA
 4K8CkT6FBrMnE8v5a9QEJLHLkR9+5WC8hvAPoEdP0GmaxUtNndMK+phHRaXt5WpE8bwz
 w1+vzs+jMRlGz6FiZeJyYqPWpJb18KXO4GgCHoOI0mwTKQTwK+eplHfzwTYdL3HaM6Or
 4MRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SGJcDxYDfQFpknZCT6eIqa5PjlEqkkDf5ogejS4BA6E=;
 b=H6Qhg+yKiwOjYnGEveueEnlZzsQoRJAq7/CyAQGiVfaM4G12RVz6J9GFKgJZf7Cauu
 dkmVOabOpk35mCYaCtzYG+CwLGJvhP+QEyk+Wv9Mxv2U+AgGHFXHyubWpJUsqnJ/Tk63
 jQlN7BaZhBvRrzxZt30wbxf4uom9H8xDWyboBcHwBCnXvFuBW091jISdeOLGFyVGpTh2
 HO9mOlcFBuXwEJS/gd2xx4VXsssdjkHG02GoHNxac5EFDQzI1BokGkoyW3varZOEC1vO
 d8bqNhTv1KMMHQuxe1PyR0FUuUHO81tmg8un2R92FNGuVJBjR89p1JuaI0RtIK7vB2q3
 //Cg==
X-Gm-Message-State: AOAM531sT+jK3Yx+1c9dfJM1V7mfYBqsCvWH7CqRzb54wWlIjUa8fd4T
 H+SpmXK28IK31HjRYhp8IilwK/DV0DXL9w==
X-Google-Smtp-Source: ABdhPJzkJIZh/Nj1YKtx8btujosccKjrcV7kdVEnOrT0W7o9A/HjkuuQW9lBgvJly9eHQo26cpXRbA==
X-Received: by 2002:a05:6a00:803:b0:518:8afd:25 with SMTP id
 m3-20020a056a00080300b005188afd0025mr30785275pfk.41.1653674795910; 
 Fri, 27 May 2022 11:06:35 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 13/15] target/arm: Use expand_pred_b in mve_helper.c
Date: Fri, 27 May 2022 11:06:21 -0700
Message-Id: <20220527180623.185261-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Use the function instead of the array directly.

Because the function performs its own masking, via the uint8_t
parameter, we need to nothing extra within the users: the bits
above the first 2 (_uh) or 4 (_uw) will be discarded by assignment
to the local bmask variables, and of course _uq uses the entire
uint64_t result.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 846962bf4c..403b345ea3 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -726,7 +726,7 @@ static void mergemask_sb(int8_t *d, int8_t r, uint16_t mask)
 
 static void mergemask_uh(uint16_t *d, uint16_t r, uint16_t mask)
 {
-    uint16_t bmask = expand_pred_b_data[mask & 3];
+    uint16_t bmask = expand_pred_b(mask);
     *d = (*d & ~bmask) | (r & bmask);
 }
 
@@ -737,7 +737,7 @@ static void mergemask_sh(int16_t *d, int16_t r, uint16_t mask)
 
 static void mergemask_uw(uint32_t *d, uint32_t r, uint16_t mask)
 {
-    uint32_t bmask = expand_pred_b_data[mask & 0xf];
+    uint32_t bmask = expand_pred_b(mask);
     *d = (*d & ~bmask) | (r & bmask);
 }
 
@@ -748,7 +748,7 @@ static void mergemask_sw(int32_t *d, int32_t r, uint16_t mask)
 
 static void mergemask_uq(uint64_t *d, uint64_t r, uint16_t mask)
 {
-    uint64_t bmask = expand_pred_b_data[mask & 0xff];
+    uint64_t bmask = expand_pred_b(mask);
     *d = (*d & ~bmask) | (r & bmask);
 }
 
-- 
2.34.1


