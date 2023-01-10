Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58606663D74
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 11:01:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFBKc-0002V8-Uf; Tue, 10 Jan 2023 04:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFBKY-0002Pd-Lz
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:54:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFBKX-0002iC-4o
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:54:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673344444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=to6bIa86ViP25Yfcx68RSU77hftVNlYyY2E8ylcFXmg=;
 b=dKMY3RsWhUgK8fXgVQmpAI5Ba8Fm+B8/qvuozYjNgLmiHSB+oCa8q1RZ1tBoSJNn1lr4/h
 ybJ4LiWMmg57zMHDV+ok4hnymINoyQXK47z19zhnuRPDwZfgQx+L6Cd82BDLanddmbkQ87
 UHUS14ShiPyhDsg22UQENBbl0Ze7ag0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-CgnUMRM3MVStKlQ9OI8kbw-1; Tue, 10 Jan 2023 04:54:01 -0500
X-MC-Unique: CgnUMRM3MVStKlQ9OI8kbw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C729E18E0043;
 Tue, 10 Jan 2023 09:54:00 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD5C74085720;
 Tue, 10 Jan 2023 09:53:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Michael S Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v6 2/4] hw/core/qdev-properties-system: Allow the 'slew'
 policy only on x86
Date: Tue, 10 Jan 2023 10:53:49 +0100
Message-Id: <20230110095351.611724-3-thuth@redhat.com>
In-Reply-To: <20230110095351.611724-1-thuth@redhat.com>
References: <20230110095351.611724-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The 'slew' tick policy is currently enforced to be only available on
x86 via some "#ifdef TARGET_I386" statements in mc146818rtc.c. We
want to get rid of those #ifdefs, so we need a different way of
checking whether the policy is allowed or not. Using the setter
function in hw/core/qdev-properties-system.c seems to be a good
place, so let's add a check here.

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/core/qdev-properties-system.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 54a09fa9ac..d42493f630 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -33,6 +33,7 @@
 #include "net/net.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie.h"
+#include "hw/i386/x86.h"
 #include "util/block-helpers.h"
 
 static bool check_prop_still_unset(Object *obj, const char *name,
@@ -558,13 +559,38 @@ void qdev_set_nic_properties(DeviceState *dev, NICInfo *nd)
 
 /* --- lost tick policy --- */
 
+static void qdev_propinfo_set_losttickpolicy(Object *obj, Visitor *v,
+                                             const char *name, void *opaque,
+                                             Error **errp)
+{
+    Property *prop = opaque;
+    int *ptr = object_field_prop_ptr(obj, prop);
+    int value;
+
+    if (!visit_type_enum(v, name, &value, prop->info->enum_table, errp)) {
+        return;
+    }
+
+    if (value == LOST_TICK_POLICY_SLEW) {
+        MachineState *ms = MACHINE(qdev_get_machine());
+
+        if (!object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE)) {
+            error_setg(errp,
+                       "the 'slew' policy is only available for x86 machines");
+            return;
+        }
+    }
+
+    *ptr = value;
+}
+
 QEMU_BUILD_BUG_ON(sizeof(LostTickPolicy) != sizeof(int));
 
 const PropertyInfo qdev_prop_losttickpolicy = {
     .name  = "LostTickPolicy",
     .enum_table  = &LostTickPolicy_lookup,
     .get   = qdev_propinfo_get_enum,
-    .set   = qdev_propinfo_set_enum,
+    .set   = qdev_propinfo_set_losttickpolicy,
     .set_default_value = qdev_propinfo_set_default_value_enum,
 };
 
-- 
2.31.1


