Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24A5338562
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 06:32:36 +0100 (CET)
Received: from localhost ([::1]:51946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKaPb-0005Eo-S6
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 00:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKaJK-0005r5-Ga
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 00:26:06 -0500
Received: from mga18.intel.com ([134.134.136.126]:29334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKaJH-0007Eb-HJ
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 00:26:06 -0500
IronPort-SDR: Br/Nm4o6IVlfFhoqRO8baOQHdX7dtVcVI5NYRUJomPwXfeNVD+vqwF7OL1aVkVoPkH9aNBQgnQ
 7E2ew9e6tx9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="176376604"
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; d="scan'208";a="176376604"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 21:25:51 -0800
IronPort-SDR: 2EJ2iB4TSH/50psFQHh+qodQzLwwfUY3ddhgYZDy33MU8yUehgq5GiCBVQbQjiJhdNMdm3mXdm
 BnICA5fc10Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; d="scan'208";a="600481995"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga006.fm.intel.com with ESMTP; 11 Mar 2021 21:25:47 -0800
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v2 10/10] Fixed calculation error of pkt->header_size in
 fill_pkt_tcp_info()
Date: Fri, 12 Mar 2021 13:03:03 +0800
Message-Id: <1615525383-59071-11-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
References: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=134.134.136.126; envelope-from=lei.rao@intel.com;
 helo=mga18.intel.com
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
---
 net/colo-compare.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 06f2c28..af30490 100644
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


