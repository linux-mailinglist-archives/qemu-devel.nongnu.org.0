Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295BB6F31C7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 16:04:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptU6a-0004ZW-PE; Mon, 01 May 2023 10:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptU6X-0004KT-JG
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:02:13 -0400
Received: from mail-mw2nam04on20607.outbound.protection.outlook.com
 ([2a01:111:f400:7e8c::607]
 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptU6R-0006c9-O9
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:02:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjvU3NxIp54FxIltLU7y8Zg+v+4lXGsWYwH3r997hIBdF1g2OPvFyKgWk37m8d9ZPpKi7+pL+phVrwvsO+3IAaETB0+imPU3MbI5r0O9rIrif/8PI4o/91j1Gc1pD8MX7OGNoAMzAv+plZim5Pou+uk05hAB5lcASSRW2fDgFbXnVeBX+wAXslmb6exN2BQ+SxLb9NcObXU0bq8guSVILx7XCHUhy9smoalXyf5ywDr5CZ1zJDy2CcxglyyzOrUSGvUuqr4hpLSArKX2yzfNHmF9e0CZn6sRTq8AEtvdPpvBmE9yE7MalVjsWrEaLHW125/K03wraznVhwIWUZWvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjYcg5/K060uERlZwG6z11hQsalO9jRhsYSQmnT5r4c=;
 b=cpNLgvLU0o/HjI8H3lGwAUJa6E2BKWH1xDL9GRmZMMzRdwjaLte1BNAH9VT0fRk7YKHDVmLXYiQ5cJ/kjon9qU5SH2d+nKFkTDaku0YFfsMwkq9AipGDa/4pUkt7ofYFQJf6KSFZZ3poBVJB+lDQFbyfqJbhu/6xGnnCuA8ukhoxf0yKzKj8qwxfWhHmb7pukYl1d2qhEH/4y1un0uJ8LF7v4mh6U/gtjS6HfX2/xUTnO5CwiJ79C1xEX1uCPHp0aBdQXFFIUCJ6zJQ1AwpNZ1JxamvhTjIlPiZBdiJlrud6i6f+q3QHEqxZfUYaAs4ONzX/SNmMv09nP2RUXbHKGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjYcg5/K060uERlZwG6z11hQsalO9jRhsYSQmnT5r4c=;
 b=qNvAzBTEIxgOQdXNGFSu0xbYnPbjzhLevKRzgLWMuT7Wc6jxnKyPBJnuSKZo0tLJ57KTp77glq67+eqeKy8lgflHFgJdpoIWRyYRVkKawsLR2Up3pXSXoRD0yuwrkCx9M8pUKvwZ7cu6G/cgMWe3RkZX+NMA9FLmEQbnaQn1X5B8k1fjBRWQPBQat7VxGDvOTYzUiyp28WxpQXbzm5AtsBC2eEMcRby2vvb7p+NGHDGQSqnLNYvAFb9iEIvfFHAEcUVoQ6/Q9wMlurJi9OzSMS3QsOkFW+B0guuaR4NXvs/2h+ycRPOl5UIsDa0rxjuHtMUbhmtIBihDmLO8r4I/sw==
Received: from DM5PR07CA0080.namprd07.prod.outlook.com (2603:10b6:4:ad::45) by
 IA1PR12MB7637.namprd12.prod.outlook.com (2603:10b6:208:427::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 14:02:03 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::71) by DM5PR07CA0080.outlook.office365.com
 (2603:10b6:4:ad::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30 via Frontend
 Transport; Mon, 1 May 2023 14:02:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.19 via Frontend Transport; Mon, 1 May 2023 14:02:02 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 1 May 2023
 07:01:51 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 1 May 2023
 07:01:51 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Mon, 1 May
 2023 07:01:47 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: [PATCH 1/8] migration: Add precopy initial data capability
Date: Mon, 1 May 2023 17:01:34 +0300
Message-ID: <20230501140141.11743-2-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230501140141.11743-1-avihaih@nvidia.com>
References: <20230501140141.11743-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT051:EE_|IA1PR12MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: f419f778-f8c8-4ffb-b15c-08db4a4ca3e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: utzL2imSjJNCsGlY928b1GAOUakPTzP5rz+Ex9k1jvUi9lXczz03QKV349A5ThGDM+X+k7nbogwszjYuYMQMOW6iw5sopP840hDLS+xos/HysGIhd/BEnl9yxGPNUi2B4ocJDV7/RN7BHeXJzucLqemNgHVWyI8Up00OZdmcsCtkSL0bartNEHcGtTUI9qnbxwGwtfEIWJ/f55rbPQco3bYeXrcNQ6k29XNBPV4tgY73grX9V71DlL9vM63+nSCkdiMBgSYENDgbq/cHQjwGU6rvIF3dTvTkGZ8FJPHzLh3p0EBDLMKIQ1K3x8HG0IMMdjAHEl//Cv5JThD2c1MMfBIZEQd30ntS71ZW2hDhlXoPlgB5tlmjGt+lQJhW/IlqcsQ3Jtney2nITaS3Qpqsc2GDY0ooEW8XaiRgif9zjoZGSYgwTqK4P3al3w7Pn+5mdKiIft6Ez5gQSERzuV/mZyxnF6YFp7vtK+BwXC5931UGXGkxNvis8YJSyvOlQOkHGhF4tfArSzPluyxCMOpEhfQSXIiax/wh0oazU/IFAzppi5/PVaFJjoDZttsHH0pG3Wet7swroDwDYmqid1lMd1S57g+RAF+ziv9/F1NWfUd/z7Sb2rm2i/VFbsfV6FKWZ4WcHWS/RihN6MSmweq18irbpjRnIvnUeRIcD/BxvJbRd0un8eAT25XXGrNaZ/I0FF0o44n3LtC1MmcxwNlxtQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(40470700004)(46966006)(36840700001)(7416002)(5660300002)(356005)(7636003)(8676002)(40460700003)(82740400003)(8936002)(41300700001)(316002)(40480700001)(36756003)(82310400005)(86362001)(2906002)(36860700001)(186003)(2616005)(478600001)(83380400001)(6666004)(7696005)(426003)(336012)(47076005)(26005)(1076003)(54906003)(4326008)(6916009)(70586007)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 14:02:02.9622 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f419f778-f8c8-4ffb-b15c-08db4a4ca3e9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7637
Received-SPF: softfail client-ip=2a01:111:f400:7e8c::607;
 envelope-from=avihaih@nvidia.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Migration downtime estimation is calculated based on bandwidth and
remaining migration data. This assumes that loading of migration data in
the destination takes a negligible amount of time and that downtime
depends only on network speed.

While this may be true for RAM, it's not necessarily true for other
migration users. For example, loading the data of a VFIO device in the
destination might require from the device to allocate resources, prepare
internal data structures and so on. These operations can take a
significant amount of time which can increase migration downtime.

This patch adds a new capability "precopy initial data" that allows the
source to send initial precopy data and the destination to ACK that this
data has been loaded. Migration will not attempt to stop the source VM
and complete the migration until this ACK is received.

This will allow migration users to send initial precopy data which can
be used to reduce downtime (e.g., by pre-allocating resources), while
making sure that the source will stop the VM and complete the migration
only after this initial precopy data is sent and loaded in the
destination so it will have full effect.

This new capability relies on the return path capability to communicate
from the destination back to the source.

The actual implementation of the capability will be added in the
following patches.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 qapi/migration.json |  9 ++++++++-
 migration/options.h |  1 +
 migration/options.c | 20 ++++++++++++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 82000adce4..d496148386 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -478,6 +478,13 @@
 #                    should not affect the correctness of postcopy migration.
 #                    (since 7.1)
 #
+# @precopy-initial-data: If enabled, migration will not attempt to stop source
+#                        VM and complete the migration until an ACK is received
+#                        from the destination that initial precopy data has
+#                        been loaded. This can improve downtime if there are
+#                        migration users that support precopy initial data.
+#                        (since 8.1)
+#
 # Features:
 # @unstable: Members @x-colo and @x-ignore-shared are experimental.
 #
@@ -492,7 +499,7 @@
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
            { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
            'validate-uuid', 'background-snapshot',
-           'zero-copy-send', 'postcopy-preempt'] }
+           'zero-copy-send', 'postcopy-preempt', 'precopy-initial-data'] }
 
 ##
 # @MigrationCapabilityStatus:
diff --git a/migration/options.h b/migration/options.h
index 3c322867cd..d004b6321e 100644
--- a/migration/options.h
+++ b/migration/options.h
@@ -44,6 +44,7 @@ bool migrate_pause_before_switchover(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_postcopy_preempt(void);
 bool migrate_postcopy_ram(void);
+bool migrate_precopy_initial_data(void);
 bool migrate_rdma_pin_all(void);
 bool migrate_release_ram(void);
 bool migrate_return_path(void);
diff --git a/migration/options.c b/migration/options.c
index 53b7fc5d5d..c4ef0c60c7 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -184,6 +184,8 @@ Property migration_properties[] = {
     DEFINE_PROP_MIG_CAP("x-zero-copy-send",
             MIGRATION_CAPABILITY_ZERO_COPY_SEND),
 #endif
+    DEFINE_PROP_MIG_CAP("x-precopy-initial-data",
+                        MIGRATION_CAPABILITY_PRECOPY_INITIAL_DATA),
 
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -286,6 +288,13 @@ bool migrate_postcopy_ram(void)
     return s->capabilities[MIGRATION_CAPABILITY_POSTCOPY_RAM];
 }
 
+bool migrate_precopy_initial_data(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return s->capabilities[MIGRATION_CAPABILITY_PRECOPY_INITIAL_DATA];
+}
+
 bool migrate_rdma_pin_all(void)
 {
     MigrationState *s = migrate_get_current();
@@ -546,6 +555,17 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
         }
     }
 
+    if (new_caps[MIGRATION_CAPABILITY_PRECOPY_INITIAL_DATA]) {
+        if (!new_caps[MIGRATION_CAPABILITY_RETURN_PATH]) {
+            error_setg(errp, "Precopy initial data requires return path");
+            return false;
+        }
+
+        /* Disable this capability until it's implemented */
+        error_setg(errp, "Precopy initial data is not implemented yet");
+        return false;
+    }
+
     return true;
 }
 
-- 
2.26.3


