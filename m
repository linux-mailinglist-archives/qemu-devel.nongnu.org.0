Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868D2229435
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 11:00:01 +0200 (CEST)
Received: from localhost ([::1]:42498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyAbY-0007bK-Km
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 05:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jyAa8-0006PA-Na
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 04:58:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20601
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jyAa4-0002TK-O7
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 04:58:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595408307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t7OAJHVFFI0NnKPP6LGSuhvnyc8Y6OUAOpILOntCGBM=;
 b=O9V5Iu4yFrfAKxdoD6wF56ZkrghNg00fD8V9bbA/Qg90aoffy++2h6/GFWMCzZvaMupnDl
 aea7TAJLWlWwRdq59GZ/nXAwHlB9UvfGxIBYWwYl/CsQoILjtjGGLHh1Iiy9Z7emyr5f2Y
 x8qJnra/z3nIXt6GmxGGcxCC4RsofTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-W0tu3DutNYyqDg6PG8vvZA-1; Wed, 22 Jul 2020 04:58:25 -0400
X-MC-Unique: W0tu3DutNYyqDg6PG8vvZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CE06800C64;
 Wed, 22 Jul 2020 08:58:24 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-156.pek2.redhat.com [10.72.13.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFA635D9DC;
 Wed, 22 Jul 2020 08:58:16 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] e1000e: make TX reentrant
Date: Wed, 22 Jul 2020 16:57:47 +0800
Message-Id: <20200722085747.6514-2-jasowang@redhat.com>
In-Reply-To: <20200722085747.6514-1-jasowang@redhat.com>
References: <20200722085747.6514-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 23:27:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: dmitry.fleytman@gmail.com, mst@redhat.com, liq3ea@163.com, liq3ea@gmail.com,
 alxndr@bu.edu, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In loopback mode, e1000e RX can DMA into TX doorbell which requires
TX to be reentrant. This patch make e1000e's TX routine reentrant by
introducing a per device boolean for recording whether or not a TX
rountine is being called and return early.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e_core.c | 8 ++++++++
 hw/net/e1000e_core.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index bcd186cac5..8126a644a5 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -923,6 +923,12 @@ e1000e_start_xmit(E1000ECore *core, const E1000E_TxRing *txr)
         return;
     }
 
+    if (core->sending) {
+        return;
+    }
+
+    core->sending = true;
+
     while (!e1000e_ring_empty(core, txi)) {
         base = e1000e_ring_head_descr(core, txi);
 
@@ -940,6 +946,8 @@ e1000e_start_xmit(E1000ECore *core, const E1000E_TxRing *txr)
     if (!ide || !e1000e_intrmgr_delay_tx_causes(core, &cause)) {
         e1000e_set_interrupt_cause(core, cause);
     }
+
+    core->sending = false;
 }
 
 static bool
diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
index aee32f7e48..4679c1761f 100644
--- a/hw/net/e1000e_core.h
+++ b/hw/net/e1000e_core.h
@@ -114,6 +114,7 @@ struct E1000Core {
     void (*owner_start_recv)(PCIDevice *d);
 
     uint32_t msi_causes_pending;
+    bool sending;
 };
 
 void
-- 
2.20.1


