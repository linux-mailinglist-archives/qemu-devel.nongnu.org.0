Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4336B3AE1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 10:40:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZBP-00056u-4c; Fri, 10 Mar 2023 04:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZBM-0004y3-4c
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:37:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZBK-0008Th-Md
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:36:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678441018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rYYum6ZqysMGa0AiVahtFh0aBNluVLli0qRQdGYMc1Q=;
 b=iIhfE8RxD0TrKrslCuO5ht2aJJYsjlaG4ZRsuK4/RLkGSIURHsH/tr0ENqp13USxqq6O9U
 hzXY6ll2kc/IjPUpW2sJTMncQvRu2RGrZEFHO1+mvQWXI7VJviof2U5XhNxdGsmtb/LSPQ
 ihK3jI9s5fOiZE8N4DgYMnRM9TCqN48=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-Pp_NHmPuOkKJqcHHT5M5Qg-1; Fri, 10 Mar 2023 04:36:54 -0500
X-MC-Unique: Pp_NHmPuOkKJqcHHT5M5Qg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4161F101A52E;
 Fri, 10 Mar 2023 09:36:54 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-41.pek2.redhat.com [10.72.12.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59DA7410B1ED;
 Fri, 10 Mar 2023 09:36:52 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 31/44] e1000: Count CRC in Tx statistics
Date: Fri, 10 Mar 2023 17:35:13 +0800
Message-Id: <20230310093526.30828-32-jasowang@redhat.com>
In-Reply-To: <20230310093526.30828-1-jasowang@redhat.com>
References: <20230310093526.30828-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

The Software Developer's Manual 13.7.4.5 "Packets Transmitted (64 Bytes)
Count" says:
> This register counts the number of packets transmitted that are
> exactly 64 bytes (from <Destination Address> through <CRC>,
> inclusively) in length.

It also says similar for the other Tx statistics registers. Add the
number of bytes for CRC to those registers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index c81d914..c830798 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -571,7 +571,7 @@ e1000_send_packet(E1000State *s, const uint8_t *buf, int size)
         qemu_send_packet(nc, buf, size);
     }
     inc_tx_bcast_or_mcast_count(s, buf);
-    e1000x_increase_size_stats(s->mac_reg, PTCregs, size);
+    e1000x_increase_size_stats(s->mac_reg, PTCregs, size + 4);
 }
 
 static void
@@ -635,7 +635,7 @@ xmit_seg(E1000State *s)
     }
 
     e1000x_inc_reg_if_not_full(s->mac_reg, TPT);
-    e1000x_grow_8reg_if_not_full(s->mac_reg, TOTL, s->tx.size);
+    e1000x_grow_8reg_if_not_full(s->mac_reg, TOTL, s->tx.size + 4);
     s->mac_reg[GPTC] = s->mac_reg[TPT];
     s->mac_reg[GOTCL] = s->mac_reg[TOTL];
     s->mac_reg[GOTCH] = s->mac_reg[TOTH];
-- 
2.7.4


