Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4EB5F9C43
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 11:54:12 +0200 (CEST)
Received: from localhost ([::1]:54312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohpUB-0001YZ-9M
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 05:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1ohpJt-0001lS-K4
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:43:36 -0400
Received: from mga11.intel.com ([192.55.52.93]:48274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1ohpJg-0005zz-CZ
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:43:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665395000; x=1696931000;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5GoalGxsiAXyC9ucd30gCeZ3dA9jnT4McT2ufdBWt1s=;
 b=UUkHsbuHwKjLchckomnR+iXwz4pHmXWu2z0MGaetIdMgKExnB1KCizon
 em7Beq9hsGy8Crofh1veBW4z5E3m8vaWW/e0JN7MWHmix/6utc0lQCu8p
 7hfRU2KOT2q5vNWRovlLaHBLM55Soje4dNFQCH6kUHdwoNYEr0WG39Dw0
 3XSjGRZ253WxWO/Fb5L8qmXGUSEeBJBDL0Eqpy1LwhM/6o3i/K2649SdM
 OEQAxu3O6zHsWI1z2SF3MSWnHyDlUpZEO4t7I25IQGExhEMVG6Y8Rrokj
 Z+sAPTe1PDAYZ+GFks6u25vabeg016/DYbndlHozVhGuuU/9uT7lvstMG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="301794925"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="301794925"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 02:43:15 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="768327215"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="768327215"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.143])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 02:43:14 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH] migration: Fix the minus value for compressed_size
Date: Mon, 10 Oct 2022 17:34:15 +0800
Message-Id: <20221010093415.2779165-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93;
 envelope-from=zhenzhong.duan@intel.com; helo=mga11.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

When update_compress_thread_counts() is called first time, there is
no data stream yet. We see compression_counters.compressed_size
becomes minus value shortly.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 migration/ram.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index dc1de9ddbc68..510db95cdc36 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1443,6 +1443,10 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
 static void
 update_compress_thread_counts(const CompressParam *param, int bytes_xmit)
 {
+    if (bytes_xmit <= 0) {
+        return;
+    }
+
     ram_transferred_add(bytes_xmit);
 
     if (param->zero_page) {
-- 
2.25.1


