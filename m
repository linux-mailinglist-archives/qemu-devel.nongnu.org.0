Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5604260086C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 10:13:14 +0200 (CEST)
Received: from localhost ([::1]:36680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okLFI-0003j7-H4
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 04:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1okL5X-0005i8-UT
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 04:03:12 -0400
Received: from mga18.intel.com ([134.134.136.126]:53112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1okL5V-0006oP-7C
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 04:03:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665993785; x=1697529785;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xWuSz8LTY/yjv1X4x92W+9nR52Bm/2pE7+q25k4FlwY=;
 b=nQvR4EGwM9ctkZjonD2vXyjgIM5sopPLD9FzdOWpaqIBOqCHh8hWjhWP
 C/91sKItMnmE0GXyXvQy1o2FtpV07RdmnrDt8g4NtS3x5GKBTIvdleoh/
 QqsR47WFFjx+XdKdmLtoE3qK91cwRvcZRn2mIoLEnkx+6gXwE2wHTsMtd
 yUZmsyrKUjBSZEPfy0xwul0JTvYemEuD4aPeohXiu4OVXF1fJq01UwVOU
 JdhwG4UL5OE6WX9uLsd/p20tj7JvaEyYkIS2Q0UUFPkjggQ2wq5W7PJ33
 ZkR/2sAnrPyJ8vWvI/AGYJydpnJWafx7w/y5kotPN0bOv71VIbzP/J+Er Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="289024583"
X-IronPort-AV: E=Sophos;i="5.95,190,1661842800"; d="scan'208";a="289024583"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 01:03:01 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="630595679"
X-IronPort-AV: E=Sophos;i="5.95,190,1661842800"; d="scan'208";a="630595679"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.143])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 01:02:59 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 1/2] multifd: Fix a race on reading MultiFDPages_t.block
Date: Mon, 17 Oct 2022 15:53:50 +0800
Message-Id: <20221017075351.2974642-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=zhenzhong.duan@intel.com; helo=mga18.intel.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In multifd_queue_page() MultiFDPages_t.block is checked twice.
Between the two checks, MultiFDPages_t.block may be reset to NULL
by multifd thread. This lead to the 2nd check always true then a
redundant page submitted to multifd thread again.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 migration/multifd.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 586ddc9d657a..36e2139995cf 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -447,6 +447,7 @@ static int multifd_send_pages(QEMUFile *f)
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset)
 {
     MultiFDPages_t *pages = multifd_send_state->pages;
+    bool changed = false;
 
     if (!pages->block) {
         pages->block = block;
@@ -459,14 +460,16 @@ int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset)
         if (pages->num < pages->allocated) {
             return 1;
         }
+    } else {
+        changed = true;
     }
 
     if (multifd_send_pages(f) < 0) {
         return -1;
     }
 
-    if (pages->block != block) {
-        return  multifd_queue_page(f, block, offset);
+    if (changed) {
+        return multifd_queue_page(f, block, offset);
     }
 
     return 1;
-- 
2.25.1


