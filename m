Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48202DE501
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:38:43 +0100 (CET)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGu2-0005s9-UG
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:38:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqGox-0001VZ-6A; Fri, 18 Dec 2020 09:33:29 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56806
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqGov-0007Y9-27; Fri, 18 Dec 2020 09:33:26 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 6BE025FC85;
 Fri, 18 Dec 2020 15:33:21 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 1/3] target/arm: keep translation start level unsigned
Date: Fri, 18 Dec 2020 16:33:19 +0200
Message-Id: <20201218143321.102872-1-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7884934.NyiUUSuA9g@basile.remlab.net>
References: <7884934.NyiUUSuA9g@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index df195c314c..b927e53ab0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10821,17 +10821,12 @@ do_fault:
  * Returns true if the suggested S2 translation parameters are OK and
  * false otherwise.
  */
-static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
+static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint32_t level,
                                int inputsize, int stride)
 {
     const int grainsize = stride + 3;
     int startsizecheck;
 
-    /* Negative levels are never allowed.  */
-    if (level < 0) {
-        return false;
-    }
-
     startsizecheck = inputsize - ((3 - level) * stride + grainsize);
     if (startsizecheck < 1 || startsizecheck > stride + 4) {
         return false;
@@ -10856,6 +10851,9 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
             if (level == 0 && pamax <= 42) {
                 return false;
             }
+            if (level == 3) {
+                return false;
+            }
             break;
         default:
             g_assert_not_reached();
@@ -10871,7 +10869,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
         /* AArch32 only supports 4KB pages. Assert on that.  */
         assert(stride == 9);
 
-        if (level == 0) {
+        if (level == 0 || level >= 3) {
             return false;
         }
     }
@@ -11203,7 +11201,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
         if (!aarch64 || stride == 9) {
             /* AArch32 or 4KB pages */
-            startlevel = 2 - sl0;
+            startlevel = (2 - sl0) & 3;
         } else {
             /* 16KB or 64KB pages */
             startlevel = 3 - sl0;
-- 
2.29.2


