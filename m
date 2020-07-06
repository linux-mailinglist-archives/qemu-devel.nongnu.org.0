Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFD121627E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 01:49:11 +0200 (CEST)
Received: from localhost ([::1]:36714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsarG-0002Uv-Fa
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 19:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1jsaq4-0000pK-W6
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 19:47:57 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1jsaq3-0000oS-Fn
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 19:47:56 -0400
Received: by mail-pg1-x544.google.com with SMTP id z5so19121449pgb.6
 for <qemu-devel@nongnu.org>; Mon, 06 Jul 2020 16:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BGXGCD6zrewH9FPgdNPWGPrbye7T6uSjNY56yD55Vis=;
 b=tNXhf0jFshtSUnNa5Qem6m0ucSEilZjvfVj8C43G7wFXPhKd24gAsZ7LTzB+uoOqIw
 0sUEkmGui+CTH2zuQSG9T2iOGSnOt7GCAx+XyrA3zUrTdhTF6CJKoKw3uQUFLjY1j9Ts
 Qf12GrxMJjPd/lfH+wq090fFxCoYLA+9alT6m5FAQ098jPqpDXOhgSdqiieRQ1pgVC3r
 Uyx89EuYp7G6lS/YR9uO8rDewrXT74e41PVWqMIGO7cqu0SiJsaNjCJQ8Anud6+KWr86
 EHj0hRa+h3hcQiuY2iqNaTxFQdhh5BudBtRfM2qEPL+RsWphd3cKKxnJBY5pGAbqyvwW
 uD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BGXGCD6zrewH9FPgdNPWGPrbye7T6uSjNY56yD55Vis=;
 b=itc+aOuturOwz0/Y7bW2XTP5l/iIkRtl56Cwq45WkPyRO3u9TVOM1u4yIqabifcpuf
 Aqmlp96rBkyQESvaQgpVJq8WvbIqB74lOj6QcW+R8SX4unIB4sBFNqU3GfazA5NOyKSN
 gwZeESx7S5MmyO/cpMiawxKU3NA5QMPXfleqgVuH2lwXfAC7jVyDwnS9n1Rx3rsSRB/i
 y00UarFO6huVtUzc6e2a7MR3hV6vWUkvpqFYKwTyXC/zMfsQjSBWMwnL6kErzX16onIj
 z0j+WxK+VkKB4i0wLgByC8sIaZTSHqjicoL/g+XuaBxjY3Z3RNkaJFJ4gu2EbHZdLrVK
 c6vg==
X-Gm-Message-State: AOAM5338LBfCvkkN4lVr29P+0asJUYAull4q6laj6O6F50fRS0fmBqSn
 aLvTp0GvIQYkCQdNaqRdtRtNtWyn
X-Google-Smtp-Source: ABdhPJxm/ToJ+zxnFXF6U8i1jVZ8pYiSZbgCL11LVkvSLC20JN+ny9ZakYQxI4rFdJdxxxQDQeFWgQ==
X-Received: by 2002:a63:3f42:: with SMTP id m63mr43552259pga.310.1594079274122; 
 Mon, 06 Jul 2020 16:47:54 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id e15sm19647649pgt.17.2020.07.06.16.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 16:47:53 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/21] softfloat: add xtensa specialization for pickNaNMulAdd
Date: Mon,  6 Jul 2020 16:47:19 -0700
Message-Id: <20200706234737.32378-4-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200706234737.32378-1-jcmvbkbc@gmail.com>
References: <20200706234737.32378-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pickNaNMulAdd logic on Xtensa is the same as pickNaN when applied to
the expression (a * b) + c. So with two pickNaN variants there must be
two pickNaNMulAdd variants.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Alex Bennée" <alex.bennee@linaro.org>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 fpu/softfloat-specialize.inc.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fpu/softfloat-specialize.inc.c b/fpu/softfloat-specialize.inc.c
index e17327b405c5..6b07d50efad3 100644
--- a/fpu/softfloat-specialize.inc.c
+++ b/fpu/softfloat-specialize.inc.c
@@ -574,6 +574,24 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
     } else {
         return 1;
     }
+#elif defined(TARGET_XTENSA)
+    if (status->use_first_nan) {
+        if (is_nan(a_cls)) {
+            return 0;
+        } else if (is_nan(b_cls)) {
+            return 1;
+        } else {
+            return 2;
+        }
+    } else {
+        if (is_nan(c_cls)) {
+            return 2;
+        } else if (is_nan(b_cls)) {
+            return 1;
+        } else {
+            return 0;
+        }
+    }
 #else
     /* A default implementation: prefer a to b to c.
      * This is unlikely to actually match any real implementation.
-- 
2.20.1


