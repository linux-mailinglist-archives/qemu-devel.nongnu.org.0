Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73A8219411
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 01:07:47 +0200 (CEST)
Received: from localhost ([::1]:38024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtJAI-0006Qj-UM
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 19:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1jtIqD-0002Yk-Qf
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 18:47:01 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:45722
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1jtIqC-0004VW-4z
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 18:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594248418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eC+y57IWUd8U7F/yMfK6DwPKjHxwPsfTVepeAIRU7xQ=;
 b=Guc6cQB3eFu5/7+uZQAITqh7MOc4HrWZ3i3gkY5iB25EMhKn8E/h/YiNzZ8kJK5Al2vPbB
 +6d8d1lWZcIVzivoe8oR/qzMiMSJntFDwUY0qyAOc+jDwIotekttJJFyMzGW0VNufhZzYt
 FhFy/iduKAUhQVBAGQbSCLmg9ZTYTpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-NurQkbLnOHuYtB9WWsUV4Q-1; Wed, 08 Jul 2020 18:46:57 -0400
X-MC-Unique: NurQkbLnOHuYtB9WWsUV4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8755B107ACF4;
 Wed,  8 Jul 2020 22:46:56 +0000 (UTC)
Received: from localhost.com (unknown [10.40.192.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70E731001B07;
 Wed,  8 Jul 2020 22:46:49 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/5] hw/i386/acpi-build: Turn off support of PCIe native
 hot-plug and SHPC in _OSC
Date: Thu,  9 Jul 2020 00:46:14 +0200
Message-Id: <20200708224615.114077-5-jusual@redhat.com>
In-Reply-To: <20200708224615.114077-1-jusual@redhat.com>
References: <20200708224615.114077-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jusual@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_FAKE_HELO_DOTCOM=1.189, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Other methods may be used if the system is capable of this and the _OSC bit
is set. Disable them explicitly to force ACPI PCI hot-plug use. The older
versions will still use PCIe native.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
---
 hw/i386/acpi-build.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 5c5ad88ad6..0e2891c3ea 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1599,6 +1599,7 @@ static Aml *build_q35_osc_method(AcpiPmInfo *pm)
     Aml *method;
     Aml *a_cwd1 = aml_name("CDW1");
     Aml *a_ctrl = aml_local(0);
+    unsigned osc_ctrl;
 
     method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
     aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
@@ -1612,9 +1613,12 @@ static Aml *build_q35_osc_method(AcpiPmInfo *pm)
 
     /*
      * Always allow native PME, AER (no dependencies)
-     * Allow SHPC (PCI bridges can have SHPC controller)
+     * Need to disable native and SHPC hot-plug to use acpihp
+     *
+     * PCI Firmware Specification, Revision 3.2
      */
-    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
+    osc_ctrl = pm->pcihp_bridge_en ? 0x1C : 0x1F;
+    aml_append(if_ctx, aml_and(a_ctrl, aml_int(osc_ctrl), a_ctrl));
 
     if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
     /* Unknown revision */
@@ -1696,7 +1700,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
         aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
         aml_append(dev, aml_name_decl("_UID", aml_int(1)));
-        aml_append(dev, build_q35_osc_method());
+        aml_append(dev, build_q35_osc_method(pm));
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
@@ -1771,7 +1775,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             if (pci_bus_is_express(bus)) {
                 aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
                 aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
-                aml_append(dev, build_q35_osc_method());
+                aml_append(dev, build_q35_osc_method(pm));
             } else {
                 aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
             }
-- 
2.25.4


