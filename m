Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8364F43DDAA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 11:23:29 +0200 (CEST)
Received: from localhost ([::1]:35220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg1dA-0003FA-9r
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 05:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mg1bd-0001E2-MR
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 05:21:53 -0400
Received: from mga11.intel.com ([192.55.52.93]:39002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mg1bb-0005oG-Oh
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 05:21:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="227819647"
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="227819647"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 02:15:17 -0700
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="498301906"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 02:15:16 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: [PATCH V5 2/3] net/filter: Optimize transfer protocol for
 filter-rewriter
Date: Thu, 28 Oct 2021 17:05:55 +0800
Message-Id: <20211028090556.3168043-3-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028090556.3168043-1-chen.zhang@intel.com>
References: <20211028090556.3168043-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=chen.zhang@intel.com;
 helo=mga11.intel.com
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
Cc: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the vnet header a necessary part of filter transfer protocol.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/filter-rewriter.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index cb3a96cde1..70fa71583a 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -266,9 +266,7 @@ static ssize_t colo_rewriter_receive_iov(NetFilterState *nf,
 
     iov_to_buf(iov, iovcnt, 0, buf, size);
 
-    if (s->vnet_hdr) {
-        vnet_hdr_len = nf->netdev->vnet_hdr_len;
-    }
+    vnet_hdr_len = nf->netdev->vnet_hdr_len;
 
     pkt = packet_new_nocopy(buf, size, vnet_hdr_len);
 
@@ -415,7 +413,7 @@ static void filter_rewriter_init(Object *obj)
 {
     RewriterState *s = FILTER_REWRITER(obj);
 
-    s->vnet_hdr = false;
+    s->vnet_hdr = true;
     s->failover_mode = FAILOVER_MODE_OFF;
 }
 
-- 
2.25.1


