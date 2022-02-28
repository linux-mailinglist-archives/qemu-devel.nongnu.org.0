Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568AD4C6B00
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:43:45 +0100 (CET)
Received: from localhost ([::1]:36448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeRL-00051D-Am
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:43:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNe-0001wm-Aj; Mon, 28 Feb 2022 06:39:54 -0500
Received: from [2a01:111:f400:7e1a::731] (port=24768
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNb-0002Kz-Js; Mon, 28 Feb 2022 06:39:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTnwVuXdgSc9gxHKLzIXZOtcWLUbVgFFtEdEap/LKEwOjuXL2HnAaABwrHXahFV4gYd3a2KSwYcJwEV89lV6Zo16/cK5l2AKkh2cYbzVllm4nZYDQjzJR7HTkIOnV14LUu5wnB3iaq+PHrdoSWDUJsR1mLFq67ImXsBh6bCCkPfwD1wWfrT0RXXB4K93TVRICAT3OXZc9TmuhstsDvHa3sOXeJJMNIvK0lV+RjH+OsK6WBt1x4OMW0FhADsfdcqPAAgZ8eFMaG7L6LWXjy3b1zqp1pV96o4GWKqYVTaTmQEHL3jrPtTEmhoQF/38oHWQl7OBYSmZw/SMrXnYbVTIgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6E/hsiZWoMvW762MiD4Vp6T296+7j0WIB4rMzfwZvs=;
 b=lMuQCsT9FOluy1gj8kOJsStIyKas+WHiaq5iLdspZgJmW1z6IeqXdy6VtYnwFmZeepmn7wY9LkBjAcOg+BlYJAK1yVJKkd6kjYz+Wuf132xtcAIk2uECudHPdkVYbzCv3+BYV5E9a2sFNrgbPEHB+2BWTuvxapRAp84ocrMUvbtM08EqktYZmpvHWkMQixYhN8hW5cC4uBbWVGyA9l9knfIoU06l8NNLAkNp50wtNqlG4+90e628DbDyVaNYpNeLLoU5gfQdzLVINujMsYXkmwHy9HTqMNO6P2dJvx0798kK2rdKrov0/08Ck0M9MMYEihSHYUt6pa36tGBAZvV8dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6E/hsiZWoMvW762MiD4Vp6T296+7j0WIB4rMzfwZvs=;
 b=bDKntrd7BlZ92VlscbjnpE9ixLdVXkyGCP0FGGIHpWzWNhn5HdZeNkQ2KoR23gRinpCRSrJ23YEXU+zrbWbsChnD0ubmHobSclq9sMoXh3cEAPJl39QOXUryzlKx+yZFXn1C8cMM1CbtUh54fmu7Ncm/e1ivpd5GtRXEIAuQiBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB4172.eurprd08.prod.outlook.com (2603:10a6:10:af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:39:44 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:39:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v5 00/16] Make image fleecing more usable
Date: Mon, 28 Feb 2022 12:39:11 +0100
Message-Id: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0135.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ff389e4-9388-447b-7119-08d9faaf03af
X-MS-TrafficTypeDiagnostic: DB8PR08MB4172:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB4172D06FB277575F1DC575D2C1019@DB8PR08MB4172.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LiWkZOOiFENo4XIa+04RKeOSyS07zHcWEpIPKnbHUhiBRXGUBhq5DvMwK+H0fd/xWywGTOSQqc+Iu8oOgzQ/67lc2xClYZeoVM1+TVvbXIyRVAJ0ysUImgbY2h/dzJObqy6johs5TzNAm5GxocrnED0PbIZSjqGZnwMM/3UN7RyEFePvs3uZeGG7rkaQJwzMJ53+X13Uy/3hWm9zA5Vlf8VLo62OyZl0qSPiCGJ4eT1Hklg0SDa0DMEL9o2j3kkW9DAr5HZkaP4zmTRTEXdQap+CKj0J8gROT28iBg5vVnUkjsEtvW+mlHOKvbazji/b+VCiG5gGTh9nQGv57LAufjpnQgjWOj6L/QAZowEhTmLgsFMzO8HSzDO+5FllxxBYmrONxf7TnISGpMZqx3byOQiOfmGwEHgULlfBktqnEFYbF/qX44cGFOn2Zen4iRbJkTrcB8jh6rQnXEYxlHD9qHobt+o3sfOdG0Yje70ZapYbm91S7G+ycGyG4q7ABr6XEf6KWqo68p2BzF3JE5gUoxZJhjMDXrzR1jCfJjLYUS1pIA2uCmCxh4wG0pPoj4But21KJIerZhWSG2fnG3zKBA0FsqVmZStHmJGdLfI7BRo/u2jMm8TLNC3Azrbi4nT9xSWiXjG3+xuZJNT6QjcmoAKPCkhHyahMr/5OxE2RwBP22EXYnkpAGfLRoR+WcYtZas09SUsf85JzxLNTxDqQbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(1076003)(38100700002)(26005)(107886003)(38350700002)(36756003)(2906002)(316002)(8676002)(66556008)(2616005)(186003)(86362001)(66946007)(66476007)(52116002)(6666004)(83380400001)(6916009)(5660300002)(6506007)(508600001)(6486002)(6512007)(8936002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bODKdWjeXs7YmJTHwNYmiMSMKgt/AdiOmNSX8h5zQlMEogllG1NH36otFiNa?=
 =?us-ascii?Q?w6AO2Re4HPbHvvRchkmOd+USeVyZEBLwzfWhulXVixZAIf3vzKKurxkprsby?=
 =?us-ascii?Q?INPUlltchMezd1wSsrYcvx2IvAvQMz2z6O2ul7Ydn9ciJLwT2GIJLCO7DOHh?=
 =?us-ascii?Q?qHnpG8Y0w08nPk92hm6w38VxMSCPNwEh9FcJ4d5lS9MTjD3GILz59uzxLYFC?=
 =?us-ascii?Q?daOcJ1jaxvYX+suPdcBj5soj59RbQWdhFmCJEHfHNBxyA2OBxW/2VfquiYZ2?=
 =?us-ascii?Q?SVDbkRDWB958upg7SfDwma2fOaNmyIEWzEgnKh8cxYCVC1SPkHhvSOLHafJx?=
 =?us-ascii?Q?WqSseNLFwK+Qt93JzCC8tkP3US2hwShuHON+hD8miwhKwJpmAP74r+UHDK0F?=
 =?us-ascii?Q?TBL3KHRdLJWICMVGgaIq/xaZTsfZzvkj24k35bZSbODn3tOQLttKocD4OHb/?=
 =?us-ascii?Q?6wJHpoEyZG1MySM4IytKA9jSpHzY57KbRqMg/IUenHXdi/j5/ZPDkTrEldyF?=
 =?us-ascii?Q?hRCS3HmRUSba1YKyiW3EPBJG4gva4AhxIrX54QCYNT+S+khIWDDxEwgSbZVd?=
 =?us-ascii?Q?zG2XDlgvhUyxoEn/RQiawqJL4iKJnwx/TyNL4tPaV4MU/vMK6+hjwkadj/Sq?=
 =?us-ascii?Q?G4UZS9HbKFVlbTsVmfcCYGg/lOqMfWAEkXckPpRpCixW43ffa7UQbkF7gDHf?=
 =?us-ascii?Q?aQ+mGsp9SIvoTcF3ibYqUzxY61EdY7u5/8Ff6YDrwNs2D/vYIYZFiJKYNWeG?=
 =?us-ascii?Q?JDuZ8P3ycfBxErCua6q8mndj4snTvMHntvq/G5v5kOcMhONYJ+jsRLM0WYpr?=
 =?us-ascii?Q?X5UGiidr2d6bdf37lImK6mKAGQ3Q1Jal1d1VtLVUse+M72KWJNrlU8ZVGXW/?=
 =?us-ascii?Q?5m47KjJTCYLD+pF6A1gVG8ZmdULo6n8qIT+0acHaEI+ava7godtkpclLFvLG?=
 =?us-ascii?Q?8PjNGhB7JuJkbAWhlq3MqPUelCs2yXFaUgj1h/3c6hOJqtzSlLKEDy2+rPlm?=
 =?us-ascii?Q?31EKsjcHoe1Dz7lBmj9BXeN0/nSAYDI1zRf/mV9R7w0nAlyRoJZAvtB04Tha?=
 =?us-ascii?Q?xumyUn3a/P+l2wGEDDqRhtsDKFgpP5vTelEgpbc5aBVAJUMoTM4tQ/tEf4p5?=
 =?us-ascii?Q?Qm9ij0tx04zjSvvpsqHuOAwzy5emS8aTZXpgMr0Ie3H6SlUu76JmCHpOmYFv?=
 =?us-ascii?Q?U1wEuIYER6VWSBpoG5Hyi48fzcZi/gY0v4MEPb3nyUQw4mY1aC0cIUKwhXha?=
 =?us-ascii?Q?Ghk9YPNxmeKRa9/nS4GlT8iUFF/2ybJ/olypeQn6IMfbSLDyK1K0lxN4qoQR?=
 =?us-ascii?Q?7ajmw5xZsrQZG/9Ca6wicKOvBhUt2N7tM93GpjHJHWo2WVQkIMw3bmcxQ1C/?=
 =?us-ascii?Q?s7tI9xIUEg0A8nTSw9V6PGCDhxGP9uKxflyPMCC8LgywYNCMR4Aza926ExUI?=
 =?us-ascii?Q?uKlqLpaTI1H2r0PzzS89fP4kkOoa266jmQkwGFe+eTudEm2snA6r9/P6WpEW?=
 =?us-ascii?Q?cFKczgsnuu2vqt/TG3pC8QtfAWMpkiTXxS3J2G1+uS0l3PIh0+KzD2lgJgSl?=
 =?us-ascii?Q?IvJtrhK8W/3EAWGrycPN5ahbXbALgzCwWUQqfVOvVAlaK8kuUcS+3fX3wO0A?=
 =?us-ascii?Q?c9hPNpc/DLNj+iwG8OHCzqPw0HApD7oVxDutafw5lbUv821ZBgb2VfamPqrz?=
 =?us-ascii?Q?d5O1LA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff389e4-9388-447b-7119-08d9faaf03af
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:39:44.1435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76EX70oVjdQIHaVa7dGAkX/7au3ZV2LJmkWR5qx9omRP2cR0v39axcT65rPVC8DgR+pSFRi2gdOVF2eJvPfhNBpsJghN7+mbblzveRuJaB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4172
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1a::731
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1a::731;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

v5: Drop immutable_source backup parameter: it's not necessary with new scheme. Other changes:
03,06,07,08,10,13 : add Hanna's r-bs
04: add (Since 7.0)
11: s/filter/block driver/, also add note about snapshot size
12: fix text and s/bs/child->bs/kk
    update iotest 257 output
14: use qemu_io_wrap_args
16: drop 'immutable_source=True' option

===

These series brings several improvements to fleecing scheme:

1. support bitmap in copy-before-write filter

2. introduce snapshot-access API and filter, to make a new fleecing
   scheme. See "block: copy-before-write: realize snapshot-access API"
   commit message for details.

3. support "push backup with fleecing" scheme, when backup job is a
   client of common fleecing scheme. That helps when writes to final
   backup target are slow and we don't want guest writes hang waiting
   for copy-before-write operations to final target.

Vladimir Sementsov-Ogievskiy (16):
  block/block-copy: move copy_bitmap initialization to
    block_copy_state_new()
  block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add return value
  block/block-copy: block_copy_state_new(): add bitmap parameter
  block/copy-before-write: add bitmap open parameter
  block/block-copy: add block_copy_reset()
  block: intoduce reqlist
  block/reqlist: reqlist_find_conflict(): use ranges_overlap()
  block/dirty-bitmap: introduce bdrv_dirty_bitmap_status()
  block/reqlist: add reqlist_wait_all()
  block/io: introduce block driver snapshot-access API
  block: introduce snapshot-access block driver
  block: copy-before-write: realize snapshot-access API
  iotests/image-fleecing: add test-case for fleecing format node
  iotests.py: add qemu_io_pipe_and_status()
  iotests/image-fleecing: add test case with bitmap
  iotests/image-fleecing: test push backup with fleecing

 qapi/block-core.json                        |  14 +-
 include/block/block-copy.h                  |   2 +
 include/block/block_int.h                   |  27 ++
 include/block/dirty-bitmap.h                |   4 +-
 include/block/reqlist.h                     |  75 ++++++
 include/qemu/hbitmap.h                      |  12 +
 block/block-copy.c                          | 150 +++++------
 block/copy-before-write.c                   | 265 +++++++++++++++++++-
 block/dirty-bitmap.c                        |  15 +-
 block/io.c                                  |  69 +++++
 block/monitor/bitmap-qmp-cmds.c             |   5 +-
 block/reqlist.c                             |  85 +++++++
 block/snapshot-access.c                     | 132 ++++++++++
 util/hbitmap.c                              |  33 +++
 MAINTAINERS                                 |   5 +-
 block/meson.build                           |   2 +
 tests/qemu-iotests/257.out                  | 224 +++++++++++++++++
 tests/qemu-iotests/iotests.py               |   3 +
 tests/qemu-iotests/tests/image-fleecing     | 174 ++++++++++---
 tests/qemu-iotests/tests/image-fleecing.out | 223 +++++++++++++++-
 20 files changed, 1378 insertions(+), 141 deletions(-)
 create mode 100644 include/block/reqlist.h
 create mode 100644 block/reqlist.c
 create mode 100644 block/snapshot-access.c

-- 
2.31.1


