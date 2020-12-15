Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7E42DB334
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:03:57 +0100 (CET)
Received: from localhost ([::1]:40856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEg0-0005k7-Ih
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXJ-000318-Ba
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:54:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXF-0001SW-4G
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:54:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZKP/jFIO7zRBoWWyzQQ+FV9v7904qMDgGVLm5bbqUW0=;
 b=ChnCWxR8r6cxK3zJqeSxKaDCv0L30s0MlgjpwW8nUY+2yKXCsR/Pwm4y5oJ2nfmrxBRszI
 C17HmJB5B1QxCgIrMnPPxM8qCmtAIp0+nzxtToj2aT9qtWdIhtwRHkYO5155iBvCi/nKF1
 iDkSR5imMhhee8nvHqxnZTVXTZltjCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-Td_OBlIRMGqkhWvkzVq1yQ-1; Tue, 15 Dec 2020 12:54:50 -0500
X-MC-Unique: Td_OBlIRMGqkhWvkzVq1yQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7563C8015C7
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:54:49 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2622560C15;
 Tue, 15 Dec 2020 17:54:49 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/45] ppc/spapr: cleanup -machine pseries,nvdimm=X handling
Date: Tue, 15 Dec 2020 12:54:09 -0500
Message-Id: <20201215175445.1272776-10-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Since NVDIMM support was introduced on pseries machine,
it ignored machine's nvdimm=on|off option and effectively
was always enabled on machines that support NVDIMM.
Later on commit
  (28f5a716212 ppc/spapr_nvdimm: do not enable support with 'nvdimm=off')
makes QEMU error out in case user explicitly set 'nvdimm=off'
on CLI by peeking at machine_opts.

However that's a workaround and leaves 'nvdimms_state->is_enabled'
in inconsistent state (false) when it should be set true
by default.

Instead of using on machine_opts, set default to true for pseries
machine in initfn time. If user sets manually 'nvdimm=off'
it will overwrite default value to false and QEMU will error
as expected without need to peek into machine_opts.

That way pseries will have, nvdimm enabled by default and
will honor user provided 'nvdimm=on|off'.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20201208164606.4109134-1-imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ppc/spapr.c        | 13 +++++++++++++
 hw/ppc/spapr_nvdimm.c | 14 +-------------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index dee48a0043..489cefcb81 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3275,6 +3275,19 @@ static void spapr_instance_init(Object *obj)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(obj);
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
+    MachineState *ms = MACHINE(spapr);
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+
+    /*
+     * NVDIMM support went live in 5.1 without considering that, in
+     * other archs, the user needs to enable NVDIMM support with the
+     * 'nvdimm' machine option and the default behavior is NVDIMM
+     * support disabled. It is too late to roll back to the standard
+     * behavior without breaking 5.1 guests.
+     */
+    if (mc->nvdimm_supported) {
+        ms->nvdimms_state->is_enabled = true;
+    }
 
     spapr->htab_fd = -1;
     spapr->use_hotplug_event_source = true;
diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index 73ee006541..b46c36917c 100644
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
2.26.2



