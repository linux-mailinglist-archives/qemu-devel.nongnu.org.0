Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B11E57A611
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:06:55 +0200 (CEST)
Received: from localhost ([::1]:39684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrcS-0000f9-C2
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWO-0006IW-BA
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:36 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:37657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWM-0006BV-M1
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:36 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so12303071otu.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7kucxed5pd2yWAJLsvl/juNcXUDwpeqo29sK0pxQgQk=;
 b=rQ4vdTcnXPQo8ZPORv47uUEPEeOGEnnFyR2mVSsvIj9WuOyP4PHiQFh/P9Kwq/NvAX
 KjlJuAjLmmPaxDIWG1YJtm9TW+LydZfIELmJ1VhUc2UFlOWOZnWePX7T4GFEkUKAA7Pb
 4BmYn+uXcRnTySRn+V2LmR3ukXvSOnY6sGGeYtYVg0lzs21u0t2qobKYouBu6yXZSDdY
 VRSW3viENXP/TSFdEF9nYxmVVetrD5zICwMc+NA+dX1mVskFaHAjDiDA6173ivMO5dC3
 JfidYvj7YK6AuHDjZ7gFwyKe0Xmb2XqtMCjb47K/cGKhEREbbprRUWCSSt8Zee3n4zFd
 z8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7kucxed5pd2yWAJLsvl/juNcXUDwpeqo29sK0pxQgQk=;
 b=U+VnPeMGegFKqwV8Diq74BG+ydMAcH2hcayeP2wBtesEgQUV8kjz+QF1E7+ilu6dy3
 eZR7Hp7/r4uuvkHKrv0VyDmFvYUOFmdZ5s5t6twVKuJZN3eVZD8m+UU4VvpulS3cieQc
 wPz6W1kroadE16yeTGEGU7LRZcr+smbtGmUmmFvzjGuqJN4F7vK6Gr+3ONmT0JkWKixs
 ua5CJDM1Iry0bOXq/kfE80dUXNd46JKSG5adWh+1xqbE3BYWnsmEwGUiP+o3b16N3oI+
 Tyha4KmyeZu3oAyq1TRA27olkoXDoqCdNKcrP5NjQLRq+QlnSHoECVUC0mu6gV7y6DOf
 f8Ow==
X-Gm-Message-State: AJIora+QNcy9y3FVmH/jH2ShI2yeUdvatzCENH73sWI4luwHfVW9zLLb
 x5Z1X5BDawZYYIdlYBZ3YEgtM+2+sxXNcaxT
X-Google-Smtp-Source: AGRyM1vXLm7dSA/6W8WRWIMrytah51/2CiAv5WqK56dnku8GF4qAfqE6O4SDAiDEfbH2n0LEB9aUGA==
X-Received: by 2002:a9d:5e16:0:b0:61c:82ef:1d96 with SMTP id
 d22-20020a9d5e16000000b0061c82ef1d96mr9310924oti.184.1658253633209; 
 Tue, 19 Jul 2022 11:00:33 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:00:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 06/21] target/loongarch/op_helper: Fix coverity cond_at_most
 error
Date: Tue, 19 Jul 2022 23:29:45 +0530
Message-Id: <20220719180000.378186-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

The boundary size of cpucfg array should be 0 to ARRAY_SIZE(cpucfg)-1.
So, using index bigger than max boundary to access cpucfg[] must be
forbidden.

Fix coverity CID: 1489760

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220715060740.1500628-6-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index 4b429b6699..568c071601 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -81,7 +81,7 @@ target_ulong helper_crc32c(target_ulong val, target_ulong m, uint64_t sz)
 
 target_ulong helper_cpucfg(CPULoongArchState *env, target_ulong rj)
 {
-    return rj > 21 ? 0 : env->cpucfg[rj];
+    return rj >= ARRAY_SIZE(env->cpucfg) ? 0 : env->cpucfg[rj];
 }
 
 uint64_t helper_rdtime_d(CPULoongArchState *env)
-- 
2.34.1


