Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67375542140
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 07:29:44 +0200 (CEST)
Received: from localhost ([::1]:48168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyoGF-0000gR-96
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 01:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6k-0006rU-7c
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:55 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyo6h-00022O-3T
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 01:19:53 -0400
Received: by mail-pg1-x530.google.com with SMTP id s135so2265687pgs.10
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 22:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HeLbzu4J7HUJ/gIyU/6OdVT7zEVHegu20jhi9pPruCA=;
 b=bSETDgHEZ2Dmj+0hZNIu2hA5cwSLmDURwrqny9qYr0TiJ9EDSmUGT+t5kcM4Eendt+
 +tPapgeSMxV9t+MH8qT8fbEQSDZWP0jqLf2Z/WJhnQyaA+8KCj0FQAGAqfPzwmmJO9C4
 vhtB4HYOhcrrxRBi94csSpf8Hqto4LLjsxhUoMSNMZLLtt5ULNw/PaJ1TgWm7SVNYQzn
 G3LxIuJ4eUaM5Dmt8m4hJr1ZtJPOKoFnbV+k3pt3sXttAzTPKmeBixjah0MWO4rGKI9E
 d26BmT/LmoZK9qq1nxXqPHQQxtgLrDOxdbncsAdLzGnP49p83Q9xg7bFgY2Oxu/rDUup
 9hNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HeLbzu4J7HUJ/gIyU/6OdVT7zEVHegu20jhi9pPruCA=;
 b=cu87zTLXI4l7pwotJb2wIjVK5z7c4LK+SRDuse3zW6G+f2FsY1/2yZlb1rIDVJNDzC
 VnAw0ubb8qKYv19q+/A2TraMjKHOjnItwB11W59AzK2XJedNMtHL3yFzXasGObHdEdEm
 CQVh4ocYukOr36QG3cX7vm3TzO1o1/hYeG74AqUKlNfI0KQGWjunp/8Opcgli8zZYGen
 e9OrVX3l4IkozVwBA2Z8x26syqThpr38hHufdZUErFAtDP4JEiSLrxdlC8U856P6cZS/
 XgDYdlEjUPg85WNxJr91R8r2zkntGVZS1mAaIS35MhTC0SB8HeKWWdH1puVQJmWXiLG5
 t+gQ==
X-Gm-Message-State: AOAM53353pXTQlVA5AtcCGhsdN04Tx04vSLiLzvKi+jyc+CR8EHxgOWe
 i8FycDEKc0vbhQmxrgt5gAMeX47votvn1Q==
X-Google-Smtp-Source: ABdhPJxntGRpbXirnys95Nz6FCgCMVmNYsV0H34a1NxTxAiR2X4mfOxk2F34+X48yYFGI0SJa92qTw==
X-Received: by 2002:a05:6a00:4504:b0:51b:f04e:a130 with SMTP id
 cw4-20020a056a00450400b0051bf04ea130mr22409360pfb.52.1654665589830; 
 Tue, 07 Jun 2022 22:19:49 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:c626:2f70:ac99:7c97])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170902d58800b001641244d051sm13378807plh.257.2022.06.07.22.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 22:19:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org
Subject: [PATCH v4 03/11] target/mips: Create report_fault for semihosting
Date: Tue,  7 Jun 2022 22:19:37 -0700
Message-Id: <20220608051945.802339-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220608051945.802339-1-richard.henderson@linaro.org>
References: <20220608051945.802339-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

The UHI specification does not have an EFAULT value,
and further specifies that "undefined UHI operations
should not return control to the target".

So, log the error and abort.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 33 ++++++++++++++----------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 2a039baf4c..33221444e1 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -114,6 +114,13 @@ enum UHIErrno {
     UHI_EXDEV           = 18,
 };
 
+static void report_fault(CPUMIPSState *env)
+{
+    int op = env->active_tc.gpr[25];
+    error_report("Fault during UHI operation %d", op);
+    abort();
+}
+
 static int errno_mips(int host_errno)
 {
     /* Errno values taken from asm-mips/errno.h */
@@ -136,8 +143,7 @@ static int copy_stat_to_target(CPUMIPSState *env, const struct stat *src,
     hwaddr len = sizeof(struct UHIStat);
     UHIStat *dst = lock_user(VERIFY_WRITE, vaddr, len, 0);
     if (!dst) {
-        errno = EFAULT;
-        return -1;
+        report_fault(env);
     }
 
     dst->uhi_st_dev = tswap16(src->st_dev);
@@ -188,8 +194,7 @@ static int write_to_file(CPUMIPSState *env, target_ulong fd, target_ulong vaddr,
     int num_of_bytes;
     void *dst = lock_user(VERIFY_READ, vaddr, len, 1);
     if (!dst) {
-        errno = EFAULT;
-        return -1;
+        report_fault(env);
     }
 
     if (offset) {
@@ -213,8 +218,7 @@ static int read_from_file(CPUMIPSState *env, target_ulong fd,
     int num_of_bytes;
     void *dst = lock_user(VERIFY_WRITE, vaddr, len, 0);
     if (!dst) {
-        errno = EFAULT;
-        return -1;
+        report_fault(env);
     }
 
     if (offset) {
@@ -237,7 +241,7 @@ static int copy_argn_to_target(CPUMIPSState *env, int arg_num,
     int strsize = strlen(semihosting_get_arg(arg_num)) + 1;
     char *dst = lock_user(VERIFY_WRITE, vaddr, strsize, 0);
     if (!dst) {
-        return -1;
+        report_fault(env);
     }
 
     strcpy(dst, semihosting_get_arg(arg_num));
@@ -250,9 +254,7 @@ static int copy_argn_to_target(CPUMIPSState *env, int arg_num,
     do {                                        \
         p = lock_user_string(addr);             \
         if (!p) {                               \
-            gpr[2] = -1;                        \
-            gpr[3] = EFAULT;                    \
-            return;                             \
+            report_fault(env);                  \
         }                                       \
     } while (0)
 
@@ -260,16 +262,11 @@ static int copy_argn_to_target(CPUMIPSState *env, int arg_num,
     do {                                                \
         p = lock_user_string(addr);                     \
         if (!p) {                                       \
-            gpr[2] = -1;                                \
-            gpr[3] = EFAULT;                            \
-            return;                                     \
+            report_fault(env);                          \
         }                                               \
         p2 = lock_user_string(addr2);                   \
         if (!p2) {                                      \
-            unlock_user(p, addr, 0);                    \
-            gpr[2] = -1;                                \
-            gpr[3] = EFAULT;                            \
-            return;                                     \
+            report_fault(env);                          \
         }                                               \
     } while (0)
 
@@ -400,7 +397,7 @@ void mips_semihosting(CPUMIPSState *env)
         break;
 #endif
     default:
-        fprintf(stderr, "Unknown UHI operation %d\n", op);
+        error_report("Unknown UHI operation %d", op);
         abort();
     }
     return;
-- 
2.34.1


