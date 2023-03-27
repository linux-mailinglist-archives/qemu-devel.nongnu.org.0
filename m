Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91566CB08D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 23:20:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pguEn-00047j-Rg; Mon, 27 Mar 2023 17:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEi-00046J-2Z
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:40 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEg-0005yE-AC
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:39 -0400
Received: by mail-pl1-x62f.google.com with SMTP id le6so9712891plb.12
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 14:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679951917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7lxGf1yuxDu4kIT1pIcReLXt+iruvwgyqtSwsIeLLWw=;
 b=pGr4z01WQZ7l2fDcHgqFnsWBdzt0IAmW7MgQ8W+m5lIgSosjj6MTxWQ/XfGx1DzWzy
 Jq9R8ZkecENWdYzfRjWIjA2epoyxiU0BqwT7kHxyLRr6pi+5JzEnUPkR0J1Ned2/78Sm
 CEOeq2lEgVVNC9TIarHzjW5FywohUKWWdFlzX0Pv6ik0WCsIqiPC7pdB3oXrAjHMMADM
 cB9tNY7OZo13NNlt3d/OUMwSdAntSrgUKn17NoAAyCgTTP5eiiciOXfBpq8rGiyo+Ih6
 qM27ZXgJPj4Fo+j5VscKhSk70YyivJvQsRNjjZZ/yGdinDhx08ls+3HuSqnZeiYJGx6g
 0U0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679951917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7lxGf1yuxDu4kIT1pIcReLXt+iruvwgyqtSwsIeLLWw=;
 b=EvgscuN1v0ozz2P6iR+OkZ++w1Is6qiROF1j8cjQkCgSIff5ViPlJrvVNYOm+VbbTA
 sbAXfx8U/JtWN4uBH7MB1wxF4jb7GXlCCKF8COHWLuD7jY34mxTvIamwp4fOwI7lFG1K
 OATzs9scUo7aAdW+3djxYsbs2t6S7ob+Ih3g0O9ixG10fVMnwEUvXMV/gZXflkw+M2iC
 IpNivPp06BgEsIoQp9v5OA5QADCQw2s02dHXdjz2OW6ohc+WdYkqa53ZXRto3LYdmFuN
 0tFkn85gXoeiBb86wvxTKcOlNoNzbPSZfcnXs4hlIqfB4+964l/wSZDhKbUmGc/j0Jzn
 HFEg==
X-Gm-Message-State: AAQBX9evD8OJpD9f9PHajy8/hcTPYD/bo5yNyDwQX6QDRZNJct6W1zkM
 KVoxaVOgl6r8xvRcaOMkc5onDeUy4NwtUIjd+/k=
X-Google-Smtp-Source: AKy350YPn52mPAe+l4+gSNEZVeHrDwkkOpncD8fU6G10rRVyPSxGsrZl5HvdC892PZX+d7ZATWaX1A==
X-Received: by 2002:a17:90b:1b47:b0:23d:5040:a88d with SMTP id
 nv7-20020a17090b1b4700b0023d5040a88dmr14170607pjb.14.1679951916872; 
 Mon, 27 Mar 2023 14:18:36 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a17090a6f0200b0023440af7aafsm7902708pjk.9.2023.03.27.14.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 14:18:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH for-8.0 v2 12/12] linux-user/arm: Take more care allocating
 commpage
Date: Mon, 27 Mar 2023 14:18:24 -0700
Message-Id: <20230327211824.1785547-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327211824.1785547-1-richard.henderson@linaro.org>
References: <20230327211824.1785547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
index f1370a7a8b..b96b3e566b 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -423,12 +423,32 @@ enum {
 
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
@@ -437,15 +457,12 @@ static bool init_guest_commpage(void)
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


