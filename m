Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FE1381931
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 15:53:44 +0200 (CEST)
Received: from localhost ([::1]:48752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhujf-0002Pi-BZ
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 09:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhudf-0006VA-N1; Sat, 15 May 2021 09:47:31 -0400
Received: from mail-eopbgr140105.outbound.protection.outlook.com
 ([40.107.14.105]:13825 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhudc-00039c-OA; Sat, 15 May 2021 09:47:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eick8LFj2Ib9u5CKhbVvjtXwtFtyRH+sQJA5zgltG+RsrAo1GcGRyDOr2tlGCmLyVRiaGzdd4u7bNnqWkyq0TDUUGWohc/SxhA/1SDlQDAEfLh8gGfzlDkTxT1akWakM41rG87PnkusTzYshE5X7RX3LV6s1gxNceCHYUlyRVXKme+JYWeREAb0tDVHn7q1+D+iClbLJbiLbOxmXA7FEwOAAR7Pl9gFaqpyAOL6p9xLmPjTQEnNJmw0et/JihyyMsSY308elc/jW5WS0cm8WShTVwDvFmzvqWIty9l4aYIIGgf5AlEYx06dThoGcnparpoXir5/DMiXXjAXcAx/UUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HR3HaCGpYTFVL4EXStgHTWr7FDpZZ07rPYCxwQr2NhI=;
 b=hROVTQgy3aqS+zoTPkXUDy9dQZtjWDqsfWYWUGWeQtRfvLzIUcLPsbK9v8dEKQ9Tc5vl89DvRs0DP4PCV8aYeQOQCCLcy4vlvBpauAPRFImnBdG6if3McUkBCtYhhk1NQesYhvMOADUFD2qr32wmXXXFvDLhaNv70LezlQ39AYP854+S1wGZJk5f3hy4u8SUm2XHxkzLpEtU69LbKmeV8cMjx53zhVp8u0bo8RhXuphqNfhxyxjwdMa/hQ6AdOA8RKSI0YIywW2c//k9oY3N4Yy5jJZb4vaDg9PGEd8CoT2KAe/YV6oR/P/sqy+Z9Kh2uz7N5pgLAWey3aw7dxM41w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HR3HaCGpYTFVL4EXStgHTWr7FDpZZ07rPYCxwQr2NhI=;
 b=LuvFO76drQholC14SyNyrdbD/EaNIRaDfgO+ks8gOkIFKeIeCXWmejuR0+/Vhc2MbRICQqXm4BqH4YfB9h8OfkGpgUVhAgRPXxW0TVCJ5apX6k2n+aSLnCdZB4JOqJ2g/b/HF9uPHPKtUw5midVaT8907Q25FA3U7RYYbrFmWoY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5206.eurprd08.prod.outlook.com (2603:10a6:20b:e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Sat, 15 May
 2021 13:47:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.029; Sat, 15 May 2021
 13:47:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v5 0/9] Allow changing bs->file on reopen
Date: Sat, 15 May 2021 16:46:56 +0300
Message-Id: <20210515134705.433604-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.249]
X-ClientProxiedBy: HE1PR0101CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR0101CA0003.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Sat, 15 May 2021 13:47:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bae67a9-ac9a-4a18-d6bd-08d917a7f81a
X-MS-TrafficTypeDiagnostic: AM6PR08MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB52067C0EF60A723AF73E7377C12F9@AM6PR08MB5206.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OjqgR3O9KClfvcR46Cr8/MCupH7K7D8zwzxKNZg6CRcvgkJNuyGF8TcBZjUe+WtJgSTigs4tSsLJLtyWvaeplKD5Zdd28jvdJDtixR3CJWeUuUtSuYDIUoTK7qamxhix85gAz0I25NXFwwDryl04vqOgk6kjFNvDeqNlZ063kjZtqE7O+Ivl/YNqWptFzwXvWsi0x5A5jmxJuDCAu1XpO+kfyS7tDbnEx6UM5WS5gqrD4pRk6OSx6nYFyN2QjFKMU1aX/TMq38yWEOM0dHfwj1sBB4aYErl5Tppv87rUZmVSmwM11qiN2IFWVy3ryCLBpDQHDF9hxJ+8ZKm920LrxAX/O4C8c1naF10O1x24QuwajRnnJU8sF86KcUhOnNClKWncaUDC+IgYnrKtlJm6qAm1BewFPT3B3w+WepqpjBIiPWHXIcif2slzj2h3lSNJSnO5evKe+Zgj2L7pXSp5vFdFVsiqo4e47W7PK7HAICw75z/BgRP9CiO41htM+saIujiC1rSLsDEZ2w5+h+eFaRxopmj2SU5suFvBliPuZvimlbFTMlopd+ohObrlkZetYMgln3hNVTedCLUUogLMqBF0C5fe59quOzbfnFfyyYWDGbqoQNV+dnWUDIz7eJZdyetq7xeYmdE9cZobQxvfinz9C85MhnQIaBdm4QD3+pAjNXQYAeXEVb+IBRoa6+Nd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(396003)(136003)(376002)(366004)(6666004)(316002)(6512007)(26005)(66476007)(66556008)(66946007)(6916009)(2906002)(38100700002)(186003)(16526019)(478600001)(107886003)(38350700002)(956004)(52116002)(36756003)(83380400001)(2616005)(86362001)(8936002)(6506007)(1076003)(8676002)(6486002)(4326008)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Dbrf3T7vOmgchL/r09rz7rl9w1GUz4C5EI2RO43+0qtIgA2TUp6yju/3tz24?=
 =?us-ascii?Q?NvVTcmHZryMuPgmdHlviUTIc8PZN20lQjbuEwwT8U/yElshygCLPj7nfB+Fj?=
 =?us-ascii?Q?bq7qoebmaPCbm7zzzxC8K+vGW9HKkxoZeqW2bPlJqEtzE7nrQwfRvFIJuxbr?=
 =?us-ascii?Q?CFuE3ozMg1kt9KM/Atwqr9bI3o3z3acX7ZT49wZVFfkHcPwLQxR0ylmczMjB?=
 =?us-ascii?Q?Das+nuw0zbTUBHsYSJ8zcUZLOe6NIPrhZVHdFg22/uT+58ioif86ClxS+0AF?=
 =?us-ascii?Q?Sd257KHbhH6C8LZqdE05/e9tNFaVTZZqNa8m+oorWgGClobn7cOvuWYq8cE3?=
 =?us-ascii?Q?bsmQH35ZPNX2mtHv453VVrPzHjgEZQbvXYRXbG9oRJjc8hQxM11c/cf/o/Y5?=
 =?us-ascii?Q?Mn6DoEmRHFgSMIWut32q5KaXg6rtYcrQZMvNy7wTjaA+VlNO6EfKj8YyIWqm?=
 =?us-ascii?Q?7Jksa2XrcK6CsXYG3nTnvdREp31P9jk7GsGuVAffS2IrSwxkUVAJ1L/vicQp?=
 =?us-ascii?Q?BwT5FYQvKzQH7bb4qkmRdkubxXnmg2QAFgBjftchkxGrESUuSW2EtjqjiaaN?=
 =?us-ascii?Q?vCK0Dm9WD6ZnWeNyOY+9xvtiFcAQf5GsfiFDYe+ALsTIv96LUiH9QFn+Oi2w?=
 =?us-ascii?Q?nCbAJ76FPpjELjfjfO4QPduHQyLpvi9m2/dBQFyDW2PE9ichEKV4yhmG07gF?=
 =?us-ascii?Q?O4qjmUakVEJo6QWTNHeUBL5+hqP6gkBZzI3jGL/OB/fB4vQ1rlfS35RFzGOz?=
 =?us-ascii?Q?mx4Q7KnjjmQ/nbhdr0MC5pvYUgJdyons/MjK7UMVF1f53XrgQsCImlomJred?=
 =?us-ascii?Q?ZFzcTtv+2UJaUt0UNQMuwadiLMq3hLVSl2u0i3RrdI/xr7p5D/t7TMQcQg3s?=
 =?us-ascii?Q?ZpRChxr5MqXMGhc+InlilVdx1bs5GguXKliy9cWHXtKmBJED938ABDPrHgDh?=
 =?us-ascii?Q?d11be95MiKlwJHI8JRnp+Vps2CODqt6kQBQpNozII7jc1AHEU8PaQmMZfJlB?=
 =?us-ascii?Q?YwjLoP5mJAZt3/92eTXybacvAmEC7K/r3PYO42YYciCYkAihMo6oWHmZbgo1?=
 =?us-ascii?Q?i3IQAD7mKz9Jb/eKN18iUxjfJak1By7C5+fOnDwqjdu+fgdCui9TeHHSGalU?=
 =?us-ascii?Q?SW1pDVyUMmFX1C6hzAbBeHZTMXNVj3TklTwYyuzvrC5ZGhSC2mHZPFsnunPk?=
 =?us-ascii?Q?SqgmJouPi4qIr+T8kf88Y7KZsyLy2tc5jWWX9olKRVEGEEZT6fiTQ8Awj3sc?=
 =?us-ascii?Q?VYq0lXKGu6BH2lXanEbQVKZmJlkZl6tIXsHNQAEJMLCmYPihn1a99RNWF62y?=
 =?us-ascii?Q?/es5aNJsV18sXB8eTOHDGo+j?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bae67a9-ac9a-4a18-d6bd-08d917a7f81a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2021 13:47:24.0505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsjjKjfsUc95D7PSqVVip9UWJjf9eeXZjKcP1kqvmlxJyekiyPrWcszSpyD2LzAkD/UdIdPzOwkoIOVxAzud+v1R2/P8/ypm68kEO2GoGyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5206
Received-SPF: pass client-ip=40.107.14.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

Alberto, I'm sorry for not consulting with you about sending this.

Actually, I wanted only one patch
"block: Allow changing bs->file on reopen", as I'm going to send another
series based on it. I started to work on updating this one patch it and
it turned into a refactoring series below. So I decided to add you patch
with test cases, for this series to be a complete* v5. I hope you'll
have time to work on the rest of your series on top of this my
suggestion :)

[*], supporting multiple reopen and final publishing x-blockdev-reopen
not included here. Also I didn't address Kevin's comment that we should
have some error-path testing of new feature. Probably I didn't address
some comments on "Allow changing" patch, but it changed so much that
review should start from scratch anyway.

v5:
1-7: new
8: changed a lot
9: unchanged

Alberto Garcia (2):
  block: Allow changing bs->file on reopen
  iotests: Test replacing files with x-blockdev-reopen

Vladimir Sementsov-Ogievskiy (7):
  block: introduce bdrv_remove_file_or_backing_child()
  block: introduce bdrv_set_file_or_backing_noperm()
  block: bdrv_reopen_parse_backing(): don't check aio context
  block: bdrv_reopen_parse_backing(): don't check frozen child
  block: bdrv_reopen_parse_backing(): simplify handling implicit filters
  block: move supports_backing check to
    bdrv_set_file_or_backing_noperm()
  block: BDRVReopenState: drop replace_backing_bs field

 include/block/block.h            |   2 +-
 block.c                          | 287 ++++++++++++++++---------------
 tests/unit/test-bdrv-drain.c     |   1 +
 tests/unit/test-bdrv-graph-mod.c |   1 +
 tests/qemu-iotests/245           | 140 +++++++++++++--
 tests/qemu-iotests/245.out       |  11 +-
 6 files changed, 287 insertions(+), 155 deletions(-)

-- 
2.29.2


