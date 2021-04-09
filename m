Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D23359367
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 05:50:20 +0200 (CEST)
Received: from localhost ([::1]:57686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUi9z-00043s-EG
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 23:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lUi30-0003gd-45
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 23:43:06 -0400
Received: from mga05.intel.com ([192.55.52.43]:12420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lUi2u-0007T4-6X
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 23:43:05 -0400
IronPort-SDR: 1HW3xaI7qv1nWAqzPDsiJxjyx3Zxbogbx/bdwQkMAse+Jw1VZeViIPXmHvrrtS6mdBu5PXa7zw
 UYKzdxsOrybQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="278957379"
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="278957379"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 20:42:59 -0700
IronPort-SDR: f+8V7EB4C13tcAqHML82w2Eb0Wdf0pFmqTDe43AryzW15wlmSxWvumDTi5c3ECFIpuFaSzV4WA
 qRfZ18nv6COg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="416081186"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga008.fm.intel.com with ESMTP; 08 Apr 2021 20:42:55 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v6 10/10] Fixed calculation error of pkt->header_size in
 fill_pkt_tcp_info()
Date: Thu,  8 Apr 2021 23:20:56 -0400
Message-Id: <1617938456-315058-11-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617938456-315058-1-git-send-email-lei.rao@intel.com>
References: <1617938456-315058-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=192.55.52.43; envelope-from=lei.rao@intel.com;
 helo=mga05.intel.com
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
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Lukas Straub <lukasstraub2@web.de>
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


