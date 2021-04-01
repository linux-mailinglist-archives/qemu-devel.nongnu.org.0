Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D363510A8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:12:13 +0200 (CEST)
Received: from localhost ([::1]:56910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsR2-0003XS-Fo
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lRsPh-0001yo-3y
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:10:49 -0400
Received: from mga17.intel.com ([192.55.52.151]:36363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lRsPd-0005oP-9l
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:10:48 -0400
IronPort-SDR: Pxous52pEk3dhkdEKDuGr6GrvbWwzmjBu7ZBSS62al0CQeQVRxmVnce08THvn+Lp9fez0PXizS
 O8VrW9G/8PLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="172211370"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="172211370"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 01:10:37 -0700
IronPort-SDR: GOzRL1TF/IpKP80XU05KS4LVlEOld8cccFmRvsUqyhh4umdBSQ8oF1mgreyS3Awzr8w67+Tv+Y
 hyXCmvxhExEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="439119086"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga004.fm.intel.com with ESMTP; 01 Apr 2021 01:10:34 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v5 01/10] Remove some duplicate trace code.
Date: Thu,  1 Apr 2021 15:47:20 +0800
Message-Id: <1617263249-54501-2-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
References: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lei.rao@intel.com;
 helo=mga17.intel.com
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


