Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D63B68BCD4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:32:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0fN-00020f-MP; Mon, 06 Feb 2023 07:32:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0fI-0001z8-9A; Mon, 06 Feb 2023 07:32:08 -0500
Received: from mail-bn1nam02on2062f.outbound.protection.outlook.com
 ([2a01:111:f400:7eb2::62f]
 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0fD-0000OS-U7; Mon, 06 Feb 2023 07:32:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1eSr8ZjrH+3dW5Ltb4IpRGhR2hL7xmYi6Lv95TrcLAverxg2amAppUyKoD8pjWdsIJBVeb6OIzLsxUhgujqoxqXcreZIDtdry960g7shAqj769IA6dN+zigVsz76ZfBI5XP4DbnBvh5puVarUdB+lphLLUuZajr1QBTFPwnuOZARugBUFUSGTXJL4k61/k6h1cKftBaGGorYt5Oh7VgZlYjPmtiCNiLOAw104iI3gReWnZ5XQk4kv4gTfgk4qztFbTclbGLG0HDPm2dxmJ7TXL+J0xAZuMqfSbGWXb5UfF+by7Rwihl8mBE904oGZS4JKGxK6DTiN74Wvd8utXb4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgn1m2ohepdmA8TJbnkNfIh2Pv5CA/b2NrYytFZYXo4=;
 b=GqtIsdECxhFdKA9vn2QQzThEY5NFu0DD2MJitX7Xe7GmNE2yjeU/IF7QQmVg6LFUsqewnyPDhniEh15eRjV2yd9jZWHhjK8kwpN3+CmVVlXKY2El6XP+pTmUJe3cmkRZ9WKP6mfeIMZR7lLKOK3Oi3WOtJzGb8y+qlSB8Z4eOz0Z9sziQlqNN8dElUNDzM9pwnopalcbZHYiIwDicD3Dox/etTlIeSdLxqW51YBnguGK1WEjmhJbhdRQbd9ulokuA1uZ/dYv4o53cI4GNU9bhMjeISTi4ZkLSJCvutYueIt5SqwXuo543IJo5U/37Lh0ie7s4ATie3bax6JKL2H4XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgn1m2ohepdmA8TJbnkNfIh2Pv5CA/b2NrYytFZYXo4=;
 b=ca/IPIl+PgTHwNzy3HClhWz8RZd1R0waN5Wu+6OHXUi/QsIc5dQXJ0f0PzUHuwkj/kV4xPR6Wp9qc/grhE5yEQ+QfkaQUYTzG16Nho27XAKEcP6M/ckZdfVKYrJJSPJlK3FkNS2MxuE5O962QrQr7HGPG79B/VlFY7T5Yh6Zl+w4tS/Wc9YFpVbYSpRG4Y+VVJOvYhlehV6yjGg/PvytmcioeFLymzmw56UbvStgnrN10a5wPxqHOmbAIHeZlSZIhQ/Exu+Ugfq9gVHiUyvDvo+WssTVoglK6F8qnuZBoxAUzCRGukD3Xhc7WUzXw9zrYCfmdYivjj0G8k76w7R3WA==
Received: from DS7PR05CA0080.namprd05.prod.outlook.com (2603:10b6:8:57::18) by
 IA1PR12MB6043.namprd12.prod.outlook.com (2603:10b6:208:3d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 12:31:56 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:57:cafe::35) by DS7PR05CA0080.outlook.office365.com
 (2603:10b6:8:57::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25 via Frontend
 Transport; Mon, 6 Feb 2023 12:31:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.34 via Frontend Transport; Mon, 6 Feb 2023 12:31:56 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:31:45 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:31:44 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Mon, 6 Feb
 2023 04:31:37 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, "Ilya
 Leoshkevich" <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan
 Quintela" <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: [PATCH v9 00/14] vfio/migration: Implement VFIO migration protocol v2
Date: Mon, 6 Feb 2023 14:31:23 +0200
Message-ID: <20230206123137.31149-1-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT052:EE_|IA1PR12MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ffafc07-c1e5-4b21-648f-08db083e22a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j6eds8lbZFoeu7gwtPv8XBFWrRQjdPatYzrifwPAjUwCwmZ6A4ueGZ+jETEXhefRoz4UFFhnNvWB2/r2UNIO4ZGoVFwOHfQMYLd4zKrpnxHDImeIazkwb+bgdBzM9TANEfDzfNQQyOx9050p8uKf4Gc0Gg/54ZQzspEVAqBseNujffcn27s0JjNmmD9QeFcXSfwEzxmZqxF9lmMj0wN5aejIXmbWRKoan1ZKKR2HgiP4z7yPNVmiMyIcmPgkW/eFZHJymtDImRugxFip4uhmNYNf5F8Mn8yPe0x4eSynEm/3ZZGGTj6VP7u8Ii7No18lliyG8nyEitjgHAfM/Wbv/jKLsKX2mRlYk8f2hQFMUuRLKfqDoQm+NzfdS/AdMK5CFE5a8YNVHc0JaX/C75xhS4OTlpVmCIbN9h6tc0+rVU508hqnfikt6nMErXqlpygpXMeTw7wID+NpMUlcpCD2bsow6MPciWdISxnjYpMI9tkcXNtqSq4CQ1T79di0qjA2S8p4W3asglJt6mOizAGCZJhj4AUAY+abQrDohH694ST7j/RjKCVk5WvbqQyBbcwTSM9N2JG+tRQW8R+JyBzO1wvjBr8czmPz78VXuEqspAuLJPV/IIbDvEFMuVvmPHa9cg/4nV8t6MIYK+1uhCTr8hhpD2tu4WG8ptuadXncaP2SrF2T62eahMMJdPpTcmw0/Vn4HCLvxmXKiWgkyZDKvK5mI353jlwC0ako2Q6hA9bqT5DCrv7xIxipVwXQmpTom9604YBj9Ah62MLY6WA4XzQiZHab6TPyNjAYni6EVi9Du80et+u594HvS5Gf+XiOqD9oiy7LXuBHY2g00916WA==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(316002)(54906003)(70206006)(4326008)(8676002)(6916009)(70586007)(8936002)(41300700001)(82740400003)(40460700003)(7636003)(36756003)(86362001)(356005)(966005)(6666004)(26005)(186003)(1076003)(2906002)(47076005)(36860700001)(7416002)(40480700001)(30864003)(426003)(82310400005)(478600001)(83380400001)(5660300002)(7696005)(336012)(2616005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 12:31:56.3557 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ffafc07-c1e5-4b21-648f-08db083e22a2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6043
Received-SPF: softfail client-ip=2a01:111:f400:7eb2::62f;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hello,

This v9 of the series adds a patch to block multiple devices migration
and removes redundant P2P code.

Note that when Juan's pull request [1] is merged, I will rebase this
series on it and send a v10.

Following VFIO migration protocol v2 acceptance in kernel, this series
implements VFIO migration according to the new v2 protocol and replaces
the now deprecated v1 implementation.

The main differences between v1 and v2 migration protocols are:
1. VFIO device state is represented as a finite state machine instead of
   a bitmap.

2. The migration interface with kernel is done using VFIO_DEVICE_FEATURE
   ioctl and normal read() and write() instead of the migration region
   used in v1.

3. Pre-copy is made optional in v2 protocol. Support for pre-copy will
   be added later on.

Full description of the v2 protocol and the differences from v1 can be
found here [2].



Patch list:

Patch 1 updates linux headers so we will have the MIG_DATA_SIZE ioctl.

Patches 2-9 are prep patches fixing bugs, adding QEMUFile function
that will be used later and refactoring v1 protocol code to make it
easier to add v2 protocol.

Patches 10-14 implement v2 protocol and remove v1 protocol.

Thanks.



Changes from v8 [3]:
- Added patch that blocks migration of multiple devices. As discussed,
  this is necessary since VFIO migration doesn't support P2P yet.
- Removed unnecessary P2P code. This should be added when P2P support is
  added.
- Fixed vfio_save_block() comment to say -errno is returned on error.
- Added Reviewed-by tag to linux headers sync patch.



Changes from v7 [4]:
- Fixed compilation error on windows in patch #9 reported by Cedric.



Changes from v6 [5]:
- Fixed another compilation error in patch #9 reported by Cedric.
- Added Reviewed-by tags.



Changes from v5 [6]:
- Dropped patch #3.
- Simplified patch #5 as per Alex's suggestion.
- Changed qemu_file_get_to_fd() to return -EIO instead of -1, as
  suggested by Cedric.
  Also changed it so now write returns -errno instead of -1 on error.
- Fixed compilation error reported by Cedric.
- Changed vfio_migration_query_flags() to print error message and return
  -errno in error case as suggested by Cedric.
- Added Reviewed-by tags.



Changes from v4 [7]:
- Rebased on latest master branch.
- Added linux header update to kernel v6.2-rc1.
- Merged preview patches (#13-14) into this series.



Changes from v3 [8]:
- Rebased on latest master branch.

- Dropped patch #1 "migration: Remove res_compatible parameter" as
  it's not mandatory to this series and needs some further discussion.

- Dropped patch #3 "migration: Block migration comment or code is
  wrong" as it has been merged already.

- Addressed overlooked corner case reported by Vladimir in patch #4
  "migration: Simplify migration_iteration_run()".

- Dropped patch #5 "vfio/migration: Fix wrong enum usage" as it has
  been merged already.

- In patch #12 "vfio/migration: Implement VFIO migration protocol v2":
  1. Changed vfio_save_pending() to update res_precopy_only instead of
     res_postcopy_only (as VFIO migration doesn’t support postcopy).
  2. Moved VFIOMigration->data_buffer allocation to vfio_save_setup()
     and its de-allocation to vfio_save_cleanup(), so now it's
     allocated when actually used (during migration and only on source
     side).

- Addressed Alex's comments:
  1. Eliminated code duplication in patch #7 "vfio/migration: Allow
     migration without VFIO IOMMU dirty tracking support".
  2. Removed redundant initialization of vfio_region_info in patch #10
     "vfio/migration: Move migration v1 logic to vfio_migration_init()".
  3. Added comment about VFIO_MIG_DATA_BUFFER_SIZE heuristic (and
     renamed to VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE).
  4. Cast migration structs to their actual types instead of void *.
  5. Return -errno and -EBADF instead of -1 in vfio_migration_set_state().
  6. Set migration->device_state to new_state even in case of data_fd
     out of sync. Although migration will be aborted, setting device
     state succeeded so we should reflect that.
  7. Renamed VFIO_MIG_PENDING_SIZE to VFIO_MIG_STOP_COPY_SIZE, set it
     to 100G and added a comment about the size choice.
  8. Changed vfio_save_block() to return -errno on error.
  9. Squashed Patch #14 to patch #12.
  10. Adjusted migration data buffer size according to MIG_DATA_SIZE
      ioctl.

- In preview patch #17 "vfio/migration: Query device data size in
  vfio_save_pending()" - changed vfio_save_pending() to report
  VFIO_MIG_STOP_COPY_SIZE on any error.
   
- Added another preview patch "vfio/migration: Optimize
  vfio_save_pending()".

- Added ret value on some traces as suggested by David.

- Added Reviewed-By tags.



Changes from v2 [9]:
- Rebased on top of latest master branch.

- Added relevant patches from Juan's RFC [10] with minor changes:
  1. Added Reviewed-by tag to patch #3 in the RFC.
  2. Adjusted patch #6 to work without patch #4 in the RFC.

- Added a new patch "vfio/migration: Fix wrong enum usage" that fixes a
  small bug in v1 code. This patch has been sent a few weeks ago [11] but
  wasn't taken yet.

- Patch #2 (vfio/migration: Skip pre-copy if dirty page tracking is not
  supported):
  1. Dropped this patch and replaced it with
     "vfio/migration: Allow migration without VFIO IOMMU dirty tracking
     support".
     The new patch uses a different approach – instead of skipping
     pre-copy phase completely, QEMU VFIO code will mark RAM dirty
     (instead of kernel). This ensures that current migration behavior
     is not changed and SLA is taken into account.

- Patch #4 (vfio/common: Change vfio_devices_all_running_and_saving()
  logic to equivalent one):
  1. Improved commit message to better explain the change.

- Patch #7 (vfio/migration: Implement VFIO migration protocol v2):
  1. Enhanced vfio_migration_set_state() error reporting.
  2. In vfio_save_complete_precopy() of v2 protocol - when changing
     device state to STOP, set recover state to ERROR instead of STOP as
     suggested by Joao.
  3. Constify SaveVMHandlers of v2 protocol.
  4. Modified trace_vfio_vmstate_change and
     trace_vfio_migration_set_state
     to print device state string instead of enum.
  5. Replaced qemu_put_buffer_async() with qemu_put_buffer() in
     vfio_save_block(), as requested by Juan.
  6. Implemented v2 protocol version of vfio_save_pending() as requested
     by Juan. Until ioctl to get device state size is added, we just
     report some big hard coded value, as agreed in KVM call.

- Patch #9 (vfio/migration: Reset device if setting recover state
  fails):
  1. Enhanced error reporting.
  2. Set VFIOMigration->device_state to RUNNING after device reset.

- Patch #11 (docs/devel: Align vfio-migration docs to VFIO migration
  v2):
  1. Adjusted vfio migration documentation to the added
     vfio_save_pending()

- Added the last patch (which is not for merging yet) that demonstrates
  how the new ioctl to get device state size will work once added.



Changes from v1 [12]:
- Split the big patch that replaced v1 with v2 into several patches as
  suggested by Joao, to make review easier.
- Change warn_report to warn_report_once when container doesn't support
  dirty tracking.
- Add Reviewed-by tag.

[1]
https://lore.kernel.org/qemu-devel/20230202160640.2300-1-quintela@redhat.com/

[2]
https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/

[3]
https://lore.kernel.org/qemu-devel/20230116141135.12021-1-avihaih@nvidia.com/

[4]
https://lore.kernel.org/qemu-devel/20230115183556.7691-1-avihaih@nvidia.com/

[5]
https://lore.kernel.org/qemu-devel/20230112085020.15866-1-avihaih@nvidia.com/

[6]
https://lore.kernel.org/qemu-devel/20221229110345.12480-1-avihaih@nvidia.com/

[7]
https://lore.kernel.org/qemu-devel/20221130094414.27247-1-avihaih@nvidia.com/

[8]
https://lore.kernel.org/qemu-devel/20221103161620.13120-1-avihaih@nvidia.com/

[9]
https://lore.kernel.org/all/20220530170739.19072-1-avihaih@nvidia.com/

[10]
https://lore.kernel.org/qemu-devel/20221003031600.20084-1-quintela@redhat.com/T/

[11]
https://lore.kernel.org/all/20221016085752.32740-1-avihaih@nvidia.com/

[12]
https://lore.kernel.org/all/20220512154320.19697-1-avihaih@nvidia.com/

Avihai Horon (13):
  linux-headers: Update to v6.2-rc1
  vfio/migration: Fix NULL pointer dereference bug
  vfio/migration: Allow migration without VFIO IOMMU dirty tracking
    support
  migration/qemu-file: Add qemu_file_get_to_fd()
  vfio/common: Change vfio_devices_all_running_and_saving() logic to
    equivalent one
  vfio/migration: Block multiple devices migration
  vfio/migration: Move migration v1 logic to vfio_migration_init()
  vfio/migration: Rename functions/structs related to v1 protocol
  vfio/migration: Implement VFIO migration protocol v2
  vfio/migration: Optimize vfio_save_pending()
  vfio/migration: Remove VFIO migration protocol v1
  vfio: Alphabetize migration section of VFIO trace-events file
  docs/devel: Align VFIO migration docs to v2 protocol

Juan Quintela (1):
  migration: No save_live_pending() method uses the QEMUFile parameter

 docs/devel/vfio-migration.rst                 |  68 +-
 include/hw/vfio/vfio-common.h                 |  12 +-
 include/migration/register.h                  |   3 +-
 include/standard-headers/drm/drm_fourcc.h     |  63 +-
 include/standard-headers/linux/ethtool.h      |  81 +-
 include/standard-headers/linux/fuse.h         |  20 +-
 .../linux/input-event-codes.h                 |   4 +
 include/standard-headers/linux/pci_regs.h     |   2 +
 include/standard-headers/linux/virtio_blk.h   |  19 +
 include/standard-headers/linux/virtio_bt.h    |   8 +
 include/standard-headers/linux/virtio_net.h   |   4 +
 linux-headers/asm-arm64/kvm.h                 |   1 +
 linux-headers/asm-generic/hugetlb_encode.h    |  26 +-
 linux-headers/asm-generic/mman-common.h       |   2 +
 linux-headers/asm-mips/mman.h                 |   2 +
 linux-headers/asm-riscv/kvm.h                 |   7 +
 linux-headers/asm-x86/kvm.h                   |  11 +-
 linux-headers/linux/kvm.h                     |  32 +-
 linux-headers/linux/psci.h                    |  14 +
 linux-headers/linux/userfaultfd.h             |   4 +
 linux-headers/linux/vfio.h                    | 278 ++++++-
 migration/qemu-file.h                         |   1 +
 migration/savevm.h                            |   3 +-
 hw/s390x/s390-stattrib.c                      |   2 +-
 hw/vfio/common.c                              |  90 ++-
 hw/vfio/migration.c                           | 746 ++++++------------
 migration/block-dirty-bitmap.c                |   3 +-
 migration/block.c                             |   2 +-
 migration/migration.c                         |   4 +-
 migration/qemu-file.c                         |  34 +
 migration/ram.c                               |   2 +-
 migration/savevm.c                            |   7 +-
 hw/vfio/trace-events                          |  29 +-
 33 files changed, 950 insertions(+), 634 deletions(-)

-- 
2.26.3


