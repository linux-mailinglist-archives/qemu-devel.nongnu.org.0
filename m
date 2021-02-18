Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAAA31EB24
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 15:53:49 +0100 (CET)
Received: from localhost ([::1]:41756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCkgd-00088L-5d
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 09:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCkeO-0006pJ-4r
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:51:29 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCkeK-0005Yn-PM
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:51:27 -0500
Received: by mail-wm1-x330.google.com with SMTP id a207so4226909wmd.1
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 06:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o05FDCeP36VITlQ7CZFt1SlgtIKXEEbrqObKvoAaCbU=;
 b=T4Pa4nkWkDWqY0kWK6mCeW2mwOwjCqzJY19qeHE1W1imnNgVH3lwzanTGC9xgRHw+N
 JXL512NsPBq38Hfp/GanVWCYfKpyxywMNV2RM0BM8Sn0bxZjaVOpHXnlMscPn2I/Y4kH
 LGcZE7DBl1WXEjLBk+Do7fCQzmaXqRQh79rD60W1TZIsMGTfbJ0bjOW7G455pQKKnMe7
 OgtjgczlFGV1W/bjZjOGRqvnw/1SfMFvOtX1zNuiesdUXMpGZ9/T1Cntp8ccWd7tODTp
 0pgRC7aSfZMhnNFuz008mvZSlaPnf/5AmRBJJrT/IMobN261ZFg7K8gvhYDxRHrW8DvT
 je+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o05FDCeP36VITlQ7CZFt1SlgtIKXEEbrqObKvoAaCbU=;
 b=B3EvHgjR46VOTAU+OT44SiLkY9HtwdPoFd0e2JSoF6MXD2yjqNwHfFiOE9vcrft9dR
 qqEvy4bAZgur1ZgPbmTO1jX9+vG5W/UYC5GnBasVNZLhsqooLo0V6RgOJz68phVmJqDp
 QX0ur6cjOuv3fuJt/B+9+d5IRB2vvyXSVu9hPvozKBqm72n+wfS5pp0W4f8Sow//nXJ8
 JCZXMlD403YnxdFO61trzF0mGT3nJCoFeG6HhFLsoSfwwu3BVvu7G1w/TT6ua5l1teNS
 +RWdV7SwwxIZA7xOa+UzAiEBm65ZcptDoY0Xzc4AcoU/CQ0HN7YuGiiX0Uti7ZKEROKf
 G87w==
X-Gm-Message-State: AOAM533faXh98dzNuckjADa5dP6lyZqPh2dAuY6W0BKMlQ92mEBP/YSE
 7+hiNMmWawlLN6cIDc4FbMj6iqFlqWg=
X-Google-Smtp-Source: ABdhPJynXfIy/al+B3/dDO0r5J5jIf6ue2SToLhekob/C3tSIBASo+9raeKwVANjkc9eG4Rn53L2/g==
X-Received: by 2002:a1c:5f84:: with SMTP id t126mr2183872wmb.52.1613659883115; 
 Thu, 18 Feb 2021 06:51:23 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d29sm2687874wra.51.2021.02.18.06.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 06:51:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] target/sh4: Replace magic value by MMUAccessType
 definitions
Date: Thu, 18 Feb 2021 15:51:08 +0100
Message-Id: <20210218145111.1591763-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210218145111.1591763-1-f4bug@amsat.org>
References: <20210218145111.1591763-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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

Replace the 0/1/2 magic values by the corresponding MMUAccessType.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


