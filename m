Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BB836C4C7
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 13:15:54 +0200 (CEST)
Received: from localhost ([::1]:35076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbLh4-0002A0-0o
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 07:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbLd5-0007xj-Gk; Tue, 27 Apr 2021 07:11:47 -0400
Received: from mail-eopbgr70115.outbound.protection.outlook.com
 ([40.107.7.115]:25817 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbLd1-00069e-7C; Tue, 27 Apr 2021 07:11:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZaqr/E4aotmIZ8jxGVsfdCHgXYV3qkfGj9L3RUQhivIadsYE0No85t8scEfMWs5DAw9jU/S3Y5NonieAK9B26RvNcifiB0gr8jkXRqu8NwJhE1471Ak83Biqzb8doQpQ95bgWLzotUNeO6MKrpaKbSW6VelARshdALHxD96RIHfdWkX7Dbyp5OSpVW7lTsFoZSCAK41YYYopcZwfuRcDWeQ8ZEsIFRBIkb6Vqx3xq60TeID59iTwNbeiRt0ssUdLwTWAvznVDNjAsqf2Uchu0puOfv7E/eFqxiYoGdDmTlhNZ2t4GRr1Uxrt0+7Q86Oh2z+z0MXTj6Az3SmkDJELQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J7dAfDU+UTl3putm8G3XdxUghNFgXtyogG/MVoVzJM=;
 b=NyU7ZOEko0wTE9lQXEeuNxEOlo5AI7CFRWy9UbnwdA4HDx0+tUP0P8D9GJCUPEHPHp44GJH6NQTZlspzdX3hv08AR2CBM71MsQa7QWXmQ0MRA/gLZ9DgbejimIOS1Ie7oGGXcXs8cA6cgMipEQ2Ca6MdNaG+KDQsKx18/HwT1lPvN+spuj7QssBbihnnO/HTosP/jqPPaGcQe5pXjWj06+eieiYbnMYL5l306Ub0JAsfbViTupmo3BocwH9GJBYMf/0dq9YFPSL6EQYHkC8o8HrwA0W4VmGRzqMr4BxOmBGa4mrxSyb1q1AMqfXx5Dg4plW4FrDBPsxaAdBleyDaoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J7dAfDU+UTl3putm8G3XdxUghNFgXtyogG/MVoVzJM=;
 b=Bf+1AP6lrGxEzXmDDSs4rWXCLYyGrk/jxv5L1Fn9wmEioLnpAC+FXi2DzdHpO/x2Ziv8DezU9ytSV5dq4Zmh6qqP404AmEn/94i6nk4FG8oHEnxQvCO78eyhO8jHI+a81lErFWasRI/0P5Awt73zXxkp88BOVCcnJVRc0y90qdI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3863.eurprd08.prod.outlook.com (2603:10a6:20b:8b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Tue, 27 Apr
 2021 11:11:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 11:11:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com, pkrempa@redhat.com, nshirokovskiy@virtuozzo.com,
 den@openvz.org
Subject: [PATCH RFC C0/2] support allocation-map for block-dirty-bitmap-merge
Date: Tue, 27 Apr 2021 14:11:24 +0300
Message-Id: <20210427111126.84307-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR0402CA0038.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR0402CA0038.eurprd04.prod.outlook.com (2603:10a6:7:7c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20 via Frontend Transport; Tue, 27 Apr 2021 11:11:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c60cc28-dae9-4bdf-0551-08d9096d3af9
X-MS-TrafficTypeDiagnostic: AM6PR08MB3863:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB386300C8151DC80451FF6333C1419@AM6PR08MB3863.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: foECsXEdvpA/pMGcwuuvSakxYh0lesRV2AQbFG3S/fLXBj6WmziK+PPqTgwHGgOKL5xbaXVza8dN0JWvQ/UaLwRPZiwNOv/oGJ+ekzy57PUCqpDzJwn5OQ9TGkT91tvai7sSCnq0HXBZ0QXiIyml01rhX+R7iGdzyh5rlOqiRMJXMtl2m2j5dR1Ftj8+9aG1MAINdRSVhXg3cFc7Bz1J/2ucERBaiWSCa5UIIPpeSi0SYyrK2YAAbsrf4nGl4P18e0PcjiIJbMDtHxxjBL7M3QUCJVSYhBz9BQOpN52ahd8LamnlaObG3tn8ej76PrGMO3wVd7tSKwz62CExpiR3pQURXCh99DEeexMrLymrp0pnfqZt+vuo4XHUEpBpPI3KiuuRf0qsFuZBc8Kzxt5w77b/jZTmojj5PSA9LTA/GY4UCm27av0jRKxte8Xxy2G0+n2MUFYxxHX3ZgjHkt4pJkuM05hCojCkyN82Mqsj58vtOkhtEpU6nm5pgpwbVfy9IJX+dr+/HEzde8qAAMOPL46o/E7D8cjpxUY6cwX50FLJZQP4rui3tzpTz4kqXGsWh1Ng0kGDLrJAyjIMLj1kMvjw3hgD5aDKF0gU+EuzXV+0P/tOGBBLBjGqRK8yF5To8rMy372AQEc6NF0IQ0tLoA9dRlBk6QBGCGSFqMpR0Vn8CSw//itU5Oi7rLaRJXfeEnQFvLHPiS9zwbJfa+Rd1Du3QL2AtyAyafNT4H6zUnd3z5XEgQTMs9aSaboKrxbl1DbUyOZZ9LZMQj9t640ANridvKgW/ghCCW1yFqnj+V0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39840400004)(346002)(136003)(376002)(38100700002)(966005)(38350700002)(4326008)(66556008)(1076003)(6506007)(66476007)(36756003)(5660300002)(6916009)(478600001)(6666004)(107886003)(6486002)(52116002)(8676002)(66946007)(86362001)(8936002)(16526019)(186003)(26005)(956004)(2616005)(2906002)(83380400001)(6512007)(316002)(69590400013)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?av19tdyB4Oqta5KPco9/dcmg8XTXNjr0rccGTs+LYAEkayp63AQdO4Nf6GFf?=
 =?us-ascii?Q?av6T3G1gs8AVu8vEKuyzc/hdUPvBeI0RpyRrDCnrJasu9DbZogfBIzPVulvx?=
 =?us-ascii?Q?AP3ntUkSjEzbHfj854Yq6xCKmdVz+GMmVi1awWHaCRdRmRl+U4neTYm3rHuF?=
 =?us-ascii?Q?yW/ZlNKKqCj47L0P1yC1GcnA4/3t4Hh9yagQkuGlntqCo2VbMqMjonlbliWZ?=
 =?us-ascii?Q?xOmy3wuvVf9kB/5Y1aRVcUkTZKGwwfVA9oREyBoyZtXoZMoWREvNe8OpcsOG?=
 =?us-ascii?Q?tFQHWq8p5WvDB4PhreCzOhC+jRawVvynkEm8rEZgjNf5eKeWZJSI77V6Px3y?=
 =?us-ascii?Q?jZTJB5hJoT1jC8yXDKar9YycRVXaqkECQGYve/gDmDAEWFliPiARCOBQ7WUl?=
 =?us-ascii?Q?so2cL6R2ebRIT6KVUiGJTJopcNxAvl1IZvxN83SeZaGJwqq6cFMJfiaQyNeL?=
 =?us-ascii?Q?HghDgvCxWWzg20X5RjTIN3orB4CulxTbwqhUag8GoUWJzcky2yFqz5ft563u?=
 =?us-ascii?Q?+JXwE+s+FiHM5SQPmgkJFgkVlanGYz5qpRGFrGajfOxdzd2Cmz8mEz7EGwnm?=
 =?us-ascii?Q?OOXyWgbjTQaHATZMwvggSB+tNh6ScRMgbTLkiK3va6svYzZ30QO2fOTUb/tW?=
 =?us-ascii?Q?OkkQgZI961G/dylJlZG7sgqQO9y8uJUY+EWt5TRqU7GaRbpHZCOMgTTA8Zdk?=
 =?us-ascii?Q?YJAjy+uQG2YMcirGHJlwiLTVTDHhXrIBBuq0Qh9rQ5+i79neCYeP5xG70S6y?=
 =?us-ascii?Q?0tRcQtaJ4J3mAeVW3eAuf+GTphiL2IiopBuIF1ocael5oDoaHTpuEGUfMxgb?=
 =?us-ascii?Q?ODMOmpeKBQTj+SbzbVDZqAGZIHjIL+MKyfafQJKe5TpcbI8E1CYoTTn+5EdH?=
 =?us-ascii?Q?fOew8RnoIQ+03G3ecedR+u/xDFpQHU97zcrNw3grACm3DLt1vKztnisrN21O?=
 =?us-ascii?Q?9m+VLWfLwYN+xezJqDMP/BGRBXGw/sppKWVNgc3RlnrjTK5Uo1xb93Py2ujs?=
 =?us-ascii?Q?gj8yj4cwUw8hxVlhybu0Xle6pt98akhhk/kgmm+0g+9iaKeCpbLD5hC6NoA8?=
 =?us-ascii?Q?uQZ8bljSJ8aX7T1C3W2iqu6RbSJCiRSHys5fDa+01q3hNaXPKLLqJOLAXR2u?=
 =?us-ascii?Q?pjmQvScZUYk0ObXC0nDa+wP5kpKEa1UXKkhm21PZlIGxUqSpPO83/Gp2tIDZ?=
 =?us-ascii?Q?rd9IC1mfGv2FscE/Ca08HLq63jnmm/3+BGePz3PZ6YOVOxXiQM5kZKInzUd0?=
 =?us-ascii?Q?3kTYVNdZ5p/BK6EBbANo6eHUWUarjIQH9VBzTFb7ySv6gWazNOpuLVYbARJw?=
 =?us-ascii?Q?ArKOFPNsDHFr9KfWuCfh9HQ+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c60cc28-dae9-4bdf-0551-08d9096d3af9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 11:11:39.7747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uFIbpQrd8QawsxGhjmEoffDMRYmlCuJMMqjOjWErLaQTtcmPiSZzWMi2EQ4lqupGWDxxVs5/B+S3Gf8Xkk072yaOlTNHVLxSLNktQM8oHbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3863
Received-SPF: pass client-ip=40.107.7.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

It's a simpler alternative for
"[PATCH v4 0/5] block: add block-dirty-bitmap-populate job"
  <20200902181831.2570048-1-eblake@redhat.com>
  https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg00978.html
  https://patchew.org/QEMU/20200902181831.2570048-1-eblake@redhat.com/

Since we have "coroutine: true" feature for qmp commands, I think,
maybe we can merge allocation status to bitmap without bothering with
new block-job?

It's an RFC:

1. Main question: is it OK as a simple blocking command, even in a
coroutine mode. It's a lot simpler, and it can be simply used in a
transaction with other bitmap commands.

2. Transaction support is not here now. Will add in future version, if
general approach is OK.

3. I just do bdrv_co_enter() / bdrv_co_leave() like it is done in the
only coroutine qmp command - block_resize(). I'm not sure how much is it
correct.

4. I don't do any "drain". I think it's not needed, as intended usage
is to merge block-status to _active_ bitmap. So all concurrent
operations will just increase dirtyness of the bitmap and it is OK.

5. Probably we still need to create some BdrvChild to avoid node resize
during the loop of block-status querying.

6. Test is mostly copied from parallels-read-bitmap, I'll refactor it in
next version to avoid copy-paste.

7. Probably patch 01 is better be split into 2-3 patches.

Vladimir Sementsov-Ogievskiy (2):
  qapi: block-dirty-bitmap-merge: support allocation maps
  iotests: add allocation-map-to-bitmap

 qapi/block-core.json                          | 31 ++++++++-
 include/block/block_int.h                     |  4 ++
 block/dirty-bitmap.c                          | 42 ++++++++++++
 block/monitor/bitmap-qmp-cmds.c               | 55 +++++++++++++---
 .../tests/allocation-map-to-bitmap            | 64 +++++++++++++++++++
 .../tests/allocation-map-to-bitmap.out        |  9 +++
 6 files changed, 195 insertions(+), 10 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/allocation-map-to-bitmap
 create mode 100644 tests/qemu-iotests/tests/allocation-map-to-bitmap.out

-- 
2.29.2


