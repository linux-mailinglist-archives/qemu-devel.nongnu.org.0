Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA6C1FC703
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 09:17:24 +0200 (CEST)
Received: from localhost ([::1]:40534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlSK3-00068N-Dt
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 03:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jlSFB-0007YR-HV
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 03:12:21 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60664
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jlSF9-0000aG-Tq
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 03:12:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592377939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wYr0bo4lCUYt/KWCu731zOLOU8tcfPXPriQHHjSMKRY=;
 b=DA6j90Uz/QlRL7EMXyGeD2ErQFTwFPPf3DvJ+al/pDGUqL68RcVSPpm0djxoOc4gPxHfpP
 NBTB+Fjd5CoC3ZtEDepBpasonBVrty8W6/b/UzyKgX3mK9yT3CDTpDFGNBLowR8t3mlsjK
 BwOY1ZSHzYIaXnct2iYIKcG08UQtukc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-Qq0H_LRNOFO-6TV69-pSeg-1; Wed, 17 Jun 2020 03:12:17 -0400
X-MC-Unique: Qq0H_LRNOFO-6TV69-pSeg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1FE3102C7EE;
 Wed, 17 Jun 2020 07:12:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 074171002394;
 Wed, 17 Jun 2020 07:12:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D6CDB9D95; Wed, 17 Jun 2020 09:11:38 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 07/10] acpi: simplify build_isa_devices_aml()
Date: Wed, 17 Jun 2020 09:11:35 +0200
Message-Id: <20200617071138.11159-8-kraxel@redhat.com>
In-Reply-To: <20200617071138.11159-1-kraxel@redhat.com>
References: <20200617071138.11159-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 01:42:42
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
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

x86 machines can have a single ISA bus only.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/acpi-build.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 19e9c298dc8f..d27cecc877c4 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -979,18 +979,14 @@ static void build_isa_devices_aml(Aml *table)
 {
     VMBusBridge *vmbus_bridge = vmbus_bridge_find();
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
+
+    scope = aml_scope("_SB.PCI0.ISA");
+    build_acpi_ipmi_devices(scope, BUS(obj), "\\_SB.PCI0.ISA");
+    isa_build_aml(ISA_BUS(obj), scope);
 
     if (vmbus_bridge) {
         aml_append(scope, build_vmbus_device_aml(vmbus_bridge));
-- 
2.18.4


