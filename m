Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D79659BBB5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 10:33:41 +0200 (CEST)
Received: from localhost ([::1]:48534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ2sO-0007cJ-5U
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 04:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oQ2od-00064G-Lu
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 04:29:47 -0400
Received: from mga14.intel.com ([192.55.52.115]:15548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oQ2ob-00016x-0e
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 04:29:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661156985; x=1692692985;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BoohOhQJWtvEeamUp6bgDeIPPzKyW2sMRRdjRHUUIMU=;
 b=V58vNjCfsKXohIsrJQUYVm7ocsgwHIKcF5qCL9+Nvni1qil7oDeaDR28
 0H9bh/Rtcst1OKXaLcCOl9kLwhfDlff3EMCE3FenC+N+WgscxpiXeV5jJ
 I/YZPMiWVJV+0jsFNN0NjCYOvO62v8EVix0EndelplAIO5WPnX4C49EPe
 pUK8rbs28W6ORqnMtGXp+9z4WwPbJMFd5p4g7kYx/aYoDukY5LbcD6SaI
 s1UqYoUDNG8vMNzsQlbU8tr/7+ji7voqki2QcqrQbrmniK5IhS1pNgF2C
 6gSsKaZhrhVYwTxb8WsYat0QMxtdsMbBaOYzjuVtzrMk1FsdK7EhxlEU8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10446"; a="293354318"
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; d="scan'208";a="293354318"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 01:29:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; d="scan'208";a="669433752"
Received: from unknown (HELO localhost.localdomain) ([10.239.161.133])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 01:29:39 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Cc: Zhang Chen <chen.zhang@intel.com>
Subject: [PATCH V5] net/colo.c: Fix the pointer issue reported by Coverity.
Date: Mon, 22 Aug 2022 16:14:36 +0800
Message-Id: <20220822081436.653555-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

When enabled the virtio-net-pci, guest network packet will
load the vnet_hdr. In COLO status, the primary VM's network
packet maybe redirect to another VM, it needs filter-redirect
enable the vnet_hdr flag at the same time, COLO-proxy will
correctly parse the original network packet. If have any
misconfiguration here, the vnet_hdr_len is wrong for parse
the packet, the data+offset will point to wrong place.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo.c       | 25 ++++++++++++++++---------
 net/colo.h       |  1 +
 net/trace-events |  2 +-
 3 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/net/colo.c b/net/colo.c
index 6b0ff562ad..fb2c36a026 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -44,21 +44,28 @@ int parse_packet_early(Packet *pkt)
 {
     int network_length;
     static const uint8_t vlan[] = {0x81, 0x00};
-    uint8_t *data = pkt->data + pkt->vnet_hdr_len;
+    uint8_t *data = pkt->data;
     uint16_t l3_proto;
     ssize_t l2hdr_len;
 
-    if (data == NULL) {
-        trace_colo_proxy_main_vnet_info("This packet is not parsed correctly, "
-                                        "pkt->vnet_hdr_len", pkt->vnet_hdr_len);
+    assert(data);
+
+    /* Check the received vnet_hdr_len then add the offset */
+    if ((pkt->vnet_hdr_len > sizeof(struct virtio_net_hdr_v1_hash)) ||
+        (pkt->size < sizeof(struct eth_header) + sizeof(struct vlan_header) +
+        pkt->vnet_hdr_len)) {
+        /*
+         * The received remote packet maybe misconfiguration here,
+         * Please enable/disable filter module's the vnet_hdr flag at
+         * the same time.
+         */
+        trace_colo_proxy_main_vnet_info("This received packet load wrong ",
+                                        pkt->vnet_hdr_len, pkt->size);
         return 1;
     }
-    l2hdr_len = eth_get_l2_hdr_length(data);
+    data += pkt->vnet_hdr_len;
 
-    if (pkt->size < ETH_HLEN + pkt->vnet_hdr_len) {
-        trace_colo_proxy_main("pkt->size < ETH_HLEN");
-        return 1;
-    }
+    l2hdr_len = eth_get_l2_hdr_length(data);
 
     /*
      * TODO: support vlan.
diff --git a/net/colo.h b/net/colo.h
index 8b3e8d5a83..22fc3031f7 100644
--- a/net/colo.h
+++ b/net/colo.h
@@ -18,6 +18,7 @@
 #include "qemu/jhash.h"
 #include "qemu/timer.h"
 #include "net/eth.h"
+#include "standard-headers/linux/virtio_net.h"
 
 #define HASHTABLE_MAX_SIZE 16384
 
diff --git a/net/trace-events b/net/trace-events
index 6af927b4b9..823a071bdc 100644
--- a/net/trace-events
+++ b/net/trace-events
@@ -9,7 +9,7 @@ vhost_user_event(const char *chr, int event) "chr: %s got event: %d"
 
 # colo.c
 colo_proxy_main(const char *chr) ": %s"
-colo_proxy_main_vnet_info(const char *sta, int size) ": %s = %d"
+colo_proxy_main_vnet_info(const char *sta, uint32_t vnet_hdr, int size) ": %s pkt->vnet_hdr_len = %u, pkt->size = %d"
 
 # colo-compare.c
 colo_compare_main(const char *chr) ": %s"
-- 
2.25.1


