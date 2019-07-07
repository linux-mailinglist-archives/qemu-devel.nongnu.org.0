Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FEF60DF9
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jul 2019 00:46:28 +0200 (CEST)
Received: from localhost ([::1]:56720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjWyI-0004QX-Rj
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 18:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55369)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hjWVt-0008Mc-BG
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:17:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hjWVp-00041C-2s
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:17:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48350)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hjWVo-0003wn-Sa
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:17:01 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 26FD48552E;
 Fri,  5 Jul 2019 22:16:44 +0000 (UTC)
Received: from localhost (ovpn-116-30.gru2.redhat.com [10.97.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2C4318A49;
 Fri,  5 Jul 2019 22:16:43 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Date: Fri,  5 Jul 2019 19:15:03 -0300
Message-Id: <20190705221504.25166-42-ehabkost@redhat.com>
In-Reply-To: <20190705221504.25166-1-ehabkost@redhat.com>
References: <20190705221504.25166-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 05 Jul 2019 22:16:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v6 41/42] numa: allow memory-less nodes when
 using memdev as backend
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

QEMU fails to start if memory-less node is present when memdev
is used
  qemu-system-x86_64 -object memory-backend-ram,id=ram0,size=128M \
                     -numa node -numa node,memdev=ram0
with error:
  "memdev option must be specified for either all or no nodes"

which works as expected if legacy 'mem' is used.

Fix check to make memory-less nodes valid when memdev option is used
but still disallow mix of mem and memdev options.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20190702140745.27767-2-imammedo@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/numa.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 2d984b025b..a11431483c 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -45,7 +45,8 @@ QemuOptsList qemu_numa_opts = {
     .desc = { { 0 } } /* validated with OptsVisitor */
 };
 
-static int have_memdevs = -1;
+static int have_memdevs;
+static int have_mem;
 static int max_numa_nodeid; /* Highest specified NUMA node ID, plus one.
                              * For all nodes, nodeid < max_numa_nodeid
                              */
@@ -103,17 +104,11 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
         }
     }
 
-    if (node->has_mem && node->has_memdev) {
-        error_setg(errp, "cannot specify both mem= and memdev=");
-        return;
-    }
-
-    if (have_memdevs == -1) {
-        have_memdevs = node->has_memdev;
-    }
-    if (node->has_memdev != have_memdevs) {
-        error_setg(errp, "memdev option must be specified for either "
-                   "all or no nodes");
+    have_memdevs = have_memdevs ? : node->has_memdev;
+    have_mem = have_mem ? : node->has_mem;
+    if ((node->has_mem && have_memdevs) || (node->has_memdev && have_mem)) {
+        error_setg(errp, "numa configuration should use either mem= or memdev=,"
+                   "mixing both is not allowed");
         return;
     }
 
-- 
2.18.0.rc1.1.g3f1ff2140


