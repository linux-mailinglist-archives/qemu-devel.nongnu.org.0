Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3D6504935
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:12:51 +0200 (CEST)
Received: from localhost ([::1]:52480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAKI-0000jb-2R
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fX-0000U1-80
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:49 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fU-0001oL-Uh
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:42 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso12293485pjj.2
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b1JYMpL7TO2R6BVJG41yV+OL5PQM9UAMtxfbal+NfyA=;
 b=yfe6HtL/zw68n5sFn0qjUCyH7rMnaJx6Moi2MG888bSwDT1+AIFmoLsNai2XLXPW0Q
 fmc/NWt5NJtx0AQ/LVqE2MKSy0se9L/zn2W4UDZ/k7kfRsU+ZxKa9GIUEc77Zz6IFjR5
 whnjGLiiYFhcB7BL0h6tqz9iMtKYiuRA4JJAWXktgFuKuMzcZP95eQleSGmP9cmvcqBP
 hHWZjuSZC9SqUXZ40INQRw3+9ClO9AUc2acHRxrxkAExKJEHCDisx+tkhXAScQLHfJ5T
 D4NCiEKRRcoop/OUU8MHXS0Df47j1tK5/o6OgEXSyjGTyPVOuPqYaC9r39XH/4W+5c5q
 H0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b1JYMpL7TO2R6BVJG41yV+OL5PQM9UAMtxfbal+NfyA=;
 b=qIfvfn7EJ3XaowdEyQ9eBw8bG0HYcBwKso3FRhtsnqdLOUfA5BZfiX4CsMg80YVSHW
 mp+owksuMTc3OYxcySieD2RtImhsimWky9F+OIYywJ2yVEnggGkN7FdC+zR1XPTxihXB
 0KSema5ZfUT1b8kCeh2jsak//yVov8iKmPpfA9a8tkFVh8XNNaMh1PIhWAqbT1JH8OLY
 8Tm1jZchrbJYnI/1qm/2diVM6zxxD4SBDkGdpdmnKe+GeXjEI45zr4r6y+zfIXJ/GvpB
 xGsqcB46TOl+7uzlJT2i5iE7Dxq/pXVO4WWerqC2c611iIDniMqHsSycrbqkGmfh2jvu
 q7dw==
X-Gm-Message-State: AOAM533SF8ophCbLwtqVqy4DqchYqaba0s8Eeuq5hfY6oN96B+1TfalE
 d10tzMcIK+EEQMjISkKOsncKycmckmc4YA==
X-Google-Smtp-Source: ABdhPJzpfeTycJ+OV8qY6lc9RK47ezMDYY2Pnh2ttO8ylIhvx8mgq4lNQBBK/BcGGLZj6C0Z67lyCw==
X-Received: by 2002:a17:902:b10c:b0:154:a3b5:b33a with SMTP id
 q12-20020a170902b10c00b00154a3b5b33amr7652514plr.3.1650220239650; 
 Sun, 17 Apr 2022 11:30:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/39] linux-user: Expand log_page_dump inline
Date: Sun, 17 Apr 2022 11:30:02 -0700
Message-Id: <20220417183019.755276-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have extra stuff to log at the same time.
Hoist the qemu_log_lock/unlock to the caller and use fprintf.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/log.h | 15 ---------------
 linux-user/main.c  | 43 +++++++++++++++++++++++++++++--------------
 linux-user/mmap.c  |  7 ++++++-
 3 files changed, 35 insertions(+), 30 deletions(-)

diff --git a/include/exec/log.h b/include/exec/log.h
index 06ab9841ee..ad0a40cfeb 100644
--- a/include/exec/log.h
+++ b/include/exec/log.h
@@ -42,19 +42,4 @@ static inline void log_cpu_state_mask(int mask, CPUState *cpu, int flags)
     }
 }
 
-#ifdef NEED_CPU_H
-#if defined(CONFIG_USER_ONLY)
-/* page_dump() output to the log file: */
-static inline void log_page_dump(const char *operation)
-{
-    FILE *logfile = qemu_log_trylock();
-    if (logfile) {
-        fprintf(logfile, "page layout changed following %s\n", operation);
-        page_dump(logfile);
-    }
-    qemu_log_unlock(logfile);
-}
-#endif
-#endif
-
 #endif
diff --git a/linux-user/main.c b/linux-user/main.c
index 6aed4929ab..d263b2a669 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -857,21 +857,36 @@ int main(int argc, char **argv, char **envp)
     g_free(target_environ);
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
-        qemu_log("guest_base  %p\n", (void *)guest_base);
-        log_page_dump("binary load");
+        FILE *f = qemu_log_trylock();
+        if (f) {
+            fprintf(f, "guest_base  %p\n", (void *)guest_base);
+            fprintf(f, "page layout changed following binary load\n");
+            page_dump(f);
 
-        qemu_log("start_brk   0x" TARGET_ABI_FMT_lx "\n", info->start_brk);
-        qemu_log("end_code    0x" TARGET_ABI_FMT_lx "\n", info->end_code);
-        qemu_log("start_code  0x" TARGET_ABI_FMT_lx "\n", info->start_code);
-        qemu_log("start_data  0x" TARGET_ABI_FMT_lx "\n", info->start_data);
-        qemu_log("end_data    0x" TARGET_ABI_FMT_lx "\n", info->end_data);
-        qemu_log("start_stack 0x" TARGET_ABI_FMT_lx "\n", info->start_stack);
-        qemu_log("brk         0x" TARGET_ABI_FMT_lx "\n", info->brk);
-        qemu_log("entry       0x" TARGET_ABI_FMT_lx "\n", info->entry);
-        qemu_log("argv_start  0x" TARGET_ABI_FMT_lx "\n", info->arg_start);
-        qemu_log("env_start   0x" TARGET_ABI_FMT_lx "\n",
-                 info->arg_end + (abi_ulong)sizeof(abi_ulong));
-        qemu_log("auxv_start  0x" TARGET_ABI_FMT_lx "\n", info->saved_auxv);
+            fprintf(f, "start_brk   0x" TARGET_ABI_FMT_lx "\n",
+                    info->start_brk);
+            fprintf(f, "end_code    0x" TARGET_ABI_FMT_lx "\n",
+                    info->end_code);
+            fprintf(f, "start_code  0x" TARGET_ABI_FMT_lx "\n",
+                    info->start_code);
+            fprintf(f, "start_data  0x" TARGET_ABI_FMT_lx "\n",
+                    info->start_data);
+            fprintf(f, "end_data    0x" TARGET_ABI_FMT_lx "\n",
+                    info->end_data);
+            fprintf(f, "start_stack 0x" TARGET_ABI_FMT_lx "\n",
+                    info->start_stack);
+            fprintf(f, "brk         0x" TARGET_ABI_FMT_lx "\n",
+                    info->brk);
+            fprintf(f, "entry       0x" TARGET_ABI_FMT_lx "\n",
+                    info->entry);
+            fprintf(f, "argv_start  0x" TARGET_ABI_FMT_lx "\n",
+                    info->arg_start);
+            fprintf(f, "env_start   0x" TARGET_ABI_FMT_lx "\n",
+                    info->arg_end + (abi_ulong)sizeof(abi_ulong));
+            fprintf(f, "auxv_start  0x" TARGET_ABI_FMT_lx "\n",
+                    info->saved_auxv);
+            qemu_log_unlock(f);
+        }
     }
 
     target_set_brk(info->brk);
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index c125031b90..bbb2c2e178 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -630,7 +630,12 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
  the_end:
     trace_target_mmap_complete(start);
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
-        log_page_dump(__func__);
+        FILE *f = qemu_log_trylock();
+        if (f) {
+            fprintf(f, "page layout changed following mmap\n");
+            page_dump(f);
+            qemu_log_unlock(f);
+        }
     }
     tb_invalidate_phys_range(start, start + len);
     mmap_unlock();
-- 
2.25.1


