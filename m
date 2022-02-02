Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337CE4A791D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:59:05 +0100 (CET)
Received: from localhost ([::1]:50540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFLmR-0007VD-Am
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:59:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFL3f-0000p3-He
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:12:48 -0500
Received: from [2a00:1450:4864:20::329] (port=35715
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFL3d-00076B-P6
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:12:47 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 f80-20020a1c1f53000000b0035399b8bedcso5089813wmf.0
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 11:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cVqzLTk554WZOO+XZFbwn8o1c5aR1NKLbErrI/M/iPM=;
 b=x1aKfjiaWMxkQBB6DM+ClwgQPa5KtgysGU4+rWyRRySKbUwQFtFsfrTbj/Y911zYTk
 WnPu5rsDu3enr33rT5tqp3DK0dcoJUVXW7SJlKI8zwRZk/1YPVJj/adFFd8oW6C4JZ6C
 +gKiQQXhDISoq3Jq0e50WOA/YPny3g66mnzZqqhzSVdMiWw4hJIcIb+blHZRetMwInFQ
 uC0rn7Kf8U+K0+JS2d/seJsb8K2lod03hpchtYpo6qF6UzwVEHz0hMo0fw60Qhvgwfer
 s879gmVFyw9nXYUCgXbyEmc0MqbGFzNggVz7S3ocsrLNhcrrZyHvOrobG2FMzd0w0UXX
 zWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cVqzLTk554WZOO+XZFbwn8o1c5aR1NKLbErrI/M/iPM=;
 b=PAduta3WJjiJoPauUU1xYS5EGRqxDeG+1P94O4TAammasFnAjsvMDvaWKBxnmFXmky
 e+v2BbYn7X5UivB8g5ZdrdLT06WLi+rjXTjbLfHrm3i5AJtbPEMCFlYfSMbSJ4ZPMSE6
 edMh2gzKA/aD3fEaObvopw6Q5zpC99WaZiuyjcaK53g7JSMn4dkfE8ReXbco11D3nbCK
 NIU67769DBdqiKew4gnMvCwhnOqDiKWdyFpIr89WybSbUo5aQSByyOEhakutM4L0kSi6
 49bHeaYip9lINfpAOOfCZzpnhELcQkQGwOY0vThsJ+9J9FapP26rw/962yBS2w3BQqGW
 IDsA==
X-Gm-Message-State: AOAM530Sy8ZUDMbXmubp5ac5XyDS/GMq2ttp/ktpnEWScbvD6vFm27aQ
 ngGZxKAp5cgxaiTxPYqI9gd3nw==
X-Google-Smtp-Source: ABdhPJyevkyqI3m49x0q8F/U3gn/UWRG/oPowzykY0/rwL4IV8JDi/41ptt4l9EaAvVc2Bru5/RUZw==
X-Received: by 2002:a05:600c:4341:: with SMTP id
 r1mr7412505wme.99.1643829164259; 
 Wed, 02 Feb 2022 11:12:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f13sm17900966wrp.105.2022.02.02.11.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 11:12:43 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D96591FFB8;
 Wed,  2 Feb 2022 19:12:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH  1/4] tests/tcg: cleanup sha1 source code
Date: Wed,  2 Feb 2022 19:12:39 +0000
Message-Id: <20220202191242.652607-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202191242.652607-1-alex.bennee@linaro.org>
References: <20220202191242.652607-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a lot of legacy mess in this imported code which makes
figuring out what is going on harder. Clean it up:

  - delete non-SHA1HANDSOFF legs, remove symbol
  - don't bother clearing variables at the end
  - remove #if 0 dead code
  - some light indentation fixes

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/sha1.c | 67 ++++++++++----------------------------
 1 file changed, 17 insertions(+), 50 deletions(-)

diff --git a/tests/tcg/multiarch/sha1.c b/tests/tcg/multiarch/sha1.c
index 0081bd7657..3b1e18f3d4 100644
--- a/tests/tcg/multiarch/sha1.c
+++ b/tests/tcg/multiarch/sha1.c
@@ -17,9 +17,6 @@ A million repetitions of "a"
 */
 
 /* #define LITTLE_ENDIAN * This should be #define'd already, if true. */
-/* #define SHA1HANDSOFF * Copies data before messing with it. */
-
-#define SHA1HANDSOFF
 
 #include <stdio.h>
 #include <string.h>
@@ -69,24 +66,17 @@ void SHA1Final(unsigned char digest[20], SHA1_CTX* context);
 
 /* Hash a single 512-bit block. This is the core of the algorithm. */
 
-void SHA1Transform(uint32_t state[5], const unsigned char buffer[64])
+inline void SHA1Transform(uint32_t state[5], const unsigned char buffer[64])
 {
-uint32_t a, b, c, d, e;
-typedef union {
-    unsigned char c[64];
-    uint32_t l[16];
-} CHAR64LONG16;
-#ifdef SHA1HANDSOFF
-CHAR64LONG16 block[1];  /* use array to appear as a pointer */
-    memcpy(block, buffer, 64);
-#else
-    /* The following had better never be used because it causes the
-     * pointer-to-const buffer to be cast into a pointer to non-const.
-     * And the result is written through.  I threw a "const" in, hoping
-     * this will cause a diagnostic.
-     */
-CHAR64LONG16* block = (const CHAR64LONG16*)buffer;
-#endif
+    uint32_t a, b, c, d, e;
+    typedef union {
+        unsigned char c[64];
+        uint32_t l[16];
+    } CHAR64LONG16;
+
+    CHAR64LONG16 block[1];  /* use array to appear as a pointer */
+    memcpy(&block[0], buffer, sizeof(block));
+
     /* Copy context->state[] to working vars */
     a = state[0];
     b = state[1];
@@ -120,14 +110,8 @@ CHAR64LONG16* block = (const CHAR64LONG16*)buffer;
     state[2] += c;
     state[3] += d;
     state[4] += e;
-    /* Wipe variables */
-    a = b = c = d = e = 0;
-#ifdef SHA1HANDSOFF
-    memset(block, '\0', sizeof(block));
-#endif
 }
 
-
 /* SHA1Init - Initialize new context */
 
 void SHA1Init(SHA1_CTX* context)
@@ -146,8 +130,8 @@ void SHA1Init(SHA1_CTX* context)
 
 void SHA1Update(SHA1_CTX* context, const unsigned char* data, uint32_t len)
 {
-uint32_t i;
-uint32_t j;
+    uint32_t i;
+    uint32_t j;
 
     j = context->count[0];
     if ((context->count[0] += len << 3) < j)
@@ -171,32 +155,15 @@ uint32_t j;
 
 void SHA1Final(unsigned char digest[20], SHA1_CTX* context)
 {
-unsigned i;
-unsigned char finalcount[8];
-unsigned char c;
-
-#if 0	/* untested "improvement" by DHR */
-    /* Convert context->count to a sequence of bytes
-     * in finalcount.  Second element first, but
-     * big-endian order within element.
-     * But we do it all backwards.
-     */
-    unsigned char *fcp = &finalcount[8];
-
-    for (i = 0; i < 2; i++)
-    {
-        uint32_t t = context->count[i];
-        int j;
-
-        for (j = 0; j < 4; t >>= 8, j++)
-            *--fcp = (unsigned char) t;
-    }
-#else
+    unsigned i;
+    unsigned char finalcount[8];
+    unsigned char c;
+
     for (i = 0; i < 8; i++) {
         finalcount[i] = (unsigned char)((context->count[(i >= 4 ? 0 : 1)]
          >> ((3-(i & 3)) * 8) ) & 255);  /* Endian independent */
     }
-#endif
+
     c = 0200;
     SHA1Update(context, &c, 1);
     while ((context->count[0] & 504) != 448) {
-- 
2.30.2


