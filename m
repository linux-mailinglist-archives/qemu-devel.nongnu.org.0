Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB586DE78A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 00:50:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmMmV-0006WZ-M3; Tue, 11 Apr 2023 18:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pmMmT-0006WM-PB
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 18:48:05 -0400
Received: from mail-mw2nam10on20624.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::624]
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pmMmR-0006YP-Sa
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 18:48:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YD2Sjvqw1aiCb/5kve5wM4Bz/reAjtkCRm1Bz1PzaJAg3ac3PjndSuNORPqR4weXADEWEJAK1GLDKJJEhNmAbCj3VAuq6azfHDLcnHvQ3bEHjRo1GPdUESOsak21BurEHu6eCJa/IXMjpDBep4prig6MZOYPlRJg7qg4PTGbLARsYYzTXUshn5yH8vLBvxr23vvGUIhHcQJ1n2XF8TpAVF52pR8e9PeucwlHOB55FumD7xaKzGpB3uQg40NriAGF3DD/BRnS+sD9PqNdWLlwczTxbQzB/T+CXw4lVHncO8UzTyqV/UoAa5mvMHtNkkL7lc/xmfVao06e/WMgPJCfVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMxXRBFxRmkD0pWrYu+sj44qnNzbURauoioUBy1Lo+4=;
 b=U5KMC9g4P5MHtmS6GLiha1q6hKu1eSxJ7jtVF4QwVignsYxpiZg6aAsTkNP+RRylwFHJr3uw8dqov33uroCaTrU/tktbRSL5Q67b924H5me+1YK6EXHRyLBq99SQMXHmkWMxx82JqBJAOH8crsa4aw2j5bNtWQIbSCsoEBZt5dfVvmTZAbP4zLEwv1nwFVpXGYWALqaX4Rn5GSOmI5NIFrSpGz13F5eQcM75i4PCyo+HAw+m+hYwfAqHmrNcfDxqzsDDlAIfYUACMdT6Vh+l5GIK/vRfgB6/w60UFGJ3q+h9jX1okXLkmg8oW6jCiogC1yIxkI5aRYIbp2j3yqlCfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMxXRBFxRmkD0pWrYu+sj44qnNzbURauoioUBy1Lo+4=;
 b=yUBAoDuJqmaZVGyBnfL0Dq0J48SosZrNjzgJXHQW/TYeQ8TQO32JpJZzh6CsduofqeSGBWCdNwTaadZ2gRiSTRn0CSPm72YgZt4lTZ8K/eFqolMBLX7ifoVKmceSouuJ4ET5HynkrbMW1LtBUpTZ99Zz659z6+tIrIBw3yhMAuk=
Received: from DM6PR07CA0127.namprd07.prod.outlook.com (2603:10b6:5:330::28)
 by SJ2PR12MB8064.namprd12.prod.outlook.com (2603:10b6:a03:4cc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 22:48:00 +0000
Received: from DS1PEPF0000E64E.namprd02.prod.outlook.com
 (2603:10b6:5:330:cafe::b3) by DM6PR07CA0127.outlook.office365.com
 (2603:10b6:5:330::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35 via Frontend
 Transport; Tue, 11 Apr 2023 22:47:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E64E.mail.protection.outlook.com (10.167.18.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Tue, 11 Apr 2023 22:47:59 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 17:47:58 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 15:47:58 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 17:47:57 -0500
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
 <stefano.stabellini@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: [QEMU][PATCH v6 05/10] include/hw/xen/xen_common: return error from
 xen_create_ioreq_server
Date: Tue, 11 Apr 2023 15:47:41 -0700
Message-ID: <20230411224746.16152-6-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411224746.16152-1-vikram.garhwal@amd.com>
References: <20230411224746.16152-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E64E:EE_|SJ2PR12MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: afb312bc-de3f-4ebc-60d9-08db3adecc92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: obenWLWhq6bdrYeodulUvswme8fWEcMGn7qxPqRobjL/QaGgmCOIsSUGuNOX02ssYXN/5TsJ59VzleK+FoDZlUpoSiiO1j0uaDOvyRk+Ts3eg3Oy5n7dC1Ip0QgPN5x1FrWc/9UempJCZQZILuDo4vKo+OZElGTVaYJ7Mz8UKW5ib720tn6PHf9qe6MXfojbwJbzYQ46MW5SyyU+xdhrcbMcq8o6IomAs+nRwI/FjqMp825ujie3MMSWrrLfv2YjDdAoljykKkzDxlTWWGWAiYgAuKOwBBqp0K2anabLPQmUr3IOIP6TRpoPIqEvDuLE+ryPKxLaVBNXAoiV90x3xiy5dEpn9qN9ZQcBJB3mqOMucgF1/enNNjPafIvixZP3FUgO3t9umkr2IevaAh3pJeajfPhjDUMDyZHJbQBIEnYgxKBxngZ5kVoNzGAGai+g91IYXsmufLrvpAt7h42FkBOQbvd9hRNam/zWRRCPYV5sp5XT+9B1pTRa8aR3nBcvOWyzHcjBSS4Mi8umgWv8eTZ4CMfdmZ3UAcSCXIhPrPrqlvI5BpMjcXPEAAq81uL4SKFbId7kqouT4uS/VH0ExKbElvX2mUy2Djw4Rh0JE/aXLPpelx6g3Dpj1Zny+gFQQ2uQfvxCJ5eGD7BHcucddBTm0zyUIbzOhq8l4Hv3lHMtXUCEOfMNy8UDJHOpxtqpRwD3b6tjcadMwykfSQhKvRIv+nawL5i9dsoocwqV6vM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199021)(36840700001)(40470700004)(46966006)(36756003)(86362001)(41300700001)(316002)(478600001)(70206006)(4326008)(8676002)(6916009)(70586007)(54906003)(40480700001)(36860700001)(5660300002)(82310400005)(2906002)(44832011)(8936002)(81166007)(47076005)(82740400003)(356005)(186003)(6666004)(26005)(1076003)(2616005)(426003)(336012)(83380400001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 22:47:59.1727 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afb312bc-de3f-4ebc-60d9-08db3adecc92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E64E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8064
Received-SPF: softfail client-ip=2a01:111:f400:7e89::624;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefano Stabellini <stefano.stabellini@amd.com>

This is done to prepare for enabling xenpv support for ARM architecture.
On ARM it is possible to have a functioning xenpv machine with only the
PV backends and no IOREQ server. If the IOREQ server creation fails,
continue to the PV backends initialization.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 include/hw/xen/xen_native.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/hw/xen/xen_native.h b/include/hw/xen/xen_native.h
index 6bcc83baf9..8b01b071e5 100644
--- a/include/hw/xen/xen_native.h
+++ b/include/hw/xen/xen_native.h
@@ -433,9 +433,10 @@ static inline void xen_unmap_pcidev(domid_t dom,
 {
 }
 
-static inline void xen_create_ioreq_server(domid_t dom,
-                                           ioservid_t *ioservid)
+static inline int xen_create_ioreq_server(domid_t dom,
+                                          ioservid_t *ioservid)
 {
+    return 0;
 }
 
 static inline void xen_destroy_ioreq_server(domid_t dom,
@@ -566,8 +567,8 @@ static inline void xen_unmap_pcidev(domid_t dom,
                                                   PCI_FUNC(pci_dev->devfn));
 }
 
-static inline void xen_create_ioreq_server(domid_t dom,
-                                           ioservid_t *ioservid)
+static inline int xen_create_ioreq_server(domid_t dom,
+                                          ioservid_t *ioservid)
 {
     int rc = xendevicemodel_create_ioreq_server(xen_dmod, dom,
                                                 HVM_IOREQSRV_BUFIOREQ_ATOMIC,
@@ -575,12 +576,14 @@ static inline void xen_create_ioreq_server(domid_t dom,
 
     if (rc == 0) {
         trace_xen_ioreq_server_create(*ioservid);
-        return;
+        return rc;
     }
 
     *ioservid = 0;
     use_default_ioreq_server = true;
     trace_xen_default_ioreq_server();
+
+    return rc;
 }
 
 static inline void xen_destroy_ioreq_server(domid_t dom,
-- 
2.17.0


