Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3491F6252
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 09:32:01 +0200 (CEST)
Received: from localhost ([::1]:38668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjHgu-00027c-Lt
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 03:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jjHeh-0008Mr-Hs
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 03:29:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29775
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jjHeg-0004hm-N4
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 03:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591860582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/FjwBLKzVq6/82OVquguZUIfN7aJ7ZiA74RDZbhct0=;
 b=fQe5gJZIbuhliQu+7r+2+22+rbJztTrFI2XpbJ2wgZjz9vx1IX/tt1VzzmYZHgJbyBSndx
 IxFHawjPYWFcjdBjLFxfFyXtiAA55CPhHHrpRZVEDilKTAHvxp04UL2FDuWvCtHo9aJKM0
 8AbXaAzQqQjbSx7mUi82YsptqLokTz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-y3aNmbz3MbeIzDeLh_aN1w-1; Thu, 11 Jun 2020 03:29:40 -0400
X-MC-Unique: y3aNmbz3MbeIzDeLh_aN1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 556558015CB;
 Thu, 11 Jun 2020 07:29:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BE3360CD3;
 Thu, 11 Jun 2020 07:29:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EC0091753B; Thu, 11 Jun 2020 09:29:19 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 07/10] acpi: simplify build_isa_devices_aml()
Date: Thu, 11 Jun 2020 09:29:16 +0200
Message-Id: <20200611072919.16638-8-kraxel@redhat.com>
In-Reply-To: <20200611072919.16638-1-kraxel@redhat.com>
References: <20200611072919.16638-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

x86 machines can have a single ISA bus only.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/acpi-build.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 86be45eea17c..c8e47700fc53 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -940,19 +940,14 @@ static void build_hpet_aml(Aml *table)
 static void build_isa_devices_aml(Aml *table)
 {
     bool ambiguous;
-
-    Aml *scope = aml_scope("_SB.PCI0.ISA");
     Object *obj = object_resolve_path_type("", TYPE_ISA_BUS, &ambiguous);
+    Aml *scope;
 
-    if (ambiguous) {
-        error_report("Multiple ISA busses, unable to define IPMI ACPI data");
-    } else if (!obj) {
-        error_report("No ISA bus, unable to define IPMI ACPI data");
-    } else {
-        build_acpi_ipmi_devices(scope, BUS(obj), "\\_SB.PCI0.ISA");
-        isa_build_aml(ISA_BUS(obj), scope);
-    }
+    assert(obj && !ambiguous);
 
+    scope = aml_scope("_SB.PCI0.ISA");
+    build_acpi_ipmi_devices(scope, BUS(obj), "\\_SB.PCI0.ISA");
+    isa_build_aml(ISA_BUS(obj), scope);
     aml_append(table, scope);
 }
 
-- 
2.18.4


