Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE692484B5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 14:27:04 +0200 (CEST)
Received: from localhost ([::1]:48164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k80hj-0003I5-J5
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 08:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k80dF-0005Nf-SP
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 08:22:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50837
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k80dE-0001v1-3y
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 08:22:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597753343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Hdve1sjumZ59CnCf14s+G7y5rm1IAvCnGgoX78dIsE=;
 b=e23y42TApSalnxzvGhU+rEm2KJHP9B0LHTwalsooGsQCeOQnFjMGTeTPeQkM6szErhFx4V
 6GmhzRDK+LUy2RkoaiLd9Eo+0tiF3ve7zp+8ULJrOWulE3GLOn+CTYqdgIdHvsF1pZuUTp
 hyk9iFX287ggm48vY4I29oDsigX7qzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-_T8lyHKbOVi4nFzGhJbn-g-1; Tue, 18 Aug 2020 08:22:19 -0400
X-MC-Unique: _T8lyHKbOVi4nFzGhJbn-g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 350C4807337;
 Tue, 18 Aug 2020 12:22:18 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 342B95C641;
 Tue, 18 Aug 2020 12:22:17 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] x86: cpuhp: refuse cpu hot-unplug request earlier if
 not supported
Date: Tue, 18 Aug 2020 08:22:04 -0400
Message-Id: <20200818122208.1243901-4-imammedo@redhat.com>
In-Reply-To: <20200818122208.1243901-1-imammedo@redhat.com>
References: <20200818122208.1243901-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=205.139.110.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 03:19:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: boris.ostrovsky@oracle.com, lersek@redhat.com, aaron.young@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CPU hot-unplug with SMM requires firmware participation to prevent
guest crash (i.e. CPU can be removed only after OS _and_ firmware
were prepared for the action).
Previous patches introduced ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT
feature bit, which is advertised by firmware when it has support
for CPU hot-unplug. Use it to check if guest is able to handle
unplug and make device_del fail gracefully if hot-unplug feature
hasn't been negotiated.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Tested-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
---
v2:
 - fix typo in commit message
 - drop 5.1 version from hint message (Laszlo)
---
 hw/acpi/ich9.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 0acc9a3107..95cb0f935b 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -460,6 +460,18 @@ void ich9_pm_device_unplug_request_cb(HotplugHandler *hotplug_dev,
                                       errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU) &&
                !lpc->pm.cpu_hotplug_legacy) {
+        uint64_t negotiated = lpc->smi_negotiated_features;
+
+        if (negotiated & BIT_ULL(ICH9_LPC_SMI_F_BROADCAST_BIT) &&
+            !(negotiated & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT))) {
+            error_setg(errp, "cpu hot-unplug with SMI wasn't enabled "
+                             "by firmware");
+            error_append_hint(errp, "update machine type to a version having "
+                                    "x-smi-cpu-hotunplug=on and firmware that "
+                                    "supports CPU hot-unplug with SMM");
+            return;
+        }
+
         acpi_cpu_unplug_request_cb(hotplug_dev, &lpc->pm.cpuhp_state,
                                    dev, errp);
     } else {
-- 
2.26.2


