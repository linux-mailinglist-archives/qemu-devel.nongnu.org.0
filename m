Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77B56AD829
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:15:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRSl-0002Qi-En; Tue, 07 Mar 2023 02:10:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRSh-0002AS-0q
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:10:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRSe-0005jk-J2
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678173010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YgZsjuKz/evgU7QNNHRJ0vQsaN+Tm2TmejOXBdO++Mo=;
 b=OwfVeCWbdwlXFOH9AF6pX/tX3Rib4veW+i4ObdvZzi0Wv/blesTOHcuNLO92TR4u/Cukho
 V0wi1uwN37C8NinexKzdoMfoFZwHg/LSXrm8gacKX04jSOXYK5Bvwysssx932iEHJF1bAY
 woMNpKkRclpyp4q8b/IruTAE5X/FSa8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392--ipe7e0DNni7lYWFlegChg-1; Tue, 07 Mar 2023 02:10:08 -0500
X-MC-Unique: -ipe7e0DNni7lYWFlegChg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A89386C167;
 Tue,  7 Mar 2023 07:10:08 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F91240C10FA;
 Tue,  7 Mar 2023 07:10:06 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 26/51] hw/net/net_tx_pkt: Check the payload length
Date: Tue,  7 Mar 2023 15:07:51 +0800
Message-Id: <20230307070816.34833-27-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
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

Check the payload length if checksumming to ensure the payload contains
the space for the resulting value.

This bug was found by Alexander Bulekov with the fuzzer:
https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/

The fixed test case is:
fuzz/crash_6aeaa33e7211ecd603726c53e834df4c6d1e08bc

Fixes: e263cd49c7 ("Packet abstraction for VMWARE network devices")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/net_tx_pkt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index 4a35e84..986a3ad 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -342,11 +342,17 @@ bool net_tx_pkt_build_vheader(struct NetTxPkt *pkt, bool tso_enable,
     if (csum_enable) {
         switch (pkt->l4proto) {
         case IP_PROTO_TCP:
+            if (pkt->payload_len < sizeof(struct tcp_hdr)) {
+                return false;
+            }
             pkt->virt_hdr.flags = VIRTIO_NET_HDR_F_NEEDS_CSUM;
             pkt->virt_hdr.csum_start = pkt->hdr_len;
             pkt->virt_hdr.csum_offset = offsetof(struct tcp_hdr, th_sum);
             break;
         case IP_PROTO_UDP:
+            if (pkt->payload_len < sizeof(struct udp_hdr)) {
+                return false;
+            }
             pkt->virt_hdr.flags = VIRTIO_NET_HDR_F_NEEDS_CSUM;
             pkt->virt_hdr.csum_start = pkt->hdr_len;
             pkt->virt_hdr.csum_offset = offsetof(struct udp_hdr, uh_sum);
-- 
2.7.4


