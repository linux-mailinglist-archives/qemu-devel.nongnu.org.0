Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7B831A4C9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:54:08 +0100 (CET)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdZv-0005Q8-2I
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:54:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVA-0001V9-DI
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:13 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdV7-0007fz-9O
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:11 -0500
Received: by mail-pj1-x1029.google.com with SMTP id d2so148771pjs.4
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1qHXcMeb4VFTCjSJSEVePGX+IcNMTfSnJ55HOY2nUvs=;
 b=eA+Ke8wrDBZs312bwy+cO1Xa9GYLnoqwTnFG/DjgZL/z4Y6dbEppo1uYTFiMRbki14
 JLG0JleS0D0YuF0hvO47j0BOI1gDnnt0jt9ajxg3MTJwSP4iWNFnxIzcX1h0dmovQqaK
 ifMS4T6LdQa2F/331ZQfKcGZFJ7MHcpYaHJAPS2j89E/iWEumW/4S8WZgE52Drhh44Rz
 KJFjr2Kg3cppLPs8iv8kfsMYXzJdlXgbC4T12Wkl7NK4Mi48D+YKO+DcqRJ4jMuynndC
 g8T7qV16B45pvsD7NdCmTrzKv1uLD715kpkVTXSUgyPe+omoPNrgFcdQy94U/YzSYD+J
 HlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1qHXcMeb4VFTCjSJSEVePGX+IcNMTfSnJ55HOY2nUvs=;
 b=uUai/Knd/KlH/SBB6NHJEOrCQZR05PQGWR9G+BXHRsNwJal0jY14AKW0Q7sWXMds4Z
 tq0VwAsbWECmwTPTIsYfQRkOxZpTiWrpKiK8QRevdnOZnOm2qSo7fs/3EyKPIOHw4bMp
 cfhSZR14q8bR1lGZkW6QpZjmYwErM3r5I3GSoN+a/ZQnNyzAuhkPqUO8e2Zncwhd9Zmx
 EPREmDkbA4uRIsxKZMRAmwPpxzjgYS3tG92+L2kn4jxE8s2x7gaX9hW3nJ9KlVWuFR0v
 mugqF7ASxd3IlfxuLvzn2un2KAJnezpbk2RYg37/S0nwAaeu9EvAT2yBlsAfo0Wo2Q1G
 IRhA==
X-Gm-Message-State: AOAM531kFybtWYBtBvbEIqozPNCZTzejM3TVe3TGaLIrybYTuPHHiyAM
 04yjofcNjzX0t/X9tV8vYH7f7TK5Tq32xA==
X-Google-Smtp-Source: ABdhPJy05OQT23lTuGl0mjL8ClE3He0i3ATNdUwPaYB10x6mjgpz9cYe3FumFHK0U/l2vPF4dolttg==
X-Received: by 2002:a17:90a:1904:: with SMTP id
 4mr3938880pjg.212.1613155747621; 
 Fri, 12 Feb 2021 10:49:07 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/31] exec: Use uintptr_t for guest_base
Date: Fri, 12 Feb 2021 10:48:34 -0800
Message-Id: <20210212184902.1251044-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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


