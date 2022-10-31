Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949B66137B9
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:20:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUi5-0003Xt-4C; Mon, 31 Oct 2022 09:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1opUho-0002ik-2O
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:19:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1opUhj-0005OC-SZ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667222390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VFdbS4xgEJzjazrbo4GSOQemc4ocXbeTbKoKAwqOYMQ=;
 b=DTGbj4jGj0OMhF0I+LXyRVUS93r0GfFlPMHEj4NFzoERmbVRUBy9ilfxo6BtwOQwEE7gcH
 RN5CXzasW/zNDKk+pn+EzsXUJxQOLCeVOQcVFf+vE4sHUGneq23k2vOqGddbxsos/INqxQ
 U4OMcKTHHAWpPCejxxzgMqrNaKCjG1E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-RFV7cLLaOnaFkEOqNlK-dw-1; Mon, 31 Oct 2022 09:19:46 -0400
X-MC-Unique: RFV7cLLaOnaFkEOqNlK-dw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB47F8027EC;
 Mon, 31 Oct 2022 13:19:45 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6A01477F5C;
 Mon, 31 Oct 2022 13:19:43 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/4] hw/isa: add trace events for ICH9 LPC chip config access
Date: Mon, 31 Oct 2022 13:19:32 +0000
Message-Id: <20221031131934.425448-3-berrange@redhat.com>
In-Reply-To: <20221031131934.425448-1-berrange@redhat.com>
References: <20221031131934.425448-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

These tracepoints aid in understanding and debugging the guest drivers
for the TCO watchdog.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/isa/lpc_ich9.c   | 3 +++
 hw/isa/trace-events | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 4553b5925b..66062a344c 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -51,6 +51,7 @@
 #include "hw/nvram/fw_cfg.h"
 #include "qemu/cutils.h"
 #include "hw/acpi/acpi_aml_interface.h"
+#include "trace.h"
 
 /*****************************************************************************/
 /* ICH9 LPC PCI to ISA bridge */
@@ -161,6 +162,7 @@ static void ich9_cc_write(void *opaque, hwaddr addr,
 {
     ICH9LPCState *lpc = (ICH9LPCState *)opaque;
 
+    trace_ich9_cc_write(addr, val, len);
     ich9_cc_addr_len(&addr, &len);
     memcpy(lpc->chip_config + addr, &val, len);
     pci_bus_fire_intx_routing_notifier(pci_get_bus(&lpc->d));
@@ -176,6 +178,7 @@ static uint64_t ich9_cc_read(void *opaque, hwaddr addr,
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
2.37.3


