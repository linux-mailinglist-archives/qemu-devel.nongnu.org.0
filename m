Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21F5441581
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:40:55 +0100 (CET)
Received: from localhost ([::1]:56400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhSsA-00038l-Q3
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mhSqY-0001Bg-Lo; Mon, 01 Nov 2021 04:39:14 -0400
Received: from mail-mw2nam12on2055.outbound.protection.outlook.com
 ([40.107.244.55]:26081 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mhSqH-0002CC-5X; Mon, 01 Nov 2021 04:39:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsAxWeOWHPHbio0AluOcZH10JK4glse6megi1I7GnaJEKduI8VbwqaseZl2iWfbdoj2V8mI2KezbA85eHknIwpfsZTB7f57CZffaziiMmB42QkiPPf+4LdOVkC8BozqSnMnnmmd4wi+irVdc0HquOhzw5Xnju8s33q0OiUJTMXIpCnTRbyrDlZR8oHe3QEDfYHQqzdKrw3OAGtKd/oxziybWmcvzWvWDiHUA4Ra/fUf8fNDqZfC2GHZjvMfuB9d+Rj9kxKwn4E0+WudMDU9ydSOYYivSdH4kJ4HW0fCNeBbytBsXihvB/BeSrBXxFwp49pF35Wwd5jDcwA5wk7pzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTCNeny+3WeTtpW+87Wb7JjyALUXGoNmhoIZgH6NyOQ=;
 b=AZo0my+SLqsmXpmlZwGeXowypaDSGFnFd12S6xTIqBtkHb9EjbnQIajegPUYmhtYpFPubdEoET0YW9QvrDZ01hpVg9ZTjkMbBPlzcudRj6k+faZkg+KJeBV7Yv+QOZIZOp/hrycRFjH7uj/pamv1ZWm8Tc2iTg/wdcG1+3QDvhZskA5wFjjr0Jttk0MR2jH3E5/kfgcAeCHZrTY65E/OM/VvwscDyQxpAcuuhSstArUNJnjK96uK4L5VyXh6wFsArHSjJvs785724wGv+Zw0CzI0fsmgwkDxqqih1/yuV6dK+oNOqYfPYpd1OJizLTIWFqfAjkbfKNpcP1xG2MoImw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTCNeny+3WeTtpW+87Wb7JjyALUXGoNmhoIZgH6NyOQ=;
 b=irgkyvR6iiGueTkk6u5AWjbfoEvMibA9xt7EGoQFM9VHyAnV01yY/p1TaSSJxAXibis0cbzHc1X5xCCjAkrno5DaC74Y/djMNNEoRLHlgwYkoNsUsaADa/wqJmfuV9d/1EGRPPsNQEY5t+wIOkq18USBGwso4utswhQVkbpVNP19lcNHB+VtYc5J4ajzREtIK7DlbuzQscq8JLRHUkjc4K2E4J2znuge7763LiyC5jMaE236MT9Q4sFm2PYhjRSi8ZuGGxMW6kKA/5UlYxqWfX6SrtLmf6fpYmTdPZMYkSKkxrfXyQPwWFf1CMTTaQ7oa7r3IfwQHJcxB+P60vjoEA==
Received: from MW4P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::18)
 by BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Mon, 1 Nov
 2021 08:38:49 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::e0) by MW4P220CA0013.outlook.office365.com
 (2603:10b6:303:115::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Mon, 1 Nov 2021 08:38:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4649.14 via Frontend Transport; Mon, 1 Nov 2021 08:38:48 +0000
Received: from nvidia.com (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 1 Nov
 2021 08:38:45 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: <xuemingl@nvidia.com>, <qemu-stable@nongnu.org>
Subject: [PATCH v6 0/2] Improve vhost-user VQ notifier unmap
Date: Mon, 1 Nov 2021 16:38:11 +0800
Message-ID: <20211101083813.1224522-1-xuemingl@nvidia.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 154f19c3-a682-43a9-b599-08d99d13060f
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:
X-Microsoft-Antispam-PRVS: <BL1PR12MB512629325CF2099318DE0E9CA18A9@BL1PR12MB5126.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xRcL8mQODGzTldBdAm/dZM+FYrUBaXoIvMvQfxSuSReACtm/oyaY6FCP+QWTBaSgxPFmW54jDTx6043t35IKm6/iNUKMfWwF6a5TOuTppLvN/omD0gxi6QHhFDRWRP+aLiPpHawmSFh6FNiiaz/epCZ+TEmRAg1pNX8/NdCq/wiWiZCkN7cUteGlHXx3qBHMIgLDVg8k176Byar31EiGExgc+6CQVogqg95pNO48aRhpu4ZiuGavOYL3u5sw4saNW3um1ZPny30PsGhukZubSCGPFX1Drf+pSXvnDJtxgIRpdLRaIjsy3Tp/wcOgqedKMsqG6N7ogNUCW4/wlM9+KCUZxsRF+SOBXnNprH8Dny4RZSma6ei9cZ4bXCkG5PkQdZkHyQ6IeBCEj20/M+/3qohCbnVk/aN4+FsU9zgHkOzKvabmcQ8j4TcJo5I3QL4BZ6QyRzWdXEsE0VqJOgxWuTdj6POPGm1kdehwT8XyMwWDU8h6qM0ZMbsFXHlrNHGIBMN0LEUd1+Qrv1wSatzxL29grwy1pfeuJr/KduxEAV/KQ18qnRvKiX1sqf42UFK9w3vTuw1SpnrI5HVaIadre5fartx16nDWmsgRwW40hhtj8haXoofG6qIv8aUlymon8OtdwCEUDCVJR/RLVW4AvNANn2pWZHHCwJir/losrUaHGVGtkgSN134ztWzoNDO7Arxj1VaIKFpMqWKkKzhyk6qu5xVEZ+MRdRn6zI5AvMoPCLHdBh7SQMZw3TFLW/u7OYd/zxVdcBRg3jyhaLT9pA2lj0+qszfKFFpQE/k69YztyjPp7o0gUBgYD1quL71yB98rbwKV/NZEd7ifb4zToA==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(82310400003)(316002)(186003)(16526019)(70586007)(8676002)(1076003)(83380400001)(86362001)(7636003)(70206006)(8936002)(336012)(4744005)(6286002)(36860700001)(356005)(426003)(6666004)(36756003)(5660300002)(6916009)(2906002)(26005)(508600001)(47076005)(2616005)(450100002)(7696005)(4326008)(54906003)(55016002)(966005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 08:38:48.0288 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 154f19c3-a682-43a9-b599-08d99d13060f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5126
Received-SPF: softfail client-ip=40.107.244.55;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FORGED_SPF_HELO=1.598, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

When vDPA applicaiton in client mode shutdown, unmapped VQ notifier
might being accessed by vCPU thread under high tx traffic, it will
crash VM in rare conditon. This patch try to fix it with better RCU
sychronization of new flatview.

v2: no RCU draining on vCPU thread
v3: minor fix on coding style and comments
    https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg01764.html
v4: fix first patch compilation
    https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg04060.html
v5: update 2/2 commit message
    https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg04115.html
v6: use call_rcu to avoid dead lock in rcu reader

Xueming Li (2):
  vhost-user: remove VirtQ notifier restore
  vhost-user: fix VirtQ notifier cleanup

 hw/virtio/vhost-user.c         | 63 ++++++++++++++++------------------
 include/hw/virtio/vhost-user.h |  3 +-
 2 files changed, 31 insertions(+), 35 deletions(-)

-- 
2.33.0


