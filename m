Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7398930E304
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:04:28 +0100 (CET)
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7NRz-0000T6-HU
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOK-0007FY-WD
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:41 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:45391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NO6-0001Xj-VP
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:40 -0500
Received: by mail-pl1-x632.google.com with SMTP id b8so362274plh.12
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DceYI7nDpGrVro6uaTXIjIpKu8QfbL7pTtHCfGP3Jms=;
 b=GcUrX1bYOYhl4MvrWAHmDA7Eg15uktSIInOMHA5T0nXlEYaKWeo44/gJN1tSn/QMOj
 y7IDpDCgu01UfgDoIdgvwQIWxz3tv1/Et+MiFPMiqhDd3xsWwah2o3hvntuNdpmUX8Mr
 P/HdLoSWPiBz/MQGPTHat+1tUh6WwgPlds8kh1k4xNQuMn1YfY4xiMg1DsBXNBIF5zPV
 jr0Ll0Zf9ewIdkiwSF61xiT6f/b/ImPWO1gx021Cj20LWxKyJ6pzb7AxEcXenj8987rr
 iUNXGhhEttmqhIrSKB1dBX0nALMZ6EjvXypwTTQw4znYeAi0I9T7dfrrsnlBp8DA61E8
 z63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DceYI7nDpGrVro6uaTXIjIpKu8QfbL7pTtHCfGP3Jms=;
 b=B3VH117B6t/6cg8+keYHn2Xf7oa62+vtxcbwRpZJNclOhrPcVhEdejAWMq5jq59TFs
 uKfAMk2gLcXsQ0ZGN0OvYz0tTEeGzugbMBSp/SRU69iPj/uwPRHAmxFMebqRHXAven/O
 VGEQVLyuS7c4tuK9HkegzISauubUtf0iAPH/ZmJRWAXwZwDg8C7JhIwovQiCRf8Cbeto
 3uyojXyNXlmmQI0lpRfmKdUKaK5jej58oZRKqhJ7Qy73Gafrnf0uTxB1Iigw8wcZyyJ+
 /ufVIGG8QXCYLYfahlKUjMmV968/J5Lg2jKzxxsP2sW+bCJIpJlzxTQwoScSGthulJIA
 2pxA==
X-Gm-Message-State: AOAM531FIeo7v2yCzzkWnhB67epnPjheHRuXwNIDJeL+WpUIHtg3MZvT
 0aqKcaSjshUK8yAPh+HirXJ3PJrdcaNgzywy
X-Google-Smtp-Source: ABdhPJwZDNFh3jli4X44pv5oIeJDtUmUDC9w6JEMIIsbMoadIUwqu+TYPvzXjUq/U1C9C5kNday3Zw==
X-Received: by 2002:a17:90a:7143:: with SMTP id
 g3mr4571351pjs.196.1612378820687; 
 Wed, 03 Feb 2021 11:00:20 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/31] exec: Use uintptr_t for guest_base
Date: Wed,  3 Feb 2021 08:59:42 -1000
Message-Id: <20210203190010.759771-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


