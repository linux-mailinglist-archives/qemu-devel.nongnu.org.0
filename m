Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306B26F31D5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 16:07:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptUBI-0003N8-Sh; Mon, 01 May 2023 10:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptUBH-0003Mt-Ee
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:07:07 -0400
Received: from mail-co1nam11on2063.outbound.protection.outlook.com
 ([40.107.220.63] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptUBE-0007ir-Uz
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:07:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5q4G5M8+ykc7PY6uT3tPHKPahIjJqtk3nariMIFXCeXmEdC7g95zIOscMUPP7FpDSrNJySuaiIZjFQYhMEK+IDISsbEjm+4outyb8FF2U5dr9qbr+vM5AFx5VT4EBYhsAVRwxWaXpAqNg+7oJUFAa+BWgqpXqn7RqXpu5k/1+gyoAqEwdmMxN8Gu9vllYBKoEDXzrCiCS46b8/tHFduI8XCorcRD0+Vv7vdSgP6V/mn+YdZzb7/3Ix1nxXomo9rWUqZur55NXanhN1vda/QoT4TyWQGbXm6VzPJ1UZ456bEIUZrXeE4Q768xiRP63lA4KuqCxOOfsczeJb+Ag7SXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRGL6uJnq5wT7SIdA4xXd6jbCULUQvZ4f49EKPyjOOQ=;
 b=OIoV214tcLs581IS4V1E7jfyZGVP0nrQCN+UJIWotjR2WWAO6NGhMwSPb0O/c6PLzW/GEtE1jfJbNrudwv3VuRhV4KYHp1mzeofkxdvajAjzDEs1UPQg8es7DMexPohG7A/hHjCiWsPENpXdfDv92Pu+Ti6Z63JOdAvEy4ex5ediFfKGHb+MA5xshbjsya2+jLgbttmZV63xcIuv4Xw9DtkwWNbe1nrNS17oGSmZA7UYLmmckkWUsMJ5L7ISTnFUVRU+zyfay9vOlhdwQRUeQgX0QevqYGkB1Ye63LtB0bE8WIMwy9wvuveG2q23aqJoOadyFYqm7p2uIo0CfINh0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRGL6uJnq5wT7SIdA4xXd6jbCULUQvZ4f49EKPyjOOQ=;
 b=F8sBzH0fcvFkYfRH+FSfIKeh2TV7HfW9EbL5AOJuDzRe6U35a98TR7GaSoKhkZN33hIjAo6nMm0THVKAamqHcHq5USGltylZg8bMGrNGC+0smMuav6YORpHafHbbgH1LEFd5K90iGtXp/iLRw3DrfGkJNM28i916IBEgTgyiOCk32sy9/FDf/5HovWdRYP9qOdj2lRTbm1BNK9pEGHbQIT9vkG6knrIXM0JmaN3E/fmZGmsccAipcgmO37S4NZ+ewVZoUleRsdqo3Rh7tONz0joH5W3ovD0Wygr0piwhYaP1P0UeQQYj/pGypNCdAWG2sL72lPxzJqSLLyZdUBk7sg==
Received: from MW4P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::21)
 by MW4PR12MB7191.namprd12.prod.outlook.com (2603:10b6:303:22d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 14:01:59 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::7d) by MW4P221CA0016.outlook.office365.com
 (2603:10b6:303:8b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30 via Frontend
 Transport; Mon, 1 May 2023 14:01:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.19 via Frontend Transport; Mon, 1 May 2023 14:01:59 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 1 May 2023
 07:01:46 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 1 May 2023
 07:01:46 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Mon, 1 May
 2023 07:01:42 -0700
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
Subject: [PATCH 0/8] migration: Add precopy initial data capability and VFIO
 precopy support
Date: Mon, 1 May 2023 17:01:33 +0300
Message-ID: <20230501140141.11743-1-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT016:EE_|MW4PR12MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: 58823bec-6e56-462b-b4bd-08db4a4ca1cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sMT0pcPav0ETds8CUn8KOSVJCHtTGxbgc8XlZDxqNPUQybmOm9EJb3m83EMS/IMit8l7JyHjpxrtB85MS7I+D7SBN15Fyp1zWAcQUB7QBUNTQjlkGFoG1486TYri7jn15a10xKYsQ5M/8z6uGvTN4YSihIsYozRhIcoMsSIYiKGHJpW1s1PRVJRW/NubxFHOsG/BLik0wkHn0jEbZAChEFoCrEZHendO/bZMV4zfScd7QDp3r6kVK8MeHkmLBh2KdmbzNqDT5aYwXDbPGz8FqLLLvPgK++UGfrIg3oM36td/WcIlxQHxbZdUkLVeE/V+ud4gTqYXNGC9N2qpuETPLDwcPPHRpHSOaHFOykupEtxVlHuTRChnN+eRN1PjX/WcpIh9ztORsOnHuwQE1pzuzGKWkbWvkFR3QinOrkxUYVRzv6IcXMBSlIpv3jg92rLXYY3qnQ0ptWRfmhAf7INbGTYxZCmjgHTat6RZhYNmCmDlkIsCqd+U6rG2Oc2crzxIu9g7sSuYmG6rrK3gvJe/joa1hdXVGKlMPP/o7o2/3dF2ahQpQG7dwB9m9fDTxKAO4DJ2szTZDQz3dtlj5uufmYmMVhmBBDVDLAwbocM/DrPhFCmqBoOvfRNIbmt6Yy15uHnvAEtl90boFLqEXiiQ3qS3+8+XxPWnUJPUT4f0ilvlORGxcHuOYMD9BQKncKsmof8M6mBPHqSlQfKEMhvwi0hj9bbj5gxTj/OfaSEzSor9apwNRkJiXTeRZq6ulkHcyySZqz8X8SxaOiRU42Z1mhWG7n0yMGLRCGzus5jqtMg=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39850400004)(451199021)(46966006)(40470700004)(36840700001)(2906002)(7696005)(6666004)(966005)(40460700003)(54906003)(5660300002)(70206006)(70586007)(36756003)(356005)(4326008)(6916009)(7636003)(82740400003)(8676002)(41300700001)(316002)(8936002)(7416002)(40480700001)(82310400005)(478600001)(1076003)(26005)(186003)(83380400001)(86362001)(47076005)(36860700001)(426003)(2616005)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 14:01:59.4012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58823bec-6e56-462b-b4bd-08db4a4ca1cc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7191
Received-SPF: softfail client-ip=40.107.220.63;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hello everyone,

This series adds a new migration capability called "precopy initial
data". The purpose of this capability is to reduce migration downtime in
cases where loading of migration data in the destination can take a lot
of time, such as with VFIO migration data.

The series then moves to add precopy support and precopy initial data
support for VFIO migration.

Precopy initial data is used by VFIO migration, but other migration
users can add support for it and use it as well.

=== Background ===

Migration downtime estimation is calculated based on bandwidth and
remaining migration data. This assumes that loading of migration data in
the destination takes a negligible amount of time and that downtime
depends only on network speed.

While this may be true for RAM, it's not necessarily true for other
migration users. For example, loading the data of a VFIO device in the
destination might require from the device to allocate resources and
prepare internal data structures which can take a significant amount of
time to do.

This poses a problem, as the source may think that the remaining
migration data is small enough to meet the downtime limit, so it will
stop the VM and complete the migration, but in fact sending and loading
the data in the destination may take longer than the downtime limit.

To solve this, VFIO migration uAPI defines "initial bytes" as part of
its precopy stream [1]. Initial bytes can be used in various ways to
improve VFIO migration performance. For example, it can be used to
transfer device metadata to pre-allocate resources in the destination.
However, for this to work we need to make sure that all initial bytes
are sent and loaded in the destination before the source VM is stopped.

The new precopy initial data migration capability helps us achieve this.
It allows the source to send initial precopy data and the destination to
ACK that this data has been loaded. Migration will not attempt to stop
the source VM and complete the migration until this ACK is received.

Note that this relies on the return path capability to communicate from
the destination back to the source.

=== Flow of operation ===

To use precopy initial data, the capability must be enabled in the
source.

As this capability must be supported also in the destination, a
handshake is performed during migration setup. The purpose of the
handshake is to notify the destination that precopy initial data is used
and to check if it's supported.

The handshake is done in two levels. First, a general handshake is done
with the destination migration code to notify that precopy initial data
is used. Then, for each migration user in the source that supports
precopy initial data, a handshake is done with its counterpart in the
destination:
If both support it, precopy initial data will be used for them.
If source doesn't support it, precopy initial data will not be used for
them.
If source supports it and destination doesn't, migration will be failed.

Assuming the handshake succeeded, migration starts to send precopy data
and as part of it also the initial precopy data. Initial precopy data is
just like any other precopy data and as such, migration code is not
aware of it. Therefore, it's the responsibility of the migration users
(such as VFIO devices) to notify their counterparts in the destination
that their initial precopy data has been sent (for example, VFIO
migration does it when its initial bytes reach zero).

In the destination, migration code will query each migration user that
supports precopy initial data and check if its initial data has been
loaded. If initial data has been loaded by all of them, an ACK will be
sent to the source which will now be able to complete migration when
appropriate.

=== Test results ===

The below table shows the downtime of two identical migrations. In the
first migration precopy initial data is disabled and in the second it is
enabled. The migrated VM is assigned with a mlx5 VFIO device which has
300MB of device data to be migrated.

+----------------------+-----------------------+----------+
| Precopy initial data | VFIO device data size | Downtime |
+----------------------+-----------------------+----------+
|       Disabled       |         300MB         |  1900ms  |
|       Enabled        |         300MB         |  420ms   |
+----------------------+-----------------------+----------+

Precopy initial data gives a roughly 4.5 times improvement in downtime.
The 1480ms difference is time that is used for resource allocation for
the VFIO device in the destination. Without precopy initial data, this
time is spent when the source VM is stopped and thus the downtime is
much higher. With precopy initial data, the time is spent when the
source VM is still running.

=== Patch breakdown ===

- Patches 1-5 add the precopy initial data capability.
- Patches 6-7 add VFIO migration precopy support. Similar version of
  them was previously sent here [2].
- Patch 8 adds precopy initial data support for VFIO migration.

Thanks for reviewing!

[1]
https://elixir.bootlin.com/linux/latest/source/include/uapi/linux/vfio.h#L1048

[2]
https://lore.kernel.org/qemu-devel/20230222174915.5647-3-avihaih@nvidia.com/

Avihai Horon (8):
  migration: Add precopy initial data capability
  migration: Add precopy initial data handshake
  migration: Add precopy initial data loaded ACK functionality
  migration: Enable precopy initial data capability
  tests: Add migration precopy initial data capability test
  vfio/migration: Refactor vfio_save_block() to return saved data size
  vfio/migration: Add VFIO migration pre-copy support
  vfio/migration: Add support for precopy initial data capability

 docs/devel/vfio-migration.rst |  35 ++++--
 qapi/migration.json           |   9 +-
 include/hw/vfio/vfio-common.h |   6 +
 include/migration/register.h  |  13 ++
 migration/migration.h         |  15 +++
 migration/options.h           |   1 +
 migration/savevm.h            |   1 +
 hw/vfio/common.c              |   6 +-
 hw/vfio/migration.c           | 218 +++++++++++++++++++++++++++++++---
 migration/migration.c         |  45 ++++++-
 migration/options.c           |  16 +++
 migration/savevm.c            | 141 ++++++++++++++++++++++
 tests/qtest/migration-test.c  |  23 ++++
 hw/vfio/trace-events          |   4 +-
 migration/trace-events        |   4 +
 15 files changed, 504 insertions(+), 33 deletions(-)

-- 
2.26.3


