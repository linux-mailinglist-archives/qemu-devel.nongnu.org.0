Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66928525189
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:47:35 +0200 (CEST)
Received: from localhost ([::1]:45448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npB2M-0000nj-BE
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAyg-0006Jr-Mj
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:43:47 -0400
Received: from mail-dm6nam10on20617.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::617]:22401
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAye-0005KE-T9
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:43:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fl6/ZMPef4EXxxf0tZi99awUK2/z5B1Gmrcabc4h9j4CSgV05f5KGu7E99SuWfwUcGjDPF1o/dEtM7JpmsMrVhdhGEv3pXrs8w6amkvQqQC2hjaaFet7AgJoIYzhooICTUTo5RyW05YVbC0q/cw0hFQc3QLz0O86NPZWjXKyWeESueA7WILSzCyPOj+4Ih6aMHO1PmK7L3eICfRo/ZfdFrSkmU40bG95AWYPVPdaSMR28ZHuuxDAd8EKQn3fVSbgN+ztaY1uqSzi3VX58cv1YEPruCcA98UUpZyQDqspwBsTyNsKQvFtQJUrdvCUkx3wX35tdIFGCbyWKLVAMNKCTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Y8kNitKlbtxGQVO/kzT272waoEvNmR/0NCAs/q6IVE=;
 b=W/act7sXeuW5l2AIQ7QOktTP9gJNoPeKmiCwn5h2joLtnDzjFeoa/kCX9Sd1swns5YMpbVdrLduwBZejKlmWUhmUmNLy6PrEZzGg+QP6WxO66JOp8SjYtZTKcsJ7WXPYNhi2dUkfvhSqSUKltinkn3JYn+edWhEH+WqTSMCg4d1rL5z9PotJvVhY05eYTCiOOwj37q/6vk/KIhXwYmgejXPYiLMdHdyLWe+k2MzieF/R1E6iXd62GiuocqBUfp6Z0NC8Cqs98UNPIezG7UlKo/63nBd7JqL9iOd4leg/pRnFyeJETjpnxPj82lZ0NnOKqeDgXiusWDLJkk+kPo+9Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y8kNitKlbtxGQVO/kzT272waoEvNmR/0NCAs/q6IVE=;
 b=J6c6IqJDvhpy1KFoguL9qi+CYISEBA+yk8lGYrKbZpj0JWwA9P0TDbLwENTV3VevJ3soON44usl9GCyVXoJNpt7+zieiOYmRof0I71zwdj/PnmghIaQdQTBV7zekyW3xh3xyfys09MqYlMEqpKEhiAT1GPelnnOSBPjiEdYZHZL9V6R8WGdPJ0FLzeW/vyRx/UeHJYPhXOu/Gf/BrsGAMQMLSVVGNn18zm4XpWGEPLUle9D6/LpO9xxKjFNZAy9B5XNjt5WAMCdBfNgv0zj0kAWBijxaKE0yiG1hyMzk8nd6WFubGwtZ15mMYsYF1fv+63wa5beG4VWAyIITq0oVzA==
Received: from MW4PR03CA0030.namprd03.prod.outlook.com (2603:10b6:303:8f::35)
 by MN2PR12MB3550.namprd12.prod.outlook.com (2603:10b6:208:108::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 12 May
 2022 15:43:41 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::8f) by MW4PR03CA0030.outlook.office365.com
 (2603:10b6:303:8f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Thu, 12 May 2022 15:43:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 15:43:41 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 12 May 2022 15:43:40 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 12 May
 2022 08:43:40 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport; Thu, 12 May
 2022 08:43:36 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Cornelia
 Huck" <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, "Mark
 Bloch" <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: [PATCH 4/9] vfio/migration: Skip pre-copy if dirty page tracking is
 not supported
Date: Thu, 12 May 2022 18:43:15 +0300
Message-ID: <20220512154320.19697-5-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220512154320.19697-1-avihaih@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d29cce10-dbbb-45bb-0d17-08da342e30b8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3550:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3550648C50B958A5EF05CA09DECB9@MN2PR12MB3550.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NYI/D8hWMZ8/wEDMPDgGefGkyXr8zufYI/xwlH5pt9nAa0tF26upjLsj2EBSetVzLZScOKtdOC4MP6PReXNo1XdFx33l0NsOs7NqQLAj6YTaob9PNFfhdN9xDtHpPh8JKqgBkkbDoM54SxYWQG1/9VYhdonnll9jCwRguTSB7t+KvLykesiZl/9e+Eri6e3czcXdMdtDp6UaV9LmyixYwD4yIp8YZtxtY2Kjq3dxcGojbXq1BDg93YD2kIqjzsfyF9/15k4BZne4dv1cN0dv95u821CJN2F0RModMcSjDlZkoNfbs9BpJO3niN1ST0wjWr4aNgUlFMcTa+khEYZAYrBpEMdNWW2+tmlGMAZQXmP+n1fVfuX7v1hej9qx2m78oQNPMins/PJyhdH803D1Z4qb+86yrk9rnoqQYIvxXeoO+4kZ1FEWD9nL2bz604zryrZx1JNh8vHpeGbPrklme7DkTwIUmPDjG62VZcm+oREOS9iSli+BKI7NSIDO4Oz4JK1pllGDfczQkSUM75pCAaaiT6jgMpA3DON2XxOgYQgO8tMijXwLH2eOz+YpJ1rkYGcing7zCJWOBk5b0aaQXlim/7rcv7s/qG4t3X1raMWQ2h3PVCPdpTXsth3hwon55MSiYoyLMWggIFfkIJNrUENz+KEUYtByR0pi+Ufiwv9BgcVGz1xN92pecAx63duTapFSSi6RR2yK9nKwGdo7h/phCg/3WVjdXaEpGh4bn5U=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(8936002)(508600001)(8676002)(2616005)(70586007)(4326008)(70206006)(86362001)(356005)(5660300002)(81166007)(1076003)(36860700001)(107886003)(36756003)(7696005)(40460700003)(426003)(336012)(316002)(6666004)(82310400005)(47076005)(2906002)(110136005)(54906003)(186003)(26005)(83380400001)(14143004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 15:43:41.5761 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d29cce10-dbbb-45bb-0d17-08da342e30b8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3550
Received-SPF: softfail client-ip=2a01:111:f400:7e88::617;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Currently, if IOMMU of a VFIO container doesn't support dirty page
tracking, migration is blocked completely. This is because a DMA-able
VFIO device can dirty RAM pages without updating QEMU about it, thus
breaking the migration.

However, this doesn't mean that migration can't be done at all. If
migration pre-copy phase is skipped, the VFIO device doesn't have a
chance to dirty RAM pages that have been migrated already, thus
eliminating the problem previously mentioned.

Hence, in such case allow migration but skip pre-copy phase.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/migration.c   | 9 ++++++++-
 migration/migration.c | 5 +++++
 migration/migration.h | 3 +++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 21e8f9d4d4..d4b6653026 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -863,10 +863,17 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
     struct vfio_region_info *info = NULL;
     int ret = -ENOTSUP;
 
-    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
+    if (!vbasedev->enable_migration) {
         goto add_blocker;
     }
 
+    if (!container->dirty_pages_supported) {
+        warn_report(
+            "%s: IOMMU of the device's VFIO container doesn't support dirty page tracking, migration pre-copy phase will be skipped",
+            vbasedev->name);
+        migrate_get_current()->skip_precopy = true;
+    }
+
     ret = vfio_get_dev_region_info(vbasedev,
                                    VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
                                    VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
diff --git a/migration/migration.c b/migration/migration.c
index 5a31b23bd6..668343508d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3593,6 +3593,11 @@ static MigIterateState migration_iteration_run(MigrationState *s)
     uint64_t pending_size, pend_pre, pend_compat, pend_post;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
+    if (s->skip_precopy) {
+        migration_completion(s);
+        return MIG_ITERATE_BREAK;
+    }
+
     qemu_savevm_state_pending(s->to_dst_file, s->threshold_size, &pend_pre,
                               &pend_compat, &pend_post);
     pending_size = pend_pre + pend_compat + pend_post;
diff --git a/migration/migration.h b/migration/migration.h
index a863032b71..876713e7e1 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -332,6 +332,9 @@ struct MigrationState {
      * This save hostname when out-going migration starts
      */
     char *hostname;
+
+    /* Whether to skip pre-copy phase of migration or not */
+    bool skip_precopy;
 };
 
 void migrate_set_state(int *state, int old_state, int new_state);
-- 
2.21.3


