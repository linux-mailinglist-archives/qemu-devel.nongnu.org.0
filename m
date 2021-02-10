Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0502E315A8D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:06:02 +0100 (CET)
Received: from localhost ([::1]:48554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9d16-00057D-P0
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxp-0003Nf-0r
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:37 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxj-0007y1-IE
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:36 -0500
Received: by mail-pg1-x52b.google.com with SMTP id m2so39691pgq.5
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1qHXcMeb4VFTCjSJSEVePGX+IcNMTfSnJ55HOY2nUvs=;
 b=eyt6vC1EfBsvnYCk5N+yH530rL+kPPcsrMJiDSWNeahL/WHleAYC4etP/IwhmG64Sc
 aIj2ft6ogwZzy9LyVCYPRkRl2801eRBCtJY20oDHq6CKVZIxVQH6ZqynYEIsLDu1ul6k
 TL6kuzhJMIDITSJ0syDYwykWU6HusDwfYzT8yvH4FsVkDuBufe2fsUMDSgh0x7M+ei80
 12pqG68X8uaRTkmmfSIwoZ5FKsLn+fE4FcGgI8oGDCJTRMBE0NSoI5FJh2W8y0jHDKyC
 t4pmnalelC/xQqkrN4m74YJfm50JVybOQp2X4rHD6tBZa/OtRiK58P+fVzjar6G6/fZ8
 DaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1qHXcMeb4VFTCjSJSEVePGX+IcNMTfSnJ55HOY2nUvs=;
 b=ZOWfmO9kgrtinPLYayFHJDbLDZq7NWteRl7sCa5BakSHkNhaAUE/OuernASbK2k18x
 zoYO/qlfln9HeXQyUTGdWxo/tyqVk4lazu752wb4oBBX2xX5spJig/kYZ4B2B1GdEZcc
 DrNj8Q1oY2WET+DraDmyUJ+VVGnpefUN0FXnTfZnsXM4a6L/S8OlhLSotqc/gbr1LVoq
 HGlVWPRfzUh6wI+7Ydtb5koENUTvWbLQjGrifproeyLhuC8CjorSoCMY2FgikbOl9KMH
 Vi/GxgG11Ac6CtQQgthRTAZel5fZ31HHFK7nQ+l2hNxb8JvTyxQUmmApbW57nLnZhDtv
 qRzg==
X-Gm-Message-State: AOAM533AnhaagO/m84n7Eum2QaUyLI9iRYldkFje60E9fiWrIqfY9m26
 6LgCMtZyD8rWyvH4TTFoU96aj2sny58x6A==
X-Google-Smtp-Source: ABdhPJzd5kr5IaBXTFv7r9IG0Ijr4QTQ9zDugUEopGMt075Mnj6JpGH4zAfcU6EbznYgDy67HuqtAA==
X-Received: by 2002:a62:ce82:0:b029:1d9:1872:294b with SMTP id
 y124-20020a62ce820000b02901d91872294bmr402059pfg.36.1612915349328; 
 Tue, 09 Feb 2021 16:02:29 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 03/31] exec: Use uintptr_t for guest_base
Date: Tue,  9 Feb 2021 16:01:55 -0800
Message-Id: <20210210000223.884088-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is more descriptive than 'unsigned long'.
No functional change, since these match on all linux+bsd hosts.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 2 +-
 bsd-user/main.c        | 4 ++--
 linux-user/elfload.c   | 4 ++--
 linux-user/main.c      | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 1f47e0fe44..d6ad774c01 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -158,7 +158,7 @@ static inline void tswap64s(uint64_t *s)
 /* On some host systems the guest address space is reserved on the host.
  * This allows the guest address space to be offset to a convenient location.
  */
-extern unsigned long guest_base;
+extern uintptr_t guest_base;
 extern bool have_guest_base;
 extern unsigned long reserved_va;
 
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 7cc08024e3..385d35886a 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -42,7 +42,7 @@
 
 int singlestep;
 unsigned long mmap_min_addr;
-unsigned long guest_base;
+uintptr_t guest_base;
 bool have_guest_base;
 unsigned long reserved_va;
 
@@ -970,7 +970,7 @@ int main(int argc, char **argv)
     g_free(target_environ);
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
-        qemu_log("guest_base  0x%lx\n", guest_base);
+        qemu_log("guest_base  %p\n", (void *)guest_base);
         log_page_dump("binary load");
 
         qemu_log("start_brk   0x" TARGET_ABI_FMT_lx "\n", info->start_brk);
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index a64050713f..29f07bb234 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2135,9 +2135,9 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
     void *addr, *test;
 
     if (!QEMU_IS_ALIGNED(guest_base, align)) {
-        fprintf(stderr, "Requested guest base 0x%lx does not satisfy "
+        fprintf(stderr, "Requested guest base %p does not satisfy "
                 "host minimum alignment (0x%lx)\n",
-                guest_base, align);
+                (void *)guest_base, align);
         exit(EXIT_FAILURE);
     }
 
diff --git a/linux-user/main.c b/linux-user/main.c
index 2e3c169878..81f48ff54e 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -59,7 +59,7 @@ static const char *cpu_model;
 static const char *cpu_type;
 static const char *seed_optarg;
 unsigned long mmap_min_addr;
-unsigned long guest_base;
+uintptr_t guest_base;
 bool have_guest_base;
 
 /*
@@ -824,7 +824,7 @@ int main(int argc, char **argv, char **envp)
     g_free(target_environ);
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
-        qemu_log("guest_base  0x%lx\n", guest_base);
+        qemu_log("guest_base  %p\n", (void *)guest_base);
         log_page_dump("binary load");
 
         qemu_log("start_brk   0x" TARGET_ABI_FMT_lx "\n", info->start_brk);
-- 
2.25.1


