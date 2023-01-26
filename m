Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DC767D4BD
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:55:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7KD-0004OJ-Qv; Thu, 26 Jan 2023 13:50:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7K5-0004NM-Mf
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:09 -0500
Received: from mail-mw2nam10on2058.outbound.protection.outlook.com
 ([40.107.94.58] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7K3-0002SA-Ke
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7vS8eUJrsChBJD1RW4wFjbSokfEkaCatrLnlyF9OiUROePqLrcXyQt53XJQg5io5yGD0SAT8xEbHRp+HzJTm/9jKXfA/+ueK5R7hR4ncoEoPr9Q8F+nr7HB1GuWqVMV/Pao+N+j8OmKu2lddd067OlMj7i3fn732e35GN9pI/NZbVUDwZf2cwJmVdrrq/4LHIDxlg7caJe+Y/08tDM0XJti06wyS/Y5QqFNgHKoQHht/FfLSzAdeI4qQ1YS/8W30E/ePxebZ5RcDJYU4ntI3rXgwqtH72t26oRp7oujH8yMs0TOX5lXAEJyby0m4qnQ+FL3WnwlDIAXAESrGWIUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IR2dsXmWhu6AYqO59bBSGoeNj6rBH2k8HoU3pGDzRGQ=;
 b=XGWPfrnqMjf3XM1lBipuhb0t3/4OB5veU7fFkFlJhIAJnkpG5cLNLdi2xqdBTSFEX+xp1G7ANlGTxg3BWGrdsXXaTKJbw5eYfMLlO3JEkvzu1TVbU5bdyyo8sODqHPImgflyF1hbFaOMQwwkWoh05EPVImIKkZKv+94/tW1U9DM9rn9K9vlv0iYwAuJW5ww6kDHJfVExI1iEJ/47O2GxlJoMhy6RbWqRfu3lC25qaxRIicJZPY3fWV8j7iTh1prPYmQxERD4hLH2kvz15hxSWtAUg3gIjq/rijN3NgwiZ4ebGdWo+0zdynAGeICmYeswIhKyR9N9RVcTTgSlfYAo6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IR2dsXmWhu6AYqO59bBSGoeNj6rBH2k8HoU3pGDzRGQ=;
 b=HNNlnv3eWzb5pzOyOTFcyLvftgFEhdaancYVTogwHr0jYsm5qhR01hH8K7wtOxBAKTBc84Jsy3DLg0p8ipYwhn5XhOp6LkSYi9JRot1XJ21QyhlfvfuU6SDJuyAp7MHRgrjZkZCmC+qi9ft/4BH3pe5QDOZVKR4geyoC+GCN8ESoMBUBARAuzsv/TYwCxPwKUSX8FAxls3OOjE5/hakgcFJBe3FUsOnB9QMJlEymDUfv/UcSOEHbDLPt+A4QkUbyXlhl+/dy4emr0Gem+AUFK8LNYjzkiOTJ7cBJtzERaDT3C+aQPBT/qrL2uTt7jjbjdgb6S5/ZJ/PLbYp5OcY8EQ==
Received: from MW4PR04CA0113.namprd04.prod.outlook.com (2603:10b6:303:83::28)
 by SA0PR12MB4349.namprd12.prod.outlook.com (2603:10b6:806:98::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 18:50:03 +0000
Received: from CO1NAM11FT100.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::11) by MW4PR04CA0113.outlook.office365.com
 (2603:10b6:303:83::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Thu, 26 Jan 2023 18:50:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1NAM11FT100.mail.protection.outlook.com (10.13.175.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Thu, 26 Jan 2023 18:50:03 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:50:02 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:50:02 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:49:58 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH 02/18] vfio/common: Fix error reporting in
 vfio_get_dirty_bitmap()
Date: Thu, 26 Jan 2023 20:49:32 +0200
Message-ID: <20230126184948.10478-3-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT100:EE_|SA0PR12MB4349:EE_
X-MS-Office365-Filtering-Correlation-Id: 46af893d-782c-42bf-ade6-08daffce22c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kfGR6xUjgleBCqgNAWtFIf2xnqlGp43s1at41RBCgdZJUDv/iLha+jx1A/W+MAvv39tPswg1mD+Gn5syS5rpfzKuCI4Nj1qvEZEQ2yYdojerYYNIbEy7qxKcZGi14oqKLfIQfSnJStEygOW2Tbu3+49IRhl9Os0ObsIjW2zQCbXTbuKjVut/rzjL/SARjddRZat01OR+jUO60UY8YhorP9MAAVWsZizX43N+2/WCeIMRGUGRHtlPruuPUa/rPYia4wa3KIx1ij30hwanHuj3N3ZSBMhXwHIqOr7CTnocaXcdX3CscR1stgXgxJ3cAi7jZpBWEF8j8evwpn3KAPvqw+MdWjhqSqQY6C8qb3sgWAsIYm+iTM979qJOvOO+brr5QU2DhxCNGchc2p5HDOyM3RwydoAoycyj3cvv2gnFt09tsicpH8O3dn7OhvdCBP4a/thd/G6VJbiwubCbFpjZgiXt3ar1/kFx8IPsbkAl7GotNN6D21cAsP/aVwNGjK+LGcYA55RguAtuNfg0gibpzxWLYlg2bk4FZ7+Y7qWBWMXRozfq0gyuwRGb48lEa5gtcgx+NkltbRPvn36mEoe6bQgf5u1eG4srSm33T5Tr/wx0jpQ7vBVXA6JIAVJr50vvfF6Pqv+TyjGR8gtYt+fVoN3L/uns96itwuv1UmWCXjBrQjivbBmvAGMarVk3+5IaVYxi2JaUEEHMADE64kb/GBOEI4FFojvMVO53IfzJpQo=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199018)(40470700004)(36840700001)(46966006)(41300700001)(8936002)(26005)(6666004)(47076005)(36860700001)(426003)(86362001)(40480700001)(40460700003)(356005)(82740400003)(36756003)(70206006)(82310400005)(54906003)(7696005)(70586007)(316002)(4326008)(6916009)(8676002)(7636003)(2616005)(336012)(478600001)(186003)(1076003)(7416002)(5660300002)(2906002)(4744005)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:50:03.7069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46af893d-782c-42bf-ade6-08daffce22c4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT100.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4349
Received-SPF: softfail client-ip=40.107.94.58; envelope-from=avihaih@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Return -errno instead of -1 if VFIO_IOMMU_DIRTY_PAGES ioctl fails in
vfio_get_dirty_bitmap().

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 93b18c5e3d..d892609cf1 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1288,6 +1288,7 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
 
     ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
     if (ret) {
+        ret = -errno;
         error_report("Failed to get dirty bitmap for iova: 0x%"PRIx64
                 " size: 0x%"PRIx64" err: %d", (uint64_t)range->iova,
                 (uint64_t)range->size, errno);
-- 
2.26.3


