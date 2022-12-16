Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5257D64EBBA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 13:58:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6AHp-0007qQ-2z; Fri, 16 Dec 2022 07:58:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p6AHl-0007pi-OD
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:57:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p6AHj-00063j-SP
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:57:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671195475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d1reKDkzKbu/2P5wIVUeEoIoAgi/Wc1pngBnCH10X70=;
 b=Xx+aQKnyN6P8xhx+Z+leKTh1+Z6riTkqlMRI5s9UNWa1PQMyfgP/ps0KjYx58AzLfB5lhX
 vSUlKbNTiKqRzJ6cKKflIElocfQMWzS+OZ/72o4+4Z6IB7CuVU1Xd923PFGSEQQxtsjea3
 h4q+KgqM+jr1Bveje/XP9RsYBlboYcI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-XynEhUcrNqK_6lTuKrqahA-1; Fri, 16 Dec 2022 07:57:51 -0500
X-MC-Unique: XynEhUcrNqK_6lTuKrqahA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75E252806055;
 Fri, 16 Dec 2022 12:57:51 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27472492C14;
 Fri, 16 Dec 2022 12:57:51 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>
Subject: [PATCH 2/5] hw/isa: add trace events for ICH9 LPC chip config access
Date: Fri, 16 Dec 2022 07:57:46 -0500
Message-Id: <20221216125749.596075-3-berrange@redhat.com>
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

These tracepoints aid in understanding and debugging the guest drivers
for the TCO watchdog.

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/isa/lpc_ich9.c   | 3 +++
 hw/isa/trace-events | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 6c44cc9767..cea73924b4 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -52,6 +52,7 @@
 #include "hw/nvram/fw_cfg.h"
 #include "qemu/cutils.h"
 #include "hw/acpi/acpi_aml_interface.h"
+#include "trace.h"
 
 /*****************************************************************************/
 /* ICH9 LPC PCI to ISA bridge */
@@ -162,6 +163,7 @@ static void ich9_cc_write(void *opaque, hwaddr addr,
 {
     ICH9LPCState *lpc = (ICH9LPCState *)opaque;
 
+    trace_ich9_cc_write(addr, val, len);
     ich9_cc_addr_len(&addr, &len);
     memcpy(lpc->chip_config + addr, &val, len);
     pci_bus_fire_intx_routing_notifier(pci_get_bus(&lpc->d));
@@ -177,6 +179,7 @@ static uint64_t ich9_cc_read(void *opaque, hwaddr addr,
     uint32_t val = 0;
     ich9_cc_addr_len(&addr, &len);
     memcpy(&val, lpc->chip_config + addr, len);
+    trace_ich9_cc_read(addr, val, len);
     return val;
 }
 
diff --git a/hw/isa/trace-events b/hw/isa/trace-events
index b8f877e1ed..c4567a9b47 100644
--- a/hw/isa/trace-events
+++ b/hw/isa/trace-events
@@ -21,3 +21,7 @@ via_pm_io_read(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%
 via_pm_io_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
 via_superio_read(uint8_t addr, uint8_t val) "addr 0x%x val 0x%x"
 via_superio_write(uint8_t addr, uint32_t val) "addr 0x%x val 0x%x"
+
+# lpc_ich9.c
+ich9_cc_write(uint64_t addr, uint64_t val, unsigned len) "addr=0x%"PRIx64 " val=0x%"PRIx64 " len=%u"
+ich9_cc_read(uint64_t addr, uint64_t val, unsigned len) "addr=0x%"PRIx64 " val=0x%"PRIx64 " len=%u"
-- 
2.38.1


