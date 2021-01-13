Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A652F4217
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 03:55:28 +0100 (CET)
Received: from localhost ([::1]:44706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzWJj-000737-2O
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 21:55:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1kzWHm-0005fJ-TA
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:53:26 -0500
Received: from mga09.intel.com ([134.134.136.24]:58690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1kzWHk-0003wQ-H4
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:53:26 -0500
IronPort-SDR: HqkRBX6jaaulEO7za1aHezii9qyo1WsUfk1P3dK35tTrKbLByaUOK3IWaWltH2OUnktHISq7yi
 RqRhhNNW6Hpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="178289669"
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; d="scan'208";a="178289669"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 18:53:19 -0800
IronPort-SDR: UaQuv3VzgOrmZJ/REQ7zeBX+WEoKbdy6Zq5S+xHR/D5Mbuow9Cz0VGM2fWIvkAa3ol/Ef69hwN
 kwWFzFoOmutw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; d="scan'208";a="464750284"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2021 18:53:17 -0800
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, dgilbert@redhat.com
Subject: [PATCH 01/10] Remove some duplicate trace code.
Date: Wed, 13 Jan 2021 10:46:26 +0800
Message-Id: <1610505995-144129-2-git-send-email-lei.rao@intel.com>
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

There is the same trace code in the colo_compare_packet_payload.

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 net/colo-compare.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 84db497..9e18baa 100644
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


