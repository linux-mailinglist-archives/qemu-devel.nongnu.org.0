Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45C554213C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:25:39 +0200 (CEST)
Received: from localhost ([::1]:42076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyoCJ-0004wO-0s
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6o-0006wc-8l
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:58 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6l-00023M-Hq
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:57 -0400
Received: by mail-pg1-x535.google.com with SMTP id g186so9023917pgc.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RM42zMRkI421HiARyMb/O/C2Vq6+9jMrjOfzX4mv7Y0=;
 b=dRsQuzcSmi2ALA61dgmw9YNkB/KU2DY3wZ+ycRfkqzaLNS52pMxxk4fkl4yMAKQu4C
 76FMAJZGHYTmPkxa3l5s4FLFJk7//rDnuuR8KpXC1b4InpVP1gav1re1C0/gjE24EVt/
 gb7aDmMhALtbOWI/2TUpKDMFwvjpflek2X9BhA/cxq28LjBptVUsSgu5qJqYAndh1u1U
 PF7pxRhyJ26tGgudtSA+XEKJbkukPm2MD41yJjs1byS/9Gq2l9LBq6PaM0jbdNzJFLiD
 Izb5MmRj87p0rYnVfsKd6K+mySJXj9YbBLdumFUfkMT0gTrk8Ry15EIevvzG0t4806b8
 vVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RM42zMRkI421HiARyMb/O/C2Vq6+9jMrjOfzX4mv7Y0=;
 b=owOL48bq5915nj5qClpOto2a71OWilPZINbBvvkNbTqAXKxCUoJ+dkzMuB8zpxV02R
 grMpfprzmfMh9ezEzoc4NbdlLsVjqgpPdJVBI0wYtKlShWXHmLabZScHG6FNh09I7POd
 bkaaSumuJ7QkupMZvseMgcUp/r3JT46JAdBufAjUfhn1Vh+CQk78FtsWJdIU1gXfLZdi
 FUMQ74AYrkqvaWHxV8HRrowx0cDN84wIIH2Y5PomaZU+Sr0BST0kKqADq8q6tx+Uukor
 1kYOyTm2t4iTh68dVkL1Lxu44Q4H5wBByxNXsy/2RgylXxh2vpj3SJscc9iW8PGuzhRj
 vmBg==
X-Gm-Message-State: AOAM5308AHqVSlgOu/+4/kWjqdANrQ2DlAHZP+Pvilr5bqMGG3sk2/mC
 xoazBXbMUYznMf2UsPsd3Ma7OPxH9YZ7ZA==
X-Google-Smtp-Source: ABdhPJwSwasrgVOfl8arpPmVCujet79bJ+ZQnKoa/3dAA5X0jOB0QFOhvGHfQ2mQOfKdryRpE6A90Q==
X-Received: by 2002:a62:8702:0:b0:51b:c452:33cf with SMTP id
 i2-20020a628702000000b0051bc45233cfmr25358364pfe.72.1654665593769; 
 Tue, 07 Jun 2022 22:19:53 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:c626:2f70:ac99:7c97])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170902d58800b001641244d051sm13378807plh.257.2022.06.07.22.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 22:19:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org
Subject: [PATCH v4 08/11] target/mips: Use error_report for UHI_assert
Date: Tue,  7 Jun 2022 22:19:42 -0700
Message-Id: <20220608051945.802339-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220608051945.802339-1-richard.henderson@linaro.org>
References: <20220608051945.802339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Always log the assert locally.  Do not report_fault, but
instead include the fact of the fault in the assertion.
Don't bother freeing allocated strings before the abort().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 39 ++++++++++++++----------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index ad11a46820..ae4b8849b1 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -221,18 +221,6 @@ static int copy_argn_to_target(CPUMIPSState *env, int arg_num,
         }                                       \
     } while (0)
 
-#define GET_TARGET_STRINGS_2(p, addr, p2, addr2)        \
-    do {                                                \
-        p = lock_user_string(addr);                     \
-        if (!p) {                                       \
-            report_fault(env);                          \
-        }                                               \
-        p2 = lock_user_string(addr2);                   \
-        if (!p2) {                                      \
-            report_fault(env);                          \
-        }                                               \
-    } while (0)
-
 #define FREE_TARGET_STRING(p, gpr)              \
     do {                                        \
         unlock_user(p, gpr, 0);                 \
@@ -243,7 +231,7 @@ void mips_semihosting(CPUMIPSState *env)
     CPUState *cs = env_cpu(env);
     target_ulong *gpr = env->active_tc.gpr;
     const UHIOp op = gpr[25];
-    char *p, *p2;
+    char *p;
 
     switch (op) {
     case UHI_exit:
@@ -355,14 +343,23 @@ void mips_semihosting(CPUMIPSState *env)
         break;
 
     case UHI_assert:
-        GET_TARGET_STRINGS_2(p, gpr[4], p2, gpr[5]);
-        printf("assertion '");
-        printf("\"%s\"", p);
-        printf("': file \"%s\", line %d\n", p2, (int)gpr[6]);
-        FREE_TARGET_STRING(p2, gpr[5]);
-        FREE_TARGET_STRING(p, gpr[4]);
-        abort();
-        break;
+        {
+            const char *msg, *file;
+
+            msg = lock_user_string(gpr[4]);
+            if (!msg) {
+                msg = "<EFAULT>";
+            }
+            file = lock_user_string(gpr[5]);
+            if (!file) {
+                file = "<EFAULT>";
+            }
+
+            error_report("UHI assertion \"%s\": file \"%s\", line %d",
+                         msg, file, (int)gpr[6]);
+            abort();
+        }
+
     default:
         error_report("Unknown UHI operation %d", op);
         abort();
-- 
2.34.1


