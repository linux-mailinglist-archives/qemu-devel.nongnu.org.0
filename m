Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8DA68AB4D
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:37:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLU2-00057l-W7; Sat, 04 Feb 2023 11:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTh-00050y-IY
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:39 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTf-0002UX-86
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:24 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 t12-20020a17090aae0c00b00229f4cff534so10048275pjq.1
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mc7bB5r5zBnJDhnppWeIynu+SVvx916JKpMJZLsgtRo=;
 b=PMXEgftxDNe6yRFCHIT/Dcg4eNbFe9emV67R3fDFiqFGM6/49nzad4Nx90uQ5o1NGM
 OY9NAJrTgAQPi6SjbV6N47dQ/QfjOy0OK2g6DhAsdPYQTUTmkdUz21o0XIVnpZIxyHkx
 Vk9m1QZpfLpLeReAtl97COIQ77wCmfDCU/fieBrMqF6BLv56VfjB3t1bzuJF7SbDTRAZ
 ytKtdvhSlQFZbcscw+SyVvxHWI2ETIH99wdEIKl7ylBsjpwLBVzgNn8MY5I2DB092qPl
 rpQXKFBD2PsZmvysEgfkKn5vnZru5P8L6CnqafMSasUI5FgDt8Pd4kNxv6R9PKGOub3k
 IZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mc7bB5r5zBnJDhnppWeIynu+SVvx916JKpMJZLsgtRo=;
 b=b5QS2ji/mtoAXFpm3fglzhyL/YQrACkSTi0g2/e4LTwJTwK6bSQz/zJ+oVgsis4bkw
 RASnAxhNSPdQLOMQ91KkUqlNaBPuwR0Ra8VyMQ2bD1c3YPqzhG6kZ0VtfyvafjeNNZBN
 zusngCDNMiqElSPiApx99sGrzMJlM4H5ythhDg88G2deEB92bEHKP4DyWgcyhAYVnvdy
 jsh5eEOh2KTomBOkZ3esBxClr3yEla60OgDmydSsg2rRA2hCluRz+64/A0Fy/m1xNf+I
 LLGEwdo6JQ4UlZQpfLAEP8fSOEOXUBhLazjOXNzY6HCsCP9qWrIb1qMKN6ApXolZjPve
 cDog==
X-Gm-Message-State: AO0yUKWoEge/6tBGfBLfqW1XO8hwmwo4Xf+n2HugeS5K3W5hcPd+Rfzn
 hgkuHEm0lMHnUFPHZgND9SNLmCd9/FQY/IU8
X-Google-Smtp-Source: AK7set+GaBcVLgXuK4xVWHqoJSbnfZuz2VB7nNXJNaY33Ubc7qVoeqbZs9UAuMyY8F7/DQ7MzOsDMw==
X-Received: by 2002:a17:902:e394:b0:198:e13e:e73e with SMTP id
 g20-20020a170902e39400b00198e13ee73emr4499330ple.53.1675528401670; 
 Sat, 04 Feb 2023 08:33:21 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 05/40] tcg: Allocate objects contiguously in temp_allocate_frame
Date: Sat,  4 Feb 2023 06:32:35 -1000
Message-Id: <20230204163310.815536-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When allocating a temp to the stack frame, consider the
base type and allocate all parts at once.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index bc7198e5d0..cdfc50b164 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3267,11 +3267,12 @@ static bool liveness_pass_2(TCGContext *s)
 
 static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
 {
-    int size = tcg_type_size(ts->type);
-    int align;
     intptr_t off;
+    int size, align;
 
-    switch (ts->type) {
+    /* When allocating an object, look at the full type. */
+    size = tcg_type_size(ts->base_type);
+    switch (ts->base_type) {
     case TCG_TYPE_I32:
         align = 4;
         break;
@@ -3302,13 +3303,30 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
         tcg_raise_tb_overflow(s);
     }
     s->current_frame_offset = off + size;
-
-    ts->mem_offset = off;
 #if defined(__sparc__)
-    ts->mem_offset += TCG_TARGET_STACK_BIAS;
+    off += TCG_TARGET_STACK_BIAS;
 #endif
-    ts->mem_base = s->frame_temp;
-    ts->mem_allocated = 1;
+
+    /* If the object was subdivided, assign memory to all the parts. */
+    if (ts->base_type != ts->type) {
+        int part_size = tcg_type_size(ts->type);
+        int part_count = size / part_size;
+
+        /*
+         * Each part is allocated sequentially in tcg_temp_new_internal.
+         * Jump back to the first part by subtracting the current index.
+         */
+        ts -= ts->temp_subindex;
+        for (int i = 0; i < part_count; ++i) {
+            ts[i].mem_offset = off + i * part_size;
+            ts[i].mem_base = s->frame_temp;
+            ts[i].mem_allocated = 1;
+        }
+    } else {
+        ts->mem_offset = off;
+        ts->mem_base = s->frame_temp;
+        ts->mem_allocated = 1;
+    }
 }
 
 /* Assign @reg to @ts, and update reg_to_temp[]. */
-- 
2.34.1


