Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B4D364B68
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:44:16 +0200 (CEST)
Received: from localhost ([::1]:47476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYakh-00041G-G4
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQg-0007Yp-Hc
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:34 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:45776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQe-0002d7-8U
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:34 -0400
Received: by mail-qt1-x82a.google.com with SMTP id u8so27065834qtq.12
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ap4BHmXvGirFCckX758uUzRa4tB4zIAAMsUnY+UVng4=;
 b=C3w8o6SschaGL1FrtssR1xdjzcoLDMqQPvUu5ikYj1WcFiHnRE62WxamlkynhFWF1k
 +0QXuF/92Jw3Cauid35LSpLGcaSACO03V6va25cYhywvqGhDAIkd8r81OybpFf6DvpDH
 CmnpO3IXxJnQBfSuhaSETQvZ2KvowlFfBCor09fJuZMm862+pfZYSXHPu2DMhuoTN5k5
 KShomKY4BVxbbe+Kdt8UMHzjll/FUnYRTSPgpLvlntm6g1NZfTAtDfGvF2cgMIe3Ec96
 DqdUqJ0BNjodNEwP3F9FCjOwEZe9jAXXF0eBkRFDTDkQojtExW67QQ/qvI/OJJ759muT
 ydyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ap4BHmXvGirFCckX758uUzRa4tB4zIAAMsUnY+UVng4=;
 b=shIj//X41DwELd7WPHomG8rsI8SMAXwX9NSJUrRXkWDNEFjKvBbFm9K0ZawgzHJgF9
 B2YeLmv1bVtzY5671SjNxAgas/SYzYX+5Cp7LKz4mDzae11dkEgk6vLjgJRjHkGYyCno
 aRWNVcZOeMvH0C/ayfMeY1spnZD82ZZU2ldR7/M4Wn/t+a85bD1N1U3ZduYKQjWTnxr1
 gsK9sgZWYGgNXNLyv70R72q3KAug19GnLERnnl44guW7N8SOHPAvajFuTy/v/ju42XvA
 KQTnQW9imqyo7S4G7yRFvKuFRrvQCf/7l4gF/lLkLHusXH1Ve+vnhRQm58mPo4xGLcAV
 ewzg==
X-Gm-Message-State: AOAM530qtgH99cHfNckaMspkOZfz0CNN9ArJt69Cflm8sG7w3VoxogG4
 NFxMr7nSx2XvbBB18+w5VY4l1jqT3AmH0EJK
X-Google-Smtp-Source: ABdhPJy4deGElH3u9ayaom1KVuH5YBZEhgzW4fhdVZr3uBEGNNLBkPxqR5CuV5TitZbdiXTReFlNEg==
X-Received: by 2002:ac8:7d87:: with SMTP id c7mr13125355qtd.281.1618863811462; 
 Mon, 19 Apr 2021 13:23:31 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/31] target/arm: Enforce alignment for LDM/STM
Date: Mon, 19 Apr 2021 13:22:43 -0700
Message-Id: <20210419202257.161730-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 29fbbb84b2..f58ac4f018 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7868,7 +7868,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
         } else {
             tmp = load_reg(s, i);
         }
-        gen_aa32_st32(s, tmp, addr, mem_idx);
+        gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         tcg_temp_free_i32(tmp);
 
         /* No need to add after the last transfer.  */
@@ -7943,7 +7943,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
         }
 
         tmp = tcg_temp_new_i32();
-        gen_aa32_ld32u(s, tmp, addr, mem_idx);
+        gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
         if (user) {
             tmp2 = tcg_const_i32(i);
             gen_helper_set_user_reg(cpu_env, tmp2, tmp);
-- 
2.25.1


