Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26BE543218
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:01:46 +0200 (CEST)
Received: from localhost ([::1]:55852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywFl-0001X7-Pm
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw86-0000uJ-EJ
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw84-0004JI-7V
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AtunewxEEVm8Yh4wp9lNGuDIfKIaHkkqybPsYObKd4A=;
 b=F1Z7vN2/XnyoBcpupUgiPSwE4GEdyd0Uv3sC8zbpc4kFmJ5fPVba058a+rVaTWJG1r7iEG
 N/kFXgDtbT1K5KW31wWOvlvLURVwt5bPilz3WFIhkJxRRFkzB3/j90/H306PSHFL1WXP6R
 fCGLRn05w7I8GNAKI4PlIaJOz5o6FeQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-rGZ8qXhuP0OSgEKWK8cDgA-1; Wed, 08 Jun 2022 09:53:44 -0400
X-MC-Unique: rGZ8qXhuP0OSgEKWK8cDgA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 230C4380451B;
 Wed,  8 Jun 2022 13:53:44 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66A4BC27E97;
 Wed,  8 Jun 2022 13:53:43 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 02/35] acpi: make isa_build_aml() support AcpiDevAmlIf
 interface
Date: Wed,  8 Jun 2022 09:53:07 -0400
Message-Id: <20220608135340.3304695-3-imammedo@redhat.com>
In-Reply-To: <20220608135340.3304695-1-imammedo@redhat.com>
References: <20220608135340.3304695-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

To allow incremental conversion from ISADeviceClass::build_aml
to AcpiDevAmlIf, add support for the later without removing
the former. Once conversion is complete, another commit will
drop ISADeviceClass::build_aml related code.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/isa/isa-bus.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index cd5ad3687d..237e2cee12 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -24,6 +24,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
 #include "hw/isa/isa.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 static ISABus *isabus;
 
@@ -196,8 +197,12 @@ void isa_build_aml(ISABus *bus, Aml *scope)
     QTAILQ_FOREACH(kid, &bus->parent_obj.children, sibling) {
         dev = ISA_DEVICE(kid->child);
         dc = ISA_DEVICE_GET_CLASS(dev);
+        bool has_build_dev_aml = !!object_dynamic_cast(OBJECT(dev),
+                                                       TYPE_ACPI_DEV_AML_IF);
         if (dc->build_aml) {
             dc->build_aml(dev, scope);
+        } else if (has_build_dev_aml) {
+            call_dev_aml_func(DEVICE(dev), scope);
         }
     }
 }
-- 
2.31.1


