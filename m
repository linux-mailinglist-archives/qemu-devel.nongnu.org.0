Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529D557B3B3
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 11:23:18 +0200 (CEST)
Received: from localhost ([::1]:58318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE5vJ-0000ox-EH
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 05:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5dO-0000xW-IL
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:04:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5dK-0001YH-PE
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658307882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z8850xtzTkB/9nDlh2gEaq+QsEQKJh2EDDPTSePnvFM=;
 b=IjwWaSViE6bEtgq8WUNclBEvTwInABwIGEjJx796vD5EU1x7mnDqBcVFyQBOWSoU77JyhI
 IEyxZ2L9mCink1hnfv0OXa8Ey/dPBHxKFSfEMwDmz9RtiKHqwO8K/1+8TKZ+0/pQaCUAEB
 n6pbXo3du1PBJj6iBAhViwnSoUpQhvA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-vqpv4DBIPISNTnatWq81JQ-1; Wed, 20 Jul 2022 05:04:37 -0400
X-MC-Unique: vqpv4DBIPISNTnatWq81JQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3E9B3C1C0C7;
 Wed, 20 Jul 2022 09:04:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-110.pek2.redhat.com
 [10.72.13.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37A55492C3B;
 Wed, 20 Jul 2022 09:04:33 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Zhang Chen <chen.zhang@intel.com>, Tao Xu <tao3.xu@intel.com>,
 Li Zhijian <lizhijian@fujitsu.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 25/25] net/colo.c: fix segmentation fault when packet is not
 parsed correctly
Date: Wed, 20 Jul 2022 17:03:13 +0800
Message-Id: <20220720090313.55169-26-jasowang@redhat.com>
In-Reply-To: <20220720090313.55169-1-jasowang@redhat.com>
References: <20220720090313.55169-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

When COLO use only one vnet_hdr_support parameter between
filter-redirector and filter-mirror(or colo-compare), COLO will crash
with segmentation fault. Back track as follow:

Thread 1 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
0x0000555555cb200b in eth_get_l2_hdr_length (p=0x0)
    at /home/tao/project/COLO/colo-qemu/include/net/eth.h:296
296         uint16_t proto = be16_to_cpu(PKT_GET_ETH_HDR(p)->h_proto);
(gdb) bt
0  0x0000555555cb200b in eth_get_l2_hdr_length (p=0x0)
    at /home/tao/project/COLO/colo-qemu/include/net/eth.h:296
1  0x0000555555cb22b4 in parse_packet_early (pkt=0x555556a44840) at
net/colo.c:49
2  0x0000555555cb2b91 in is_tcp_packet (pkt=0x555556a44840) at
net/filter-rewriter.c:63

So wrong vnet_hdr_len will cause pkt->data become NULL. Add check to
raise error and add trace-events to track vnet_hdr_len.

Signed-off-by: Tao Xu <tao3.xu@intel.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/colo.c       | 9 ++++++++-
 net/trace-events | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/net/colo.c b/net/colo.c
index 694f3c9..6b0ff56 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -46,7 +46,14 @@ int parse_packet_early(Packet *pkt)
     static const uint8_t vlan[] = {0x81, 0x00};
     uint8_t *data = pkt->data + pkt->vnet_hdr_len;
     uint16_t l3_proto;
-    ssize_t l2hdr_len = eth_get_l2_hdr_length(data);
+    ssize_t l2hdr_len;
+
+    if (data == NULL) {
+        trace_colo_proxy_main_vnet_info("This packet is not parsed correctly, "
+                                        "pkt->vnet_hdr_len", pkt->vnet_hdr_len);
+        return 1;
+    }
+    l2hdr_len = eth_get_l2_hdr_length(data);
 
     if (pkt->size < ETH_HLEN + pkt->vnet_hdr_len) {
         trace_colo_proxy_main("pkt->size < ETH_HLEN");
diff --git a/net/trace-events b/net/trace-events
index d7a1725..6af927b 100644
--- a/net/trace-events
+++ b/net/trace-events
@@ -9,6 +9,7 @@ vhost_user_event(const char *chr, int event) "chr: %s got event: %d"
 
 # colo.c
 colo_proxy_main(const char *chr) ": %s"
+colo_proxy_main_vnet_info(const char *sta, int size) ": %s = %d"
 
 # colo-compare.c
 colo_compare_main(const char *chr) ": %s"
-- 
2.7.4


