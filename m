Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FECA3CC099
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 03:44:16 +0200 (CEST)
Received: from localhost ([::1]:50770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4ZNH-0008NG-ET
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 21:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4ZKa-0000pn-3d
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 21:41:28 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:33512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4ZKY-0000xL-50
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 21:41:27 -0400
Received: by mail-pg1-x529.google.com with SMTP id 37so11776330pgq.0
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 18:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jzyzTgwtvr8cL7SL4244DrybGOaLuPJ3lUTmoddAPyo=;
 b=kZ0GuNGlRX3/NNO9jcWNw3WHsC8H/iZ8ZJyj7RbBNMafCfL+kOBHn3vFB6RYdAJZj/
 qWjzBRf5lfpNYHBUdo4BAp1sC1nIYoO7LSFXPYQ2JHn3KBshzX98E4Zoa806ufgzlPQp
 l/LZ69DNm7nBhrHQibCS2aaj+yeleQ87JvlBF67xRiMeqPDwwT/baZn203dogGX8PWC+
 YL6/UuIUOwAuNkgLalqAJjFAM4xp+w0fPJ6pTZyLK6D34i0jfeH3JM+HSBuZfWqDV9Ga
 igLyiRtQTdbig0+rFZq3UTEJ/3gdk5cHG2ssVz9+IW7XDmyEAHSOEX9SR7tHW5GbyEYA
 5BxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jzyzTgwtvr8cL7SL4244DrybGOaLuPJ3lUTmoddAPyo=;
 b=Lg9QRYwiLUwqgiE+j0SDdQP+4+kz63l8MES4XqJtS6+alUUErHtzS0m4oEEcicjVtg
 Si+8vbjpt8gTigz6hh1hF0Iz2JYBL95dLeDepzS5b0M4btNexnqsIKUMK/LFriD9iotg
 Mm5ds6MccU6EK27fVH/Xk4++JF+dWoNO0KmGjX4JZyRAASw0X4ZFToPuajeeyBoLrGDX
 iweD65949XT9udi9/pPXX5UfnlfiTsreaT8xdkMSqb5TdaH5B55URVTPyN+AIRlItrRk
 TNKK2uRCs1RWEL2gAXT6hctUyTzdTBwLUJV9/oFXP8KR1xUmJslYgXjCFI0U61tCpHjh
 4Utg==
X-Gm-Message-State: AOAM531M7dmS/WP7mi6r4OO28CbxMBRirlKgH6hBzMD8NBNLoh0zhceH
 8Fx033+g/jJgxjXjRkl8BIcTh8870Zbcvg==
X-Google-Smtp-Source: ABdhPJwOQpGe3CMDb+7uL0OplNOmbtbCqxKA7uNr2GBA923o2uWekKNC8JWIycWa69znVprFsfRyQA==
X-Received: by 2002:aa7:9626:0:b029:32a:f13b:7ab3 with SMTP id
 r6-20020aa796260000b029032af13b7ab3mr13319386pfg.43.1626486084651; 
 Fri, 16 Jul 2021 18:41:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id q18sm12812738pgj.8.2021.07.16.18.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 18:41:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/11] qemu/atomic: Simplify typeof_strip_qual
Date: Fri, 16 Jul 2021 18:41:12 -0700
Message-Id: <20210717014121.1784956-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717014121.1784956-1-richard.henderson@linaro.org>
References: <20210717014121.1784956-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The right-hand side of the comma operator has the type quals
stripped without also undergoing implicit promotion.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/atomic.h | 41 ++++-------------------------------------
 1 file changed, 4 insertions(+), 37 deletions(-)

diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index 99d6030095..55d75fc757 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -18,47 +18,14 @@
 /* Compiler barrier */
 #define barrier()   ({ asm volatile("" ::: "memory"); (void)0; })
 
-/* The variable that receives the old value of an atomically-accessed
+/*
+ * The variable that receives the old value of an atomically-accessed
  * variable must be non-qualified, because atomic builtins return values
  * through a pointer-type argument as in __atomic_load(&var, &old, MODEL).
  *
- * This macro has to handle types smaller than int manually, because of
- * implicit promotion.  int and larger types, as well as pointers, can be
- * converted to a non-qualified type just by applying a binary operator.
+ * Handle this by evaluating an expression involving the comma operator.
  */
-#define typeof_strip_qual(expr)                                                    \
-  typeof(                                                                          \
-    __builtin_choose_expr(                                                         \
-      __builtin_types_compatible_p(typeof(expr), bool) ||                          \
-        __builtin_types_compatible_p(typeof(expr), const bool) ||                  \
-        __builtin_types_compatible_p(typeof(expr), volatile bool) ||               \
-        __builtin_types_compatible_p(typeof(expr), const volatile bool),           \
-        (bool)1,                                                                   \
-    __builtin_choose_expr(                                                         \
-      __builtin_types_compatible_p(typeof(expr), signed char) ||                   \
-        __builtin_types_compatible_p(typeof(expr), const signed char) ||           \
-        __builtin_types_compatible_p(typeof(expr), volatile signed char) ||        \
-        __builtin_types_compatible_p(typeof(expr), const volatile signed char),    \
-        (signed char)1,                                                            \
-    __builtin_choose_expr(                                                         \
-      __builtin_types_compatible_p(typeof(expr), unsigned char) ||                 \
-        __builtin_types_compatible_p(typeof(expr), const unsigned char) ||         \
-        __builtin_types_compatible_p(typeof(expr), volatile unsigned char) ||      \
-        __builtin_types_compatible_p(typeof(expr), const volatile unsigned char),  \
-        (unsigned char)1,                                                          \
-    __builtin_choose_expr(                                                         \
-      __builtin_types_compatible_p(typeof(expr), signed short) ||                  \
-        __builtin_types_compatible_p(typeof(expr), const signed short) ||          \
-        __builtin_types_compatible_p(typeof(expr), volatile signed short) ||       \
-        __builtin_types_compatible_p(typeof(expr), const volatile signed short),   \
-        (signed short)1,                                                           \
-    __builtin_choose_expr(                                                         \
-      __builtin_types_compatible_p(typeof(expr), unsigned short) ||                \
-        __builtin_types_compatible_p(typeof(expr), const unsigned short) ||        \
-        __builtin_types_compatible_p(typeof(expr), volatile unsigned short) ||     \
-        __builtin_types_compatible_p(typeof(expr), const volatile unsigned short), \
-        (unsigned short)1,                                                         \
-      (expr)+0))))))
+#define typeof_strip_qual(expr)   typeof((void)0, (expr))
 
 #ifdef __ATOMIC_RELAXED
 /* For C11 atomic ops */
-- 
2.25.1


