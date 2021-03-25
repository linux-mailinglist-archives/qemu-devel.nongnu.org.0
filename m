Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C63734872D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 03:52:32 +0100 (CET)
Received: from localhost ([::1]:59160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPG6p-0005qg-FQ
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 22:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lPG2c-0000vC-9a
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:48:10 -0400
Received: from mga07.intel.com ([134.134.136.100]:40251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lPG2a-0001ZZ-M8
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:48:10 -0400
IronPort-SDR: Ob5mqqqiSyT7dcwNQ5jxNA8gKSBzCQs+SMjFIkP56wmqJB5FW/eEhjMNG/rtdomSB0xSQDfc8M
 5lGGwD2pDefA==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="254823115"
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="254823115"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 19:48:08 -0700
IronPort-SDR: LRnveuCF/DRKROTss2JA4wGmseMd3r10U63XTzYHGX4wli4VJQq+GyKo++wF0Wh8iVv6tGgTFz
 Dc8KN3pUhWdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="374881391"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by orsmga003.jf.intel.com with ESMTP; 24 Mar 2021 19:48:05 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v4 03/10] Optimize the function of filter_send
Date: Thu, 25 Mar 2021 10:24:44 +0800
Message-Id: <1616639091-28279-4-git-send-email-lei.rao@intel.com>
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

The iov_size has been calculated in filter_send(). we can directly
return the size.In this way, this is no need to repeat calculations
in filter_redirector_receive_iov();

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
---
 net/filter-mirror.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index f8e6500..f20240c 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -88,7 +88,7 @@ static int filter_send(MirrorState *s,
         goto err;
     }
 
-    return 0;
+    return size;
 
 err:
     return ret < 0 ? ret : -EIO;
@@ -159,7 +159,7 @@ static ssize_t filter_mirror_receive_iov(NetFilterState *nf,
     int ret;
 
     ret = filter_send(s, iov, iovcnt);
-    if (ret) {
+    if (ret < 0) {
         error_report("filter mirror send failed(%s)", strerror(-ret));
     }
 
@@ -182,10 +182,10 @@ static ssize_t filter_redirector_receive_iov(NetFilterState *nf,
 
     if (qemu_chr_fe_backend_connected(&s->chr_out)) {
         ret = filter_send(s, iov, iovcnt);
-        if (ret) {
+        if (ret < 0) {
             error_report("filter redirector send failed(%s)", strerror(-ret));
         }
-        return iov_size(iov, iovcnt);
+        return ret;
     } else {
         return 0;
     }
-- 
1.8.3.1


