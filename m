Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A346B3ADE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 10:40:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZBd-0006Hs-QU; Fri, 10 Mar 2023 04:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZBa-000647-Fo
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:37:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZBY-0008V0-UY
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678441028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tE52FogAFVmi4deLemjLw0Ed8zycs5PhhGPS1DFzV1k=;
 b=BV//CPG/C9D40rzSMBdEocjEOxOhHZiVlsDorPkiRFieOhBnGQDKUngiD9CR18YtksH9SG
 NsRvipfdsrfrInuGa8M9JatkaCK+Vw6f9npoWpQ8ZJ322BBFTQMEoW0Nylh3FuoThlOPxr
 44S/ngqEEmUF58stw3yenz0pRu4wj2g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-Gge4kl2UPMG_d_wjERE5Iw-1; Fri, 10 Mar 2023 04:36:57 -0500
X-MC-Unique: Gge4kl2UPMG_d_wjERE5Iw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C36DD18ABF87;
 Fri, 10 Mar 2023 09:36:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-41.pek2.redhat.com [10.72.12.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DADDF40C1106;
 Fri, 10 Mar 2023 09:36:54 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 32/44] e1000e: Count CRC in Tx statistics
Date: Fri, 10 Mar 2023 17:35:14 +0800
Message-Id: <20230310093526.30828-33-jasowang@redhat.com>
In-Reply-To: <20230310093526.30828-1-jasowang@redhat.com>
References: <20230310093526.30828-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

The datasheet 8.19.29 "Good Packets Transmitted Count - GPTC (0x04080;
RC)" says:
> This register counts the number of good (no errors) packets
> transmitted. A good transmit packet is considered one that is 64 or
> more bytes in length (from <Destination Address> through <CRC>,
> inclusively) in length.

It also says similar for the other Tx statistics registers. Add the
number of bytes for CRC to those registers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 4fec6df..326b9a1 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -691,7 +691,7 @@ e1000e_on_tx_done_update_stats(E1000ECore *core, struct NetTxPkt *tx_pkt)
     static const int PTCregs[6] = { PTC64, PTC127, PTC255, PTC511,
                                     PTC1023, PTC1522 };
 
-    size_t tot_len = net_tx_pkt_get_total_len(tx_pkt);
+    size_t tot_len = net_tx_pkt_get_total_len(tx_pkt) + 4;
 
     e1000x_increase_size_stats(core->mac, PTCregs, tot_len);
     e1000x_inc_reg_if_not_full(core->mac, TPT);
-- 
2.7.4


