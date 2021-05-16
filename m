Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675F7381EE0
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:49:42 +0200 (CEST)
Received: from localhost ([::1]:34156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGDF-00087u-Fj
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz1-0007QQ-L6
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:00 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:39751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyn-0007m1-RT
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:58 -0400
Received: by mail-qk1-x72e.google.com with SMTP id k127so3306122qkc.6
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qvtL26lQB5H4Yj/m9dMuiJ0Pgz43KUosPXD7aZnzb8Q=;
 b=yqZMmentklELMI4XI5PBS46S380dHIIH0ogJd194nWQn3Yrm6/8jBV95zRQKvuWNDR
 oz+aeRqVTjMXMequiCGLYVmWvOtcSOlsJxd6kNb6DIvueIk+2axMhTdzO1UiBqfGiAGa
 PHX2AIDfGteHY0Z6Y1EObvICkWkgv4H+HBErmvaIwYF1xwLOQd789UeMHCiYgYaKoYB4
 26Gxmly6/EyFpa8rPNI6RbHbXR9SkQlXyfXR7tbGgE0budY/bY7FGI+FlW0a3nqTWMCf
 r+z+gH0vwtRxBkJdgr/J1iMnbaBo5vwoM2KWHILN/R8SMoH/EdtJ0qbSvPyZbCqfN1Ak
 /7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qvtL26lQB5H4Yj/m9dMuiJ0Pgz43KUosPXD7aZnzb8Q=;
 b=pqx8wVI53D/JiQmEPlK6AieHgNP1zP50O6eSiFkleAE1qFO0929sR1C7IeliY0/vML
 drdxXCEERJ9tkm14m9wSIAXarD4pmHmniiFaPPepj0KqDmtn87HUDz5gaPH8P4tPYMQ1
 BBDJ0f7rHEn7+R5zO/c+2jNTLkqZeKN/uQO79/mtWymkq7WpigvPhL7PXY8OYnMQgXoh
 3kwgu+Gzs4iDRB4JOEi73iSiBX69fkNtefZz98mM5JkeKvQ+PCIe2ExElwBfs8Eidm4+
 UsZ6j6XSKI31FlicGN9ZWNPYxDdOh9hQ4s+4A23FrppnsIWKH5Et1cRhWTUoCJ9njBYP
 Vv5A==
X-Gm-Message-State: AOAM533RUixt9jsPE+Huar0uCqTbUmAyFepef9DhDJGqF6psn5uQMWUR
 HLqwMHa3SIzc4BvKkUuaF3ypunmRJdgX3+Pejos=
X-Google-Smtp-Source: ABdhPJxW3PkKiWyBXBxG6cWyQYqG/m9QX3ubL3D5NTwhkk/RQMtAQZbqMaG+evZsTo/JK8WcyTgNjw==
X-Received: by 2002:a37:5ca:: with SMTP id 193mr51326402qkf.356.1621168484648; 
 Sun, 16 May 2021 05:34:44 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/46] softfloat: Do not produce a default_nan from
 parts_silence_nan
Date: Sun, 16 May 2021 07:33:59 -0500
Message-Id: <20210516123431.718318-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Require default_nan_mode to be set instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-specialize.c.inc | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 96ed8c1a26..05cb2ee940 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -179,16 +179,15 @@ static FloatParts parts_default_nan(float_status *status)
 static FloatParts parts_silence_nan(FloatParts a, float_status *status)
 {
     g_assert(!no_signaling_nans(status));
-#if defined(TARGET_HPPA)
-    a.frac &= ~(1ULL << (DECOMPOSED_BINARY_POINT - 1));
-    a.frac |= 1ULL << (DECOMPOSED_BINARY_POINT - 2);
-#else
+    g_assert(!status->default_nan_mode);
+
+    /* The only snan_bit_is_one target without default_nan_mode is HPPA. */
     if (snan_bit_is_one(status)) {
-        return parts_default_nan(status);
+        a.frac &= ~(1ULL << (DECOMPOSED_BINARY_POINT - 1));
+        a.frac |= 1ULL << (DECOMPOSED_BINARY_POINT - 2);
     } else {
         a.frac |= 1ULL << (DECOMPOSED_BINARY_POINT - 1);
     }
-#endif
     a.cls = float_class_qnan;
     return a;
 }
-- 
2.25.1


