Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 261CC4C3358
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 18:17:20 +0100 (CET)
Received: from localhost ([::1]:49886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNHjy-0007cO-Nz
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 12:17:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNHgr-0005dU-NS; Thu, 24 Feb 2022 12:14:05 -0500
Received: from [2a01:111:f400:fe1e::726] (port=14723
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNHgl-0005pu-T1; Thu, 24 Feb 2022 12:14:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYG4ZGBaTtxHiIAbpRpx1xUY0IatgXgatSt+O+zzkRySPcNTVm87VkdqMfkKpzPvtkTOGfWtz6pUW0HgOePJHgpe/WFpmormI797etwA7TuCxbpF4qciD3zvirSQXEkwVi0b7wnrW5IM18KwdaTCTFuZraVqUqNdnhUyQ2Due1G4aAelckHmnzAPb9vjtyDTkb7lrhdHd/OkI5T2Na9598ChaJDtNhCMpB6O6VZE1Urs6mW0LBWONQFPRr+BBC4Tp3acSSFdFVD0k6PdWRsOABpA6m7CC7eytQG1HVfImJWecpbCQvKTUb2oNqs1hTXety45j6I42vYOsPCa9Ut3mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifYmVaYWPh1rQSxCgXL+RFMTLItkIDhGj/xwJNUgB5A=;
 b=MHks0/Pztdl00oNzYdHn0RxvitUnaKUbXeJjCkNrcablVqyW5Y5T662hSdEjezjjRunuazeriZy0q229ZBlLFAcpprhG7AG94vOSeeyaBIsJw/6KmEmdaURkEEbAz59A5qU1GMNbpKFEoTjhCMkCXFPHflYzIH/35w+CPO6BW6H9iCeg1MgYC2znexTO/avCXNsv+20hwNLYRIiqPDWgQ4XZb7L+ohu7dVxuqx/V+Yl5m61afSZKRcD/bPHFPCCw6eL0+VIbhnF6QWkQ5ZMTqcP1fZM97M5w2N3yUAjcFaFlPCPmSrfVXuhge53mfguLRmXZCsd0iI34ahofrqX7kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifYmVaYWPh1rQSxCgXL+RFMTLItkIDhGj/xwJNUgB5A=;
 b=NSuAueiBkAo5b6lra6s7UL85NuaKyG2ggkkNJez0dXQCQ2Xn5ETqHJcGnT62ENSR3rreKnZXur4Fa6Jj4Drv94wzDaP64+TiRlIUdRWIGW2sJIo0lrgeT0ELLhhtbdbc+meSjcFA1wDkkW2qJ4J1CI2xYtCX+hiVEAZ4HfiD9BY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB3197.eurprd08.prod.outlook.com (2603:10a6:803:3e::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 17:13:53 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Thu, 24 Feb 2022
 17:13:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: [PATCH 0/2] blockdev-add transaction
Date: Thu, 24 Feb 2022 18:13:26 +0100
Message-Id: <20220224171328.1628047-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0016.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::26) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e7bc7c9-1ceb-4eb7-9ba8-08d9f7b9085f
X-MS-TrafficTypeDiagnostic: VI1PR08MB3197:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB3197878E1A800D2C6599EDA1C13D9@VI1PR08MB3197.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gn1QkPAUIE+WZfnyZ12VlvqBkscl0B8o3Htja//GgRKE4lzkqGNYEz3wJfb4zD2R8jA5mDMt4EbeeOvDVKHk5X6cGuD6EA58ZCgbWbR2mflSz4LAl8xWWsX9XCZAP7gzQO0mCgWaDawSutgOpQOyEXGuwAdacdkjb+ObyMwLRrkEinvXMbpLzvjD4Ba95jvl2lkQGUBOEjcjGlj+JfBCli6ECvWMecT/KmueNhxwf8XQX5Ci5/bCYmr7EtoFgHCN+5rTrQBV9SGHuDo92ZWAhQvVsFX2+e1/ZRrUS2GnF1nHSAl25cvcK5WoYfRedcqsRXy48dmfwrpqgMzzwpSht/aV09TtJ4XQHQdhW4kzcyH04qtajufFjCrvmt7D9RwWdOwjMjaBKQ8xGa2bnlV6zHvZQrqsZkQueCr82ROJlgltoI95qaCGZnU5/I+0m5KBuIAREMIXbbVYwKjqKpfjbixWTMJLpwimZNvPQJBGJ2HLPWMLkBpi1D2tOtX2Ee+9ejej0yf/rU4WayxHeJD88MhSwnDBoU5ExB9JFxgN1hFg22KVAceJW5TIuRbSsOuYHTtQmrc/8DzVzDUc+fb+cCdeSkSsTTdJRRI6KL3qwKZquCapUVtbrm65OibZvYznCO0VkXPceBF8RUhHgcmSx8B+79d6F/DIhfMUfjIfvCFSjFxPNZU+RpDF3c8eRQfQzHvTRjOmOFyKT42dPV+fpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(52116002)(508600001)(6666004)(2616005)(86362001)(38100700002)(38350700002)(6486002)(4326008)(8676002)(66476007)(66556008)(66946007)(6916009)(316002)(1076003)(8936002)(107886003)(26005)(2906002)(83380400001)(186003)(6512007)(5660300002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fPrgtqAnsVfGd5BmwMq0CkHh5oXHeEOTuLWvFBGMDbzS6sa8p7m065OCTI8h?=
 =?us-ascii?Q?32r2pXZvQTEjvbua5WJ+Iab+6VkD7VQuDOKrEt8ybcjnlj62UKp0olwQTRli?=
 =?us-ascii?Q?QresT6TVxFGaf1SXvHWejpBp+zRu7rioyAznEDW0JwDUGIXSatD1p6Mmcdmh?=
 =?us-ascii?Q?MfV6WZRfPB4N8bb8O3sroLnEaiGog1C2OIfQrxgZAwgYBO7U5ImFs6DP57RE?=
 =?us-ascii?Q?+hs2f43T42BFAz/rQsi1ZmjNjFJUGte9/x5UUtt0Fg4cO/C6QKjxDYyHWoE4?=
 =?us-ascii?Q?pLBlGliKZjwMIyboJuti69W8bA5pEQ7N8IRJi8vSn+DiEulU6e1q2dEBPOTz?=
 =?us-ascii?Q?cUtuSlWPW4xcQchd7jzRk/zFZnRJ5yKoQR8Mf/Q7chvtYx8hok+SQ3hUaG2A?=
 =?us-ascii?Q?uTCPw9ygLY5E8KkUTXgSVzLeYjA5GOsa/FN6SCDkpDsfQYddnHHGdGFyr9PJ?=
 =?us-ascii?Q?N98Jcpurv51nIkeVBBjG+3JQeYRv9xh00jDbONKpk6dgra+dDwv/oqCN899a?=
 =?us-ascii?Q?NX/yxDmmRVwdKPjWj7+dtFBTpQg1kFqgTQAv0/pK93vPe5lo2N5VkdeogTPD?=
 =?us-ascii?Q?bkwizXZym++sGZBJLkge5v8jOvovCfsniqnvp6s4DeIXScy5l8URhTn7m1gS?=
 =?us-ascii?Q?RYvkbp31j+xHqwo9oBpXYXghEYVX4Aw+YABB4ZvioYbvlbGK+/vd6U4sHrvo?=
 =?us-ascii?Q?llUGA4866zfKlG0YHFEtvHC9ziecUkBLqYKvTpP7uv52ZDaJWTar2xWU8v21?=
 =?us-ascii?Q?jOml8+mS6NeSKJryNbIM80T5DsT2tbHimW8o7mBRtsmg01+rVKHk7lXQlgMJ?=
 =?us-ascii?Q?7nyAYP52fDVBe0xVjdRYyeSqQaUUTqAoKz6/otPDowAT4K2aXI/IDdPuPT2m?=
 =?us-ascii?Q?UZlmVCwIFTXPHLyjV4vSb+W8+5nGMQfaPWxJI9GvSJiRwmXoax6ZbfdeAdJH?=
 =?us-ascii?Q?Gdv9+L0tQ6zEDRrOWptVDG4AI+miW5JP6fTOcSmApzv+UE5o6DsnXUulaJRQ?=
 =?us-ascii?Q?tv9+QFKAZZeVjn2KJKUJkmotopZKYe0vaIN/HOLO7pU+FWkuiaSHKKuzv8NW?=
 =?us-ascii?Q?yUNarEW2t5PfAi3gcy3T+C1aYLyAOKzf6uCUUEUlMPwrpyu6yrdd8fclZWFO?=
 =?us-ascii?Q?8shKTHEPUa7rwam0h6/29W4RGofLTCwcm+UVD6e9SlGyJdRD/CqrCyWk2fCu?=
 =?us-ascii?Q?VUbHsPGbawtwRcoMDmvgHxb1dbaQlJFRLPM8Ar6Ljiv3kDEGq1VafJuzgnBP?=
 =?us-ascii?Q?gED7Kiyfz5lUC/6mHlRqCZ9SZg6xQM6FBMPH5QAo3+rHcGDTIplsh4nMm4R6?=
 =?us-ascii?Q?JcpzSAhokvUFv+pqRg1P6oP7I5AXSfHHZwdUIYo1KNHUwkrl+35zZLnvBtFD?=
 =?us-ascii?Q?B0wKj7uzFwNRTNZ4CH1g7SgRe7tjUHgl3ErZo9sSlYcFz4jzZtix6qZd/+PG?=
 =?us-ascii?Q?/7tmq4ClaTZP9iv3k2nqlZEfTwdUn9yOvvd8sxdZSbMaoLEHp0uWXejXwyTq?=
 =?us-ascii?Q?d5rOa7M4vDhTG+H26tithS11wX8v0ubnseiYtYTe7COni2tujXib5+rrahNY?=
 =?us-ascii?Q?BW94hM/hyfFTIrArPYq8nnxIf4KN2qG2/3+dAPhGYoGN5EP1REjW5I38A94I?=
 =?us-ascii?Q?duRSpImYGSLanah72YLScK/YE40al9g0HQbBmQkyuC5CwE2DYrPZO7mxwCTZ?=
 =?us-ascii?Q?Q9OhbA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7bc7c9-1ceb-4eb7-9ba8-08d9f7b9085f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 17:13:53.2691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWm3cZRko0g+l3iS2noe7u1SLmiJT7GeUn7YmOIfMY0suqBPibGeJc4WPcWeMgJSLS1BCoYRhtA57Asp7BtfIloniYDApdV3yDnccITTU9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3197
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe1e::726
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe1e::726;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi all!

If we want to do incremental backups with help of copy-before-write
filter bitmap parameter introduced in my in-flight series
"[PATCH v4 00/18] Make image fleecing more usable", we actually need to
create filter, insert it into graph and do some operations with bitmaps
in one transaction.

So, here is basic support for blockdev-add transaction, which may be
useful for any scenarios.

Also, I'll need to resend my "[PATCH RFC v2 0/4] blockdev-replace" with
transaction support as well.

Why I say that support is "basic"? Ideally we want an ability to call
several blockdev-add / blockdev-replace commands not updating the
permission and only then update permissions for all touched nodes. That
is more flexible and will allow more strict and simple permission
requirements in filter drivers. Still this means to implement
bdrv_open() transaction action (using Transaction API) which doesn't
update permissions (like most of internal graph update functions works
now). That's of course is more complicated than this patch. So, let's
start with something simple.

Vladimir Sementsov-Ogievskiy (2):
  block: transaction support for blockdev-add
  iotests: add blockdev-add-transaction

 qapi/transaction.json                         | 11 +++
 blockdev.c                                    | 80 +++++++++++++------
 .../tests/blockdev-add-transaction            | 52 ++++++++++++
 .../tests/blockdev-add-transaction.out        |  6 ++
 4 files changed, 124 insertions(+), 25 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/blockdev-add-transaction
 create mode 100644 tests/qemu-iotests/tests/blockdev-add-transaction.out

-- 
2.31.1


