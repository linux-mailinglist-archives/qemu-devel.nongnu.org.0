Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC066C4F0F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:10:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf04l-0003fY-Sr; Wed, 22 Mar 2023 11:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf04K-00031y-E6
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:08:07 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf04H-0007Fk-Dw
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:08:04 -0400
Received: by mail-pl1-x634.google.com with SMTP id w4so11476669plg.9
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679497679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fXNPlCQTG4Q+TjXBR7MVbKgvdvefxmvjapXjC24wVMI=;
 b=T3dyVMMOzUItdSj38r3iKSVE/xo8/sV3BNryvESme5fdvW2qJKMTmncOlVJ3Sx1Hde
 qgUA3kXvYkMW7PP+ug+V6MrmTvvGrj4S3OhOsx+CTbhWUmlY+TkMcwMN6h01m223XpUX
 sA+SxVHHz9X2fX3DVeylD2ucV1PRcXWr0UyxzMVILaDczLAeI9zywN1khxk/frJqY3pr
 oq5NZLPCfOfRM09vFXAukLW86QGcx9Wi5SYOke2tGT6D4Z9ZeEUN3Y+jhynt6VRO4ZbA
 lGWRO3JFAnvELJyLMCbSolSZPXn46vFGEsIcAWf7fmWqrl6LtwBql4bQTa1aguISinu6
 FQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679497679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fXNPlCQTG4Q+TjXBR7MVbKgvdvefxmvjapXjC24wVMI=;
 b=tbo5msfYoLuxxF2TK0S+d8jjweHo3ib0gYXItSGeWyFcvwGc2/UA579SUHrc2M7aix
 tYv2i9ob5Z20o5z7PCzNe0NFJYVnj2IBURM2QjyIBm41SqPk1yBaBvA0m54jmMMm30BB
 swuUPt6Syoe0uoM3V/wrkvhNXlCvGjtqLHCkGLggURH7Quif0yA6C6pY8/4CF/xE3hwQ
 rtNeSoMWPdY0ypdu6BV7FNsdcWHfBPmAGpaKIrKUq/MNMURNF49BGnN6j4yHpe7J5EJr
 va4Qd6xiKtNuAAewQB/0rrZ/F3FeS1G3rnQCHUx3Cf8WvMx6iwRkCx0n7scsbWi5fFDv
 Wvhw==
X-Gm-Message-State: AO0yUKWrQ7ta5GEczGZ/bL9XaFOe0YmFCblptsOL4QuIgQ1lo9HdcF91
 j8qL5kOpBk2TGKrKLjZpB/SL9lKB89Ik5i9h0XU=
X-Google-Smtp-Source: AK7set/HQCW7Uu84UIMwxKL55fvfWjpbjKubfdFMZbSx35CrClVv3yq2dp1LX7zHObwM9YGWPM/7Pg==
X-Received: by 2002:a17:902:e8c3:b0:19f:3e9b:7527 with SMTP id
 v3-20020a170902e8c300b0019f3e9b7527mr2434439plg.61.1679497679477; 
 Wed, 22 Mar 2023 08:07:59 -0700 (PDT)
Received: from stoup.. (24-113-166-229.wavecable.com. [24.113.166.229])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b0019339f3368asm10757555plo.3.2023.03.22.08.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 08:07:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	peter.maydell@linaro.org
Subject: [PATCH for-8.0 11/11] linux-user/arm: Take more care allocating
 commpage
Date: Wed, 22 Mar 2023 08:07:44 -0700
Message-Id: <20230322150744.175010-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322150744.175010-1-richard.henderson@linaro.org>
References: <20230322150744.175010-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

User setting of -R reserved_va can lead to an assertion
failure in page_set_flags.  Sanity check the value of
reserved_va and print an error message instead.  Do not
allocate a commpage at all for m-profile cpus.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index b068676340..0529430b1d 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -422,12 +422,32 @@ enum {
 
 static bool init_guest_commpage(void)
 {
-    abi_ptr commpage = HI_COMMPAGE & -qemu_host_page_size;
-    void *want = g2h_untagged(commpage);
-    void *addr = mmap(want, qemu_host_page_size, PROT_READ | PROT_WRITE,
-                      MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
+    ARMCPU *cpu = ARM_CPU(thread_cpu);
+    abi_ptr want = HI_COMMPAGE & TARGET_PAGE_MASK;
+    abi_ptr addr;
 
-    if (addr == MAP_FAILED) {
+    /*
+     * M-profile allocates maximum of 2GB address space, so can never
+     * allocate the commpage.  Skip it.
+     */
+    if (arm_feature(&cpu->env, ARM_FEATURE_M)) {
+        return true;
+    }
+
+    /*
+     * If reserved_va does not cover the commpage, we get an assert
+     * in page_set_flags.  Produce an intelligent error instead.
+     */
+    if (reserved_va != 0 && want + TARGET_PAGE_SIZE - 1 > reserved_va) {
+        error_report("Allocating guest commpage: -R 0x%" PRIx64 " too small",
+                     (uint64_t)reserved_va + 1);
+        exit(EXIT_FAILURE);
+    }
+
+    addr = target_mmap(want, TARGET_PAGE_SIZE, PROT_READ | PROT_WRITE,
+                       MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
+
+    if (addr == -1) {
         perror("Allocating guest commpage");
         exit(EXIT_FAILURE);
     }
@@ -436,15 +456,12 @@ static bool init_guest_commpage(void)
     }
 
     /* Set kernel helper versions; rest of page is 0.  */
-    __put_user(5, (uint32_t *)g2h_untagged(0xffff0ffcu));
+    put_user_u32(5, 0xffff0ffcu);
 
-    if (mprotect(addr, qemu_host_page_size, PROT_READ)) {
+    if (target_mprotect(addr, qemu_host_page_size, PROT_READ | PROT_EXEC)) {
         perror("Protecting guest commpage");
         exit(EXIT_FAILURE);
     }
-
-    page_set_flags(commpage, commpage | ~qemu_host_page_mask,
-                   PAGE_READ | PAGE_EXEC | PAGE_VALID);
     return true;
 }
 
-- 
2.34.1


