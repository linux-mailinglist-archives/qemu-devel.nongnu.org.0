Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E8E39F118
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 10:39:25 +0200 (CEST)
Received: from localhost ([::1]:47282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqXGe-0001zr-NQ
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 04:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lqX8Z-00042W-PC
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:31:11 -0400
Received: from mga14.intel.com ([192.55.52.115]:24324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lqX8X-0000K7-Ti
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:31:03 -0400
IronPort-SDR: fucIQFc80KW4HIp22M+aQo6Fje3395JDbATyRTBIkxx9/Ho4ixAyTHVM8YHO1e+V1tzKVQTmpu
 JONyiFDdIv4A==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204614549"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="204614549"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:30:55 -0700
IronPort-SDR: 0WY5fKPPMLUwjepzoqv80+oOuwgL7mzho/uUYxnf4I/Kh+yDBZIklg3Shh8s2ne1+sr8KBmuzO
 OmF+7TvEy5dw==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="481862959"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:30:52 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH 7/7] Fixed calculation error of pkt->header_size in
 fill_pkt_tcp_info()
Date: Tue,  8 Jun 2021 16:23:31 +0800
Message-Id: <20210608082331.1949117-8-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608082331.1949117-1-chen.zhang@intel.com>
References: <20210608082331.1949117-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 "Rao, Lei" <lei.rao@intel.com>, Li Zhijian <lizhijian@fujitsu.com>,
 Zhang Chen <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
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
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Lukas Straub <lukasstraub2@web.de>
---
 net/colo-compare.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 5b538f4e0b..b100e7b51f 100644
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
2.25.1


