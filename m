Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2886D3D110A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:19:38 +0200 (CEST)
Received: from localhost ([::1]:33394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6D4T-0007fr-8I
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m6D1D-0004oD-DK
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m6D1B-0006Xs-1O
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626876972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mYClNOdR/JIh2Kx+APhPJAG9jsgyvg3X4IZEDB/39iM=;
 b=XyBZS/itWVCu6YGIsDHCz+gDJl0QHmwBHxBfbYyOWA19LMTImiSgKkUT5u795KZ2kP9lOk
 6edzcFnFZrrHsnEQRuCbbV3Z4Ai2Rgwz/RsS/ldjn+J7VybW/add67W3iDFRxLeRFaBKY4
 7jIJ7NBs1OpTQETUf3A3vLKZcazHARQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-7Dkin_VTMj2lW8KQdxKCfA-1; Wed, 21 Jul 2021 10:16:09 -0400
X-MC-Unique: 7Dkin_VTMj2lW8KQdxKCfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EDDC1012EB2;
 Wed, 21 Jul 2021 14:16:08 +0000 (UTC)
Received: from thuth.com (ovpn-112-9.ams2.redhat.com [10.36.112.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 722555D6D1;
 Wed, 21 Jul 2021 14:16:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>
Subject: [PATCH] hw/net/vmxnet3: Do not abort QEMU if guest specified bad
 queue numbers
Date: Wed, 21 Jul 2021 16:15:59 +0200
Message-Id: <20210721141559.3647945-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU should never terminate unexpectedly just because the guest is
doing something wrong like specifying wrong queue numbers. Let's
simply refuse to set the device active in this case.

Buglink: https://bugs.launchpad.net/qemu/+bug/1890160
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/net/vmxnet3.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index f6bd8c53b1..41f796a247 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -1381,7 +1381,7 @@ static void vmxnet3_validate_interrupts(VMXNET3State *s)
     }
 }
 
-static void vmxnet3_validate_queues(VMXNET3State *s)
+static bool vmxnet3_validate_queues(VMXNET3State *s)
 {
     /*
     * txq_num and rxq_num are total number of queues
@@ -1390,12 +1390,18 @@ static void vmxnet3_validate_queues(VMXNET3State *s)
     */
 
     if (s->txq_num > VMXNET3_DEVICE_MAX_TX_QUEUES) {
-        hw_error("Bad TX queues number: %d\n", s->txq_num);
+        qemu_log_mask(LOG_GUEST_ERROR, "vmxnet3: Bad TX queues number: %d\n",
+                      s->txq_num);
+        return false;
     }
 
     if (s->rxq_num > VMXNET3_DEVICE_MAX_RX_QUEUES) {
-        hw_error("Bad RX queues number: %d\n", s->rxq_num);
+        qemu_log_mask(LOG_GUEST_ERROR, "vmxnet3: Bad RX queues number: %d\n",
+                      s->rxq_num);
+        return false;
     }
+
+    return true;
 }
 
 static void vmxnet3_activate_device(VMXNET3State *s)
@@ -1419,6 +1425,16 @@ static void vmxnet3_activate_device(VMXNET3State *s)
         return;
     }
 
+    s->txq_num =
+        VMXNET3_READ_DRV_SHARED8(d, s->drv_shmem, devRead.misc.numTxQueues);
+    s->rxq_num =
+        VMXNET3_READ_DRV_SHARED8(d, s->drv_shmem, devRead.misc.numRxQueues);
+
+    VMW_CFPRN("Number of TX/RX queues %u/%u", s->txq_num, s->rxq_num);
+    if (!vmxnet3_validate_queues(s)) {
+        return;
+    }
+
     vmxnet3_adjust_by_guest_type(s);
     vmxnet3_update_features(s);
     vmxnet3_update_pm_state(s);
@@ -1445,14 +1461,6 @@ static void vmxnet3_activate_device(VMXNET3State *s)
         VMXNET3_READ_DRV_SHARED8(d, s->drv_shmem, devRead.intrConf.autoMask);
     VMW_CFPRN("Automatic interrupt masking is %d", (int)s->auto_int_masking);
 
-    s->txq_num =
-        VMXNET3_READ_DRV_SHARED8(d, s->drv_shmem, devRead.misc.numTxQueues);
-    s->rxq_num =
-        VMXNET3_READ_DRV_SHARED8(d, s->drv_shmem, devRead.misc.numRxQueues);
-
-    VMW_CFPRN("Number of TX/RX queues %u/%u", s->txq_num, s->rxq_num);
-    vmxnet3_validate_queues(s);
-
     qdescr_table_pa =
         VMXNET3_READ_DRV_SHARED64(d, s->drv_shmem, devRead.misc.queueDescPA);
     VMW_CFPRN("TX queues descriptors table is at 0x%" PRIx64, qdescr_table_pa);
@@ -2404,7 +2412,9 @@ static int vmxnet3_post_load(void *opaque, int version_id)
         }
     }
 
-    vmxnet3_validate_queues(s);
+    if (!vmxnet3_validate_queues(s)) {
+        return -1;
+    }
     vmxnet3_validate_interrupts(s);
 
     return 0;
-- 
2.27.0


