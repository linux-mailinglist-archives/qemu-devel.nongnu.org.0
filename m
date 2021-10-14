Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5193942D5D4
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 11:17:43 +0200 (CEST)
Received: from localhost ([::1]:36708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mawru-0005rF-EZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 05:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1mawqQ-0004PB-T7
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:16:11 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:24751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.com>) id 1mawqN-0004mi-S6
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1634202963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jwgSXZSRbDg252QVcSfvjT/yzA4eu5O6xnhD0HVKwxo=;
 b=SAap36GfZwHg8/sq/xLO5acgO1RRh42KWSaM4fnyC0kYLtqHDqtU7Rg+G8xDJdcfF/G+lZ
 ewaQ9HOE+0z08w6PTh64WIiNPyhxdbFb6A/fg33oWtSUjJgfjuXlm+9fzZp/uHuXYh+4XH
 arxraOkK3+0rYeHjXKQDp5Hz9rzA6II=
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-W2OL2GfaPb-kMcIJK6EaGQ-2; Thu, 14 Oct 2021 11:16:02 +0200
X-MC-Unique: W2OL2GfaPb-kMcIJK6EaGQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHdEbX2ydYhs/Ml770TlHNHO9JKfV/OKraipXjDh80AzFvtRGTduKBkOQ7zxkurx/A5ZsQALWw3te/UwePC+VYMzywNuHVH0xvy5L1ChX2bfLuueyifzm0jPGrwYdk3c/hm+fR02dKmZm20ylxCE28g8xamf9Lt8cZ6n9S0Om4tBmcuTmLbkR9b5j/N4L1wW2DHbDPkL81g93xspTLmcMLjtZaCyxZwwzFGo32G4+aoi659itsvBS4t+CCWGZi8OZfB4hlngvsjTwPABC3X6SVq+wgUzT/IjLed1iszWI9xFICfNFR8G4FTQxHEabx2M4OZgJINI+A/Pyn9R4VReTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTlq3ThuekcQsEx9E4eoj9d0gQHA+4tZcfT9aHhDuuo=;
 b=TSUl6xLHFSb35DxKRClwXoYUbIWCehceP0cBkfFC5e83IbOkwUV0H++OR2LOt1OLu77OTo31dj78takx7ky7p0jVje+VfMle38iE09hsXMBLFllqA6RCERdIqQtj5z5lQBC8e5ASYVsbElQ1GF8V6n77fa1qCj7lKR0OtKpdrSa61gjIT7dRUlUkYcPeAhmh1twLxzSNYaai0FIdVCvO3Db4+eH+Y3TCM1mrBYAhP1uHoxn6ueM5MyVouToc4wF6aY7YWAAM3cDseAux5kAkooLtbylSR57zbkOhgH4nCF0vA8MhttkAS/PjCzEtDmrG1dlF+60PwDz4Vtd5JopeiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from AM9PR04MB8602.eurprd04.prod.outlook.com (2603:10a6:20b:439::12)
 by AM9PR04MB8826.eurprd04.prod.outlook.com (2603:10a6:20b:409::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Thu, 14 Oct
 2021 09:16:00 +0000
Received: from AM9PR04MB8602.eurprd04.prod.outlook.com
 ([fe80::5499:6698:e99f:cf7f]) by AM9PR04MB8602.eurprd04.prod.outlook.com
 ([fe80::5499:6698:e99f:cf7f%8]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 09:16:00 +0000
From: Lin Ma <lma@suse.com>
To: qemu-devel@nongnu.org
CC: quintela@redhat.com,
	dgilbert@redhat.com,
	Lin Ma <lma@suse.com>
Subject: [PATCH 0/3] Postcopy migration: Add userfaultfd- user-mode-only
 capability
Date: Thu, 14 Oct 2021 17:15:48 +0800
Message-ID: <20211014091551.15201-1-lma@suse.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0152.apcprd02.prod.outlook.com
 (2603:1096:201:1f::12) To AM9PR04MB8602.eurprd04.prod.outlook.com
 (2603:10a6:20b:439::12)
MIME-Version: 1.0
Received: from localhost (60.251.47.115) by
 HK2PR02CA0152.apcprd02.prod.outlook.com (2603:1096:201:1f::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 09:15:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10203391-40fc-41a5-a9af-08d98ef33d47
X-MS-TrafficTypeDiagnostic: AM9PR04MB8826:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB8826CE111A94B7489306F542C5B89@AM9PR04MB8826.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YKt5VMzR0sxyw6qNIJZkQhavq7FNaCQxbBTyeQlkvY/UAsQgx7N5617Lkwx1eig2ryMXmvpP/fTKigda3aOhWw+go5HsEGbE9T8nSFQoBalVC96FTNMt9/sugDNCIsyaL2iI+BksZTvUyI8+wzjuQbJCsVkowboijdoKujB9n4j3PBZFibw3l/jWbL63FfrHEFIYC+MzQWWvr9TYwQjkoHAGW2EuQLbzbGhxiAWsEz4lChF2M8H+pxztncJ1vZrPjK5aPds6c/GveYefWOEJFOXYJy5kKYHxGhjWKirIyauJAJQfiD8qkMwtwRTSp0WdoHpVwvzmtQbQ7FnlS5rd3q3WhacvZTxWZf0rFLuHakljZqSUl/xj3oKv/XKcnLyJ7NK9Ie2ZKep035oI8TDor02XmFrjjIr6WgA2yf4WM8jVVyadB3ZzTSyRIOW57oh9j1FMglTGc7eznubBdeV3VkSSzqy7pbcnR6xTAP5Mv6sqnWYa+0+ix67cu/0Q3fhZ6vUNZQzUozPfCXc5/lty9PpHFIOrD54UI3ZTXftKOQQvwWl94F6G7MGe1aZzJc86KxkR1y1zI9h1RvipIRBB4dERJh1we+7eGdLQ49j5JopLucxyrccVIWQ+NmjbUTm6Wk8ckNNXWB2D1dgaeY7QP1it/65uUrSnB89i8WsPqdyVb9D3fY94fBqh4SRQaZ7Lf7P+s8UNgs9xctaFH2Qvks6/IoHZ74GUpcJq0PvT+rg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8602.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(4744005)(66946007)(6916009)(66556008)(66476007)(508600001)(8676002)(966005)(107886003)(1076003)(86362001)(8936002)(5660300002)(38100700002)(83380400001)(55236004)(6496006)(186003)(2906002)(4326008)(2616005)(956004)(26005)(6486002)(316002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dO/n8D+d4U30UdlD6s2Pv0Z24OD5W+FmbJkT7nf2on29Qc6pTAKUSF4iX4Q1?=
 =?us-ascii?Q?ASLl4Rl9rkzTOs1mFwRgvHSgVvv8UQcp745EpDXpoiDvstHa6H6lf0SWlQGb?=
 =?us-ascii?Q?mAL5vSuT4VH8fZVqvO00BhnqVnGY76zFzEMGd7TT2JpXbRScQovL9wr5FqDm?=
 =?us-ascii?Q?YS6bwadvRJ9TfHdy7MI783iYetdmoQwOwgQT0gAp67lyGuYAOYJ2jfxGDeaf?=
 =?us-ascii?Q?n5VfvQKg1zHKVLKz33RqoI3bJGbpPM7H8AipZ+Tzz7X4OpOxE8Ik+v3DNmPF?=
 =?us-ascii?Q?kFRUtA92LGQLr0y1dlL78eSQz03LcK4TimOGI5Rt2HymZsv5eoFKKHgdK2yK?=
 =?us-ascii?Q?3b5HCJRli80OrtohI8UT01/iuVDAl/OrOdN70KZRkyMIHT/nbrSnPqGbPPmh?=
 =?us-ascii?Q?ZBiecANmg+FPgmTCOhu35CNvaw4keL2HUeHyPbG29wzj5t9tvyxYS5xNgV1o?=
 =?us-ascii?Q?AIC4K73WcowtHz/XBkg8skP67LOwBxtqW1bOILlXWf/oqgqybAyAUiyQGUbi?=
 =?us-ascii?Q?4k1+2GxrjdcDfGiWd0Xc5k0dKg/VTM/Oh+H8JSSCiXnCkEC0NhJ/5QLkY5Hb?=
 =?us-ascii?Q?6u6/eDXznzSxuseyJeHjRhjOVnEM3+gtSJBd6Olu4UnJzWv/6IB2GXn4Xhk2?=
 =?us-ascii?Q?xpW6huK0KPJDlbMhG5S7olgujOLiTr7CRUPUK0TvUbjQvnlbFIh7hMcdCkMZ?=
 =?us-ascii?Q?+jb41w8kKZgStVk8rLJ6ql0me8bAuBd3rbN2C8azTnJtb8tn42pqcI6mvdMq?=
 =?us-ascii?Q?fqgsvs81ukQgQzwenqxJRtZ4LNs0K9XSR00d1ihLK0EQVjzdE2FM2YYAV0N5?=
 =?us-ascii?Q?XnL7Qf86xEmSn9cMojTF8Gu7BRA5DbHWp3NVg346THmqM1t8CGmpaQKD3hHJ?=
 =?us-ascii?Q?q0STBSCteVN0hTEpDHCvnFGU3t6Iz0J+3gTtLXn0Ugpt3EFzhUE8QY9TkiN+?=
 =?us-ascii?Q?aUOqMZDGvFw6Tspbol8sRJkxmV5J907t0AiQDi0Q8HQKmzqm4hoNIDZ1t1ci?=
 =?us-ascii?Q?UmzxWPLVMDfTOs3R+PLOVSltaHjTbYTfk4Gn5OHMjGUEzyENvfEp6+s+pOVN?=
 =?us-ascii?Q?DGIV2KvVH26JChLAz65Zdhaud6Q5uHYfKTNJI6FULBpJX8Ojd6lefefCv3mJ?=
 =?us-ascii?Q?IELns7ctUIfy/VOkaHEWNEmcPmOQY1HlTh5jxS9P+84y7Z63AcCfVvEHFL0t?=
 =?us-ascii?Q?3C5S5T46vK54IwcYQdRtx2AP24BQI8ZBdnO1MWHidGMqc0J+sy2i7Vr6Z87C?=
 =?us-ascii?Q?fhdQDA6AWYx4Bw6HMryXvrtp3Pcgp/j//qVRlugFknuITc4E/hw2BwqiGr08?=
 =?us-ascii?Q?oX7de6Cz7niv0mt07gahKtKU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10203391-40fc-41a5-a9af-08d98ef33d47
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8602.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 09:16:00.7433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uIGjKWOd88BryvB3MA9/dZQjtDFoDGbZkZ1k4es3uLc1jQLk6oZvYa/k9BFyoUG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8826
Received-SPF: pass client-ip=194.104.109.102; envelope-from=lma@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since kernel v5.11, Unprivileged user (without SYS_CAP_PTRACE capability)
must pass UFFD_USER_MODE_ONLY to userfaultd in case unprivileged_userfaultf=
d
sysctl knob is 0.
Please refer to https://lwn.net/Articles/819834/ and the kernel commits:
37cd0575 userfaultfd: add UFFD_USER_MODE_ONLY
d0d4730a userfaultfd: add user-mode only option to unprivileged_userfaultfd=
 sysctl knob

This patch set adds a migration capability to pass UFFD_USER_MODE_ONLY
for postcopy migration.

Lin Ma (3):
  migration: introduce postcopy-uffd-usermode-only capability
  migration: postcopy-uffd-usermode-only documentation
  tests: add postcopy-uffd-usermode-only capability into migration-test

 docs/devel/migration.rst     |  9 +++++++++
 migration/migration.c        |  9 +++++++++
 migration/migration.h        |  1 +
 migration/postcopy-ram.c     | 22 +++++++++++++++++++---
 qapi/migration.json          |  8 +++++++-
 tests/qtest/migration-test.c | 11 +++++++++--
 6 files changed, 54 insertions(+), 6 deletions(-)

--=20
2.26.2


