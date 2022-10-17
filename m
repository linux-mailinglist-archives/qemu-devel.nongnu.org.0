Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD2560075C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 09:10:18 +0200 (CEST)
Received: from localhost ([::1]:48320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okKGO-0000W8-Sp
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 03:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1okJxK-0000NE-4W
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:50:52 -0400
Received: from mail-bn8nam11on20600.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::600]:46401
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1okJxH-0004EI-U4
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:50:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3N5+oTWseb9mRbLpZZFgPGweHc6GQ4kW7wJqy1IPpb4CNRnxotxhQ5r6uakCvOGE/aMcHbgs0fnekEH29Bn6ScngH5WFAyjZwAASepG+fEc1rq3MbWmJjc8Ol4zaNKmRt8RN6wVXdASwVBNFMDQ8stYzVl8Jt0NYI2jUIhNgOh086GihO7STK1o1a/GBL7nLAY8o5eZ63pANkInwXIaMSAQbWSIITRXPHcEzYzkhqhgTvYNnyTLLyRXW/PC4V6sXWLZhLCCpf/oiT2/hWk7IT+dytdg9A2kFbZBiRg8KA7UVigBiXSZCohOtPIBK7FsB0OxHkSMiOvCorElxh/xYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4BH2kvQb8+SIdaQmiBkYIi2F5fbNLlLM0nsBHK4Lac=;
 b=mFMB03YUReiQZzuoQ17bzb8aA5ltZQAMkHJ8bJTou1HRHTB26Zm4dIQDe47Se6YcUfm1Eu1p2ogWD+g3td1JL3F+JPsnumg7X3HL97bfvXeFAH4qK7az4gJIFSRSJS/h5U34hTcetrcpOHNCT53fj54XlYo+XwfjxwhB5ketHzDaU+2wVyEr2fzhDa/vZ2d/KP0QO53tpsqDtK9XQogoqDmz5iyb8Ba9epGNjgJzxMgr7p+oI713IdGwVVkHELwpQ4H3Q19PjrmP4024siVxy6BvRS+OSnP9ExVz9j3reYBH1JRiUKXz3fFsYFo6EI37jXKnYltlqiOPKbp9JD8Evg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4BH2kvQb8+SIdaQmiBkYIi2F5fbNLlLM0nsBHK4Lac=;
 b=E8XCkjAV/uu4pZ/gFGQfvaYwwoV46yrcFKycs2dn9dkr0BVkOinK3s7m4i+YQYY7KdS5OYZ/zpojARczXFHvK04qTIuPI0Qku8qpdCHDQgLfPhQnvGZiFXpGRsNfaPc5qCiuhsOnuIQ00ORv3Lmki2Ae4pTxOsLywvjiP5pFV+l9N2Ffhmzyc9/OgmfuV8blJhqLY3gQW7yx501SWHshbspQMuF6oXyKSoqYLknqMcgR9OYnoZqA74SnnI6ox5Kqb56ylvzm0GAVdg359Fv1avgZ2/Ff+ExOfcWy8ke0Df/MWEB6eAXwO+o4bzo3EWydnUORRY81jnAukT6m9qDoKQ==
Received: from BN0PR04CA0101.namprd04.prod.outlook.com (2603:10b6:408:ec::16)
 by DS7PR12MB5840.namprd12.prod.outlook.com (2603:10b6:8:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 06:45:26 +0000
Received: from BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::81) by BN0PR04CA0101.outlook.office365.com
 (2603:10b6:408:ec::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Mon, 17 Oct 2022 06:45:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT057.mail.protection.outlook.com (10.13.177.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 06:45:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Sun, 16 Oct
 2022 23:45:11 -0700
Received: from nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sun, 16 Oct
 2022 23:45:10 -0700
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <yajunw@nvidia.com>,
 <parav@nvidia.com>
Subject: [PATCH v3 0/2] vhost-user: Support vhost_dev_start
Date: Mon, 17 Oct 2022 14:44:50 +0800
Message-ID: <20221017064452.1226514-1-yajunw@nvidia.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220629022517.2600911-1-yajunw@nvidia.com>
References: <20220629022517.2600911-1-yajunw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT057:EE_|DS7PR12MB5840:EE_
X-MS-Office365-Filtering-Correlation-Id: fc58e78a-9318-4746-d4ab-08dab00b2c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +TsColfNloS5CJOpzMiGcS64vuWQZZhtmScNAEdbFaXajIj4ojuTg4+YbPxKVbgvNSudehDl17zUxEYOyDViqGaN6RmZ8yG2xmW6CoqrpA/c+kcybYbYQdaHGbj6Ixw/Dig2ypeEa0vyppD9aY3EsrK5FLHSfQODhGq2/EMtR/rCmHFx5z23QtW7LiSjhxMOzOj5a2jwci6nYIL8aNtp7ChOI0kZ3/1UIWAsc/QYRego14nwxyjCKtQD1jz0Lsqt06GDQE5MscnMAqze6OFlBBixjTJ0TWfY6AAhEiZ8K794rwBybe8WX5J7Rpv9mCsGSwAlO5F3dfRcE+Ol8nRcqSolPxFXU/sZla4kuq1N3pc61pkcRgZ2gWGVOYbC0wRnz+7E6VVwexAzyZas8KupGtHCQomWT3UFUrHMiXMHigkoYmy48+hIHqho8aXQDuy7iElhNynVCV9jd1u/vxq6jxRjEFKW7H904il/exGr/UguyqiyBR4rcqWFiU0HGWNS4PdK315Ptyavd1c6F80+8qkahHKWky2MWkLoFVmtbEnRGG4d9X/7RiGiDfE2SlFcR5gWJedsRR+48ylM1ZiEx8y9bGFzr30kVd+awxUqPkBUfXWiZiFYdw3grFU73SrGBzks85w9U8kglW1Aibi8dRWwjg8luS7gapndoVV2MXyfxdHznw4cwKH3hXYTZCikb7koAqAvao2elklrL28jvPq8moxtAaY5PzNv3AkP/1lwSOtrIjMQ8hE/+uC1HpxLsQAje1HVZ9MlVVjNWrQzhw==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(316002)(426003)(47076005)(336012)(2906002)(1076003)(186003)(83380400001)(16526019)(82310400005)(82740400003)(7636003)(55016003)(40480700001)(86362001)(40460700003)(356005)(36756003)(36860700001)(478600001)(966005)(6636002)(110136005)(41300700001)(7696005)(8936002)(2616005)(5660300002)(26005)(6286002)(70206006)(70586007)(8676002)(6666004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 06:45:25.5324 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc58e78a-9318-4746-d4ab-08dab00b2c20
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5840
Received-SPF: softfail client-ip=2a01:111:f400:7eae::600;
 envelope-from=yajunw@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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

v3:
- rebase

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


