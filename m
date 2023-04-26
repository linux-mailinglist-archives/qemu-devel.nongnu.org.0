Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EBD6EFE8B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 02:32:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prpX3-00019b-24; Wed, 26 Apr 2023 20:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tong.ho@amd.com>)
 id 1prmUv-0001gQ-4j; Wed, 26 Apr 2023 17:16:21 -0400
Received: from mail-dm6nam10on2062b.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::62b]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tong.ho@amd.com>)
 id 1prmUr-0000tS-Aw; Wed, 26 Apr 2023 17:16:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvstLooCVOhaNZJ+eBUDhG6bO70VGXk1tlLwhU1307SEwFzt734od1oTIbKa4DUr84ik9DzMmybIDl+J1cHs9NniELlam+ftbhfBG2Tvji7u0oQQp03RFO53RcXAe0HJ4EbJ21urhJLd52JeCyZf1YgcivzgrVfUKSSeVNZHxCGcvKk0/iWGkkMJLyyD82OkZlptgS2EL47BXN89A7IT3H6+4sA0vko+Ha/wYyP+hBYfMUU+TTlskkffVSWYbEywiAsyi+AdG6nT5tiozfIPh1nRNrULGFQXTnvY0NIKGRL91kvJdYViX8Jumcb3tq+ipliKmWMHWwQf4D2Bxs25+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAMuowBtECEOAxEpHUWZCwaHEsjAekYfN3EBU5MMIQ0=;
 b=fpxvNnL2VnFzqWvhEuvssOARJPi3D7uicMzLvm8og1NLlU02RIOuKGS2CRlr8ue03Gxjc82xiklKPF69WUxWeekun9ruBvnciAfzpzQT7XnowDw8TdIRcd4kFO3Zuu7dtmgw7Z0ybXomODPuGoEWgLpq/VCy7caEZkIo0bR9jmugF8LIJ0UoKtx9rY8aPzDx79JLqihf+KkLPJu3SoPlwbcaqJw1Ze8K7e919d1F6DE1YIqf7ZH6cGzsU2TyJpLZuEeRqTbHKivqjfeaG2FRknWGXdNCNFC/PgpVGFC9B1QqRJU2Ktest7F2Q4K0r5FTO4SDhw6dfsDIpQeh7HH3wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAMuowBtECEOAxEpHUWZCwaHEsjAekYfN3EBU5MMIQ0=;
 b=SJbiZK5yQhn+rEMpyNF86g8FYfNs2SecGIPzfGSMA3j2doI9lVpsCw+J4U6wh9J0v0PxWHfGHmHadRXzzD9oizsxsMDJwTzGjD+nJzYf2ZR1CIJKKdTFbnW1lRcR6OySLwlMvPf35rYNyNUk5Der+zJwzI+XmReSgxuZwKTnR88=
Received: from DM6PR11CA0005.namprd11.prod.outlook.com (2603:10b6:5:190::18)
 by CH3PR12MB8935.namprd12.prod.outlook.com (2603:10b6:610:169::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 21:16:10 +0000
Received: from DM6NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::c9) by DM6PR11CA0005.outlook.office365.com
 (2603:10b6:5:190::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21 via Frontend
 Transport; Wed, 26 Apr 2023 21:16:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT092.mail.protection.outlook.com (10.13.173.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.21 via Frontend Transport; Wed, 26 Apr 2023 21:16:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 26 Apr
 2023 16:16:08 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 26 Apr
 2023 16:16:08 -0500
Received: from xsjtongh40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 26 Apr 2023 16:16:07 -0500
From: Tong Ho <tong.ho@amd.com>
To: <qemu-arm@nongnu.org>
CC: <qemu-devel@nongnu.org>, <alistair@alistair23.me>,
 <edgar.iglesias@gmail.comi>, <frasse.iglesias@gmail.com>,
 <peter.maydell@linaro.org>, <tong.ho@amd.com>
Subject: [PATCH] hw/nvram: Avoid unnecessary Xilinx eFuse backstore write
Date: Wed, 26 Apr 2023 14:16:07 -0700
Message-ID: <20230426211607.2054776-1-tong.ho@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT092:EE_|CH3PR12MB8935:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b7529d-6dae-438e-5865-08db469b74f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xN2Jlx+9WnjurHIgmqAsDxpZ3li9b4B31xXzr8L6lGwIn4vAlp+ME6w8Wv2XUKn048LbgfV4C+tWWDflZO2U0GeBE9TYuU9671w/dRTm517WKQQnYJ6tzYe/ZzjHCCh4c2Os1vjjKlfsNsSLXLjntxrYkwEEQJvrdfPlagz58wq4AbxeLy8NTuY1n7TQ36uaryMLotL/Yi44aAjGskQeLvFZUOh04u+0ojuLQ3XxMgp1XKz8CQvudXpxH83Q1QLZ894QAMbyUBMyi06zgHuVUB6WvRuRAjUvzYg8BkRuDIntATPxE6LEzwUMXEDSBw49xt1CASl0/Tvl0zP7O/AxxXg8IfdGG1Ky0WKtyK49n6P9fGd+WF52qDWzwNqJlOt9uJjoMNch6iplbTf2Yz/B2JuY1vRdsUezPb5AdMEH86BGe6QxEs6rJPajH9+8U7Fm+P1f1A21dmdy22+AXHNC6kgK7BCDs22Ji5224UOTs5CCFQqi1sFRCBzQOzixPIN4M93qbArZ8GZVy1yf4DLTEo/38j09pi5O/f5j1hUxHycfuV/AB+Ieumu2SZtZ64l9LCv1oAX3gow28O5HYZMvn5mkSdMP4Vb+7akGwuct0P5Aw7MEy8UYDwYSNY2Z4wrp73hluYdLVD2woUTgWQ9eVsM2vd/fklZIhG4H/CQo7qp/cfTZ6MZnrWZ4emYaSpv/FqdkimHxk6RE/n6EjRvIt+O97qXU3nQ+dKjSv2jPJR4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(82740400003)(44832011)(316002)(6916009)(4326008)(40460700003)(41300700001)(81166007)(5660300002)(356005)(8936002)(8676002)(36756003)(82310400005)(86362001)(2906002)(2616005)(40480700001)(26005)(1076003)(478600001)(36860700001)(83380400001)(426003)(336012)(186003)(47076005)(70206006)(54906003)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 21:16:09.8059 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b7529d-6dae-438e-5865-08db469b74f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8935
Received-SPF: softfail client-ip=2a01:111:f400:7e88::62b;
 envelope-from=tong.ho@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 26 Apr 2023 20:30:42 -0400
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

Add a check in the bit-set operation to write the backstore
only if the affected bit is 0 before.

With this in place, there will be no need for callers to
do the checking in order to avoid unnecessary writes.

Signed-off-by: Tong Ho <tong.ho@amd.com>
---
 hw/nvram/xlnx-efuse.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/nvram/xlnx-efuse.c b/hw/nvram/xlnx-efuse.c
index fdfffaab99..655c40b8d1 100644
--- a/hw/nvram/xlnx-efuse.c
+++ b/hw/nvram/xlnx-efuse.c
@@ -143,6 +143,8 @@ static bool efuse_ro_bits_find(XlnxEFuse *s, uint32_t k)
 
 bool xlnx_efuse_set_bit(XlnxEFuse *s, unsigned int bit)
 {
+    uint32_t set, *row;
+
     if (efuse_ro_bits_find(s, bit)) {
         g_autofree char *path = object_get_canonical_path(OBJECT(s));
 
@@ -152,8 +154,13 @@ bool xlnx_efuse_set_bit(XlnxEFuse *s, unsigned int bit)
         return false;
     }
 
-    s->fuse32[bit / 32] |= 1 << (bit % 32);
-    efuse_bdrv_sync(s, bit);
+    /* Avoid back-end write unless there is a real update */
+    row = &s->fuse32[bit / 32];
+    set = 1 << (bit % 32);
+    if (!(set & *row)) {
+        *row |= set;
+        efuse_bdrv_sync(s, bit);
+    }
     return true;
 }
 
-- 
2.25.1


