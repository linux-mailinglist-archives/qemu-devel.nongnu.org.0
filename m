Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9322261ED
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 16:23:07 +0200 (CEST)
Received: from localhost ([::1]:34048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxWh7-0002Gs-OL
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 10:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jxWal-00019H-Ks
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 10:16:31 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34648
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jxWai-0002mh-MM
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 10:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595254588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=isjC1vjnx8emGYZomHQZQWVaCiTzkslR29w+3//0k1M=;
 b=SCjJ0qTyuEt67tnBtNewmecxQE7Yh73t23To9aXpEtyxssmqtsAmzOP426s/q5x+B7gOWb
 VehPwwrYF6GyKPxXQztCz18lBgaKK/PVuKqOwwsHDZsErTFO7dzL2yHobFo3WxtvaXpLeL
 5l6Qeq0B4MNjW3vX6+NYDUnEiS9hOZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-ap4y5G4fNPOHrfjoHlCdkg-1; Mon, 20 Jul 2020 10:16:23 -0400
X-MC-Unique: ap4y5G4fNPOHrfjoHlCdkg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A43B72D60;
 Mon, 20 Jul 2020 14:16:15 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8327B2B6E2;
 Mon, 20 Jul 2020 14:16:14 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] x86: cphp: prevent guest crash on CPU hotplug when
 broadcast SMI is in use
Date: Mon, 20 Jul 2020 10:16:06 -0400
Message-Id: <20200720141610.574308-3-imammedo@redhat.com>
In-Reply-To: <20200720141610.574308-1-imammedo@redhat.com>
References: <20200720141610.574308-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/19 21:45:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: boris.ostrovsky@oracle.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There were reports of guest crash on CPU hotplug, when using q35 machine
type and OVMF with SMM, due to hotplugged CPU trying to process SMI at
default SMI handler location without it being relocated by firmware first.

Fix it by refusing hotplug if firmware hasn't negotiated CPU hotplug with
SMI support while SMI broadcast is in use.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v1:
   fix typos an use suggested wording in commit and error msg
   s/secure boot/smm/; s/hotplug SMI/hotplug with SMI/
      (Laszlo Ersek <lersek@redhat.com>)
---
 hw/acpi/ich9.c | 12 +++++++++++-
 hw/i386/pc.c   | 11 +++++++++++
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
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 57d50fad6b..3f4b7e3d9a 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1497,6 +1497,17 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
         return;
     }
 
+    if (pcms->acpi_dev) {
+        Error *local_err = NULL;
+
+        hotplug_handler_pre_plug(HOTPLUG_HANDLER(pcms->acpi_dev), dev,
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
2.26.2


