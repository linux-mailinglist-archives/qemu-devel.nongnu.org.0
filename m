Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03825289F4B
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Oct 2020 10:22:28 +0200 (CEST)
Received: from localhost ([::1]:49464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRA95-0004GT-0G
	for lists+qemu-devel@lfdr.de; Sat, 10 Oct 2020 04:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kR9lb-0004fE-Ud
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 03:58:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kR9lZ-0006mN-Tn
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 03:58:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602316688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U0UUOtrq1fQ0NSBTSHvIDAywl8g3kvLSProVYS7MmD4=;
 b=OlpK63E0ELBabMvdEnrmUxBqDrWRND9I5HeT+bEjZ2N5ejOYVEP2fPTTf0UFV4CC6PoBIZ
 /0PQ2T3Iyw/xsP/LDQdHEeaxdil4gPODoTdlkdE9i/v5AasXiibGy3dEFJZXGOAabh2Z2i
 pemkoOemjjD3hXr8ghXmToW0CF7prCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-RcjmjQ9FN4WpZ2Y6d2kr0w-1; Sat, 10 Oct 2020 03:58:06 -0400
X-MC-Unique: RcjmjQ9FN4WpZ2Y6d2kr0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AA381005E61
 for <qemu-devel@nongnu.org>; Sat, 10 Oct 2020 07:58:05 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15F6D10021AA;
 Sat, 10 Oct 2020 07:58:05 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 38/39] scsi/scsi_bus: fix races in REPORT LUNS
Date: Sat, 10 Oct 2020 03:57:38 -0400
Message-Id: <20201010075739.951385-39-pbonzini@redhat.com>
In-Reply-To: <20201010075739.951385-1-pbonzini@redhat.com>
References: <20201010075739.951385-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/10 02:57:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

Currently scsi_target_emulate_report_luns iterates over the child device list
twice, and there is no guarantee that this list is the same in both iterations.

The reason for iterating twice is that the first iteration calculates
how much memory to allocate.  However if we use a dynamic array we can
avoid iterating twice, and therefore we avoid this race.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1866707

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20200913160259.32145-10-mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201006123904.610658-14-mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-bus.c | 68 ++++++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 35 deletions(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index eda8cb7e70..b901e701f0 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -438,19 +438,23 @@ struct SCSITargetReq {
 static void store_lun(uint8_t *outbuf, int lun)
 {
     if (lun < 256) {
+        /* Simple logical unit addressing method*/
+        outbuf[0] = 0;
         outbuf[1] = lun;
-        return;
+    } else {
+        /* Flat space addressing method */
+        outbuf[0] = 0x40 | (lun >> 8);
+        outbuf[1] = (lun & 255);
     }
-    outbuf[1] = (lun & 255);
-    outbuf[0] = (lun >> 8) | 0x40;
 }
 
 static bool scsi_target_emulate_report_luns(SCSITargetReq *r)
 {
     BusChild *kid;
-    int i, len, n;
     int channel, id;
-    bool found_lun0;
+    uint8_t tmp[8] = {0};
+    int len = 0;
+    GByteArray *buf;
 
     if (r->req.cmd.xfer < 16) {
         return false;
@@ -458,46 +462,40 @@ static bool scsi_target_emulate_report_luns(SCSITargetReq *r)
     if (r->req.cmd.buf[2] > 2) {
         return false;
     }
+
+    /* reserve space for 63 LUNs*/
+    buf = g_byte_array_sized_new(512);
+
     channel = r->req.dev->channel;
     id = r->req.dev->id;
-    found_lun0 = false;
-    n = 0;
 
-    RCU_READ_LOCK_GUARD();
+    /* add size (will be updated later to correct value */
+    g_byte_array_append(buf, tmp, 8);
+    len += 8;
 
-    QTAILQ_FOREACH_RCU(kid, &r->req.bus->qbus.children, sibling) {
-        DeviceState *qdev = kid->child;
-        SCSIDevice *dev = SCSI_DEVICE(qdev);
+    /* add LUN0 */
+    g_byte_array_append(buf, tmp, 8);
+    len += 8;
 
-        if (dev->channel == channel && dev->id == id) {
-            if (dev->lun == 0) {
-                found_lun0 = true;
+    WITH_RCU_READ_LOCK_GUARD() {
+        QTAILQ_FOREACH_RCU(kid, &r->req.bus->qbus.children, sibling) {
+            DeviceState *qdev = kid->child;
+            SCSIDevice *dev = SCSI_DEVICE(qdev);
+
+            if (dev->channel == channel && dev->id == id && dev->lun != 0) {
+                store_lun(tmp, dev->lun);
+                g_byte_array_append(buf, tmp, 8);
+                len += 8;
             }
-            n += 8;
         }
     }
-    if (!found_lun0) {
-        n += 8;
-    }
-
-    scsi_target_alloc_buf(&r->req, n + 8);
-
-    len = MIN(n + 8, r->req.cmd.xfer & ~7);
-    memset(r->buf, 0, len);
-    stl_be_p(&r->buf[0], n);
-    i = found_lun0 ? 8 : 16;
-    QTAILQ_FOREACH_RCU(kid, &r->req.bus->qbus.children, sibling) {
-        DeviceState *qdev = kid->child;
-        SCSIDevice *dev = SCSI_DEVICE(qdev);
 
-        if (dev->channel == channel && dev->id == id) {
-            store_lun(&r->buf[i], dev->lun);
-            i += 8;
-        }
-    }
+    r->buf_len = len;
+    r->buf = g_byte_array_free(buf, FALSE);
+    r->len = MIN(len, r->req.cmd.xfer & ~7);
 
-    assert(i == n + 8);
-    r->len = len;
+    /* store the LUN list length */
+    stl_be_p(&r->buf[0], len - 8);
     return true;
 }
 
-- 
2.26.2



