Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D7433855C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 06:29:45 +0100 (CET)
Received: from localhost ([::1]:43510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKaMq-0001d0-II
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 00:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKaIb-0004uS-07
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 00:25:21 -0500
Received: from mga05.intel.com ([192.55.52.43]:4921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKaIZ-0006dL-CA
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 00:25:20 -0500
IronPort-SDR: dFLT2eGXoJSqPnjuUmbGTXWasT5vk3aV8vC/n7TudVAKuh0Xz83Z1Tm24cgiDCXIrJbMQvvJUT
 uBZv3LVgu+CQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="273826906"
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; d="scan'208";a="273826906"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 21:25:18 -0800
IronPort-SDR: irBvidiZDUHTNN9KE/BIk8QBfr1NqMFQPU1CuJurbqGvCew+s7nnO3z2JVLa6fqlpYQtdvpGaF
 N1xZzpTMD0Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; d="scan'208";a="600481915"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga006.fm.intel.com with ESMTP; 11 Mar 2021 21:25:15 -0800
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v2 03/10] Optimize the function of filter_send
Date: Fri, 12 Mar 2021 13:02:56 +0800
Message-Id: <1615525383-59071-4-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
References: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
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

The iov_size has been calculated in filter_send(). we can directly
return the size.In this way, this is no need to repeat calculations
in filter_redirector_receive_iov();

Signed-off-by: Lei Rao <lei.rao@intel.com>
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


