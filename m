Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2BC433866
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:28:05 +0200 (CEST)
Received: from localhost ([::1]:49178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcq60-0008NB-4s
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpxI-0005ux-5V; Tue, 19 Oct 2021 10:19:04 -0400
Received: from mail-mw2nam10on2084.outbound.protection.outlook.com
 ([40.107.94.84]:24288 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpxG-0006IS-8h; Tue, 19 Oct 2021 10:19:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEfrKhEFMq2fr2LTCyT8/oS9HqCy5pkym7uUKefdFVg5dQPWAPuXB50c6O4yOFVu4H1agc3jRedovyus+Zk+mGSMkloOwhSHQbBwmHqQAuCG//jBIOMS5++3hJ5cUKKLk7wjJfpvPFVbdltY7Rc0q83plB1sPloq2Nq6lar78Tv0l1Hh1vHr0Z+QdWqLU2pLQ0r9pR1QRYGDwczmRHZXdIH/VJXFKllWW6onB/0CDQycDEVUMusOMvXbIGXSHFsbOWmPQK24J6OcNv+b8SI7aoAw2ILyr9ccBnBGRylZfwAr9rNPlX6DlHjCp5Ac7Es2/EltatPO/3j8iez/578Y+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAc2TEeXKtjBvXsZl2es0zUuJ3B9JqUDiMK5IG5cPtI=;
 b=XME0TkPzrAwUhkWSIxrIfRDnKnHpj9qMnUiscpzM5QnSLRBecc7GfFiMYy0RmsLT6kubAvMNR8f7A39SXyHZWBQ1FgN1kStwUWm/nzpQ++RG39zOxPYrm0lOvkhORSGodwaqVDK7VOlTvOvjOn9JSVrng8oT/IT9ibIZ/kq34NcbAvgSOctFACkQH9oqMXVRxNHZ2AT7BqBVqL5TbMBv4VBYELDGY4Fe9OXEcR6xWlBHT+d9sRX2URU48Fe2cGj3wJKzracOdyPJq46nS4RHxdatNLJUNchJ6hra1BjYFWnnGyZLdsmBIRKiM6S3nvrBDZJwl87qJuXpMnNEsASnFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAc2TEeXKtjBvXsZl2es0zUuJ3B9JqUDiMK5IG5cPtI=;
 b=pbg+qbbENjGODI2NMzbX/YaIZvqy0CGl4SGCH9JbAEbt/+cMsmCnFBEyW4nCBRB+2MephyGJCYJCG5M8Blft1R+JZHr4s268QxKw6HSCfhdHnY5JwZ8uQELz/D1awXUjZgWrnGqey9tNPckZjNgLI2q8bJEuWqj3Junbflv8X2c=
Received: from BN7PR06CA0070.namprd06.prod.outlook.com (2603:10b6:408:34::47)
 by CY4PR1201MB0021.namprd12.prod.outlook.com (2603:10b6:910:1a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 14:18:56 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::24) by BN7PR06CA0070.outlook.office365.com
 (2603:10b6:408:34::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Tue, 19 Oct 2021 14:18:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT056.mail.protection.outlook.com (10.13.177.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:18:56 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:18:53 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Zenghui Yu <yuzenghui@huawei.com>, Jagannathan
 Raman <jag.raman@oracle.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>
Subject: [PATCH 01/64] multi-process: Initialize variables declared with
 g_auto*
Date: Tue, 19 Oct 2021 09:08:41 -0500
Message-ID: <20211019140944.152419-2-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: f62a9f3d-8311-43e1-a211-08d9930b62e4
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0021:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB002121108425D15C63B7CD1D95BD9@CY4PR1201MB0021.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:327;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VSmORo1HSD8Km/kfBAcizBNB9a8nijOPrBq8Mv8N3prgooFeVifCNkaEoBjO10xAyyLz1MlCE5d2xuUHVHgKrt/N5PkwaXsGwApX1qHhB1V3GIH3Qfnp3nkb0b/dDMo4qfc7RC+VYF///njaccBdXtrRJegnJ1sumJDzARO02u2ZAk7nk/dM9bnPQO5aUwBdUvah5m06PpozHnqDImdqZWqtDguDPVSLMFBZdtkKqK2W3mtpydx3Zy4WZGs63uhpJpzyL4V1Bgn5RlxJeK13qW5xTUT3b7bJl0/xBcaSx+uyAw5WgNYlX8Q3EpL1AJmhuDLhkZ7pPqiRqC+NRz90AqOZiJfbD3AvDa2RAopJgE7EXslN+czvZ4l96kfGkibtarb1Um9bBKFrZ6Sx9Aq4F4iZhXg2MSYb+hxPXuGMXtBG7/CTMqIlBeBYlf6z261GdJgUV6h4Jt7Zhsj7O1SVUHULlIZYHsFInzqj7hJbZcS3FDQd998yMwILAdGmLtWzSPGXwlrjJN9wLHtXv4pC/V8t23L/5gNt1BEusNpDE+OTDWlE0/E6XOnvNywGWbzJWCIb3SeY9nppAQz5fNiYBwyQTns12f6jOxapwMKcdTYCQBqwQaaUZ7JXx7UCjMqZoFpnvSoRLZ6HCvKMrvQB+Iuq1vBVJoGhbVatd07mvQBgCgMEaEtHJMMOQFRYA7BgxnA0vphUHHEZ8axv4o9VOlbMWHTgVd4XnFzyqxGG980=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(16526019)(6916009)(26005)(186003)(86362001)(508600001)(426003)(36860700001)(316002)(4326008)(70206006)(6666004)(83380400001)(356005)(81166007)(70586007)(2616005)(2906002)(1076003)(44832011)(5660300002)(82310400003)(36756003)(54906003)(47076005)(8936002)(8676002)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:18:56.2280 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f62a9f3d-8311-43e1-a211-08d9930b62e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0021
Received-SPF: softfail client-ip=40.107.94.84;
 envelope-from=Michael.Roth@amd.com;
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

From: Zenghui Yu <yuzenghui@huawei.com>

Quote docs/devel/style.rst (section "Automatic memory deallocation"):

* Variables declared with g_auto* MUST always be initialized,
  otherwise the cleanup function will use uninitialized stack memory

Initialize @name properly to get rid of the compilation error (using
gcc-7.3.0 on CentOS):

../hw/remote/proxy.c: In function 'pci_proxy_dev_realize':
/usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: 'name' may be used uninitialized in this function [-Werror=maybe-uninitialized]
   g_free (*pp);
   ^~~~~~~~~~~~
../hw/remote/proxy.c:350:30: note: 'name' was declared here
             g_autofree char *name;
                              ^~~~

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>
Message-id: 20210312112143.1369-1-yuzenghui@huawei.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
(cherry picked from commit d90226808b5b1b30b07968e94d8f74bf8804fc89)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/remote/memory.c | 5 ++---
 hw/remote/proxy.c  | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/remote/memory.c b/hw/remote/memory.c
index 32085b1e05..d97947d4b8 100644
--- a/hw/remote/memory.c
+++ b/hw/remote/memory.c
@@ -42,10 +42,9 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
 
     remote_sysmem_reset();
 
-    for (region = 0; region < msg->num_fds; region++) {
-        g_autofree char *name;
+    for (region = 0; region < msg->num_fds; region++, suffix++) {
+        g_autofree char *name = g_strdup_printf("remote-mem-%u", suffix);
         subregion = g_new(MemoryRegion, 1);
-        name = g_strdup_printf("remote-mem-%u", suffix++);
         memory_region_init_ram_from_fd(subregion, NULL,
                                        name, sysmem_info->sizes[region],
                                        true, msg->fds[region],
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 4fa4be079d..6dda705fc2 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -347,13 +347,12 @@ static void probe_pci_info(PCIDevice *dev, Error **errp)
                    PCI_BASE_ADDRESS_SPACE_IO : PCI_BASE_ADDRESS_SPACE_MEMORY;
 
         if (size) {
-            g_autofree char *name;
+            g_autofree char *name = g_strdup_printf("bar-region-%d", i);
             pdev->region[i].dev = pdev;
             pdev->region[i].present = true;
             if (type == PCI_BASE_ADDRESS_SPACE_MEMORY) {
                 pdev->region[i].memory = true;
             }
-            name = g_strdup_printf("bar-region-%d", i);
             memory_region_init_io(&pdev->region[i].mr, OBJECT(pdev),
                                   &proxy_mr_ops, &pdev->region[i],
                                   name, size);
-- 
2.25.1


