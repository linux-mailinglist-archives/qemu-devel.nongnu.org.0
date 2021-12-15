Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00809474F8D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:50:45 +0100 (CET)
Received: from localhost ([::1]:42754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIVH-0002TL-MX
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:50:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHx8-0001Ux-TI; Tue, 14 Dec 2021 19:15:28 -0500
Received: from mail-mw2nam08on2070.outbound.protection.outlook.com
 ([40.107.101.70]:21089 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHx5-00060Q-L9; Tue, 14 Dec 2021 19:15:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1yMKobz14Bs3lqULSX4+nUH/GwqXoKdJzsvQyAj1hUaIWhWWKEoqfZ1/mXPKBF1+SvaiV9/B4OfQhSDf7UMs61jCKXR9azJKhGAZRSP+ajwf+JzNzJ0r2Qet4UWcJ/kzJd1NfxJPT9mYBqY7G9oaoOnreJysPSKWjS2YP7ZWpyv27ENEGePzNOU/bs35VaLyimus0poU7noUHqg3boKXD2sPJ2E8OlzMejvOfF+sbU56rwkW5sDRBTlqNyXB0wRME58EYrJ4pLCPqdB8HEPUB5O3iBQIFGWj9yo04sKnaE1gKsgqTiZI1WYn9e2/r6B4Yt/r+aNchO7hzy4YXMYOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0dHR/QgpArLHk2TA7i0I2yumXF2pB/+3eP31oiWiPI=;
 b=Fd+mJ5S7ZtWoLJxUcFTVlQpaHgAD1gqZ2vRx640YBFGO24gwmJV9oOxrVCv9TVWWsYxdkdEXAPwdhEXLcuxTMLe+ltA+x2bkKxLMr776OP74lmcwVPSOamkeqEyQnA/tTAFx4ISuBlYhGBYqIr800oqxST410YHhI1e83k2JXhGM/qOLo+rNSH8oMupHUkYU3XVEu2jXuKg9mT0K3uQoWe/rhLmOQr5h7Ws6WiOa+qwRJszx4+EWJsiEyOT5wocaDy5+ZfFSuFJ/HcTkWh7nxd2u3pRHf0liDvfC4kLiWkPZ5tRjc7i/EvASmcu8TES6XA1bIrQmEE1d3+ELUoRhJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0dHR/QgpArLHk2TA7i0I2yumXF2pB/+3eP31oiWiPI=;
 b=1gfOWrww4LjT29Rp/NikpbnLtzZQ2xXPL1dU52RU3lu5PSOOgQHAoQgzckNMM0pFFbRK82O+qLHl/vZGlLGflk8ji2SJbBZTmPDcekL3YcF/RN6TptIuN0vQIEiGpXIOlJ+mDGiyB/8Z21FI5DT9BmBoFjTjhSsUib7R/YEhPeo=
Received: from DM6PR05CA0063.namprd05.prod.outlook.com (2603:10b6:5:335::32)
 by BY5PR12MB3714.namprd12.prod.outlook.com (2603:10b6:a03:1a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15; Wed, 15 Dec
 2021 00:15:15 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::7b) by DM6PR05CA0063.outlook.office365.com
 (2603:10b6:5:335::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Wed, 15 Dec 2021 00:15:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:15:14 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:15:14 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Qiuhao Li
 <Qiuhao.Li@outlook.com>
Subject: [PATCH 40/47] hw/nvme: fix buffer overrun in nvme_changed_nslist
 (CVE-2021-3947)
Date: Tue, 14 Dec 2021 18:01:18 -0600
Message-ID: <20211215000125.378126-41-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 63cf7ae2-8ecc-4b38-8ea8-08d9bf5ff7cb
X-MS-TrafficTypeDiagnostic: BY5PR12MB3714:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB371436D1EFC29E9D6202185095769@BY5PR12MB3714.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:64;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I2Sdg/xKVCxTsjIfGLLDRahpIu0yIN/rvaGIEXQboZ62BCW1SRMvIadwhdCZgbUpkB3U3pUi4bd18ApCCOjN9d7ekGtcwJGhw342BsyMJDik7jRn4vNa6v0fJdtpWPxWV+Z4Xt0Ay3q1byWdoitGph6zpzX1cB9XkZDxALYtS4MC84vys0CwjszSNXeHYxL2D5U1G7MtctRKiBpKzhuGV/HjeZ/CXEitDLQeSwq+9FUq9wTwJiC0qzYlqgo1IahSlMqhRGyg7JtmIZ3O3MOXoFf/M+ktnnJnyRRUeuHqWlbDXX7piIZWP3bLH+FVx4tMB8m0fCuvZg87eE2RGxb5dWDZf6A8XEzy/Ik4nUd1+L8gggWckl00jm19ucwXaieEiUU8iBCvmCtiV3LZu0Ya8s8no23P04Xojkh9M7TVRXCVSJm4v1JMKDBB2Sw3FbpZjcYQtvU7EoFC+RySKmQvM5Kt+RaZyHQYZk+J4iSlJJ8iaTQ3d0DgoRhA5cRfCPK8g9R0v3+0SFg6RsHGa8ymOPa9iET65dT9I2Os1tdVQupw0TrSSSecPqumSSnDekBXyi4FR4/yBzI+bX2DAFnnppZZ9dPzLvXxb18u6vtCeDCiEHUlVpM+qM3nXcHkxWmJGr4AerLUYxNzo+4UiJpqqDnxnd3yja29AxIw3FsYApBfi5XlFQ/nzf6kiTQsfzYaUlCLiQw0VYNdi/MsvI/hIhj5xR1AtrwtPJ2tPM34wVvpjys2iNHtXyvGa735GBMdHXxNkf4oyY62TdCsgMyBMXqPEsAiF1BuxxMM5Z470DQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700001)(44832011)(186003)(1076003)(426003)(26005)(6916009)(316002)(2906002)(5660300002)(32650700002)(36860700001)(83380400001)(40460700001)(54906003)(8936002)(86362001)(70206006)(16526019)(4326008)(82310400004)(70586007)(36756003)(2616005)(336012)(8676002)(81166007)(508600001)(356005)(45080400002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:15:14.8809 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63cf7ae2-8ecc-4b38-8ea8-08d9bf5ff7cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3714
Received-SPF: softfail client-ip=40.107.101.70;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
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

From: Klaus Jensen <k.jensen@samsung.com>

Fix missing offset verification.

Cc: qemu-stable@nongnu.org
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Fixes: f432fdfa121 ("support changed namespace asynchronous event")
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
(cherry picked from commit e2c57529c9306e4c9aac75d9879f6e7699584a22)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/nvme/ctrl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 6baf9e0420..27dddb87bd 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4164,6 +4164,11 @@ static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     int i = 0;
     uint32_t nsid;
 
+    if (off >= sizeof(nslist)) {
+        trace_pci_nvme_err_invalid_log_page_offset(off, sizeof(nslist));
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
     memset(nslist, 0x0, sizeof(nslist));
     trans_len = MIN(sizeof(nslist) - off, buf_len);
 
-- 
2.25.1


