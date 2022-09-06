Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713BE5AE368
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 10:49:19 +0200 (CEST)
Received: from localhost ([::1]:37222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUGf-0005ac-Fi
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 04:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6D-0002Ur-I6
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:25 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6B-0005Se-Dg
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:24 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bz13so10891606wrb.2
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+TkWIdFQsuVrBlz1iMZEZBv2Eng982tGzQv+UxtokKc=;
 b=wB0mgkERKPGGxWQSodB1/D1shzl9Fdz57x52C5TOrnTOCF05wSo2ecVXXMAgYQiMyo
 8L/wiqmV/xgs3tVS9P7Qeh5AJDFgOCTo75F9gjuERSHerMbcf1RHcOz+rKSkizmAXH3Z
 2GUjCCn3eDycHaUGO/n5vUtxQ0Ffmj5kD2tDasS4DEggHVI1gYISBtz/kjhLzUJG+wDD
 HhdNVqFNq1CArhZ1llhAs5B1PAVd9UuKXYXoCa6oW2KgSijMh419NtqoUZ64HW5P3JyI
 nT3bDABxmDxWGXo/M4u1hoXE0ahuETQ6bc0088gxSabV85jciWL+tsVGFeI8lufwEIan
 rzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+TkWIdFQsuVrBlz1iMZEZBv2Eng982tGzQv+UxtokKc=;
 b=iH4qMrumzIw6MZIwmPEcaInYP+RHbWMTDYcro3lo+uU6AoHQfYeZ3VU6+XeyOq6Vz3
 mlFZhGqkYhCayOuPBgU1QRvmK8z5wJqIvtJFTMv0cBaMtWo2VN3qlLyGNPVs7mePTAUr
 gGwi9r/1j3aUAtYTrXY00Btz2Tqhm4bORyaqJZRU4NIea0DLT1r1DMLbWQ01o1COqw3m
 UwgGMIK2CSWrpqFci2+NfGQc+qGTfVjpbCk6Xu3QH9Nj/HcVMvI3XvGNeBA7PNGRE8XZ
 XuyNYISf9FEJ8ebyRLRPBe3EaXXa88mEECa9Dzd8kM4SX+2+2vnypUov3JRGs6yjyXh/
 K9/w==
X-Gm-Message-State: ACgBeo1CuSEBDKHuIC8fxp8qE9Qj1QUwtKoxn/MSOrX7scwl39IHzKtV
 3ytHrKnKXy9D39EWYsoDS2it6IEi7KSNjXam
X-Google-Smtp-Source: AA6agR4bTqWLtQxLxjGRutp3X4qiI8m4wyi9AHTiKo7W3Wv5u5TdeikRZ7QZJI1JuwYiq7mJAA61rg==
X-Received: by 2002:adf:a447:0:b0:228:6ee1:135b with SMTP id
 e7-20020adfa447000000b002286ee1135bmr5703721wra.6.1662453500496; 
 Tue, 06 Sep 2022 01:38:20 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003a54f49c1c8sm13421859wmk.12.2022.09.06.01.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 01:38:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v3 02/20] linux-user/hppa: Allocate page zero as a commpage
Date: Tue,  6 Sep 2022 09:37:57 +0100
Message-Id: <20220906083815.252478-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906083815.252478-1-richard.henderson@linaro.org>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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

We're about to start validating PAGE_EXEC, which means that we've
got to mark page zero executable.  We had been special casing this
entirely within translate.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 3e3dc02499..29d910c4cc 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1646,6 +1646,34 @@ static inline void init_thread(struct target_pt_regs *regs,
     regs->gr[31] = infop->entry;
 }
 
+#define LO_COMMPAGE  0
+
+static bool init_guest_commpage(void)
+{
+    void *want = g2h_untagged(LO_COMMPAGE);
+    void *addr = mmap(want, qemu_host_page_size, PROT_NONE,
+                      MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
+
+    if (addr == MAP_FAILED) {
+        perror("Allocating guest commpage");
+        exit(EXIT_FAILURE);
+    }
+    if (addr != want) {
+        return false;
+    }
+
+    /*
+     * On Linux, page zero is normally marked execute only + gateway.
+     * Normal read or write is supposed to fail (thus PROT_NONE above),
+     * but specific offsets have kernel code mapped to raise permissions
+     * and implement syscalls.  Here, simply mark the page executable.
+     * Special case the entry points during translation (see do_page_zero).
+     */
+    page_set_flags(LO_COMMPAGE, LO_COMMPAGE + TARGET_PAGE_SIZE,
+                   PAGE_EXEC | PAGE_VALID);
+    return true;
+}
+
 #endif /* TARGET_HPPA */
 
 #ifdef TARGET_XTENSA
@@ -2326,12 +2354,12 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
 }
 
 #if defined(HI_COMMPAGE)
-#define LO_COMMPAGE 0
+#define LO_COMMPAGE -1
 #elif defined(LO_COMMPAGE)
 #define HI_COMMPAGE 0
 #else
 #define HI_COMMPAGE 0
-#define LO_COMMPAGE 0
+#define LO_COMMPAGE -1
 #define init_guest_commpage() true
 #endif
 
@@ -2555,7 +2583,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
         } else {
             offset = -(HI_COMMPAGE & -align);
         }
-    } else if (LO_COMMPAGE != 0) {
+    } else if (LO_COMMPAGE != -1) {
         loaddr = MIN(loaddr, LO_COMMPAGE & -align);
     }
 
-- 
2.34.1


