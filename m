Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD48B2C0102
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 09:07:58 +0100 (CET)
Received: from localhost ([::1]:55330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh6tB-0002au-VF
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 03:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kh6o5-0005kg-BJ; Mon, 23 Nov 2020 03:02:41 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54620
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kh6o2-0004dk-OG; Mon, 23 Nov 2020 03:02:41 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 873225FD4A;
 Mon, 23 Nov 2020 09:02:37 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 02/17] target/arm: add arm_is_el2_enabled() helper
Date: Mon, 23 Nov 2020 10:02:22 +0200
Message-Id: <20201123080237.18465-2-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3333301.iIbC2pHGDl@basile.remlab.net>
References: <3333301.iIbC2pHGDl@basile.remlab.net>
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

This checks if EL2 is enabled (meaning EL2 registers take effects) in
the current security context.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e5514c8286..30b5af5cde 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2040,6 +2040,18 @@ static inline bool arm_is_secure(CPUARMState *env)
     return arm_is_secure_below_el3(env);
 }
 
+/*
+ * Return true if the current security state has AArch64 EL2 or AArch32 Hyp.
+ * This corresponds to the pseudocode EL2Enabled()
+ */
+static inline bool arm_is_el2_enabled(CPUARMState *env)
+{
+    if (arm_feature(env, ARM_FEATURE_EL2)) {
+        return !arm_is_secure_below_el3(env);
+    }
+    return false;
+}
+
 #else
 static inline bool arm_is_secure_below_el3(CPUARMState *env)
 {
@@ -2050,6 +2062,11 @@ static inline bool arm_is_secure(CPUARMState *env)
 {
     return false;
 }
+
+static inline bool arm_is_el2_enabled(CPUARMState *env)
+{
+    return false;
+}
 #endif
 
 /**
-- 
2.29.2


