Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C16F3DCFBE
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 06:35:31 +0200 (CEST)
Received: from localhost ([::1]:60858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAPfl-0006FT-Nx
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 00:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAPeI-0004Gg-S0
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 00:33:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAPeG-0007ym-8n
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 00:33:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627878835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCuH2DnGhTuHPp0vTXmmmjvPeuqyrQZJIMyE/uSi21Q=;
 b=XQ+32jXTRBI1VGsElaKxSEInKfCX0jYJDzjicGHaqs7fdSrLtO2qkORb+cT96/0gE3dz7N
 fzYHDU28TtCSXEPOATUarkYeL2WXxOvhUwrTlVLLTMnbzM9Clq4kOn6TewKU08enl9TgEv
 O0xVJlDptok4qrX/Q8ENzqc/4OYGCaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-0LrlqFmoMBaf4yQGm9hHhg-1; Mon, 02 Aug 2021 00:33:51 -0400
X-MC-Unique: 0LrlqFmoMBaf4yQGm9hHhg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB2FF760C0;
 Mon,  2 Aug 2021 04:33:50 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-135.pek2.redhat.com
 [10.72.12.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0228B544F1;
 Mon,  2 Aug 2021 04:33:48 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 1/5] hw/net/vmxnet3: Do not abort QEMU if guest specified bad
 queue numbers
Date: Mon,  2 Aug 2021 12:33:40 +0800
Message-Id: <20210802043344.44301-2-jasowang@redhat.com>
In-Reply-To: <20210802043344.44301-1-jasowang@redhat.com>
References: <20210802043344.44301-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

QEMU should never terminate unexpectedly just because the guest is
doing something wrong like specifying wrong queue numbers. Let's
simply refuse to set the device active in this case.

Buglink: https://bugs.launchpad.net/qemu/+bug/1890160
Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/vmxnet3.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index f6bd8c5..41f796a 100644
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
2.7.4


