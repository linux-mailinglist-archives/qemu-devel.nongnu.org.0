Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4E4592B22
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 11:12:45 +0200 (CEST)
Received: from localhost ([::1]:35172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNW9M-0006OS-6A
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 05:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVzV-0000P4-Vt; Mon, 15 Aug 2022 05:02:34 -0400
Received: from mail-dbaeur03on2099.outbound.protection.outlook.com
 ([40.107.104.99]:8993 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVzS-0000MA-I7; Mon, 15 Aug 2022 05:02:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2AC29hMK55IbmUfh+IAhS6N5jWyTXF2oL/WzCoy4et8VZrhGfvB2utUUQYGadK/Sq5ctG8HLtIRvYSQiAMhFj3S3okRFpcZB6EqMJuxAdDViEnTTAi0fXrdO/OKNQj+XLaPA2Cpl55grly5+SvpkEK8bJZpv8FBBrxg/ZW31VHsMbHGoKDuyyiGG2huuDf/YME3vSuYcDCXjcB3Q7XRxPeQy2gcPc1HXNG0gFFmWtXeKkRZbvkRWZDf15w0yQ3GNoHlP1UU4UXQOm/QfUcLIR/oxnypZkWX2fMiBxuwBDSQukiTbRiwIBjOfYMBMrjfGkVHFDkXEd+RFGifPl7mvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oLbgyNbgWb4F26C0HEU9EwGeb2V/SHNLlyor3+z15A=;
 b=VW5cxW9BpaEUgUL1ku1/5SZani6UY3azWxXJIDc1peutgKogV+wiBA0OxWTCjTyZfJeAQyrz8q2y2jygMrSLU1mEjXx2ygY4q5YTwhUreY5JWG674ZygSkuogmlW3VBsKT/f4e9jY0m8yJjgQP+j5URXcAyYhPA2+uwIkMgOAkL4/6qPyoWVSRpLLwfsM3I5iP1KKyCauJFfk5xzeehOlDOh15vRSvKaVpd3S+Uc5e7puqfp/N0NcnpIvQ+GCjfppCEyfErHDN4diScdhYpqJttLiFkd07p3gN77OlGChBv+Ek9Ck8XmEoukNpQgo9DvG0EuPPya8gPv8w4mGH8lLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oLbgyNbgWb4F26C0HEU9EwGeb2V/SHNLlyor3+z15A=;
 b=UE3JMM9dLG+q6sGGdQo0lSHBNUpdh20rx4TycqXVPQT9Qh49Z4q3QBAgKYAOsHATy9yysQiasU2RkJlgkIo9PsUPyuhU3xa+QbD7dF5Pnk7R3JV5GU/+FBFGN3uUXarAUopn002cWHUSt4YqHRruy0s5ZGGLfurTywGPKpMERNlxELvISsqtf8rJiWNw8zptawGNo6LhsJEHKCbMfErrOF3uKWhtfbU/hhtMwwLDozc4IFam5Qfs+dP7yLiySSd4aYoHZv/lrqvb9LJNM9YlmZZxMxjygTbhjaSfcA8R8sCIB9ozMdw+CFszYA31et9Zme5I8Fl4K1QgFP6UOPBe9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com (2603:10a6:10:2c6::19)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 09:02:24 +0000
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c]) by DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c%9]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 09:02:24 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v3 0/8] parallels: Refactor the code of images checks and fix
 a bug
Date: Mon, 15 Aug 2022 11:02:08 +0200
Message-Id: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To DB9PR08MB7100.eurprd08.prod.outlook.com
 (2603:10a6:10:2c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87900607-19ba-4182-4c0a-08da7e9cdeeb
X-MS-TrafficTypeDiagnostic: PA4PR08MB6032:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qMNkqM4botgKkWt6tzgkKTn/Uvy6Z8fP6R+NtGBFy1NEizpm/7kGSTiPBcIAI9oIQ7y/FH1eim/AR5LCdFbFwpz8ngMDAw7x2n8B1GnBXNZnXpycYyRNg3cuaHC+TSnsFJiN+DoVwyMxKA77b656mSRgJEeV2nWOys8FdQs7+FBPhKpWF4F3AXIxG3nVPS+XOXZ134MSAoak9ZIPgmIr0DzANKcM0f70iCoh8qUxJMJf8tPUjido1WCN2LhIZFaFWYrJ7bZdRfA++xEBr2Je7pA6F6JEaqX5qJEOpLVMeRgcfwxkGMDq778ImUfLPkLnMkIcbksYCdjRXGTgMJVUYSDsLfu8Fzqe6jrSa5fUcNYmXB2cmruhmWSojPH7SDPac/D2XHhL8ek2Zp/rzGjpJS8iqp7MmBzffVPnp0W144EYEw1T8bf3Jc5NMxBB+bDYdDAyXb0XLOUbVt4BfLGohr4HaxPH2WLDCTB/kXDTQb3V+dAyR7wHrK2VQxpkXhaDY/wcdoYHM82XQkxdLCHNZmZrHshFvel0hcVE2Cp3Ua2G1KJNml5n3ycZfUCGxyv0nj6B0ofPjemT8IO0wXF/FcTZENFKUdWYUDOVPPQ/Qm352g8N5NwL7VfkB2Uj0ZbRZqEJsHh8HAOH24f+KxQboog9hYMnWBCaso4A0DAvdy8JchGedfmEb0Ordam8YMQ5TP7y7lulx4ZI32bAwXWvINK9fHjJAs6MDAkNgTH6t4hE3JAdztYwCvuKW42I7BldlNsN0NrvqPBdU9POrBlWq62fjzWRBE0ToFz0nGb4cz8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB7100.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(39840400004)(136003)(346002)(396003)(83380400001)(86362001)(2616005)(41300700001)(36756003)(6506007)(26005)(6512007)(6666004)(1076003)(4326008)(52116002)(186003)(316002)(6486002)(478600001)(66946007)(2906002)(66476007)(66556008)(6916009)(38100700002)(5660300002)(44832011)(4744005)(8676002)(38350700002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?od7J0+0ZDkSvrElKYzqflSq22Y/PEXxxNCJf+srC3+5F1kdQMnnUVjCHpQP9?=
 =?us-ascii?Q?shbGtzR4MZEbYeZokIrkO98C+nQVbnMYDn3Xy6mcw5mcvYMbVB8H0CWdgRRY?=
 =?us-ascii?Q?X1FFZiazrLg3eZG7KOrAYUEZiSLdJNOIplHZqabWkBTd7WekjYhyE3fRygtV?=
 =?us-ascii?Q?vGrJiyBpkASX/sLSt7uMwC8jdjiugWDpaiflErLLduDb1M8retdQ9aEpCVjh?=
 =?us-ascii?Q?tGFr6qD0Y9suFJGT3m3/t0RVZ312tH1F8KxnRPzPnmSYnzttYOifFRb2Ym/t?=
 =?us-ascii?Q?cjKJ4+ejrjFgr2bVFazMLvttRlec6KeB4t+7oXr/JZ+jSE+A4oBUQRBdhNo9?=
 =?us-ascii?Q?Dpb3Ubn0SDb4Rx/tB7uBUz3nw9EHzVQH9SbxcSXtjXGpRrnIzmQHSVQjkeFP?=
 =?us-ascii?Q?uMxeIMQKNcPzekTYx6F7PHeWpanmxgXscihbr3dIh3jh3KnvRjSMCkyfJsgb?=
 =?us-ascii?Q?CZTYRy7oX3t9PS4d0CitKmBZ+NoTV+rO8c4EYLZSIxOY4CN0dvbXCJrTJSnh?=
 =?us-ascii?Q?Shfpy2wc8g/fABqkyTGJtHxOZ/rR10cGYQBw9r4UbTM78vcwH0lKDdTCkeVH?=
 =?us-ascii?Q?JpZTAdE55gaQsU23BLAaPHdqIHoflDxQ+qgBeKaSxB5WTk0cqlQq10WHfwcX?=
 =?us-ascii?Q?k+rh81m4aUpNHrerFgkQQCBwmRi5Pkh/tmb9sXY5da98R3ZSV1RhQ2wVkda2?=
 =?us-ascii?Q?WjCP6a8xDun15hOxrX1wfJVIwH3Zc94ZOKkm9INPjACu6sX5u8VrgWj9n9sB?=
 =?us-ascii?Q?6JuYCg9IBhYGN4Nrj3m6IT7QnuRoCYTz5M03yjjOmYbOx9icuQp8XlmLg7o7?=
 =?us-ascii?Q?QxoWv+Vog9jHdRC3a2pppBs8lWwSE6u42zWdrcen1Q8QUK0NWhnB7uIzQjF1?=
 =?us-ascii?Q?SCGqQjDX9IlQ7JietE4vQx5rOPQ0NxK1kq5bJj+kS0H4P4rnVczDEuKn5skI?=
 =?us-ascii?Q?8z+jbn7ja+u5YcXs90IlJ5JskFVpDOE32YFx0jWrYECPdDKkfWfZcO46GlIO?=
 =?us-ascii?Q?aGbZ6GRaj/p4hmQccKtGTkE3uvwNK2u9aOJeX3KVQ5rHMmcn24iORLhrSUQ2?=
 =?us-ascii?Q?JQ9bvhBM52kHDKMdudNdcgC9nKgRO3I+N7mgz0xCKRNWFMiCy4tpZZSsjbxG?=
 =?us-ascii?Q?dHO09Tw4QXUgx2QGM4NeeiOdmyA6X1NAnO+u7Ork8O35v6eyp37Q8Lxfa5yV?=
 =?us-ascii?Q?VfvK36yfy74DK4dPKmGOOmjkzDWnbhAWOo3dndPomBNbZyh4bxCoxgEXI/CE?=
 =?us-ascii?Q?b12oSSP95Kknww7ZX67OzhRpWMaJFvs5nTIhF6gvpYpsgJ1nxGpNlxn2qtBo?=
 =?us-ascii?Q?Z5YK0OL2DCMxSMWIPMs3mYoq+M42HDpxChBqYijCc2PWG6KJwIAXshhzgLYh?=
 =?us-ascii?Q?g5zzTcol0F/ytAE//D5N9FvAARLnWiGoreFSnJkWN2AaqXbW8uD5u2RHNPvC?=
 =?us-ascii?Q?bqmxfljLSG2Ei4ZHPrJrX2zikoEtrt3X8RuvGX9EjyIk+yBdi4b0BjPeYVDl?=
 =?us-ascii?Q?fwW0NyqDuGlkUbF0nJ/vgxAE3BoxKbRmu3pBjh+Kkkcru+l3t63SfDnfnfgl?=
 =?us-ascii?Q?VGNoRPRH5J7aZKmfCh8RPmQCuH3fhsaVdfJ/3MFxazGhjIn1y2+YNt1hNW+g?=
 =?us-ascii?Q?lgw5eTckO5MrRnZJbdbuohs=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87900607-19ba-4182-4c0a-08da7e9cdeeb
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB7100.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 09:02:24.7869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCPXmaYTKHhUMhtKBsXiTVn+oc6UkK1iE8LTJEPjTyuypKFaLjFF8Iiug33liuZ5BgqPGN6oT/aRaNkefAZ5YBmx+IVTz1cKBbfCVE4tJOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
Received-SPF: pass client-ip=40.107.104.99;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Fix image inflation when offset in BAT is out of image.

Replace whole BAT syncing by flushing only dirty blocks.

Move all the checks outside the main check function in
separate functions

Use WITH_QEMU_LOCK_GUARD for simplier code.


Alexander Ivanov (8):
  parallels: Out of image offset in BAT leads to image inflation
  parallels: create parallels_set_bat_entry_helper() to assign BAT value
  parallels: Use generic infrastructure for BAT writing in
    parallels_co_check()
  parallels: Move check of unclean image to a separate function
  parallels: Move check of cluster outside image to a separate function
  parallels: Move check of leaks to a separate function
  parallels: Move statistic collection to a separate function
  parallels: Replace qemu_co_mutex_lock by WITH_QEMU_LOCK_GUARD

 block/parallels.c | 188 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 132 insertions(+), 56 deletions(-)

-- 
2.34.1


