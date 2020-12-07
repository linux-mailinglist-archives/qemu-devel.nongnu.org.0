Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5974D2D09D1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 05:49:26 +0100 (CET)
Received: from localhost ([::1]:33470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km8Sj-0001UI-C5
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 23:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1km8Ql-0008K0-8I
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 23:47:23 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:33597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1km8Qi-00019X-9U
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 23:47:23 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4178294|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0075722-0.000630961-0.991797;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.J3tRDLu_1607316427; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.J3tRDLu_1607316427)
 by smtp.aliyun-inc.com(10.147.41.199);
 Mon, 07 Dec 2020 12:47:07 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/arm: Fixup special cross page case for sve
 continuous load/store
Date: Mon,  7 Dec 2020 12:46:52 +0800
Message-Id: <20201207044655.2312-2-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201207044655.2312-1-zhiwei_liu@c-sky.com>
References: <20201207044655.2312-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the split element is also the first active element of the vector,
mem_off_first[0] should equal to mem_off_split.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/arm/sve_helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 5f037c3a8f..91d1d24725 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4282,9 +4282,10 @@ static bool sve_cont_ldst_pages(SVEContLdSt *info, SVEContFault fault,
          * to generate faults for the second page.  For no-fault,
          * we have work only if the second page is valid.
          */
-        if (info->mem_off_first[0] < info->mem_off_split) {
-            nofault = FAULT_FIRST;
-            have_work = false;
+        if (info->mem_off_first[0] == info->mem_off_split) {
+            if (nofault) {
+                have_work = false;
+            }
         }
     } else {
         /*
-- 
2.23.0


