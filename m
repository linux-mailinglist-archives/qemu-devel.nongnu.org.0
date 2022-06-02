Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518AB53C143
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 01:10:30 +0200 (CEST)
Received: from localhost ([::1]:35276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtxV-0007am-FJ
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 19:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskQ-0001ih-4Y
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:59 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:44686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskM-0000xT-1a
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:53 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so5876504pjb.3
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xfbnb7TdCVSBLKBo6fQd3FAajC5xAFCP1x/5wXNW3q0=;
 b=v8k2SBmgfeWDCm5dCMsYKFNEoxiA8XNxvV+gwWW325JQljR9R6pjS6PsSQnD1KKJLa
 9p0oGJ1/8mSLt51aeL52tzYhqO85WNSV/9hMgXmx0BevqYd8jsB7spjV55ohf9XSp4vH
 /doTqwaGp2OssIaF4Xd6CG4TAjCNSftLmcAOZO/iK/mCh3yuafKt+CFZNH9Tx+zxY5t5
 driUzbqVaP+cyP0PU9L2sWNYcS/Ii6ErKa7Rf1uCB0Tj5qjaJy45FTU3GCvaJzmAoaqC
 RzomYQ4lc+BzPqXM9ClWnB1apbhcpJqpwTTqH8dLusQ09x5ZFDmdfn1VYUMUf0WmzvzC
 vX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xfbnb7TdCVSBLKBo6fQd3FAajC5xAFCP1x/5wXNW3q0=;
 b=3WQ57WUkN65BUC20sUas2ENJdhHSm9mw7GV7vs1iNOdYhs2CP6P+sTjbHINOcweYnb
 PzO2LRX0/k4fc4bDiJZfCqtvDs7TJh2Dp3E/EfwTed3vn/rlcMrXghZPUrEkD7KsTrph
 fChMsPRM7nGINUS0fzGhTCvxYwv+pt1bC0QYIlD3fYB3ZlGShUAirfr72cPwWsSK+lHT
 31X02SzuHKMZc9YeeeUKBmKbUayysvta92MUVROcoZ+ycAefF9RkX5LfmIp4VFUb5ezG
 dmh9xc0472N80xHIbQx6UKs8ZH/Id4YfKNn3/kYYCCTZa/WJGO0JuF3GmeDO50W1VJJs
 /dew==
X-Gm-Message-State: AOAM530crg4rA//FzGkc1UUmOxiV76C6qYiMcneG4dgiUdCY30m4fLmo
 +CqAC2CRJgDeR6TDCYIzr5K5oVoeFLaUcA==
X-Google-Smtp-Source: ABdhPJw0dz5EE+B7ApLala/BssvTllvxPMHo5lXYJNA4mWYH2JhAvL9dsdkZyU8+45PEyv9eHrhI4w==
X-Received: by 2002:a17:903:11d0:b0:155:c240:a2c0 with SMTP id
 q16-20020a17090311d000b00155c240a2c0mr6866622plh.143.1654206768753; 
 Thu, 02 Jun 2022 14:52:48 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 62/71] linux-user/aarch64: Tidy target_restore_sigframe error
 return
Date: Thu,  2 Jun 2022 14:48:44 -0700
Message-Id: <20220602214853.496211-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Fold the return value setting into the goto, so each
point of failure need not do both.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 08a9746ace..e9ff280d2a 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -287,7 +287,6 @@ static int target_restore_sigframe(CPUARMState *env,
     struct target_sve_context *sve = NULL;
     uint64_t extra_datap = 0;
     bool used_extra = false;
-    bool err = false;
     int vq = 0, sve_size = 0;
 
     target_restore_general_frame(env, sf);
@@ -301,8 +300,7 @@ static int target_restore_sigframe(CPUARMState *env,
         switch (magic) {
         case 0:
             if (size != 0) {
-                err = true;
-                goto exit;
+                goto err;
             }
             if (used_extra) {
                 ctx = NULL;
@@ -314,8 +312,7 @@ static int target_restore_sigframe(CPUARMState *env,
 
         case TARGET_FPSIMD_MAGIC:
             if (fpsimd || size != sizeof(struct target_fpsimd_context)) {
-                err = true;
-                goto exit;
+                goto err;
             }
             fpsimd = (struct target_fpsimd_context *)ctx;
             break;
@@ -329,13 +326,11 @@ static int target_restore_sigframe(CPUARMState *env,
                     break;
                 }
             }
-            err = true;
-            goto exit;
+            goto err;
 
         case TARGET_EXTRA_MAGIC:
             if (extra || size != sizeof(struct target_extra_context)) {
-                err = true;
-                goto exit;
+                goto err;
             }
             __get_user(extra_datap,
                        &((struct target_extra_context *)ctx)->datap);
@@ -348,8 +343,7 @@ static int target_restore_sigframe(CPUARMState *env,
             /* Unknown record -- we certainly didn't generate it.
              * Did we in fact get out of sync?
              */
-            err = true;
-            goto exit;
+            goto err;
         }
         ctx = (void *)ctx + size;
     }
@@ -358,17 +352,19 @@ static int target_restore_sigframe(CPUARMState *env,
     if (fpsimd) {
         target_restore_fpsimd_record(env, fpsimd);
     } else {
-        err = true;
+        goto err;
     }
 
     /* SVE data, if present, overwrites FPSIMD data.  */
     if (sve) {
         target_restore_sve_record(env, sve, vq);
     }
-
- exit:
     unlock_user(extra, extra_datap, 0);
-    return err;
+    return 0;
+
+ err:
+    unlock_user(extra, extra_datap, 0);
+    return 1;
 }
 
 static abi_ulong get_sigframe(struct target_sigaction *ka,
-- 
2.34.1


