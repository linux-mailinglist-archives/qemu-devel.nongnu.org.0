Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C188E3067CA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 00:26:26 +0100 (CET)
Received: from localhost ([::1]:59412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4uCf-0005Gn-OK
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 18:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4u8V-0000t0-NT
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:22:07 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:39843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4u8U-0006FP-6k
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 18:22:07 -0500
Received: by mail-wm1-x333.google.com with SMTP id u14so3055290wmq.4
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 15:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6WbbRQjXYliuhYJkNz9Ad7zq4xSuA4zUEY6hD8fYDAc=;
 b=Gg8DYFX6calRieL6MDKlfaaCgjl7oBsLqytiTDOVCoGH5ub92DOwd51TUWnJ90VL3B
 RRBfMAEGluRMtUE4P0ZdOyRs82khuuur56/pXErjMgxybnhCnVP7EdlpWNLYYq0ShJ96
 vYC9Zby7iXVT+MHtW+GX999WZS1jH6ohPuq+T/7FPyxS8l9hUPj3hYRWvSpOv4FY0Nj7
 PRZNGKQepAVpJYxdy6YZDcqQqGTBiGVc8oglmPX1qD/cWKDOTJBWLKEGXqEyp6Ar4uRe
 PTi9kWIiBxY2t7dml/K9pf3CI5Ys8U0n6VqNW+6kVcs1tK1c3StxHjKlRnemSswr0DbH
 6ywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6WbbRQjXYliuhYJkNz9Ad7zq4xSuA4zUEY6hD8fYDAc=;
 b=E3Y4atWWskywEoNtpq5SO0C750KoTb3WivAHX95VQ0EoHrPCjKA1GtLsLp2cBZ5n/9
 RolRU/ykZ64jKJWNcHw/xQnlnG+/Pgp9QZ8OHC/ZN68l7jfpV9trJte4uzXu7S1d6ql9
 UOfhzOx8QlkizmSRaVR8mNbi9PhQrSHcJIcDYlqNM8JrlrhxVW8uHEhAYgQDV/X4ImwP
 d/lU4hbyKF5jGDoU4YGCOGMjbAfH/3sWA0Kw4IlL3I0w2jWXov6W/vQfCM9WZbyLpw7K
 JLraQY31yS33NQoO/CfYuoRmktPdLuEY5j3kM98QCy6N4xAKlramOrPeIAtVFt7jbN+9
 I3UQ==
X-Gm-Message-State: AOAM533tO6ViRWW485x+pHMavuVWKJaY4mkS5rl238Pv7mdfNT4RRsJH
 Mchkp3qu4q3el+T7QTw62D+Bciu28bw=
X-Google-Smtp-Source: ABdhPJxzmJTwgXnk3QX6d1wP10R7j3csvXIubXezi6zqy8RIcWvmwI48U+s3C52D54qOrF+74GsEOQ==
X-Received: by 2002:a05:600c:3549:: with SMTP id
 i9mr6268002wmq.47.1611789724420; 
 Wed, 27 Jan 2021 15:22:04 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z18sm4718576wro.91.2021.01.27.15.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 15:22:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] target/sh4: Replace magic value by MMUAccessType
 definitions
Date: Thu, 28 Jan 2021 00:21:48 +0100
Message-Id: <20210127232151.3523581-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127232151.3523581-1-f4bug@amsat.org>
References: <20210127232151.3523581-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

Replace the 0/1/2 magic values by the corresponding MMUAccessType.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sh4/helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index fc816137766..4303ebf018b 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -338,7 +338,7 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
 
     use_asid = !(env->mmucr & MMUCR_SV) || !(env->sr & (1u << SR_MD));
 
-    if (rw == 2) {
+    if (rw == MMU_INST_FETCH) {
         n = find_itlb_entry(env, address, use_asid);
         if (n >= 0) {
             matching = &env->itlb[n];
@@ -371,11 +371,11 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
         if (n >= 0) {
             matching = &env->utlb[n];
             if (!(env->sr & (1u << SR_MD)) && !(matching->pr & 2)) {
-                n = (rw == 1)
+                n = (rw == MMU_DATA_STORE)
                     ? MMU_DTLB_VIOLATION_WRITE : MMU_DTLB_VIOLATION_READ;
-            } else if ((rw == 1) && !(matching->pr & 1)) {
+            } else if ((rw == MMU_DATA_STORE) && !(matching->pr & 1)) {
                 n = MMU_DTLB_VIOLATION_WRITE;
-            } else if ((rw == 1) && !matching->d) {
+            } else if ((rw == MMU_DATA_STORE) && !matching->d) {
                 n = MMU_DTLB_INITIAL_WRITE;
             } else {
                 *prot = PAGE_READ;
@@ -384,7 +384,7 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
                 }
             }
         } else if (n == MMU_DTLB_MISS) {
-            n = (rw == 1)
+            n = (rw == MMU_DATA_STORE)
                 ? MMU_DTLB_MISS_WRITE : MMU_DTLB_MISS_READ;
         }
     }
@@ -406,9 +406,9 @@ static int get_physical_address(CPUSH4State * env, target_ulong * physical,
                 && (address < 0xe0000000 || address >= 0xe4000000)) {
             /* Unauthorized access in user mode (only store queues are available) */
             qemu_log_mask(LOG_GUEST_ERROR, "Unauthorized access\n");
-            if (rw == 0) {
+            if (rw == MMU_DATA_LOAD) {
                 return MMU_DADDR_ERROR_READ;
-            } else if (rw == 1) {
+            } else if (rw == MMU_DATA_STORE) {
                 return MMU_DADDR_ERROR_WRITE;
             } else {
                 return MMU_IADDR_ERROR;
@@ -441,7 +441,7 @@ hwaddr superh_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     target_ulong physical;
     int prot;
 
-    get_physical_address(&cpu->env, &physical, &prot, addr, 0, 0);
+    get_physical_address(&cpu->env, &physical, &prot, addr, MMU_DATA_LOAD, 0);
     return physical;
 }
 
-- 
2.26.2


