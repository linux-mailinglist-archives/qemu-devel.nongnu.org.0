Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947A83510BB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:18:34 +0200 (CEST)
Received: from localhost ([::1]:49506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsXB-0003eP-LH
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lRsQ4-0002qQ-7O
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:11:12 -0400
Received: from mga03.intel.com ([134.134.136.65]:13085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lRsQ2-0006A2-4q
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:11:11 -0400
IronPort-SDR: 1Rq5LDy3m4FTe/TGo3YkNE8nTN4v9hDw8J392+yO397aQGhdvUyBwTDiWeBEdqtCn4CFU2CMBM
 q3l1vzMp3LhQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="192205165"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="192205165"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 01:11:09 -0700
IronPort-SDR: 2doqGs0S0Bz9yumlWU2Us7O1sHPAEYqPd00VuYGqb+HrIkKrnAdmW5qxp0EUdesat1aGGIVJzc
 58xsxgnY4ZMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="439119264"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga004.fm.intel.com with ESMTP; 01 Apr 2021 01:11:06 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v5 10/10] Fixed calculation error of pkt->header_size in
 fill_pkt_tcp_info()
Date: Thu,  1 Apr 2021 15:47:29 +0800
Message-Id: <1617263249-54501-11-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
References: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=134.134.136.65; envelope-from=lei.rao@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

The data pointer has skipped vnet_hdr_len in the function of
parse_packet_early().So, we can not subtract vnet_hdr_len again
when calculating pkt->header_size in fill_pkt_tcp_info(). Otherwise,
it will cause network packet comparsion errors and greatly increase
the frequency of checkpoints.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
---
 net/colo-compare.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 5b538f4..b100e7b 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -211,7 +211,7 @@ static void fill_pkt_tcp_info(void *data, uint32_t *max_ack)
     pkt->tcp_ack = ntohl(tcphd->th_ack);
     *max_ack = *max_ack > pkt->tcp_ack ? *max_ack : pkt->tcp_ack;
     pkt->header_size = pkt->transport_header - (uint8_t *)pkt->data
-                       + (tcphd->th_off << 2) - pkt->vnet_hdr_len;
+                       + (tcphd->th_off << 2);
     pkt->payload_size = pkt->size - pkt->header_size;
     pkt->seq_end = pkt->tcp_seq + pkt->payload_size;
     pkt->flags = tcphd->th_flags;
-- 
1.8.3.1


