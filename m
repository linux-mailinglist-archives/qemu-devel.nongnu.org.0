Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53E264EBBC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 13:59:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6AI5-0007rq-K9; Fri, 16 Dec 2022 07:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p6AHy-0007rR-4d
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:58:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p6AHl-00063y-87
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:57:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671195476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Muen1443LeWWa/dZYbIKAnRA8skUYm0Halhqwd8H1QI=;
 b=ONprUWNIdumxqPwOZP7PRdUPjI1EsHBhXyWyqpVokGkRh45DcNs1FMjrCBoAJ2f+ROu7l9
 S5ifX5FtIH3PtUqjkhiFJJ1merqviBAtV8WfPrartr3LfkrUTQRqqokyUhiWWvAsaKe/pL
 lw4ZrAMSVWVvPp5Lw34wBUVZcF1Q3Mg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-qLqVBN2zO8u_1fyh2Ly91A-1; Fri, 16 Dec 2022 07:57:52 -0500
X-MC-Unique: qLqVBN2zO8u_1fyh2Ly91A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C18A87A9E2;
 Fri, 16 Dec 2022 12:57:52 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4264B492C1B;
 Fri, 16 Dec 2022 12:57:52 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 5/5] ich9: honour 'enable_tco' property
Date: Fri, 16 Dec 2022 07:57:49 -0500
Message-Id: <20221216125749.596075-6-berrange@redhat.com>
In-Reply-To: <20221216125749.596075-1-berrange@redhat.com>
References: <20221216125749.596075-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

An 'ICH9-LPC.enable_tco' property has been exposed for a
very long time, but attempts to set it have never been
honoured.

Originally, any user provided 'enable_tco' value was force
replaced by a value passed from the machine type setup
code that was determine by machine type compat properties.

  commit d6b304ba924b95d12edfddaac99777b577301309
  Author: Eduardo Habkost <ehabkost@redhat.com>
  Date:   Sat Jan 23 14:02:10 2016 -0200

    machine: Remove no_tco field

    The field is always set to zero, so it is not necessary anymore.

After legacy Q35 machine types were deleted in:

  commit 86165b499edf8b03bb2d0e926d116c2f12a95bfe
  Author: Eduardo Habkost <ehabkost@redhat.com>
  Date:   Sat Jan 23 14:02:09 2016 -0200

    q35: Remove old machine versions

the machine type code ended up just unconditionally passing
'true', all the time, so this was further simplified in

  commit d6b304ba924b95d12edfddaac99777b577301309
  Author: Eduardo Habkost <ehabkost@redhat.com>
  Date:   Sat Jan 23 14:02:10 2016 -0200

    machine: Remove no_tco field

    The field is always set to zero, so it is not necessary anymore.

  commit 18d6abae3ea092950629e5d26aff1dcfc9a2d78e
  Author: Eduardo Habkost <ehabkost@redhat.com>
  Date:   Sat Jan 23 14:02:11 2016 -0200

    ich9: Remove enable_tco arguments from init functions

    The enable_tco arguments are always true, so they are not needed
    anymore.

Leaving the ich9_pm_init to just force set 'enable_tco' to true.
This still overrides any user specified property. The initialization
of property defaults should be done when properties are first
registered, rather than during object construction.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/acpi/ich9.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index bd9bbade70..ea4182256d 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -316,8 +316,9 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
 
     pm->smm_enabled = smm_enabled;
 
-    pm->enable_tco = true;
-    acpi_pm_tco_init(&pm->tco_regs, &pm->io);
+    if (pm->enable_tco) {
+        acpi_pm_tco_init(&pm->tco_regs, &pm->io);
+    }
 
     if (pm->use_acpi_hotplug_bridge) {
         acpi_pcihp_init(OBJECT(lpc_pci),
@@ -440,6 +441,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     pm->s4_val = 2;
     pm->use_acpi_hotplug_bridge = true;
     pm->keep_pci_slot_hpc = true;
+    pm->enable_tco = true;
 
     object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
                                    &pm->pm_io_base, OBJ_PROP_FLAG_READ);
-- 
2.38.1


