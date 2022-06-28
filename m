Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAB955BF3D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:49:54 +0200 (CEST)
Received: from localhost ([::1]:34982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65yr-0000pR-Ve
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Fr-0003O1-E4
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:15 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:44961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Fp-00004s-N1
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:15 -0400
Received: by mail-pg1-x52e.google.com with SMTP id v126so6903695pgv.11
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lqFv93ItJHKCx8rfb3Csr21RF/dQfiqOGTpOdE1PXrY=;
 b=brQzbWzcKgPiQuN9jQo/y0wegbplxcfDNNwyXKTNLg8m9iMcGOgffYDWVk640fq0no
 CNPWz0Y7FEHFag2Wf3l2wzcaJLURapML1PyGJn7KavX/KdQvcpRP62uDsuC4hYx/WkHY
 M2VIeCUJuo79A/vzvScEf3GAetUlA0ZTIAodCary1j4me+ZWzhxTn6+dsDRaAVCnbI4h
 2a5H8u0Q9jKtTZ8IGsHOIfo3LjHquBk1j4i/LoL4wrjLCiRSXZWbT0C3s8xpfccOX9HU
 Z4KW040l09D3/mEKg+ZqAfJSGT7UlKKWGXVfa2OVio+CotYuCW9AK8wCyAlO06p9oJfW
 +PiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lqFv93ItJHKCx8rfb3Csr21RF/dQfiqOGTpOdE1PXrY=;
 b=uMFtw1JXPHB7Ub/NlHKaKq2p5B/TeGc/KVE23THk52KLQvT9NTAGvinNiMxh7LSWLD
 PnCEyaSlwvYbjclxiymnXrq5eBUgSZIevBFSGKiZ4zTiAjjp8equdfbWPezzagRq9WaQ
 OqKyie8l2HTQR6UjolnP+0IwegxecLxtk7EDltnh9h5SbuhMQNxN1e5spbAN3zeCcyIC
 2rXUBVRs0S2k/xwLXMJ6IR1BsNr4/SPsvMUmODe4sq1AjCZBzZ/3cV3lzAAL7v+Q7Mqq
 MhMLgPt38E0ILeGzp+F5O12aKkKUrvKMsTeCB5sfh95FWVlAXtMi+12dyWy/7M2+wWMS
 4FMw==
X-Gm-Message-State: AJIora9DQGA1rnP4pSesRUzHn6g+XwtkCWyCyyDImNcMT8HmvGr98wrY
 f0aLcfMqOUGGNqnToL9y0r+8WSImj7YZog==
X-Google-Smtp-Source: AGRyM1udTqu1jK8sS8P6fD5VLRZLUkAi6//72jVovaM7fBzOoknG3O83lvelLDbSqpMZCbHNfqiPDg==
X-Received: by 2002:a05:6a00:2185:b0:520:7276:6570 with SMTP id
 h5-20020a056a00218500b0052072766570mr2801950pfi.84.1656392111018; 
 Mon, 27 Jun 2022 21:55:11 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:55:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 26/60] semihosting: Move GET_ARG/SET_ARG earlier in the file
Date: Tue, 28 Jun 2022 10:23:29 +0530
Message-Id: <20220628045403.508716-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Moving this to be useful for another function
besides do_common_semihosting.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 48 +++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index adb4e5b581..72a1350512 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -181,6 +181,30 @@ static LayoutInfo common_semi_find_bases(CPUState *cs)
 
 #include "common-semi-target.h"
 
+/*
+ * Read the input value from the argument block; fail the semihosting
+ * call if the memory read fails. Eventually we could use a generic
+ * CPUState helper function here.
+ */
+
+#define GET_ARG(n) do {                                 \
+    if (is_64bit_semihosting(env)) {                    \
+        if (get_user_u64(arg ## n, args + (n) * 8)) {   \
+            goto do_fault;                              \
+        }                                               \
+    } else {                                            \
+        if (get_user_u32(arg ## n, args + (n) * 4)) {   \
+            goto do_fault;                              \
+        }                                               \
+    }                                                   \
+} while (0)
+
+#define SET_ARG(n, val)                                 \
+    (is_64bit_semihosting(env) ?                        \
+     put_user_u64(val, args + (n) * 8) :                \
+     put_user_u32(val, args + (n) * 4))
+
+
 /*
  * The semihosting API has no concept of its errno being thread-safe,
  * as the API design predates SMP CPUs and was intended as a simple
@@ -507,30 +531,6 @@ static const GuestFDFunctions guestfd_fns[] = {
     },
 };
 
-/*
- * Read the input value from the argument block; fail the semihosting
- * call if the memory read fails. Eventually we could use a generic
- * CPUState helper function here.
- */
-
-#define GET_ARG(n) do {                                 \
-    if (is_64bit_semihosting(env)) {                    \
-        if (get_user_u64(arg ## n, args + (n) * 8)) {   \
-            goto do_fault;                              \
-        }                                               \
-    } else {                                            \
-        if (get_user_u32(arg ## n, args + (n) * 4)) {   \
-            goto do_fault;                              \
-        }                                               \
-    }                                                   \
-} while (0)
-
-#define SET_ARG(n, val)                                 \
-    (is_64bit_semihosting(env) ?                        \
-     put_user_u64(val, args + (n) * 8) :                \
-     put_user_u32(val, args + (n) * 4))
-
-
 /*
  * Do a semihosting call.
  *
-- 
2.34.1


