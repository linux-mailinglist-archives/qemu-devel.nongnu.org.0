Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502165879A7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:10:59 +0200 (CEST)
Received: from localhost ([::1]:47084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oInvW-0007tk-BG
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oInCd-0001Go-PQ
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 04:24:37 -0400
Received: from mga12.intel.com ([192.55.52.136]:63428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oInCb-0003oX-GZ
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 04:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659428673; x=1690964673;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PR/iLiG5E9mmVeR1yonIRLQ4DUo8P/RdY6SC8WiegCY=;
 b=ZE7g95tXsV8QeLxqW8dTwP+FVK1BNfZ6NAB5AgZkDtTAOa28V688lfQR
 uHxTbk38m3LGEw/x6fvdMvQcJh0j4onB4Pr8A5QrTrACS3A7AlAi0Skye
 ei+PmxRVxkQ0PklHprQP476ZW2e8j9hGbjTU8HfnWNP2ETlkPB7Q/ALVw
 PuBgoGiGXqy4NJWJxwdEUTKdRyvmFQuKAembb0GwAcMJ3oh3EEY4L/f2l
 jwTDosV7Sk6NhW2qaEKYUEknaEhRuPkykoGOPNPXsqT6Ho318FZK2whC2
 zz0CPQjGVAoiarmpg7mUhm5gZyd6VszVX0nKCNwblRLT4Cdtf4UPhmNie w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="269122783"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="269122783"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 01:24:26 -0700
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="661527252"
Received: from tkid-nvme.sh.intel.com ([10.239.161.133])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 01:24:24 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Cc: Zhang Chen <chen.zhang@intel.com>
Subject: [PATCH] net/colo.c: Fix the pointer issuse reported by Coverity.
Date: Tue,  2 Aug 2022 16:09:48 +0800
Message-Id: <20220802080948.37426-1-chen.zhang@intel.com>
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

When enable the virtio-net-pci, guest network packet will
load the vnet_hdr. In COLO status, the primary VM's network
packet maybe redirect to another VM, it need filter-redirect
enable the vnet_hdr flag at the same time, COLO-proxy will
correctly parse the original network packet. If have any
misconfiguration here, the vnet_hdr_len is wrong for parse
the packet, the data+offset will point to wrong place.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/net/colo.c b/net/colo.c
index 6b0ff562ad..dfb15b4c14 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -44,21 +44,25 @@ int parse_packet_early(Packet *pkt)
 {
     int network_length;
     static const uint8_t vlan[] = {0x81, 0x00};
-    uint8_t *data = pkt->data + pkt->vnet_hdr_len;
+    uint8_t *data = pkt->data;
     uint16_t l3_proto;
     ssize_t l2hdr_len;
 
     if (data == NULL) {
-        trace_colo_proxy_main_vnet_info("This packet is not parsed correctly, "
-                                        "pkt->vnet_hdr_len", pkt->vnet_hdr_len);
+        trace_colo_proxy_main("COLO-proxy got NULL data packet ");
         return 1;
     }
-    l2hdr_len = eth_get_l2_hdr_length(data);
 
-    if (pkt->size < ETH_HLEN + pkt->vnet_hdr_len) {
-        trace_colo_proxy_main("pkt->size < ETH_HLEN");
+    /* Check the received vnet_hdr_len then add the offset */
+    if (pkt->size < sizeof(struct eth_header) + sizeof(struct vlan_header)
+        + pkt->vnet_hdr_len) {
+        trace_colo_proxy_main_vnet_info("This packet may be load wrong "
+                                        "pkt->vnet_hdr_len", pkt->vnet_hdr_len);
         return 1;
     }
+    data += pkt->vnet_hdr_len;
+
+    l2hdr_len = eth_get_l2_hdr_length(data);
 
     /*
      * TODO: support vlan.
-- 
2.25.1


