Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DE131CDEA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:23:52 +0100 (CET)
Received: from localhost ([::1]:44252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC38h-0006bU-GT
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32F-0006xd-IZ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:11 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC328-0002MD-US
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:11 -0500
Received: by mail-wm1-x333.google.com with SMTP id o82so2236276wme.1
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=67NjhYcvT+rwa0jI1Adgmqw2qeMw5yrlbnrugtQZnJo=;
 b=qPvfc5YGo8aVTNaf/OZxFmlU/sBdERwvkio1wdem8ghltrKUuP217ndZ5UhnhMxUff
 VVZTK2VgNcl9mpHfKmodd9bUNjuauEvbbkZY9OABqmP5pKxoUWTEF0oLoX8v5HaxXjap
 960cpkhbQZAhH224HtgHNnGuzbhKGsC1LVGw7HLghizkmIW4Gg1A/8NaqKItwJf2qdqK
 pULefDLhzPeevLfL585O53UX7svfjvpxKzNbBx5xyEqdyfYstCT0a9MZzyVVIZK1xAlC
 a/k+yVF9N034Oe9h02r9Q+TmFdek43jZbZ+5GIO7ItqXCmK/Me/C/NEVxuvMLdWoaflx
 PnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=67NjhYcvT+rwa0jI1Adgmqw2qeMw5yrlbnrugtQZnJo=;
 b=WWaoto8SFI334ep9IFWb9OaC2U4vU8+mrZ6zCSPvagdVfRc4Wbsq/3joQ8E/GqJ5gP
 paaSkz86/SpXNjttFvzcrFCCVUNvA2W2hpppWeT+N52CvzvQcnDBW7Dee/268LB8f4ye
 0FjbXswYYCrO0I6W2HiGOwX3uRaGZADx3oTa/AxN7Hmo+QLybePEKeevSZL08roJST2B
 6YgpSyWOY/PwiHG+VCHUHD4Tn4Rur89q6jUdagfy6e1txEu+5h58nvOIIWmOyaDcGpVq
 bC3G8WrXKxdw0PgcczjZNVhGtxE++KedRUzyVgGvwRNPRNFJzaXlewmswS4awO+By3Wq
 Bx8A==
X-Gm-Message-State: AOAM5321K2NPYZNqI6J3qBVTqLaNDXsHUtnM9hC6WCD8MHjd+WWBLgX1
 bCZPqZNkeJdKqDfxcn1w1Pzd0ITwaDI/AA==
X-Google-Smtp-Source: ABdhPJwGaulA2xxJ2481J4iKk67V9svxpi/l1ibcDe95E83d5UbKwelwnwvlYNc+rgOro9lztSY8rw==
X-Received: by 2002:a1c:4d08:: with SMTP id o8mr417847wmh.47.1613492222718;
 Tue, 16 Feb 2021 08:17:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/40] exec: Use uintptr_t for guest_base
Date: Tue, 16 Feb 2021 16:16:21 +0000
Message-Id: <20210216161658.29881-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This is more descriptive than 'unsigned long'.
No functional change, since these match on all linux+bsd hosts.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210212184902.1251044-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu-all.h | 2 +-
 bsd-user/main.c        | 4 ++--
 linux-user/elfload.c   | 4 ++--
 linux-user/main.c      | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index aedf5345449..937becd320a 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -150,7 +150,7 @@ static inline void tswap64s(uint64_t *s)
 /* On some host systems the guest address space is reserved on the host.
  * This allows the guest address space to be offset to a convenient location.
  */
-extern unsigned long guest_base;
+extern uintptr_t guest_base;
 extern bool have_guest_base;
 extern unsigned long reserved_va;
 
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 7cc08024e36..385d35886a0 100644
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
index f5bd4076fcf..7ec9249c256 100644
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
index 2e3c1698787..81f48ff54ed 100644
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
2.20.1


