Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFB637F31B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 08:33:48 +0200 (CEST)
Received: from localhost ([::1]:42270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh4up-0002bE-GR
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 02:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1lh4os-0004zj-Dp
 for qemu-devel@nongnu.org; Thu, 13 May 2021 02:27:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1lh4on-00049Q-QH
 for qemu-devel@nongnu.org; Thu, 13 May 2021 02:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620887249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ahcXEwjfZCxRWip5dFAHLuioirAWCn6NQooUwScD8Q=;
 b=SlS8nMQ/ECH2DSsivo3C8vJ88wvvnTO3KNJsmUURp+5PAujLssRpp0R31lVUfB5x3y8JDy
 4oisBdjwk/+A7BCGOIQrv4IoftNDWlJyKX/v0niMy1rcEmv02IJiPJlS9lzWL0O1+88HcK
 /Kn3a5SSl2Vj62WcRIgHKQRXc4tPKqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-75cut3bvMYGMs_eawS-DGg-1; Thu, 13 May 2021 02:27:28 -0400
X-MC-Unique: 75cut3bvMYGMs_eawS-DGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 317411883532;
 Thu, 13 May 2021 06:27:27 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.40.193.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F3D278627;
 Thu, 13 May 2021 06:27:21 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 6/7] hw/acpi/ich9: Set ACPI PCI hot-plug as default on
 Q35
Date: Thu, 13 May 2021 08:26:41 +0200
Message-Id: <20210513062642.3027987-7-jusual@redhat.com>
In-Reply-To: <20210513062642.3027987-1-jusual@redhat.com>
References: <20210513062642.3027987-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jusual@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q35 has three different types of PCI devices hot-plug: PCIe Native,
SHPC Native and ACPI hot-plug. This patch changes the default choice
for cold-plugged bridges from PCIe Native to ACPI Hot-plug with
ability to use SHPC and PCIe Native for hot-plugged bridges.

This is a list of the PCIe Native hot-plug issues that led to this
change:
    * no racy behavior during boot (see 110c477c2ed)
    * no delay during deleting - after the actual power off software
      must wait at least 1 second before indicating about it. This case
      is quite important for users, it even has its own bug:
          https://bugzilla.redhat.com/show_bug.cgi?id=1594168
    * no timer-based behavior - in addition to the previous example,
      the attention button has a 5-second waiting period, during which
      the operation can be canceled with a second press. While this
      looks fine for manual button control, automation will result in
      the need to queue or drop events, and the software receiving
      events in all sort of unspecified combinations of attention/power
      indicator states, which is racy and uppredictable.
    * fixes or reduces the likelihood of the bug:
        * https://bugzilla.redhat.com/show_bug.cgi?id=1833187
        * https://bugzilla.redhat.com/show_bug.cgi?id=1657077
        * https://bugzilla.redhat.com/show_bug.cgi?id=1669931
        * https://bugzilla.redhat.com/show_bug.cgi?id=1678290

To return to PCIe Native hot-plug:
    -global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 hw/acpi/ich9.c | 2 +-
 hw/i386/pc.c   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index f6819c4f2a..e7b2cd9719 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -425,7 +425,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     pm->disable_s3 = 0;
     pm->disable_s4 = 0;
     pm->s4_val = 2;
-    pm->use_acpi_hotplug_bridge = false;
+    pm->use_acpi_hotplug_bridge = true;
 
     object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
                                    &pm->pm_io_base, OBJ_PROP_FLAG_READ);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8cfaf216e7..5c2d3d11a2 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -94,7 +94,9 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
-GlobalProperty pc_compat_6_0[] = {};
+GlobalProperty pc_compat_6_0[] = {
+    { "ICH9-LPC", "acpi-pci-hotplug-with-bridge-support", "off" },
+};
 const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
 
 GlobalProperty pc_compat_5_2[] = {
-- 
2.30.2


