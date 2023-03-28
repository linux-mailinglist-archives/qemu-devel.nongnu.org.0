Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC1E6CCDCE
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 01:00:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phIGn-0006vn-To; Tue, 28 Mar 2023 18:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGl-0006uM-2M
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:23 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGi-000755-CQ
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:21 -0400
Received: by mail-pl1-x62a.google.com with SMTP id ix20so13181197plb.3
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 15:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680044299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cVAvx2zSwe31o8U36gPBJxc74TN10+p8dpIidum+zXQ=;
 b=MuULEQ/cPZSUthVsMswmpGgsuX74JMHQ5LIT7gPB5VtQHCTfrR9fUdIZqjbAzLLUgh
 6y5P/urCpXxewPHEhPAVYgsnbZ/yPA57BPN3MY4OaJaF44cW87tNGUoXcG0ft74sMx5P
 7RinFUfCbccpbQf335sDemINxeLpXz/sqCzFGruZOjvZHR/zsQ6/rfD1XZJQWT65/yXW
 yQ5Q4yX4bgCjECdWEf2LdY11Gsh2f81PjnIl+gcyiUBygXJ+M0jvgXyFvs65OnZXjeA5
 p+gkxswavOZABQ/D31FByjVUOg6dRVF0pxTUL7Z2i/kd+WGYRB3Bvb0ne5qp8osuFqp6
 jodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680044299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cVAvx2zSwe31o8U36gPBJxc74TN10+p8dpIidum+zXQ=;
 b=5oh7U0bbeoGL2whz2/R15YRySMALaouv1wHoJcGthC7pNOUtf9uEjyTg79BIkPnBhF
 5ieVKcfU+sSbhMhHto9Uqls2zQhmw5e5u9ygQxC3lHZoNhCzSVtx0AWG6pRHIFWv6tgm
 ZzPLToXQIGjLEPJ1w75ZbLgHHz6ddl45mXKBTc10MnoUX5xhmdOuOrzUdmPMnWZk7HFe
 3kigZga6GJWkFQLljC+wCAAWL9CrE8xPQzBnK1A6ZegzN7WcN+9edNEoAAg+ZTxjwTBL
 xzrJ8KjE3CJBEx8upYCI41g0IPVhQxbo3jzkPTANIwp6V33soFIFeIg8cm8dA9cIJwJK
 M0PQ==
X-Gm-Message-State: AAQBX9fUIfZeihFV9BPjReFTU10RdvmrKY3Ulzv3x8E8WNIBSqnh6r/a
 jZeG4ix/xkqJmNg7nvmoVphntAkp04r0D9mXuEE=
X-Google-Smtp-Source: AKy350bAto/4tOHU3KQqFt22iveN8+4PT8LLuAVjF41b6e8+Kk8cdSVmmfB3Suk4mimdgf2FvEB9JQ==
X-Received: by 2002:a17:90b:1b4a:b0:234:1d1d:6ae6 with SMTP id
 nv10-20020a17090b1b4a00b002341d1d6ae6mr16960318pjb.1.1680044299261; 
 Tue, 28 Mar 2023 15:58:19 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:c23d:b6:6be1:f147])
 by smtp.gmail.com with ESMTPSA id
 jw1-20020a170903278100b0019cd1ee1523sm21670633plb.30.2023.03.28.15.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:58:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 12/15] linux-user/arm: Take more care allocating commpage
Date: Tue, 28 Mar 2023 15:58:03 -0700
Message-Id: <20230328225806.2278728-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328225806.2278728-1-richard.henderson@linaro.org>
References: <20230328225806.2278728-1-richard.henderson@linaro.org>
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

User setting of -R reserved_va can lead to an assertion
failure in page_set_flags.  Sanity check the value of
reserved_va and print an error message instead.  Do not
allocate a commpage at all for m-profile cpus.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


