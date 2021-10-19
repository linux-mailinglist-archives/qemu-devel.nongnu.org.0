Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF48433062
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:03:49 +0200 (CEST)
Received: from localhost ([::1]:41312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mck68-00043J-QE
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mck0l-0005Nh-LI; Tue, 19 Oct 2021 03:58:19 -0400
Received: from mail-bn8nam12on2074.outbound.protection.outlook.com
 ([40.107.237.74]:64960 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mck0i-0001r4-8Q; Tue, 19 Oct 2021 03:58:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPYv+1T2+6cMmrinfrc6WDHp54YGxfzI2ifnvWH0t+nrQHvhu5if4wTlQMIspIFLQbZYjEHa8jzX/x5i99W1d66bmDEFwrhxaBRdblpxqF0/ftOpuePHiDW6StGc3je2i+lTRhAsC0YchifEjlXDXbm22DFwJDhE/V9RcxbUmUmiWTj7ut/KrVK59ZfAIseqySAJv3bTO6FNt6gcU7+aylFVW4xsux2k9Dt+lhHq4MsBv1UsGR80W14i0K5isMNZtytmVOa8uiVRz0pYswS2+sQ6lzXNBkOudWnHavsIGaRtPOWAKIM2ovw78PRIp1BjFW+LdcNWycxYrr/Pl4yEag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kHSBu3s1bv6DqwNj57JAiFoNvOB9RFQ+M8JhHu6lOo=;
 b=Do2aPrYu4ygx25rRAZVfn/hs+A+4BwArX6JdFfA/imNqAkB5q8dN10S29d3E6carOEochuOvB7BvGQvjXJOfRLKwbcxqY1uxJk5RowQAivtaEdBFanDCMphdghygmKqf+L3oPmxgutAESz3oZr/j3u1m0n2rB5rvZe0p/olh2Cnb0xNv8lZgUGeIho/pphiT3H+DhEOoK5Fp2pkVciLRw2EILX7VPMjN+EDpgSUDqIOdYo666AHKDBXhaZSQ1M254HSoevB+pDdyrMvKm5wNO1JYs3WixESzZKstnfIa6aEnY0Um5w5bInbb7FocEhaszbzOUnaQ1FgNXyy6eBdaAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kHSBu3s1bv6DqwNj57JAiFoNvOB9RFQ+M8JhHu6lOo=;
 b=UJICyzrQSzLwIBw6A6SIm5Kuo7a/PdG6I+POuK+1MHmY9xD83TK2+BT9X4zGrHKN1+42Ac0FnPA9MdDB3Ixeb7711tAXCradKBF6JXNPzbEzBHi2isPodTLZFdTYg3FkWOwdg5+Ed0yFUxoOnqNzJnCLIdkhNXNKE5Mnx5DPB8hKimxaqVtNAB3KCXSNBJUZUOmeqeIDVXrXP5haKO3H9/0cLQNpHwRCGYB6dW64iscEmo/wdd8QykA0pV6KP9VBc9Igm63OxHnF+vLwVZZiufSdtmHiS+WWsOcVi481l0iajVrianHXCc32vYS2P2bG2PmucGXuVSSrtH6a8tg6HQ==
Received: from CO2PR04CA0101.namprd04.prod.outlook.com (2603:10b6:104:6::27)
 by MN2PR12MB3693.namprd12.prod.outlook.com (2603:10b6:208:159::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 07:58:08 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:6:cafe::d8) by CO2PR04CA0101.outlook.office365.com
 (2603:10b6:104:6::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Tue, 19 Oct 2021 07:58:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 07:58:07 +0000
Received: from nvidia.com (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 19 Oct
 2021 07:58:02 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: <xuemingl@nvidia.com>, <qemu-stable@nongnu.org>
Subject: [PATCH v5 0/2] Improve vhost-user VQ notifier unmap
Date: Tue, 19 Oct 2021 15:57:41 +0800
Message-ID: <20211019075743.2162432-1-xuemingl@nvidia.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35bdfd55-edda-4462-4f97-08d992d63059
X-MS-TrafficTypeDiagnostic: MN2PR12MB3693:
X-Microsoft-Antispam-PRVS: <MN2PR12MB36935572F03D817A4553E180A1BD9@MN2PR12MB3693.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:386;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e1GnvXaDaGs1hfwFI0gUspSpEQ4V6QzvrnBpdrr1ixm2eqUn96Oh0A8jBzTbYMxnHrq2rplbkaMWV7J00MUG5qdJwkX3LeStdENPmC8PAzINI+MytNb74L7TdnvbRJ9Wn3k+Eu/ZbiXvOdem++GeJBCSY+7lqQ6iilAqWM1M95IZyKCpbeQrv1V664JBtwrirTbE5K/ip73kPsESqhswynlkuiDV70cFmBUDzBGihxfV8orWDNB8GfxVA4IK0phzTEPbbZZjICBKYaS93mDvGI9xPAukzcxbcAhqFnA5Yh9RwdV9cInGwgJ/z4iXP6iOjggpJ9GvDwaeIpADsGB9ySU8yW2LusC1yvbsaCl1bcQbPfGGhgCr/x4LNAeWIqBvoDlZq0jwufOvyqmx5kXOPUMUfHFg0RZwsp/OhY5ZFhhccBqYuq+57faVoEoO8jMPV74Q5Iq4UBPdvT1UhzYJFGpYDA3Q5V7Kq3EsqkSetvN721F933rxvlBSrOcGstDeTEIVRqWcoT+IqnQvIe1f/9pr6nzt0UZ86qN2geFVNDzSRXDDHUQrgR0RoeFjrosp23DdbkD5VZ+5Q8Yxgy4lKAVcuDPgajgzNjAYTuC2zw60eTR9Cu7ajpCfXDhpJEzgD6EfrrdMsro3uwXfHBug75amdrA+BGuPTmivuOErlZPV2e/arsLxI5rEylaYGklJ9sStvu4OfYkqY/areb4TZWY6kaphXBZa1wBC1LiPkOOIA78d2+MP3x/hEFHE00sA9dFtmuSo7jxWoELrQLDuPdUevEEUFih4hhowrfFfStEr0eaaBcC8nBnXMkklk/K2YzEsf8GhjyitPNkQhI11SA==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(6666004)(82310400003)(966005)(6286002)(2906002)(83380400001)(5660300002)(450100002)(55016002)(54906003)(36860700001)(316002)(7636003)(508600001)(4326008)(16526019)(186003)(6916009)(36906005)(86362001)(8936002)(70206006)(426003)(8676002)(4744005)(2616005)(356005)(7696005)(336012)(70586007)(26005)(47076005)(36756003)(1076003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 07:58:07.5438 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bdfd55-edda-4462-4f97-08d992d63059
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3693
Received-SPF: softfail client-ip=40.107.237.74;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
v3: minor fix on coding style and comments
    https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg01764.html
v4: fix first patch compilation
    https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg04060.html
v5: update 2/2 commit message

Xueming Li (2):
  vhost-user: fix VirtQ notifier cleanup
  vhost-user: remove VirtQ notifier restore

 hw/virtio/vhost-user.c         | 41 +++++++++++++---------------------
 include/hw/virtio/vhost-user.h |  1 -
 2 files changed, 16 insertions(+), 26 deletions(-)

-- 
2.33.0


