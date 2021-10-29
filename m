Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A5243FE8D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 16:37:48 +0200 (CEST)
Received: from localhost ([::1]:56876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgT0s-0006t8-Hi
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 10:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mgSpb-0006R5-Ko
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:26:08 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:39230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mgSpV-0003gJ-Tn
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:26:07 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id D31DA21CC4;
 Fri, 29 Oct 2021 14:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1635517559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOvsvjXGpAiB3u74+Ll4gb/+Pp0LglfREbiPDrzOtLs=;
 b=lXr1R9loRs8Ux9TIUIO0p7a+Z21h0K1XGW3MwNb8hgB5SFxv8DKE2t+C+nuw/POZyRHBT4
 Rs4VulL7/xFxCCKrnlgebZVXTVqHLjddjttqQY4YBXVL2UoEk2zGEQ+tss19HFHdCeVFWB
 s2MrBc6fkW8GgTCjUtQgwtZN8jM7TAw=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] machine: remove the done notifier for dynamic sysbus
 device type check
Date: Fri, 29 Oct 2021 16:22:58 +0200
Message-Id: <20211029142258.484907-4-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211029142258.484907-1-damien.hedde@greensocs.com>
References: <20211029142258.484907-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com,
 edgari@xilinx.com, mirela.grujic@greensocs.com,
 Alistair Francis <alistair.francis@wdc.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we check sysbus device types during device creation, we
can remove the check in the machine init done notifier.
This was the only thing done by this notifier, so we remove the
whole sysbus_notifier structure of the MachineState.

Note: This notifier was checking all /peripheral and /peripheral-anon
sysbus devices. Now we only check those added by -device cli option or
device_add qmp command when handling the command/option. So if there
are some devices added in one of these containers manually (eg in
machine C code), these will not be checked anymore.
This use case does not seem to appear apart from
hw/xen/xen-legacy-backend.c (it uses qdev_set_id() and in this case,
not for a sysbus device, so it's ok).

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---

v3: clarify the commit title
---
 include/hw/boards.h |  1 -
 hw/core/machine.c   | 27 ---------------------------
 2 files changed, 28 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 85adf660c1..680aa59d4a 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -316,7 +316,6 @@ typedef struct CpuTopology {
 struct MachineState {
     /*< private >*/
     Object parent_obj;
-    Notifier sysbus_notifier;
 
     /*< public >*/
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 0d20104796..2c17418628 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -572,18 +572,6 @@ bool device_type_is_dynamic_sysbus(MachineClass *mc, const char *type)
     return allowed;
 }
 
-static void validate_sysbus_device(SysBusDevice *sbdev, void *opaque)
-{
-    MachineState *machine = opaque;
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
-
-    if (!device_is_dynamic_sysbus(mc, DEVICE(sbdev))) {
-        error_report("Option '-device %s' cannot be handled by this machine",
-                     object_class_get_name(object_get_class(OBJECT(sbdev))));
-        exit(1);
-    }
-}
-
 static char *machine_get_memdev(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -599,17 +587,6 @@ static void machine_set_memdev(Object *obj, const char *value, Error **errp)
     ms->ram_memdev_id = g_strdup(value);
 }
 
-static void machine_init_notify(Notifier *notifier, void *data)
-{
-    MachineState *machine = MACHINE(qdev_get_machine());
-
-    /*
-     * Loop through all dynamically created sysbus devices and check if they are
-     * all allowed.  If a device is not allowed, error out.
-     */
-    foreach_dynamic_sysbus_device(validate_sysbus_device, machine);
-}
-
 HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
 {
     int i;
@@ -1108,10 +1085,6 @@ static void machine_initfn(Object *obj)
                                         "Table (HMAT)");
     }
 
-    /* Register notifier when init is done for sysbus sanity checks */
-    ms->sysbus_notifier.notify = machine_init_notify;
-    qemu_add_machine_init_done_notifier(&ms->sysbus_notifier);
-
     /* default to mc->default_cpus */
     ms->smp.cpus = mc->default_cpus;
     ms->smp.max_cpus = mc->default_cpus;
-- 
2.33.0


