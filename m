Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FED381EE4
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:53:56 +0200 (CEST)
Received: from localhost ([::1]:42762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGHL-0005gD-Ns
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz4-0007RY-Ks
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:03 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:37607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFys-0007md-3W
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:02 -0400
Received: by mail-qk1-x72c.google.com with SMTP id i67so3308791qkc.4
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ni3IITrUvu6KOgaXHOkggF2jGpEbkqCHdxNG/RCcdrM=;
 b=hdUoRcf7f4CQa6H0ztH7P4gUsIcYZv7vSTbNK92r79BO3I7Goe8z7LyvT0u7lZ4ylN
 GgEdBTOxJEQ6IBgi90wAHZrl2X0xzJ32LJkEm5zpzMPuLdR/gGROIOAqaQdgBWwc2+Ac
 4mtoEHKT47WSnONA5KmXqElvqZrFeM4UE1yv25cQNUhEeckWw6V5fzan8axQrpt1Uxmy
 r8N8hrubx80Y2ABr/P083m/WoL6J3kyaNiJ5g7mDvIH3HZ17Mt/YXgBvnUKJMbGocUv0
 h/AzyUgzSeKMyOXnsdUHP7VTEMzxuFFCckOVEjcOnPcgOJDurTEANQhtyppPPeQ2hUyJ
 vsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ni3IITrUvu6KOgaXHOkggF2jGpEbkqCHdxNG/RCcdrM=;
 b=qaP9eyaWDGDsDZ4GqmpLEVZMvn2qBUPa8nORiTGIGCAKLq5Feq6plhjhRddQpQfGVW
 /Ebj/1Mma1l7/6jqUFOMJCDP0DbYRcpBtNEGeNP89umJh9BUd/o16aYQZZmlWIYBGJtO
 UeBnFNsaj+4wFCAYLCyzCQG5ugBGAxlOeCJwTp1vaTyUwX2qzCAL9aSc5S0PQoiJ6ezp
 VfACF4G/7vRbbn3XdF3OTbyE5vXyewD7ql7PfVAFjzTtEWUmKUqd5muMZsNHLBtDGV7y
 wya/I2TeR+8buCl6MRQh+Quj1SVIsjSlOJ1jVSgwTrHLCDP8fZyGfGopQ5GcmQOCvDiO
 FTzQ==
X-Gm-Message-State: AOAM530CTOBiPNXEZseQwzU0gzlkmFwG8dJKsbYbRw4Wue2nohi8JsVF
 jVbLA6js5Ohe7B1LBlIbtyEJlpNvt8jDXjHMSZg=
X-Google-Smtp-Source: ABdhPJzZ5R3aZ0cZ+4hW833j156w98/3V6iM6fArenKFlu9sPzTDbQYIvpONfOTquKME78xkD5L4pQ==
X-Received: by 2002:a37:6257:: with SMTP id w84mr53266861qkb.158.1621168488095; 
 Sun, 16 May 2021 05:34:48 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/46] softfloat: Use pointers with unpack_raw
Date: Sun, 16 May 2021 07:34:03 -0500
Message-Id: <20210516123431.718318-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the same time, rename to unpack_raw64.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index c7f95961cf..5ff9368012 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -580,36 +580,45 @@ static const FloatFmt float64_params = {
 };
 
 /* Unpack a float to parts, but do not canonicalize.  */
-static inline FloatParts64 unpack_raw(FloatFmt fmt, uint64_t raw)
+static void unpack_raw64(FloatParts64 *r, const FloatFmt *fmt, uint64_t raw)
 {
-    const int sign_pos = fmt.frac_size + fmt.exp_size;
+    const int f_size = fmt->frac_size;
+    const int e_size = fmt->exp_size;
 
-    return (FloatParts64) {
+    *r = (FloatParts64) {
         .cls = float_class_unclassified,
-        .sign = extract64(raw, sign_pos, 1),
-        .exp = extract64(raw, fmt.frac_size, fmt.exp_size),
-        .frac = extract64(raw, 0, fmt.frac_size),
+        .sign = extract64(raw, f_size + e_size, 1),
+        .exp = extract64(raw, f_size, e_size),
+        .frac = extract64(raw, 0, f_size)
     };
 }
 
 static inline FloatParts64 float16_unpack_raw(float16 f)
 {
-    return unpack_raw(float16_params, f);
+    FloatParts64 p;
+    unpack_raw64(&p, &float16_params, f);
+    return p;
 }
 
 static inline FloatParts64 bfloat16_unpack_raw(bfloat16 f)
 {
-    return unpack_raw(bfloat16_params, f);
+    FloatParts64 p;
+    unpack_raw64(&p, &bfloat16_params, f);
+    return p;
 }
 
 static inline FloatParts64 float32_unpack_raw(float32 f)
 {
-    return unpack_raw(float32_params, f);
+    FloatParts64 p;
+    unpack_raw64(&p, &float32_params, f);
+    return p;
 }
 
 static inline FloatParts64 float64_unpack_raw(float64 f)
 {
-    return unpack_raw(float64_params, f);
+    FloatParts64 p;
+    unpack_raw64(&p, &float64_params, f);
+    return p;
 }
 
 /* Pack a float from parts, but do not canonicalize.  */
-- 
2.25.1


