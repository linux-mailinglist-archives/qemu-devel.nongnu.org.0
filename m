Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B3B518F76
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:54:06 +0200 (CEST)
Received: from localhost ([::1]:37114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzX3-0000dl-4v
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZh-0008VV-2q
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:45 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZe-0006LH-B6
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:44 -0400
Received: by mail-pl1-x630.google.com with SMTP id d15so15896872plh.2
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HeLbzu4J7HUJ/gIyU/6OdVT7zEVHegu20jhi9pPruCA=;
 b=djZ67NzGjP8c9+Z4Lv/14NmOl2flIAmtZ3jLkHkqPcoYWBEPUqtOc5wS8cD5TlSbMW
 ZO937dvXUQ2WKb4u0WduhdW6xXzkKSx5PM8nwXEDPTsByJxeSvdoMJiCxPkxwUKXmZe9
 oSh9SR2GDgDHhPfc/9sED/PdW4lSdvdDQE4k+mK8mryvSBVklqnW9nER3ZTFnqIcclL3
 9VSYjWmSSgOTcjmYjCvXm6dnYNYZISGOTVJHj5QtUXviPVsSIDIS2dKZJx8kUC61SyoO
 BSN34AvUrBz42JgA88ekUQ+0d3DLtDmlOxIKG4h4DJU3ZTOXs8XYqEHYEyZRbu7s2r/D
 F3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HeLbzu4J7HUJ/gIyU/6OdVT7zEVHegu20jhi9pPruCA=;
 b=4X6Yub5jjkW//2X2c1hiOXCJkHyBCkbEbqCp+8hGQecW15QIHTxoO0VEHrFoiT/4iy
 16OyCssaqofQKhmhfyoNF+NVz3ZZI3mnxSNuDb3l6V14nXgpoNogV7Av1lbexepEYKN3
 9e0aiWfJAV2fMkqbt7PjX5ilbFSMbFkWKTrE7SUny1jkz5hkoCXxLUsmIVK81nVjHomW
 AO9xEq0IFXI8sFjBgV+XXdo0I6HIunhH7unnWuFGwVrQ/YfZ0mPUEzBJkIpR9kdz59cn
 /9nplKTaDSbcuB3KkHPJfdj4K/J3RzqJ9CbHY+HD5DQoRstr1MplwGCUbFxw7mfVMpUx
 dlgA==
X-Gm-Message-State: AOAM530benyV/aY7UCEzZKUzsIcIr5DwusK6wU2Gow+qRgSWpRnZkv/Y
 3wNaxUUujw3yxvmIMW8FebNF7aDXbsf0oA==
X-Google-Smtp-Source: ABdhPJxXljkV6iEpSrSSP8SX4GWQzxF0NeVpu/idqkPVfaJobGihS3o0sc6VkjeGsnGuKlRyGvs2Sg==
X-Received: by 2002:a17:902:8605:b0:15d:10dc:1c6f with SMTP id
 f5-20020a170902860500b0015d10dc1c6fmr18366045plo.4.1651607561110; 
 Tue, 03 May 2022 12:52:41 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 56/74] target/mips: Create report_fault for semihosting
Date: Tue,  3 May 2022 12:48:25 -0700
Message-Id: <20220503194843.1379101-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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


