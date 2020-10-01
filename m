Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C54280648
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 20:11:09 +0200 (CEST)
Received: from localhost ([::1]:53860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kO32q-0003M4-NN
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 14:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kO2fp-0003fP-Ae
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 13:47:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kO2fn-0006sP-E5
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 13:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601574438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dUHnpLwVdnwHzpPtlw7iMCZujqB+2ubRgsKhRQHIqYE=;
 b=MM3xfBuzaYLsFRGfjj2w/iQndaHHR/3juOsLSicpRrTxfCVJ5CmOcBv7tGKVpTLrWA0gKf
 RJlfLjwt5lF4bOsjQwf9b458epU9skgZOKk0on0GwF7lv/WkthA2ECd1VrPYB92HN4Ei2K
 bjSIvUNMzSv+m+Rr+8oBIvIdP/jp7OE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-PGlBVT1lOTOQmRL2sltrzw-1; Thu, 01 Oct 2020 13:47:03 -0400
X-MC-Unique: PGlBVT1lOTOQmRL2sltrzw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DB3C10060C1;
 Thu,  1 Oct 2020 17:47:02 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1332B5C1CF;
 Thu,  1 Oct 2020 17:47:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 9/9] ide: cancel pending callbacks on SRST
Date: Thu,  1 Oct 2020 13:46:49 -0400
Message-Id: <20201001174649.1911016-10-jsnow@redhat.com>
In-Reply-To: <20201001174649.1911016-1-jsnow@redhat.com>
References: <20201001174649.1911016-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 02:15:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SRST implementation did not keep up with the rest of IDE; it is
possible to perform a weak reset on an IDE device to remove the BSY/DRQ
bits, and then issue writes to the control/device registers which can
cause chaos with the state machine.

Fix that by actually performing a real reset.

Reported-by: Alexander Bulekov <alxndr@bu.edu>
Fixes: https://bugs.launchpad.net/qemu/+bug/1878253
Fixes: https://bugs.launchpad.net/qemu/+bug/1887303
Fixes: https://bugs.launchpad.net/qemu/+bug/1887309
Signed-off-by: John Snow <jsnow@redhat.com>
---
 hw/ide/core.c | 58 +++++++++++++++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 18 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 0d745d63a18..0e32abd7796 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2241,6 +2241,37 @@ uint32_t ide_status_read(void *opaque, uint32_t addr)
     return ret;
 }
 
+static void ide_perform_srst(IDEState *s)
+{
+    s->status |= BUSY_STAT;
+
+    /* Halt PIO (Via register state); PIO BH remains scheduled. */
+    ide_transfer_halt(s);
+
+    /* Cancel DMA -- may drain block device and invoke callbacks */
+    ide_cancel_dma_sync(s);
+
+    /* Cancel PIO callback, reset registers/signature, etc */
+    ide_reset(s);
+
+    if (s->drive_kind == IDE_CD) {
+        /* ATAPI drives do not set READY or SEEK */
+        s->status = 0x00;
+    }
+}
+
+static void ide_bus_perform_srst(void *opaque)
+{
+    IDEBus *bus = opaque;
+    IDEState *s;
+    int i;
+
+    for (i = 0; i < 2; i++) {
+        s = &bus->ifs[i];
+        ide_perform_srst(s);
+    }
+}
+
 void ide_ctrl_write(void *opaque, uint32_t addr, uint32_t val)
 {
     IDEBus *bus = opaque;
@@ -2249,26 +2280,17 @@ void ide_ctrl_write(void *opaque, uint32_t addr, uint32_t val)
 
     trace_ide_ctrl_write(addr, val, bus);
 
-    /* common for both drives */
-    if (!(bus->cmd & IDE_CTRL_RESET) &&
-        (val & IDE_CTRL_RESET)) {
-        /* reset low to high */
-        for(i = 0;i < 2; i++) {
+    /* Device0 and Device1 each have their own control register,
+     * but QEMU models it as just one register in the controller. */
+    if ((bus->cmd & IDE_CTRL_RESET) &&
+        !(val & IDE_CTRL_RESET)) {
+        /* SRST triggers on falling edge */
+        for (i = 0; i < 2; i++) {
             s = &bus->ifs[i];
-            s->status = BUSY_STAT | SEEK_STAT;
-            s->error = 0x01;
-        }
-    } else if ((bus->cmd & IDE_CTRL_RESET) &&
-               !(val & IDE_CTRL_RESET)) {
-        /* high to low */
-        for(i = 0;i < 2; i++) {
-            s = &bus->ifs[i];
-            if (s->drive_kind == IDE_CD)
-                s->status = 0x00; /* NOTE: READY is _not_ set */
-            else
-                s->status = READY_STAT | SEEK_STAT;
-            ide_set_signature(s);
+            s->status |= BUSY_STAT;
         }
+        aio_bh_schedule_oneshot(qemu_get_aio_context(),
+                                ide_bus_perform_srst, bus);
     }
 
     bus->cmd = val;
-- 
2.26.2


