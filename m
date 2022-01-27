Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5E949E918
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:33:51 +0100 (CET)
Received: from localhost ([::1]:33854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8eb-0003SS-WE
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:33:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD88t-00042P-Kj; Thu, 27 Jan 2022 12:01:04 -0500
Received: from [2a01:111:f400:fe06::708] (port=63135
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD88h-0002Rv-Rq; Thu, 27 Jan 2022 12:00:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1ykCELF4i10XgPzkq5/AlQD338vpAymLmIIRQxwuesqRlHUclph5wbLz3a7ys2geXgOIJGkcZDBRalx6LJLD9ejWCkYF2na9M8Otu9LbV9+SIzEcFPtSwbJ7Jvbj1LV7+ehwaNKOQGa61yIB4VvPeTiOPSdpYsthE0IPIhoNkp9ryMn9prG+3/5/ZUhMp05M/jLjpFcDoRPQcxwc5JrQ5HxonQDyl6tlw+pT2UfwyCzjYBMw8Q8o7Wt2lrjwIuOZjXh2407eGT8NxZIrOVvXqLzyytgE+edL5nBIVrGXLXsYAW4UHV+FJMa84OFq+S7FZcD5DP720an1Ou/5b9zug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZwTfb5AudalZSQ1sT/gRkew4bU/XsCHS5MAmwxzOrI=;
 b=irfCStdl3Zx3LBi2MgekSKYrppj5DBkdyXsz+OnBMyGSxWz7pOUNnCRsJrPVyDA6TEGteGK2VeRQFC8Lr083t9i/FwNM6nlWnNj8DHs8mBDF80fL44xsLk6KPpSdEEf8nYlU/AR3p1Dmfx4y8+dUiqivJVJQyarhY8Kijz2lWefQVVFA9U6QbO7eO7SmS4bhRfGmY0rebKFWGDpbrT11sQAbt8MmNIxfJuetySZiNigTdvHyTurN/HFqkG1K1hYIQHbfsf311kTRNzTglBXEbnh2W8ta3D0+yVkXb6GoIwpDNRo2Ijm1yrmFcxPtnFt7jn9rOatnuUWAgJC28Hdruw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZwTfb5AudalZSQ1sT/gRkew4bU/XsCHS5MAmwxzOrI=;
 b=SUvCZ2ZVij3MNrsB7EkQsv6zfm+7ialuaTIfmPZl3yT1PvKOAAw/xeIpjh8rrGugf21jh+numkGqgRo4zo3QxU0ghluslVJR1Tcw+7Bxj12CpFGxKsN+wTRuZvnWVH2bAXOaqR49S2Bp0eOYFOiCtllyAZ49fSw9vELxlB29NxE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4436.eurprd08.prod.outlook.com (2603:10a6:208:13a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 17:00:29 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 17:00:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH v2 0/2] qcow2: add keep-dirty open option
Date: Thu, 27 Jan 2022 18:00:17 +0100
Message-Id: <20220127170019.3292051-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR1001CA0072.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::49) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3546f63b-c08e-40e3-e62f-08d9e1b68552
X-MS-TrafficTypeDiagnostic: AM0PR08MB4436:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB4436BF3EFEAE51201587F667C1219@AM0PR08MB4436.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:188;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G+banzb3iUl0ULVWGuDeKYaKW3HeerSbQyDmsMmhmQcLccRIt169EYF/BkBRqayDWgK8h5IAAMCvJIT2M4BEEtbAKbmNdSt/2821aejwyNsYrHht5Yz6GJ7zTAiYJUm198Wd0+kRU3Ld8VT5AspKIByo1+ko77uZCRTufKlGSVhS8LYQGUuaR+USmerkFDPrGHmc9DTVm9Kda8cVspCELf/8eXPYTo6PtAHJhpvu8kWScI4cnW6TxWIn3HE15X2FzXDujDErXiuTM5QvJGpYvP/G3vglg2UOBiAjh0hXCA2Ls6Vhfro0aabaguLCpXsHTRJk6yIYd+iHoOSE2Ga2xCHsr90wk6EGy7II8ycprXGhG7ykdX+rd7lC1B6MvKUbHaNQjiCVwUuqelbzkI3MxXYnby1c9FgpjZ6g4rntZLJJfzZ0sUVUmDuc4tryo6n/L0l7OvZXv+kDVsvsIA44328frwjKsfBsDQD9172Kf/zAql5fev0EdxX+sXU/QLxfWGuYAlbQIPGtQoFkIsm1wOxioXt1KiUnGnxHiWLPwNSWeIOW37opJGyXK44wH+p2R/YoFzcieFmuKl9wTiYpGPvKALMNUXsOJ9wISc+0tCaLZKixWGfUuX30gloBTnBBEb0x7UdLPU6dm70QIBRiF1xJ5UzxrLYdyDLhIPoVeHV3j0s0LdY7wwQ7SXDTDAu1yfNESQ2D1zmKw3sKtPbFMdJV4f5iQbALixlB53zgUa0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(107886003)(6666004)(6512007)(2616005)(86362001)(6486002)(26005)(186003)(83380400001)(52116002)(6506007)(1076003)(508600001)(66476007)(2906002)(8936002)(8676002)(36756003)(66946007)(4744005)(66556008)(6916009)(4326008)(38350700002)(38100700002)(5660300002)(316002)(14143004)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8mKomzw4jnt2H1v5qimCbipTgdLQynGA8CSiGQLXjxBNodxqsLmORkLak7pC?=
 =?us-ascii?Q?vzkM4ETGErZZJewXHsjWeaZxTj1hoOTOL7aDw8DdxRlAIPyVg536ERM4C4ZD?=
 =?us-ascii?Q?lmG8LnLw8VK6T3W1YYJ+jYKXnglQTQsaAAw6vejNdDUu2ww5bZZX8ZOQK5nz?=
 =?us-ascii?Q?4ForgbiDopf/e+ynic5pLU05oHAg0TQGZ+E0B5uQRFtJzhaFCTB+8+XQlJMr?=
 =?us-ascii?Q?vbD8Po/Mbxgh9aK08xkbVvtZFSFE+t0N6fZox2tTBrMOLuV8mzg7S12DIDTK?=
 =?us-ascii?Q?lmxoVv3n+Y4c1o9ELj56VB+J4vlqflsOOMiMXjiGjiYkWAQtPH9SuRqtAwp1?=
 =?us-ascii?Q?m1j+j78hOPn+N1PujJ5m1B3jhSeysY/Udc53gzyCULSBY3wev+SBy2qKaxk4?=
 =?us-ascii?Q?VnFKVBnIdycyhumbfV1lKJ2LqnOcD4Cq4Jnt+JHsgGBP7UsHZvB9AZGKcps7?=
 =?us-ascii?Q?GdiHp5x9lJMMn/1eeu7cJIxIRu2DhRQaDqTY8ApPp5Og9IgieZLPiY1A77iF?=
 =?us-ascii?Q?GoMO3VoodfVHDcFpuA2DOv0xBsEqmdk6q78PJIU9HUaCTMEVwEQI5Bhg/yqq?=
 =?us-ascii?Q?YdseTmG6j+IUyIowoof3hH9zbnkU9MVoTWi+cBtYWtclaNQ3WJ0/foUh/1x/?=
 =?us-ascii?Q?71liUHzt+C1vFMsRtl0s+iC25N89EqqEwyFxSp063vCMWGabwvJCNPmsFRPn?=
 =?us-ascii?Q?hn6iF0AALmkyqH4TQMWmAJ322qUjy7FVPjXJm2zk1TBJfxNl8HY+j4qJLE/y?=
 =?us-ascii?Q?RvxUj/ZL9fUBBiZXuQHzh6mqtcZa4vp0R1WNS7m+UFO/QkC973TYmOq/iXD6?=
 =?us-ascii?Q?shpRQF+orXZd1Qbfb1fVegsMezPCfyHEQuuhEa8ZnGDo/s5ZB2Ihm2FhGIf+?=
 =?us-ascii?Q?JUQXC6+B4muK7Z4tyHkXvml2i318ETStefC05QUBQnF4qUvB03KqDQOqkZ6I?=
 =?us-ascii?Q?DIosSsIiksJjoj7npYieQa1H0GZF9oAUAUGrh7spYoPHZ790bLUMIjspCzpo?=
 =?us-ascii?Q?8D7iAKSlgQIHFm59Wh/SAY8MvggsllR3RIwMDjCnzcwL1iAwRoB1H8JJgEjM?=
 =?us-ascii?Q?aRjd9gIBwGj3TVu2chRGwxQO+4Vucixsr4Xtgqu6H+K9ykl81F8HWQm6M3q4?=
 =?us-ascii?Q?4b+Ywwcnh8vsqiabg/uGBsfjqPBdX5NiXyrg/xB9egcsdBPlEvvCSmMRIrhf?=
 =?us-ascii?Q?ULTbVtsS3CfWTa0b/UMxGyQzu/kzQmqzO3JeKpE6dkd+G/Oy8Plnt20tZFAp?=
 =?us-ascii?Q?vzEDsppH3IF1XNDYeEopjoJ89WIIy3dwkX0p2mbszcnw/169A+g7XtvJSqec?=
 =?us-ascii?Q?+ssJsBs+tAMMoU4JJOoGgZudnbmpLdfQefxMP30u8CC2kdociA5uYFjewl+y?=
 =?us-ascii?Q?2rD5HjL630HtKnsvGElUuvbIQcA+Hp8UHsgo+ajPxxjPefaOOXhntJF2IAVh?=
 =?us-ascii?Q?n9ahQgyvU5v4AUfxCBR9S11wkJ7NWYDNXpQnS19/TH6ocBo+h6wGv4+BYtyw?=
 =?us-ascii?Q?O7Qhc5r/Ru16eeCozfszqIf+T1jv7bNWH2lt00x6wcxYhbp5zDEfxNwmG02G?=
 =?us-ascii?Q?PHXFbiTbY4hs3pnHQudbOczmKyfCY01k/kdv6Sl6yFWj5f7/1adxTcsOxstA?=
 =?us-ascii?Q?CAp7Z6idbM1eoU0xZkrsA9jF6K0atEWiIloHMcQST2HEwziaajABLpxcjQRs?=
 =?us-ascii?Q?l75lZg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3546f63b-c08e-40e3-e62f-08d9e1b68552
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 17:00:29.1422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZKE5jjyy0hJCd3R4WMPrb+9GJohf2+3o0P2rQVptcUIylRz/4/zsPs3Kl4Je5//KXHBopv28bJONSI75a9o2Z44rK4Cpk6tSZMedb3IUeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4436
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe06::708
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe06::708;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi all! Here is suggestion of a new option which we need for our
developments in Virtuozzo.

For details look at patch 01.

v2: - drop relation with lazy_refcounts
    - improve documentation of new options in qapi/

Vladimir Sementsov-Ogievskiy (2):
  qcow2: add keep-dirty open option
  iotests: add qcow2-keep-dirty

 qapi/block-core.json                          |  8 ++
 block/qcow2.h                                 |  2 +
 block/qcow2.c                                 | 61 +++++++++---
 tests/qemu-iotests/tests/qcow2-keep-dirty     | 99 +++++++++++++++++++
 tests/qemu-iotests/tests/qcow2-keep-dirty.out | 31 ++++++
 5 files changed, 189 insertions(+), 12 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/qcow2-keep-dirty
 create mode 100644 tests/qemu-iotests/tests/qcow2-keep-dirty.out

-- 
2.31.1


