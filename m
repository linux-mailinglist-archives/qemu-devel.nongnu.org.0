Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BC156BE5E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:58:42 +0200 (CEST)
Received: from localhost ([::1]:49312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9rJQ-0006XG-Ty
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDV-0006fG-JJ
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:29 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:38442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDT-0002Tp-Pv
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:29 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 89-20020a17090a09e200b001ef7638e536so2313991pjo.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MRrXY542sxSC6HnNhvHgU6gcthc4iZQb6z5fd5sN5yQ=;
 b=oy9P6QLJFpVzQfPTl+1dkA12XPxWvQEkFRK3GHArgM+CAdseCpBg5wOuJY0x6Bnx8T
 Y+oejF7vkJAI7qVs6lbeMy94tEb2BbkHkZyZrzkqbJUzftPAdCRtAaOrhQ08IWjvxBf8
 xS7Z/57NA0/q/HOF8b4N2qgtZVzy7ZZBPt9W8yfdQs2oQUVJ0pDzxtk+YBE7aOO5plWA
 Z0mrBhrBHb4MGxJJA3G7YpKoXc1sOZEtzT8GkdjhHfnJFcUI9+HaCKV+MjdnwRoJ9pmW
 FmKJgHAbfm35PN9ssYUFjoxo7s/Gj97QWbrLk1WuEGLK/1aKzglosxRN8IBYmEDcKU/H
 B95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MRrXY542sxSC6HnNhvHgU6gcthc4iZQb6z5fd5sN5yQ=;
 b=KdbkB7+n6t5f16jnr6TwezIE3pNfDW1Iu0h7qU0CUoP3AJ4BbjWLjXwsXIfdngZDjL
 aau/x2IqXH4fkAWzzF1OFpfGQtQnCLo7hSyATTsYJ9X6mqvepd+xfi8XtSV34iKpOzvj
 8u+GzHrgWXUNKUCy8N8+ofSLajZZVKb/OvH185UlUc/Tt3Vn76Zyu+OC4M6t3A03cY9P
 n3w/37FutO53Gsd6tKFIq+O4/kVJ5XkSc1trU2l0tl0Wdx3JPNF7T9P1nUqTcMnzCYE2
 mjp17ViCQbZ7xW9YYUqmfgAGkt17t0o3lUpF1sSnBPkL5ttUEPtShzv+/7mWPOi/P0z+
 fR1A==
X-Gm-Message-State: AJIora9lCPTSteKRTAFn7coXGtAB/K3ioXHq03dOf6hzgwAMQ3mGKPgP
 P+GppvIbXWuhdaudyl4WXYFwOYLXyzS05ava
X-Google-Smtp-Source: AGRyM1tPqwj0MSFhc/J8aSP+HC/8+OV2TuJxQM0u/I8ZM1CYnielbU/Th4tV2g5pxRRjSunIM/lD6Q==
X-Received: by 2002:a17:90a:3e09:b0:1ef:8399:398b with SMTP id
 j9-20020a17090a3e0900b001ef8399398bmr487886pjc.39.1657295306991; 
 Fri, 08 Jul 2022 08:48:26 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:48:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 27/29] aarch64: Tidy reginfo dumping ahead of ZA state
Date: Fri,  8 Jul 2022 21:16:58 +0530
Message-Id: <20220708154700.18682-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

A misalignment for sve_vl, plus add a bit more space
on the left for the ZA[n] field name.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu_reginfo_aarch64.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index b86864d..9ea0acf 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -183,6 +183,18 @@ static int sve_preg_is_eq(int vq, const void *p1, const void *p2)
     return memcmp(p1, p2, vq * 2) == 0;
 }
 
+static void sve_dump_zreg(FILE *f, int vq, const uint64_t *z)
+{
+    const char *pad = "";
+    int q;
+
+    for (q = 0; q < vq; q++) {
+        fprintf(f, "%s[%-2d] %016" PRIx64 "%016" PRIx64 "\n",
+                pad, q, z[2 * q + 1], z[2 * q]);
+        pad = "           "; /* 11 spaces */
+    }
+}
+
 static void sve_dump_preg(FILE *f, int vq, const uint16_t *p)
 {
     int q;
@@ -211,10 +223,10 @@ static void sve_dump_zreg_diff(FILE *f, int vq, const uint64_t *za,
         uint64_t zb0 = zb[2 * q], zb1 = zb[2 * q + 1];
 
         if (za0 != zb0 || za1 != zb1) {
-            fprintf(f, "%sq%-2d: %016" PRIx64 "%016" PRIx64
+            fprintf(f, "%s[%-2d]: %016" PRIx64 "%016" PRIx64
                     " vs %016" PRIx64 "%016" PRIx64"\n",
                     pad, q, za1, za0, zb1, zb0);
-            pad = "      ";
+            pad = "           "; /* 11 spaces */
         }
     }
 }
@@ -237,19 +249,14 @@ void reginfo_dump(struct reginfo *ri, FILE * f)
 
     if (ri->sve_vl) {
         int vq = sve_vq_from_vl(ri->sve_vl);
-        int q;
 
         fprintf(f, "  vl     : %d\n", ri->sve_vl);
 
         for (i = 0; i < SVE_NUM_ZREGS; i++) {
             uint64_t *z = reginfo_zreg(ri, vq, i);
 
-            fprintf(f, "  Z%-2d q%-2d: %016" PRIx64 "%016" PRIx64 "\n",
-                    i, 0, z[1], z[0]);
-            for (q = 1; q < vq; ++q) {
-                fprintf(f, "      q%-2d: %016" PRIx64 "%016" PRIx64 "\n",
-                        q, z[q * 2 + 1], z[q * 2]);
-            }
+            fprintf(f, "  Z%-2d    : ", i);
+            sve_dump_zreg(f, vq, z);
         }
 
         for (i = 0; i < SVE_NUM_PREGS + 1; i++) {
@@ -312,7 +319,7 @@ void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
     }
 
     if (m->sve_vl != a->sve_vl) {
-        fprintf(f, "  vl    : %d vs %d\n", m->sve_vl, a->sve_vl);
+        fprintf(f, "  vl     : %d vs %d\n", m->sve_vl, a->sve_vl);
     }
 
     if (m->sve_vl) {
@@ -323,7 +330,7 @@ void reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
             uint64_t *za = reginfo_zreg(a, vq, i);
 
             if (!sve_zreg_is_eq(vq, zm, za)) {
-                fprintf(f, "  Z%-2d ", i);
+                fprintf(f, "  Z%-2d    : ", i);
                 sve_dump_zreg_diff(f, vq, zm, za);
             }
         }
-- 
2.34.1


