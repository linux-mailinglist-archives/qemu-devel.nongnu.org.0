Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12615A8BEF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 05:31:14 +0200 (CEST)
Received: from localhost ([::1]:53442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTav6-0004Cy-MT
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 23:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oTaro-0008RN-CD
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 23:27:44 -0400
Received: from mga12.intel.com ([192.55.52.136]:17693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1oTarl-0007uj-FC
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 23:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662002861; x=1693538861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3HysGTG5BKJ/q3qUeWLum+k4xx1MNT2xlgtUg5jXhpQ=;
 b=VHNlX173U3f5Hoa5x1M1hE6cO2vtDrw6Et0aBSRb709En2hu/hnDaZNl
 sSkPnAqTKuU1xFIJYrrohde074c+se+hxqgjhifFr1kH6haqwb8NqBXji
 z9+bwn3VN22JK2Ht8QDfn1yIDaEfDJUw8jPML/d2oMbUrWuOnS5xGUNmX
 lrTKEGOu+LggQMOOn4lY1QI3cWJmC7dew058XmmGWfwmlYF076w+vamhb
 HEaS0Fx9EZ5WzHZQcKpMRN2ng6TY/RRww1hw5cOChPnU/9HNcu/pZNyVu
 FCyNuMVCZBPx1NrXJkiWJHd881cHM3Y7S8+fU+GsZIQJCQQ/8CtIVxJzd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="275354004"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="275354004"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 20:27:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="642142679"
Received: from sqa-gate.sh.intel.com (HELO robert-clx2.tsp.org)
 ([10.239.48.212])
 by orsmga008.jf.intel.com with ESMTP; 31 Aug 2022 20:27:28 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: imammedo@redhat.com, mst@redhat.com, xiaoguangrong.eric@gmail.com,
 ani@anisinha.ca, dan.j.williams@intel.com, jingqi.liu@intel.com
Cc: qemu-devel@nongnu.org, robert.hu@intel.com,
 Robert Hoo <robert.hu@linux.intel.com>
Subject: [PATCH v3 1/5] tests/acpi: allow SSDT changes
Date: Thu,  1 Sep 2022 11:27:17 +0800
Message-Id: <20220901032721.1392482-2-robert.hu@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220901032721.1392482-1-robert.hu@linux.intel.com>
References: <20220901032721.1392482-1-robert.hu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=robert.hu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..eb8bae1407 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/SSDT.dimmpxm",
+"tests/data/acpi/q35/SSDT.dimmpxm",
-- 
2.31.1


