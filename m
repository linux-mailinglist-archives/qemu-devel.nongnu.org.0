Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0486258A98B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:41:13 +0200 (CEST)
Received: from localhost ([::1]:60272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJulS-00026M-JS
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oJu0m-0006GG-Dr
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:52:56 -0400
Received: from mga05.intel.com ([192.55.52.43]:30446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oJu0k-0003fi-2o
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659693174; x=1691229174;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VOPE7NNTqzl48Cj4IY6PH5/D0uhul2nS/7oloaS2Qxg=;
 b=fQGAD3Hrop5N0A+AaL11EJCsOtOt59GfQeUZ+M1kF5r6kV98LAU7JRnM
 7E1uYWHsj7lliCfIuBw2NWQH6vHMu/RMeDYH+zA6qOernW5x+7D4TLret
 aAhF5eVA/7aR3LW7wdtIPbz3h5Hbdx3PV/BPJCh+T+hDZE96An7Jg4zY5
 4FMc+uKJZfwhasmPT836E9VF293ovjPcb6M7a+WN7rJG3pMe77GyD/nMw
 d7nGrl+5IOuQCJ9Yi3Sgbc/jKxgYXtwi48YTDvwuyJBsLtjvx0E5HY2dz
 H4V5ngFND+5UOyZWpwp8yWRYMKKuGMx6Rbrbe+b3FpdJfiLFrklSeiTO1 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="376463084"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="376463084"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 02:52:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="931176210"
Received: from tkid-nvme.sh.intel.com ([10.239.161.133])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 02:52:50 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Cc: Zhang Chen <chen.zhang@intel.com>
Subject: [PATCH V2] net/colo.c: Fix the pointer issuse reported by Coverity.
Date: Fri,  5 Aug 2022 17:38:13 +0800
Message-Id: <20220805093813.119839-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 net/colo.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/net/colo.c b/net/colo.c
index 6b0ff562ad..524afa3d9b 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -44,21 +44,22 @@ int parse_packet_early(Packet *pkt)
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
+    if (pkt->size < sizeof(struct eth_header) + sizeof(struct vlan_header)
+        + pkt->vnet_hdr_len) {
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
-- 
2.25.1


