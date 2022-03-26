Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430AB4E813F
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:59:35 +0100 (CET)
Received: from localhost ([::1]:43768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6x4-00025J-Ad
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:59:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6R3-0007Zq-Bc
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:30 -0400
Received: from [2001:4860:4864:20::29] (port=36754
 helo=mail-oa1-x29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6R1-0005X0-DN
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:29 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-dda559a410so10744415fac.3
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UBUdVtyUYy7eWABhSXggubY5JYSwV4Dsg0nD3y0Kids=;
 b=AvpCW/zWvmQyC8hmYLgUDJUqOXSmzDau5tDMvG8/dWPZtQ713EThwvN8xebcNxGcsn
 q9LLQ+Pvs+Fvom6xbZcVb4KVlkaIhZp96eyCZAcuy2RRLj4YuHLXJGuii/uwc4cqCjPu
 D6weYNq19yPZ1s0h2IJ5yIj93JXkaG7DkusNIZfLlMo3XewSOxZgJpPJy1CW8qZxASAm
 ePd/2Zi2c3Y5LGVJZkjRIMz5P3ubrIiCoZ3vaDa4OXkJPcC8g0GKCoqALD6kC16B15ao
 nJ1G0LyX5pQVmfcWY4yHn+RoJyWLXGRtC26Z4908nXPfMstaZU1ksdPiuBUE/eqREkUq
 8KGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UBUdVtyUYy7eWABhSXggubY5JYSwV4Dsg0nD3y0Kids=;
 b=Qru9pu20KiqP4z8fjTHS6UjPH6WwHIdV8ffO4Jn2uVl8Pfc4yCBKeJLXCPjq0JTZMT
 o6o5MjiO1QaZh9KmACshMOdHz7M8dYoCvzIbgtxZBbP31Rbr7Ao/c8MWUjut11/V9yST
 u8vqBIAL754ildNS1V87Yl09TjprFuzpzTR317AKPxuzEBwy+IrGAF2wI1JjzraIrxop
 Wg+77N3R9kJnLRM/1sNPCUnEC3BlFY2Olal+V93L6m3LNyS0L+j0mVJXWKw08B6xr4E1
 6icMcsxiWV2BGokjsEOr4JXAhHbVjbxUnaBwNC5/272SdPerwt1XKG29o0N6E96lf/B/
 /wKQ==
X-Gm-Message-State: AOAM530UIneXK217aZJARJjvHGbGJaO8LB0+ZjtTFXakfki+jHFTJ9xH
 AKFtTcfREsGETGDutBlLznY2uSIVTdj5K0bX
X-Google-Smtp-Source: ABdhPJwsSMIzGP/ly6h+calhR+aG1bDzCT+a+dQYARJ0CKW4fYI8g0ijkGJ4Ul6kCVp66qQ1dlXvzg==
X-Received: by 2002:a05:6870:14d6:b0:dd:9907:2c4c with SMTP id
 l22-20020a05687014d600b000dd99072c4cmr7201371oab.70.1648301184793; 
 Sat, 26 Mar 2022 06:26:24 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/39] linux-user: Expand log_page_dump inline
Date: Sat, 26 Mar 2022 07:25:17 -0600
Message-Id: <20220326132534.543738-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::29
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


