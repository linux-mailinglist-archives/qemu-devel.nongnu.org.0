Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACA937354C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:02:38 +0200 (CEST)
Received: from localhost ([::1]:39812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBYK-0000pm-Qs
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBW6-0007ap-19; Wed, 05 May 2021 03:00:18 -0400
Received: from mail-eopbgr70101.outbound.protection.outlook.com
 ([40.107.7.101]:33297 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leBW2-0005pW-QB; Wed, 05 May 2021 03:00:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWJ9eMOLueX58Gu65RIQ8cLy+873L+rDrrOKARiAU8KhGnBrHCuhjz/sk7wLIXNTJRM4lkx99bbsw+nAkjJVO+9jz/0D0Xm1m12GCPeUFZ0Dc+kd/C8GnCMKBAtbDu1er2m1KT88jYiUoYHLrMN+yxX1AWf/GCz2Al7zCkCS9/yDTetc08zBcHrTGy+VVVQowFSk1h+kFXzHFDYR7L1JOvLC7S/sHLiLUbAGQ1Y0JLip3Kko8i4NKV6PXv1MAi94a97qGBFn648/zG9rfDq8a8qDkqrYO/lYA18mLzyyoZlQ9Tnws198z0V83hjEAuN5iWmZlyVaI9jGaBtpu/OX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uI6G/DTdYAC34tyDFgg2VzKiF4eGYixSP3d1vOsHqX8=;
 b=CmCGGq66kdPOcZFN6eKvHPYWEWzzgxy4PXarJqQGPZCfWrM/kRkaD9KWEyqpBibge3RdZTfYjVzLlgacIQQ0WyOyhUWvHXvErYATqyj4rzR72qHbRcWi1kOv3y5wnqnVaEaRkXiSsWhxzESd4MhfKrYcCSgalIhDjhOV0HOcabSJfI/HjV34i2mdKAasMFNOmpfWJHpBRcJLcqYKMH9tRYPRn3So/60GPGkojo1TXH4aL/P2srdfcLYArERj99J2qHcZx6qX8MLN2SN25hvy9I94rl85j4HnPYKXbGFPFTmL7nxU4nHcT1Gn8UmWWPNjnKFnPBVuU0yKqC+GdOZQtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uI6G/DTdYAC34tyDFgg2VzKiF4eGYixSP3d1vOsHqX8=;
 b=pJ+IoJpVn3WyUjB7+m7qMSQQKhJcQVexL3HXiGZWjoL7NsiSM39IZC1QbKRE+mqAZbBjp4ARk9rz1zvxjlVdb9DQwQ1LEgo6QnKHdY4c5KTbOyN7G2l1PFS/uLdrs/BDtmjg8yczudJpLHVd4QWpzGjiK47DlKVSdeEz7qPA1a4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 07:00:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:00:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com,
 eblake@redhat.com, berto@igalia.com
Subject: [PATCH v2 00/10] qcow2 check: check some reserved bits and subcluster
 bitmaps
Date: Wed,  5 May 2021 09:59:45 +0300
Message-Id: <20210505065955.13964-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1PR0101CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1PR0101CA0013.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Wed, 5 May 2021 07:00:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 506e19ba-5932-4946-078b-08d90f936be6
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16524EE0F8EB265E6D354B49C1599@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wOpl2cgVKJnkcz8jEIGBfAweR3Jgw7qHQ1g/Tgwp10OTmA7Iobf/BA1Lsopae1XhRJx95GtPbq1uzrU+oqlEyiYM1ImQvI6BVrlOozb5wG9INPh4g24Q+La/BY79SRwOjQH1Qhdh51ZsW63hM+182K6YvCqJXJkAxjg7FJVd1eINlYW5n15ZV3oeJVMaVppOZd/HxmghyJJPKt9pRSCEGpr6xAoYrGAmRCz4u+kHzcGnPooEXO2ZmJOE2xrM3t6uFY6t0ZQLrp8ko1lPCN+1XvGTNNKN54uZ9sRaU4xHzkVuEP/RsIYuUGECK5uqEC8XjODAcTKlYOmJxjJH7fEHPSYfYZPIBVxVCKT4OAcNw+MQnN8wUugvXShtGploT4jxdNfdy0OJQnzRReeFL25q43XlSnztGp9BxqiPNeFOHYWiWrj752YRcP5X36Mxdwv6PZI79bSU+Oj45hI/6/DjTIQmrNPOoJEmWH7d5DW0mIjWdOUWI8OImXGe233cpzJcMFac8bIB3qI8x+XLolPpAzrAOg9GlNCzTKpzvF4vDOKQ5Fxc/mv7d0WfQ60mbDH22aJ1tyg4g5V+gKybVTwZgQSldVjgmOFTzncZis5OgkP7s5XHyOwQywKfadO7Gp3b/eSLWmPGUVylirY7VF0IjvKgIso0TkshXLYB92sU9j/wZHhExoLSiUJoSrPIzxLN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39830400003)(136003)(346002)(376002)(2616005)(2906002)(956004)(36756003)(66946007)(6486002)(8676002)(8936002)(6916009)(4326008)(6666004)(16526019)(186003)(6512007)(1076003)(316002)(38100700002)(86362001)(38350700002)(83380400001)(66556008)(26005)(6506007)(66476007)(5660300002)(52116002)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/t98wWMjYqpDDeqEzYripVha6ZpkqGn51cCKUvSh9aBCVnwRxXIsBBEyY88b?=
 =?us-ascii?Q?eLXOcAEUTpaS5gsyNKmnx5fZx4MK/WkGZ4fMVJCKMgXpsDLizvnge9CMpIvB?=
 =?us-ascii?Q?IO3AgWRYRc8dUP6iym1Uxj3lPA2bmFTTY9e+/qANqhQz8gMLLLGdmLmKU94I?=
 =?us-ascii?Q?baDwDGqrz7StPKr6dMRl78h36X9niS0p2gYHOfv/5Gl7u2asX4xOf3ylH1e4?=
 =?us-ascii?Q?4z9TIuH+9elTJnvtIpTUVLswgEFOQDTehL/OTakhDV8pKXiu7x8KSSO+IbVr?=
 =?us-ascii?Q?yCkWPu5sb8GCWjxPknEpMYH3D1DXUrRJnnM0OFbak2PNv6AYKqdl+zESPtju?=
 =?us-ascii?Q?nNr42TIn9evWD2eSyFLEGfEMcUiZ1ZNjK8Bd/ZhW28aIm2X/yk5xS6O6R1eA?=
 =?us-ascii?Q?zQnlqSYdKb+yt5FLqQIyEbfC1B2Z3Tr+9B1aIhZeHkwrcwGsITi9ojYUS+8X?=
 =?us-ascii?Q?GGoWTJdnoHv9F2HyKbDa6vl69TbLKwECJ96VrbU6bJVW+2gvnwgJWG4/zVo3?=
 =?us-ascii?Q?orf11saHBXzOmkse6NoOZ2zEIfZSUaNbfQ2hdflYur2bp9tNgxZlC+IVW6M4?=
 =?us-ascii?Q?4eCqssIc2g5ptSdxOz6vprDbkpSMlVwnxVJF8gZ+3auBxAl/ou7QPUXdEKfg?=
 =?us-ascii?Q?yCu2I8KO0iidqAgZMi5yseVNA7AILL+lnaQ0l/JpZwt3UwDuofshCY724evt?=
 =?us-ascii?Q?Mty1HXL8ymWoPqGiUEX6RABD/Bkfo4tVUYBXVnkvfMEgUDJrkDwTxI2aNlAG?=
 =?us-ascii?Q?/aCAX5M/LqYeBUxvMM/3z00QWSJkOj5AXVcimIWmUW/SEJdQlMstHdos0aks?=
 =?us-ascii?Q?O4YTzvvrHzgpJlz4w+OPfcYDIdincjpmatABa7hXkPDbDbt515FN5Gvd0Bkt?=
 =?us-ascii?Q?sSlaAr4Nj+/rWrM4eFOc1rG9AdSgH+HmNo5qx2vHSFBXf2GjmbgubaAcdYcF?=
 =?us-ascii?Q?GjfoYjG1uku1ZXzOFNFrXVgSs/UvIrm3uwNKz2mBf2sn80tuHJ8Fy6RbIkBf?=
 =?us-ascii?Q?FHdrmDuGI12Rfu2SjGmvwMenTV1U/IyEqzhu9dHWcPc2cLiGWY7xXLFKuHZu?=
 =?us-ascii?Q?Oz8BzJJu/dYqfy08IMf0DmN5hGIOzdrYCKl7TaJjQULp6/2S6p03Af77pppL?=
 =?us-ascii?Q?U8+9LYWKmIu48bQBpRw4jpNWBfnt5su3NDVqMWpVUiThLvxkN3N3+h9I1V6j?=
 =?us-ascii?Q?hG3IwDlPTYnT0KrhMOMMQQ2tzutzn1I3JvdApozdMH4VcxZlLvpWrjb580RS?=
 =?us-ascii?Q?gMV0f6SrA/tbZg7IP6DTzdRgITAU6nLtcFdHPFJDwrqQY92imBAwHUSd2Sld?=
 =?us-ascii?Q?dXELaZbFiEAJK6NzxVX6nM7G?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 506e19ba-5932-4946-078b-08d90f936be6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:00:09.7917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+PIwKu/7QTrXouiFmjQsyhOH+xS2Oym50Eqzo2jtLUuLcDCA3RRzBzRGxErSB+PvwIOhKqCMyOd94QCg9/B5itJP1HUK5mPmwUqThlzdQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.7.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi all!

Here are some good refactorings and new (qemu-img check) checks for
qcow2.

v2:
Fix wording and typos found by Eric, and add r-bs to all except 08.
08: move g_try_malloc down

Vladimir Sementsov-Ogievskiy (10):
  qcow2-refcount: improve style of check_refcounts_l2()
  qcow2: compressed read: simplify cluster descriptor passing
  qcow2: introduce qcow2_parse_compressed_l2_entry() helper
  qcow2-refcount: introduce fix_l2_entry_by_zero()
  qcow2-refcount: fix_l2_entry_by_zero(): also zero L2 entry bitmap
  qcow2-refcount: check_refcounts_l2(): check l2_bitmap
  qcow2-refcount: check_refcounts_l2(): check reserved bits
  qcow2-refcount: improve style of check_refcounts_l1()
  qcow2-refcount: check_refcounts_l1(): check reserved bits
  qcow2-refcount: check_refblocks(): add separate message for reserved

 block/qcow2.h          |   7 +-
 block/qcow2-cluster.c  |  20 ++-
 block/qcow2-refcount.c | 328 ++++++++++++++++++++++++++---------------
 block/qcow2.c          |  13 +-
 4 files changed, 240 insertions(+), 128 deletions(-)

-- 
2.29.2


