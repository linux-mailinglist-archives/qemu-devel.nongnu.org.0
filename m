Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C35528907
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:38:44 +0200 (CEST)
Received: from localhost ([::1]:34328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcnz-0000d5-R8
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqcc2-0003BH-5P
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqcc0-0006Dv-JY
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652714779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EaJp3ExKRAz3E8r/C70LfHWN2VJm7tAG7hx/sEUygEo=;
 b=iMidutSobWg2CCzdQ62hQgxx3JNvkCw7IzGuiW8oi3QuTLxJcjnKhfW6ZX5Ql6kZVqiVAm
 Nr0kfJbQ1XTJtpMwjMjBMaT0EEkV7TxT3S6aYr+T2lr4tg5M/W4QOcgzTvK/G+6Fuf06Cw
 6Oz/4nJzda7T1giMBW+OpeGHSegK1ZQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-xjUcut9WPFm0B9kerrOXXg-1; Mon, 16 May 2022 11:26:16 -0400
X-MC-Unique: xjUcut9WPFm0B9kerrOXXg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D88E83C322E3;
 Mon, 16 May 2022 15:26:15 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0E40401E74;
 Mon, 16 May 2022 15:26:14 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Subject: [PATCH 02/35] acpi: make isa_build_aml() support AcpiDevAmlIf
 interface
Date: Mon, 16 May 2022 11:25:37 -0400
Message-Id: <20220516152610.1963435-3-imammedo@redhat.com>
In-Reply-To: <20220516152610.1963435-1-imammedo@redhat.com>
References: <20220516152610.1963435-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


