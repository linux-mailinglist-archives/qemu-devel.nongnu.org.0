Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9B731EB2E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 15:57:20 +0100 (CET)
Received: from localhost ([::1]:51156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCkk3-0003o8-Eo
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 09:57:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCkeX-0006rs-La
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:51:39 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCkeV-0005cK-G8
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:51:36 -0500
Received: by mail-wr1-x434.google.com with SMTP id v1so3288333wrd.6
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 06:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wn8jQ1F6vZGAxx2sZR3p9sh3ZA1iePVwsZxGykv2HiE=;
 b=psnzdD+9KOe32QKMbDX00d3r5haUFApT6RZnz4LepftEMRf83jvJ8Km1ZVEc9t3UvF
 s8vmpZUZqJjc4PEKakNxRQ7jBdXcYRNIkFuEf3IS5+WxmD5nZFi0qGt7uN8pj7oJ2vS5
 zbEOEIAYAaUP/dYYMoTtxZqWDjmiWL6MlzEvJzWFSmhF7AQ1fj4SgLlwGfu2ZAs0yUwx
 bVDje+4KmmlJMFNlB6pSApVt/d2Ukc+XMeduYuN8KEh2SHNoHdeYaknHW8UzJ4KeCEXr
 IkfRyd3pzTASDcSro/ASEFiExK8xAA9JpdQZl2QFdFrnwPQ22ZQGzKImylbQRk8sfRJF
 Xoqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Wn8jQ1F6vZGAxx2sZR3p9sh3ZA1iePVwsZxGykv2HiE=;
 b=AnvZevrE3QYfaNlVx9wJM2aQcL16ZCdV76KJu1HKOyydnvi+KW5cMq8d2zSR9QLWAt
 djrNDG53DIOXRA+KfIYgpPRPFTOWVWja+lJ3s6Wobzshz8A7fTAF9I7TBQ/bZFLRdiA0
 ANVV9OlsMofQt2BmSeARGMixJsPR2wO8VEfRBU63sW6j7Sq3bCI0HMTNmET/FEHl8Ftw
 8JWMZzJ0e3TzHr2E0Xd8E120hmyE/0eNXihJEcurENZAtZIgEzt3VuWK7Eps5pNEoqNx
 SScxe2cerpes2AyTEuFJ4+40L7+4SKgM2Chvg/UuiFxKI/Q9PA3hBj0TGk1+IOU5HsxX
 eAdw==
X-Gm-Message-State: AOAM533MCNL3LEgkhEQrxhbgyKes0UpZCX5Iah1lpe8KQ2tNA/R2i3p3
 O7kTyH3Zb7y675ujrU0JYxMyPkBx/I4=
X-Google-Smtp-Source: ABdhPJzyBm+rNhngB0AfWRlomcP3MH/3vYkkWW0AsGZzCwKWC2SGKnNb0CE7BCLaMBBnGs+RNg3t8A==
X-Received: by 2002:a05:6000:229:: with SMTP id
 l9mr4676765wrz.337.1613659892715; 
 Thu, 18 Feb 2021 06:51:32 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z15sm11310896wrs.72.2021.02.18.06.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 06:51:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] target/sh4: Let get_physical_address() use
 MMUAccessType access_type
Date: Thu, 18 Feb 2021 15:51:10 +0100
Message-Id: <20210218145111.1591763-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210218145111.1591763-1-f4bug@amsat.org>
References: <20210218145111.1591763-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joe Komlodi <komlodi@xilinx.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

superh_cpu_tlb_fill() already provides a access_type variable of
type MMUAccessType, and it is passed along, but casted as integer
and renamed 'rw'.
Simply replace 'int rw' by 'MMUAccessType access_type'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index b49efe84916..bd8e034f174 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -331,14 +331,14 @@ static int find_utlb_entry(CPUSH4State * env, target_ulong address, int use_asid
 */
 static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
                            int *prot, target_ulong address,
-                           int rw)
+                           MMUAccessType access_type)
 {
     int use_asid, n;
     tlb_t *matching = NULL;
 
     use_asid = !(env->mmucr & MMUCR_SV) || !(env->sr & (1u << SR_MD));
 
-    if (rw == MMU_INST_FETCH) {
+    if (access_type == MMU_INST_FETCH) {
         n = find_itlb_entry(env, address, use_asid);
         if (n >= 0) {
             matching = &env->itlb[n];
@@ -371,11 +371,11 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
         if (n >= 0) {
             matching = &env->utlb[n];
             if (!(env->sr & (1u << SR_MD)) && !(matching->pr & 2)) {
-                n = (rw == MMU_DATA_STORE)
+                n = (access_type == MMU_DATA_STORE)
                     ? MMU_DTLB_VIOLATION_WRITE : MMU_DTLB_VIOLATION_READ;
-            } else if ((rw == MMU_DATA_STORE) && !(matching->pr & 1)) {
+            } else if ((access_type == MMU_DATA_STORE) && !(matching->pr & 1)) {
                 n = MMU_DTLB_VIOLATION_WRITE;
-            } else if ((rw == MMU_DATA_STORE) && !matching->d) {
+            } else if ((access_type == MMU_DATA_STORE) && !matching->d) {
                 n = MMU_DTLB_INITIAL_WRITE;
             } else {
                 *prot = PAGE_READ;
@@ -384,7 +384,7 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
                 }
             }
         } else if (n == MMU_DTLB_MISS) {
-            n = (rw == MMU_DATA_STORE)
+            n = (access_type == MMU_DATA_STORE)
                 ? MMU_DTLB_MISS_WRITE : MMU_DTLB_MISS_READ;
         }
     }
@@ -398,7 +398,7 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
 
 static int get_physical_address(CPUSH4State * env, target_ulong * physical,
                                 int *prot, target_ulong address,
-                                int rw)
+                                MMUAccessType access_type)
 {
     /* P1, P2 and P4 areas do not use translation */
     if ((address >= 0x80000000 && address < 0xc0000000) || address >= 0xe0000000) {
@@ -406,9 +406,9 @@ static int get_physical_address(CPUSH4State * env, target_ulong * physical,
                 && (address < 0xe0000000 || address >= 0xe4000000)) {
             /* Unauthorized access in user mode (only store queues are available) */
             qemu_log_mask(LOG_GUEST_ERROR, "Unauthorized access\n");
-            if (rw == MMU_DATA_LOAD) {
+            if (access_type == MMU_DATA_LOAD) {
                 return MMU_DADDR_ERROR_READ;
-            } else if (rw == MMU_DATA_STORE) {
+            } else if (access_type == MMU_DATA_STORE) {
                 return MMU_DADDR_ERROR_WRITE;
             } else {
                 return MMU_IADDR_ERROR;
@@ -432,7 +432,7 @@ static int get_physical_address(CPUSH4State * env, target_ulong * physical,
     }
 
     /* We need to resort to the MMU */
-    return get_mmu_address(env, physical, prot, address, rw);
+    return get_mmu_address(env, physical, prot, address, access_type);
 }
 
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
-- 
2.26.2


