Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C7E6AB477
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 02:58:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ06M-00049E-Mb; Sun, 05 Mar 2023 20:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ06I-00048E-Qd
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 20:57:21 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ06H-0003J0-6V
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 20:57:18 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 m20-20020a17090ab79400b00239d8e182efso11666698pjr.5
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 17:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678067835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E6K0A7+gP/89i/KNPQ80KDpl9+S1ffSQBzdgEVtW8JI=;
 b=e6RWv3NqSAhyAeDfi8dKnE7WtFnz1kS9U2xxHD8ZATNBf1piM8vfdR9dJ7ptdK9fMT
 TTxdke6cdlqhZZExygK0gg+Y4p+Qbi5YY4Ml6UcX1fooREdpGlYPjL6GjgZ2IQYfmkot
 +4DAb0BzskOsID+fm7vJv3qyqg6/llK83BnKFLHAuMwU0ZzKVmH0nlBawc/dPqfyglWf
 6KxgLDLAzvAoioJC06hQ8wjBZJAoPUZPhkmR3R/c/0kUjv/BrqQZ6R6BLjRVNlkYZlCP
 zPXagO1gq11es5j80Q5E1wE0Z7G0h30Pp+I5JWuvvUAMcI8AAFWUn+jpJZRowBBp0Bvy
 cMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678067835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E6K0A7+gP/89i/KNPQ80KDpl9+S1ffSQBzdgEVtW8JI=;
 b=dj33N4sJhaSIwIKaddOs/x9O+1qgz72WIoCfmmJ7VJHuPQqxfSOCZ4zDB0Wz4X+vvR
 1BhiwHn3oNmpX/4u9ygWUAu1sUy1OFq1IjycFzySGjm1H12w7W0/d6p1DClcvmFcH17b
 2gkv8F9RAXPUwvdoYtsU9N07tTLgqfYg+ai9CNdPNDVjWhyHJWUeDoD6TMBUIhIMcVzq
 DT3Hv+sgLLsZCH0XWOLq1s7XqixQPcfmfsWPUxXllBohUg/YU1eQfz3AyGWuGivmxjxm
 FVxr25gSA7dyc3xxXyWfjomjp+6y6eI2uSq1IVMOKNZxySJdWmymHW6JoB066YjeJNHo
 E6iA==
X-Gm-Message-State: AO0yUKUrK9uayfhAddZRNlFRjUF7MfjbgPpcMrUFdTGsJTI2LzyH0/HR
 StfloFiPTj6EgUlVbucfP09vyXah/KYex5YIY9zQLw==
X-Google-Smtp-Source: AK7set9Sp56KPQW0tiTm7egHOmrZzmN0L1GpKOafqy/0m1lMjjMcR7cCEA14VOfcPVkQ7Cb4I+xrew==
X-Received: by 2002:a05:6a20:12d4:b0:cc:beae:c2c2 with SMTP id
 v20-20020a056a2012d400b000ccbeaec2c2mr10998055pzg.1.1678067835676; 
 Sun, 05 Mar 2023 17:57:15 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 g23-20020aa78197000000b0061949fe3beasm2921056pfi.22.2023.03.05.17.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 17:57:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 5/5] accel/tcg: Remove check_tcg_memory_orders_compatible
Date: Sun,  5 Mar 2023 17:57:10 -0800
Message-Id: <20230306015710.1868853-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306015710.1868853-1-richard.henderson@linaro.org>
References: <20230306015710.1868853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We now issue host memory barriers to match the guest memory order.
Continue to disable MTTCG only if the guest has not been ported.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-all.c | 34 ++++++++--------------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 604efd1b18..f6b44548cc 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -61,33 +61,20 @@ DECLARE_INSTANCE_CHECKER(TCGState, TCG_STATE,
  * they can set the appropriate CONFIG flags in ${target}-softmmu.mak
  *
  * Once a guest architecture has been converted to the new primitives
- * there are two remaining limitations to check.
- *
- * - The guest can't be oversized (e.g. 64 bit guest on 32 bit host)
- * - The host must have a stronger memory order than the guest
- *
- * It may be possible in future to support strong guests on weak hosts
- * but that will require tagging all load/stores in a guest with their
- * implicit memory order requirements which would likely slow things
- * down a lot.
+ * there is one remaining limitation to check:
+ *   - The guest can't be oversized (e.g. 64 bit guest on 32 bit host)
  */
 
-static bool check_tcg_memory_orders_compatible(void)
-{
-    return tcg_req_mo(TCG_MO_ALL) == 0;
-}
-
 static bool default_mttcg_enabled(void)
 {
     if (icount_enabled() || TCG_OVERSIZED_GUEST) {
         return false;
-    } else {
-#ifdef TARGET_SUPPORTS_MTTCG
-        return check_tcg_memory_orders_compatible();
-#else
-        return false;
-#endif
     }
+#if defined(TARGET_SUPPORTS_MTTCG) && defined(TCG_GUEST_DEFAULT_MO)
+    return true;
+#else
+    return false;
+#endif
 }
 
 static void tcg_accel_instance_init(Object *obj)
@@ -150,15 +137,10 @@ static void tcg_set_thread(Object *obj, const char *value, Error **errp)
         } else if (icount_enabled()) {
             error_setg(errp, "No MTTCG when icount is enabled");
         } else {
-#ifndef TARGET_SUPPORTS_MTTCG
+#if !(defined(TARGET_SUPPORTS_MTTCG) && defined(TCG_GUEST_DEFAULT_MO))
             warn_report("Guest not yet converted to MTTCG - "
                         "you may get unexpected results");
 #endif
-            if (!check_tcg_memory_orders_compatible()) {
-                warn_report("Guest expects a stronger memory ordering "
-                            "than the host provides");
-                error_printf("This may cause strange/hard to debug errors\n");
-            }
             s->mttcg_enabled = true;
         }
     } else if (strcmp(value, "single") == 0) {
-- 
2.34.1


