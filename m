Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8D73ADA2E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 15:44:57 +0200 (CEST)
Received: from localhost ([::1]:53732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lubHN-0001HL-00
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 09:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lubEz-0004Zg-1h
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 09:42:30 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:34705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lubEq-00082Z-2B
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 09:42:28 -0400
Received: by mail-pl1-x632.google.com with SMTP id h1so6135166plt.1
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 06:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dmNnvecqX0hYql4TUxzQSGInY+sbhElg47l+/R1+N+A=;
 b=LytYMtnsYuh2hV09DrZXb1O7PvYc+bH4l0VxPGg1/IbMaed414L492vkXSvcjeQLxL
 DUdKawiiFlI3e+7KX+fm73/ffvmBzdxOCs/vZK/Kz+W9zD+ZLauZEBjFlwBivy22yTsC
 eWNUalEkDw6v7ez6pQucnRorjiwF6qfS6qGwi2vjs/TdPUpBFgRJP1yqinaM+fZIVJdJ
 +gtBRQDXrCWBm6JoArtyN3Q6vVCgamUBxR7Ay9OpVic3tH1VdYNuHcOQjVJvKagYFpwF
 vWXqpcaHYZHLstf7sl7kGhSAmUZum9dvRyQyV+32LOAknFz7PZCyMKmP2EAcvkjGeCBw
 fICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dmNnvecqX0hYql4TUxzQSGInY+sbhElg47l+/R1+N+A=;
 b=tCVmvd6LSL3PX4QSWOD6ZCiTee89t1StcTt+ks7S+6F73PQpfJn26lVrJuoZa9+t+m
 Fl/LJbQFs2pP6pNyNUCwNWrUnqqwG0ieSNs5YA8PnsHtonk37/lZdCFyQU1w4BBCB1p8
 kZ0bjfb4FsKpMP41cpGDGArxN3xuW6E99KMIPMKQG2P/hCNnzYHAxQ31GIrJp3tPw7LX
 gM3+NHV6T0YIBC9NgUbX5dHsxwotPKQ1FA1EekWEK4zGKzgK3DkViTgF5tgX3mNWaq6s
 ummbk2OCO6/MGJOmdUwAqhPytuYTetfVVAaTiYJ3sxRBv0rfPWMdzHHbSdWFCJ4RMjLm
 kP1Q==
X-Gm-Message-State: AOAM530bdCYwdAEXWuUzlU0We6AkTSCRwTubE1GPr/VCOCHdu7JuVH+n
 bXT89+J/P+foNzvnfLBfQslZiBrJrCeBag==
X-Google-Smtp-Source: ABdhPJydJckaiTQ7u++8fap5lJj17B6yNPOFOLN5X/Ge1Q1GvHrt9SA+kiiz3LBGIpoBY9DPy1cpXw==
X-Received: by 2002:a17:902:7792:b029:fc:e490:ff9f with SMTP id
 o18-20020a1709027792b02900fce490ff9fmr9340055pll.27.1624110138792; 
 Sat, 19 Jun 2021 06:42:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y20sm12331511pfb.207.2021.06.19.06.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 06:42:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] tcg: Allocate sufficient storage in temp_allocate_frame
Date: Sat, 19 Jun 2021 06:42:15 -0700
Message-Id: <20210619134216.590423-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619134216.590423-1-richard.henderson@linaro.org>
References: <20210619134216.590423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function should have been updated for vector types
when they were introduced.

Fixes: d2fd745fe8b
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/367
Cc: qemu-stable@nongnu.org
Tested-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 52e858523c..47cc66f159 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3015,17 +3015,39 @@ static void check_regs(TCGContext *s)
 
 static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
 {
-    if (s->current_frame_offset + (tcg_target_long)sizeof(tcg_target_long) >
-        s->frame_end) {
-        tcg_abort();
+    size_t size, align;
+    intptr_t off;
+
+    switch (ts->type) {
+    case TCG_TYPE_I32:
+        size = align = 4;
+        break;
+    case TCG_TYPE_I64:
+    case TCG_TYPE_V64:
+        size = align = 8;
+        break;
+    case TCG_TYPE_V128:
+        size = align = 16;
+        break;
+    case TCG_TYPE_V256:
+        /* Note that we do not require aligned storage for V256. */
+        size = 32, align = 16;
+        break;
+    default:
+        g_assert_not_reached();
     }
-    ts->mem_offset = s->current_frame_offset;
+
+    assert(align <= TCG_TARGET_STACK_ALIGN);
+    off = ROUND_UP(s->current_frame_offset, align);
+    assert(off + size <= s->frame_end);
+    s->current_frame_offset = off + size;
+
+    ts->mem_offset = off;
 #if defined(__sparc__)
     ts->mem_offset += TCG_TARGET_STACK_BIAS;
 #endif
     ts->mem_base = s->frame_temp;
     ts->mem_allocated = 1;
-    s->current_frame_offset += sizeof(tcg_target_long);
 }
 
 static void temp_load(TCGContext *, TCGTemp *, TCGRegSet, TCGRegSet, TCGRegSet);
-- 
2.25.1


