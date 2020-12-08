Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0B42D298B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 12:07:01 +0100 (CET)
Received: from localhost ([::1]:38334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmapg-00079Z-BH
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 06:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmaoQ-0006hu-2k
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:05:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmaoN-0002eZ-Cf
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:05:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607425537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+CNRv0X2qYkk84UUTHAMkYU4YwaV6Ztzr6vtzS6TaA=;
 b=jVzvSP3XlAjeahtEsdK2z7s+gdm+XeViiXgIdghRPBO8CvPXIUdhdAJ3zrv2oA16rnFxDV
 puS8e0znBhDiKJFLz0dGM6F0nVVKBIraYoQaeKSkwXzDIASTQetR/UhAtqeCaFYAj637ap
 A16T5wz2WYtkr1AzZ8tzJ/aa9g+HuIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-ih6ayo-QO8-pGQfMjIcrDg-1; Tue, 08 Dec 2020 06:05:36 -0500
X-MC-Unique: ih6ayo-QO8-pGQfMjIcrDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9FEE18C89D9;
 Tue,  8 Dec 2020 11:05:34 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 215E05D9DE;
 Tue,  8 Dec 2020 11:05:33 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ppc/spapr: cleanup -machine pseries,nvdimm=X handling
Date: Tue,  8 Dec 2020 06:05:32 -0500
Message-Id: <20201208110532.4099624-1-imammedo@redhat.com>
In-Reply-To: <44bc2a0b-ff1e-d9d5-772c-a5cbe23da94a@gmail.com>
References: <44bc2a0b-ff1e-d9d5-772c-a5cbe23da94a@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: danielhb413@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since NVDIMM support was introduced on pseries machine,
it ignored machine's nvdimm=on|off option and effectively
was always enabled on machines that support NVDIMM.
Later on commit
  (28f5a716212 ppc/spapr_nvdimm: do not enable support with 'nvdimm=off')
makes QEMU error out in case user explicitly set 'nvdimm=off'
on CLI by peeking at machine_opts.

However that's a bit hacking and going away (in world where
machine configured over QMP) and it also leaves
  nvdimms_state->is_enabled
in inconsistent state (false) even when it should be set true
by default.

Instead of using on machine_opts, implement per machine
"nvdimm enabled" default handling and set default enabled value
at machine class init time (which is set to true for pseries)
and properly handle it generic machine code.
That way pseries will have, nvdimm enabled by default and
will honor user provided 'nvdimm=on|off'.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
PS:
Patch should be applied on top of:
  [PATCH 08/15] machine: introduce MachineInitPhase
---
 include/hw/boards.h   |  1 +
 hw/core/machine.c     |  1 +
 hw/ppc/spapr.c        |  8 ++++++++
 hw/ppc/spapr_nvdimm.c | 14 +-------------
 4 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index b9233af54a..1730f151aa 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -206,6 +206,7 @@ struct MachineClass {
     bool ignore_boot_device_suffixes;
     bool smbus_no_migration_support;
     bool nvdimm_supported;
+    bool nvdimm_enabled_default;
     bool numa_mem_supported;
     bool auto_enable_numa;
     const char *default_ram_id;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 2c0bc15143..12f04bed58 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -893,6 +893,7 @@ static void machine_initfn(Object *obj)
         Object *obj = OBJECT(ms);
 
         ms->nvdimms_state = g_new0(NVDIMMState, 1);
+        ms->nvdimms_state->is_enabled = mc->nvdimm_enabled_default;
         object_property_add_bool(obj, "nvdimm",
                                  machine_get_nvdimm, machine_set_nvdimm);
         object_property_set_description(obj, "nvdimm",
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index b7e0894019..5a0cf79bbe 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4413,6 +4413,14 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power9_v2.0");
     mc->has_hotpluggable_cpus = true;
     mc->nvdimm_supported = true;
+    /*
+     * NVDIMM support went live in 5.1 without considering that, in
+     * other archs, the user needs to enable NVDIMM support with the
+     * 'nvdimm' machine option and the default behavior is NVDIMM
+     * support disabled. It is too late to roll back to the standard
+     * behavior without breaking 5.1 guests.
+     */
+    mc->nvdimm_enabled_default = true;
     smc->resize_hpt_default = SPAPR_RESIZE_HPT_ENABLED;
     fwc->get_dev_path = spapr_get_fw_dev_path;
     nc->nmi_monitor_handler = spapr_nmi;
diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index a833a63b5e..66cd3dc13f 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -27,10 +27,8 @@
 #include "hw/ppc/spapr_nvdimm.h"
 #include "hw/mem/nvdimm.h"
 #include "qemu/nvdimm-utils.h"
-#include "qemu/option.h"
 #include "hw/ppc/fdt.h"
 #include "qemu/range.h"
-#include "sysemu/sysemu.h"
 #include "hw/ppc/spapr_numa.h"
 
 bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
@@ -38,7 +36,6 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
 {
     const MachineClass *mc = MACHINE_GET_CLASS(hotplug_dev);
     const MachineState *ms = MACHINE(hotplug_dev);
-    const char *nvdimm_opt = qemu_opt_get(qemu_get_machine_opts(), "nvdimm");
     g_autofree char *uuidstr = NULL;
     QemuUUID uuid;
     int ret;
@@ -48,16 +45,7 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
         return false;
     }
 
-    /*
-     * NVDIMM support went live in 5.1 without considering that, in
-     * other archs, the user needs to enable NVDIMM support with the
-     * 'nvdimm' machine option and the default behavior is NVDIMM
-     * support disabled. It is too late to roll back to the standard
-     * behavior without breaking 5.1 guests. What we can do is to
-     * ensure that, if the user sets nvdimm=off, we error out
-     * regardless of being 5.1 or newer.
-     */
-    if (!ms->nvdimms_state->is_enabled && nvdimm_opt) {
+    if (!ms->nvdimms_state->is_enabled) {
         error_setg(errp, "nvdimm device found but 'nvdimm=off' was set");
         return false;
     }
-- 
2.27.0


