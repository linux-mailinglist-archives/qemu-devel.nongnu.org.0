Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E3755F35F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 04:33:46 +0200 (CEST)
Received: from localhost ([::1]:39902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6NWS-0003HQ-Jn
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 22:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1o6NTj-0002VX-PK
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 22:30:55 -0400
Received: from mail-bn7nam10on20631.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::631]:54704
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1o6NTh-0006js-4o
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 22:30:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5CNWNjfoSRDQGwITRCzPNuXWVd4/fsZdza+IAULTQYRChlqQ0gGfsErSf+WTN+8/Qj38Tnt9kwcfM32yyI/qVQB05QuTOGatUejIo4Mxasw5x5ve4zLF1KJw367dV3VqsBKFZC5OPMNBbDXsV7NVXMezJydkyWQ/KuOWHG/1UIkSjJhsTWu42kdN1+AhLwORMjfJY5JY5AscJhYPJEn4OUpG74I4o8T1A/MOmMxKlFZTlqczxfNweX0jMh4Tj0I1vOq2HZlUM/K2lSHoVNoOIYZkAaTL3LDuHE3RiJgd0lPzmENLJcXvHFPXCBkLJ7Wdgl8h5s5zE3yi9tqNRw0xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKXaD5ypw9vmU2XIrDir7EAp5t1lGUT5Zt0C3aANIog=;
 b=CJ6mODGKeS07uMjgcGo5nt7xrFjqCZIvlNeQbMiNKYfMPgQjNPreVbdW269ZKhOALAAxVb2gzzw+LwgseoqsYYkcsDYHWKmz8LViJqB5e3SerOJPe8lcEPoZn+fCBdOxNb50rCIuH+34oSpDwHuTMLPGB/AnSztCQQ172qEaVMr3lPkyw6PO1oMOEh+Zd/UmEzVuo00wlT6CBmRfV2DLP0n7mikbEDqzqPeRTmKHYhws2kVcpUgOsmDMR0yaP0z6k4+/4KSDzSXerkyO1MGmwdQmQMi/pdDjF2AIvKAPPnjnHOKwmRq4AU0dmUz2zMbJ9ARYaKVhuoOTh3y1OTRjTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKXaD5ypw9vmU2XIrDir7EAp5t1lGUT5Zt0C3aANIog=;
 b=jpZomIm93F/DXadsxYN8HQq0KvOImoYscfTfwjoyeqwA+5fnWKuhQlQNQa6ZVTeOFGMC37M1lqPCPVOuXz9D0F8bfe0gTc7uofiJrLrJEDVGTv4GmrTbqkcEqjCQyriePPYDs2JL7WSPMegQio9pxXWwCJ/QzvtNN4JNk8G7EIa7QN04t6DgXfQwHg4NaiMXGlJ2bvgJdMDYg+s5OFVeM+hWaSAPBS5i3vbOktaWCLuDwhFnmDFnu5Mz9cuHhESJLuKnLqCHeD9xCt5WoLzoPoECoFXp4yuMtaJJhg+SCku+8CC8Ndtmmau2G9K67VkaUGBNSXCYr7FU6KJ/TjJ9zg==
Received: from DS7PR05CA0055.namprd05.prod.outlook.com (2603:10b6:8:2f::15) by
 MWHPR1201MB2556.namprd12.prod.outlook.com (2603:10b6:300:e3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 02:25:46 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::a7) by DS7PR05CA0055.outlook.office365.com
 (2603:10b6:8:2f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.7 via Frontend
 Transport; Wed, 29 Jun 2022 02:25:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 02:25:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Wed, 29 Jun 2022 02:25:45 +0000
Received: from nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Tue, 28 Jun
 2022 19:25:43 -0700
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <alex.bennee@linaro.org>,
 <yajunw@nvidia.com>
Subject: [PATCH 0/2] vhost-user: Support vhost_dev_start
Date: Wed, 29 Jun 2022 05:25:15 +0300
Message-ID: <20220629022517.2600911-1-yajunw@nvidia.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5a458e3-233a-40bb-a386-08da5976ac5c
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2556:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GXaBDGAg1lynaVG+uy26LYu9k71RODg+wQnUwExQhN3V4c5P77GzX5QWr61qFnGE5fS0Zl8B7FOXfdqQccTCMs8Xyc2/DvgxPZblt6OxP2/yzXL4eAOl05oABmjtdNQ2M3SWL7lgAj3+Gf7ZuC/FcHYhC8kGrJdfAITDuKoV6u5OavDAz06v7QXWz4o7Mn2uRuG3IdqkJBgp6ZX2TnzL2oiraGFFd7xZTERpeL4FGEW9dndPySNz0T9k4jAHwgb21Cfh0EN2KBfmIeYwHDXBYBloLHgVr8kDobvAegDZVz+aIbqc3EvwPk2LyScFIlQ9CJcnaYj+wKePAoXIwZIaOqbPtVoob3fDlbaVnSrdTUAtjMtbxcQQJjGOFcdgxHXYkPI22QqMCbnf/qUNfrgp6vdvQrGzXjjFXoD+wv4buHYAtgWstG9GsdneNu+K2tI2oPVmSc6jWKZlDanD7j8gsVn+hcSKZEO0ebO2qLYNnO6lek4bRYM7bWOegn+MWMuPZcPidaM6tSxCUdb0nx3z1Qsdl+OBZeVV5F1xQ6I6+CEJRsMYdWFXsqKpI906cfQZ3X1bnXaOJBpwdLNOVEdOC1sJhn1OZfPvh2MoISyqL+6ox6EQj2sjzTLxWzdSDNLsro2DUeH6emYubDRSYb6ZhK9efL4yGfYf+/pd7a8ebVsAuzjy6wJB+PtZbTZ1GR9MH4FH5Nl/uMmBE9m7QQu0XwNVR63CUBvlBYopynYMr9r3/Y3PVag+tgfJsib9SqZuZUv0SrHSzPHjcjOkwYRShLyDvmDioxgYG7GcsdUQsrpTBMnDq2dt/aqBv8DgrKLqDg/RdS5XrryLWSaNLPwX4g==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(376002)(36840700001)(46966006)(40470700004)(70586007)(8936002)(7696005)(26005)(316002)(110136005)(40480700001)(2616005)(1076003)(86362001)(70206006)(8676002)(7049001)(81166007)(6666004)(41300700001)(2906002)(82740400003)(356005)(186003)(6286002)(82310400005)(40460700003)(83380400001)(426003)(47076005)(336012)(966005)(36860700001)(5660300002)(36756003)(478600001)(16526019)(55016003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 02:25:45.7861 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a458e3-233a-40bb-a386-08da5976ac5c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2556
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::631;
 envelope-from=yajunw@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

Yajun Wu (2):
  vhost: Change the sequence of device start
  vhost-user: Support vhost_dev_start

 hw/block/vhost-user-blk.c | 18 +++++++-----
 hw/net/vhost_net.c        | 12 ++++----
 hw/virtio/vhost-user.c    | 58 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+), 13 deletions(-)

-- 
2.30.2


