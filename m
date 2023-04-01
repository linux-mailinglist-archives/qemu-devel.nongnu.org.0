Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648616D2E37
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 06:52:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piTCw-0003rt-J9; Sat, 01 Apr 2023 00:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTCr-0003qh-RZ
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 00:51:13 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTCo-0003Nz-8c
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 00:51:13 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 p13-20020a17090a284d00b0023d2e945aebso10093630pjf.0
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 21:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680324668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kiULY7hI3dkf5M/9do5JIhSCZ7Y5eX3RA+ervNTgBK8=;
 b=UDg0lR/0pRSWX6TCc3shno0pfhNggxNqN1QEDq07xnQw6ZMGtnLm/mv734ZFMtgDIN
 avPhobF60hxnm6SzZBWxZJetWN1ZzkcW6qbdzyHERDeNxD3IXGJ+a0glO2Xruq2p7kCC
 ZbV2S+ceF3WZs984DjTuByQrA5Ct0Su72tOQNkZoGmZeajPJJ6mval0KTJXhM0yyHgfa
 p1F7XOtdOnIGlwz9rONx3jYmZlHIi9s8ocw7nx8tKIyALxBeHjS09oD9ILwSiMDGd9HO
 1tLihRcpCiNVq808H1/BQQm73EHJ1v+i2T0LMDHYRoxELogXK8YHRqkBFV8CZ92CEJTo
 fEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680324668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kiULY7hI3dkf5M/9do5JIhSCZ7Y5eX3RA+ervNTgBK8=;
 b=otlSPiaFEpRMcwyYVVgnUqa3dM10htTDANmVkb6C6L5An3DESa6JTDTfKRmcd76xl+
 ovGUbc4REUYPQhABCb0a4mDwIdk1QNF7xrpihf+kygEGtCNcJI2GSXypD3RY7GP3Y3Va
 xdMfK7AZpcHKn/G+okBlIXVv1Z9GJL8OMa4lTxAaOaRtIy+FAyB8hUNelXwrWB4MkwDg
 j/BmHj9kLDcVQpO5ZSrGXY1QiyMa41L/YfpviqF/n/mASLeoEw30LfPBdmhQwbQl7YA3
 ftScGaQNtsJ9vQHugt/pL7sKHIWFu6jlSAZzk2TSrQu0u3pIdRE2iyLMUYOcPB3zXAgT
 ypNw==
X-Gm-Message-State: AAQBX9cKpU1UY577KHR4d02CMQlV63ZOm3kek5otWllMKTQhoZvUqpPB
 HkqkV5ebwZgP+Djv/jnwY/B1EOPCWjlmHztfNek=
X-Google-Smtp-Source: AKy350Z3T2czxAI5nsXIehd/nCxwowz67PSCQGMy0Kqu80pmKpsVwRRXTqVp2gj6tK179xAhDomdUw==
X-Received: by 2002:a17:903:1d1:b0:1a1:ad5e:bdbb with SMTP id
 e17-20020a17090301d100b001a1ad5ebdbbmr38676830plh.36.1680324668564; 
 Fri, 31 Mar 2023 21:51:08 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a170902ee9100b001a24cded097sm2360122pld.236.2023.03.31.21.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 21:51:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 1/3] Revert "linux-user/arm: Take more care allocating
 commpage"
Date: Fri, 31 Mar 2023 21:51:04 -0700
Message-Id: <20230401045106.3885562-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230401045106.3885562-1-richard.henderson@linaro.org>
References: <20230401045106.3885562-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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


