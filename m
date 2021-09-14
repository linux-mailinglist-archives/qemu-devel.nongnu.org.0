Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C58240ABBF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:31:39 +0200 (CEST)
Received: from localhost ([::1]:59168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5j0-0004LS-Bz
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5dt-0004Rv-7M; Tue, 14 Sep 2021 06:26:21 -0400
Received: from mail-db8eur05on2115.outbound.protection.outlook.com
 ([40.107.20.115]:20224 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5dr-0003Ok-DL; Tue, 14 Sep 2021 06:26:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEOKFYRVEcPcwSFiHh5YXS7qqHhl0yxvDvXOz/6lRjWokZ7hqaqAr57buf7Sczg+QFgFA3VwAGBZ7SVlvJohbisV9hkb+nA9nReC7vWwVGdTSB7ylr00/jgbq70a9ewBQBtAfwNS595I6K/SEJa8MqDY9z0Qw8ibiw8obdxea17fjC0d94lfJDKt3TKqAuKPX8MUjy5K77TkzLf4FHPGp+Ai79bPUnbBtHqU7Z8u/SdkRtSRJYrd+/2uNDPJ12TsUrGg5EfrqLzCAU3vOQeBgbVXppmd03ffx0Kwye6kYFYJmVRPcqFLJFtM0estiA7CCR+weEXNe+7mgbw+2JHe4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=flq75acknG+EaYufWDuGar4fGO8HKuqo41kMyvDMz1g=;
 b=fxeLFq5L3leIIvKNfsztpNvzEGBC7K1YwGFo/aw92+hPkCJY0adg6grNvhnY/gLvIiLFsarBZWsrDUqrAJueH96OZtLHNg9hbxmO+XnDUE+4jPBgOa/5IoezsN4IVxCKiJlITmuC2NCqegsVpLivm6hflWXod/w7VI9GhZkVyWdOs9IhBRzjx7xE/ZkFhw1HXCGYoTkvOdjDdnV2arJw07RfiTrjUn0B9xVFIunlY9Xgc8YJBno2wq24cm8P0n8nrm8bE0nqCOx3xIpELSLJwVrVY90elmzER3BUt8anhZfQAs1VEfYwfWHm7s2IFxRNtUivo/hCEg4CK8R8zduqzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flq75acknG+EaYufWDuGar4fGO8HKuqo41kMyvDMz1g=;
 b=aQFfDkmdtK9OVX5NQrqds8uF7kAE5hkwOP2QkAQrd/1BWPXdSzQjm4VvYFdLDKekkqMCP3j+rFipsXOlTXsfq6q357hZvGRXR8iJdjeG5HfTtPbMV1OsNppqjPAI53RtPlIcvwTBNLeyC7IcIxbhKuUCIMuZ4lGSh8ZDj4iND78=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6071.eurprd08.prod.outlook.com (2603:10a6:20b:29f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 10:26:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v3 06/17] iotest 065: explicit compression type
Date: Tue, 14 Sep 2021 13:25:36 +0300
Message-Id: <20210914102547.83963-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914102547.83963-1-vsementsov@virtuozzo.com>
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f327699a-33c0-487c-2cb3-08d9776a1399
X-MS-TrafficTypeDiagnostic: AS8PR08MB6071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB607140CD2CD5758FBEDE034AC1DA9@AS8PR08MB6071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DsWhO/njih/cC4QrnbK3SYIvrnARzAiSSxqgVv2tYRIOclHuJxS0fOZlXloltJX4Y5jZDM+sdmu7Cvx1PA4TiDoonV4wVPt4JYn8umHjFV0hUmVnaGEPyYxSga+sI5GKBucyOSBFm5Mb8jvYHnF3IStNqojpigE2JIjzTYRZ/+QHjL9P1Gt7j1ynIbYs70X0LBAuT6vXe1UxG64CV5AhRBUPLplm/rk+bRblXdaWHISsKtWBVgG/ttKjmiCbTMix8EkrAseCVwQgHb7hreTkFajqMF+yU5w10+KvXhildrY8Khf7vHDqqufR+M9FKdCd+Vu7clG9ifyAFMAq2tvnd8EZmi3AkgP2PW0dpRpSKrXURsmRV5Ltw2o5YIkRhQhkViyNKESPaUvKwo7wyFI9hvlqK88HBgdtYg7Oq4GZBNjsIDgOl3VNlMJq9K1ZCVtazeSi0RpfGefwOTobTUbeToDNISy+x5+DS2JYaa6WL80qGE5FFdp6xhgn3CpfZPkPx1hNLw2ECLkbz9LjhYlnpmeTJgj1B5mHs9InmarLf9NRo7HnWAW6gQgbAAfHaR+TH3BRM7NZ1KZlG0Ftn1IsHHmNUTffJVYsDM5F/AQJhLvrs6TYOnhdA6NWv7CO90h55oUGWIJtcIaTGf6SHeLD2kb8AOi5icHJmm+0VuB3hl//iwFM4Veza6exMdPLOOd0AGFBoDHsB5TiK+wvyQ4/Sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(366004)(136003)(396003)(6486002)(26005)(86362001)(2906002)(6666004)(38350700002)(66476007)(38100700002)(66946007)(478600001)(8676002)(36756003)(956004)(66556008)(1076003)(186003)(6506007)(6512007)(6916009)(83380400001)(5660300002)(2616005)(8936002)(4326008)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/WoG1zx03t2SaM7NZ1obft7P8kqFx6Z5Qv1uwBE10pkl/tl73mXcJHkZm56I?=
 =?us-ascii?Q?QjWmhv/f9wZV0chdfPq1FccWCZO8YIHIWIu+ahxwWQujgcXvmFHcLAb//kfk?=
 =?us-ascii?Q?gdure334NgJXm/gw9DUP1yackl4v+3NN4lUTJaZD3K1ArA3pEvx9pjVCM+qa?=
 =?us-ascii?Q?yhqAcqgK87K8iCoWD9irN+gk8PNqUt5PbvDCX5opX3Ed6+Sr5aTu7XRZgnMi?=
 =?us-ascii?Q?em5RC4rHDDTDHSmgb6v2M7NOOm3PHroz29e7Iv6ztOwgM728OHJpZJr3joci?=
 =?us-ascii?Q?tHtZLzj4+YrFvQT1QHf0Qa2EEbLaCcUmXWsUAxtW2Kue10PZi3KyvBO66vLP?=
 =?us-ascii?Q?pKenpV6PpIJE9dyKqTcjAp9S71I/Dz7xyJUEG0XLeepzHR05sFJ9aNw1f/qx?=
 =?us-ascii?Q?fAm7mQtrGt0LQ6a/Ayg+7PmwmLgReOiLmATw+t9jvgro/VCxmewH3S+o89rE?=
 =?us-ascii?Q?oy+C8F4dnegKZ5wGTKtlSVKDiCootSHAG+t4gfAss35jYx3Br7U+Agmlt/kr?=
 =?us-ascii?Q?/MU5aSwxNlI+ZyYg6nVFivdKVDZBqgnAIf8++ccdQ+ml0pnttQEctzLpcQb6?=
 =?us-ascii?Q?SCJU73jnwogyT/0Pxi2GTssWk/02U62ahKtJoZi/9vZ29piIkkcE6F1zGxBb?=
 =?us-ascii?Q?HLCSKfUPq1Y7wVSOIWgzHxdTcaw7v6YMLNhTGE2rzlG/5MB7SA0WycuK6FxK?=
 =?us-ascii?Q?Nfpus2DmjqQCaJmvq6H+ed+TEOQbRi5ztN4HSxj1BOW9cbY+L4043QfjHguN?=
 =?us-ascii?Q?Fj2bMZm1v6G+RPwndPyCwenJ2GjhAUa3tuJ4YJcDE1AxTDs5bKmE12mQ74vE?=
 =?us-ascii?Q?EJzCQo+aBmb3LKHlcikkTz15g9ylk0lPzO5wI/6RdmhtHaqJKT22tUgbTcgB?=
 =?us-ascii?Q?OfUBUAp374gDucj0WIjVxIsSyMK02w/6gXFD4PeHMipr6LFCnOvObMLdMOmX?=
 =?us-ascii?Q?wNMRaZv2TM76C0XuFk6e0RzdW5cSZivuZlJpn6AGsa4vafEsgWXcEielSH6u?=
 =?us-ascii?Q?oyQNoZILoht3Tw/JiHGmHt06IX4nlFW7t3iYPrxGzX1l2QybpSL5Ue1cybAj?=
 =?us-ascii?Q?s2oM/ranOF9XPyb0RaKWXnH93CqfR8fPo0iZosQfk+XJDCGhduDjtUk/afDF?=
 =?us-ascii?Q?0cWyNNX1TwVa9MdrHLQ9xjqRsOAB8wSndxMtBt4XsREsXYRoTGQcWsi76jQ6?=
 =?us-ascii?Q?QvVqmqow0fMw0TsLiKgNY2Tfnn4hfZtI4YazPMQTQ5MBzJ1gSuR7GRZDsQEU?=
 =?us-ascii?Q?Zx0WyonqcEes4Gm79uA5lhDERDGaGfxOn+zjsAj4G/lMzMEUsyHtjZnJtqYI?=
 =?us-ascii?Q?L577aPt1ZeJrrN6SQAHiT5Ho?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f327699a-33c0-487c-2cb3-08d9776a1399
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:13.0153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1QqzuAtfMs9S/UKUC1ShTbw1i2wVmMWPxRaN/SjwBrvY9aVpdwaloMkgzW1D4eR0JNse0PLbUE5dLNM3VfXKlX+zYNgCxRVKuVEleh+XRMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6071
Received-SPF: pass client-ip=40.107.20.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
index 3c2ca27627..4b3c5c6c8c 100755
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
2.29.2


