Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3875A2D927B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:12:39 +0100 (CET)
Received: from localhost ([::1]:52892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kogA2-0006dr-81
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwV-0005H2-SL; Sun, 13 Dec 2020 23:58:40 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55889 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwT-0004sJ-Sn; Sun, 13 Dec 2020 23:58:39 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTfs2WrZz9sWM; Mon, 14 Dec 2020 15:58:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921893;
 bh=KS/JXUTQMYv2eW9+XbsI27Y7qLlKDYVxNmlVB49PmV4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jwD6w8yRXQwY/Ye/F+G/zmufKWUXpXnWUj1JYannnaJYM/xr+L7FYa8+L7dJBJQ/Z
 i/mcOMlMHqVY5bfAW8gmYuAqTs4BC+DYzg882ISJ2xecKw/U+pjEFAYUuQhtLQYBrv
 N/WajCYPwWqzG6gVkU7mwu31OZ1Q8PTyHOTsSPqE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 19/30] spapr: Simplify error path of spapr_core_plug()
Date: Mon, 14 Dec 2020 15:57:56 +1100
Message-Id: <20201214045807.41003-20-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

spapr_core_pre_plug() already guarantees that the slot for the given core
ID is available. It is thus safe to assume that spapr_find_cpu_slot()
returns a slot during plug. Turn the error path into an assertion.
It is also safe to assume that no device is attached to the corresponding
DRC and that spapr_drc_attach() shouldn't fail.

Pass &error_abort to spapr_drc_attach() and simplify error handling.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201201113728.885700-4-groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 99139a692c..1f8bd53cb8 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3738,8 +3738,7 @@ int spapr_core_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
     return 0;
 }
 
-static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
-                            Error **errp)
+static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState *dev)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(OBJECT(hotplug_dev));
     MachineClass *mc = MACHINE_GET_CLASS(spapr);
@@ -3754,20 +3753,20 @@ static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     int i;
 
     core_slot = spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core_id, &index);
-    if (!core_slot) {
-        error_setg(errp, "Unable to find CPU core with core-id: %d",
-                   cc->core_id);
-        return;
-    }
+    g_assert(core_slot); /* Already checked in spapr_core_pre_plug() */
+
     drc = spapr_drc_by_id(TYPE_SPAPR_DRC_CPU,
                           spapr_vcpu_id(spapr, cc->core_id));
 
     g_assert(drc || !mc->has_hotpluggable_cpus);
 
     if (drc) {
-        if (!spapr_drc_attach(drc, dev, errp)) {
-            return;
-        }
+        /*
+         * spapr_core_pre_plug() already buys us this is a brand new
+         * core being plugged into a free slot. Nothing should already
+         * be attached to the corresponding DRC.
+         */
+        spapr_drc_attach(drc, dev, &error_abort);
 
         if (hotplugged) {
             /*
@@ -4009,7 +4008,7 @@ static void spapr_machine_device_plug(HotplugHandler *hotplug_dev,
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         spapr_memory_plug(hotplug_dev, dev);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_CPU_CORE)) {
-        spapr_core_plug(hotplug_dev, dev, errp);
+        spapr_core_plug(hotplug_dev, dev);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRIDGE)) {
         spapr_phb_plug(hotplug_dev, dev);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_TPM_PROXY)) {
-- 
2.29.2


