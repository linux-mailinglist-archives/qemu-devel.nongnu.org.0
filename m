Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE2B2EB13B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:21:01 +0100 (CET)
Received: from localhost ([::1]:55940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwq0z-0001kA-0j
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpcc-0001Hh-7z
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:55:51 -0500
Received: from mga11.intel.com ([192.55.52.93]:21251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpcP-00012q-Ku
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:55:48 -0500
IronPort-SDR: ygCNHJ/1tHBuUetk5+HHGKbki8mZ4tjC4Np+1uB1ht8def4jYJyM1//B2K4a34LUbf/mZg7qyn
 kii7luWdU+UA==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="173629582"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="173629582"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:06 -0800
IronPort-SDR: LRDIuHze4w8C4OwXi8Y2PcX2h8YU/ODZ5UHuX+dNMSznaEr7zqsoCrlhgL1I52OXCprKYoi+3z
 DggiQxonFvWg==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346338083"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:54:05 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 27/32] tests/acpi: allow CEDT table addition
Date: Tue,  5 Jan 2021 08:53:18 -0800
Message-Id: <20210105165323.783725-28-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105165323.783725-1-ben.widawsky@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=ben.widawsky@intel.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Chris Browy <cbrowy@avery-design.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Prashant V Agarwal <agpr123@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 tests/data/acpi/pc/CEDT                     | 0
 tests/data/acpi/q35/CEDT                    | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 3 files changed, 2 insertions(+)
 create mode 100644 tests/data/acpi/pc/CEDT
 create mode 100644 tests/data/acpi/q35/CEDT

diff --git a/tests/data/acpi/pc/CEDT b/tests/data/acpi/pc/CEDT
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/CEDT b/tests/data/acpi/q35/CEDT
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..9b07f1e1ff 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/CEDT",
+"tests/data/acpi/q35/CEDT",
-- 
2.30.0


