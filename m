Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B7E5B452E
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 10:12:58 +0200 (CEST)
Received: from localhost ([::1]:53506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWvbm-0000kd-00
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 04:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1oWtkA-0005Ss-Lp
 for qemu-devel@nongnu.org; Sat, 10 Sep 2022 02:13:30 -0400
Received: from mail-dm6nam12on2052.outbound.protection.outlook.com
 ([40.107.243.52]:28897 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1oWtk8-00037F-VU
 for qemu-devel@nongnu.org; Sat, 10 Sep 2022 02:13:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxrlEVUSz+wnCKncf94lpp++1dRfoCqlTAR3zbrvWabypEhHcpcuSSl5WMbTL/jrEY3FvudI2/MqrQyqzPyIVwrYOKs37wcFVJfLOQ0OmQyvguVpNDsfELezbFcv0fjr/4z+drmodbMq8BXnYK/mEO2as4fDZU0vk3QEzmiCep3FfUxZlbS5o1mlQSdT79862QDoPNAvUFJZmo3/wv5yEMJqVH3BqOb5ClnquGELlJNBZGh98bYDxKzYcCbwqk5vqcLxicQqi1vReOBkeudwucA8mZUBbpKyxYsDUk/2Uk8XA1ZPasb8G49e8kIWuS59Y8HWhIjep1GhxdnfhMl9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r50mJ7GWPqGIEsNldaOI9MljdOF1OKyZIhFwXPYeyLQ=;
 b=l9xTVUBxQLz2IgFQw6IdxCMNzAlO9n75MNzBBaDvZYYenS9rnHFkZsoFF113UDSUpDvwA2gcyhbm1SO0i/pFDz+b9zIPTVqkkFj3Cpw92UtJCD/DKY5IKdAUifkZ4/QOOEgBEEsfDMMR7F+Ri6a7eHj8vfDB0cIAGvK7y54PJ1c0eeNxlNnh++dv8YDHaGfGuodJpFkMUc8ioDAcaY2aSUllz/P4SxD9mg5QZQ+sdFq6hbVrg4eRholl2kksE3XfO3SJ9xU/IcQH+Mc2nBAEzO1cZUkzeb6og9QHTBmtK6YJUulYCAMl215lz1xzDqcnNWpqVuhbyVZ7eykGiM9QzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r50mJ7GWPqGIEsNldaOI9MljdOF1OKyZIhFwXPYeyLQ=;
 b=ZCmQ0KZxtdDxvrgll0k7Avat07WX5c7T3rlGY7hUu9sFRy4Tx+Ia398oW+0GpVY+wSUGcENuL3IFThaa+mluINp6CXm5nJc0D6vl7WmLIqIJromEhXXdv47PT9h7ASZiveuOYNBD8OrmBpuPBUkrsZE89bHgbXYFLeZPCOU1PFA=
Received: from DM6PR14CA0047.namprd14.prod.outlook.com (2603:10b6:5:18f::24)
 by SJ0PR12MB5408.namprd12.prod.outlook.com (2603:10b6:a03:305::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Sat, 10 Sep
 2022 06:13:25 +0000
Received: from DM6NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::29) by DM6PR14CA0047.outlook.office365.com
 (2603:10b6:5:18f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Sat, 10 Sep 2022 06:13:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT102.mail.protection.outlook.com (10.13.173.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Sat, 10 Sep 2022 06:13:24 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 10 Sep
 2022 01:13:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 9 Sep
 2022 23:13:23 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 10 Sep 2022 01:13:23 -0500
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <edgar.iglesias@amd.com>, <francisco.iglesias@amd.com>,
 <vikram.garhwal@amd.com>
Subject: [QEMU][PATCH 5/5] MAINTAINERS: Include canfd tests under Xilinx CAN
Date: Fri, 9 Sep 2022 23:12:52 -0700
Message-ID: <20220910061252.2614-5-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220910061252.2614-1-vikram.garhwal@amd.com>
References: <20220910061252.2614-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT102:EE_|SJ0PR12MB5408:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb17be5-d4ff-43c0-7bc8-08da92f391b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wKpYwRa9I8GA9vAXejKXsbXXdJ0QULSMQEXTPW0rhLAHOLzSVR9X+ngNz9fwFXRoZmKbzNYPOG5lu6jr/zec+F8omEcpsVGWBlcpmSq+8nw+tEYvbkyKjEIju5yHScJXPjoQByu6ASRKj+AmejnPFA+ZXidFx+SYqLrLCFPghXZ4llSQOi3qT94ST3eJOQ/SdpEPds9Du1b4DCY5TdLN/AimrrBPIw5uY7p1uMV5jZTQ+f1aPCSKkzYAy0Arze0fFdz4egmwDMuGrrNgSNw6avL0lEpWaFUgRjWjZmoVu0ie8iJxct08hundZcruixHlZQK+4G7H0G/Bo0wlhtUk4BwFecnxNuoPTq0vKdqtwzhcjnfx/hZbZqBf4aCXh9mkw5I7p2PQ+fnHmQoSqhhKfXsh7qGpfrXWwxnNrcoxiztqAlKfJlK3BuAue6sJ3sKrr5OOJrWJhqfAqcFXjzcEaSEInN1OkVOkdS2lPZALmvmalQ94T7Ldzb/KMZxlcQXQWG/FRc4/L/TgJZUqrJBlvJ+RyBGQxLybujQyYgntzTWh1NJSiCS65yIgOkIiqjb6jT2zkedBn08kvifyShKIZXhmsbTRw/EuyrPXLJ5JYGTStLxiT2pMvqwJCOnFUKVv0a0ca4UibbvAs2tHH2kSKCdlj/ztvpKEHYKZkhXSpV5rQ9FxKQ8YF9qfP+WdTTcGdFJ+P2A5Pd7r3pEv7Q0FenCG4U+8oE7OxBrfuv6rqfQZunRDqE+sWOKAY7Bn9GxeQ4+x62jGARqSAyym3nr2xxnPL9LwcGVWLEWLFjsPMOS+1WT+xpOK00utY1+pOULf
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(40470700004)(36840700001)(46966006)(316002)(186003)(1076003)(336012)(54906003)(6916009)(47076005)(26005)(426003)(40460700003)(40480700001)(2906002)(83380400001)(6666004)(2616005)(81166007)(82740400003)(41300700001)(478600001)(4744005)(8676002)(70586007)(4326008)(44832011)(70206006)(356005)(8936002)(82310400005)(36756003)(86362001)(36860700001)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2022 06:13:24.4419 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb17be5-d4ff-43c0-7bc8-08da92f391b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5408
Received-SPF: softfail client-ip=40.107.243.52;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 10 Sep 2022 03:57:28 -0400
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

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d45e92271..4bc811c237 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1756,7 +1756,7 @@ M: Francisco Iglesias <francisco.iglesias@amd.com>
 S: Maintained
 F: hw/net/can/xlnx-*
 F: include/hw/net/xlnx-*
-F: tests/qtest/xlnx-can-test*
+F: tests/qtest/xlnx-can*-test*
 
 EDU
 M: Jiri Slaby <jslaby@suse.cz>
-- 
2.17.1


