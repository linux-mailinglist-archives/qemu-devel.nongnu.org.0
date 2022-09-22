Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8880F5E642A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 15:50:08 +0200 (CEST)
Received: from localhost ([::1]:39202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obMad-0004ld-JP
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 09:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1obLDY-0001no-2J
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:22:13 -0400
Received: from mga09.intel.com ([134.134.136.24]:16854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1obLDW-0000vn-EO
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:22:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663849330; x=1695385330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3HysGTG5BKJ/q3qUeWLum+k4xx1MNT2xlgtUg5jXhpQ=;
 b=kdDxEUmkT8QWV37Ripu8C9IEVFnmAp704cpblAOJrAqyfaCH3/SqjORK
 97UMZYkBCYVmxTfF1c6IegX/snZLqHdjHxo5eBZQKH7daNfJPaVA4ck+M
 bD9Y5pA0CFXbTVgUvGII1amMQxFAAyCnVpD0jkXNpLm+SpVNdxpOfGNU+
 fGYjmT9hJvuroLum7/y8IYPvOntOam0y2PCjy2glsdnbPVoY/bBkUPvDV
 +CJQtFQKDjS5fwSN1+y6wqbJ+s7yaf98PuoKnab69yR9b2juilo/fuh38
 OKAd+zAFUuoPf7UpymkKilXxXA1MA3AB1MkBRDHIsU1E1jAbqKTZz/HL3 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="301128368"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="301128368"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 05:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="795063210"
Received: from sqa-gate.sh.intel.com (HELO robert-clx2.tsp.org)
 ([10.239.48.212])
 by orsmga005.jf.intel.com with ESMTP; 22 Sep 2022 05:22:04 -0700
From: Robert Hoo <robert.hu@linux.intel.com>
To: imammedo@redhat.com, mst@redhat.com, xiaoguangrong.eric@gmail.com,
 ani@anisinha.ca, jingqi.liu@intel.com
Cc: qemu-devel@nongnu.org, robert.hu@intel.com,
 Robert Hoo <robert.hu@linux.intel.com>
Subject: [PATCH v4 1/5] tests/acpi: allow SSDT changes
Date: Thu, 22 Sep 2022 20:21:51 +0800
Message-Id: <20220922122155.1326543-2-robert.hu@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220922122155.1326543-1-robert.hu@linux.intel.com>
References: <20220922122155.1326543-1-robert.hu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=robert.hu@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


