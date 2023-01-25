Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C0867ACE7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 09:56:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKbYU-0003sd-KY; Wed, 25 Jan 2023 03:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pKbYS-0003ro-Fh
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:54:52 -0500
Received: from mail-mw2nam12on2045.outbound.protection.outlook.com
 ([40.107.244.45] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pKbYP-00011T-Uz
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:54:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2gE/67T9fTJ1cEkhDxG5gATfKNecs7kxqzcMDdzBpwc41+N5hEJqTowHUXPQOLbGvE8jka+NiQBCQnDV/r5zrvDgGn0jhLhQq7fnppRwPbGqllyMrEsajoJXafc9OR80sZGCEBcMlqLmu/eEeSkPZyYT5sUxCC+/iePrEwvKWvNZ2bncMcXMJIhZqAS9/wyVog6soGV1OjBtA47xkllFzq0UHJ01m0zVwxG+XliecPKIDQnwI71aylVW3GLKrBsKzniFyggdCNbHJ6ESA8T6pTXRrlXf0z2p5xEpg5khysd+3KCWs4bFGtUjiiYFJc8gaw8D2L7vJaYUr8jxF8CpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpZAZyFrLxyZiJ9zE+SxaljhwMZQFl/Jyy62XvsgXdo=;
 b=CG14mV1q7sGZmZuPMZ9TvNQ/d7Ta0ljhIFmZVpfAMRjDcaKmWXmSQJmbH+p9p4d/6So7GYi3VsIBPaSQQ57MUT0hpe0e4eqh6hoimhFY3ZwvIe/DLybYGGYaZhpFj63xo5qritGnNLh54fif09iBOBTEdQEIgcPuCgG1AcS4J9cYZbqCudg38H9eKF9Wvae81T5FzOh/SzKc8hE3MnkR2+htGDbyt3c7NJWFCt17JbMPEFrctjQ56s9g1t4RRkdjG7ua8l8TjWM69k6KmLEFhpO6kalGWZ72pRZymrdIeYcaUWfE/DBqM6mla8EuG3fbzQwLothXAIj2wUWjLNYdLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpZAZyFrLxyZiJ9zE+SxaljhwMZQFl/Jyy62XvsgXdo=;
 b=L3FKMqOVPcHZSXue9H/8xKIAm8ferRL25jkgj29YN76TH8QskBNEZaUdtUJAAPm01hW2WrmbzcEgLY1PSU3w2uCzbfO1z1IV0s7Q71r52DT7HAFGbZb+4eZmgqRsQf9aPF8FmlontKBtCaFXTzovJUyH8tgze0B2y3LvbmucEUs=
Received: from DM6PR03CA0039.namprd03.prod.outlook.com (2603:10b6:5:100::16)
 by DS0PR12MB8573.namprd12.prod.outlook.com (2603:10b6:8:162::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 08:54:43 +0000
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::b6) by DM6PR03CA0039.outlook.office365.com
 (2603:10b6:5:100::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 08:54:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT012.mail.protection.outlook.com (10.13.173.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Wed, 25 Jan 2023 08:54:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:54:41 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:54:40 -0600
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
 <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>
Subject: [QEMU][PATCH v4 05/10] include/hw/xen/xen_common: return error from
 xen_create_ioreq_server
Date: Wed, 25 Jan 2023 00:54:02 -0800
Message-ID: <20230125085407.7144-6-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125085407.7144-1-vikram.garhwal@amd.com>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT012:EE_|DS0PR12MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1a4c42-ae34-4c40-956d-08dafeb1ccdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RJSy8LqXs5hc5dPAm+Bi+j2GGmtE5eY+BRLAHGAkWPCzjbmoSMKGMyUBUlP1AjJkTOrT+xTQ5qLY/i3m/ZQJhoA7t5NNYmX4zzFi06K1TbInjN9TAUFxcMTYqllKpUwBwaHNKWLI1ln5wiEMFjVmBIHQtNUBJ1wJYHE8HXqfLeS0iG2ZI2X/5Hj95pDFbtihMr/caDJbPsBsnD69mgi2AaIlow6xPdkGzEISuFN3PB5hPYP+kS0Ld2nUv0qhdNPMUzexEEALbVVZz/IiToGkiGQHogGQGFg5fdNhD9I6euvZogPS25NVjfpFcQKIckhf+bBNAdgoBFM03ABAtYsaAGzro3hkpVr/WajRsZLDEZCxwvae9kDCMgL1Vo+zmP6POZiACWP4rLpRBGAV+cUpC84XYWMsQQLtrZyV/lHEaZcDeRvwcX0S7y+fLIFjAXsKlQsp34mi2SX9GCG52LU6LCXJmcPEqw8eCJGwz++W/V2P0KKQEu5YdQMm0qRnuyKqcWO18WBtAx1zJdmMqeieCIXQVRrD/GyG03eMBONh/QnqRDfNelNTKNFmiPf+sF1rOjoCQcfm5Ux52cNs1ExjyeMl8TkPd3ymKvPO8pXUanNtX7E95GIJaa4nDjozr3f9V8+rkdZ5Tz9ze6yDrdMQQp+t/Og/YGk6D9r42DSH5ge5qvijfvRfBlOwKcyoVYqzwYoYoG6Wd+d4lO1HNNe9MZ4+aw117VJPqkbi2r5JOLE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(36860700001)(81166007)(82740400003)(83380400001)(26005)(426003)(47076005)(40460700003)(186003)(336012)(2616005)(356005)(478600001)(316002)(54906003)(36756003)(6666004)(6916009)(70586007)(4326008)(44832011)(70206006)(8676002)(86362001)(5660300002)(8936002)(40480700001)(2906002)(1076003)(41300700001)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:54:42.5174 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1a4c42-ae34-4c40-956d-08dafeb1ccdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8573
Received-SPF: softfail client-ip=40.107.244.45;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefano Stabellini <stefano.stabellini@amd.com>

This is done to prepare for enabling xenpv support for ARM architecture.
On ARM it is possible to have a functioning xenpv machine with only the
PV backends and no IOREQ server. If the IOREQ server creation fails,
continue to the PV backends initialization.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 include/hw/xen/xen_common.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
index 9a13a756ae..9ec69582b3 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_common.h
@@ -467,9 +467,10 @@ static inline void xen_unmap_pcidev(domid_t dom,
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
@@ -600,8 +601,8 @@ static inline void xen_unmap_pcidev(domid_t dom,
                                                   PCI_FUNC(pci_dev->devfn));
 }
 
-static inline void xen_create_ioreq_server(domid_t dom,
-                                           ioservid_t *ioservid)
+static inline int xen_create_ioreq_server(domid_t dom,
+                                          ioservid_t *ioservid)
 {
     int rc = xendevicemodel_create_ioreq_server(xen_dmod, dom,
                                                 HVM_IOREQSRV_BUFIOREQ_ATOMIC,
@@ -609,12 +610,14 @@ static inline void xen_create_ioreq_server(domid_t dom,
 
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


