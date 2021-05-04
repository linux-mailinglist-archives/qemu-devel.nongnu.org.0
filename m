Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1B1372CE4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:23:45 +0200 (CEST)
Received: from localhost ([::1]:41166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldwtk-0005aw-Gi
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwrj-0003aF-74; Tue, 04 May 2021 11:21:39 -0400
Received: from mail-eopbgr140108.outbound.protection.outlook.com
 ([40.107.14.108]:6211 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldwrf-0006xx-6r; Tue, 04 May 2021 11:21:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQogqqzrx/rFVeYHQibwpEq8vuBIjfozx0tKsi1IIMAlSyJWbpw5UXSDKIQcvuJMidLJDxa8B1g7XpLmtrHe3Vb/xjWSN5JQrlthrhzzipWX5nYYEuQhLW05Qc8wqgbuAOmU6kFxLOOg6iCUzQcF8Wk3THj+2UZGiaHiYHFiFisT89Pdhpi1TV10m2Cjtl8USYUiqIO/W/jhoiRV7JCjxTLlzby/dAeIUDNNaxwCsVBNKOtQjDW4vW+KhI+jG/X2WhMdfeUmLQ9fPHSP0eyYzmcs7LabUrRnzT6TYVyiVBfLWzIpqYlbKND3M1jA375Sqxw4vSR5lx6lpNLD6C/e4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+3v+teuSskQeoh75mRSMBFoH9/ouvaIHENBoYV4RTk=;
 b=P1rw5qxblcZ9KpEIjqv36DjxCvGtBCmrewQnv/afhn0rinuQVQhMGICezhXholvMslD5ZKudm5ZFXGA29gE6VAJ90aFLzb+vWB1xbpwupn7fi1/Id53HcS5u7nT6mJQBMpbbdmoPYMTaorhdDzbGOFYfX1bzsvNw4ejc/XLwQtCYqqdkrd5nxiQp/qUqdTGOKl5h9hKalgOAU4M9TKgG5cOzx+J0Hemf533L6kBdGrMCYvZ+7RKARfvqP1slI2HHVpLZxt2g/TdS1fG2uLHW8cZgcuyIhQaim8oCKPlmZ1DURqd4jrT+HtlddazAH+9ty4Se6k7YYAybloOA8PAQZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+3v+teuSskQeoh75mRSMBFoH9/ouvaIHENBoYV4RTk=;
 b=hZdIDBtTIrqWCA9QPM2UjcVmU43VjYiauSXJZKsWVgN7YimeQQgmk8HXKLemvBCrl9kN9p64J9GudA4QaK1/RSWVuOUuNAVUMKMQqjD9YzM1me4COkC9CyHKMgefeQY1aTNPQ9c3jaqRZlwQ/wb5mtsKjVu5TGy4xyjQ1k0TLRs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4916.eurprd08.prod.outlook.com (2603:10a6:20b:ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Tue, 4 May
 2021 15:21:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 15:21:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, ktkhai@virtuozzo.com
Subject: [PATCH 00/10] qcow2 check: check some reserved bits and subcluster
 bitmaps
Date: Tue,  4 May 2021 18:20:13 +0300
Message-Id: <20210504152023.322862-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR0901CA0052.eurprd09.prod.outlook.com
 (2603:10a6:3:45::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR0901CA0052.eurprd09.prod.outlook.com (2603:10a6:3:45::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 15:21:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69928cce-f696-4f0c-3d0d-08d90f104924
X-MS-TrafficTypeDiagnostic: AM6PR08MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4916BEC615B24238C18894F9C15A9@AM6PR08MB4916.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vuWQl9BqdO0/kc9U/PCmS5nYTQioa4yXyIEWAcbja6ruD/NIberGTrkQoE9kAb/wBbVbGp/3B1Wjl+/ehhyIsXEqNpmAkwFaACqJ1xbmIFgjbnjADAffq6XmbaJruMPyqFe9dO6RcRJAp3wHJA3HaY/+LUK+CDUuPyKxWxptkKBO5a9lcSIRnz/hxbceYjXR3gQwf2TJGpDOlA4IfUt6ybxyuLHtuKowwbUPkxFCPPh9MUMh0bmWnztaO90ADtOBS1xrA22PduOzKNPBeLvAL7+uWMbIxMLMqkmQ8Jci/Vyf8Vijpm5jaiwSb8KtlURxOt3MDiJTXxtrsYl6I5hBMgCgkaMzw2lJhx11VJapT7rdv13dXPf30SswKzyxHognTCY7C5fxW+1fAkQrx0EyA4vpkKVL3RpUlG0Pu4S61bC3MudWWc35Iowvdx3tgUsM47fGwKLrv2+gRZfC6y6CwzjCYPWQ4at+6Qcfb9wFIS9DdCGJ4qKWHbJUCTkZ5x8Y3QTtvLg9c9cKFXbF+3tVjgoRmGHvRK9JCo52Or6X6U/+JPRWOYs/tDPxvc1HFhKVRlJW+qfEl5UEITtLoNlx7G10pZkKS2A+Sx9WBacDP/pTpSfzWEV3rvsILxzbZD9FUtzqdwVfL9HkHYUX3SuZsLx4CI+5seiUxquIECYafvI7iYfpwfgI+/q5cGt20a4D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39830400003)(66556008)(52116002)(6506007)(66946007)(16526019)(66476007)(5660300002)(107886003)(36756003)(4744005)(8936002)(4326008)(2906002)(6486002)(86362001)(186003)(26005)(956004)(478600001)(83380400001)(6666004)(8676002)(6512007)(316002)(2616005)(1076003)(6916009)(38100700002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?D40ry9eEhK/uZ4d1AHj21RFqnCtPPGdClCfW2WczpyOAOqyS4QBazrQ/UEIS?=
 =?us-ascii?Q?kLSmGYvE323dmAan2HEh3kN0pAogqeEfr+sv38XWL8NTQk7SjIw30S2Zdu9f?=
 =?us-ascii?Q?kmAjnNJ9KN/sGsD5kLDDcnoGnn2rOqi/v307AueGHkqY9fvdVjA1guA3SYtm?=
 =?us-ascii?Q?P3Lt8Ydto9+5YZR/W+seIzAsZnMueBBmaj4qCsJSXvVxIBTf3v0U2dH+brac?=
 =?us-ascii?Q?kWEyfNDMO6orj79GLnrqGEKo3SElNRMRaQ5+BOgNla2j4WWWW2PYBGDeg+9v?=
 =?us-ascii?Q?XyL+cFr9AY4Xr7rMmt1IXYAFzkKD4IzIMBTgCpW3p1Fzcs8mMG0G3JIwgR40?=
 =?us-ascii?Q?MBcJ6nh41DQIsNAzYYdNWeKgEb+TW3YZufvF6NO16oZUD4tlYm6fK9lJaOR+?=
 =?us-ascii?Q?WJr8jIe5rMg6eFgCDTDQxePIkCNUwvhZHdLA/HE5MN2ftLjShbpPIbpn2vkT?=
 =?us-ascii?Q?nhPUu8eEXWF3DovLvQC7OOA5xU4S1DHGfK+HZVZmg5QzSK5FXE20mzPgCr9k?=
 =?us-ascii?Q?UJ+1bBJM6OrJOSCC4C5JbLKQxADfX6melEnlIt3vxOqkWJYBxqfHqPLow9UV?=
 =?us-ascii?Q?0NYJWE9jD4Uh7dzLcRV763TBA/CHOeMT128+M/BBj3dNMmSK064kXuVxGTWP?=
 =?us-ascii?Q?dNy9eW5eoJLUn66HLJmMH4Fb0DgbvhjVuBf+QFC6WX6BYqb7E6PVbQJFY0r8?=
 =?us-ascii?Q?gh/tixQi5Ha+zVMxvcwfzo89uxmd08Cy76LABt/3JNaSLJFvChep6V13qF50?=
 =?us-ascii?Q?ZOUQi9rqiHU6lgFCsqbBi98nrEMuvkd1jozwfMaU3neROgL2I2qdnLT0sFVj?=
 =?us-ascii?Q?mJKw2dmX8SnTz9fe7klGutDa0f4wZut2bE6XNGFwNWDEJtZbXGyRQDOG1M0Z?=
 =?us-ascii?Q?/KVMC/4qO6jI1TXCMkMBRJbLi8JB9KBq6iC0/g5bcPpaI1ZXrShRnV8hXhZg?=
 =?us-ascii?Q?gUlzE23vV51MUFVxdR+CWMBr+/JGQ8CV1pJgEBPTQ2cntIOvOm8cbdxQ9HQs?=
 =?us-ascii?Q?VzGBEsIG3f+Rnibfv8iyqX9tfJ/H4nLeNMcH9joF0hQhmNkh/iIhdohNoNu2?=
 =?us-ascii?Q?r4mGzsedbhHLrX5LRUBi5VP5t1X03Mvv/2rEEXao17Qsmq2Zw2FmWpSr02LM?=
 =?us-ascii?Q?NrRKBe1aSATjsh1SdBmnY9NckIwkjKZsW6YnOCiV7zbNqhLwXm8iAdtxNIHH?=
 =?us-ascii?Q?UNWmBsD73Qb1YrM7UcvrQsFyvOSYkSdn+I3vGs9ZU5lOyreu/ZIlVp1plskG?=
 =?us-ascii?Q?ivs7lEdWFlDMvDWbRkmVlFhY5P9+NM4KR/qfPNXbV8MVwnsXPbx2yDfbMW2X?=
 =?us-ascii?Q?Z4RO962iZtKCRyPXP4pjC1gG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69928cce-f696-4f0c-3d0d-08d90f104924
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 15:21:27.3120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eo+Z8iiSbPETm/laOB6ENnuIzgfgT37DR4c7fGWPmJcEY2bKn11LGxZj6y567ZYxnMcUTuNKB1OVzwigY0t3Rz1S+qJh671iBC+NobeD0kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4916
Received-SPF: pass client-ip=40.107.14.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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
 block/qcow2-refcount.c | 327 ++++++++++++++++++++++++++---------------
 block/qcow2.c          |  13 +-
 4 files changed, 239 insertions(+), 128 deletions(-)

-- 
2.29.2


