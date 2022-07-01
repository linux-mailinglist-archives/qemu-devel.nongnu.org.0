Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD325634C8
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 15:59:59 +0200 (CEST)
Received: from localhost ([::1]:41060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7HBe-0002Wy-CN
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 09:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o7Go4-00014O-P9
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:35:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o7Go1-00054t-U8
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656682533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5BWjeKHTfGGBEhWcz7w6Oewz4T3uYbdxlTnu3ZA9xdQ=;
 b=I7278cI9sGDZdWuKD4a7z1lXAmswjPAcXHVNxpsiQkGmcpsX65cBgtsaKkQORiD/V06Gkx
 rDFkvXlNmryy3jkyNFm7cHoUE8T1eJX6aTxRfsluVbl6Gw8AwR0Ru08/K8hNl74+QKwuzu
 +8iw7/1AFEWh18OAeSUrPH0pKvDH2CQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-7o90CaOrOtS4SwDrF4Yh8w-1; Fri, 01 Jul 2022 09:35:30 -0400
X-MC-Unique: 7o90CaOrOtS4SwDrF4Yh8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1E4829324BD;
 Fri,  1 Jul 2022 13:35:29 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64E39400DFA6;
 Fri,  1 Jul 2022 13:35:29 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca
Subject: [PATCH 15/17] x86: pci: acpi:  reorder Device's _DSM method
Date: Fri,  1 Jul 2022 09:35:13 -0400
Message-Id: <20220701133515.137890-16-imammedo@redhat.com>
In-Reply-To: <20220701133515.137890-1-imammedo@redhat.com>
References: <20220701133515.137890-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

align _DSM method in empty slot descriptor with
a populated slot position.
Expected change:
  +            Device (SE8)
  +            {
  +                Name (_ADR, 0x001D0000)  // _ADR: Address
  +                Name (ASUN, 0x1D)
                   Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                   {
                       Local0 = Package (0x02)
                           {
                               BSEL,
                               ASUN
                           }
                       Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
                   }
  -            }

  -            Device (SE8)
  -            {
  -                Name (_ADR, 0x001D0000)  // _ADR: Address
  -                Name (ASUN, 0x1D)
                   Name (_SUN, 0x1D)  // _SUN: Slot User Number
                   Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                   {
                       PCEJ (BSEL, _SUN)
                   }
  +            }

i.e. put _DSM right after ASUN, with _SUN/_EJ0 following it.

that will eliminate contextual changes (causing test failures)
when follow up patches merge code generating populated and empty
slots descriptors.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index fd7f3253e5..406bbac1c7 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -444,15 +444,13 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
                 dev = aml_device("S%.02X", devfn);
                 aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
                 aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
+                aml_append(dev, aml_pci_device_dsm());
                 aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
                 method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
                 aml_append(method,
                     aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
                 );
                 aml_append(dev, method);
-
-                aml_append(dev, aml_pci_device_dsm());
-
                 aml_append(parent_scope, dev);
 
                 build_append_pcihp_notify_entry(notify_method, slot);
-- 
2.31.1


