Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 901B25FF88D
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Oct 2022 07:12:26 +0200 (CEST)
Received: from localhost ([::1]:59628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojZTF-0003B9-Le
	for lists+qemu-devel@lfdr.de; Sat, 15 Oct 2022 01:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1ojZPf-00067u-Js
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 01:08:43 -0400
Received: from mail-mw2nam10on2049.outbound.protection.outlook.com
 ([40.107.94.49]:47905 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1ojZPd-0007Uz-Jg
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 01:08:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQwig5LE3qYkyH+Zs4g5Yf5AJ8bz0H1fZbOcCf2bYYtwpKXKe+SwjhAug1SyR9eOOn/SU08ZuBH3MR8XStTZVoOvUrP+WwcVgVs0dGRhbu2XsyrMZAMDpo8v/E3gnDlCJzQJN/iREu7CXIBVs9ulZR2/X43K8qBaQLdn0p49N0RpkUyrADQtUoCG515kdr/oW8BqnwbBsWZ4FVk6wkjSdT+eEbXyl4kj7uvz+BMm/gR3JLdTciO1BJME8FNUETIobT9uoVLqvZs3QrHjAUiRtXk60TpSZsZuf6x4pLPRC6PGSpLkJqGSqiKlyKCLGhI3WrEtsNWWbhJ/Bdb+imqlDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFQAI2p5Tya+5yrK89aiCN3h+euzdMm2LiqHr9x0Cpc=;
 b=FPLkwTlDlTkvAlihRWiRfBICU+tLhO+0F6BkExYesAkQSEnbsI8ylPyI9r5hGBiVTubPfTMAOWa8r8oeAf+ueju9aGV7O0nr/xeJuNYVaYJJKoM+OdrEaIJb1FcfuTQbOm2OVSvnO4hUtbsbtROne69za73mU4y1YlfINeo2IWy/s3jGshqDjrJcscB06r4R7OMucmW6QfW6iE2Ke4umaDwBdUTiFBvCg6SjmQdefiMViEm8M68YhgDjd7PrtWFC7+3uBmy2BrBa82OVvb3cbvSFOQP9vTdmEC90FyjmAeBsmRP9SmAOBK/XGB94PNKZVFbxZi1MJCIJfgE/caNkmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFQAI2p5Tya+5yrK89aiCN3h+euzdMm2LiqHr9x0Cpc=;
 b=AD/v2pdEmH3z92Go3umdS1ZwEdytJR3K6iW3Bqj0dKyF4ysAmOasTHLxNKp9dL8LMc7i8zKmH2Be1jrFPeblW4nICFcCaOn9kJhuv4eiSZuAdNrJbmHnhX2KzhJ+4vJRzh5MOq90UqAJe55Xnc25uPZqDDBd37tIYc+rwycgQLc=
Received: from DS7PR07CA0002.namprd07.prod.outlook.com (2603:10b6:5:3af::8) by
 CH2PR12MB4053.namprd12.prod.outlook.com (2603:10b6:610:7c::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.30; Sat, 15 Oct 2022 05:08:36 +0000
Received: from CY4PEPF0000B8EB.namprd05.prod.outlook.com
 (2603:10b6:5:3af:cafe::ad) by DS7PR07CA0002.outlook.office365.com
 (2603:10b6:5:3af::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Sat, 15 Oct 2022 05:08:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8EB.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.13 via Frontend Transport; Sat, 15 Oct 2022 05:08:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 15 Oct
 2022 00:08:34 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 15 Oct 2022 00:08:34 -0500
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <vikram.garhwal@amd.com>, <stefano.stabellini@amd.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>, "open list:X86 Xen CPUs"
 <xen-devel@lists.xenproject.org>
Subject: [PATCH v1 07/12] include/hw/xen/xen_common: return error from
 xen_create_ioreq_server
Date: Fri, 14 Oct 2022 22:07:45 -0700
Message-ID: <20221015050750.4185-8-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221015050750.4185-1-vikram.garhwal@amd.com>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EB:EE_|CH2PR12MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: 544ca10f-8663-44a2-6e96-08daae6b5056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g1U/jh2twbv/U7qA+o2amqNk7CbY3U65s03Lo7Wt4Tu3ZnrW5j93TtMyJ2cmy5/ErYC7x22HX5Y2VxXK507v79TIJ6qavGvvQqWPIpN1rAcSrnCOn0y4tXf3fUMED7f+0tLVILAZ6mOEKyWk+/tAyG0jrmjfaEHuZLHbpohXvltkbnwE/yKCM7yx3NmJGhtso7FPfJnJVpHSfiBn5rDnLjpXwKVb0kMxvjsFBsREpWr+0Gs0F8zGT18yP2bJ7ZfESwRCwK08K/oKKx6O5c/mDbTfLScAnTjKuEOhWGTjX/21pb15CDzijuP5SRQYjdGrwCAo38tbDYdDvHb55KuwJuljhwyzHD/L3mTXgLtJaxQ+wstHqnJ+MDopHrMZ2kE5Thff0wszVR1kLRYOMq7y+YN2Fp+I7LPGkXlJ0jAiLw8zi+yyV3e+HAjCghXrcx1Lcaxj7p+1BxgNqfEGTKfwE0fyIPyfTDOzyg1RksaaUFtI3uV9hJUe/ib4CFKRvgo7GNcNojTJnSCKpRVl1dclKoiwD2oqMiefmCI2vBq9uCwfC4sUtrGqeBSjsT4XyWCB1bh8AfN6FVJbSOzc1Y0iNsDURnvLu+MihNWtoDESTWyTupm0hL9xmnF865UU9RXV/ZayFT3GZiNV9CrFN5kZeb7g11uvwwIvm/bP4ZdNQEzNC29vAvDZQs5ygi0DLurw7cCh1do3rukBM2CWaAm8Agh/nYO657SjmJB0/9iUdYV++ndPdEsuw5u51nHfCbdsN+MEhwnMbEvpkhjpKvEsqJqMkegngXYr8AtJeuHJltSrLiGtz04gCXs+3L7gZXeJ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199015)(36840700001)(40470700004)(46966006)(86362001)(36756003)(356005)(81166007)(82740400003)(2906002)(47076005)(426003)(40460700003)(186003)(6666004)(5660300002)(40480700001)(44832011)(1076003)(26005)(2616005)(36860700001)(336012)(83380400001)(82310400005)(316002)(478600001)(4326008)(54906003)(6916009)(70206006)(70586007)(8676002)(41300700001)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 05:08:35.7203 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 544ca10f-8663-44a2-6e96-08daae6b5056
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4053
Received-SPF: softfail client-ip=40.107.94.49;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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

From: Stefano Stabellini <stefano.stabellini@amd.com>

This is done to prepare for enabling xenpv support for ARM architecture.
On ARM it is possible to have a functioning xenpv machine with only the
PV backends and no IOREQ server. If the IOREQ server creation fails,
continue to the PV backends initialization.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 include/hw/xen/xen_common.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
index 77ce17d8a4..c2d2f36bde 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_common.h
@@ -467,8 +467,8 @@ static inline void xen_unmap_pcidev(domid_t dom,
 {
 }
 
-static inline void xen_create_ioreq_server(domid_t dom,
-                                           ioservid_t *ioservid)
+static inline int xen_create_ioreq_server(domid_t dom,
+                                          ioservid_t *ioservid)
 {
 }
 
@@ -600,8 +600,8 @@ static inline void xen_unmap_pcidev(domid_t dom,
                                                   PCI_FUNC(pci_dev->devfn));
 }
 
-static inline void xen_create_ioreq_server(domid_t dom,
-                                           ioservid_t *ioservid)
+static inline int xen_create_ioreq_server(domid_t dom,
+                                          ioservid_t *ioservid)
 {
     int rc = xendevicemodel_create_ioreq_server(xen_dmod, dom,
                                                 HVM_IOREQSRV_BUFIOREQ_ATOMIC,
@@ -609,12 +609,14 @@ static inline void xen_create_ioreq_server(domid_t dom,
 
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


