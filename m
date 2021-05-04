Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1D93727CC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:07:20 +0200 (CEST)
Received: from localhost ([::1]:58390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldr1T-0005Au-7S
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqw2-0000wN-1b; Tue, 04 May 2021 05:01:45 -0400
Received: from mail-eopbgr130128.outbound.protection.outlook.com
 ([40.107.13.128]:35166 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqvu-0001xj-M5; Tue, 04 May 2021 05:01:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I45hFSZY9zi3F9tRYpr+cL0XMkZxoOsl84o9vbgBQ7mTSyGegcKZLfDIiVl1Hap40GvrAK/sIluSVsdJeRmqWfUmkD7IuyVEDkXe/wzxl1+uHn5ir5KoX3RrCPz9K53nJtRNMjJBPShE1VW8+7mkBgQQGf2N7euu4o/r89/EO8ImTKprxul9NiwyqfckqErJUdgBYgCN1DDu5F8qwkSQwV8hy85mwRGcWzS0ChRFh0+qa6OOu//5G3UwnlF/2uhhYjr7BorqGMsI6/ighkhRhopmzKX0wsUDCsBq4GQiskWdUaPwvy1TJvm/lr25F5R8/jkwLC+qMX+vG30Nd12RQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Gxfz73X+BElJ6duoWkImh45lh7Erjlc90jBEwBO+6M=;
 b=guTnCTCAPa06tu6DAd+hhCGdTPxQj2j4lEaZF8hYFg8ya33pGw/rDPb2DMGSkgkTt3nXciTRG1UlzGkLoz8QLq3fcUjpl1MeKFz4kHDyu5G8PCn4kOl4rX4vIG3TGOKyOFC9Vo96H3jONcpxr8L58Df5GWgsQd8LV+gqqbZh94Eo0hsausygq2zGNXgZxxrSGB5SGDEe8WjG0UfhTdXMxntZxbPf2DBBgHpP2HmdhF1AdPiFyTGed8HLxAlson73dtSieICxwPdHDbcbZv3DMg7dK1xtiirDjZ/93BuFVVIFdnl1z0aRbCx0dtKtny2jvFAofcIJQ55sSu3eaJ+vAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Gxfz73X+BElJ6duoWkImh45lh7Erjlc90jBEwBO+6M=;
 b=bizVbMohtqGSn1SaZXx2RsGHrxs6n+tDwBvh27Zt5bLHMRstrXVLWBv4+jlCy6ifCRT8Oj4FMZaZpo6JXQEbCpCPGHhLYZyoGSJ4ahv80vB2boWNnRQcHM5Qty+s9BvozggaPgYM/GEa0DICTGyHaAZuf7h+hOD0HJB0zTEpmZw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5077.eurprd08.prod.outlook.com (2603:10a6:20b:e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Tue, 4 May
 2021 09:01:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 09:01:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, peter.maydell@linaro.org
Subject: [PULL 0/9] scripts/simplebench patches
Date: Tue,  4 May 2021 12:01:04 +0300
Message-Id: <20210504090113.21311-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:bc::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 09:01:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 521e4858-5d46-4050-ef79-08d90edb348d
X-MS-TrafficTypeDiagnostic: AM6PR08MB5077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50770EC8EFC04582CC695C5AC15A9@AM6PR08MB5077.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:291;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D3WWnbvnRFjK84BQoSU5dX1+CV5/8g/0x9pYSqbNc/ngV/bWiMphNbpQq+vQse8FRqElmOJgx+aPHZ8jiEQphiLd+CUprpz2ZFX4X/DDicn/E9pjrJ8d5/IC3chcX7jHj9nGJ993pxXWI4bAz0mgvAu0rWC3LPxe+Wxddq/9RUEOGgs2iu8Z81Mpwtd6XcvWwFTehz9vK/Qar9ZVlXD+C2vr/X4AaNOfP58NE5qlOtlmWisLOBno2wttADa45j+1OiBFd43e5iTNk3xxTTKtZcUTV2O2pgJsLMlErVtz/6WCSrc3NANufttKk3zYVF1wWvsdcDeY3TRMPil+huVj0G+e/PcpjGs+8UaJY2GUci3ZJC0O/4PnvQcO+KS/MchApzbHFi679VED/meyXCVDDQE778Tx1INckRF5IxSHvhd+m/KENqEUXJs17ZzhAEHL4p4bTzhMW/JnLdQTuFPP/U44u7UE6MYSsBaKXXIhXOveA4/6LfNdNFBsChPRN0xeWsqrWcJEWAezVeVYxH7/G4inBgZBHuDlQYkUOKaoHFXGcpTzqWt/2Eobk1Q1zDe9GT6nwRhF97v3mtep1NiZA11bMALKNx+ioS5bJ2aI/QG2LnMP4rvzF7P+2wkXK6PfDidMitSaX5p4vUb+E0zjw2lp+KARPpNsCv9qY768XDA1lZ4AuOoVg8k56T0rnflIG0SGgJHgL7CvDiwny96IaJtxWh1WHkxvaE7ZMYlWt9Tcz957ZOWGYxpgLqBcyhyh32IGixosOZsodvbMlP7K6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(39840400004)(136003)(956004)(52116002)(1076003)(38350700002)(16526019)(186003)(8676002)(38100700002)(86362001)(6916009)(6666004)(4326008)(2616005)(2906002)(6512007)(478600001)(6506007)(316002)(66476007)(66946007)(66556008)(966005)(83380400001)(36756003)(8936002)(6486002)(26005)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?teZtLMMMmwwUaCCvA618o3LbN1CQoNEciEnX066Ci0w8ww13bycFWMMyofZY?=
 =?us-ascii?Q?i9iQZMJuKBjCQrei5JRREYCsHLgOT/Dc4pjxF45bB/oiX0+TShPMpkj55le7?=
 =?us-ascii?Q?SAUGfpzQuVvxvjccVgKYT4loA91umsEDamHPB2DopPaROdUwIXGMtiYY5Acx?=
 =?us-ascii?Q?vVIO4CMbgbqR2tRRWzdVEY4hutqlprpVtLrYew0yxRcb6uVyf03G+GpuOlWi?=
 =?us-ascii?Q?k1Ar9l8n8Sd4uMWx1AX1rbuGT2LMhKral83MW9ytjM5lpGUg4y42sRTSkOp4?=
 =?us-ascii?Q?gjgj17z7o+RRylGwRq/6PlA/RVXYatg+VhYKk1RlMZzbiVRQDYL3DRa8WL7o?=
 =?us-ascii?Q?Ea7piLyoTO5P2cqI03/6pfXExe4UXP3Ik+kgaawxYgDz2QRm59BsKMegL7Bd?=
 =?us-ascii?Q?WwVOCh6t4xYL3c/oeULSVGVobWQeby6aqt79iiN3tjx0FUlAMq1TD7lLBaLm?=
 =?us-ascii?Q?8Jcs94OJm96fNQ0Lv2xuwQzxqa6zhGrwEXD0jBF0bSo9R3y+D/iSlURtJbEz?=
 =?us-ascii?Q?33CCzpRRLwTR0+JWZh7PPngGXemuA+l9WXCl3kpJkDKeSgB248B19jesqpig?=
 =?us-ascii?Q?1hHh3GGJuOzc4dC7qscGwR99tV462KW8+39cM0r+nzfv3wKyw8wG9+YXhcDQ?=
 =?us-ascii?Q?KwoEkyWHL4entbIU9Xchm9lqHuK46fswIxPonwb/X2tfxfXle/vVCokEwYA0?=
 =?us-ascii?Q?CN76eycRha32ufjFfspESnMXeD0JghNmNmGAsp3LAsuVpN6j9an/p3u54iEi?=
 =?us-ascii?Q?kuibQcfygxVcqAiFoLtiBKlrK9HGpjLp2YKPGprL7plQsTRzIKL/CpQDrTCj?=
 =?us-ascii?Q?Jm42l12ggpEDROQMrRNGFJnvBY3ZTut3gaZl2wsiI2q9KmqhmJtV0qGGjRJi?=
 =?us-ascii?Q?cnZYETwLF6z4HR1mQPJiiTwzeC1P3d0aOfbiVgd/zSnpI6/q77QL0DBKFXvn?=
 =?us-ascii?Q?URyi/EyLMxyR54gdwbIZg6ILP5y4K/oTf3sG9dgUyaeKt6sQTg+VnSCoog61?=
 =?us-ascii?Q?VsM0+AvLREEPZFcFW80zphN8Wo1/mXOoCZjtPGrcW2Zvlc5ouvCOyaBhpSsm?=
 =?us-ascii?Q?ygZHuDFTfRd9tZyaqVpPLlo6VoKOCXmU3UY5XbSXkpoz3BBIzd6kCbUieqwd?=
 =?us-ascii?Q?mT929yfBfI8FOazXUZaAYeWDw+JTz6Y0wJHQt0NTk7kwlCEwfPCZZGgfLi9p?=
 =?us-ascii?Q?2nvxLLAfMjinohqa0JVLQJHtb2mG7aslZG17BHzvlU0rrX0IJcum/QUMq3w/?=
 =?us-ascii?Q?3aIxk70Aypkm/Y1W1OCtGNprN0HB6Fh6Y7YnthS2AUtLkXwR8exzLQYP0yjA?=
 =?us-ascii?Q?W7dKBlK1I+meyzYe0XETVqRm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521e4858-5d46-4050-ef79-08d90edb348d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 09:01:29.3204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kEdfIJ3Z4VWTjgONJMkmvRohbS8gJ6ovz84PVyyKsqxjRKRRKaI9A6YqzIylDhMyOCyQ+P54uqxf4w7sHrd3N4NjYlZ7jpa1j2CrQ1tKwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5077
Received-SPF: pass client-ip=40.107.13.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

The following changes since commit 53c5433e84e8935abed8e91d4a2eb813168a0ecf:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210501' into staging (2021-05-02 12:02:46 +0100)

are available in the Git repository at:

  https://src.openvz.org/scm/~vsementsov/qemu.git tags/pull-simplebench-2021-05-04

for you to fetch changes up to e34bd02694026722410b80cee02ab7f33f893e9b:

  MAINTAINERS: update Benchmark util: add git tree (2021-05-04 11:37:26 +0300)

----------------------------------------------------------------
scripts/simplebench improvements for 2021-05-04

----------------------------------------------------------------
Vladimir Sementsov-Ogievskiy (9):
      simplebench: bench_one(): add slow_limit argument
      simplebench: bench_one(): support count=1
      simplebench/bench-backup: add --compressed option
      simplebench/bench-backup: add target-cache argument
      simplebench/bench_block_job: handle error in BLOCK_JOB_COMPLETED
      simplebench/bench-backup: support qcow2 source files
      simplebench/bench-backup: add --count and --no-initial-run
      simplebench/bench-backup: add --drop-caches argument
      MAINTAINERS: update Benchmark util: add git tree

 MAINTAINERS                            |  1 +
 scripts/simplebench/bench-backup.py    | 95 ++++++++++++++++++++++++++++------
 scripts/simplebench/bench_block_job.py | 42 +++++++++++++--
 scripts/simplebench/simplebench.py     | 28 +++++++++-
 4 files changed, 144 insertions(+), 22 deletions(-)

