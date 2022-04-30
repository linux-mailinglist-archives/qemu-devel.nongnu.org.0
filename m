Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086C3515DAA
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:37:19 +0200 (CEST)
Received: from localhost ([::1]:60736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknHi-0002QF-4i
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAN-0004iI-T5
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:43 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAL-0006DW-6N
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:43 -0400
Received: by mail-pl1-x62e.google.com with SMTP id u7so9278379plg.13
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yYl4ubh19IwlWlMYqHs938Y3A5pmp6ChkIekWgSMVhY=;
 b=s13WSI+KvEFkskHyX/H8xj7dr8zb35D/ejGRS5qpBUOccLPaWrGKsgQYvU3BDwNUSn
 dYOVPCijTZTN9z1oi7hb2z9nYVbh3Y6LVqBTVeO27HAvuc+hELQ9PX0aRdQXAYw7Rgdn
 n6fXVmiqs2SQqdvJqWqRqrcea0My+nn51NvDOWojkw5sx7cyfLNHrV3asdNSfhGnDqB2
 FUKDDI+nwNGxExrKIYPDBLbe87UvI8zvivNLZySG5Cy8Agj8bCMQPc66lB2XpJb/Ss+v
 TMkTtn9Ma62OKt/m9LNJ+G2JmUvUd+J0CbU26aMnnHEZYeJsMOuO9qq8UsatecxGOVog
 hKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yYl4ubh19IwlWlMYqHs938Y3A5pmp6ChkIekWgSMVhY=;
 b=f8N8BJgTeTgw8M/psSg4MDEf9zxuKZ3gZwedFvQSQkNyEQ2tMEAbYMZ95B1gdrrtBe
 HFCX7ZMJLr2iJK82ItsjIoK+6iFm0xSg6nAVeTMg0/CXInjQ2JmkJjVZqLimlN7/IyXX
 BJxTSFAQ36hLl0oeSpBcOBQo7c/EefiYpTL2G+CxSZEBUQERLjg08NQmGGig+ZtqhPpk
 19KrAndlNiPEuEbscM9RnuSPSKzbexni0AuOjBRqhBVTj7JZ/XTUZ1t3NDcg9NxCP0Eq
 IviVEsjuGgLxFxa7cd8UOSOLpcRHoW8bvm538FSzQ6Y1N2bZ83B9vHBhi3EgJxjXQcBd
 HLig==
X-Gm-Message-State: AOAM532iyHCtB3OwfFbI2Ic428pnM8e8lAfd8NlONJThPKWa511gJwjd
 QBomnreo3EBOKzh9ns+MMaQNmOj7hf0k6Q==
X-Google-Smtp-Source: ABdhPJxZ3WP9Fe707OiT3OC7ovMl8QGAPO5WXUnUDK5iedJaSRf44KAQGeGLbEeTaWZHWp7kn3m1rg==
X-Received: by 2002:a17:903:14a:b0:15c:f657:62cd with SMTP id
 r10-20020a170903014a00b0015cf65762cdmr3941363plc.36.1651325379855; 
 Sat, 30 Apr 2022 06:29:39 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/43] semihosting: Simplify softmmu_lock_user_string
Date: Sat, 30 Apr 2022 06:28:55 -0700
Message-Id: <20220430132932.324018-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are not currently bounding the search to the 1024 bytes
that we allocated, possibly overrunning the buffer.
Use softmmu_strlen_user to find the length and allocate the
correct size from the beginning.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/uaccess.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/semihosting/uaccess.c b/semihosting/uaccess.c
index 3cd809122c..f5fc94c401 100644
--- a/semihosting/uaccess.c
+++ b/semihosting/uaccess.c
@@ -54,20 +54,11 @@ ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr)
 
 char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr)
 {
-    /* TODO: Make this something that isn't fixed size.  */
-    char *s = malloc(1024);
-    size_t len = 0;
-
-    if (!s) {
+    ssize_t len = softmmu_strlen_user(env, addr);
+    if (len < 0) {
         return NULL;
     }
-    do {
-        if (cpu_memory_rw_debug(env_cpu(env), addr++, s + len, 1, 0)) {
-            free(s);
-            return NULL;
-        }
-    } while (s[len++]);
-    return s;
+    return softmmu_lock_user(env, addr, len + 1, true);
 }
 
 void softmmu_unlock_user(CPUArchState *env, void *p,
-- 
2.34.1


