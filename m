Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F2334870F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 03:50:48 +0100 (CET)
Received: from localhost ([::1]:51222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPG58-0002NP-Mq
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 22:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lPG2a-0000us-IB
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:48:08 -0400
Received: from mga07.intel.com ([134.134.136.100]:40251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lPG2Y-0001ZZ-1u
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:48:07 -0400
IronPort-SDR: sHAmnmyfz812RXC28GEpFAhlp5sFA+UUG0SQbu3CsDnlritU3GB611Lpn03GAB/Yv2zdQhOh1a
 WyL2Yf+4Lh2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="254823094"
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="254823094"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 19:48:00 -0700
IronPort-SDR: OfqKCzRdM0oKg5jX2HDfo6gFhUVERaSPtBX5S/Sn4Hnz+JHacmksQYCM6CQaV+Gb+2t5ElnGIS
 JScrHmgr0eAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="374881350"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by orsmga003.jf.intel.com with ESMTP; 24 Mar 2021 19:47:57 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v4 01/10] Remove some duplicate trace code.
Date: Thu, 25 Mar 2021 10:24:42 +0800
Message-Id: <1616639091-28279-2-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616639091-28279-1-git-send-email-lei.rao@intel.com>
References: <1616639091-28279-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=134.134.136.100; envelope-from=lei.rao@intel.com;
 helo=mga07.intel.com
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

There is the same trace code in the colo_compare_packet_payload.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
---
 net/colo-compare.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 9d1ad99..c142c08 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -590,19 +590,6 @@ static int colo_packet_compare_other(Packet *spkt, Packet *ppkt)
     uint16_t offset = ppkt->vnet_hdr_len;
 
     trace_colo_compare_main("compare other");
-    if (trace_event_get_state_backends(TRACE_COLO_COMPARE_IP_INFO)) {
-        char pri_ip_src[20], pri_ip_dst[20], sec_ip_src[20], sec_ip_dst[20];
-
-        strcpy(pri_ip_src, inet_ntoa(ppkt->ip->ip_src));
-        strcpy(pri_ip_dst, inet_ntoa(ppkt->ip->ip_dst));
-        strcpy(sec_ip_src, inet_ntoa(spkt->ip->ip_src));
-        strcpy(sec_ip_dst, inet_ntoa(spkt->ip->ip_dst));
-
-        trace_colo_compare_ip_info(ppkt->size, pri_ip_src,
-                                   pri_ip_dst, spkt->size,
-                                   sec_ip_src, sec_ip_dst);
-    }
-
     if (ppkt->size != spkt->size) {
         trace_colo_compare_main("Other: payload size of packets are different");
         return -1;
-- 
1.8.3.1


