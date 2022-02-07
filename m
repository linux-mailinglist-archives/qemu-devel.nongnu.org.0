Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD7B4AB61D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 09:04:24 +0100 (CET)
Received: from localhost ([::1]:43500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGz0X-00072j-Hb
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 03:04:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1nGyYU-0006IB-32; Mon, 07 Feb 2022 02:35:24 -0500
Received: from mail-dm6nam11on2071.outbound.protection.outlook.com
 ([40.107.223.71]:39187 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1nGyYN-0007JG-Nj; Mon, 07 Feb 2022 02:35:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0w1Gr4W06HolDn2O8g/Koj0to57HwE0i0xxfmnwVWD/tujHYJlmrgH2LHCCs9kScLKtXsHqcodk3KvM1qWYR56qX4OWXtjX0M7g1FwLmJSXbM1hOiQPfZX5FXlEuQXgxLze4Z1DSCCGPgmFNaXYOA3JW52eDUb/ff8JrDSJ4QSiO7awCb4bfKF4J33IwT5QLmjgEXrOHm38a4JqrtY3M8m+8qSRdWlswi8WxmBeHb4JlflNWBe4dgGxxhPZQRkEsSkxKZ50y02IqmvFZ14cfNRDZ7syJ9HVgtiMKNUTZD0wFYH0Y2B2yVImML5MW+/9tXLZzNqZOh9wZd5THFqQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pa9FdyH9nPS2gLyZuz2UVLB29Wh3m0sSVhv8TVY48zw=;
 b=QlfBgGt0bCgGMUtJ0U8BgIJySgzxF2HH36EF0uF3E4c+4OtjWWgeLhn+Ebdq73B7I1Z3EfhI0kGYQXI9zADQGKI46XdwAq4PLB3NyjmrZuW08iHQbHptDwyKrai+r4RGmlDuoXdBCMnd+0H48jXw+IazLRZKizUfrlilyjI/xl1uPTZK3vRVZsABTzD8fTVIQVekKLHY3GP+4m/eeJIaRWB0Gs32vyBLgSAiDchrRqHlgzEZMj6CcHVkvQ/eyFI1NXO9ti73yKFdY+/1HYRWBoAS//GpkZi8obFNPCGJ4GrIOemZGbUK0GXnytYfRBTN5SAfwI3epJKllm+srs2vAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=bytedance.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pa9FdyH9nPS2gLyZuz2UVLB29Wh3m0sSVhv8TVY48zw=;
 b=jhN5KsWCfP8bAy58aJLRT6mXnc/nOaWFSahggd7EhdF1Y/W9KTQ9aVYgqn04fJExP8GpIaRVTn9Pc0t9KqhFOaO+1wcGN2nsYHkTZifmejbUSI86zHW4C2qw58kZJzs2iePXf2AIDp2t0mW9mRQ+VsNroIWsgXTyk3gKprZIP4FKV085P8crku7gHauV+p+uby5JB1OaXepVnjP8gKJEUVpll15Zq3qXioE8WCBHze3kjblrZFL39ZAzDrrtxhwagjjjIsF1hfwLI8Adp8O5OzDxdNQU+H/m1P25agwkMzCaz0i5dn4RjJNBxiwEsNgZWrfCLx4PbC6derr4ngeUCA==
Received: from MW4PR04CA0041.namprd04.prod.outlook.com (2603:10b6:303:6a::16)
 by SJ0PR12MB5408.namprd12.prod.outlook.com (2603:10b6:a03:305::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 07:20:25 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::6e) by MW4PR04CA0041.outlook.office365.com
 (2603:10b6:303:6a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Mon, 7 Feb 2022 07:20:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4951.12 via Frontend Transport; Mon, 7 Feb 2022 07:20:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Mon, 7 Feb 2022 07:20:24 +0000
Received: from nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Sun, 6 Feb 2022
 23:20:22 -0800
From: Xueming Li <xuemingl@nvidia.com>
To: "Michael S . Tsirkin" <mst@redhat.com>, Raphael Norwitz
 <raphael.norwitz@nutanix.com>
CC: <qemu-devel@nongnu.org>, Yuwei Zhang <zhangyuwei.9149@bytedance.com>,
 <qemu-stable@nongnu.org>
Subject: [PATCH v7 0/2] vhost-user hardware notifier bug fixes
Date: Mon, 7 Feb 2022 15:19:27 +0800
Message-ID: <20220207071929.527149-1-xuemingl@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 056d2315-e7c5-4c63-e8c5-08d9ea0a4f47
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5408:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR12MB5408C013C5252CF37B41B6A0A12C9@SJ0PR12MB5408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kZVz/CwUbl31l8yI/zpwQsVRfn14OPcA84YENHGTe0dnZAAbs8J7WQOg4lk+A4K28inEV5MSWrjd+gvClvPece9GEHJzI20tlEHtM5Z0SdZWc/MjHxcCkTjKHWL4+xthogLnlBKARNp+2qYTZbsbjaGLxiSHKvd4Z2JF/g4JfLGFUXBlgj0l0w5OufliWi04PxT3oYy1J+0TuHq+uKS9IkeWlzM/ChbG1TBeo63KR2tXJyM4v/EovDHvN236k1CxgnCzoVJFVUhXNs1I88EqU4QLYebGFfG3AbJgoECmcAEmxyXLa/rq8iEufs2Wy46z13HOYPtumBSF5uk1+g5Q7o0CoE2ZnJ82ELdyvtCKyZATuF2fI2XRx0jF2wNJAeIzzxkcS64cQHQYZQQKVzbmLwA0SbZoUsDmIqHJF901LgWwlEBcY9Or3qoC8BZqL2m7BxMWlKPNZj/7n0iJLFXFgoPqYhZs36tVOYR3nCgtc8EXAbpvsSTu5oOT3H4eHb6WgveZyjdID9besANO2d9+7BKmU+qzlO6kswrD4a4Bz6gTWyhaH6dfm5OrIAfs42MKV3qFLc3FTrKQnGEoa29YlAspePMJOJLdCNvARCmhvejmUpgkK04/YrVQ5yNOr8vqqEBPD7kNDyPy51v/DjrPqF9f+mxDTPvMJKlZV9+I7nhJ4HfTfr9k0E78uSrMRl3u+c4wWkV6raT7drcHdOkJhw==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(54906003)(110136005)(1076003)(6286002)(186003)(36756003)(47076005)(316002)(86362001)(8936002)(70586007)(8676002)(4326008)(82310400004)(70206006)(336012)(4744005)(16526019)(426003)(356005)(26005)(2906002)(7696005)(36860700001)(508600001)(5660300002)(2616005)(81166007)(83380400001)(55016003)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 07:20:24.9071 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 056d2315-e7c5-4c63-e8c5-08d9ea0a4f47
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5408
Received-SPF: softfail client-ip=40.107.223.71;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FORGED_SPF_HELO=1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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

Fix 2 ciritical bugs of vhost-user hardware notifier.


Xueming Li (2):
  vhost-user: remove VirtQ notifier restore
  vhost-user: fix VirtQ notifier cleanup

 hw/virtio/vhost-user.c         | 61 +++++++++++++++-------------------
 include/hw/virtio/vhost-user.h |  3 +-
 2 files changed, 29 insertions(+), 35 deletions(-)

-- 
2.34.1


