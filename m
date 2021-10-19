Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500E9433A49
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:27:03 +0200 (CEST)
Received: from localhost ([::1]:54566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcr14-00076E-Bf
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq6z-0004VP-TN; Tue, 19 Oct 2021 10:29:05 -0400
Received: from mail-bn8nam11on2078.outbound.protection.outlook.com
 ([40.107.236.78]:40640 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcq6w-0005FK-Gc; Tue, 19 Oct 2021 10:29:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SF5sZRsSwaBwdd7SOY41rRqhmpnImZnfAgLbfv0xlAc1/Iru4fsW57mmYOr2cwghTFQVtDx3oEkpBe8E+vTbmYACr4jYkZZtgakOdshYzwIGHusHW85cgKhxEie6B2j1Fn3xyLB6C3EG/9Ec1BEk3d/TusLHmaHsBKRyqu3DJdVl/GJfpA6E8FZ76IdkE8hg12XZ2gecipSntv0My+/Yj5NH/xW6+uwFGc1vuUmmtD2wmsq8/zclEoqn1KIC//BU80aZVhdkOVvRTRgu8OMpdKdeldjQxpj/yZ9prahjIpxvvXYBr6TgT++kIfskLxTMRwQbFHPYSauDUGiIdvtn5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94Npene2IDsgGwoz31QM5rtuk8CH4oRXm7rdz+Zz6So=;
 b=k2lP9fuK0WyPzKjHUovjZxM1hcjYHYBRrxOAThcBTOyd/oh1icwDlDSZTMw3TeXxnZt9gO1LSN3YxCdr3Elhq2h+WVY3Cg/D9jrAmc/sDHIJxEe71OQPgXxJPmWotQBvM0qp0ujRf33yIoKy+AXZMKduLrCi6UvodfYQT0EltIIFWIi1yMNr7kd5hIhXTDJNETsFl/mM+xLCcFVN/heifQQQQH+USJOY6u9z3VwgMmv3z+113070MduiQfZ+RkowyBuvYl77szsFOE2uJvtSrj5E4cEIwE1jcVyh+zK+LwuyhwvLeqd5GrIjrI0OYn04Inm8dWP8z8eocX433PIXMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94Npene2IDsgGwoz31QM5rtuk8CH4oRXm7rdz+Zz6So=;
 b=uHWgvxb+13X11WCUytJCw4p+ZLQZ7NsjnUC5xZ1avQAKRSbjYBnDBfR+W2vlV8R7bv7aqVFfIRj54w3RD8eBwG6x9cp+F6NeiK2T8edSxbee4juI5YvW7Ao/bMHPRdO2p61ACQUUGVND1UvylciP5N/UL+XyXsFK+QsRhFYwAKo=
Received: from DS7PR03CA0197.namprd03.prod.outlook.com (2603:10b6:5:3b6::22)
 by MN2PR12MB4288.namprd12.prod.outlook.com (2603:10b6:208:1d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 14:28:58 +0000
Received: from DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::40) by DS7PR03CA0197.outlook.office365.com
 (2603:10b6:5:3b6::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:28:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT068.mail.protection.outlook.com (10.13.173.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:28:57 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:28:56 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Peter Maydell <peter.maydell@linaro.org>, Alexander
 Bulekov <alxndr@bu.edu>
Subject: [PATCH 45/64] hw/sd/sdcard: Fix assertion accessing out-of-range
 addresses with CMD30
Date: Tue, 19 Oct 2021 09:09:25 -0500
Message-ID: <20211019140944.152419-46-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9fee4c4-644f-407a-d485-08d9930cc977
X-MS-TrafficTypeDiagnostic: MN2PR12MB4288:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4288D7116186B5D61684C91495BD9@MN2PR12MB4288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bqkLrNg2xX20eGH2AaEMhyK+yuzXkcLEXAMn4ctMrXfBWOcSc04P7L41CWUEIyLhvoWageo+MRZN2mZAAEGZkwhJGz7qs8AF7iwnyUyV0ac7RgJaWHjodO3W01tjnx6o5SccHXwS+qHNSKfgaXaBamiG7UfHhXe2nPT+w4m6Ji5bs9R0tR4Kqs+hwJRZYgsa2PJ32bRSBNs5WvXOGahXb5XOs3wIA4+4vdKQ0LDzUnwe6Xqcnpub8uFNfyJYfOBDAn02SbXPCBeKxM1wSUO2EH0RmdGrIiNgqQGlnCP27ruAwVAou7JG/my2EM7vV5Mi2U11r2auHCRljK+mXROh5ujDCeBoFxIkuckOLR2Hspwa2+J4jy288gO6Ns6pbLCCoipsJQNYlhJQNpNNarcxePuvd6iZYpfajwOG49BzNI4fLnxt3N9PD+wKiWpb7Q8DgDnUFnm+NtAct01k8UFYyI8En1jvp3g0Tn8RCN1+fcwKRDBpB3nKufey8UuYAMr2Ifgk88XAjHLUkj/ZnFMIWpWTVQbTEmTGVB/EKLEpZfFuWFHT574ZzproTisHO5/s3bMiNNILPXqs7Uvl4Oi6DpKsacpUBKr9uipJaCzqHFoTAfc/DvxJ6dTAJNf89qt2offqp4gwTvE0IWjhueLnfYZX78xOXx3qsQzYTockQdEwmgx7sQ/8lF8NRWlaCyhmC7d2Swne7dKyNa6B32B/LX4HqF6A9vtgfF0yVIlSdNdlZD3kVr0aLVqDD02qpgi/qT5n4Gcedn5NiW2Nt9Cemy8jXTDrUSGaruEbHunsgqTbA8Xjp8pOwBsXpSH/3pNx
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(81166007)(44832011)(4326008)(426003)(8676002)(2906002)(356005)(2616005)(70586007)(70206006)(36756003)(54906003)(508600001)(1076003)(5660300002)(86362001)(6666004)(316002)(8936002)(82310400003)(26005)(186003)(16526019)(6916009)(36860700001)(336012)(47076005)(83380400001)(966005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:28:57.7780 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fee4c4-644f-407a-d485-08d9930cc977
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4288
Received-SPF: softfail client-ip=40.107.236.78;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

OSS-Fuzz found sending illegal addresses when querying the write
protection bits triggers the assertion added in commit 84816fb63e5
("hw/sd/sdcard: Assert if accessing an illegal group"):

  qemu-fuzz-i386-target-generic-fuzz-sdhci-v3: ../hw/sd/sd.c:824: uint32_t sd_wpbits(SDState *, uint64_t):
  Assertion `wpnum < sd->wpgrps_size' failed.
  #3 0x7f62a8b22c91 in __assert_fail
  #4 0x5569adcec405 in sd_wpbits hw/sd/sd.c:824:9
  #5 0x5569adce5f6d in sd_normal_command hw/sd/sd.c:1389:38
  #6 0x5569adce3870 in sd_do_command hw/sd/sd.c:1737:17
  #7 0x5569adcf1566 in sdbus_do_command hw/sd/core.c:100:16
  #8 0x5569adcfc192 in sdhci_send_command hw/sd/sdhci.c:337:12
  #9 0x5569adcfa3a3 in sdhci_write hw/sd/sdhci.c:1186:9
  #10 0x5569adfb3447 in memory_region_write_accessor softmmu/memory.c:492:5

It is legal for the CMD30 to query for out-of-range addresses.
Such invalid addresses are simply ignored in the response (write
protection bits set to 0).

In commit 84816fb63e5 ("hw/sd/sdcard: Assert if accessing an illegal
group") we misplaced the assertion *before* we test the address is
in range. Move it *after*.

Include the qtest reproducer provided by Alexander Bulekov:

  $ make check-qtest-i386
  ...
  Running test qtest-i386/fuzz-sdcard-test
  qemu-system-i386: ../hw/sd/sd.c:824: sd_wpbits: Assertion `wpnum < sd->wpgrps_size' failed.

Cc: qemu-stable@nongnu.org
Reported-by: OSS-Fuzz (Issue 29225)
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 84816fb63e5 ("hw/sd/sdcard: Assert if accessing an illegal group")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/495
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210802235524.3417739-3-f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Alexander Bulekov <alxndr@bu.edu>
(cherry picked from commit 4ac0b72bae85cf94ae0e5153b9c2c288c71667d4)
*drop fuzz test additions, since sdcard fuzz test has functional
 dependency on guest-visible change not flagged for stable:
 59b63d78 ("hw/sd/sdcard: Check for valid address range in SEND_WRITE_PROT (CMD30)")
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/sd/sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index fa6bb79b15..bc8f17ddf9 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -821,7 +821,6 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
     wpnum = sd_addr_to_wpnum(addr);
 
     for (i = 0; i < 32; i++, wpnum++, addr += WPGROUP_SIZE) {
-        assert(wpnum < sd->wpgrps_size);
         if (addr >= sd->size) {
             /*
              * If the addresses of the last groups are outside the valid range,
@@ -829,6 +828,7 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
              */
             continue;
         }
+        assert(wpnum < sd->wpgrps_size);
         if (test_bit(wpnum, sd->wp_groups)) {
             ret |= (1 << i);
         }
-- 
2.25.1


