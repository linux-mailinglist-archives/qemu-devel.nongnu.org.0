Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C9E2754C3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 11:48:47 +0200 (CEST)
Received: from localhost ([::1]:60674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL1OI-00089H-Ke
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 05:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kL1Ml-0006e0-1M
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 05:47:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kL1Mj-0007VR-Af
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 05:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600854428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NHtq1ZlVg94Kf+6wpeThJeaxQyTxlv+PX6zeAnjEKIs=;
 b=AWjuLq/nJmFq1ihDRTT3xGJzHzuveGfZaMbLyqQDjPW8BXoK+dipnILfCkIrBd/IS7liru
 6kCRccHSjVnwGOJOs3uXzvho/KKcgXfoYvkxWOQjScX3PzJdrZ04bGyV80+Mb/6RY9HK98
 rCC4C0SAm+cK4DpyaxWeQLYJfGT4X1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-n61frQ6VNrezlZqimImCXQ-1; Wed, 23 Sep 2020 05:47:06 -0400
X-MC-Unique: n61frQ6VNrezlZqimImCXQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ED20186DD29;
 Wed, 23 Sep 2020 09:47:05 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D535155778;
 Wed, 23 Sep 2020 09:47:01 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/11] x86: cpuhp: prevent guest crash on CPU hotplug when
 broadcast SMI is in use
Date: Wed, 23 Sep 2020 05:46:41 -0400
Message-Id: <20200923094650.1301166-3-imammedo@redhat.com>
In-Reply-To: <20200923094650.1301166-1-imammedo@redhat.com>
References: <20200923094650.1301166-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lersek@redhat.com, ankur.a.arora@oracle.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There were reports of guest crash on CPU hotplug, when using q35 machine
type and OVMF with SMM, due to hotplugged CPU trying to process SMI at
default SMI handler location without it being relocated by firmware first.

Fix it by refusing hotplug if firmware hasn't negotiated CPU hotplug with
SMI support while SMI broadcast is in use.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Tested-by: Laszlo Ersek <lersek@redhat.com>
---
v6:
  - rebase on top of current master, due to non trivial conflicts
    caused by microvm series, which moved/renamed pc_cpu_pre_plug()
    (Ankur Arora <ankur.a.arora@oracle.com>)
v1:
   fix typos an use suggested wording in commit and error msg
   s/secure boot/smm/; s/hotplug SMI/hotplug with SMI/
      (Laszlo Ersek <lersek@redhat.com>)
---
 hw/acpi/ich9.c | 12 +++++++++++-
 hw/i386/x86.c  | 11 +++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 6a19070cec..0acc9a3107 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -408,10 +408,20 @@ void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
     ICH9LPCState *lpc = ICH9_LPC_DEVICE(hotplug_dev);
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
-        !lpc->pm.acpi_memory_hotplug.is_enabled)
+        !lpc->pm.acpi_memory_hotplug.is_enabled) {
         error_setg(errp,
                    "memory hotplug is not enabled: %s.memory-hotplug-support "
                    "is not set", object_get_typename(OBJECT(lpc)));
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        uint64_t negotiated = lpc->smi_negotiated_features;
+
+        if (negotiated & BIT_ULL(ICH9_LPC_SMI_F_BROADCAST_BIT) &&
+            !(negotiated & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT))) {
+            error_setg(errp, "cpu hotplug with SMI wasn't enabled by firmware");
+            error_append_hint(errp, "update machine type to newer than 5.1 "
+                "and firmware that suppors CPU hotplug with SMM");
+        }
+    }
 }
 
 void ich9_pm_device_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index c2ea989579..403c2b1dad 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -279,6 +279,17 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
         return;
     }
 
+    if (x86ms->acpi_dev) {
+        Error *local_err = NULL;
+
+        hotplug_handler_pre_plug(HOTPLUG_HANDLER(x86ms->acpi_dev), dev,
+                                 &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
+
     init_topo_info(&topo_info, x86ms);
 
     env->nr_dies = x86ms->smp_dies;
-- 
2.27.0


