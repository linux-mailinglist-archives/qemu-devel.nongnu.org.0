Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42DC6B2170
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 11:31:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paDXE-00053s-Hg; Thu, 09 Mar 2023 05:30:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1paDXC-00053k-65
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 05:30:06 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1paDXA-0005NK-1O
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 05:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678357804; x=1709893804;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yv1WAkaEUJq6B8lHZoSDox5n0FnnMQ6a34L5ICRHjwk=;
 b=mLv1ZlC46+dMh4lcbijZDceU55qEDqG+Xk5ReAu1WuAtJj4KMqa5HMDo
 O/WeSWjVsvmmPwVmRR2JsyJYRXaQuLU8EJ4lI9sWEdfoOxhteKMm1i/Pf
 QgGdr4Lx9Mr/tZuVFn0aE4Ja8CrysknopCgsXL8cA5BbGCczWTd8jCMhO
 JkXkTcUwUs6CavoY2M3Zb6wiE6u1DI36dbngz21RTlCxMGKWkWlBPt8xx
 eqYUzZ59KgBN+7YkT8iy2DgDXcJ4YPDAcKSkcja3olccFZcSgK28mqjSV
 0Q229tKtl1h+GlS45jgJjM6Od0vRIkmhA1aWmD0AL8BguITRoIv7iv6kb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316069720"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="316069720"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 02:29:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="787510012"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="787510012"
Received: from tdx-lm.sh.intel.com ([10.239.53.27])
 by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2023 02:29:58 -0800
From: Wei Wang <wei.w.wang@intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Cc: qemu-devel@nongnu.org,
	Wei Wang <wei.w.wang@intel.com>
Subject: [PATCH v1] migration/multifd: correct multifd_send_thread to trace
 the flags
Date: Thu,  9 Mar 2023 18:29:56 +0800
Message-Id: <20230309102956.8030-1-wei.w.wang@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=wei.w.wang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The p->flags could be updated via the send_prepare callback, e.g. OR-ed
with MULTIFD_FLAG_ZLIB via zlib_send_prepare. Assign p->flags to the
local "flags" before the send_prepare callback could only get partial of
p->flags. Fix it by moving the assignment of p->flags to the local flags
after the callback, so that the correct flags can be traced.

Fixes: ab7cbb0b9a3b ("multifd: Make no compression operations into its own structure")
Signed-off-by: Wei Wang <wei.w.wang@intel.com>
---
 migration/multifd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 5e85c3ea9b..cbc0dfe39b 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -677,7 +677,7 @@ static void *multifd_send_thread(void *opaque)
 
         if (p->pending_job) {
             uint64_t packet_num = p->packet_num;
-            uint32_t flags = p->flags;
+            uint32_t flags;
             p->normal_num = 0;
 
             if (use_zero_copy_send) {
@@ -699,6 +699,7 @@ static void *multifd_send_thread(void *opaque)
                 }
             }
             multifd_send_fill_packet(p);
+            flags = p->flags;
             p->flags = 0;
             p->num_packets++;
             p->total_normal_pages += p->normal_num;
-- 
2.27.0


