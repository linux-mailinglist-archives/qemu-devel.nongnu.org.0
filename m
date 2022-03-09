Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16A24D2B00
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 09:54:36 +0100 (CET)
Received: from localhost ([::1]:40900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRs5c-0004U0-0X
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 03:54:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nRs2S-0001hG-BQ
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:51:20 -0500
Received: from mga17.intel.com ([192.55.52.151]:27159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nRs2Q-0000YT-8K
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:51:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646815878; x=1678351878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xmpZrrHqbl8ZpfhrrCHPXKP4NwmFJQ0+6oDR/IRPkT0=;
 b=OPDzdmmQfr+BX+TBd8XZppRffmOwGiE8IQvaxXYyl3Ub3abz7tmjXpDG
 Ivfak2q558v4qIZDX5uk/W6zJB9T78A9KpR7inJAi3LKgOgIMm2wG0KSb
 QD74lA8bh/t+X7DRN68VuJrojZi0J9ut05W+wFpJ+0z8FWMyS/BdnfAPu
 TVrIsnMH9siIRQB2slZJg7qvTmfoXyIkNT58tn4H8+inXruUpyJgnPUNB
 MwESuqp6O9fpyiiH8be0yf7dFwm/TrqPkASr362QYRLemZxpQmoCPhCX5
 H1dROPkIqA+Q2nyX8FoRVARYxfs0KYO9lklIylvYKh2hK1zp0KmpKsvGA A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="235532282"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="235532282"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 00:51:17 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="554030869"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 00:51:16 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH 4/4] net/colo.c: fix segmentation fault when packet is not
 parsed correctly
Date: Wed,  9 Mar 2022 16:38:58 +0800
Message-Id: <20220309083858.58117-5-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220309083858.58117-1-chen.zhang@intel.com>
References: <20220309083858.58117-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chen.zhang@intel.com;
 helo=mga17.intel.com
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
Cc: Zhang Chen <chen.zhang@intel.com>, Tao Xu <tao3.xu@intel.com>,
 qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 net/colo.c       | 9 ++++++++-
 net/trace-events | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/net/colo.c b/net/colo.c
index 694f3c93ef..6b0ff562ad 100644
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
index d7a17256cc..6af927b4b9 100644
--- a/net/trace-events
+++ b/net/trace-events
@@ -9,6 +9,7 @@ vhost_user_event(const char *chr, int event) "chr: %s got event: %d"
 
 # colo.c
 colo_proxy_main(const char *chr) ": %s"
+colo_proxy_main_vnet_info(const char *sta, int size) ": %s = %d"
 
 # colo-compare.c
 colo_compare_main(const char *chr) ": %s"
-- 
2.25.1


