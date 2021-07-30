Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9773DC182
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 01:18:32 +0200 (CEST)
Received: from localhost ([::1]:37084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9blv-000879-Ts
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 19:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m9bkc-0006U9-Ad; Fri, 30 Jul 2021 19:17:10 -0400
Received: from mail-dm6nam08on2074.outbound.protection.outlook.com
 ([40.107.102.74]:60320 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1m9bkZ-0006lB-Le; Fri, 30 Jul 2021 19:17:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qbw/bDY/PK3HEZnUMqDMlMe9NlHozt/msLgsvgxRTfi2PJZN0eRLkAI28ZEp+SgETTht0u2vYjns+Me/QFtrhCpMEPUCMcQYFJw57bygCWtfYFA7wGYynRsqMbnjn8VdBRBwFSAvkxt1Na4wYESxPPBZnUdkqbDSQppsvKjy0faMBvleLYUJPCs35b/HUJ1eTMqDe20rHIde9JqXWDaFfWmoR98st+BSPz2V7FkVomSaAu3Hsq/S4/hMKmPcQlSjfjy/bylmrPtBbTPDcujukkq5UL/cH9eiqOpXkWZJ1eTagzflYDRXWDiOBuqb4cxy1S6hHSRU1/LN7BSTeyHXgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e952KW0u9fXNjcG4KgcdRmH5H3K5ZTf0b0dKezQT3PE=;
 b=UYATay2ENj9d0Uo1JYHVqZTRLJLELNIoIRBXzXibzsT3yhxk1L82BCiUwkVifvB/MCAdEd18zJciueDHuqODlTSYxyHiXMB9QkrWZyS51/VeMUax3/nT9bsicw+v8omftY0EfnLezn+57KNt5Wyqr8e7rLE1Esb+sR010VqY340IaYj4GnySBwEhw81JUjJG/KeiD+jbgAuC5YGQNv+YQhP30k2rz0/JBCA37S1pAPdzKZh8NOoYYjTspyQ6yiYZN+inVn5Hm/pZDZ9xudqwNgIyW110GvIkko1b8GsxaxHixXyYy/XTYwd0XXqyu4p7xV8KMMrOed+Er5Snjv92Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e952KW0u9fXNjcG4KgcdRmH5H3K5ZTf0b0dKezQT3PE=;
 b=LkGS2RYCRMo9dB9tsDDIHL0aEOcv+tn3psnRGDYn3qJOOgmXADuCekeGVbTpc/B4c1wUGC9ISZtlt5G0cebps5y5OK3ThYvhzKfe42CaO930Zyx74C9kcCjMDEP3bi1MmVddgudbtCtnhDjBXsWiDRvH7U9Wu27USHhpR6jOwzU=
Received: from SA0PR11CA0067.namprd11.prod.outlook.com (2603:10b6:806:d2::12)
 by DM6PR02MB5993.namprd02.prod.outlook.com (2603:10b6:5:156::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Fri, 30 Jul
 2021 23:17:03 +0000
Received: from SN1NAM02FT0044.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d2:cafe::bf) by SA0PR11CA0067.outlook.office365.com
 (2603:10b6:806:d2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Fri, 30 Jul 2021 23:17:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0044.mail.protection.outlook.com (10.97.5.46) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 23:17:03 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Jul 2021 16:17:02 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 30 Jul 2021 16:17:02 -0700
Received: from [172.19.2.32] (port=36936 helo=xsjkomlodi50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <joe.komlodi@xilinx.com>)
 id 1m9bkU-0006F4-Ov; Fri, 30 Jul 2021 16:17:02 -0700
From: Joe Komlodi <joe.komlodi@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 0/1] hw/arm/smmu: Add access flag handling
Date: Fri, 30 Jul 2021 16:17:01 -0700
Message-ID: <1627687022-366528-1-git-send-email-joe.komlodi@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32ca90d5-40aa-4e95-086a-08d953b02415
X-MS-TrafficTypeDiagnostic: DM6PR02MB5993:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5993D2C68405D2345B208131D0EC9@DM6PR02MB5993.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ud4sXgsSdfNqDLlYdP/hukPerBszBZr0J2i9QXK3eCbnu6fsGskvYRaJznKX5tW53CXqCxaHhQ+A7xX+3MM6UFhMRN+3cpm2oiW9os7K+RCTz9YDOUUs4eOCsizxre4KHGyqNllp9lATDiNncg2e8T3PUMsWn9+hHr0Tb2K5+OfG3CyRj7VHgypU8IjJul8yj/LJfYWjYqGO8iF67YDuu2+hi5WxQPMOOe9k8cUGwZ611aPsBMOjCqIt71HmJKSNZkJlRzrTlu0t/y8s86vUuqjMFd/jYyr2HQWgzK4Of8yGc2Q4VPY6QdMNjd8QjIT2jVZhYjs4rHZLr293koifwqhB6zyiWLEfiUhP2hBs+Hi81XH6F1hAybj77UfuIpHVT/lfUOAdkmrCtltJzR1eqDLveqegrHHyjR3zQLO//+07mheRlOM0BZP4D0v23auGw8skZXr4ydgWBlhqySu2hMBwWrZscQD6XfoKDWBc6wyTdClWSebx6BOqekNCfTM+HkktCaLGCK22GXcaP4UQW53wfTN3qfKuxiQEP61hHKQ+hUnn3Wg+lP8SewepXe47qzMjTQLz3dR6Sbx3T9WIMimGEN3x62b2YfHBQz2jfrb9S8m4HbGoklis+U9igX8ZX15N7zRZR3bOoCgdT9CXtRkrV7m9I1cEbZP1gJMvLhyGmTQ45nfRbkIA3dKaOSoC3+gKw1haOeWGD1UZOI1WwBkNaMoVBUJYDeyw7zZns7M=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39850400004)(36840700001)(46966006)(47076005)(36756003)(5660300002)(6916009)(82310400003)(7696005)(4326008)(4744005)(356005)(82740400003)(8936002)(44832011)(54906003)(9786002)(316002)(7636003)(2906002)(70206006)(70586007)(86362001)(36906005)(26005)(426003)(478600001)(2616005)(186003)(83380400001)(8676002)(36860700001)(336012)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 23:17:03.3543 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ca90d5-40aa-4e95-086a-08d953b02415
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0044.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5993
Received-SPF: pass client-ip=40.107.102.74; envelope-from=komlodi@xilinx.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This adds a check in SMMU PTW to see if the access flag bit is set in a PTE, and
if we should fault accordingly or not.

Since we do not support HTTU, the check itself is pretty simple:
If AFFD == 0 in the context descriptor and AF == 0 in the PTE, we fault.
Otherwise, we do not have an access fault.

Thanks!
Joe

Joe Komlodi (1):
  hw/arm/smmu: Add access flag handling

 hw/arm/smmu-common.c         | 7 +++++++
 hw/arm/smmu-internal.h       | 8 ++++++++
 hw/arm/smmuv3-internal.h     | 1 +
 hw/arm/smmuv3.c              | 1 +
 include/hw/arm/smmu-common.h | 1 +
 5 files changed, 18 insertions(+)

-- 
2.7.4


