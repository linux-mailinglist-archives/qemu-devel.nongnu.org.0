Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF6E4568EB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 05:06:42 +0100 (CET)
Received: from localhost ([::1]:44486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnvAe-0002Y2-I3
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 23:06:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnv7x-0000Vl-9V
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 23:03:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnv7u-0006AQ-Mp
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 23:03:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637294630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+tB+YFYhuHEBK7CsL9GlmnbNtRTQ7niRop0xvz4Kfc=;
 b=HPB8WGKLagC1HklJlgtPtUpTWcGLqiskjbbFPIwAnbA72wpE0mqduiunfP+QUX8P2Fq801
 QoYQLY4i5CizaVBCnjImmFTF+wyyPbMJKIFg8G/6pWHp+pjoY/qF7Jw1vakYNh69ibtpI+
 /z/yT3bY1nli46clWk416STxL0Rr6Bs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-x1_qXCHpNIatngA1G-4hcw-1; Thu, 18 Nov 2021 23:03:45 -0500
X-MC-Unique: x1_qXCHpNIatngA1G-4hcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25DD4802C91;
 Fri, 19 Nov 2021 04:03:44 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-18.pek2.redhat.com [10.72.13.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94B9460BF1;
 Fri, 19 Nov 2021 04:03:41 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 1/3] net: vmxnet3: validate configuration values during
 activate (CVE-2021-20203)
Date: Fri, 19 Nov 2021 12:03:34 +0800
Message-Id: <20211119040336.14460-2-jasowang@redhat.com>
In-Reply-To: <20211119040336.14460-1-jasowang@redhat.com>
References: <20211119040336.14460-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Jason Wang <jasowang@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

While activating device in vmxnet3_acticate_device(), it does not
validate guest supplied configuration values against predefined
minimum - maximum limits. This may lead to integer overflow or
OOB access issues. Add checks to avoid it.

Fixes: CVE-2021-20203
Buglink: https://bugs.launchpad.net/qemu/+bug/1913873
Reported-by: Gaoning Pan <pgn@zju.edu.cn>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/vmxnet3.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 41f796a..f65af4e 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -1441,6 +1441,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
     vmxnet3_setup_rx_filtering(s);
     /* Cache fields from shared memory */
     s->mtu = VMXNET3_READ_DRV_SHARED32(d, s->drv_shmem, devRead.misc.mtu);
+    assert(VMXNET3_MIN_MTU <= s->mtu && s->mtu < VMXNET3_MAX_MTU);
     VMW_CFPRN("MTU is %u", s->mtu);
 
     s->max_rx_frags =
@@ -1486,6 +1487,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
         /* Read rings memory locations for TX queues */
         pa = VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.txRingBasePA);
         size = VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.txRingSize);
+        if (size > VMXNET3_TX_RING_MAX_SIZE) {
+            size = VMXNET3_TX_RING_MAX_SIZE;
+        }
 
         vmxnet3_ring_init(d, &s->txq_descr[i].tx_ring, pa, size,
                           sizeof(struct Vmxnet3_TxDesc), false);
@@ -1496,6 +1500,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
         /* TXC ring */
         pa = VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.compRingBasePA);
         size = VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.compRingSize);
+        if (size > VMXNET3_TC_RING_MAX_SIZE) {
+            size = VMXNET3_TC_RING_MAX_SIZE;
+        }
         vmxnet3_ring_init(d, &s->txq_descr[i].comp_ring, pa, size,
                           sizeof(struct Vmxnet3_TxCompDesc), true);
         VMXNET3_RING_DUMP(VMW_CFPRN, "TXC", i, &s->txq_descr[i].comp_ring);
@@ -1537,6 +1544,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
             /* RX rings */
             pa = VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.rxRingBasePA[j]);
             size = VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.rxRingSize[j]);
+            if (size > VMXNET3_RX_RING_MAX_SIZE) {
+                size = VMXNET3_RX_RING_MAX_SIZE;
+            }
             vmxnet3_ring_init(d, &s->rxq_descr[i].rx_ring[j], pa, size,
                               sizeof(struct Vmxnet3_RxDesc), false);
             VMW_CFPRN("RX queue %d:%d: Base: %" PRIx64 ", Size: %d",
@@ -1546,6 +1556,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
         /* RXC ring */
         pa = VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.compRingBasePA);
         size = VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.compRingSize);
+        if (size > VMXNET3_RC_RING_MAX_SIZE) {
+            size = VMXNET3_RC_RING_MAX_SIZE;
+        }
         vmxnet3_ring_init(d, &s->rxq_descr[i].comp_ring, pa, size,
                           sizeof(struct Vmxnet3_RxCompDesc), true);
         VMW_CFPRN("RXC queue %d: Base: %" PRIx64 ", Size: %d", i, pa, size);
-- 
2.7.4


