Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD45B33B9A9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:08:55 +0100 (CET)
Received: from localhost ([::1]:34126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLntu-0008Kq-SR
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLnqk-0005Zk-S8
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:05:38 -0400
Received: from mail-bn7nam10on2096.outbound.protection.outlook.com
 ([40.107.92.96]:14270 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLnqj-0001cT-DS
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:05:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEKmnTsJxukQppGrlBzFvKb5nQCtoWd/N8tDaB40oooF4CuWr6rI5BDhQ7wQXVMqm9zjBriN7Sr4AVqoJ5pkYF9SdecqvICLvx8cgRlm/EPof8UjIoYiU1Csl4agQyTu8lywF1S0z1SEkM0O31oXTdAG+8ttcla9YFpSqkrRUnGFlIJu43KoSMIxvbdc7o81q554408EI3R47/e341lPm09C/v3AkXYS6/MN5vYu8jP4a0790A8j4C7f8ueY2nkt3tjATf6sK+Rls5y7ijvPCrz/+oGDt4uz87SFF9O8AV87AtqfAEuoIVJxUvbAlvtHfq/qBeMKYvAwywF/Eq3G4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mymC0JeJmQLY2dBfVU5O4w1Mb0n+l8b1wjDt71qXS28=;
 b=M1hCFFlQmdoA1NB0478aEzSTxj/5/stHCW5zMAABCnWZLA58RkOai/wHhhNdJDc8a1ZNqNHRyumUb98bwRzk6/E5Fe40FEBMjWpclYcE3PWPph4flpSNtX6IGM+2Gv/Y5xdCAVlQ++br1NbdkVrPccEdjtavPbEL0mygbYl1bdmLQssOpKjxtQEdjXbRngfBVTS3yOeqUitY0VPY/rYsr2GDwY+h/xi+AqfAt4nF/kw5ZvL2HzBcR48FzfSvPZ73D7+KqRADYsQt3CRPnCzZIyjT1V02Ndl/kr6oxD3a/vTyIn4hhb5uot5qrOnfq7g0QC9xdmUOsJdA4RJloGpUDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mymC0JeJmQLY2dBfVU5O4w1Mb0n+l8b1wjDt71qXS28=;
 b=du+IUsgWPYt5v6/fM6aLT47LwdcGsQW0WGRONGQVgOHYKHrw/w9pEdXIJFYibTPs7glgi/wwNgAm0e65PS2aqyVZuIDteIe/UTOtIHXYa6mO3UXhObzBWPaJLACimwKCLXOjvwSFchVemuCll801cTqtLBXVs9sNvtAufALkDpQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3933.namprd03.prod.outlook.com (2603:10b6:805:6c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 14:05:24 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 14:05:23 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] fuzz: Add a sparse-memory device to accelerate fuzzing
Date: Mon, 15 Mar 2021 10:05:09 -0400
Message-Id: <20210315140512.8357-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: BL1PR13CA0336.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::11) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 BL1PR13CA0336.namprd13.prod.outlook.com (2603:10b6:208:2c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Mon, 15 Mar 2021 14:05:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e642e10-ea05-41e1-cb98-08d8e7bb6005
X-MS-TrafficTypeDiagnostic: SN6PR03MB3933:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB39334F646E3B534EE5555292BA6C9@SN6PR03MB3933.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eh4+UQs2kUe63h3LPJPP3at/9L9//R53JN5Q5UJg6E84xVBzB5Nvwz4Fjs2W9P2EhgvoH1VhxAzlfEXTt991LRFrxCfwhAEq5Fk6bjBThxgQi7e1M+sS5ko9sJ5xKY6msixraOPD1DUmmzjapm7Fkti4TGUUIp3vTpvRhnxU2/QulrARQBPHzRRx04w4KjHFdoIH/KlhztFJhVcy/cLAprHNWBDV+xuQ6tcTT/JZ2pKBaC61LtdSG627/pRLeGASR00H3wy9LS6kFrpt57Y5HQ1JSp5qDp189bw2jEA/r0Y7ktGvEZHFmlxYPTsN4P1Xg1+RTP0m82P3KqVcSzaxKdnjNdhmpJrNluCIYO4DK1Xl+TUo7ubho9KsCTf/h8NRmikZm+t8aVoJTkoQchVlRF1IpaD4QZlX7IDDVkLMecgvjmKZd6tJPwhFn443gQc+oOhIuwPNfJRIbDvBOeyn0G7EMCx4LaLO8BypOsS/4USU3nE1oulvxux9QKHLHplP2PM5SDFgtBUdEdnsHwXymArmQYZsdCXP99T7almfLhNiYrGiRzUn6JmEnePtBq1l
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(66476007)(8676002)(36756003)(66556008)(66946007)(83380400001)(75432002)(8936002)(316002)(86362001)(6666004)(4326008)(7696005)(52116002)(6486002)(2906002)(186003)(956004)(786003)(6916009)(26005)(478600001)(1076003)(5660300002)(2616005)(16526019);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HzgRVlfDODn0ns/NArNacqvv63xYgEoWiORZ0eZzorY6S06lLddNDr0v39b1?=
 =?us-ascii?Q?aNnyLZDJupYPauCBR5bXf4jA9rjIjuVnD7M4wSrXkwniy6vOM20Ya9ApGrSz?=
 =?us-ascii?Q?Igp6eL5nnslK3AAKCgqhe82HOHskE4prJS1eWHW9XHabucK35BdRbKchYGkv?=
 =?us-ascii?Q?TGGC5lqimOsSzkTossDeg6wF+AxJ0NsKbzQLmNyl4oOW33Ducc1Np2Y6l2fe?=
 =?us-ascii?Q?VCukPBBbAYUkdiNPTBSWjVPJjf/w6CFSlQG0Qz/tTp0JqT6smoODY1BnbXEL?=
 =?us-ascii?Q?IE+S09Hg4RQ/efHBsyln/gEL8wAXzpgx9wIhdd55Bzk9RJmLHUlHQ4blCiUV?=
 =?us-ascii?Q?2IyJdnu6QaTZD/OkF1nQQMaoEZc3e0BRS13e5rOqmxv2dljCX7rWL/T/jVa+?=
 =?us-ascii?Q?H2sWDoPMnUg5EaEtD7jYLbn6XXs2yqNheIfEtRDIczuahR161vNh+U3HXgWS?=
 =?us-ascii?Q?2WEX1swZQ8FfB+YrLSwyma6DUa1nN/7MM+dREOEIwrrB1ckjBZuAkp5U1Nsr?=
 =?us-ascii?Q?Ydi1E8g2dqNx3KopGxHv1s2Z/7CIL71iNjM24PED7tPZiJ26hHWbKxqNdbFh?=
 =?us-ascii?Q?Fgrbh24XToK2cSWPjruIqKhWTvufahhamIVtzvYMRZKReUOgJMpt664kyls9?=
 =?us-ascii?Q?r3hLe2P7flnuNNTchl1LgV1LrYJ6BoxOxPf8jjLC+KhIOrzt8uvX4ebUym6R?=
 =?us-ascii?Q?k4/6P1kU5jqhVYEX3L3jb0J6PX83KRE312mt7e3e2/tiCV0czUP9j7UArHq7?=
 =?us-ascii?Q?jE0IqfREwY+V2gZH51hNqfUof9jrg/3I6Q+T5Sbr5FnFJ4N+xmOkwSp6EEhH?=
 =?us-ascii?Q?/iCElvL7E/sXIvR6qVAASaNs3rnJ8axrPSgYJ5ObNjiko2qJuZbwaMRW69wA?=
 =?us-ascii?Q?ZNw6ehllgFunnM5rC7oLRufAOCKwW2qW8tNK0lA0L7gcaOPD7TuBxCnvCmia?=
 =?us-ascii?Q?REL5ky1etOd49RTOIpkGtStucJjv4zMqe6POzhFtkBTc5siQVdYo66TbC1XU?=
 =?us-ascii?Q?delo1IflngYUb21AS1KN7KVFWm7rYYylQiUf8LLtePhOyI5rNQsvuW4Gr68z?=
 =?us-ascii?Q?oWrpInqSFn87TLzT+IsFZjOusx+pgO5X6pFeWfOwfMwQcRQA9jIMMFuscFPG?=
 =?us-ascii?Q?AdDv2P8KLNW2UunWWTCIbj87o38mc904/cSGOJm+pxK84QmXu5qubxB/rceR?=
 =?us-ascii?Q?d0VkNLi5/lYDThxgGmgn9Bj79oaTFEh/pqD2gpnYwdyKCr1E3RvI1i0DOFuN?=
 =?us-ascii?Q?Xi9G7NQoQfRCbz76gz2jED4nHG8PTeqIJdPj98GrehtQkrv8I9aksZ9xWCJR?=
 =?us-ascii?Q?w2p5ykIkHyvkmwifXlxPiNgG?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e642e10-ea05-41e1-cb98-08d8e7bb6005
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 14:05:23.0617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7iX/SZu69D1/id7VKok2okXd16xt6ciT3UJaolXODA04QPceswz7JtPv/f1ftw4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3933
Received-SPF: pass client-ip=40.107.92.96; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: darren.kenny@oracle.com, f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3:
    - Fix innacurate commit message for the sparse-mem dev
    - Remove debug printfs
v2:
    - Make the device a TYPE_SYS_BUS_DEVICE device
    - Remove the qtest (the device cannot be enabled for testing outside
      of the fuzzing code).
    - Since this will only be used for short-lived fuzzing processes, do
      not keep track of empty regions.
    - Move some DMA callbacks to properly fill DMA buffers in sparse
      memory

The generic-fuzzer often provides virtual-devices with bogus DMA
addresses (e.g. 0x4141414141414141). The probability that these fuzzed
addresses actually land within RAM is quite small. The fuzzer eventually
finds valid addresses, however, this takes some time, and this problem is
compounded when the device accesses multiple DMA regions. This series
adds a "sparse" memory device, and configures it for the generic-fuzzer.
This allows us to simulate 16 EB ram (only a tiny portion actually
populated). Thus, almost any randomly generated 64-bit address will land
in memory that the fuzzer can populate with data.


Alexander Bulekov (3):
  memory: add a sparse memory device for fuzzing
  fuzz: configure a sparse-mem device, by default
  fuzz: move some DMA hooks

 MAINTAINERS                     |   1 +
 hw/mem/meson.build              |   1 +
 hw/mem/sparse-mem.c             | 151 ++++++++++++++++++++++++++++++++
 include/hw/mem/sparse-mem.h     |  19 ++++
 softmmu/memory.c                |   1 -
 softmmu/physmem.c               |   2 +-
 tests/qtest/fuzz/generic_fuzz.c |  14 ++-
 7 files changed, 184 insertions(+), 5 deletions(-)
 create mode 100644 hw/mem/sparse-mem.c
 create mode 100644 include/hw/mem/sparse-mem.h

-- 
2.27.0


