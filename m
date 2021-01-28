Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705A5308161
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:49:35 +0100 (CET)
Received: from localhost ([::1]:59058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5G6Y-0003dD-GM
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzF-0005SI-Ha
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:01 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fz5-00085C-3H
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:00 -0500
Received: by mail-pf1-x432.google.com with SMTP id q20so4972510pfu.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ro1QlxJECFSg4T0qJhYTh9dJGKCuHRxnJ3IHfAQq/RM=;
 b=TYrpS9gATOUJYsbU8tfz+MqcCiG0GJFuTz18MJvgyG8WoM4iDZo6HeTH14sZr1Sp+O
 53JEcBFkWMZ97eAL16azZ6GKpNxy+I61nm9m0XgiJU0vy8rc1SRn32zTmFIszQc0rUW6
 3IqkDlCmeLcHH0YKRL5wF+JcQivJjv/tY3hDzkSE3l79LEr+FYRgLQi642xO5b4XYJRm
 3h2tX0Vl4wKjw1kis1H3g3OobRZkzo0swpongq+lr06Sr5GXhIXvDgizER4hpXQlLBl8
 9fIcEK31i/l9ZQ7uUPzHPr+2to6mvboPxP7IJwGg0AuRP3WJZZNLvVyGik0XsNno+oP/
 4q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ro1QlxJECFSg4T0qJhYTh9dJGKCuHRxnJ3IHfAQq/RM=;
 b=is5MO1mc0WlnCiF4SjxYBZc5AQW6dPldxpdtOeyjPWj9lA3v/pWnilr1sR0XHM+Io8
 xrLtuaVGXxV8mUxVTjwxDW3Wa+0KidLLtGXSi5JOnGxFTOjgZP+2SCvtPteg6ZIEjbyi
 HaDWr0VVQGIERmR0ZPZ9xZQy1Df8cjqTOAxC5MteAHLC/5cZlvhQ+stiv4zHEMeSChv6
 jVy8riafyJfTMiLfjenX+/KBXkMrOqYCht4t5F8p87Y/0P+oGe1xt3bRzzMGEC/ONE0Y
 PwqdhvNkb4NOXA0wEQT1q4Vajii9OHGTXvgyUy7uJBaCFmcGKS2koyqBVX5qWUjrrdR9
 IwUQ==
X-Gm-Message-State: AOAM532HZvkXmRpHyDT+mCl909zc3bzjZL24KpkBZi+YXHj2H6OGLDvm
 b8Zym5oJ1uh0K/NVjLMrqQuLT9v7SSnyq1+g
X-Google-Smtp-Source: ABdhPJw67VFfy4FqDwujFVHGW8z1zMUJE/kl1DSfu+Tsrmlk7VciKWsIxH4lAadNmQSi7FuOLKCxEA==
X-Received: by 2002:a63:1f21:: with SMTP id f33mr1639027pgf.31.1611873709819; 
 Thu, 28 Jan 2021 14:41:49 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:41:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/23] exec: Use uintptr_t for guest_base
Date: Thu, 28 Jan 2021 12:41:21 -1000
Message-Id: <20210128224141.638790-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is more descriptive than 'unsigned long'.
No functional change, since these match on all linux+bsd hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 2 +-
 bsd-user/main.c        | 4 ++--
 linux-user/elfload.c   | 4 ++--
 linux-user/main.c      | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index c23c77589b..c52180e8e6 100644
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
index 65163e1396..c09d74d788 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -41,7 +41,7 @@
 
 int singlestep;
 unsigned long mmap_min_addr;
-unsigned long guest_base;
+uintptr_t guest_base;
 bool have_guest_base;
 unsigned long reserved_va;
 
@@ -965,7 +965,7 @@ int main(int argc, char **argv)
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
index bb4e55e8fc..55aac56d70 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -58,7 +58,7 @@ static const char *cpu_model;
 static const char *cpu_type;
 static const char *seed_optarg;
 unsigned long mmap_min_addr;
-unsigned long guest_base;
+uintptr_t guest_base;
 bool have_guest_base;
 
 /*
@@ -819,7 +819,7 @@ int main(int argc, char **argv, char **envp)
     g_free(target_environ);
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
-        qemu_log("guest_base  0x%lx\n", guest_base);
+        qemu_log("guest_base  %p\n", (void *)guest_base);
         log_page_dump("binary load");
 
         qemu_log("start_brk   0x" TARGET_ABI_FMT_lx "\n", info->start_brk);
-- 
2.25.1


