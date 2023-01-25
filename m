Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A2467ACB2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 09:45:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKbOx-0002FC-Or; Wed, 25 Jan 2023 03:45:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pKbOw-0002F3-2o
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:45:02 -0500
Received: from mail-bn8nam12on2040.outbound.protection.outlook.com
 ([40.107.237.40] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1pKbOu-0007pQ-8Y
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 03:45:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9kgrq0J9pbxL/AyOVO121qVFYZ063IgjxO6MYfS8kZ6I2xzzo/0TaHpOuOMHbMREsM0IVSNP2YKU9Quf7Lgxhycx8qQMIjpIzRHtyl4SlNFIPXTUZ8uNOScIrJqQHvhyiprZZdLglOuatXv8FBfoOaKzGOZHv52Apt3OnV/TV8OjV3OsokUI3bndiiUuxr2bnEYFPIea98VaTXdCwbFBjVGsiCt1L8aVd6F6wJuO2Ofz8jEwQib6JBpGZFbFTgvwbhBMQZxy9NPO/3yz/AbvuB/EDxMct2hNEO8F6CghH7AY05L0519JhbGJlouh/ifoHsf5Pd8KLPljQuTPvP0Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpZAZyFrLxyZiJ9zE+SxaljhwMZQFl/Jyy62XvsgXdo=;
 b=Nu/nQPJqzmo1eOYxI4nu9mgpcDlCoydMlgtvQroZyasqkyVIkEFbsfQ7nR20+WRJvShDWgGQ8Ls/UKSs9MTPHeHNiWetulM6XqBPU5D8neSi0gCHb2xqxTSwjv9kDHOQVG5ZQ36EqojdYvD7UpNtAOBiyAxhW/jdPDVJskHhtx50+cj0v+AFmROecZmhbeJG4FD2uz/L+IVT7R6j7jaGRPcKufRoHMWsVvmJS4K5efay9TQx8aza0Cl051m22JWFodbHnEtNdgOzW5UPqEtAG80jRVhBpRgxh4R5Fcdnmt0sp4RghtKHWpJImuVtl+Vh+fauQq3EDUrtZlGmZDYNHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpZAZyFrLxyZiJ9zE+SxaljhwMZQFl/Jyy62XvsgXdo=;
 b=xalL8quzwxceQL9a2kWLO96cnp50A6Q1b60MtG9yC+7hULPHxQ+X4Sxqe3Fp30N0agvViACnNq2sEtYQQ0VOpkbM+71chf40QrxV81G0RHz480Ina1HmG3jj8hSgyHar7EO/VLpLanU72n2AnV1o43XVPOFNh2n2iTWgtbNlJLw=
Received: from DM6PR02CA0162.namprd02.prod.outlook.com (2603:10b6:5:332::29)
 by MW3PR12MB4554.namprd12.prod.outlook.com (2603:10b6:303:55::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 08:44:56 +0000
Received: from DM6NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::67) by DM6PR02CA0162.outlook.office365.com
 (2603:10b6:5:332::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 08:44:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT076.mail.protection.outlook.com (10.13.173.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 08:44:56 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:44:56 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:44:55 -0600
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
 <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>
Subject: [QEMU][PATCH v3 05/10] include/hw/xen/xen_common: return error from
 xen_create_ioreq_server
Date: Wed, 25 Jan 2023 00:43:51 -0800
Message-ID: <20230125084356.6684-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125084356.6684-1-vikram.garhwal@amd.com>
References: <20230125084356.6684-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT076:EE_|MW3PR12MB4554:EE_
X-MS-Office365-Filtering-Correlation-Id: de517362-066b-4f42-431b-08dafeb06fa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rI9Qh+RwFGOxbzWR/uj2h9k4uG4aM+W8gkP4KqlVZzBguMBTbmjS/SgKx53lJkvCF81NOiouIz/7/52Kqbx6za9OW/KjfXm3uKfk+BOPMrZpxRv0QO9ITObQ2Hie7t5MQ2NVm/QaiP2tVNUdYYJCXOQgOd0XVUAvkaonqqS19plnDqJxwXau6j/4kLiasmHUTke3IFsamv0pZ/9EYOj78fmptHfY9hkghgRayg27lGYXqluiXLqPJuBBAfIipvRCFAADZbRsRNWyU7OhyvXEnp8u5cLZgV+Rq+n+S6SXJ7yrgI3+a7zCpC/MtmXvAxJas2wCunEGbRXY6UKnhelIkKfzF43KZitdSR434hK0rfkWkAbgDVhC1Y4UhkW+GEEQqMiN8upahGYzTkep2/A48e1mw2Os0TVQEHMf/CJJ/GGO73ji9SFcQxTuzebmrNH9C5XBc5c6bKRG6SgHBfJVi6JWBAgGpMZYJl+zzZumUqlPcDilPyptxFffxWKqWmIybwmMEDWW3bYox/IiswBRyOHC5wVap0lEw+YWMZUUCzNrKKG5958UQ+o2eqPKeSOL365vu0laht0JDVunb1i7ZQJ2N8EnDmfrxeB7iPjPVR2hGy1hQB5FsjJSwk8vQpralMC6neW4akmfTTJEGtlKojxT2C0gWu26jICmFYUtx8JA/lRlaEGPgbbkq5IJ0aTTLgw8RwW9uClFMz62HwQ5R/c4LHDG2m4I2+aDR9pPeTI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199018)(36840700001)(40470700004)(46966006)(44832011)(82740400003)(86362001)(40460700003)(356005)(81166007)(36756003)(2906002)(82310400005)(41300700001)(2616005)(6666004)(186003)(47076005)(8936002)(478600001)(6916009)(8676002)(70586007)(70206006)(4326008)(5660300002)(83380400001)(40480700001)(36860700001)(336012)(316002)(26005)(1076003)(54906003)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:44:56.6103 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de517362-066b-4f42-431b-08dafeb06fa1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4554
Received-SPF: softfail client-ip=40.107.237.40;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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


