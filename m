Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E0B4E1D22
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:29:58 +0100 (CET)
Received: from localhost ([::1]:35092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzNN-0000Lv-Ti
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:29:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5y-0008WA-HO
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:58 -0400
Received: from [2607:f8b0:4864:20::529] (port=40489
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5v-0003TK-5Z
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:57 -0400
Received: by mail-pg1-x529.google.com with SMTP id w21so5045109pgm.7
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RfLYamEZLpY31Sx1p2zuEUJmtGPv8qgDD0cZ+FUaGoI=;
 b=xDeMtjPn7K80IMXve9W5HqQK/tXiUFtg7XrmPqUe2Of09BlEFsrj93ZYlN86r0K8uj
 CtDZkSouY5f4zr7HgkjOknQ27Tri1bGmSagmk7O2n96FCxKrDxRZpAaroFXBn6GtSjVN
 wRqa49ySzXiKZ+/gl9Sd6yhUYCQA/X4ptXm5vOyx1LLMM50LHwrdE/ChVbw2KOlDUEjQ
 mnxXh6lhOVoOStA35k/h8r3og3zovgqRPnTixTwYYBTwLl1MON+p5H4iOcPs8C9LBfuP
 ViI6l9sVpY8aALE/na7ABC3LTymY44QuJnWXOpHqCYDGjDH89poamk5vk1ttBgbwk1Xp
 clag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RfLYamEZLpY31Sx1p2zuEUJmtGPv8qgDD0cZ+FUaGoI=;
 b=vACrAVU02+DT5j/w6GQJn4+9TJwvALyksawFO18D/kwfeBua6r9Zg6/J11Zwgb+MXS
 ZwkWqdw7CJrNM/BNiKbmM9FXU56yf7Io0bVKf2u8geVBh6P8iHtma+exbnXOgH3Q43LO
 KX2Flh9ZFLd2e1RrgHHS9HtRTEaeXwJBuJc0LYw4XdrspHmxal5eJ0iQkhWS2rPo5Sy2
 9GrSz/9Cd6lwhC9c0i/Khy1TIAvBSrlDA74gfxfXLOOWDDsbfKbx6z3c4qAFu4TrIsbW
 5wzbnedvRg1KWb642LMTU9YItzB86Q+3opypZjbLgIfh1IsOQ5ywx+41b1XdYdE8OrG6
 KFZA==
X-Gm-Message-State: AOAM533lCjHWgXl6iNAR/VnPz1OpLHnCxNFuFRMXTSjG5n4cKnaZPUg+
 QG/6fVjcv0SufUN+wjEa6FtCasaR5hJ4DQ==
X-Google-Smtp-Source: ABdhPJz3ynuSS4H9Q2BuzbhwC3NQNjwBcodqMn16IJKyJfZ/0eolBQmsOTl0OdI5F9CCP/7pTb3sQA==
X-Received: by 2002:a63:7d5d:0:b0:34c:17:6174 with SMTP id
 m29-20020a637d5d000000b0034c00176174mr15682508pgn.133.1647796313965; 
 Sun, 20 Mar 2022 10:11:53 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 19/36] linux-user: Expand log_page_dump inline
Date: Sun, 20 Mar 2022 10:11:18 -0700
Message-Id: <20220320171135.2704502-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/log.h | 15 ---------------
 linux-user/main.c  | 43 +++++++++++++++++++++++++++++--------------
 linux-user/mmap.c  |  7 ++++++-
 3 files changed, 35 insertions(+), 30 deletions(-)

diff --git a/include/exec/log.h b/include/exec/log.h
index d131a3140d..ad0a40cfeb 100644
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
-    FILE *logfile = qemu_log_lock();
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
index 6aed4929ab..2bdee78019 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -857,21 +857,36 @@ int main(int argc, char **argv, char **envp)
     g_free(target_environ);
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
-        qemu_log("guest_base  %p\n", (void *)guest_base);
-        log_page_dump("binary load");
+        FILE *f = qemu_log_lock();
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
index c125031b90..1aa343a491 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -630,7 +630,12 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
  the_end:
     trace_target_mmap_complete(start);
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
-        log_page_dump(__func__);
+        FILE *f = qemu_log_lock();
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


