Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F9D43DF0F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 12:38:43 +0200 (CEST)
Received: from localhost ([::1]:37396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg2ny-0004Jx-8c
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 06:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mg2b0-00073D-Dn; Thu, 28 Oct 2021 06:25:23 -0400
Received: from mail-vi1eur05on2139.outbound.protection.outlook.com
 ([40.107.21.139]:54305 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mg2aw-00020f-Oz; Thu, 28 Oct 2021 06:25:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9mSjxKFXB15b2hg+XzuVF9H5HCDZvfpl2qJf5Ezh8xXLODEGSB5xNhJCROHGWhTR3FIgy1WpMILTtBjyQgZbwM7jaFKr9rLXGlWYbkKtHdAGUmC8tom6bo3E/pmz7mcahdrnckxQrjaExC6UtJex3tLTDf09GyHVWlTENV9UyJCz31PxeC4pz7L0kc7eiV0wsfEu/FFzyUA8JuFXojOfgitusxlKOcuw+tE0CA0CwbS7MTIqmnexnOuLEEJ0cHB4NhEF31o7uqZgoYJEKmmsatMnBfUTaORBLGrJ0ok5rgnpin04AhOutFmaN2ndJwra/0q08wodnD+dISWlgLlGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqVrrBKF/PJ5/VyLf7MMXwjBlSpfTJ4DpyFvr3+pxsI=;
 b=Xwu9oPsR6p2cMKvmjTvr6JrrnHPLVLxLC5J4iuDnrexQOAZlyuDCeWb1CUTGkaEX+beFeNO9uRsJWHfrc2ihXWrQUhdtBuItoWqTWpqVzFiUhLKfd6JQqSYxjieksWKBHYr33okFcRXAyQo9yBZx82jmjV8btz+El7q4JCEBP+HLL2UdYRkQOPbqwwqVG47HLApZsSA5baTduwZG2aDZFUEDpYe/8FtN6cmUJ6P4ij3NhMR9svSKSthF2EUcRuzvgD/I9IIHkIMhlYlUblIbjs7+Zvo0KhBx5G9U9N2rckf6IoX4EelMRM9A08WepHxVif6VaJhTQOkgLT0vdB5oog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqVrrBKF/PJ5/VyLf7MMXwjBlSpfTJ4DpyFvr3+pxsI=;
 b=BvnBkOl2QJZDw+xFFomJiGVhlDK471egNuQwj6nnFeD1l5Umu0ztkatYRD45D8xDtRRorydBTZINPaSIbKVXebG1sJ7GU7SYwk+MfU3fV3AYZ9T6wiv8mjznhJjfC0nUMvN13Ljh1G2SkMSS3R4CbOQeW7AtoEn7431coHq8pXI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4535.eurprd08.prod.outlook.com (2603:10a6:20b:74::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Thu, 28 Oct
 2021 10:24:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 10:24:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 nsoffer@redhat.com, eblake@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 4/4] iotests: add qemu-img-compare-stat test
Date: Thu, 28 Oct 2021 12:24:41 +0200
Message-Id: <20211028102441.1878668-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028102441.1878668-1-vsementsov@virtuozzo.com>
References: <20211028102441.1878668-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0701CA0053.eurprd07.prod.outlook.com
 (2603:10a6:203:2::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM5PR0701CA0053.eurprd07.prod.outlook.com (2603:10a6:203:2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4 via Frontend
 Transport; Thu, 28 Oct 2021 10:24:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af5cfce5-539a-44b6-174e-08d999fd2ef7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4535:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4535A5C9719B992738F89860C1869@AM6PR08MB4535.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: piZaqhlZ9fET9e/lgBlzlFWW8tnYkclkRuV9WtWXB2XxDGZxj0gRLzVsnUfVz7z2z91UKMJiaJWIVH2t2ShynsqEHUg99WVtOPcShM+U6k+I9k6dGaxr5luA9+3S5YlkB8pMv/PuTNz/k5Xk2t1LnOEJJnYfdL28JVWOHQvuudSKkBVxhb2a8dxiMW7KLGwSh7FEF4OgGocK+by2g3/b6u1PBXEJ9/s/CmN1hYURH2jAAGAIIxWOQefCjHkqS/vCPL9qRAC6X67SmQNA9GomTm8UxBr14nFXrIP5yhgfoTOVWtJVlGDyvhFufhti323sNeT/gsBoxC4WP7MCAg0pjiEQD+MMgRhQ0BxEqoqArlNDn0cKoQ5wXlHXgaXPdIugKRxpz8r10B2gUNO7glQi1qbMwykrA7H5yFyjeHKnMFGgijz5j9g2Rw2NaWNodsA11raAxAVCieyZPeGNE9Ed3SvTg4bM8f6k7xqBGxmPKLhDMPk/BQulTGVT5o11EHFtmywkTvmCifuvZiHPrFOUfFGrrO4Zj3PQ52CSXliiVdvFdn4lYi8UM3MCx0TGZlr6xesmrSe8kOkuxCTsgD3G1IGr9WGCrOd2AbRY7MiGBwB5Ep1SWAG2VqKFIo9aRpX3VVmrq280NrNqHMATEDXwyUKsR2mvGAZTjHaBCqOV3JfTME4Z2brRirOiZcrZQwmrDKpcygMS+j+/qDaML/Fli/0hhtheowosEQ8yayMwaJT7wiGjj3KjChzAxvYfjik6MRRGYShOPH1q3GGEyej47Q7l5PChXUcxzGq5geEdQZY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(508600001)(66476007)(66946007)(52116002)(83380400001)(107886003)(66556008)(6486002)(8936002)(316002)(36756003)(6512007)(5660300002)(86362001)(186003)(38350700002)(38100700002)(4326008)(26005)(956004)(2616005)(6916009)(2906002)(8676002)(1076003)(6666004)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?om+s+ogtqvJ9fSs+wuOW4jXRwbA5mS8Xliuf+3PTyvolI23QnY+4emaWyws9?=
 =?us-ascii?Q?WtZZJ6q1oZf8qCPjibg+HhJtDcfD6I+8pUWamCQfx3A3UH0BlDXEfKj4Uf5U?=
 =?us-ascii?Q?nit62l59rQy8r8aELMNhw1EGHrVgOzeKJJIW1KULladQNA8xYXvvL1fI9OJP?=
 =?us-ascii?Q?nb5mKkfR+4h4y66Xx/kwFcJpV+80xXFcB34+vLxkrMEK+t6ex2oSLjyGm8Ww?=
 =?us-ascii?Q?Q4Cy6dF+fN73FKmltipGJR31EGzYbqXsWxBlMfRfGTmXLmZ7Vg9oGPhL8wOG?=
 =?us-ascii?Q?8tO1VQ2/AZCoC1hFIoIQ+/G/Gv7DBBncBcA+62uqaUufoweJHyah2v8Q7SH6?=
 =?us-ascii?Q?1cKb2OTbmuNeOiAxRhOfwuI07EpIEKwT+iljTY5wJ7RgFpJRvHZ8IndhGWf2?=
 =?us-ascii?Q?8U2o/fXN/zMNmhPoJroLfHqPnEOeUunoIn6/Pfm/wNyTZrBsbLiMJaXRYEiy?=
 =?us-ascii?Q?I1UEZBiB1NgJ/VWjGiuAx/oZm8GR+3YMP3L8zzCtvJurmM3784EPQM5iUHC2?=
 =?us-ascii?Q?UinPQvYUkoNVNBmqTkKh8lYMOUagaALCGTg2t338LPIRC2m+kk7MNwDwikrA?=
 =?us-ascii?Q?OnSjFjG0wHINZD+9iGxeP8fhgYomUuog/8PHH3VajCdlQENEq5lUfJmWTqTJ?=
 =?us-ascii?Q?PyIn5N6j/k6lVGBbvwrr+xxz5TI+3hNjWXBrdWT+igMkXDVbRGN/SzfB5x5o?=
 =?us-ascii?Q?ljlFofD2dpJNbeR0qfH14sM+RPdv/9PTI06DyyAlsySrYSNFE1nIXtwFR0ua?=
 =?us-ascii?Q?ZVDA5oHUNumIo/swI8kDEc28tQb0ktlDoix+WlOcnmdiHKv4E1ghO9wxKv5K?=
 =?us-ascii?Q?g168NAWNtjEkyfCotBKkgNZY6fAZKtsjiyUVpHhp1wtMvDyxYv6tDfKFBaGB?=
 =?us-ascii?Q?o4InQM9BjuLeSJja+1sxw9JE4UD0AJR4KFfCXEX10PzA6YRq3c8qqYZ3naxg?=
 =?us-ascii?Q?ixtytugntzbLLfLMntUVwixcojVStqammPkCDhiJCnzzAMZ0lQDqBeyQftMp?=
 =?us-ascii?Q?7+DcvtqsRF+EIVIFlrCCJ89la1a3+TP51d2Lyw0eS4iGtfO5mKdN+To+SqEh?=
 =?us-ascii?Q?EaEJ2gTESHjxZ28/9TUDgvNsyMZjXpBgwEGmQQjg18Q0lGHbaTnAZLVkm+91?=
 =?us-ascii?Q?rzMRZnf3je6FhLRScv/UXt+CM3LJ/zMlrZ4kmUE8XJcJyObft7XzGA7NkKhD?=
 =?us-ascii?Q?e4GGC298y/a/lLHsfM/awpinCoKaOO1ja+WARGxgr3GKgwctzuBI6EhMoCIF?=
 =?us-ascii?Q?jK8uie8vICYYYnhhEajNeBC8+49gQT0nj4DphK3aC+9s48kj5V0s8qQxioHb?=
 =?us-ascii?Q?Za+NeVj3spMxhQ4hizVM8ytwIw1J9XyCc0URw3Fq+ExBqTRTADE+E4ycVIkO?=
 =?us-ascii?Q?Vtk/xP1jrrGD66+Ld/afLfyZV+2X8H1VfStRwL2fYdCzfdLNDyDx1HGaBlS9?=
 =?us-ascii?Q?ThU0Vy8S0EaXcbwTJnLG573faTAdMAS5X+oLDZLhCZrv1oqb9nVK1dwEMgAX?=
 =?us-ascii?Q?py0Dg2hgynzlsMQSi+eAp/o3L+3qc/6LsH9bDwGLz0PDUeuH35iif5a+iNrQ?=
 =?us-ascii?Q?Y12wHoWH8+3ix/2bjXMzEnZo6VBSWsm3HckFlDzaoqo7eLW0DVub7tdoaCnp?=
 =?us-ascii?Q?+EhU8TuTNvEImqDO/2c/Sb+ijvwTsfmpBzhJ9Jf3pjmifHHl1q/NfmE5kaFj?=
 =?us-ascii?Q?R7jPLg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5cfce5-539a-44b6-174e-08d999fd2ef7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 10:24:54.4860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2XLvGZmJhTx34y6mP+mS6tC2bnYu3ZHJEqd6au3/Y4EJHhxhsd607e3cJbV+4SnaFmi0wSWphd6M8nZUDdzKv5B97FaHSU9AtBgX057oPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4535
Received-SPF: pass client-ip=40.107.21.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Test new feature qemu-img compare --stat.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 .../qemu-iotests/tests/qemu-img-compare-stat  |  88 +++++++++++++++
 .../tests/qemu-img-compare-stat.out           | 106 ++++++++++++++++++
 2 files changed, 194 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/qemu-img-compare-stat
 create mode 100644 tests/qemu-iotests/tests/qemu-img-compare-stat.out

diff --git a/tests/qemu-iotests/tests/qemu-img-compare-stat b/tests/qemu-iotests/tests/qemu-img-compare-stat
new file mode 100755
index 0000000000..e2c0bcc7ef
--- /dev/null
+++ b/tests/qemu-iotests/tests/qemu-img-compare-stat
@@ -0,0 +1,88 @@
+#!/usr/bin/env python3
+#
+# Test qemu-img compare --stat
+#
+# Copyright (c) 2021 Virtuozzo International GmbH.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import iotests
+from iotests import qemu_img_create, qemu_io, qemu_img_log, log
+
+iotests.script_initialize(supported_fmts=['qcow2'])
+
+a, b, c = iotests.file_path('a', 'b', 'c')
+
+log('= compare two images =\n')
+
+qemu_img_create('-f', iotests.imgfmt, a, '1M')
+qemu_img_create('-f', iotests.imgfmt, b, '1M')
+
+# equal data and zero
+qemu_io('-c', 'write -z 0 64K', a)
+qemu_io('-c', 'write -P 0 0 64K', b)
+
+# different data
+qemu_io('-c', 'write -P 1 64K 64K', a)
+qemu_io('-c', 'write -P 0 64K 64K', b)
+
+# equal data
+qemu_io('-c', 'write -P 2 128K 64K', a)
+qemu_io('-c', 'write -P 2 128K 64K', b)
+
+# equal unallocated and allocated zero
+qemu_io('-c', 'write -z 192K 64K', b)
+
+# unequal data and unallocated zero
+qemu_io('-c', 'write -P 3 256K 64K', a)
+
+qemu_img_log('compare', '--stat', a, b)
+
+log('\n= compare two increments =\n')
+
+qemu_img_create('-f', iotests.imgfmt, a, '1M')
+qemu_img_create('-f', iotests.imgfmt, '-b', a, '-F', iotests.imgfmt, b, '1M')
+qemu_img_create('-f', iotests.imgfmt, '-b', b, '-F', iotests.imgfmt, c, '1M')
+
+qemu_io('-c', 'write -P 1 0 1M', a)
+qemu_io('-c', 'write -P 2 0 64K', b)
+qemu_io('-c', 'write -P 3 64K 64K', c)
+qemu_img_log('compare', '--stat', b, c)
+
+log('\n= compare two increments with --shallow=\n')
+qemu_img_log('compare', '--stat', '--shallow', b, c)
+
+log('\n= compare images of different size =\n')
+qemu_img_create('-f', iotests.imgfmt, a, '1M')
+qemu_img_create('-f', iotests.imgfmt, b, '2M')
+qemu_io('-c', 'write -P 1 0 1M', a)
+qemu_io('-c', 'write -P 2 0 1M', b)
+qemu_io('-c', 'write -P 1 1M 64K', b)
+qemu_io('-c', f'write -z {1024 + 64 * 2}K 64K', b)
+qemu_io('-c', f'write -P 0 {1024 + 64 * 3}K 64K', b)
+qemu_img_log('compare', '--stat', a, b)
+
+log('\n= compare images with only 512 bytes different =\n')
+qemu_img_create('-f', iotests.imgfmt, a, '1M')
+qemu_img_create('-f', iotests.imgfmt, b, '1M')
+qemu_io('-c', 'write -P 1 0 1M', a)
+qemu_io('-c', 'write -P 2 0 512', b)
+qemu_io('-c', f'write -P 1 512 {1024 * 1024 - 512}', b)
+qemu_img_log('compare', '--stat', a, b)
+
+log('\n= compare images with only 512 bytes different, block-size=4K =\n')
+qemu_img_log('compare', '--stat', '--block-size', '4K', a, b)
+
+log('\n= end =')
diff --git a/tests/qemu-iotests/tests/qemu-img-compare-stat.out b/tests/qemu-iotests/tests/qemu-img-compare-stat.out
new file mode 100644
index 0000000000..93dd3aa194
--- /dev/null
+++ b/tests/qemu-iotests/tests/qemu-img-compare-stat.out
@@ -0,0 +1,106 @@
+= compare two images =
+
+Compare stats:
+Key
+D: DATA
+Z: ZERO
+A: ALLOCATED
+E: after end of file
+
+Equal:
+_Z__ -> _Z__ 720896 bytes (704 KiB) 68.8%
+_Z__ -> _ZA_ 65536 bytes (64 KiB) 6.2%
+D_A_ -> D_A_ 65536 bytes (64 KiB) 6.2%
+_ZA_ -> D_A_ 65536 bytes (64 KiB) 6.2%
+
+Unequal:
+D_A_ -> _Z__ 65536 bytes (64 KiB) 6.2%
+D_A_ -> D_A_ 65536 bytes (64 KiB) 6.2%
+
+
+= compare two increments =
+
+Compare stats:
+Key
+D: DATA
+Z: ZERO
+A: ALLOCATED
+E: after end of file
+
+Equal:
+D_A_ -> D_A_ 983040 bytes (960 KiB) 93.8%
+
+Unequal:
+D_A_ -> D_A_ 65536 bytes (64 KiB) 6.2%
+
+
+= compare two increments with --shallow=
+
+Compare stats:
+Key
+D: DATA
+Z: ZERO
+A: ALLOCATED
+E: after end of file
+
+Equal:
+_Z__ -> _Z__ 917504 bytes (896 KiB) 87.5%
+
+Unequal:
+_Z__ -> D_A_ 65536 bytes (64 KiB) 6.2%
+D_A_ -> _Z__ 65536 bytes (64 KiB) 6.2%
+
+
+= compare images of different size =
+
+Warning: Image size mismatch!
+Compare stats:
+Key
+D: DATA
+Z: ZERO
+A: ALLOCATED
+E: after end of file
+
+Equal:
+_Z_E -> _Z__ 851968 bytes (832 KiB) 40.6%
+_Z_E -> D_A_ 65536 bytes (64 KiB) 3.1%
+_Z_E -> _ZA_ 65536 bytes (64 KiB) 3.1%
+
+Unequal:
+D_A_ -> D_A_ 1048576 bytes (1 MiB) 50.0%
+_Z_E -> D_A_ 65536 bytes (64 KiB) 3.1%
+
+
+= compare images with only 512 bytes different =
+
+Compare stats:
+Key
+D: DATA
+Z: ZERO
+A: ALLOCATED
+E: after end of file
+
+Equal:
+D_A_ -> D_A_ 983040 bytes (960 KiB) 93.8%
+
+Unequal:
+D_A_ -> D_A_ 65536 bytes (64 KiB) 6.2%
+
+
+= compare images with only 512 bytes different, block-size=4K =
+
+Compare stats:
+Key
+D: DATA
+Z: ZERO
+A: ALLOCATED
+E: after end of file
+
+Equal:
+D_A_ -> D_A_ 1044480 bytes (0.996 MiB) 99.6%
+
+Unequal:
+D_A_ -> D_A_ 4096 bytes (4 KiB) 0.4%
+
+
+= end =
-- 
2.31.1


