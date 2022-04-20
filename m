Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D4B508F7D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:31:36 +0200 (CEST)
Received: from localhost ([::1]:37660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhF70-000657-3f
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj0-0005wt-KL
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:46 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEiy-0001Iz-Sx
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:46 -0400
Received: by mail-pf1-x42e.google.com with SMTP id z16so2690468pfh.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qOm2StT5IGEkhcpPNeIDDUNyOCcShPcyMnYny7wZFf0=;
 b=x9gSS7O4VE4vVADiGzqkJKGvkeioIyU3lXeGY1cEOWB6X5CnkbwJ5Rl6DYAi39zusd
 S3EQumGHKh/GT0j9OLl3nhUl2BKFtMzXpAvxu5OzZ3/k2JUWY5gbPTqx9Oj5hb0L6Lix
 z9gs4ZRpItGdAyGhnoK2UItGDzuqxrYjZpCHKjqGXMz9J6x6t4P9xih5EEix1dR/7dcF
 P+DufUcrG9LjTMp6jSKB2c1OY65ZqKnBokuf9Bhw8HQSrULjhelz1m/XpKc5M2knz49+
 5NoNHKe5FjwXI2j1B3RNyxE15p/pDprZua8sUA5HX8yPM9eLT96bsl6BP1A7IY5JxrgM
 G6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qOm2StT5IGEkhcpPNeIDDUNyOCcShPcyMnYny7wZFf0=;
 b=eyUJ7w5cBMspm170GDrnVDCnA/LLll1PlM34XhaY0gK3i7q5PYGIQ1+7BEq+7jv2Bn
 cGfjeRSmUnZcQfI1na7NaD7VN1wMBJkmQVo7RoRRI+8jxk/9POHF0ANFpM2HVdJzhj8e
 RbF3ymzErStzFbl7agH57hULs83CBEJigNkoMR3vYs0Pnnm+L3H6hY7tFkAyWiKwmFYY
 bkrh9hEG7nvpRmyWag1A0RYLp+ye1qDnUs1ERlLWJzLkogUTTZ3Mi4Nrc8OIzvOASRfu
 F0oLeTYJ7o9NRrVABa6TCtOwEDD3UW9ATkJwZFITsjSUCfNplYV0DgIaaCHKI71u/Nbb
 4hIg==
X-Gm-Message-State: AOAM531PIHW9fcIITVNoRBsA2o4dIJsdTiT76zR4DDWM79QXzZ9Uao5o
 /Oz4nKYIx+mD5dcpnJHkq+DvHJVaL9eFwQ==
X-Google-Smtp-Source: ABdhPJwGbb0UGhUdaqftoEOFznoQSe3MbUmigKrdnKzIiN+Ds6uv5/QeLdsIaT1iqYJewvUzffYoow==
X-Received: by 2002:a05:6a00:170d:b0:50a:858e:2b6e with SMTP id
 h13-20020a056a00170d00b0050a858e2b6emr14105339pfc.48.1650478003579; 
 Wed, 20 Apr 2022 11:06:43 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/39] linux-user: Expand log_page_dump inline
Date: Wed, 20 Apr 2022 11:06:01 -0700
Message-Id: <20220420180618.1183855-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have extra stuff to log at the same time.
Hoist the qemu_log_lock/unlock to the caller and use fprintf.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-23-richard.henderson@linaro.org>
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
index a861f1e1d1..48e1373796 100644
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
2.34.1


