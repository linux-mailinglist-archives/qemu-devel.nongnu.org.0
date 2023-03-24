Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BED16C8577
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 20:01:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfmd7-0005sB-9Z; Fri, 24 Mar 2023 14:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmd4-0005rU-Ih
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:59:10 -0400
Received: from mail-am6eur05on20729.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::729]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmd2-0002ID-VJ
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:59:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQHVFu+i8s3wodXTERsUItxebzB/+vi9IAltWX8L2XSVnQqtr9klxTHdNY0Qkseq4ZAKmYPvcjjRPZtv8dgjxXrfYuIQgwIj57xunpFg9PSuUY+Rg8OeKDWNUrxBjhZCgiZxb6VReX8n++/gGr/YJ/9mYnH/si+Do6gP8tmZx40ot9z+Gkdg8MkAMPSSNVtD2fp6c/1HoHEtZ/4h9bWxQJGUrZMvLGAo6CS5IafX9sKZPUkbkklQrCcBW/YO5He0DqglYfrnbg+xo/NJlvgV1Y5d7yspQnDaYty7uqRsEfkA3nN7g5mrG7IjDPsrhRKsx0pcvHSiAWZsWTLlLrCxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4u9RJTihDrbQNb6WXqGNnl5H1elHBDMZYN6QA4HIDd4=;
 b=Y2kmhi9Q1oTBHLoAzABXXRyOfx2WOJepVANx6ohQIZ3OSWz5PEoe/EDdfOBZEzNkq8khbvjt8JYscPAlmxcTGYenq1zO/qxrjT3xj7Tccv/QfoxfVD1y5HMmxrCF1Yi8rVkArEPQr+18EZ/hvIz+jXFPIl6f2TvD7YTa+c86gtw2rwIU4o2W4W6HhWY2zgD9LOB3IMljb2CIodf2fNI2E0AZwy8n2INWTrCe73pbAh9inm5PsUrS7edKsPlg6yohVntri3DVXziWU52wWPfbttT0NE2nvHoTkUCB9oMcHcRyWlhuXDDzI061InzfWHSw8pEVK8i1NBoL4//3o2S0lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4u9RJTihDrbQNb6WXqGNnl5H1elHBDMZYN6QA4HIDd4=;
 b=OnAptGkGATZmNoSlk4aUcOWFStuY7FOpqB/TFBtjrweBqMj3qwVuHTYtUCzzUd6wbwCFo7BmEnKuXQB3jiwbUfTtFzmnl76IFPQJLEIIx61bxHNEoOmjh+R0dc2pOz0ZJmdhKw9KltInDR8t1wcuKAivKtFQQt06cIW9LBAVAgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB3P189MB2380.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:439::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 18:58:56 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.039; Fri, 24 Mar 2023
 18:58:54 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v10 0/8] igb: merge changes from
 <20221229190817.25500-1-sriram.yagnaraman@est.tech>
Date: Fri, 24 Mar 2023 16:34:53 +0100
Message-Id: <20230324153501.20695-1-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0101.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::16) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB3P189MB2380:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f7ed0a7-9fce-4d3e-87d2-08db2c99d0af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tFkw1DYVxCJHDcCKRlkRtTOekLuiXadXF+NZZqAWXl3IBPX7eQQu6ecgAV/tZd4LXX69AoHyQVnx40LcNkMoZc7N/AxoXz9IfjVyOmzWxOPoYucvW2xOZsYoSpHVmMQ0BHIdPa1h+O88YG5wzodkdNdsxt8ijj6QVc33uWId+/s9YsGxgYmtN2Rns+4VQimE25jf6SkK5X5ipq3y1WJfoDLrvh9SIqmGO53fxqoem7ORg8Y2FUQcFeEhNr11/j/fdt6+PLqprY0WAVwG3m8Q6EPr5BM3xifCF9mXNltUa3rYwwQfcteAC8EBrAALT7bayXZ9sQjgxgnsoPwHmYK1bcP4HScRVKvfv3Bwtv9ccQfGIuIrDxs6AOf4vymR3vbsoytLg2GqyUTh6bpD42E227GilG97q2ruQNb1vtdAydqGDFFtWX8UGR6+vl57WhSu9HKreTEixEP/gQhZ9BubwgYRWLNCM8ULNfZ59De8Vk3yHutbnIoEuMVm0Nqy5y99v3zzcfy8YsTiaIZgZfejolB84yoGR7X0O71IFaRKT0961K2KnlrGrW/dcCgQTm8Cc3SyK2QArN7995PrdtaWJSsEhaQp61ipqkpPvl8RL/OVMHMLSNgBLGUbZzpfERjY/DG0kalXlcz2Uqodpc5rKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(346002)(39840400004)(451199021)(109986019)(66946007)(54906003)(316002)(66556008)(38100700002)(8676002)(70586007)(44832011)(66476007)(86362001)(4326008)(41300700001)(36756003)(5660300002)(8936002)(186003)(2616005)(2906002)(6486002)(26005)(6512007)(478600001)(1076003)(6506007)(83380400001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?if/9AKBoR4Zl2r+QlkWh3+nZ5ZKC0mELHGkKa3lNrrzT0JgEtwjtJ92gs1US?=
 =?us-ascii?Q?S2MbiJufDwdngvjwbB5a8EK5ydCzmR8K3k1rVJSvzlRnt2AK+jKi4qf2NdRV?=
 =?us-ascii?Q?hT+2F6WOMwTWLpNMZLVeVa8ZXCMl7VjqM+M6Ld9oQTWVd5IhyFcnYbBvUq0x?=
 =?us-ascii?Q?0OHgetbPXaI+1GHeScu1ycYjLyzLUH9WQ4HbR9oSTklgegbM05VgZW+g8eDF?=
 =?us-ascii?Q?k4G1HIk8sjPvnXPzSUWvG/7oIGNJ8ftM/1GqiMC5gx/+IpR+LD93BoboB0f1?=
 =?us-ascii?Q?olnnEGetVrN8yNGGgzYR/I/jRW1vjHnJPgMBYLwc24Kgoh2jAKbDTx76RYt9?=
 =?us-ascii?Q?9CTBxi4LGc5bSK5ptrpGjAkhYObd+rY7O4meS7cudPvGOwtjR6FhzVhwE4Xb?=
 =?us-ascii?Q?AR9kK5XktdA07X6qBMv3R0msN+Z7ZSOG6mdF8bzxV84oVC1ltL5+ilJdXmvH?=
 =?us-ascii?Q?S70Xudvm5m0TtSkA3ZePmWBuPNh/PJrpw0g13LpZiX/N0nbpJ0lps4ZE4UhM?=
 =?us-ascii?Q?TQeCSHn5Kkximx6c1HO6vOX8+wfQF86qLzqWTwHOoIg6xldGK9PI2kkiOO22?=
 =?us-ascii?Q?YkO+6WdJiFOm9eGGk3PH4pUy6joBrBfEX8Cckb15F4v6/OyGbcm4erVHDVQy?=
 =?us-ascii?Q?vpyXuj0L0tV/jMpqjJl2abaVdoYan5rlipoH7LjOomfhu5pl20jYhYrypHJF?=
 =?us-ascii?Q?EXusze6rkqAB1UitXsSguOzPz+fEPvV5i35+lvY5L3eCzi0LIu3Jglfr/GSJ?=
 =?us-ascii?Q?yrwAmHVBbRd5zgnD9vDz96xtPIbsIdkTIyEofIwTBS8x6Bg1kJICULlSYhsn?=
 =?us-ascii?Q?ojARSAE2AIpp1sXOAqPgXp6QlhSBMpSddaKwxn4nKed33Zzz/eJQlwVUI3Bz?=
 =?us-ascii?Q?kMRl22KBVturFXCGbZuSowFdr2mwstjfG+yEpjszS7CUKQkgB3EpRbjT4xa1?=
 =?us-ascii?Q?vctCzvV3K8v4e/KTx8Sp0q9Xhz/m2J7AhEHAn3lzq2drEs+cwTCptj7W5bOj?=
 =?us-ascii?Q?3IHQhYK8asLQUaLlDuciPV9a4WLh5hcDjEKJWoYq55ztjdN5UjMJL3Vn7HgD?=
 =?us-ascii?Q?EkkUDwItSk0pPie2MM7IhrN2T8+xJze14ERe7nkqw5zWZOGC4QXNLveOsGHb?=
 =?us-ascii?Q?VZofXf5wvw707db0usrnT9YEnJvpMvayOYpDiiTK0bRPaHJYQDin4A+OssMw?=
 =?us-ascii?Q?jRfJjR2jswOqBNm1v1jdvXB4ENoQQLCHFTnwXVcGxxxKIhHn+frksHPKFS+m?=
 =?us-ascii?Q?8NrCSvJt+nVb0h782XxsWalO2pmaWnd5dY4NpbeuhtUTsEopOxQfQ1kta++H?=
 =?us-ascii?Q?zx7h4uuS5GW/Kb7k1U1H5IK9JJ+oOKaBSdoMC9cs0njtfzkMtFR8W8KtYTrY?=
 =?us-ascii?Q?V1m3quXwnLCE0qzabO/HgJ2loEEOBQZyLEg9/mnBhqVtJbbdj6vjP5RCcYEy?=
 =?us-ascii?Q?1/xmdUw++t57DYnpiPX+EdfFmF0k1TlruPGkmJXtgIt/4rRWUZsERGL+BzDC?=
 =?us-ascii?Q?kktxooJVXBwKunUkV0du+6e1Tr+xKpONtKb1K3w6bHlMx8FTaGMg4O3X6NH+?=
 =?us-ascii?Q?oG36SHR1b0kRoG38iedLSSEmHuh9zzzyFsiu7P0z8w4gafODVSpG1H3FBcWx?=
 =?us-ascii?Q?ow=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7ed0a7-9fce-4d3e-87d2-08db2c99d0af
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 18:58:54.6777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1RfbiQfP+MSvuoE14bGm2n/OskNta7yinesnh5809RSTPV3eE5Nbd4AcllPWX+3hVS8LNeiXl0v89rvWIRZSH7Ei0pn9yk/e1b1+pAlvjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P189MB2380
Received-SPF: pass client-ip=2a01:111:f400:7e1b::729;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Based-on: <20230324095434.44973-1-akihiko.odaki@daynix.com>
([PATCH for 8.0 0/4] igb fixes for 8.0)

Now that Akhiko's patchset for introducing igb device is merged, I have
rebased my changes on master. The changes proposed here adds support
for 
 - Correct PF/VF reset handling
 - Introduce ICR_RXDW register definition
 - Impement support for VFTE/VFRE/VMOLR_RSSE/VMVIR/VMOLR registers
 - Check oversized packet for VMDq
 - VF statistics

Changes since v9:
- Yet another rebase

Changes since v8:
- Set RSTI bit on PF reset

Changes since v7:
- Adapt to "igb: Save more Tx states" patch from Akhiko
- Fix bug in VMVIR patch for inserting vlan, do not overwrite context

Changes since v6:
- Rebased on latest, which includes igb device introduction.

Changes since v5:
- Added back an unecessarily removed empty line

Changes since v4:
- Removed the change implementing VTCTL.IGMAC, it needs more thought
  and implementation of DTXSWC.LLE and VLVF.LVLAN first

Changes since v3:
- Fix comments
- Rebased on latest patchset from Akihiko
- Remove Rx loop improvements that Akihiko has pulled into his patchset

Changes since v2:
- Fixed more comments from Akhiko
- Reordered the patches to make changes easier to understand

Changes since v1:
- Fix review comments from Akihiko


Sriram Yagnaraman (8):
  MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
  igb: handle PF/VF reset properly
  igb: add ICR_RXDW
  igb: implement VFRE and VFTE registers
  igb: check oversized packets for VMDq
  igb: respect E1000_VMOLR_RSSE
  igb: implement VF Tx and Rx stats
  igb: respect VMVIR and VMOLR for VLAN

 MAINTAINERS          |   1 +
 hw/net/e1000x_regs.h |   4 +
 hw/net/igb_core.c    | 212 ++++++++++++++++++++++++++++++++++---------
 hw/net/igb_core.h    |   1 +
 hw/net/igb_regs.h    |   6 ++
 hw/net/trace-events  |   2 +
 6 files changed, 185 insertions(+), 41 deletions(-)

-- 
2.34.1


