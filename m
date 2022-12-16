Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2149B64EBBD
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 13:59:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6AHo-0007qK-Dq; Fri, 16 Dec 2022 07:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p6AHk-0007pT-SX
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:57:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p6AHj-00063f-EF
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:57:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671195474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1zpCjZAU0bclMfxFBYAiccs274UHUw9k6xHVPDLlAA0=;
 b=iFC0hwLWNmEISHzL/4YzZY7FkBlKxbB2RKNu8V9wUdWtVX7iJ1nEdr4B3Q2A0PKnUUxaHq
 yvLtpNnTELC8vNqQJypZPnYwk8XVBVUE2xRVtK3jgEqBAPHKTX85Akbp+FUV58+8M9f2hE
 umdlBbV3IXsN42ekO/HydnVvgDDZCbE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-5T5jTAE6NSy-B4MUPXg8Sw-1; Fri, 16 Dec 2022 07:57:51 -0500
X-MC-Unique: 5T5jTAE6NSy-B4MUPXg8Sw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DD3D1C25E80;
 Fri, 16 Dec 2022 12:57:51 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2982492C14;
 Fri, 16 Dec 2022 12:57:50 +0000 (UTC)
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
Subject: [PATCH 1/5] hw/acpi: add trace events for TCO watchdog register access
Date: Fri, 16 Dec 2022 07:57:45 -0500
Message-Id: <20221216125749.596075-2-berrange@redhat.com>
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
 hw/acpi/tco.c        | 41 ++++++++++++++++++++++++++++-------------
 hw/acpi/trace-events |  2 ++
 2 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/hw/acpi/tco.c b/hw/acpi/tco.c
index 4783721e4e..9ebd3e5e64 100644
--- a/hw/acpi/tco.c
+++ b/hw/acpi/tco.c
@@ -86,6 +86,7 @@ static inline int can_start_tco_timer(TCOIORegs *tr)
 static uint32_t tco_ioport_readw(TCOIORegs *tr, uint32_t addr)
 {
     uint16_t rld;
+    uint32_t ret = 0;
 
     switch (addr) {
     case TCO_RLD:
@@ -96,35 +97,49 @@ static uint32_t tco_ioport_readw(TCOIORegs *tr, uint32_t addr)
         } else {
             rld = tr->tco.rld;
         }
-        return rld;
+        ret = rld;
+        break;
     case TCO_DAT_IN:
-        return tr->tco.din;
+        ret = tr->tco.din;
+        break;
     case TCO_DAT_OUT:
-        return tr->tco.dout;
+        ret = tr->tco.dout;
+        break;
     case TCO1_STS:
-        return tr->tco.sts1;
+        ret = tr->tco.sts1;
+        break;
     case TCO2_STS:
-        return tr->tco.sts2;
+        ret = tr->tco.sts2;
+        break;
     case TCO1_CNT:
-        return tr->tco.cnt1;
+        ret = tr->tco.cnt1;
+        break;
     case TCO2_CNT:
-        return tr->tco.cnt2;
+        ret = tr->tco.cnt2;
+        break;
     case TCO_MESSAGE1:
-        return tr->tco.msg1;
+        ret = tr->tco.msg1;
+        break;
     case TCO_MESSAGE2:
-        return tr->tco.msg2;
+        ret = tr->tco.msg2;
+        break;
     case TCO_WDCNT:
-        return tr->tco.wdcnt;
+        ret = tr->tco.wdcnt;
+        break;
     case TCO_TMR:
-        return tr->tco.tmr;
+        ret = tr->tco.tmr;
+        break;
     case SW_IRQ_GEN:
-        return tr->sw_irq_gen;
+        ret = tr->sw_irq_gen;
+        break;
     }
-    return 0;
+    trace_tco_io_read(addr, ret);
+    return ret;
 }
 
 static void tco_ioport_writew(TCOIORegs *tr, uint32_t addr, uint32_t val)
 {
+    trace_tco_io_write(addr, val);
     switch (addr) {
     case TCO_RLD:
         tr->timeouts_no = 0;
diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index eb60b04f9b..78e0a8670e 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -55,6 +55,8 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
 # tco.c
 tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
 tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
+tco_io_write(uint64_t addr, uint32_t val) "addr=0x%" PRIx64 " val=0x%" PRIx32
+tco_io_read(uint64_t addr, uint32_t val) "addr=0x%" PRIx64 " val=0x%" PRIx32
 
 # erst.c
 acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%04" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
-- 
2.38.1


