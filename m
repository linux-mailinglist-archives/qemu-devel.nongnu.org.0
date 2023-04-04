Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985EF6D67EB
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:53:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjixR-0006yE-Qs; Tue, 04 Apr 2023 11:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjixO-0006vA-Bi
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:52:26 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjixM-0004uu-LD
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:52:26 -0400
Received: by mail-pl1-x62a.google.com with SMTP id c18so31693792ple.11
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 08:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680623543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZDfd7ct7wzbilubUOyiCb11C3SBKGvBqjiC3GyKJqDQ=;
 b=dWt3W6DngnlilRvCb2mSTe/G1dSM9sYrKAy4oRRQhiFU0qcO9ETq63DXVE38RrqAZd
 ZvKs2F66d3Ig/6JeVntGqlvY68cW5muWC+yMmvzwn6xXw6bKl7byAEa3zvEFYBSeOeq0
 Ivc53INaiZN0/yjbCLSxyjYcQhf0Unk5vRpOEx5JuRHYKoCMRywGnDtTzvrYWBGzx7wG
 fV83I+kAVZ/O5tFcglz74eUVnmTCu5/q77B92kCgZ15FqSYk21K5iqgaQexL+9ES43kw
 rLINDoIz9UQA0pLVAf4sLpUV34hx7OtFcahZpTGg8hr+4xGLxoLjA2Q8wyX7nwfJJ8wp
 e1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680623543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZDfd7ct7wzbilubUOyiCb11C3SBKGvBqjiC3GyKJqDQ=;
 b=BzUGMkPi6H7RomZ7Tlr8zqezD/EysZEzgirrcf5REELBPmfeIVSKuMq0rgFlI+KRtp
 VGm9ifaADvv8KRR4TzE+QMFy6FF+0faPwRjyDu/MzXlY1Ean/z8rDUAujWX+kst+7CTw
 yl3IepLPpZYHUvRUtcz0TbOXNO/Svqs6x/bU2Rp+dCcCzqwdAIUy5Jvj+tXQ4NkVMxY8
 lWICrriCElS4mWg/RX0rL5I8elIbtHwFsxi86NFD9NB8SnjBpJnBfGwMY7NMdvMNDpIJ
 pNuzbChA6JWZoLXW+hsui3yHBHcVxbZ6oY69/Yb9fZ2q/m2j2j5CSsLIxZOcr0Z+OpXG
 /qBw==
X-Gm-Message-State: AAQBX9ewPl7iQdLFbbdy6+/6gntpXRDdkpiucDr1fUI9wlpXpxW+5Jz/
 kKzMJPuVFj3gX/TfvmfLCnmdxhF/07K/d9V1aWc=
X-Google-Smtp-Source: AKy350ZMRNI7eykQEgXMDtx1ot3ZTl7QoW9Lk+TjKhuZJfnQmZ+GvxY+v7jEaOwTund9tP51JdX7Cw==
X-Received: by 2002:a17:90b:1647:b0:237:50b6:7835 with SMTP id
 il7-20020a17090b164700b0023750b67835mr3288422pjb.20.1680623542822; 
 Tue, 04 Apr 2023 08:52:22 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:1d41:7730:d7dd:6f41])
 by smtp.gmail.com with ESMTPSA id
 nl5-20020a17090b384500b00233ccd04a15sm11562013pjb.24.2023.04.04.08.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 08:52:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 1/4] Revert "linux-user/arm: Take more care allocating commpage"
Date: Tue,  4 Apr 2023 08:52:17 -0700
Message-Id: <20230404155220.1572650-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404155220.1572650-1-richard.henderson@linaro.org>
References: <20230404155220.1572650-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

This reverts commit 4f5c67f8df7f26e559509c68c45e652709edd23f.

This exposes bugs in target_mmap et al with respect to overflow
with the final page of the guest address space.  To be fixed in
the next development cycle.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 37 ++++++++++---------------------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index b96b3e566b..f1370a7a8b 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -423,32 +423,12 @@ enum {
 
 static bool init_guest_commpage(void)
 {
-    ARMCPU *cpu = ARM_CPU(thread_cpu);
-    abi_ptr want = HI_COMMPAGE & TARGET_PAGE_MASK;
-    abi_ptr addr;
+    abi_ptr commpage = HI_COMMPAGE & -qemu_host_page_size;
+    void *want = g2h_untagged(commpage);
+    void *addr = mmap(want, qemu_host_page_size, PROT_READ | PROT_WRITE,
+                      MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
 
-    /*
-     * M-profile allocates maximum of 2GB address space, so can never
-     * allocate the commpage.  Skip it.
-     */
-    if (arm_feature(&cpu->env, ARM_FEATURE_M)) {
-        return true;
-    }
-
-    /*
-     * If reserved_va does not cover the commpage, we get an assert
-     * in page_set_flags.  Produce an intelligent error instead.
-     */
-    if (reserved_va != 0 && want + TARGET_PAGE_SIZE - 1 > reserved_va) {
-        error_report("Allocating guest commpage: -R 0x%" PRIx64 " too small",
-                     (uint64_t)reserved_va + 1);
-        exit(EXIT_FAILURE);
-    }
-
-    addr = target_mmap(want, TARGET_PAGE_SIZE, PROT_READ | PROT_WRITE,
-                       MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
-
-    if (addr == -1) {
+    if (addr == MAP_FAILED) {
         perror("Allocating guest commpage");
         exit(EXIT_FAILURE);
     }
@@ -457,12 +437,15 @@ static bool init_guest_commpage(void)
     }
 
     /* Set kernel helper versions; rest of page is 0.  */
-    put_user_u32(5, 0xffff0ffcu);
+    __put_user(5, (uint32_t *)g2h_untagged(0xffff0ffcu));
 
-    if (target_mprotect(addr, qemu_host_page_size, PROT_READ | PROT_EXEC)) {
+    if (mprotect(addr, qemu_host_page_size, PROT_READ)) {
         perror("Protecting guest commpage");
         exit(EXIT_FAILURE);
     }
+
+    page_set_flags(commpage, commpage | ~qemu_host_page_mask,
+                   PAGE_READ | PAGE_EXEC | PAGE_VALID);
     return true;
 }
 
-- 
2.34.1


