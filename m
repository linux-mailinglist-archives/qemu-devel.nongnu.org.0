Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACD3645004
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 01:10:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2hzX-0006ls-I5; Tue, 06 Dec 2022 19:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1p2hzU-0006lh-R7
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 19:08:48 -0500
Received: from mail-bn8nam11on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::601]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1p2hzL-0008Mv-BD
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 19:08:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mE7JwIu+fH1/vGfDkF4V8WzXWAVvOzGmt3I0GJYAsoF97fBeJ7VonLNn2Y6aoA3cUJVbNZZd/uFZSaxIayouaVteffFao7+xol6gEvf5QEk4R+RUZLqKXWdV/P44OvpX55o7JWzseAaqIE2vGrUwy4ppyzZmaWiRMsu8JoMp+oVRBfOMXIVVp/8uv0f32p/la4W4EiirEOUQ57ukaR9x02wiMmtua/RcTs6Dj6NprMnc8ijpzR8adihnzaqdfveqPZP6eLrFKUntKWPE4XYz6ekaWRdMX3lmtMAHezX5roBkWok12JmoeKP7K0xYs6uBBctp3/h7JaKeqolJG27OcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pW7CC5VEoARhhjXPOwPqIdbk8b2xiNoS5jfjgYKi5KI=;
 b=Fihx4+atZNaYsgUCXlu9Sd3UyU82NpbfyZd49ZAv6YAh5gTwBTJfLVX5USakaBGaXR8N8d/5AIhAHZGq+GUpAKUerzn+RhK6PF0mEVsYGiJbKiE8tz2UocCcTrH5Qct8Kzq3Ovdj4X/RefceIDeDrhAf7d/+dYPBuDnMBeOhOF1PE7n/3nnqdQ2t0UMNi+Pt0y/p7Vhd8BN/yLl8eU+BCuVhhACYmVpf5mCpq8hAIm8SdYrNLFLWnH/6EFO9nGmlcGBJJLXwlElPVAsM8xjpM0vARahEA7PQUNUkW4+dicY8uZt8jaRCDMJmvshcrXQxzniU3kDy6uByh1ESSNQkGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pW7CC5VEoARhhjXPOwPqIdbk8b2xiNoS5jfjgYKi5KI=;
 b=OdTeZ5rgBYRJAl/z6MdEDZ7omSYF0sIdcJCLQSXIBnLVoXdj+Yz5+GJbHwtXYmjlS7MSSfK1aILaIWIMZZI+t4YllfjWvgLfGpz14PsOzJJpQHvmP0DhQMkSYBXMrHQTICSWv/jYyygnsyJzWoQX0JeAtt5aak8SGV096dCOcSI=
Received: from BN9PR03CA0312.namprd03.prod.outlook.com (2603:10b6:408:112::17)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Wed, 7 Dec
 2022 00:08:35 +0000
Received: from BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::ba) by BN9PR03CA0312.outlook.office365.com
 (2603:10b6:408:112::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 00:08:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT020.mail.protection.outlook.com (10.13.176.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.14 via Frontend Transport; Wed, 7 Dec 2022 00:08:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 18:08:34 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Dec 2022 18:08:33 -0600
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-dev@xilinx.com>
CC: <francisco.iglesias@amd.com>, <peter.maydell@linaro.org>,
 <vikram.garhwal@amd.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [QEMU][PATCH v3 1/4] MAINTAINERS: Include canfd tests under Xilinx CAN
Date: Tue, 6 Dec 2022 16:08:21 -0800
Message-ID: <20221207000825.7303-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207000825.7303-1-vikram.garhwal@amd.com>
References: <20221207000825.7303-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT020:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 69db7ce7-65f9-4d8d-e4a7-08dad7e72ecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nwQAJ7KoUMQL+zmYZeiLR59oa2L/yfk0SahMwE4iKCIzM0FOSwdkpejx4SbLkcUbZRbQTMHCLJasQArQKHmfV7p/Sr4nyi5tSLFSCtzu6UPl5+qowFgYhrHWLVtzNdxaswaCartSI7N3TJ2yOixWCoLMS1iR3NTobXdc5HTFC+aDvpFXBQ2s4MqUuWDBTSqRexhswOvAUyXsYCFWIgeRmpc5J+kz8DsgUurqK9uF5yHewqJO8QzED0vYShcRjEfsUKuvFKvRawv3KY8+xnkCp5O1FI+JhtVEWqhv6WBhbIbiUksyYn2TbQUWv7KbiDeXPQRh3CpwVbY5YNCUx7CTEbbauSWEq3yBpm6/dpWzwGAI0OcinP16tNXoVs1EweY9dli6a4jTAEwWR+Tyys3kKDMMDPGl202YDgeGHCcRK/6IBvcDvMMj12FQq7pH4BHzwnZZeTc2Qi1oSFQdB9ikw6qX+y7C4swZPzU0gEFhlGzH6i2EP2SMwgCcAiE9+Gjer4B/MxSArUXzmi/IBQr+T1QEba5JOoJZc9i+68pm8ghuiHkF7QPFmTWhGnnrDmOJdxmzCf82SJHZjG0MXMRSIwQMEB0p5BxQ5vmgCiGx4VJ2myFmzdRmrXn/LiO0wqajtDPQDuLH/w5I04/TMXaDQdTkqXjbDCKGcHNn0HTck3DWlMIWgeEkhzNODhb5jVngepP8f672or/3TecU9o3FaxcshCn8SGSgg7Spy5ZKrdM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(4744005)(356005)(70206006)(478600001)(36860700001)(41300700001)(82740400003)(2616005)(40480700001)(70586007)(316002)(82310400005)(2906002)(8676002)(4326008)(81166007)(83380400001)(6666004)(44832011)(336012)(36756003)(6862004)(8936002)(1076003)(5660300002)(54906003)(186003)(40460700003)(26005)(86362001)(47076005)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 00:08:34.8409 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69db7ce7-65f9-4d8d-e4a7-08dad7e72ecb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6342
Received-SPF: softfail client-ip=2a01:111:f400:7eae::601;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6966490c94..a76221f260 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1753,7 +1753,7 @@ M: Francisco Iglesias <francisco.iglesias@amd.com>
 S: Maintained
 F: hw/net/can/xlnx-*
 F: include/hw/net/xlnx-*
-F: tests/qtest/xlnx-can-test*
+F: tests/qtest/xlnx-can*-test*
 
 EDU
 M: Jiri Slaby <jslaby@suse.cz>
-- 
2.17.1


