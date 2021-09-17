Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB6040F7BE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 14:36:02 +0200 (CEST)
Received: from localhost ([::1]:42780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRD61-00032N-31
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 08:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mRD27-0001FW-5c; Fri, 17 Sep 2021 08:31:59 -0400
Received: from mail-mw2nam12on2060d.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::60d]:21696
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mRD1p-0000c6-Cd; Fri, 17 Sep 2021 08:31:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8q99CPSfEaakNH8P6XqfL4vOyePNgbOr/hbJYufL8Fuin8teYgqW8VMplWLlF6fxul1JUQiaUFClQBpWLOQxqkln2QoNdE/81bdtusY3WabqDfzqVHt9Fdj7QTYQKIUjIFuUMG2eanW4ighcRd4hZsHmthW2GeoLdkKOSBNkvm6z2TztUN9Jqrmk24QzhwI/0xwUhF7FdtdQjqr0dtB2LkZO+Xo+HHhzeJua1HrJ/qM4t7HGrOcQiuQOXRqFy4ZOasm0BDQnhCSaknTsyGKs7RcyiajiIRTpybilwmkW8o/ZMFFtM5pqMZldK5z2mQSno2f7QDOvoj3dvnXGtz4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=vl+A0bAbQLdDa29U08ruYCZEZVr7zcPCDcRNjOgpmlQ=;
 b=CpueiXdqxcSQSFSM+fiicyUpMnC6eIqvKRPK3nytA95jST7kfPUXol8LQ8jLrKceDNOghRbLi+5HBJ8QNoY66qRmU+VnUQdhAP0CLubD8Ykzkexw05dye4HA6WnNB7NVNzXQPiaYWomIX+wP4uUtyFdHqHiGIua2kzGuc1Vrj3zdtI6ykPBJryXcyr/jw/Q9bZDFVBFJ/T1uBnqRqmudzUmXRTUXZqDQJv6TAFlz0pJujWs0UxyQnLUvbRsmh1CnjOHDG9beOn4OfVQLVAQi7jgN1ZfzL8GEawN3YlMAGlW3uCU9idsJpTq5MUzXcWVZDD60nhhDIQK1No5+WUDuBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vl+A0bAbQLdDa29U08ruYCZEZVr7zcPCDcRNjOgpmlQ=;
 b=gN5u74SkrvAWrj0nNFLkCf+3aYH0OL6JyQy7P7vHDlZ8B8RYy3CprYNR1q/0yJZAQqN7qkZ6WM3wjFxgBRR5lYjTIBWg/DqXuC7aAstTtQ1gR0HyAtviI6tt8/VaqXmGynF2+B+vNxVse6GXAwk7DvZD6EPgedi1bpq+Huycg+TbLN2xz8GzIARr51Njq+eTnARuQo5Yk5PYaIV9dBkIePGzUCqAcEEmOl8O7Hkw0EdvSQdKEc+f+ErgTRAOEzMCX4xrXrYyEJZ8FnLa3KgqIVwhG5fWiRAp5K16sT5AKDbeJnekMzagyC8yX5XWyKX0sm0zlo9sMTC/mMkDXiY+LQ==
Received: from BN8PR07CA0022.namprd07.prod.outlook.com (2603:10b6:408:ac::35)
 by CH0PR12MB5388.namprd12.prod.outlook.com (2603:10b6:610:d7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 12:26:35 +0000
Received: from BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::da) by BN8PR07CA0022.outlook.office365.com
 (2603:10b6:408:ac::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 12:26:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT020.mail.protection.outlook.com (10.13.176.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 12:26:34 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 17 Sep
 2021 12:26:33 +0000
Received: from nvidia.com (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 17 Sep
 2021 12:26:32 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: <xuemingl@nvidia.com>, <qemu-stable@nongnu.org>
Subject: [PATCH v2 0/2] Improve vhost-user VQ notifier unmap
Date: Fri, 17 Sep 2021 20:26:14 +0800
Message-ID: <20210917122616.6067-1-xuemingl@nvidia.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210912162014.106704-1-xuemingl@nvidia.com>
References: <20210912162014.106704-1-xuemingl@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3e9b362-15ea-48ca-a92b-08d979d66373
X-MS-TrafficTypeDiagnostic: CH0PR12MB5388:
X-Microsoft-Antispam-PRVS: <CH0PR12MB538891C10DD953B21BB3B29AA1DD9@CH0PR12MB5388.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ErtqtO/doNndEVYuDouDR2BXVW6Y0JiAKFixcXcotu+EXPa7KW4HxgBsW2POLB2qGicz/Mp8EsShDp8c9Z04i2TO2IYf67wWd+YayU5TPeDkuiE8VGibN4v1uahXYSzSy8TOZ1PPhybb4VRvJ0+ACOHf/hI1IAn2I2oO6V2CFcL/eKH2WsUJ6NARUTf/D1tSF+Jp9733dS2q443+vukIehgpxGSwU1anw6ITpy6Sy6sQHWM0MLmuTm8iPOUKcE4CyNF+I6urmnVzVR9BEZYvW4KJcoD/Sty9pilRln9TFiITF6AaioqBqXLpCbdbohabSvw5yQkDXDuak7dOhAm449kjNml3SWUZPNffBApLYKst8lZOO8ZMiY60U3KjF0yQo7U99f78/tMVuLz1w/RK8U+SK0zE1vciuDMXd3f91N61c1oHqaOBrF+JE0VqLaD8rT7+01ynDoJwWFm7f8rcQ2aedW+6z0DFybVcbUKeGfVFTnEsTiz5sqLjGdHbymDaqibYMvmwlQ5LseevN47Iw+DOp6ee124pH6HM+FAOudoblbalGwq215GPKkSQ4/33jYZSlzXl57DeYXG7fO+/5ZvCsT3zJlKL6nqhcarEilRCYnSfiFMy3HTFyTZ9O2GK8Hi/0iQkV31ackIgMWvSL6TKmt3QzV+khvu2AHJaxL9RMQBy5TRqRz8I/tzcFRzUec/Mns+BaoZitXL9euIbtQ==
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(346002)(136003)(376002)(36840700001)(46966006)(83380400001)(36906005)(36860700001)(186003)(356005)(6916009)(54906003)(47076005)(86362001)(2906002)(26005)(70206006)(70586007)(82740400003)(478600001)(16526019)(2616005)(6286002)(82310400003)(450100002)(316002)(7636003)(4326008)(426003)(336012)(8676002)(8936002)(1076003)(36756003)(55016002)(5660300002)(7696005)(4744005)(6666004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 12:26:34.6455 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e9b362-15ea-48ca-a92b-08d979d66373
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5388
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::60d;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Xueming Li (2):
  vhost-user: fix VirtQ notifier cleanup
  vhost-user: remove VirtQ notifier restore

 hw/virtio/vhost-user.c         | 40 +++++++++++++---------------------
 include/hw/virtio/vhost-user.h |  1 -
 2 files changed, 15 insertions(+), 26 deletions(-)

-- 
2.33.0


