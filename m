Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4D0571803
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 13:06:03 +0200 (CEST)
Received: from localhost ([::1]:55306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBDiM-0004It-EM
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 07:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1oBDd5-0000UC-LL
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 07:00:35 -0400
Received: from mail-dm6nam11on20611.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::611]:7008
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1oBDcz-0005cy-FF
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 07:00:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6P0Bybyx9pFpPTA3l6cOX9jPUPz3SMJOQDNJDBA3PUelrNaOFI6agwuUMq+nTKOsmIgBhaE3bHlhWHvMyIza+MZwAYnjtjdTp71ix+EFrAsQ/0IdmFCjKt5cLCcukK+x4F4ORGf/VmXnDNabNCn5mxq+oW3mnlPan+W8vd5NpWVcektD7uVha8NcJuSHlsat7X2+N3ZRRULv7vSSN4aiFbxHkfQnx9esP4BIchzlb9Jv9ilK0iCvda3qVnmRzYnNaxa/zwr4sQBTd7mYPhi10PI4Q6RePoN5OwrBOC84SG0i8fHzK4sSYVLgBidp3512okRrC1fkRCxlRoGLUTOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDSLChVyNcO39z/ItAalx73ae68buT8/Wzuy+waJFHE=;
 b=B83E6/vakncveQbTm1ca39rAlnWUU2MFowrDdT8KcFgtxfHQSLip3vlwhhHekgNzpSzOUEDlLxGUWpR/3b97giixbtLg/z9yp8xg8iYATabZH+y2YsfY7e6ZR6seVq7wJdNJEJ8UgdZlXUjsX45kC1AIKtxzhTFZmfQKAO1uFXLvWhTzTQ94r9vxpmgW+BbRNkkcAErZytMqtlMnKvWxDwI/rZPJ7fbpnS2KpD/zCV9PjAq5Cj8IPOIQlu4Uk5OyrzxrTEOmztDNItnISQ144u2sDASsxKz0qJ5BZljMJgnd/vq+4Gx2xNR2+xLkPw+aM6Or8BYwVgoCfKi5OpRM4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDSLChVyNcO39z/ItAalx73ae68buT8/Wzuy+waJFHE=;
 b=GPsH9YBp7NG5r9hSNBTjthLC1x29zDyKDNAmfO0CVxb6iJ6QEuku5hcm7iIt+iQTg6wCUD0ymdQiwRyng4pY3hcufn1kyXKDZZWTMRVXPcMZPylwM78/ElDAwXGL0LmC6GQezuSdTFVMk13g5QFpmVypX+JecWjlyt+JImym+2Ll1leZHCxrrhApEgDKXO9LwWZdIIne5YEVhDJrr//waqxDO7VasKElokHmi2jWW0inpXJpFkVmHqNtPNSqqG5o9Ofh9eq1bbl0VEPJYj+yxRrYcOF1ASwgQLNXXbJXst216d/pmTVOHSMuU2cABeJO+Iks5mZ3ZXmQ/YFA8eX1ig==
Received: from MW4PR04CA0329.namprd04.prod.outlook.com (2603:10b6:303:82::34)
 by MN2PR12MB3629.namprd12.prod.outlook.com (2603:10b6:208:cb::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Tue, 12 Jul
 2022 10:55:22 +0000
Received: from CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::a0) by MW4PR04CA0329.outlook.office365.com
 (2603:10b6:303:82::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26 via Frontend
 Transport; Tue, 12 Jul 2022 10:55:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT061.mail.protection.outlook.com (10.13.175.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 10:55:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Tue, 12 Jul 2022 10:55:21 +0000
Received: from nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 12 Jul
 2022 03:55:20 -0700
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <yajunw@nvidia.com>,
 <parav@nvidia.com>
Subject: [PATCH v2 0/2] vhost-user: Support vhost_dev_start
Date: Tue, 12 Jul 2022 13:54:59 +0300
Message-ID: <20220712105501.688628-1-yajunw@nvidia.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220629022517.2600911-1-yajunw@nvidia.com>
References: <20220629022517.2600911-1-yajunw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 389e8c47-0bff-42b8-22aa-08da63f504d7
X-MS-TrafficTypeDiagnostic: MN2PR12MB3629:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KUkvRTEsGPHpOu27rafMLA2nGOf9vTUShw9dzeH9A3eqlPi4KQFJB9CrcAavX/Kb8sSYamrLvLXa3JZGqxerIBBUMUhm3oA5be9TFNMmwTR/xsa1mDickng4QV5A23DWW4FDCEgOIO6RrL3irJPj0KRT/+qUq2CmHVC1bmcWPBFBp5i/R+natDYcaXM0e4Upf4DHZNTk8qFyrxjs9OAv0Ce/zHbE6bv07EBt1PeW30uuAilsu9hD10wa4KI1XUIkasTDFEuaRdhH/UFTovW4IMbAMOfAIT2ZlG3aEkkc4i20Q/RQ+em6kPQ2EEcYdNpNQ8x5F9/vDUTtqZSlqckexvf4fpbZtYHDVIPgYgGhowH0JBmWdSXCpmWveX5ly4LYLKmSyGOZS0CWmJZuHagPYrjUAtoJZTW5Dwi3lWdGu3gPTuT1gD8iYISR8QaZKuFfaJTXTupQnoANgWVFDej7B4FqeML7J///0q8VgSc/2LaEh0au+8VvX+tFDQ2bE439EcXRancuTrwHT+9HMRAHHpwDI6mQvfz7xVzG6QHuBOT3IPlUcmcPYeZSUWo664uyUpSVM4qQwB0R+7tDEUDS7GmdB8sCT+kXP9SehXa8GRQ+lK0aViFhwikmNfGmCkHaTdU0Gd+fod44ntWoY7xhI5giL7C2KoYLdWPlE4eRdQ0iwsd9n+De+dYZgUYxmAH+y0iLpFU8XH6gMITcziTS+5ktCP+eKX6kfACU8NIbZ27/4y+s4iZdHIHkAg8MloQdfx4/xJdlGD3sHxfmCrA1kQTzr6BD2YuwLxkusnkMcjKWUGWOAyYvSbEc3XejUBAYJyyg7eFEl8JhA9DnDZu/OTWaWRPl4Sn3EkJsFzlSA4g=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(40470700004)(46966006)(36840700001)(7696005)(6666004)(2906002)(86362001)(6286002)(83380400001)(6636002)(8676002)(110136005)(316002)(36756003)(41300700001)(1076003)(70206006)(82310400005)(70586007)(186003)(36860700001)(5660300002)(356005)(8936002)(478600001)(82740400003)(426003)(2616005)(40460700003)(26005)(81166007)(336012)(47076005)(16526019)(966005)(55016003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 10:55:22.4598 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 389e8c47-0bff-42b8-22aa-08da63f504d7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3629
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::611;
 envelope-from=yajunw@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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

The motivation of adding vhost-user vhost_dev_start support is to
improve backend configuration speed and reduce live migration VM
downtime.

Today VQ configuration is issued one by one. For virtio net with
multi-queue support, backend needs to update RSS (Receive side
scaling) on every rx queue enable. Updating RSS is time-consuming
(typical time like 7ms).

Implement already defined vhost status and message in the vhost
specification [1].
(a) VHOST_USER_PROTOCOL_F_STATUS
(b) VHOST_USER_SET_STATUS
(c) VHOST_USER_GET_STATUS

Send message VHOST_USER_SET_STATUS with VIRTIO_CONFIG_S_DRIVER_OK for
device start and reset(0) for device stop.

On reception of the DRIVER_OK message, backend can apply the needed setting
only once (instead of incremental) and also utilize parallelism on enabling
queues.

This improves QEMU's live migration downtime with vhost user backend
implementation by great margin, specially for the large number of VQs of 64
from 800 msec to 250 msec.

Another change is to move the device start routines after finishing all the
necessary device and VQ configuration, further aligning to the virtio
specification for "device initialization sequence".

[1] https://qemu-project.gitlab.io/qemu/interop/vhost-user.html#introduction

v2:
- add setting status bit VIRTIO_CONFIG_S_FEATURES_OK
- avoid adding status bits already set

Yajun Wu (2):
  vhost: Change the sequence of device start
  vhost-user: Support vhost_dev_start

 hw/block/vhost-user-blk.c | 18 ++++++----
 hw/net/vhost_net.c        | 12 +++----
 hw/virtio/vhost-user.c    | 74 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 90 insertions(+), 14 deletions(-)

-- 
2.27.0


