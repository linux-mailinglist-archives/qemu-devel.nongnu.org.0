Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42245645CB
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:29:57 +0200 (CEST)
Received: from localhost ([::1]:43662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7uzM-00076C-PV
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuA-0006H9-VI
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:34 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:42561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uu9-0005o4-AK
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:34 -0400
Received: by mail-pg1-x531.google.com with SMTP id o18so5068364pgu.9
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vbeQfFOZRxgjST6VhHPHw0Aocd+Vk/eMVmhwzhfwMAo=;
 b=IZFadF2JtOwSikHfzQhBY1cZBZ3jjvQ1v5FyHvncvCFiKugtcp1mkbottcr73UE5wF
 /jL7fLaCRlPhYUQ1a6oFjNlMEh9goQW67mviJ0esESdRGlNfWYZF+pVrMKmYIT0h5xlw
 E5ROtB57nvNN0+8m9n330ixsDtPpKaU1hWLGR2cjTT0wIOo71JvN0G2dYt7I5JuXXxcZ
 QjLGpIUYzCeSNqjFaKVK6mNWXnV8eu3wtzgduy/lVz7qw4fTu0uLDX6s7OYaJAhWLEJ3
 uNDd23W3ELgDP4BoBpACw/K+/f7xCmXmyfpXTj9btDKitVNuVqJKLfKq8JYu+OHfStP8
 x40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vbeQfFOZRxgjST6VhHPHw0Aocd+Vk/eMVmhwzhfwMAo=;
 b=X+iwMhpWLh4RD/xdevKQ/5zoumUgjYMyXTzIQHmNFtxjLKJujkZYs00jWJ9dfCnNo2
 WXmRIuWGOoAVr8abwIXvm8CV01i3rqBXmeHDJdq5lfQVef6zGU6838L29AHJ0rnWOp8S
 D9DUWqi5zQOeRlgnCQbl6fHCGU81ATlqCZhD1EHvwLObhelTCFVqjAGVIZOvijpt8odw
 d7k2jAuO+u8G9lKu5q4pEBVXrmaQ5ugsy+J7GxLlHdGSveD/QAa/GEEVWZBZzNcqUXix
 RUbY4mwCK4de4spaU6+EleNLd6iTIoYdy3CZUkrEKxL3T3SAQlfLhh85lB2lHcYYcVPE
 2RCg==
X-Gm-Message-State: AJIora8y/JhwP+3/BSvknoGOYJ5udffu/XKM4JtpdpjitUzY60e5WqA6
 yPHwxzJ4BVIDoHskeRKKH7CGMnxrpCn3BmMu
X-Google-Smtp-Source: AGRyM1syg3XrPUPig/NL2e6WvREAZJWtMfb2DR41/burYGdMTCLUOYijn76tsgHKCJvzgRkxKsge8Q==
X-Received: by 2002:a63:6cc8:0:b0:40d:e553:f200 with SMTP id
 h191-20020a636cc8000000b0040de553f200mr19271338pgc.166.1656836671862; 
 Sun, 03 Jul 2022 01:24:31 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:24:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 02/62] target/arm: Enable PageEntryExtra
Date: Sun,  3 Jul 2022 13:53:19 +0530
Message-Id: <20220703082419.770989-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy attrs, sharability, and the NS bit into the TLB.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h  |  8 ++++++++
 target/arm/internals.h  |  5 +++++
 target/arm/tlb_helper.c | 14 ++++++++++++--
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 68ffb12427..a14f167d11 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -30,6 +30,14 @@
  */
 # define TARGET_PAGE_BITS_VARY
 # define TARGET_PAGE_BITS_MIN  10
+/*
+ * Extra information stored in softmmu page tables.
+ */
+# define TARGET_PAGE_ENTRY_EXTRA
+struct PageEntryExtra {
+    /* See PAGEENTRYEXTRA fields in cpu.h */
+    uint64_t x;
+};
 #endif
 
 #define NB_MMU_MODES 15
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c66f74a0db..2b38a83574 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -74,6 +74,11 @@ FIELD(V7M_EXCRET, DCRS, 5, 1)
 FIELD(V7M_EXCRET, S, 6, 1)
 FIELD(V7M_EXCRET, RES1, 7, 25) /* including the must-be-1 prefix */
 
+/* Bit definitions for PageEntryExtra */
+FIELD(PAGEENTRYEXTRA, ATTRS, 0, 8)
+FIELD(PAGEENTRYEXTRA, SHAREABILITY, 8, 2)
+FIELD(PAGEENTRYEXTRA, PA, 12, 52)
+
 /* Minimum value which is a magic number for exception return */
 #define EXC_RETURN_MIN_MAGIC 0xff000000
 /* Minimum number which is a magic number for function or exception return
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 7d8a86b3c4..9de3099153 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -226,21 +226,31 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         &phys_addr, &attrs, &prot, &page_size,
                         &fi, &cacheattrs);
     if (likely(!ret)) {
+        PageEntryExtra extra = {};
+
         /*
          * Map a single [sub]page. Regions smaller than our declared
          * target page size are handled specially, so for those we
-         * pass in the exact addresses.
+         * pass in the exact addresses.  This only happens for M-profile,
+         * which does not use or require PageEntryExtra.
          */
         if (page_size >= TARGET_PAGE_SIZE) {
             phys_addr &= TARGET_PAGE_MASK;
             address &= TARGET_PAGE_MASK;
+
+            /* Record some particulars for later lookup. */
+            extra.x = phys_addr;
+            extra.x = FIELD_DP64(extra.x, PAGEENTRYEXTRA, ATTRS,
+                                 cacheattrs.attrs);
+            extra.x = FIELD_DP64(extra.x, PAGEENTRYEXTRA, SHAREABILITY,
+                                 cacheattrs.shareability);
         }
         /* Notice and record tagged memory. */
         if (cpu_isar_feature(aa64_mte, cpu) && cacheattrs.attrs == 0xf0) {
             arm_tlb_mte_tagged(&attrs) = true;
         }
 
-        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
+        tlb_set_page_with_extra(cs, address, phys_addr, attrs, extra,
                                 prot, mmu_idx, page_size);
         return true;
     } else if (probe) {
-- 
2.34.1


