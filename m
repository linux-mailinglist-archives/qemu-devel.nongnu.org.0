Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C74381EEE
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:59:18 +0200 (CEST)
Received: from localhost ([::1]:58900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGMX-00083q-M3
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz8-0007WG-Jz
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:06 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:46729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyu-0007mm-6u
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:06 -0400
Received: by mail-qt1-x82d.google.com with SMTP id m13so2984845qtk.13
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SSsnZ91q8QYxYfIeEERPVDuhgJY0Ge1EGClwWnWfqNg=;
 b=aEjx55rvfM2q0aWQEtXILk1yqJmsfESPdxI47NnXiXmAWZzOtt4I5xiyBGDLfobLyr
 r9DEY3zdDtJ8Hy5WfTzxQlsCx0QgfdeAkt7DYqMouz/ixlbkRE4ldxOS4brDW1+/rxhH
 9qxU5UV/sG+d7MrHPNzL0Q9UtJac8i3azF1BUbjREswFEHLDCiSGIdkMVhoIa+cyaDu9
 /qBymHTP9BRHZQVZKQ8ftmhxIrxRo5RqBo2yNSW/qshZ7j6jZWcYqTiYA4Xw4VBBu4ms
 /XAcqS/EsDIe/b0FZ3A7cn6gPT24dYQI47eoSC57HqDmEi//hmt9Ka83un1KqFl4X37q
 EKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SSsnZ91q8QYxYfIeEERPVDuhgJY0Ge1EGClwWnWfqNg=;
 b=BbMBP4TR6lJqdYmRhr1czT0Dlg2utCGBx97RayY/V1KYeZZSHy/VPEdNiKD/rDwZQ9
 OZL9iiXGSyE/Z1fzFGPAWr2z9YO48ggBywpJCL2IYRrKVGahD9UHvcLoue6Fu2AHwn7Z
 HM923DF1g8CQTyU3zRY3UZUE/kaEdGOHbbmkuvAGquD1uEMgxU8mb4Q1L7kgf+66b7xB
 5uxwqyYwzrJhcSski4jKvwX322Q7+aeCvdysH4HG3XiWSvw211jf0Y1ci7DAPis7A80m
 ioS2cLsNChYH1GnB3BffH/zCi9GqWnbLcrb2Y6d5YIYJXwxG9+xAoQliiyTKYe0TLKUr
 NFBA==
X-Gm-Message-State: AOAM531vsS4kIz1go67gERcoUOzH/m2SSb26k7O6YvLYZ37xfUUNkIhR
 5V73OWItlrVo54pb6QTgnZjpaUWKJAGtEuM/n7g=
X-Google-Smtp-Source: ABdhPJwnYrXFSiI24U8GMI4nRLgshs8o/RrN9+yqyNc9KKYJ/y3eHeXyuokjMGSYG9sXoaffKBGmMw==
X-Received: by 2002:a05:622a:1044:: with SMTP id
 f4mr36340056qte.181.1621168489511; 
 Sun, 16 May 2021 05:34:49 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/46] softfloat: Use pointers with pack_raw
Date: Sun, 16 May 2021 07:34:05 -0500
Message-Id: <20210516123431.718318-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the same time, rename to pack_raw64.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 5a736a46cf..b59b777bca 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -614,31 +614,36 @@ static inline void float64_unpack_raw(FloatParts64 *p, float64 f)
 }
 
 /* Pack a float from parts, but do not canonicalize.  */
-static inline uint64_t pack_raw(FloatFmt fmt, FloatParts64 p)
+static uint64_t pack_raw64(const FloatParts64 *p, const FloatFmt *fmt)
 {
-    const int sign_pos = fmt.frac_size + fmt.exp_size;
-    uint64_t ret = deposit64(p.frac, fmt.frac_size, fmt.exp_size, p.exp);
-    return deposit64(ret, sign_pos, 1, p.sign);
+    const int f_size = fmt->frac_size;
+    const int e_size = fmt->exp_size;
+    uint64_t ret;
+
+    ret = (uint64_t)p->sign << (f_size + e_size);
+    ret = deposit64(ret, f_size, e_size, p->exp);
+    ret = deposit64(ret, 0, f_size, p->frac);
+    return ret;
 }
 
 static inline float16 float16_pack_raw(FloatParts64 p)
 {
-    return make_float16(pack_raw(float16_params, p));
+    return make_float16(pack_raw64(&p, &float16_params));
 }
 
 static inline bfloat16 bfloat16_pack_raw(FloatParts64 p)
 {
-    return pack_raw(bfloat16_params, p);
+    return pack_raw64(&p, &bfloat16_params);
 }
 
 static inline float32 float32_pack_raw(FloatParts64 p)
 {
-    return make_float32(pack_raw(float32_params, p));
+    return make_float32(pack_raw64(&p, &float32_params));
 }
 
 static inline float64 float64_pack_raw(FloatParts64 p)
 {
-    return make_float64(pack_raw(float64_params, p));
+    return make_float64(pack_raw64(&p, &float64_params));
 }
 
 /*----------------------------------------------------------------------------
-- 
2.25.1


