Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5027558D23B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 05:06:29 +0200 (CEST)
Received: from localhost ([::1]:47070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLFZc-0005pg-7j
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 23:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oLFY8-0004Pw-P9
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 23:04:56 -0400
Received: from mga09.intel.com ([134.134.136.24]:4959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oLFY6-0003K1-Pp
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 23:04:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660014294; x=1691550294;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6uqa17bYGyC6I6yUZY2ud/MvViUBqbQ9/85ZOutxv7I=;
 b=jc8LIbR+o/UHZyEuPvehXQ2kANdCRdOV5c0bvmDtsmEXFfV7tCLXUoFB
 e4JCM7Hiq/gWh05uY2jN6SqINiReLvDRQRy+SJHSNbrj55I3i1iYE9zbZ
 nPLlRvm9IxjGg7fuDNUGRt4BF9U3M492w4hbKH45zOuyT9vhKka/E2NNQ
 861rMTQ/aJ/gOLtPdHbJrEsaii7WzBnq3UvlgbKYs/5rc00xkxTLXhSEQ
 MRYXSEoL2hCTVMuYvbnMqF/34rzXhGrnNiGDk0433zFlgYdnoe9UAlPDI
 TwD14DzpgfmO2f+A6g5OngLRziSxay7GvyZyOi8WR/xVaMucHInpZ6iIK w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="291528135"
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; d="scan'208";a="291528135"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 20:04:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; d="scan'208";a="601310793"
Received: from tkid-nvme.sh.intel.com ([10.239.161.133])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 20:04:51 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Cc: Zhang Chen <chen.zhang@intel.com>
Subject: [PATCH V3] net/colo.c: Fix the pointer issue reported by Coverity.
Date: Tue,  9 Aug 2022 10:50:10 +0800
Message-Id: <20220809025010.200289-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=chen.zhang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

When enable the virtio-net-pci, guest network packet will
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
index 6b0ff562ad..4f1b4a61f6 100644
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
+    if ((pkt->vnet_hdr_len > sizeof(struct virtio_net_hdr)) ||
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


