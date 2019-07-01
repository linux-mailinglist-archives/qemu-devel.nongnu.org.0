Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0506447113
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jun 2019 17:56:25 +0200 (CEST)
Received: from localhost ([::1]:32968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcB2W-0005st-6Y
	for lists+qemu-devel@lfdr.de; Sat, 15 Jun 2019 11:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35801)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcAqw-00041n-QY
 for qemu-devel@nongnu.org; Sat, 15 Jun 2019 11:44:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcAqu-0000XS-PD
 for qemu-devel@nongnu.org; Sat, 15 Jun 2019 11:44:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48338)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcAqr-0000KM-8L; Sat, 15 Jun 2019 11:44:21 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 65DF381129;
 Sat, 15 Jun 2019 15:44:20 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 266831001B05;
 Sat, 15 Jun 2019 15:44:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:40 +0200
Message-Id: <20190615154352.26824-12-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Sat, 15 Jun 2019 15:44:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 11/23] target/arm: Declare v7m_cpacr_pass()
 publicly
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the next commit we will move exception handling routines to
v7m_helper, so this function will be called from 2 different
files. Declare it inlined in the "internals.h" header.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/helper.c    | 19 -------------------
 target/arm/internals.h | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cf76010ea1..5d05db84d3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7611,25 +7611,6 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uin=
t32_t excp_idx,
     return target_el;
 }
=20
-/*
- * Return true if the v7M CPACR permits access to the FPU for the specif=
ied
- * security state and privilege level.
- */
-static bool v7m_cpacr_pass(CPUARMState *env, bool is_secure, bool is_pri=
v)
-{
-    switch (extract32(env->v7m.cpacr[is_secure], 20, 2)) {
-    case 0:
-    case 2: /* UNPREDICTABLE: we treat like 0 */
-        return false;
-    case 1:
-        return is_priv;
-    case 3:
-        return true;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 /*
  * What kind of stack write are we doing? This affects how exceptions
  * generated during the stacking are treated.
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 04711b317a..1d15af3f8b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -891,6 +891,27 @@ static inline uint32_t v7m_sp_limit(CPUARMState *env=
)
     }
 }
=20
+/**
+ * v7m_cpacr_pass:
+ * Return true if the v7M CPACR permits access to the FPU for the specif=
ied
+ * security state and privilege level.
+ */
+static inline bool v7m_cpacr_pass(CPUARMState *env,
+                                  bool is_secure, bool is_priv)
+{
+    switch (extract32(env->v7m.cpacr[is_secure], 20, 2)) {
+    case 0:
+    case 2: /* UNPREDICTABLE: we treat like 0 */
+        return false;
+    case 1:
+        return is_priv;
+    case 3:
+        return true;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /**
  * aarch32_mode_name(): Return name of the AArch32 CPU mode
  * @psr: Program Status Register indicating CPU mode
--=20
2.20.1


