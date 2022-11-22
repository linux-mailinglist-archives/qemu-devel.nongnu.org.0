Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CBB6334AF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 06:22:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxLi6-0002Lh-5Q; Tue, 22 Nov 2022 00:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1oxLi0-0002LX-Bo
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 00:20:36 -0500
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com
 ([40.107.236.40] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1oxLhs-0007lF-7d
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 00:20:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fu3x11hAw6RA5AaPKBJXhkxJpDsLMwjnjPKt/8SL7a7P7QA5ofrue7PViRuch0B76Au6KbFmipVA2984xBawwpI1mITP+iz7k3qVL4wMf3/SP6ppVS4Rc8qrJxQnfTFj87QI+KuYHXdcc4hbUvf9vK5gPrelwGjEvvbplx3tOshln+zI5VuyPs2bCIG/KE22J/AQZ83FvSZEvxCr1sI0ZEaI4VZEwjSiFs5lCtbfMuM6ew7rU/ib5XZJID4BJWFcP3yVGLQrVIDXcoIUYhT2SPVj1LQAZAZDIlGcYtWBAiqtCc2j0cPY8AGpgfIPHRvc9N1LJX2E2l0MrKNuo1DKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J82eRVFQT+TM9s6qkfZX/rClff/a8VaigjzOScg8iVQ=;
 b=m9xex2QoJIAFd4xitmNgSPgrHtqvFUzJhviO9elSYO7dSw/GG32wPQHdHCX5UIv9FJ9Pnx/BeevrJqq1NAcbWIyQtJiAW4EJ2mynqRQLhMYwhy+D/et3FHZwCXJmilMkzl/D0d0nNGCaq2HiB0sUF5miZBVVBOlMNA7URlhdpG53aW0FvujGwppSVl6JhAlmNgSBP1lyW3UxwJe1w1IgpGRZN8QUmOcux/fuDw5K4XF/9aJm451sM0PR5HTAWb5zBe1VD7ON1cyHs//GKmGy1YAmg231aa75f6sogQCB0qPsHtC+fO/IdzuSJKbUt3BndEfTpkFa6XTXetcCm6xwcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J82eRVFQT+TM9s6qkfZX/rClff/a8VaigjzOScg8iVQ=;
 b=rp24glRCGux087JgICXLNtO7G5HQ5Wnse1t0T9HJgjBZFOZTbfmTLJOW+2vwE3mIOXZqKc7xtQyqnd4OjRq95q6rZKsQt8vWBKbfV971BMGiBo6YKhELOf64T8kBeTFr9zh+hh6X7OH0E0hFkqO2yOjZAnfpvVCicoS2EVo/JcddbNk5M1C16Pmq2pzCaKec2ZwViOoLNvW+kZpICvS3vccuFI+UgOpFso4MBdP9BYbxVhV58hsfNbbBeAOfwyr8JedeS0GcTblxGheZ4K5QxUT3vZBTWkOqTkP1thQrJuU511CJsYRl4+1eDcVhY/mdQ2X9X9LvgUeFxFiXJKGHgg==
Received: from MW4PR03CA0054.namprd03.prod.outlook.com (2603:10b6:303:8e::29)
 by BL3PR12MB6547.namprd12.prod.outlook.com (2603:10b6:208:38e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Tue, 22 Nov
 2022 05:15:17 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::51) by MW4PR03CA0054.outlook.office365.com
 (2603:10b6:303:8e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Tue, 22 Nov 2022 05:15:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Tue, 22 Nov 2022 05:15:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 21 Nov
 2022 21:15:04 -0800
Received: from nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 21 Nov
 2022 21:15:03 -0800
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <yajunw@nvidia.com>
CC: Parav Pandit <parav@nvidia.com>
Subject: [PATCH] vhost-user: send set log base message only once
Date: Tue, 22 Nov 2022 13:14:47 +0800
Message-ID: <20221122051447.248462-1-yajunw@nvidia.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT035:EE_|BL3PR12MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f1ba7b-8d2a-49fe-bc1a-08dacc488a9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jL/J32c95K3w5bwtm8IdRB9COpsAgrjZ3BS1hzCInVPzoXWt01YKrn805kOU/UjXjnoCFSTVdYhc33JoGE/2gRmKjvPxaPTbrtwPG/Rwg2402jg+fxsvqdwHUBiTuLH93iYG/WHerE6sTsxNTbn4sB11767O23Yt4U0NDBh8Y/iS0ujx2XSAIyeMSQtGwLHVICIVD4Eex//ddFnfqQAoPRj32LxHy3gxqmsmRcVN4CLnHHrEP8DihFMgv3kcEikEjbCgQamOcSqTw7VV+gYmVRqr4sVbBvySD5cN9LFr3bdl7BDeFcqs5beAVLEsTZzPdl3RIBmObqWHWSKdJYKMuLy89TqzosVVsAY/kVUv7hQkCrPGNapMp/U6J535Zo/WOxC0EhWM6UGlFGh1LrVTLc4ISi92OWWkg54Tzpa0nmT18Ehh/j6iBBq6nRPFiATozDHiabV4PVlHgOGlL0O+qvObSeaVal4p2MSfplGHrE+VjqWwh61QAmVfOvEcjrBpoMGqaF9twbvgEiYnrC2+pdIKCH7eGGthjonMAV+VxNCvzN9hucwLB0Mqd6UIeGJA4qk33Lk1xw5rFHd6WUxv7HSwVMM7/A1pauRLThegguRkLt7nQpzIz43XCRHTjeMwp2uL8Yn9J2Wfg8GZupDTUcc4MGr1ymj82wp2FXsDAXI5WfqfSVB5eTTZa+zjoVLjqekyGSnyHlQ+3yz7KzuVaA==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(41300700001)(4744005)(15650500001)(86362001)(36756003)(8936002)(70206006)(2616005)(70586007)(8676002)(316002)(4326008)(5660300002)(336012)(16526019)(47076005)(426003)(1076003)(186003)(36860700001)(6286002)(107886003)(26005)(82740400003)(40480700001)(83380400001)(7696005)(40460700003)(110136005)(356005)(6666004)(82310400005)(478600001)(7636003)(55016003)(7049001)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 05:15:16.0582 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f1ba7b-8d2a-49fe-bc1a-08dacc488a9b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6547
Received-SPF: softfail client-ip=40.107.236.40; envelope-from=yajunw@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FORGED_SPF_HELO=1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Vhost message VHOST_USER_SET_LOG_BASE is device wide. So only
send it once with the first queue pair.

Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Parav Pandit <parav@nvidia.com>
---
 hw/virtio/vhost-user.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index abe23d4ebe..b3bdf7921d 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -526,6 +526,11 @@ static int vhost_user_set_log_base(struct vhost_dev *dev, uint64_t base,
         .hdr.size = sizeof(msg.payload.log),
     };
 
+    /* Send only once with first queue pair */
+    if (dev->vq_index != 0) {
+        return 0;
+    }
+
     if (shmfd && log->fd != -1) {
         fds[fd_num++] = log->fd;
     }
-- 
2.27.0


