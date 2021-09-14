Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9447A40ADB3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:29:02 +0200 (CEST)
Received: from localhost ([::1]:43858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7Yb-000593-Ic
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7V6-0001l6-0z; Tue, 14 Sep 2021 08:25:24 -0400
Received: from mail-am6eur05on2131.outbound.protection.outlook.com
 ([40.107.22.131]:32082 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7V2-000628-VL; Tue, 14 Sep 2021 08:25:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JreIFTHmGn9/IDpXQjLPqa0Qrb8TgkE4Fg6sreOuYEl4eyd2jyByMUJe51F2yX4mOkve2jVCBJTA3YrWmatKsEsVSdD070+8t4ulghDiQXIS58ce2O5BvzNoYa9XloAjCiYh03y2dnykHft7FnzIOAPt40w6nITOARm1uwvmCiRvzAIXVGmSM97OvqJLCD1pxkdWxmrqtYRvPeLNLDGlICRgiCDlKqUGkzB3taNkIUclHt1JD1WRwzW5b6SgBjxOQ9Xc7vuOy10/766S5TG9ygRxNNMB1hysRweVvrrdli3vcTFTwkIvqBsE04qTZIvVxj48OJxblBkvv0L4uP6gGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=heCasaUi+KwsPZBB8381XvkPQgORH1JMZszUf2krcFk=;
 b=Dol5DzBsXcO+nAC6bKpVwElweBbHpqs86zGU1/GCHFAnsQXclhn70GrAuB/Or2ouak55j69LQvxGN/TIUhzoel4tIi+hk2ZjFChINZanWjdP0hXe6qb5pYNbi3vGFZAJ0XqDCtNj1yJvvf/MB76ogQW2mYoZpXhKR08xtvEDcVlgSBdl1mRhZtPR5zkvlXdIeu5d0ma2iVimvUdqOam4+aalfK2yyLBrPf4crlb/c+49HGTtWo3gBY1JDmVXMf4SDO6jdXC5dLqtfCm2fmgFyChzpNpRFoX4ZOMkLAtu8NX07Npf2CWn6pKYqPjVEDdio0yVoRhC4lodiVvN90lf5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heCasaUi+KwsPZBB8381XvkPQgORH1JMZszUf2krcFk=;
 b=TAqjLt2GoQntqlGHVDoeSxzqaXMffWcRHSBwbJzSrFk4De0ZmNISG82cr7wYbebgtsyRraTbprZdrTv5mdmPZz4z2VFAeqNEYa5VE1fxY+ZUo+w7oLKbbUKkXXmQdmg2GdGhNQXkZQvZo/lLRLXSBBOOcIKEmBuK+qC2NqjiG4s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6946.eurprd08.prod.outlook.com (2603:10a6:20b:345::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Tue, 14 Sep
 2021 12:25:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 12:25:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v4 00/10] qcow2 check: check some reserved bits and subcluster
 bitmaps
Date: Tue, 14 Sep 2021 15:24:44 +0300
Message-Id: <20210914122454.141075-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P18901CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P18901CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:25:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6349e78-a823-4b3d-1e0f-08d9777ab534
X-MS-TrafficTypeDiagnostic: AS8PR08MB6946:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6946C332478EFDA81E9F1752C1DA9@AS8PR08MB6946.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d+PiT0X/PBq5XmjUOK1Ae3bfVmh3aGerQPXce1wEk8M0r8R24JY0KEW6DakD7+GRIoI96T5BGJBjZDeJ2LhK6hAiy0Xbpd34I1Jh9gwLuGjrqfvrPenXI/aNbW4oLVXDbiOeGkb1YBqNPymL1T8BZULHJV1HqDYjQW35IzR3Tj2Yo3jfu6jmHnWEvM3PN2fray9UVffP2pKaUXIHMMyTV2jasb2w+edjVmpqKAeSxkdI4GUQnBj3Ld4kEiGcu//dWiMz3xVvgOdKjNqlJzXy7sDEfp92WAhif0tqzdeY6dgk0LSiq0uD61rJzdBYgaG1EzlXFU/B5jQs4MTS5V2/IGQCHzOYDMxb7k85dQvzav3KpwwYd5ror4XJm/nB0qHHe6mnmQVVhSH4U7DB/T0x8NHCoZB7KpJgswusTcR1ludREJff5MYXDc5WcxO1tGdUWYXKfTr/IxqoPbwsixA2XPPTQXqNiZ66zGZeHwmanRPhtl/fmOT5qXgF4cU0xuT/fSJ6h0Qv2x0ZRXDKMUIYBTpVT917J002VxaCtXKmZcDIFQIgEWGAcSQuOkqz8vjHORFwI0pkXDo0wYFnftmR2yNWcjmFTSt+1vbZne4fk978ezNbWGOfVYV5+741o3vg5bm36cdcLW87/muQkoovNkjHaqcYSuse+Rg2RUYVWiZdn+UgTgYtXaObhwXO8nzPe1jjhI89coXna9Xp3sW8gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(66556008)(66476007)(2616005)(38350700002)(26005)(86362001)(107886003)(2906002)(6916009)(66946007)(4326008)(508600001)(186003)(5660300002)(6512007)(316002)(6666004)(8936002)(6506007)(6486002)(36756003)(8676002)(83380400001)(52116002)(1076003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Wn9XqlLybuLJl0N0cBm+Kp7Qc9sqxGHZiTFryO9QkPhD+lLJbGoy0pM5a44?=
 =?us-ascii?Q?9l+DD7tALdzW8Troh/g39wlOwBfeDjETBwhGXT/bHPxvtq4v3GGKFgKkhzwu?=
 =?us-ascii?Q?uQu/WvJQOAJcDp5TkHJaL9o8FwA2NGx/mrxdhu3uXhJcfyEtoX7pAe+fw1U+?=
 =?us-ascii?Q?vnzS9G6MFwakX1TtPzn6MoVdECxR+gNj0hdF30Bv3CneGDKYIO0kyBFh3SDR?=
 =?us-ascii?Q?qwXNHIWegNJnVwi7B0U5EbYfF+NKsu4LHsq9QyRAkUImz8wvkhgHciKd5Uy+?=
 =?us-ascii?Q?0aR/V4IswXuMSs4OoNn37SAMIyzaL9r4Ui5BmywyEeRgT9q8fOf9eYdMBm0d?=
 =?us-ascii?Q?+h5KEqsnUwiK3V2HtmyVWbNTVc03T2tQxu4egM+fGd0rUUpMSgeoSJIZvvHJ?=
 =?us-ascii?Q?DC2OTA5xgQgCUTg0h4+7uQguXBRjJDftircRxLr6ybdhKMjtvuDFMO/CPqxI?=
 =?us-ascii?Q?UQgCduXV4x4tq/9J/bAD/ftDO/2g16iHHG3Pn38Xbg6jn2JPlT5JzQMyVyIU?=
 =?us-ascii?Q?blv2480C0IypW2+pWfXpow1PvBlpTM9WS64nIw6vq9CzOPpjeNiLKomQesGV?=
 =?us-ascii?Q?Xz5+nR0L+sxLqv8j4dKS2+rM9TcsjaVOHMXi7nx8q14NttBDdGMvw+xGHK34?=
 =?us-ascii?Q?Slsnui9D08OtA0g5hPZEd83Zj0R3Gbnkzf8rqsJipb9kDMLh5TeteWhASWXA?=
 =?us-ascii?Q?hXa8BdFdT4Ro49Wf1m6WjzIQOV7TKR4pL4c2hbOqpaBkRcS5wFYkYrN9EKOT?=
 =?us-ascii?Q?GR3mfPWOdzIMHGYn2TwN+6L4hPMk+PkiNRcf53IIVO01zvXrVUHZFXsbeqBb?=
 =?us-ascii?Q?B/kg3GiyfvLVgsvjQgdOL91bVwRC1gafvadg8Kzd+4wUvAT/YQb+C9dSCvLE?=
 =?us-ascii?Q?JMQ1bcHsi8TSwSQf+09vBqYHH1NrXFahAMGXKQn7RgdxbDdGx3Y5mckaKUC7?=
 =?us-ascii?Q?7lzoWZgmwlrwvmEOtg59j7dyTVTWQ/XJ3ULuFcuEoY32HMVJyBDgy9qUeaZb?=
 =?us-ascii?Q?ckb5N237y67MMs9acLNKBsTU8K9OvpQi+I6XGunbeiOkgkG+ll6WCMtVucWd?=
 =?us-ascii?Q?QfIY25nT/ssG3jcdqq3WKHnn56TAuS16nSZ9cWI0hUFkTxbxreclzuYl+0My?=
 =?us-ascii?Q?cPXDKyHShQddModJMSpEJsfNL+dfssoiKhqhT6JUhM48If9WOb801ODjfbGS?=
 =?us-ascii?Q?vMAfY1LrT11JmGU4OFCDv5FITT+D2Lu5B/3Cav9QpBNM+EpU4V4hirI7Bu7L?=
 =?us-ascii?Q?OeIAMLDIOj2i9Worjm/ebzEsHPzlOwopcLvIXfmrfVfGul6dagI2Hf8nECNL?=
 =?us-ascii?Q?+QfBGihF/kDSziueIyuGxdQl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6349e78-a823-4b3d-1e0f-08d9777ab534
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:25:16.1026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3xkfEUnPKkwShcF1BSkLHoJStmpMWoD+yCOwOxFIdLYXLcP+3BI2aSrsugrDVpP1yjZbFdgFJgHNa4o/TQqyMGoa+nWWrHD7pT7FOK2+Rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6946
Received-SPF: pass client-ip=40.107.22.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Hi all!

Here are some good refactorings and new (qemu-img check) checks for
qcow2.

06  qcow2-refcount: check_refcounts_l2(): check l2_bitmap
      don't fix unallocated cluster with allocated subclusters (no strong opinion how to do it correctly)
      drop Eric's r-b
      keep Kirill's t-b (I believe it still applies, my original task didn't include error fixing)
      define l2_bitmap near l2_entry
      add separate assertion and "break;" for QCOW2_CLUSTER_ZERO_PLAIN
others: add r-b: Hanna


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
 block/qcow2-refcount.c | 324 ++++++++++++++++++++++++++---------------
 block/qcow2.c          |  13 +-
 4 files changed, 236 insertions(+), 128 deletions(-)

-- 
2.29.2


