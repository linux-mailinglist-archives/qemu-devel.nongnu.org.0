Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC99A318BEC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:25:51 +0100 (CET)
Received: from localhost ([::1]:51742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAByg-0004fR-P7
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYx-00082s-CT
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:15 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYv-0008Pj-GV
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:15 -0500
Received: by mail-wr1-x42e.google.com with SMTP id z6so4051024wrq.10
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Gp/a/dceSKg/i2f6bwOBGMj9RSJz04wOVY62te5/QwU=;
 b=agxCnFfUTOyQgoupOI8jUDCq79cnLZ0KDLyJh8gUIM4ziYpx8kns9sIiwUY7JrV7js
 U9dTY+3VYYZ1C5gB+bVZyuz4+Kh6zZObFennlyKoer2bf+xWVv8mMalA9kmyQVEOyRqw
 T0sstBxL1IztRhHdAVI7omIi4T0RlJTCkOJv7ag1BniEydaCfPJ0YxDeXnrVLN1spGVG
 PqAYvGBVBoS3Q1zZX3AVS5WVMZ+A3aLFyTC5G50ASkxt4wMJoj8hdFDc5WV21cSrltJv
 PytEYkzy2iz9iGq3NHZrstbhqynZU/HpVhjO6XRd+4fTZAW1yGFta8PJweU58nu+qEzv
 K6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gp/a/dceSKg/i2f6bwOBGMj9RSJz04wOVY62te5/QwU=;
 b=pqR/dTkoerAQwpcjM0DSaZuzUi3wtCXZuBBMyUdmyElCifLTSHfbBxu4EuvL0NNOty
 wF4m09aYyK7GQtXLeN18VaNETm6+Jzucm3BIAWM/iCPYcndAbvNq1+U6HLU4hiXbSrwC
 NrNKeO6ITVXrIb0ukaQ1dSp6+oOdh/Wr24KGtBtM+n2loQSaL+VcdZdZdCMAGYiTT9tC
 XMz43o+dKvEX8eB7UOD+8DFpZZ6PnrPRuYoqhM/Hvjkd3XHj+3BKx2GsY+IYLYSwqVQH
 HcwxTsqEI4kgekrKgexLNgUXpNR8K0avNmRq3O/0k5RhTx9Y2TLKSWgjD9YEOaCfHkL7
 ph3Q==
X-Gm-Message-State: AOAM532DJtanPPrpi8okRCgyILChmjm0OS4/RaSKxvYlDcFlzxSygoMb
 DMkUp5JkpdRazIOOO9H7KJNGzMfJTF5bsg==
X-Google-Smtp-Source: ABdhPJz6FKTUHocf2RvsHKNs7TyKRhe4GBxbWYBAq6F/nXOU5BavDzFqbFowF9we3vIuipsKTigMmA==
X-Received: by 2002:a5d:408a:: with SMTP id o10mr669215wrp.427.1613048351985; 
 Thu, 11 Feb 2021 04:59:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/45] exec: Use uintptr_t for guest_base
Date: Thu, 11 Feb 2021 12:58:27 +0000
Message-Id: <20210211125900.22777-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Message-id: 20210210000223.884088-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu-all.h | 2 +-
 bsd-user/main.c        | 4 ++--
 linux-user/elfload.c   | 4 ++--
 linux-user/main.c      | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 1f47e0fe44a..d6ad774c015 100644
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
index a64050713f2..29f07bb2346 100644
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


