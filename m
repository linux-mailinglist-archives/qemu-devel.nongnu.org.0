Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54A1591560
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:17:29 +0200 (CEST)
Received: from localhost ([::1]:59910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZDs-0005bt-UF
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ4v-0003Qn-TM
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:15 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:35606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ4u-0006WA-90
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:13 -0400
Received: by mail-pl1-x629.google.com with SMTP id y1so1414041plb.2
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=aJaNQ6aSdE9rWibAJT4lh7LTRwz3SqqWw+/j8K8vQwg=;
 b=zWslSmRguofN40kXeD/Z5mav/utbP7OGtiqJez6VNIg/rjn3Rd4MgYVisymA9ElRWb
 +pOa/rEA3ZRhmQcISuBx3t482ygQQ13lQwM2U7N51sd64NieNsGZyS/i+mos0sWetm4w
 rkc9PK/bCGlRljnBJ0jpc2mYW4MV3yPmr8kSuL2VGtNKJMu1gVrHZgMgV5ozQREYWmnO
 ApkX5sbf1PWWnRLpq6iHsm45CfkFg19Rcp/8UgvyuqVjnh4u3BlaEk6KExmmU5pK/nP9
 Pqycn1bYqfeKFmPxZ7WENGU7cTe80Mitysk7LmPCxZZkRT25peO3+LkbFnI6qtBgT+MZ
 oc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=aJaNQ6aSdE9rWibAJT4lh7LTRwz3SqqWw+/j8K8vQwg=;
 b=cPK1hGdaU8bIvZXbZeTmXWLGyWtZmhASwYZJe5L5h7f7MJL5mtbx7qIzvdQIcP2tih
 B+24C+ounLzDS20rePMnDvchnPV71DBOIDZ01DFxhtRncNg6f7g1AduXsXIqE5/jBK9v
 7/UdozjmufWGgrzBkibHmPLKZFSJzWeWvs8N1Cn64k1RDNBQj39WEY2kkGkhcBW0oOdq
 ZJgc7mdmd/nss4gz2D3LHGfQ4p+NzKq1mL02G5xCq5IU16rujvgBbHWHGQ0ryukV1mNz
 0uId46Rri6IgnJCtnzbqCad2xxKzRnGflI64oUWs7jpLLVHSnl52BKpNpAHpc1atyST/
 IvZQ==
X-Gm-Message-State: ACgBeo2ooRdinHTACECHLr9jPDxkfwBOZHoWSOOxammwdYrQS6pmRIHF
 Ta8FRcJrwTb3hAJpWZbnpskZA3lniLKk8g==
X-Google-Smtp-Source: AA6agR4TGv9dlUEwWNq/k6gjrUrRLL/uY3agwEDxwFwHoWtnoX/38M7gLk1Z/3GbdmIeNVNliIbzbA==
X-Received: by 2002:a17:90b:1e11:b0:1f4:ee94:6236 with SMTP id
 pg17-20020a17090b1e1100b001f4ee946236mr5504439pjb.63.1660327690957; 
 Fri, 12 Aug 2022 11:08:10 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 02/21] linux-user/hppa: Allocate page zero as a
 commpage
Date: Fri, 12 Aug 2022 11:07:47 -0700
Message-Id: <20220812180806.2128593-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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


