Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B11158D5F1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 11:03:26 +0200 (CEST)
Received: from localhost ([::1]:44328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLL92-0005og-Og
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 05:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oLL5N-0003oP-SV
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:59:37 -0400
Received: from mga12.intel.com ([192.55.52.136]:42147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oLL5J-0003sm-LZ
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660035573; x=1691571573;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rfpgcc6yi6wbSw4kL/lv0dleWfbcK7oeJbgKnkViI5o=;
 b=Si6jo1u8EeUSMz4AM8qgmj1sakU7gCP/Oi4LmHUARjNyEq2+h7jK08sZ
 17vIXIUblILXFHZ3fkck9PDQvDZren4W2MtDX1Q6IBELIL1XnSFrlJo6t
 t69/bOyi3xu3mN4GZcWdv+jIxbPWvrbOqyZHrhz6bq5VzbA5uce2jp8dj
 HhEvaRfOBdYoPCLmbW+JMtBrvbfXefJZKyrrTW4cfzAgz/TuCQHy2IHtn
 y3YkUve+SsmslAWFOoqY+4VKnAp/pJAN7yCZUBMkrGfbR21w7EyBNyEls
 RW0s4TRbTTF6msTu4Hyd3FvKp0mYBVQYEDrLTlQ8s+MQ3EbbQqA1jQMlQ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="270565066"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="270565066"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 01:59:26 -0700
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="633257587"
Received: from tkid-nvme.sh.intel.com ([10.239.161.133])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 01:59:25 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Cc: Zhang Chen <chen.zhang@intel.com>
Subject: [PATCH V4] net/colo.c: Fix the pointer issue reported by Coverity.
Date: Tue,  9 Aug 2022 16:44:37 +0800
Message-Id: <20220809084437.216420-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chen.zhang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
packet maybe redirect to another VM, it need filter-redirect
enable the vnet_hdr flag at the same time, COLO-proxy will
correctly parse the original network packet. If have any
misconfiguration here, the vnet_hdr_len is wrong for parse
the packet, the data+offset will point to wrong place.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo.c | 18 ++++++++++--------
 net/colo.h |  1 +
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/net/colo.c b/net/colo.c
index 6b0ff562ad..6930a2f4f6 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -44,21 +44,23 @@ int parse_packet_early(Packet *pkt)
 {
     int network_length;
     static const uint8_t vlan[] = {0x81, 0x00};
-    uint8_t *data = pkt->data + pkt->vnet_hdr_len;
+    uint8_t *data = pkt->data;
     uint16_t l3_proto;
     ssize_t l2hdr_len;
 
-    if (data == NULL) {
-        trace_colo_proxy_main_vnet_info("This packet is not parsed correctly, "
+    assert(data);
+
+    /* Check the received vnet_hdr_len then add the offset */
+    if ((pkt->vnet_hdr_len > sizeof(sizeof(struct virtio_net_hdr_v1_hash))) ||
+        (pkt->size < sizeof(struct eth_header) + sizeof(struct vlan_header)
+        + pkt->vnet_hdr_len)) {
+        trace_colo_proxy_main_vnet_info("This packet may be load wrong "
                                         "pkt->vnet_hdr_len", pkt->vnet_hdr_len);
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
 
-- 
2.25.1


