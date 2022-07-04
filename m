Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90462565161
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:54:14 +0200 (CEST)
Received: from localhost ([::1]:48606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ImT-0000VQ-M1
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITr-0001Rq-SZ
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:59 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITq-00051p-5O
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:59 -0400
Received: by mail-pf1-x42e.google.com with SMTP id d17so8444601pfq.9
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XqfUuTLR19PvXQJ4YSvSIGy6d7v7mkyGFUM5EeTHK+4=;
 b=r6bjWJ8NikaISdJMDSV3J0g7/0+uQvtuknVFPXutFSNsFli30xDrSC7guGT/jwYWOy
 CcZWjyvysMupkVPozyE5zmd0azZzwyXXsPRWlrD5YWVpC8AvvgT0JxTBsIQYFTi0c66A
 IH/HlFqzPDzanS4igowAUZeL53jDDDLftsj7y/xYrwj7Bxs/4vwU0axYibk7Opaor6f1
 TCxrZ3OPr1M1dmW47BEOOZYXjbzpTC/BAmrkAwR/eq5PkoQHYmHa6MPAE/UdauON1xt4
 cagyIib6xq3sE3I+gsW0ys+44VpKoDaAXFifXZPSVFxrvm7S4U0tVzsEdgMoEnd6gELH
 CapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XqfUuTLR19PvXQJ4YSvSIGy6d7v7mkyGFUM5EeTHK+4=;
 b=vS+3WM7ldU3BXBdr5E9hFztq8L3G8iBUims/r69N/XTCR/vANQhF+LV4tjpMCu73dN
 PBoPWTlv2cspb8u4tNuD9/0zy9fZAHlz0KGCmI11B4VB6R5Gyk9EnmL+QXosDCCGJc73
 0e7sMlKV681M9MSx8e+WhztPdCNskCdkt5DWX58h3WHfo/T2gZIPpUfbk0n/XEw/yU9D
 WKJG9OxR20UydoZwvnhjBRpoayjwF1fNo//f9j1UcBfftcHste9WxZodcIJ5W0BcbMZc
 Pga53HBZZLGkECair5LNrktldsA09lWSS0wZdJWK10kjbdBJvWbVJKWLxVdn1Lr/396a
 xOrA==
X-Gm-Message-State: AJIora87V547lorEmfNf71Mb7TXJxXSS9CUdA5a2uU337DPzR6LNmutp
 9aVOe4QqHzs1gEfl2biMnUvlJ+O27ajWb5xb
X-Google-Smtp-Source: AGRyM1sct9JR3A036gIzjcZ9VOCoJBj9nFvST44cZWaTygDSnstniXpDYqjDpWwumpR6+fMg9IwfGA==
X-Received: by 2002:a63:bf4d:0:b0:40c:4060:f6d with SMTP id
 i13-20020a63bf4d000000b0040c40600f6dmr24843481pgo.254.1656927297027; 
 Mon, 04 Jul 2022 02:34:57 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 20/23] hw/rtc/ls7a_rtc: Use tm struct pointer as arguments in
 toy_time_to_val()
Date: Mon,  4 Jul 2022 15:03:54 +0530
Message-Id: <20220704093357.983255-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Use pointer as arguments in toy_time_to_val() instead of struct tm.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220701093407.2150607-7-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/rtc/ls7a_rtc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
index a36aeea9dd..85cd2d22a5 100644
--- a/hw/rtc/ls7a_rtc.c
+++ b/hw/rtc/ls7a_rtc.c
@@ -125,15 +125,15 @@ static inline void toy_val_to_time_year(uint64_t toy_year, struct tm *tm)
 }
 
 /* parse struct tm to toy value */
-static inline uint64_t toy_time_to_val_mon(struct tm tm)
+static inline uint64_t toy_time_to_val_mon(struct tm *tm)
 {
     uint64_t val = 0;
 
-    val = FIELD_DP32(val, TOY, MON, tm.tm_mon + 1);
-    val = FIELD_DP32(val, TOY, DAY, tm.tm_mday);
-    val = FIELD_DP32(val, TOY, HOUR, tm.tm_hour);
-    val = FIELD_DP32(val, TOY, MIN, tm.tm_min);
-    val = FIELD_DP32(val, TOY, SEC, tm.tm_sec);
+    val = FIELD_DP32(val, TOY, MON, tm->tm_mon + 1);
+    val = FIELD_DP32(val, TOY, DAY, tm->tm_mday);
+    val = FIELD_DP32(val, TOY, HOUR, tm->tm_hour);
+    val = FIELD_DP32(val, TOY, MIN, tm->tm_min);
+    val = FIELD_DP32(val, TOY, SEC, tm->tm_sec);
     return val;
 }
 
@@ -235,7 +235,7 @@ static uint64_t ls7a_rtc_read(void *opaque, hwaddr addr, unsigned size)
     case SYS_TOYREAD0:
         if (toy_enabled(s)) {
             qemu_get_timedate(&tm, s->offset_toy);
-            val = toy_time_to_val_mon(tm);
+            val = toy_time_to_val_mon(&tm);
         } else {
             /* return 0 when toy disabled */
             val = 0;
-- 
2.34.1


