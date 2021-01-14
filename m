Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665F72F5733
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 03:24:50 +0100 (CET)
Received: from localhost ([::1]:54906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzsJd-0003ld-El
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 21:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCP-0003aw-Bi
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:22 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:34212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCI-0003Sp-Rd
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:19 -0500
Received: by mail-pj1-x102e.google.com with SMTP id my11so3198059pjb.1
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 18:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ukQ7RjPHGqGDNjwPl9c9BeoLOp2dRJAKhrKe0DnYWUg=;
 b=gtc4joOehf/F6/cXYanWxoNiRQghhJuG5QFJHE9gXZopLyzGOtSweO5P9Fv7WuE28H
 sbXi4/K+CShToreJGXxlaPBqSrPa8CdRo0yFB9dxisLaSOGXc7w/eX/CdcQ45R9DH7yX
 0mEIgSAFZfFWM99xT28AOPaQL0+l7T80jMPJAqOGN9KNVy5V1lj6nN98kxi9xZMS6QEd
 DJfYj1b3XO5hjfNTOgAdjZGwwpSbAj9CHBuBKDLhqplRMC1JpCDuun5LvEb2ZJ6at/as
 Wlyc7HE9PIUH8ujS/GgNyzOl0gzLEpOPFNc/bPGunSt1kHqjMmz9pVI/jsoErjjWIuRH
 /IDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ukQ7RjPHGqGDNjwPl9c9BeoLOp2dRJAKhrKe0DnYWUg=;
 b=pX8RBzQZqmmsX58CyMucVXjVTfiQfZKozwLL71ByN+n0fsVYMYIsaDSCLBut0BapKV
 KOFKtZ/doSXDcjCthBAJ0oHeQcQWgIQ4P/Shgr8qKKgb3KaECiPetp6vdb7j33e1uCwl
 4SlCWcRWzbCsj3F0LrZ6QIt1xeTZIHnzHftsOSR0uyJkPFssQUHepTfNDEkN77KO+fpi
 lG4Q9gU/q00T32Dwg5VCuhtQX+osglRN6tmh+VpoRN33G/a249un+C3WlGmJmi0guAPl
 z4b6bpmRRgQxxFBKSTm61+/KRQVzgGYnEYu7zCsNpJTnynzbcmG1zap3jj2CE3AaF1+m
 QmYw==
X-Gm-Message-State: AOAM530Q0HtXX+1W0ryR4OgROMyKQUHdw9Yl468Er7px6OHkDC7ob5r+
 fM5nj+p+R/TncLoZ7JsdLSK+NVCobdNGHg==
X-Google-Smtp-Source: ABdhPJwnlCGGBw1Wf+8HzJVoGgsz6ho870UL+UnsJ+CUiu1aImgW3XoEMtthF22Pxe3eRl6FdQwASw==
X-Received: by 2002:a17:902:b616:b029:da:fcfd:7568 with SMTP id
 b22-20020a170902b616b02900dafcfd7568mr5398496pls.35.1610590633409; 
 Wed, 13 Jan 2021 18:17:13 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i7sm3771687pfc.50.2021.01.13.18.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:17:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/24] tcg/optimize: Improve find_better_copy
Date: Wed, 13 Jan 2021 16:16:39 -1000
Message-Id: <20210114021654.647242-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114021654.647242-1-richard.henderson@linaro.org>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prefer TEMP_CONST over anything else.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 16b0aa7229..e42f9c89a8 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -122,31 +122,28 @@ static void init_arg_info(TempOptInfo *infos,
 
 static TCGTemp *find_better_copy(TCGContext *s, TCGTemp *ts)
 {
-    TCGTemp *i;
+    TCGTemp *i, *g, *l;
 
-    /* If this is already a global, we can't do better. */
-    if (ts->kind >= TEMP_GLOBAL) {
+    /* If this is already readonly, we can't do better. */
+    if (temp_readonly(ts)) {
         return ts;
     }
 
-    /* Search for a global first. */
+    g = l = NULL;
     for (i = ts_info(ts)->next_copy; i != ts; i = ts_info(i)->next_copy) {
-        if (i->kind >= TEMP_GLOBAL) {
+        if (temp_readonly(i)) {
             return i;
-        }
-    }
-
-    /* If it is a temp, search for a temp local. */
-    if (ts->kind == TEMP_NORMAL) {
-        for (i = ts_info(ts)->next_copy; i != ts; i = ts_info(i)->next_copy) {
-            if (i->kind >= TEMP_LOCAL) {
-                return i;
+        } else if (i->kind > ts->kind) {
+            if (i->kind == TEMP_GLOBAL) {
+                g = i;
+            } else if (i->kind == TEMP_LOCAL) {
+                l = i;
             }
         }
     }
 
-    /* Failure to find a better representation, return the same temp. */
-    return ts;
+    /* If we didn't find a better representation, return the same temp. */
+    return g ? g : l ? l : ts;
 }
 
 static bool ts_are_copies(TCGTemp *ts1, TCGTemp *ts2)
-- 
2.25.1


