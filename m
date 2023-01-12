Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CD766748E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:09:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBa-0002cY-N3; Thu, 12 Jan 2023 09:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBE-0002Cf-Rw
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB9-0005t5-Gl
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5y+uFhppFRUUtN2ntgLPTXb9aS86BpPqJCSdEEZZAQs=;
 b=BqBGm5m/iHmbWFQ+IrTtjwbdJy6EXT6JTzu2B202mk74KnmhQdcDRutxMIyNhXKds1mMJI
 6lLMw9AH5ef0G27ClLLtwC9ynYaQzNfK30Y1jc2mdAda+f78BB4ie053YFi1dPPiSpsr+D
 L3bA3BL0VDv5AkG1KoyUrEMpEto8FVM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-UhJgAn0yMui0JGWhlgVxzQ-1; Thu, 12 Jan 2023 09:03:24 -0500
X-MC-Unique: UhJgAn0yMui0JGWhlgVxzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9934185C6FD;
 Thu, 12 Jan 2023 14:03:22 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF26A4085720;
 Thu, 12 Jan 2023 14:03:21 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/40] pcihp: piix4: do not call acpi_pcihp_reset() when ACPI
 PCI hotplug is disabled
Date: Thu, 12 Jan 2023 15:02:42 +0100
Message-Id: <20230112140312.3096331-11-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

piix4_pm_reset() is calling acpi_pcihp_reset() when ACPI PCI hotplug
is disabled, which leads to assigning BSEL properties to bridges on path
   acpi_set_bsel()
       ...
       if (qbus_is_hotpluggable(BUS(bus))) {
          // above happens to be true by default (though it's SHPC hotplug handler)
          // set BSEL
       }

At the moment the issue is masked by the fact that we use not only BSEL,
to decide if we should generated hoplug AML but also pcihp_bridge_en knob.
However the later patches will drop dependency on pcihp_bridge_en,
and use only BSEL exclusively to decide if hotplug AML for slots should be built,
which exposes issue.

We should not ever call acpi_pcihp_reset() if ACPI PCI hotplug is disabled,
make it so.

PS:
 * Q35 does the right thing (i.e. it calls acpi_pcihp_reset only when pcihp is enabled)
 * the issue also makes acpi_pcihp_update() logic run on SHPC enabled bridges,
   which seems to be harmless

Fixes: 3d7e78aa777 ("Introduce a new flag for i440fx to disable PCI hotplug on the root bus")
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: "Philippe Mathieu-Daudé" <philmd@linaro.org>
---
 hw/acpi/piix4.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 0a81f1ad93..f256761e55 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -305,7 +305,9 @@ static void piix4_pm_reset(DeviceState *dev)
     acpi_update_sci(&s->ar, s->irq);
 
     pm_io_space_update(s);
-    acpi_pcihp_reset(&s->acpi_pci_hotplug, !s->use_acpi_root_pci_hotplug);
+    if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
+        acpi_pcihp_reset(&s->acpi_pci_hotplug, !s->use_acpi_root_pci_hotplug);
+    }
 }
 
 static void piix4_pm_powerdown_req(Notifier *n, void *opaque)
-- 
2.31.1


