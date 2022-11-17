Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FD362E255
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 17:57:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oviBQ-0005pd-Bb; Thu, 17 Nov 2022 11:56:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oviBO-0005oN-Em
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:56:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oviBN-0007m0-2H
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:56:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668704168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DvJ4lkdX+wmID6ozOrP92erLwYqSbxWQcDGOd3PHcUU=;
 b=KTMX5UKU84Q2kbGRCm1Odm9lkxOMZNZjzowRJNGoaTKkI3v/VleXpBQHJkF10SyqSr60cR
 gurQVm5WVp8nrMQNuyYsDo8Qq0qr887hzWrmb0vySda4/1OvqPGsSfJN0rKxMJqjNc/whf
 tCgmY5pzUI60KkEyTRKLtJtqdCfhSj0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104--kvRigWZP_GBrk0OOebSOQ-1; Thu, 17 Nov 2022 11:56:03 -0500
X-MC-Unique: -kvRigWZP_GBrk0OOebSOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D311857F92;
 Thu, 17 Nov 2022 16:56:03 +0000 (UTC)
Received: from localhost (unknown [10.39.193.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA90EC1E88E;
 Thu, 17 Nov 2022 16:56:02 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tobias Fiebig <tobias+git@fiebig.nl>, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH for-7.2 v3 1/3] rtl8139: avoid clobbering tx descriptor bits
Date: Thu, 17 Nov 2022 11:55:52 -0500
Message-Id: <20221117165554.1773409-2-stefanha@redhat.com>
In-Reply-To: <20221117165554.1773409-1-stefanha@redhat.com>
References: <20221117165554.1773409-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The device turns the Tx Descriptor into a Tx Status descriptor after
fully reading the descriptor. This involves clearing Tx Own (bit 31) to
indicate that the driver has ownership of the descriptor again as well
as several other bits.

The code keeps the first dword of the Tx Descriptor in the txdw0 local
variable. txdw0 is reused to build the first word of the Tx Status
descriptor. Later on the code uses txdw0 again, incorrectly assuming
that it still contains the first dword of the Tx Descriptor. The tx
offloading code misbehaves because it sees bogus bits in txdw0.

Use a separate local variable for Tx Status and preserve Tx Descriptor
in txdw0.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/net/rtl8139.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index e6643e3c9d..ffef3789b5 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -2027,18 +2027,21 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
             s->currCPlusTxDesc = 0;
     }
 
+    /* Build the Tx Status Descriptor */
+    uint32_t tx_status = txdw0;
+
     /* transfer ownership to target */
-    txdw0 &= ~CP_TX_OWN;
+    tx_status &= ~CP_TX_OWN;
 
     /* reset error indicator bits */
-    txdw0 &= ~CP_TX_STATUS_UNF;
-    txdw0 &= ~CP_TX_STATUS_TES;
-    txdw0 &= ~CP_TX_STATUS_OWC;
-    txdw0 &= ~CP_TX_STATUS_LNKF;
-    txdw0 &= ~CP_TX_STATUS_EXC;
+    tx_status &= ~CP_TX_STATUS_UNF;
+    tx_status &= ~CP_TX_STATUS_TES;
+    tx_status &= ~CP_TX_STATUS_OWC;
+    tx_status &= ~CP_TX_STATUS_LNKF;
+    tx_status &= ~CP_TX_STATUS_EXC;
 
     /* update ring data */
-    val = cpu_to_le32(txdw0);
+    val = cpu_to_le32(tx_status);
     pci_dma_write(d, cplus_tx_ring_desc, (uint8_t *)&val, 4);
 
     /* Now decide if descriptor being processed is holding the last segment of packet */
-- 
2.38.1


