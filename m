Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F185474F67
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:43:00 +0100 (CET)
Received: from localhost ([::1]:35244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxINn-0005Y1-8h
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:42:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHym-0003ji-2V; Tue, 14 Dec 2021 19:17:10 -0500
Received: from mail-bn1nam07on2047.outbound.protection.outlook.com
 ([40.107.212.47]:55782 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHyi-0006Lk-JE; Tue, 14 Dec 2021 19:17:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1VFn24WkN5KYPZMB112Ilgzpf4f/aKiC5rAS+2HWr0rTclCET5Dl4mBL6c0cn1npEPCnjNIh84qVqZXKm/xIt+z6eyvD+3MmPBwamH5seCzpoHCGhBJO0SY86cQjOLEgemYkJYvxMt2KzCa2WEFFUq0LaVku7xpEhBxySLbMqAQY4rU9nclvtmGMtPnEQC+vqUaf8tAIE/SsqIb/syl2DjAXrXWROtZjQAkMAmZ+9O6SSa/O7hrtW3fxoiRcHe5W7RnvhNCfU0Lm89w33IlpBNeFBBJhshIplX5xXmeK/OqRp2td9Z1HVpn1rprYYRZQorK0H6hHGKPCUCWu+J2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VeDxXEwpH5Csi8NGSGEuKTInv+T7BdeiF4bF6Z+4qk=;
 b=RVD9XrDERPNp8ZPhJ14sljVsTcSbKrJVOVrqCRbUVwXE+DqizAj4hoRQ1wSW58FAGQ0MO8hfUZPQwmp8umRktmkfbpQNq7aP7Qj79d8wicgJeElzb4qxq4FBTbdltyYAY7ic6A8DssaBrywTQHEjxHKBlALvjYfAYFnFdQDr4lgWvjUC1ZnmpIAKPI84OTIULhY5iPUSTSSq+T/t8kFgsj3UgQFsKZAUhPrW4UY+6qSe3YkT4mxw7g1OhtyiUmYZx2pp81TB0/UdtAltti/JAnruPHgPPMBihtYyhDnl7i+uY6YgtsfVGCaKNefYLQsRKCs+aAmRD26KYekzt1iOPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VeDxXEwpH5Csi8NGSGEuKTInv+T7BdeiF4bF6Z+4qk=;
 b=Hs1xE0XFTmIv77FX8OolqB7e/dag9ejE/0z4RctRnNQg5HyOTqyN53tVU4vsRocAs7ljN69Z/D50iKvUfAZs5JnHrm8u7+GRxO0kDP8vYaVdMe6Zn5IN3eOuTVsZRL0/xfpsXxVdVDg88glD05MXbfhZc2x4iWKD+/m/0/Feqkc=
Received: from BN6PR16CA0018.namprd16.prod.outlook.com (2603:10b6:404:f5::28)
 by MW3PR12MB4361.namprd12.prod.outlook.com (2603:10b6:303:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 00:16:59 +0000
Received: from BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f5:cafe::fa) by BN6PR16CA0018.outlook.office365.com
 (2603:10b6:404:f5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Wed, 15 Dec 2021 00:16:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT036.mail.protection.outlook.com (10.13.177.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:16:58 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:16:58 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Alexander Bulekov <alxndr@bu.edu>, Darren Kenny
 <darren.kenny@oracle.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH 44/47] tests/qtest/fdc-test: Add a regression test for
 CVE-2021-20196
Date: Tue, 14 Dec 2021 18:01:22 -0600
Message-ID: <20211215000125.378126-45-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc5b569f-d1ec-4898-6432-08d9bf6035ca
X-MS-TrafficTypeDiagnostic: MW3PR12MB4361:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB4361C22B34886675735C8A8495769@MW3PR12MB4361.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h46L0Qft6ziD5Uycf1+q+quTZw5d2GCIEhTT6fm6E0yHBA7O1a6WG6Fp7E/TP4SwJV/XYeOLLJSvH/1S26w/W4PZmgk3n1cAoNRdeqsoiasx91SzNescQELz76JX48+LESIEWPbP4ujlqMzU4a1tAcILzJc8wM3nPsQ3mAGh/Jt8gHgH0vSrPRXrcQ7ZFG22fPF4hvaaDj6eS/AiaIbSmFaHz3IfaDSOtdbFo/0JpZzTTd/eGdB2/KG8xCCmKIBc8vpBVv0ZVhYtgkjRueSfJpRATkEFJCWHg4HOLFi+FfKYU2h0lrOaWHRKv9ErIyFulbygiMok4ODBr+0Hk+Q984Z6Mb7xtKPfAoUewe99r/tCtVA9FjXzZPg+5ynAGQfBdxURUjk4sbHkhOeOwFWiKPh0kC7m5a43b/nYfNQsu/HtnVeDCYcFd85aTVtd6JSEstHZKr+EPd3bGpzAU6CPynWfx2DId0YkBd13jEayI1iLOx4xnT7O/fRzRnOL7Zmk6lJoK4K3ZUZydyH9FYb8OVUi6yxpOleBcZ+svePhw9AyPIH4g0p9sQEn7livV+0do5Gaa3f/9PX6pjrt5JzqG89F5mxHEnciZAuxGq+rEfnPw6Su3Dax+0LH7NE4jC4yVzv0NSSBtpCjN3GajvTbl2sjVleRtU5JsvgF4Xha+v0tQMWdJiimaOdRZMibiN9t5PtmUqi3K/DUM8GYINDJWukd7hWkRgBkrxtqfp4fJ8bmKbJp/RFzrcxbrbZ1QhJ7xkJWN1s143JLxqgF+XYaX+iqBrm0G6znUHeiGvvfio0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(16526019)(40460700001)(1076003)(6916009)(81166007)(44832011)(47076005)(186003)(336012)(316002)(508600001)(426003)(83380400001)(4326008)(26005)(356005)(54906003)(8936002)(8676002)(2906002)(82310400004)(70206006)(36756003)(86362001)(6666004)(70586007)(2616005)(36860700001)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:16:58.9389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5b569f-d1ec-4898-6432-08d9bf6035ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4361
Received-SPF: softfail client-ip=40.107.212.47;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Without the previous commit, when running 'make check-qtest-i386'
with QEMU configured with '--enable-sanitizers' we get:

  AddressSanitizer:DEADLYSIGNAL
  =================================================================
  ==287878==ERROR: AddressSanitizer: SEGV on unknown address 0x000000000344
  ==287878==The signal is caused by a WRITE memory access.
  ==287878==Hint: address points to the zero page.
      #0 0x564b2e5bac27 in blk_inc_in_flight block/block-backend.c:1346:5
      #1 0x564b2e5bb228 in blk_pwritev_part block/block-backend.c:1317:5
      #2 0x564b2e5bcd57 in blk_pwrite block/block-backend.c:1498:11
      #3 0x564b2ca1cdd3 in fdctrl_write_data hw/block/fdc.c:2221:17
      #4 0x564b2ca1b2f7 in fdctrl_write hw/block/fdc.c:829:9
      #5 0x564b2dc49503 in portio_write softmmu/ioport.c:201:9

Add the reproducer for CVE-2021-20196.

Suggested-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20211124161536.631563-4-philmd@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
(cherry picked from commit cc20926e9b8077bff6813efc8dcdeae90d1a3b10)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 tests/qtest/fdc-test.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
index 26b69f7c5c..8f6eee84a4 100644
--- a/tests/qtest/fdc-test.c
+++ b/tests/qtest/fdc-test.c
@@ -32,6 +32,9 @@
 /* TODO actually test the results and get rid of this */
 #define qmp_discard_response(...) qobject_unref(qmp(__VA_ARGS__))
 
+#define DRIVE_FLOPPY_BLANK \
+    "-drive if=floppy,file=null-co://,file.read-zeroes=on,format=raw,size=1440k"
+
 #define TEST_IMAGE_SIZE 1440 * 1024
 
 #define FLOPPY_BASE 0x3f0
@@ -546,6 +549,40 @@ static void fuzz_registers(void)
     }
 }
 
+static bool qtest_check_clang_sanitizer(void)
+{
+#if defined(__SANITIZE_ADDRESS__) || __has_feature(address_sanitizer)
+    return true;
+#else
+    g_test_skip("QEMU not configured using --enable-sanitizers");
+    return false;
+#endif
+}
+static void test_cve_2021_20196(void)
+{
+    QTestState *s;
+
+    if (!qtest_check_clang_sanitizer()) {
+        return;
+    }
+
+    s = qtest_initf("-nographic -m 32M -nodefaults " DRIVE_FLOPPY_BLANK);
+
+    qtest_outw(s, 0x3f4, 0x0500);
+    qtest_outb(s, 0x3f5, 0x00);
+    qtest_outb(s, 0x3f5, 0x00);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outb(s, 0x3f5, 0x00);
+    qtest_outw(s, 0x3f1, 0x0400);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outw(s, 0x3f4, 0x0000);
+    qtest_outb(s, 0x3f5, 0x00);
+    qtest_outb(s, 0x3f5, 0x01);
+    qtest_outw(s, 0x3f1, 0x0500);
+    qtest_outb(s, 0x3f5, 0x00);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     int fd;
@@ -576,6 +613,7 @@ int main(int argc, char **argv)
     qtest_add_func("/fdc/read_no_dma_18", test_read_no_dma_18);
     qtest_add_func("/fdc/read_no_dma_19", test_read_no_dma_19);
     qtest_add_func("/fdc/fuzz-registers", fuzz_registers);
+    qtest_add_func("/fdc/fuzz/cve_2021_20196", test_cve_2021_20196);
 
     ret = g_test_run();
 
-- 
2.25.1


