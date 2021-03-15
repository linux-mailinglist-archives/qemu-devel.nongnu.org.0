Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB73733C139
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:07:18 +0100 (CET)
Received: from localhost ([::1]:48844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpkT-0003cR-8S
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLpcC-0006ms-1v
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:58:44 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:41760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLpcA-0004Me-Bj
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:58:43 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 l23-20020a05683004b7b02901b529d1a2fdso5373759otd.8
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jmCEBK3Fc6amVN11BmDrN7jUN/ivvV0qW5Tiif8OXLA=;
 b=YXSWRE/AidQ9nlBz+DRfSk7vUCp4zXAjLD/iPnYGOruNeoRRFkQ6rPFgpdWqv35QbN
 49Yr5zJYBjVj0O/r8C38VZvEULelDSKT5Qtb7rTsUD4p0dQHzIEf6bsnykML28xnIjdj
 +jU76VVc6PZ47TYSA0hena5R+MIvFlHPF2cXzLQylWimWwdXpCogSuOg+ElrgqE84yrM
 WSjKF33ktx7dE3+qZv3bzd+itm4VdtQM5oqjcSl5WM0KzPqpbo05WsKmk3U96a/EQdjk
 Gj82Q8ZblDIx9m/0//bMNwkmUf4q5NuDqGF9PNRJzSy0pXQFHtm+RWxAIckv/Jfl0arm
 tEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jmCEBK3Fc6amVN11BmDrN7jUN/ivvV0qW5Tiif8OXLA=;
 b=i9/ZWkXH+wV6waE7pt7qa6Un6qjUavory8/WWKJmeLDpsbtnTrvf6qElqFhX8S6Ef4
 6xHiTiIuyjNOLYjnDK2gRcL4uzJAzxesYAn11cDvX4EiIciT/ZFt4hrqNlIe3coRkCIu
 iF+cHFyuZ7+xfsnSWQmC+cv0T07Z6BQiG/g8dxO+s7gjsejWBELDCTnvfUum+mlPepmt
 IEwtWNsxLAz4CgC85NlU+wBmyGmCj/QVucHeCLjiqbA6bRp946rw633qmRHMMB9JjAet
 BVIA1Ry52D4AcCiY+1SPktk+M8o2Y/GOKCzv6TttKWiHHRsPnE7HPwYpLobERctZszZb
 y7Lg==
X-Gm-Message-State: AOAM532YLEUgzUk7KQbhjU56YqlgFo88MIcXPbblgLVfIOPbvHel2pZW
 ufDg4hXUAiNU9CAMqhDHL7DC4Q5NUeLGbozh
X-Google-Smtp-Source: ABdhPJwYzea6hvtp72rbNeFVjVs7Xe9+RKB2ova6EbeUMzv/8sYtqtm4klP1F6cUyiRNCQifO5UUlQ==
X-Received: by 2002:a9d:618b:: with SMTP id g11mr14925483otk.313.1615823921044; 
 Mon, 15 Mar 2021 08:58:41 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id h24sm7278548otg.20.2021.03.15.08.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 08:58:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] utils: Use fixed-point arithmetic in qemu_strtosz
Date: Mon, 15 Mar 2021 09:58:35 -0600
Message-Id: <20210315155835.1970210-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315155835.1970210-1-richard.henderson@linaro.org>
References: <20210315155835.1970210-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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
Cc: philmd@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Once we've parsed the fractional value, extract it into an integral
64-bit fraction.  Perform the scaling with integer arithemetic, and
simplify the overflow detection.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/unit/test-cutils.c |  2 +-
 util/cutils.c            | 50 ++++++++++++++++++++++++++++------------
 2 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index bad3a60993..e025b54c05 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -2128,7 +2128,7 @@ static void test_qemu_strtosz_float(void)
     str = "12.345M";
     err = qemu_strtosz(str, &endptr, &res);
     g_assert_cmpint(err, ==, 0);
-    g_assert_cmpint(res, ==, (uint64_t) (12.345 * MiB));
+    g_assert_cmpint(res, ==, (uint64_t) (12.345 * MiB + 0.5));
     g_assert(endptr == str + 7);
 }
 
diff --git a/util/cutils.c b/util/cutils.c
index d89a40a8c3..c442882b88 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -275,10 +275,9 @@ static int do_strtosz(const char *nptr, const char **end,
     int retval;
     const char *endptr, *f;
     unsigned char c;
-    bool mul_required = false, hex = false;
-    uint64_t val;
+    bool hex = false;
+    uint64_t val, valf = 0;
     int64_t mul;
-    double fraction = 0.0;
 
     /* Parse integral portion as decimal. */
     retval = qemu_strtou64(nptr, &endptr, 10, &val);
@@ -308,17 +307,19 @@ static int do_strtosz(const char *nptr, const char **end,
          * without fractional digits.  If we see an exponent, treat
          * the entire input as invalid instead.
          */
+        double fraction;
+
         f = endptr;
         retval = qemu_strtod_finite(f, &endptr, &fraction);
         if (retval) {
-            fraction = 0.0;
             endptr++;
         } else if (memchr(f, 'e', endptr - f) || memchr(f, 'E', endptr - f)) {
             endptr = nptr;
             retval = -EINVAL;
             goto out;
-        } else if (fraction != 0) {
-            mul_required = true;
+        } else {
+            /* Extract into a 64-bit fixed-point fraction. */
+            valf = (uint64_t)(fraction * 0x1p64);
         }
     }
     c = *endptr;
@@ -333,16 +334,35 @@ static int do_strtosz(const char *nptr, const char **end,
         mul = suffix_mul(default_suffix, unit);
         assert(mul > 0);
     }
-    if (mul == 1 && mul_required) {
-        endptr = nptr;
-        retval = -EINVAL;
-        goto out;
+    if (mul == 1) {
+        /* When a fraction is present, a scale is required. */
+        if (valf != 0) {
+            endptr = nptr;
+            retval = -EINVAL;
+            goto out;
+        }
+    } else {
+        uint64_t valh, tmp;
+
+        /* Compute exact result: 64.64 x 64.0 -> 128.64 fixed point */
+        mulu64(&val, &valh, val, mul);
+        mulu64(&valf, &tmp, valf, mul);
+        val += tmp;
+        valh += val < tmp;
+
+        /* Round 0.5 upward. */
+        tmp = valf >> 63;
+        val += tmp;
+        valh += val < tmp;
+
+        /* Report overflow. */
+        if (valh != 0) {
+            retval = -ERANGE;
+            goto out;
+        }
     }
-    if (val > (UINT64_MAX - ((uint64_t) (fraction * mul))) / mul) {
-        retval = -ERANGE;
-        goto out;
-    }
-    *result = val * mul + (uint64_t) (fraction * mul);
+
+    *result = val;
     retval = 0;
 
 out:
-- 
2.25.1


