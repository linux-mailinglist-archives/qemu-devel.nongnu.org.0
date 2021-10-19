Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0511E433937
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:50:02 +0200 (CEST)
Received: from localhost ([::1]:41952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqRE-0008Kw-VQ
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpzh-0000vN-9I; Tue, 19 Oct 2021 10:21:33 -0400
Received: from mail-bn7nam10on2087.outbound.protection.outlook.com
 ([40.107.92.87]:59866 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcpzd-0000Nm-LP; Tue, 19 Oct 2021 10:21:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwOIJsiiaa9h8TyLebUFFUu9gh0TGZ6LpG3MQthPfgOk+Da0s3O7Rc48PFUl9/tGvdU2eWe0H3w1hOEtD8RFORpvDxkjTX0sBK0K9MCQcLmJBiMqEgSEmWllRv8FlsD73g4mc6epyIZXvdUr6Hw9Yl3b7zip629XZ7IUMwmWUHWNaCpHn8c1FKq6hXorkYR18fwUexi9YFuirio4HWzOXaWBbixsDaF9owoJCyk8iJZHXYKI8Ec39IxMbt+USX/RF5nrmrpJFyVQ3nE+QD/O032yyBJxBhtl8draX+Fgn/7Yn7ToBMXRJX2do8DLkmnt+T+A5ELDBFCN0YJyVjm9Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oq47jCFkM7nmodGDlsgIICzRgNdpTJfQuG4AUjEk+CI=;
 b=ZvkRVh++ZdCIYvOJLCx36asqmoVWzUJ6Ic+Uq2Eu5gS3mokk+34J8suYXMD9I3f6aal12bC2fE9HWezuxJyU6vyCvBwphamb7FcW7PzK//IP0u8p0+77ObyWZPFhjxbk8eEsAsn5ihfKKd04fS/kwEmWfLTLntu1PViS9XrFSV7rDITIsRybhSN+tGfdYfI6AT1ILKTmeECGPNdXDNRkpigJOJJ3oTNWmU79pYoyTfYR4CltSAC4ie3DNqQNGnCZsC/vI4Pl+SxcwxWdJeRMqxKhubiZpAHf3iY/3oTQVekRYjNEUHzoachO/RdHGvr/qg5325J2242DR3aSL8ltdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oq47jCFkM7nmodGDlsgIICzRgNdpTJfQuG4AUjEk+CI=;
 b=cjAaoo8XiaSHzuI0vu5cqgRWeHBeFn2j1lXVc8+kE1MDcetWdnzaGYWL03rD9G5WglpdA2RLvY0aPs2MUVnyw1sSawrnU6CZnX7lDfsWUpWsOHETm1nZRpjX/dv9k26PS3T+WP+nw9wcP7a5Lz45kSDCC0Mk9mNzAyUJs+kIPTc=
Received: from DM5PR12CA0022.namprd12.prod.outlook.com (2603:10b6:4:1::32) by
 MN2PR12MB3087.namprd12.prod.outlook.com (2603:10b6:208:d2::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Tue, 19 Oct 2021 14:21:25 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:1:cafe::78) by DM5PR12CA0022.outlook.office365.com
 (2603:10b6:4:1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Tue, 19 Oct 2021 14:21:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:21:25 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:21:24 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Fam Zheng <fam@euphon.net>, Maxim Levitsky
 <mlevitsk@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?Michal=20Pr=C3=ADvozn=C3=ADk?= <mprivozn@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 27/64] block/nvme: Fix VFIO_MAP_DMA failed: No space left on
 device
Date: Tue, 19 Oct 2021 09:09:07 -0500
Message-ID: <20211019140944.152419-28-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 93ea81d2-d3ea-453d-0c84-08d9930bbbbb
X-MS-TrafficTypeDiagnostic: MN2PR12MB3087:
X-Microsoft-Antispam-PRVS: <MN2PR12MB308706ED8A980153C88AC7B595BD9@MN2PR12MB3087.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:151;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ovJB/Bf97UFv3Be3ag6zwnqk5f++QWwUzs2yoaH+KqDJUDpg57/wj2mY1iRNymfTmkmxb2QLaBL34vptiPd49fntzMPzIF9g6okn3Z0qDFRh4gg3bafMYa1elnk7YhxNfDo4UeXTV2ZCLik1ce+YJ1489PxQvQ94eQPmbOdfgmp5ajsWKoRQW5NwRHcjM4TuClR7LY2YKEe6eu5nuZl6ygqDUq6sdxdCEmf10dCATgj/0iF6nPaGwvULMH4QQ2mmpD7dLVaF6x+pyFRF/y3vgbhviIjqgTUTVZEBrYxvMYqDrhBuPVFppknqzAQYwiBNDMN2jOdhKylFC1q/C87gh6GAyb/DAUw5dLgDNDGXAQvETmj1T8e3CFBGCgamBbkJWz7fLNXN9XXFb/Ndr2Y1OKG0/RLRMMaYVVsggmZSdWihzmzaShxv+MpYewSKbX/hDChkpuJcfTDd+Ow3UjQEfc6cMjwrI8f4AYWeyLlNYWKcrX89OYOWbs4rzsEQgzOiFYFtvHFw/ik3QZCZ0bSTrioUVIViA+pr+XjMFMupdPfozARHw7MnIxZ/DSm3oef/6ysr+bQZlguZa1e7hToq0FckMnlZB0h5Ft4xJRUiWakXBzzTUM5ZWC4oXVt5UznH7SFDqtwK87O+eVetmIgCqtzXSBxQ7/U5fRscYBj6jRqLi9fjFWXDid6Os8NVcMZrmlfTiNxvweFt5TC1wg8EhRTz5+tIzHcC54UjojFulF2+5p/u0dm427kyaHX5Osf/KzKr3mMFB+jD+DUvR2mES2mlQdRohHuEkqvj/8YBy6HbZra3MCs2iEMNkNSZ61S/ND0rXBP5p9jzQ6zLh3QJ3zBhWyxzdOUhS6OZTeRdCW0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(81166007)(66574015)(2616005)(6666004)(356005)(47076005)(6916009)(4326008)(83380400001)(426003)(5660300002)(966005)(8676002)(508600001)(36756003)(86362001)(16526019)(336012)(26005)(186003)(44832011)(36860700001)(54906003)(1076003)(2906002)(70206006)(82310400003)(8936002)(316002)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:21:25.2347 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ea81d2-d3ea-453d-0c84-08d9930bbbbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3087
Received-SPF: softfail client-ip=40.107.92.87;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

When the NVMe block driver was introduced (see commit bdd6a90a9e5,
January 2018), Linux VFIO_IOMMU_MAP_DMA ioctl was only returning
-ENOMEM in case of error. The driver was correctly handling the
error path to recycle its volatile IOVA mappings.

To fix CVE-2019-3882, Linux commit 492855939bdb ("vfio/type1: Limit
DMA mappings per container", April 2019) added the -ENOSPC error to
signal the user exhausted the DMA mappings available for a container.

The block driver started to mis-behave:

  qemu-system-x86_64: VFIO_MAP_DMA failed: No space left on device
  (qemu)
  (qemu) info status
  VM status: paused (io-error)
  (qemu) c
  VFIO_MAP_DMA failed: No space left on device
  (qemu) c
  VFIO_MAP_DMA failed: No space left on device

(The VM is not resumable from here, hence stuck.)

Fix by handling the new -ENOSPC error (when DMA mappings are
exhausted) without any distinction to the current -ENOMEM error,
so we don't change the behavior on old kernels where the CVE-2019-3882
fix is not present.

An easy way to reproduce this bug is to restrict the DMA mapping
limit (65535 by default) when loading the VFIO IOMMU module:

  # modprobe vfio_iommu_type1 dma_entry_limit=666

Cc: qemu-stable@nongnu.org
Cc: Fam Zheng <fam@euphon.net>
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Reported-by: Michal Prívozník <mprivozn@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210723195843.1032825-1-philmd@redhat.com
Fixes: bdd6a90a9e5 ("block: Add VFIO based NVMe driver")
Buglink: https://bugs.launchpad.net/qemu/+bug/1863333
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/65
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
(cherry picked from commit 15a730e7a3aaac180df72cd5730e0617bcf44a5a)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 block/nvme.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/block/nvme.c b/block/nvme.c
index 2b5421e7aa..e8dbbc2317 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1030,7 +1030,29 @@ try_map:
         r = qemu_vfio_dma_map(s->vfio,
                               qiov->iov[i].iov_base,
                               len, true, &iova);
+        if (r == -ENOSPC) {
+            /*
+             * In addition to the -ENOMEM error, the VFIO_IOMMU_MAP_DMA
+             * ioctl returns -ENOSPC to signal the user exhausted the DMA
+             * mappings available for a container since Linux kernel commit
+             * 492855939bdb ("vfio/type1: Limit DMA mappings per container",
+             * April 2019, see CVE-2019-3882).
+             *
+             * This block driver already handles this error path by checking
+             * for the -ENOMEM error, so we directly replace -ENOSPC by
+             * -ENOMEM. Beside, -ENOSPC has a specific meaning for blockdev
+             * coroutines: it triggers BLOCKDEV_ON_ERROR_ENOSPC and
+             * BLOCK_ERROR_ACTION_STOP which stops the VM, asking the operator
+             * to add more storage to the blockdev. Not something we can do
+             * easily with an IOMMU :)
+             */
+            r = -ENOMEM;
+        }
         if (r == -ENOMEM && retry) {
+            /*
+             * We exhausted the DMA mappings available for our container:
+             * recycle the volatile IOVA mappings.
+             */
             retry = false;
             trace_nvme_dma_flush_queue_wait(s);
             if (s->dma_map_count) {
-- 
2.25.1


