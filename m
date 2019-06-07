Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 191C53874A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 11:44:59 +0200 (CEST)
Received: from localhost ([::1]:47578 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZBQg-0000TO-AL
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 05:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41452)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hZAuU-0000w1-O7
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:11:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hZAuP-0002xE-H4
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:11:42 -0400
Received: from mail01.asahi-net.or.jp ([202.224.55.13]:59748)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hZAuP-0002tb-4V
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:11:37 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail01.asahi-net.or.jp (Postfix) with ESMTPA id CC69C123C02;
 Fri,  7 Jun 2019 18:11:32 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 8982C240086;
 Fri,  7 Jun 2019 18:11:32 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jun 2019 18:11:16 +0900
Message-Id: <20190607091116.49044-25-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190607091116.49044-1-ysato@users.sourceforge.jp>
References: <20190607091116.49044-1-ysato@users.sourceforge.jp>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.13
Subject: [Qemu-devel] [PATCH v17 24/24] target/rx: Remove suffix in cpu
 class.
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New CPUs should not be suffixed like other devices.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 include/hw/rx/rx62n.h | 2 +-
 target/rx/cpu.h       | 3 +--
 target/rx/cpu.c       | 8 ++------
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/include/hw/rx/rx62n.h b/include/hw/rx/rx62n.h
index 5f6912fe46..e57c5ec091 100644
--- a/include/hw/rx/rx62n.h
+++ b/include/hw/rx/rx62n.h
@@ -30,7 +30,7 @@
 #include "target/rx/cpu.h"
 #include "qemu/units.h"
 
-#define TYPE_RX62N "rx62n"
+#define TYPE_RX62N "rx62n-mcu"
 #define TYPE_RX62N_CPU RX_CPU_TYPE_NAME(TYPE_RX62N)
 #define RX62N(obj) OBJECT_CHECK(RX62NState, (obj), TYPE_RX62N)
 
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index a0b6975963..080ea604a3 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -164,8 +164,7 @@ static inline RXCPU *rx_env_get_cpu(CPURXState *env)
 
 #define ENV_OFFSET offsetof(RXCPU, env)
 
-#define RX_CPU_TYPE_SUFFIX "-" TYPE_RX_CPU
-#define RX_CPU_TYPE_NAME(model) model RX_CPU_TYPE_SUFFIX
+#define RX_CPU_TYPE_NAME(model) model
 #define CPU_RESOLVING_TYPE TYPE_RX_CPU
 
 extern const char rx_crname[][6];
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 41fe1de4bb..d8c662b231 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -72,9 +72,8 @@ static void rx_cpu_reset(CPUState *s)
 static void rx_cpu_list_entry(gpointer data, gpointer user_data)
 {
     const char *typename = object_class_get_name(OBJECT_CLASS(data));
-    int len = strlen(typename) - strlen(RX_CPU_TYPE_SUFFIX);
 
-    qemu_printf("  %.*s\n", len, typename);
+    qemu_printf("  %s\n",  typename);
 }
 
 void rx_cpu_list(void)
@@ -89,11 +88,8 @@ void rx_cpu_list(void)
 static ObjectClass *rx_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
-    char *typename;
 
-    typename = g_strdup_printf(RX_CPU_TYPE_NAME("%s"), cpu_model);
-    oc = object_class_by_name(typename);
-    g_free(typename);
+    oc = object_class_by_name(cpu_model);
 
     if (oc == NULL ||
         object_class_is_abstract(oc) ||
-- 
2.11.0


