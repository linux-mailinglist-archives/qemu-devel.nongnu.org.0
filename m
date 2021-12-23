Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C355E47E644
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:17:32 +0100 (CET)
Received: from localhost ([::1]:49854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0QmZ-0003Uv-OW
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:17:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXt-0005ck-AN; Thu, 23 Dec 2021 11:02:21 -0500
Received: from mail-eopbgr150124.outbound.protection.outlook.com
 ([40.107.15.124]:2176 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXn-0005Js-4P; Thu, 23 Dec 2021 11:02:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+3WagP3Th+Ddcr0Z+24ekA6XuNN5jJxJcP2KCnurViXIrzUEqDsOSUhX4oG5Fs83eZx7DaSamOTljLGzOawO0P2QM5xx3dSgCLe0YONatzeLSmtThlaZ3gQnwBy8j0MtdbWwbS9Y0xLZtVUboGCCS/ZiWDOCgTSiJl1zd1JGRwQ1peNU6KWgTJccOeRWWXNAuRAD6DnpKMDR/oJlAvoEemKW0Ettu2p0c3tFziQaLjsnWzcGl3Lmx+P1GhE1rna4oANZFzrci6PfbG9cHwPeXKpdOYOa7RjKUseym6+DQCP50cYjfN0XxqMZ/x3ceODYgaWNAkR6wtS9GkKZWIAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBCv/+yx5YMwBuqUowLPgDaBR0Xcjv3u7XO99Wgdtv4=;
 b=Lc7KdUxjIFX4BLv7a+qLn6v4xVksCN78mGOXLvAKGeAArKTTW4J8pCU5ghRuKJ2uvZMYFlwrr3JBapDY3KKdtnY2YLRGusaSXzjxi4kcIZcUFhFPxQdROnfOj8HRz0WT6detJHPucOvf/+NcHUeGTFkrlt6biSRg/73jD8x/AfFWxlLuLUcuJWyOSlgEeF3dWBgT6UB9xauPqjwbcqrDDfO180Wa3zGZ4cyaSq+/TFmtuzWcVkFOGg+IWvkzPDgRg+m81NJyDrqUqyZboeIg9oNA3yHHHUwmy2hLUQPaQUaJPTAQR+5uv+qEzl97DWxpXT+PXoVhFXibxBji3NYFUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBCv/+yx5YMwBuqUowLPgDaBR0Xcjv3u7XO99Wgdtv4=;
 b=F+F3dMMMs1j6jRCHSvsCGCOC1IVeXqPcxn6S3R4gsIYdcezBrgx7CPnhRiql5/Ks28T8Ny82XYzCszDLc0FRELVBz/bMMOMUd1nbDezjkFf1iE87omdQohOiXrQD95Aoq1z6pvC1K7rdIuWN3VziEPGQO3t0IT3mro0itqTfbSU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:01:57 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:01:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v5 08/19] iotest 065: explicit compression type
Date: Thu, 23 Dec 2021 17:01:33 +0100
Message-Id: <20211223160144.1097696-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
References: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2913bcea-f6ea-468f-e790-08d9c62d8bf3
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6148149E083012299034FAABC17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rI4QCvPxHJRkMaCXBphPF5MMvZuncWPcABl2I9ZpcPbTqJKQkz02KFTZyZIKkhcjsAGMzCqX7852LA0CxK/daB24PS1yVTfnFdZxEKWhJJDhbIYDBciLWds1O/LkwnJbqjg386sYbY36EnkSj3K6fQFYOrrtG9Q2I5YshnNcdiJlswC4Dp7Ir5TELUN/kRQEPQkWVAkd07BKiBfFUinCMyWIqXT78VSv2gM2RuB4HJqd2rYqrhfLAcjiaG80x/MAt2qvLocRZ8/ImsdKbGsMqvhKiF7wCanB5p9QVLHm70Yna59sMq42iN9KliZNHaNT/2Q/023XH3FMW7I+CWOaCYZ+bzntE2OIVM1BGIfhNIMRd/hcB3JFDoQ5ohzbtyQ/HQAfHxiTXNz2aRc7lUB77VMtY9RXrdi69XvSemiq2BPcs2EMQUKw09nq90c/sMdHo0U4CnGn8mbF0OYrl15grNWYJPCR3YL1c0hPn/Mg3PecQUjVLiFSKDzdalf2z1gIjb3GDjVLIf4+Flq29KeuAvHaAd5yNnxIov5S7sP/axQxa7pJABJG1LC2IyrALe1yR1ab0bbhnjYr4kII6GzY3F1KxBDsEpzua++lU9dLlR4ElVYdxD14RuvhS+x8m3Oo5mKW2b4dQ4Wlt570/54IVvU+mebkCXHNVGPwzthIYXF6/XqMHtABpQrOqBf95HNThV1Cdl4E42VLnilEmnoRYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(83380400001)(6506007)(2616005)(6916009)(26005)(6486002)(6512007)(86362001)(8676002)(52116002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qpaYiLRtSfo73oY2lYa6+XI7YmrBVuCs1hPeFy4lGPeECVKvAKjdgaGoxYPf?=
 =?us-ascii?Q?h4FeiEkNzFRMAAx00waLU7QQ4kLSkRQbYFKoemEcyMHDkfKH7qmr4Viwy+bp?=
 =?us-ascii?Q?lrG4uWypCVSqxru9kG1ce5wTl7Qw244GloDVI2KvodA2xLYZnT4COwRje83W?=
 =?us-ascii?Q?ZIPDly1enZ6FWCraQjvGHuK6shkWuSIud+uesJ6Vg0/a64DeoXg2XypIvLHX?=
 =?us-ascii?Q?MOxpr94SyypgeElnjGwZOfYfuUPFpNAYLnT/kjleLzl4AwMiYyQyXP3C8ArR?=
 =?us-ascii?Q?rBlm88NJnvteGTR6Vmtvn+v2TVHPQCXoPwBj4FKTLwISnP22bDG0AhC4uI70?=
 =?us-ascii?Q?Z5DjSYRbvfP29X0b3KhLPUxhglgcuNBxBRmt0fFEE1s82ihlQTrD9R3m7KXA?=
 =?us-ascii?Q?MOBAFuPp1hWmyzV7NDoj61pxXpsWvwaxp1wM+vlqNzeVtXy2uxkHAjlcLjZN?=
 =?us-ascii?Q?510edenk06BTvr2evcX4je1RRGqURVhbybDu23DxHCUi2/hsKDW8jP3QkiJ/?=
 =?us-ascii?Q?foiS+wrtZC1ry61wM3Ek4fh+HN1EAlWNp4OI5cKmoBs8GsL3quGTzcpDg30+?=
 =?us-ascii?Q?KdSz+dAC4+k0CpwVCfnr6/UXdbqCh/rK7AJHMtKHTLY5ojUXrYekS3dksT09?=
 =?us-ascii?Q?p+IGhgxO63J7RJeN/ctRpOoeorC5l74GpWvS3eoqXZoNCzUYlVg/L8915E+N?=
 =?us-ascii?Q?ZfJtjjEiX3IYcTZiC5AkSSrWwc/21P+gR2+2wGse34cqQP+xwf0x8xF+k4tx?=
 =?us-ascii?Q?UeWsybZ8JXIOhPh9gyTuIDBp3VctesP/uP1pBZQ/ZDDO/j9DPwuPvtcIl5PD?=
 =?us-ascii?Q?hefmeBTqfkenSLrajpGKZ66oMbhja7jH+SaQlMJw5X/13Ab133YFTYFtJG3d?=
 =?us-ascii?Q?LhDopZq+07CN+mxAUQ9a005WYrklGZh3QXeHHawRBS4cMsEyVbOwNdWvlUDB?=
 =?us-ascii?Q?KksKol9UBtzXQsVIiUdBfwKQAeS8HDjC/7yYQO1h9V7v+CfR8PkKSyO2YtQM?=
 =?us-ascii?Q?OzPydQkSWgBencBFbggggihvdKwA/kCRs7cEnLZbxm3hS5CSEhIvdWRkVNM1?=
 =?us-ascii?Q?RgwQxY99MNyUIx+LKpS6dL/VW+PlY8vYJhDqNQne11Bbg6dWEeJLiHjFg7IX?=
 =?us-ascii?Q?O+Ts8pzIQOskwufDM+OX7Ef1KmrinkMUGKpFV2mZobVZ+IM/3WGEBlJUEHjR?=
 =?us-ascii?Q?fzixLAtaFDHJpRg/PPmjgKWuxc+Jn3urcZsPWMsVD1RrF1LyxFXzxuJ3fLjq?=
 =?us-ascii?Q?a/HIdOS8No+vbK7Yv9xvZtkbXb3H41/Yu49J/7sZYo3io6GURbSe3buNq68w?=
 =?us-ascii?Q?/MfSH4YR3KdV75RrKVcItbtqYRV2wK3cb/jVRuBf3RZ/wXNgbda17QxFw9Jv?=
 =?us-ascii?Q?eLEBBJfyJXOhiPprIG0DtB5/0mhAIncJCBf9cdqlJXMvF481UvLZv0MesfSd?=
 =?us-ascii?Q?M0N44cRd1Sk58anQCewQVS7tU9LYxESE3iczGoUkhbsGsBFPALTc5ztm/Vmz?=
 =?us-ascii?Q?xWvYyURsy4uJwlWZ2W66rvYN7SLD/+CZyYIgYC0fQ/YFurssRvUB939v0Vxj?=
 =?us-ascii?Q?0pVxRMdB0NHFWkiJhNLbOn7rdgElpjhAFrbc9jysFsbKKszXPW/Oz+f7sDYX?=
 =?us-ascii?Q?D0zo6bvdhQnpsCZ6ryeend3UvqgFmKZI8at0lK0+Cz0En5P1s4lhb/izJOgM?=
 =?us-ascii?Q?QJoZ2qo/zzN16ml30g+qcVtLNgo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2913bcea-f6ea-468f-e790-08d9c62d8bf3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:01:57.4574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvn1AA1N40AqTWtto7eOfKwDGvWdYBHLDrjbUbCUNCLoQ3YHWuQZGmR1slhNIYyUU1ZgjCg5o4cMqBTMhdVWISeXq8MXzxzPzlyCVUxFDR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.15.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The test checks different options. It of course fails if set
IMGOPTS='compression_type=zstd'. So, let's be explicit in what
compression type we want and independent of IMGOPTS. Test both existing
compression types.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/065 | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
index dc7716275f..f7c1b68dad 100755
--- a/tests/qemu-iotests/065
+++ b/tests/qemu-iotests/065
@@ -88,7 +88,7 @@ class TestQMP(TestImageInfoSpecific):
 
 class TestQCow2(TestQemuImgInfo):
     '''Testing a qcow2 version 2 image'''
-    img_options = 'compat=0.10'
+    img_options = 'compat=0.10,compression_type=zlib'
     json_compare = { 'compat': '0.10', 'refcount-bits': 16,
                      'compression-type': 'zlib' }
     human_compare = [ 'compat: 0.10', 'compression type: zlib',
@@ -96,17 +96,17 @@ class TestQCow2(TestQemuImgInfo):
 
 class TestQCow3NotLazy(TestQemuImgInfo):
     '''Testing a qcow2 version 3 image with lazy refcounts disabled'''
-    img_options = 'compat=1.1,lazy_refcounts=off'
+    img_options = 'compat=1.1,lazy_refcounts=off,compression_type=zstd'
     json_compare = { 'compat': '1.1', 'lazy-refcounts': False,
                      'refcount-bits': 16, 'corrupt': False,
-                     'compression-type': 'zlib', 'extended-l2': False }
-    human_compare = [ 'compat: 1.1', 'compression type: zlib',
+                     'compression-type': 'zstd', 'extended-l2': False }
+    human_compare = [ 'compat: 1.1', 'compression type: zstd',
                       'lazy refcounts: false', 'refcount bits: 16',
                       'corrupt: false', 'extended l2: false' ]
 
 class TestQCow3Lazy(TestQemuImgInfo):
     '''Testing a qcow2 version 3 image with lazy refcounts enabled'''
-    img_options = 'compat=1.1,lazy_refcounts=on'
+    img_options = 'compat=1.1,lazy_refcounts=on,compression_type=zlib'
     json_compare = { 'compat': '1.1', 'lazy-refcounts': True,
                      'refcount-bits': 16, 'corrupt': False,
                      'compression-type': 'zlib', 'extended-l2': False }
@@ -117,7 +117,7 @@ class TestQCow3Lazy(TestQemuImgInfo):
 class TestQCow3NotLazyQMP(TestQMP):
     '''Testing a qcow2 version 3 image with lazy refcounts disabled, opening
        with lazy refcounts enabled'''
-    img_options = 'compat=1.1,lazy_refcounts=off'
+    img_options = 'compat=1.1,lazy_refcounts=off,compression_type=zlib'
     qemu_options = 'lazy-refcounts=on'
     compare = { 'compat': '1.1', 'lazy-refcounts': False,
                 'refcount-bits': 16, 'corrupt': False,
@@ -127,11 +127,11 @@ class TestQCow3NotLazyQMP(TestQMP):
 class TestQCow3LazyQMP(TestQMP):
     '''Testing a qcow2 version 3 image with lazy refcounts enabled, opening
        with lazy refcounts disabled'''
-    img_options = 'compat=1.1,lazy_refcounts=on'
+    img_options = 'compat=1.1,lazy_refcounts=on,compression_type=zstd'
     qemu_options = 'lazy-refcounts=off'
     compare = { 'compat': '1.1', 'lazy-refcounts': True,
                 'refcount-bits': 16, 'corrupt': False,
-                'compression-type': 'zlib', 'extended-l2': False }
+                'compression-type': 'zstd', 'extended-l2': False }
 
 TestImageInfoSpecific = None
 TestQemuImgInfo = None
-- 
2.31.1


