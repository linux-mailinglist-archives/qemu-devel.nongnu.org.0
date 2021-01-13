Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DAB2F4235
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 04:04:44 +0100 (CET)
Received: from localhost ([::1]:38486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzWSh-00080K-MA
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 22:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1kzWIG-0005zl-0i
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:53:56 -0500
Received: from mga09.intel.com ([134.134.136.24]:58713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1kzWIC-00043O-1J
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:53:55 -0500
IronPort-SDR: 9ZFJ5NvUNCp4iXFq7TyVUXR6S2HJpyr1cQS9Aj4a7uN9Z26uVsLqwxrP2DcrQ/r9gxDy+CpP9J
 h0B0icNM7FEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="178289701"
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; d="scan'208";a="178289701"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 18:53:49 -0800
IronPort-SDR: dXTGDVXT8h2/SrcPwlVhSX7x6mSGDS39xXxHyTWob/yxtFvXg+m2VIDYmFOOoyVn+kJST4hbPr
 yzxSXtey9scQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; d="scan'208";a="464750370"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2021 18:53:47 -0800
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, dgilbert@redhat.com
Subject: [PATCH 10/10] Fixed calculation error of pkt->header_size in
 fill_pkt_tcp_info()
Date: Wed, 13 Jan 2021 10:46:35 +0800
Message-Id: <1610505995-144129-11-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=134.134.136.24; envelope-from=lei.rao@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


