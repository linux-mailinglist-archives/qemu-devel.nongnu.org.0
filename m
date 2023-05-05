Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135156F7C81
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 07:47:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puoGS-0004Um-6C; Fri, 05 May 2023 01:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1puoGL-0004R7-OL
 for qemu-devel@nongnu.org; Fri, 05 May 2023 01:45:49 -0400
Received: from mail-bn8nam11on2041.outbound.protection.outlook.com
 ([40.107.236.41] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1puoGD-0005IB-2n
 for qemu-devel@nongnu.org; Fri, 05 May 2023 01:45:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9vjY5BsbwNlrD7U+RQDlKdGlt3rb97njKJz4XI70DGKoubJxtRa02Hzgv6AGPIppB8Bpogy7ItTOvr4xTd/xUvMmNJ99I1U77pM+sHAljYdcnSLR4NBXg0sM6Ef/ZmHgoQAJsCKu4ifZHEWqilOdh7CY+EicqFWKGHdPymiC04FFQqGaIlJRnrxhgezaER0gpLSlsE6SLIn+Ve0qB7X+j4exxdvC9lmXqqVK8LYLIjHJFzOvRb2+uE+WFj45tp+Dk9lqa2fna0S8tSJ5/+TH+oBBDAfR90JePbuNfApTyvDSycAYUcc8DrZnG3jhYevwNq5owVyHEbRzlWahekieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RB6viYA0niwqHvbytGvVwv2YuHctZkUCbMRu/zsZayI=;
 b=ZX1QXq/eppu5DNQ0mgntJtfTAnE5qszeuLoF5tpMXkO924p/u5s3F9j2BYogm42oI8B2D6q9d3avTg+3TiASSzJunJc3FcTssuF64oa7IFbVQKnbo+EAzTEfWGgkytpAdMz0IWc07GMIGnXH3q/FVnbFa9A7gqXPf4Mvoakbv87PS/FosGft4OdRNHlcy0R4HciQe+01pv5L1TFxePUValRPXdcVIGFeF2Gy29q3hP9miAHzSVwWw8i2hhBCfFXCVVuCbQrNwBgC25ZqIs35nBYOeTUOWqZunL9tv9zaF0MN2P7+45dMr2y4lGVUrGvMaLR+h8+HlNENXK10lv8Lqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RB6viYA0niwqHvbytGvVwv2YuHctZkUCbMRu/zsZayI=;
 b=nMQIseSekUAaah7TNNCtLee6djqT8i6zsxrz+UFW+02iGHKpERScqtykInKnCzM2td79Nxptpg+THJ6KBp6B8GobLnmAnO3jUsWLgAyGzBgy1pSG40+yj8T3l6aOVO8qonBl2OsVeVyC4YPBC21E0e0tYM0UgR6FunSmFKtDHIdoiVTfgQlk42kpB7Fgo5cz7UimM4upyt1aOePdaN7sxEPCSY/30vYNzB+UUgwYosR4FFwKQXYe2J6sxgkBSal/JQ/5g+97MkesH1e3cDJI0TPi8q06kcyE+dBJ3ocg8K7idzolYPILTCkX9cDkYoBrGHknq7i/8Cr9Y7BKhOXj4g==
Received: from BYAPR05CA0041.namprd05.prod.outlook.com (2603:10b6:a03:74::18)
 by SA1PR12MB8644.namprd12.prod.outlook.com (2603:10b6:806:384::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Fri, 5 May
 2023 05:40:35 +0000
Received: from DS1PEPF0000E630.namprd02.prod.outlook.com
 (2603:10b6:a03:74:cafe::7a) by BYAPR05CA0041.outlook.office365.com
 (2603:10b6:a03:74::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.12 via Frontend
 Transport; Fri, 5 May 2023 05:40:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0000E630.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.21 via Frontend Transport; Fri, 5 May 2023 05:40:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 4 May 2023
 22:40:15 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Thu, 4 May 2023
 22:40:13 -0700
From: Yajun Wu <yajunw@nvidia.com>
To: <qemu-devel@nongnu.org>, <mst@redhat.com>, <yajunw@nvidia.com>
CC: Maxime Coquelin <maxime.coquelin@redhat.com>
Subject: [PATCH] docs: vhost-user: VHOST_USER_GET_STATUS require reply
Date: Fri, 5 May 2023 13:39:41 +0800
Message-ID: <20230505053941.3597784-1-yajunw@nvidia.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E630:EE_|SA1PR12MB8644:EE_
X-MS-Office365-Filtering-Correlation-Id: 624ef84f-9706-4cb0-d083-08db4d2b3f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DLUoID7BAdLjh/mVuPluhj9xLpQALs9imGAiCFqTXtkZ1zZodgldy1CSYRpAfQ8Lpn7a2fcKI9RL78NLsZpOMtb06p2+4iPBq4xZc8ts9o4nzo5vr9iYWTMz4kIbO7WLNhJPubM/CtYGf8Sbjz2ecjWBfcd7KhA8F5TS56YVXz5PSbcGnnIWv34REZuGgA77CeIDgkbnlXrW2tZnug7lHpUbkk1zfuf+NOFeDEWs0pCAy81nk5bGcaxeCtU60ll2qAnu3HDruFjzSRP6UpYlqDgkN3+jHeFE3jNrh18U1rpUNTaUQZbqVQ5m7qkK2BKZ5+m1zVOXfsfumvcPgo+vOJ7BeOWu0IT9xapfssU0wZgybp3+EsBh2XHtMwBQwyXvEH9pp/nqMTcf3iYn/1jWutPjv+ljUjAyTj+9OZPBJMJgMPS+EmXVpjRQKLw8jlHpdVbkoS4avSn3AV0qIyHGf2qIPhkEjNlrVqNzBImwyQ2oPqB1yFC9vS3WD7a7kx0tqRsUJFhawoOPcpeh40ac52hS6RnCYY+zg5wjscWsH4pBCgNBTYmb8yElKC62XKF7Fhbu4p3Clab3M0DpSPcyWWW3YDRhPRa3IibtavyLRJsCkYHZWk67RRplc9i1xXWbfJjLXWUFNLL5YAub6z7+cnaxCdEpjGrQzRHf3VivtqE+p6bpwzWkVO5goAvSjpaMk/0iftkeDuBZ9cyWpiPUoQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199021)(40470700004)(36840700001)(46966006)(5660300002)(6666004)(7696005)(7049001)(83380400001)(36756003)(36860700001)(47076005)(426003)(55016003)(186003)(40480700001)(2616005)(7636003)(82310400005)(356005)(86362001)(16526019)(6286002)(336012)(40460700003)(82740400003)(26005)(1076003)(110136005)(2906002)(4326008)(4744005)(70206006)(70586007)(8676002)(316002)(8936002)(478600001)(41300700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 05:40:34.5702 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 624ef84f-9706-4cb0-d083-08db4d2b3f7e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E630.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8644
Received-SPF: softfail client-ip=40.107.236.41; envelope-from=yajunw@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

Add VHOST_USER_GET_STATUS to the list of requests that require a reply.

Cc: Maxime Coquelin <maxime.coquelin@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Yajun Wu <yajunw@nvidia.com>
---
 docs/interop/vhost-user.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 8a5924ea75..2d13108284 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -299,6 +299,7 @@ replies. Here is a list of the ones that do:
 * ``VHOST_USER_GET_VRING_BASE``
 * ``VHOST_USER_SET_LOG_BASE`` (if ``VHOST_USER_PROTOCOL_F_LOG_SHMFD``)
 * ``VHOST_USER_GET_INFLIGHT_FD`` (if ``VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD``)
+* ``VHOST_USER_GET_STATUS`` (if ``VHOST_USER_PROTOCOL_F_STATUS``)
 
 .. seealso::
 
-- 
2.27.0


