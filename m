Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79D05524A0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 21:35:19 +0200 (CEST)
Received: from localhost ([::1]:42872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3NB6-0004O6-8m
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 15:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1o3Mz3-0003xJ-9z; Mon, 20 Jun 2022 15:22:53 -0400
Received: from mail.csgraf.de ([85.25.223.15]:58856 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1o3Mz1-0007O3-CO; Mon, 20 Jun 2022 15:22:48 -0400
Received: from localhost.localdomain
 (dynamic-077-007-106-140.77.7.pool.telefonica.de [77.7.106.140])
 by csgraf.de (Postfix) with ESMTPSA id 9D9146080263;
 Mon, 20 Jun 2022 21:22:43 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/2] accel: Introduce current_accel_name()
Date: Mon, 20 Jun 2022 21:22:41 +0200
Message-Id: <20220620192242.70573-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We need to fetch the name of the current accelerator in flexible error
messages more going forward. Let's create a helper that gives it to us
without casting in the target code.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/accel-common.c | 8 ++++++++
 include/qemu/accel.h | 1 +
 softmmu/vl.c         | 3 +--
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/accel/accel-common.c b/accel/accel-common.c
index 7b8ec7e0f7..50035bda55 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -49,6 +49,14 @@ AccelClass *accel_find(const char *opt_name)
     return ac;
 }
 
+/* Return the name of the current accelerator */
+const char *current_accel_name(void)
+{
+    AccelClass *ac = ACCEL_GET_CLASS(current_accel());
+
+    return ac->name;
+}
+
 static void accel_init_cpu_int_aux(ObjectClass *klass, void *opaque)
 {
     CPUClass *cc = CPU_CLASS(klass);
diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index 4f4c283f6f..be56da1b99 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -68,6 +68,7 @@ typedef struct AccelClass {
 
 AccelClass *accel_find(const char *opt_name);
 AccelState *current_accel(void);
+const char *current_accel_name(void);
 
 void accel_init_interfaces(AccelClass *ac);
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 54e920ada1..3dca5936c7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2271,8 +2271,7 @@ static void configure_accelerators(const char *progname)
     }
 
     if (init_failed && !qtest_chrdev) {
-        AccelClass *ac = ACCEL_GET_CLASS(current_accel());
-        error_report("falling back to %s", ac->name);
+        error_report("falling back to %s", current_accel_name());
     }
 
     if (icount_enabled() && !tcg_enabled()) {
-- 
2.32.1 (Apple Git-133)


