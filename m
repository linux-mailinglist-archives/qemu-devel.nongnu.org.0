Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62A7302B08
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 20:03:06 +0100 (CET)
Received: from localhost ([::1]:43102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l478j-0000HV-Iy
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 14:03:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l46xd-0007hJ-1t; Mon, 25 Jan 2021 13:51:37 -0500
Received: from mail-vi1eur05on2101.outbound.protection.outlook.com
 ([40.107.21.101]:34720 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l46xZ-0005Oj-Lo; Mon, 25 Jan 2021 13:51:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEi09YYgajq4djdpXJv0rh8Y87WYj0CrN+M3Eb0mt89Mf6eiTIBzoUO6f50ScjJyvzg7ygMmwpzsDYohp3ScB0zplG4MlR2iHy0YxRgoe/f5B61CYmKTwB3duE5Q80Ns34QEU+FUAcDsLj+YE67lGyTedCGGC/+oItAaV68jlgvVhjfxv+Umtx6MIOgSzqQKTDAZFb1STVi5/dIVxTLBpUbqWBkCvGJeAzINbR1m1TEL+QNF4xvAuCUGiYszuSKh515tDqzFPbEEocfjPPLRl+gSuMgrwRmoqlSSTK8e3iX3BD6dovhHO5yTEBtUSczrzNWTjd159dTeF+vaJPtcdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtE0VJL6N4O93BLVx+z3eArBoVg82V4idyb1Sk5Ka4w=;
 b=E8B7X4NmYEpRvaJDZLcx8sFSvbgGdZkA6fLaYI5ZPBNUPBUYtECQSZkA5GXKSqmO3vDxDPg3qJBEfPqHOGv403A6pZfXqKm0yQNamkI0wu88J4ZPynxfEAMtHvdqqTPnfnhQs0/RqBvSRnG5WrDFZFIMd6goXyrEKJwp8KRtqsa/ptOqpRFDTtnFsKIB9o5Cr9Lpd4jLXkk/duAqvKgf4vCctroVXSA0/6SjLCxqyinnaB3j0k3PMuTS0TBeyqtCDROwFrArvhAQ6UToQnKykrhoF3OPDWOl1qgolBXsDzrKmWsHIQQ0KgQjbcSLnmyRhpjLl1+A1Dz+HoG34oeSOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtE0VJL6N4O93BLVx+z3eArBoVg82V4idyb1Sk5Ka4w=;
 b=aVSnk5ig6EQx7pZ5u39YIb4bSDDy9n2524XjGoupGEn8oBPMumbyoyjqoUftGaihYalIEbxhzvAtoP047Q+Ea/nHyPkExsqVQBWmnWmZELIwJ1b/7dIJVFFVFuGN+xLOY3yFMlO1IgHoogH9WCOCYCwQP98ul7S0TlhoptR8WGg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4405.eurprd08.prod.outlook.com (2603:10a6:20b:b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Mon, 25 Jan
 2021 18:51:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 18:51:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v9 6/6] iotests: rename and move 169 and 199 tests
Date: Mon, 25 Jan 2021 21:50:56 +0300
Message-Id: <20210125185056.129513-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125185056.129513-1-vsementsov@virtuozzo.com>
References: <20210125185056.129513-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.113]
X-ClientProxiedBy: AM0PR01CA0134.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.113) by
 AM0PR01CA0134.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Mon, 25 Jan 2021 18:51:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a97b2d32-4345-4f40-d726-08d8c16233fd
X-MS-TrafficTypeDiagnostic: AM6PR08MB4405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44059C3D6252E35FA0BEE0D8C1BD0@AM6PR08MB4405.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RKu3sAnKrhLtlYfJOwb10XcMaNLyZv3vYAGgCgi3WCi1y7e8IHgY7nP/Nkrct7gIfD6aKaDBlbB9CvoSBVLZKSAQDOK0r8NOTnAO7m6eLKa7jjMCxlyW65Vq2KGFwFXJlj+/pgGn1LB5kPW1QRnwWeXn6H00M9aR+Q7JOQsNxc8I5hlWZyChQ3sDMhv06vWcPWH4KqlXLwqqiOVggMNCCle0z0uhZBtQys7cgpbCe/yatil8ITwhZxeoYokSu8TCLLBMEV5ew0P85WTqWe6fU+SbNMs4vkAg5MRPtpXvZkDetUcNfc4CYxdGl17oUTs4tcs2y+JW60QQUmHg7TL/OXHsNe5JearM5pDHG9IVdnDYZ9or+U3Ym7hV4bSkpucSPWWN3shMbk1niqZN5KZfbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(366004)(396003)(376002)(346002)(478600001)(2906002)(8676002)(6512007)(83380400001)(6666004)(6506007)(86362001)(5660300002)(36756003)(26005)(186003)(2616005)(16526019)(107886003)(1076003)(66476007)(66946007)(6486002)(52116002)(66556008)(4326008)(956004)(8936002)(316002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3ey/kMOaJlXvV53i71nG0XOYqs7eVrZpEjgrDKBuJoGbfbL28krjTFzc88c4?=
 =?us-ascii?Q?63RJRhKeulzEiJSvXTFzLt6c+qRZyotRFUX6/8E/PchQwZ+MrWjxziH3eyir?=
 =?us-ascii?Q?YRllIssmwz92X6yRHzv9x6x65RjexfYGn70tv2Mq6FkaF8sk1lw/Zp6L+Mw/?=
 =?us-ascii?Q?Z080XsyBvHkO3WHnJTE1BPQohPaKhnxvAor/HltZYeuYn1V3ZgOD441b3Qq+?=
 =?us-ascii?Q?yvU6jgN0IqsgoG1biqnpzR0eZx9gWylf2OJINSbalO0tQMasvCk+JyjYKmtj?=
 =?us-ascii?Q?ulMuZ0FPNtkqZXSkcqcmtRbC9koBRmpzACXNewLPg359p6Ay4H4jSSXXVnYb?=
 =?us-ascii?Q?QzQLO2b6eM/HZKZiXu3SNgYjUIlFVaKzHEL4Gfd+Y7Ya8t/JvUIreD7qK8gO?=
 =?us-ascii?Q?UC12V5qDEWkIhbwl00/GbXFQihay5PUPhBpTCy6MJTlQkQEePUtoKSoVpr5s?=
 =?us-ascii?Q?G220nP7KrAaqA6SiifxOok+Me567/7C0kiL+EYe4b7V5O4qM+htBrr1GzeYd?=
 =?us-ascii?Q?3hYN/qBGKyKdrSBZq8sdyFLjndQRKpl49jwWAb2mIZ85KVGxrLRpv6boM++b?=
 =?us-ascii?Q?VHq7DyTUZ9dbgEw/YsvLYJTYGAM/gzryT81XCyVRh9CMVYOAVuTHxORutoPx?=
 =?us-ascii?Q?SsI0cL4WftF3+T6d0khVmEkR013DIMQ1gUa6Bab0p+k1IydhdqXcJmUM2CzU?=
 =?us-ascii?Q?YOMmhPeRHcAcHNRn4E4Mzs7kbR/H/aYFDFpaBCZz5YgHD90XOXACjYQRvtvY?=
 =?us-ascii?Q?PJkHTQl/n87SPpoDuDy7ejk8lMXVCMfec3M/M8KJh3SbeeVGymEDdO3VxN3X?=
 =?us-ascii?Q?Qp6i+Sm8qJl2J1J15TSMKschU67k5maqGPuWYs/VhdwbeQ1gYW/5eLkkJv6T?=
 =?us-ascii?Q?jdNUumyq3ACbicv6JGT86mX6UvsAFa4dMgHvEuhyCTbMX0OFZNvySyPY/YSZ?=
 =?us-ascii?Q?msDa0WyZbfEaGLzKo4FN8gP3JwIizWGTvSC7/TMCOJaKFpE6IZbCjuhxOiqY?=
 =?us-ascii?Q?0cvGWUkwUk20rv1ODPeahqBEdiO/L66wmIT6ImgSlpqP0ZRaydVZ48Yd0hGj?=
 =?us-ascii?Q?vQZ5drqY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a97b2d32-4345-4f40-d726-08d8c16233fd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 18:51:19.7429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qs7eyAfaeOeBukyT5tokrZwF9P4CN0n45m28wW6m04XLUvEfuRK5zjJULD0cCqWuO15xf5/iJp7tzOpXzHvDyZZ+BbiImpjxNBO61xWc6NQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4405
Received-SPF: pass client-ip=40.107.21.101;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename bitmaps migration tests and move them to tests subdirectory to
demonstrate new human-friendly test naming.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test}   | 0
 .../{199.out => tests/migrate-bitmaps-postcopy-test.out}          | 0
 tests/qemu-iotests/{169 => tests/migrate-bitmaps-test}            | 0
 tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out}    | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename tests/qemu-iotests/{199 => tests/migrate-bitmaps-postcopy-test} (100%)
 rename tests/qemu-iotests/{199.out => tests/migrate-bitmaps-postcopy-test.out} (100%)
 rename tests/qemu-iotests/{169 => tests/migrate-bitmaps-test} (100%)
 rename tests/qemu-iotests/{169.out => tests/migrate-bitmaps-test.out} (100%)

diff --git a/tests/qemu-iotests/199 b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
similarity index 100%
rename from tests/qemu-iotests/199
rename to tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
diff --git a/tests/qemu-iotests/199.out b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test.out
similarity index 100%
rename from tests/qemu-iotests/199.out
rename to tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test.out
diff --git a/tests/qemu-iotests/169 b/tests/qemu-iotests/tests/migrate-bitmaps-test
similarity index 100%
rename from tests/qemu-iotests/169
rename to tests/qemu-iotests/tests/migrate-bitmaps-test
diff --git a/tests/qemu-iotests/169.out b/tests/qemu-iotests/tests/migrate-bitmaps-test.out
similarity index 100%
rename from tests/qemu-iotests/169.out
rename to tests/qemu-iotests/tests/migrate-bitmaps-test.out
-- 
2.29.2


