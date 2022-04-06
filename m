Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02E44F57C3
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 10:29:47 +0200 (CEST)
Received: from localhost ([::1]:54692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc12q-0001bF-Pc
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 04:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nc0yr-0007xk-BX
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:25:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nc0yn-0003jN-So
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649233528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QWOYvQ03ayYS52o2WTzRzv3wbynn0OyOLmCFXW0vQ9s=;
 b=RLqO+wQudf3eQ4UtmVIEK9x2KVo0nvdNk2YLSCjSikeFcYWL4M6UWXFJCVdJILuy+rvS8a
 jeP3VkzhElnlQZZQFl0DpxBQrZVaBVBp+2ewxPjxnUKqr4PAu6/XrO4JDJi55mXFe11noF
 Vae+aorOVXneAHbnRs8K6xtU7p0x+rs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-r8Hxg2plNHeshAGifn2P2g-1; Wed, 06 Apr 2022 04:25:27 -0400
X-MC-Unique: r8Hxg2plNHeshAGifn2P2g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41206899EC4;
 Wed,  6 Apr 2022 08:25:27 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D77691415122;
 Wed,  6 Apr 2022 08:25:25 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com,
 alex.williamson@redhat.com
Subject: [PATCH] acpi: Bodge acpi_index migration
Date: Wed,  6 Apr 2022 09:25:20 +0100
Message-Id: <20220406082520.9528-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: application/octet-stream; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, leobras@redhat.com, peterx@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The 'acpi_index' field is a statically configured field, which for
some reason is migrated; this never makes much sense because it's
command line static.

However, on piix4 it's conditional, and the condition/test function
ends up having the wrong pointer passed to it (it gets a PIIX4PMState
not the AcpiPciHpState it was expecting, because VMSTATE_PCI_HOTPLUG
is a macro and not another struct).  This means the field is randomly
loaded/saved based on a random pointer.  In 6.x this random pointer
randomly seems to get 0 for everyone (!); in 7.0rc it's getting junk
and trying to load a field that the source didn't send.  The migration
stream gets out of line and hits the section footer.

The bodge is on piix4 never to load the field:
  a) Most 6.x builds never send it, so most of the time the migration
    will work.
  b) We can backport this fix to 6.x to remove the boobytrap.
  c) It should never have made a difference anyway since the acpi-index
    is command line configured and should be correct on the destination
    anyway
  d) ich9 is still sending/receiving this (unconditionally all the time)
    but due to (c) should never notice.  We could follow up to make it
    skip.

It worries me just when (a) actually happens.

Fixes: b32bd76 ("pci: introduce acpi-index property for PCI device")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/932

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/acpi/acpi-pci-hotplug-stub.c |  4 ----
 hw/acpi/pcihp.c                 |  6 ------
 hw/acpi/piix4.c                 | 11 ++++++++++-
 include/hw/acpi/pcihp.h         |  2 --
 4 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/hw/acpi/acpi-pci-hotplug-stub.c b/hw/acpi/acpi-pci-hotplug-stub.c
index 734e4c5986..a43f6dafc9 100644
--- a/hw/acpi/acpi-pci-hotplug-stub.c
+++ b/hw/acpi/acpi-pci-hotplug-stub.c
@@ -41,7 +41,3 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
     return;
 }
 
-bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
-{
-    return false;
-}
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 6351bd3424..bf65bbea49 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -554,12 +554,6 @@ void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
                                    OBJ_PROP_FLAG_READ);
 }
 
-bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
-{
-     AcpiPciHpState *s = opaque;
-     return s->acpi_index;
-}
-
 const VMStateDescription vmstate_acpi_pcihp_pci_status = {
     .name = "acpi_pcihp_pci_status",
     .version_id = 1,
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index cc37fa3416..48aeedd5f0 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -267,6 +267,15 @@ static bool piix4_vmstate_need_smbus(void *opaque, int version_id)
     return pm_smbus_vmstate_needed();
 }
 
+/*
+ * This is a fudge to turn off the acpi_index field, whose
+ * test was always broken on piix4.
+ */
+static bool vmstate_test_never(void *opaque, int version_id)
+{
+    return false;
+}
+
 /* qemu-kvm 1.2 uses version 3 but advertised as 2
  * To support incoming qemu-kvm 1.2 migration, change version_id
  * and minimum_version_id to 2 below (which breaks migration from
@@ -297,7 +306,7 @@ static const VMStateDescription vmstate_acpi = {
             struct AcpiPciHpPciStatus),
         VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug, PIIX4PMState,
                             vmstate_test_use_acpi_hotplug_bridge,
-                            vmstate_acpi_pcihp_use_acpi_index),
+                            vmstate_test_never),
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription*[]) {
diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index af1a169fc3..7e268c2c9c 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -73,8 +73,6 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off);
 
 extern const VMStateDescription vmstate_acpi_pcihp_pci_status;
 
-bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id);
-
 #define VMSTATE_PCI_HOTPLUG(pcihp, state, test_pcihp, test_acpi_index) \
         VMSTATE_UINT32_TEST(pcihp.hotplug_select, state, \
                             test_pcihp), \
-- 
2.35.1


