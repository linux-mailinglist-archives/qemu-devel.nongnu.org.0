Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20683D0C73
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:32:53 +0200 (CEST)
Received: from localhost ([::1]:59514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69X2-0000ev-Ro
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6981-0008VA-C4; Wed, 21 Jul 2021 06:07:01 -0400
Received: from mail-vi1eur05on2135.outbound.protection.outlook.com
 ([40.107.21.135]:17760 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697z-0002He-Hz; Wed, 21 Jul 2021 06:07:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzkga1+6mOD0/oWdSyoRCLoS1IR0g0BpcFKJKaZAOdK4JxBKs61T37HpWBsAiHlAvVYA2sop18iQZdTDBxo0oNm/u514KCNg6Xzv7qWKOB8jt64Cll/OZTtMDmSHv15YpW14cKy6mNuzakhhK+Jp5OR7I8n0pUAFOOdlRr7AusxAJ8PFDAy1uP29K6NCCNW5PzRsobCenBrw7eWKQBP/b2oJO8ojnw+2jE4QXlxi7lP+TdigDsY0qOaWkEZdwTMm2KK+Pp29wLsA2ttDLrGGDFvf0M3QZwilixgmdZ5e2/2n7gvtIwV2yUvc5rNO709YsXBpBWiT/syux2gL1Pj2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R10eEY3SLa3JfenTqosr5rslG6Qb5NWVOLL6711tuGc=;
 b=cFn1ketHDOW2fXnw5v/e9kCIbkUW+n8kR9iRIM/xuGUKuAwOmNM6y+kP0ojr9kOKgInPpDfgWmBflVAITQ1O2moP4ryUE1vXgt/o7+gBLN2AL7qLjo7ziW3SVHVJfFKLe22psc6WrpXXMsFCwadDlcLBeT2M74S9f6JQVKE+GWYPbLxSJk+rlLOP1d2eTl04L4clPCzFoCkk7b1O3fEnCce9vX2ql8v/WzHd5uYid9p/TBg7YYOVzR8BW64iz3NoJxKs53yp04wZgJh/SWZjjXQKAqcJFOXKluLQnvf3HEZzSKZ+1pLkomlFyXNZ0jz6nVhAU5LUuXfWlkUEn2BebA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R10eEY3SLa3JfenTqosr5rslG6Qb5NWVOLL6711tuGc=;
 b=TQ4LUoqouBDJDHetst8c340d7aW5/A4OPr44umdVdVUvGVHdgEZnbd0NoH2CrnW7ONILnDej7LV37CG/JX9xLgX9AnHzeReQQgQijm6vHOVpDjWLHWIdl4Rmga4t5gJ5q35L3rUXpZmDbCWahEQ1s+8+Q06FzMrYqaduaEJkMa0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Wed, 21 Jul
 2021 10:06:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 30/33] iotests/image-fleecing: proper source device
Date: Wed, 21 Jul 2021 13:05:52 +0300
Message-Id: <20210721100555.45594-31-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ef1cec7-a297-418c-96d1-08d94c2f42e0
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB549416C9CAD9F28E7579875EC1E39@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dRNUQtiZIgm1M7Arde+uochNW2W9TluLro/HoTZUcb8e47W/Bgycge15iFulA2oW9Hus4PosATf22ra1qU2EOjin8lPTkplPN5oLPQDoxNPpe55pddJNJQcqoDZ5yYWB6up7fCvgv0lkb5lG2amkHgSbcYtXl7sjhetEKQCR8utnnY6aGTImWz3iNzq1hQfYql6obpHvuJxdmfvxoQqlxvqGPSRVs4kp6k/y3Iv6xH4r/rqQw7CriTkSbZs98YmULxt7RPjdrjs04ddVlWtKphOz8HqU6vHpOZ3ZzILF8ZMs00kjZMjhRGR/+BMLtyW51mwpp/44Xt8nDTLhJcz7ROuy/GKQ3udaZyN+QZL1aDVNB/coH7YVm7zv1Ah2b8wX03I8rQkLapKfz4LV/K/6IcPJm/ZSgvaUHbDvz+018J7Uv3d2L+Ooy2fYO2HlxbrRpImAHD7JxvfJF0XVlBL67BWxbRofDQtZyjSS8araTw2iw+HoWVM1lsy2k9WXEHv4+wNYJ0xVczi8NTCv031FueQonTcRPjE8y4th9OaQr0xzQkdnNY4iqYROos3cXhmIVzIqdqjn5xW6OsfOn2kRhzliUsc5genckDTG3y6JVvL8keW2DyfzNPjXkgb8sdQSxaHZ6SqOxM0U2fNWkjAEeEhbefkxNHJivL9C85yMbt5r1rZ129YAvXQ8WLv7/EkaOKMq/c4MQ+NyQvyBDA3L5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(396003)(136003)(4326008)(36756003)(186003)(8676002)(478600001)(66946007)(86362001)(83380400001)(66476007)(7416002)(8936002)(66556008)(5660300002)(2616005)(956004)(26005)(6916009)(52116002)(2906002)(316002)(6486002)(6512007)(6506007)(1076003)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AWA43eTVGSi+BEMeBXl4wNPvfg3vTKkSOp7EpNefUS/eOXsYbsFNVq+oeIMe?=
 =?us-ascii?Q?IglwPwIW/QXdnOoML0Qt33XO3ju/dIEIi6eWQUd1mOFYGXgcKhGi8rCgBw9N?=
 =?us-ascii?Q?5KSXxQDdsk0YbC5Zsm4qkfoR5TNJU0w97uPtKIgS8y0J/5XM3j8ED69FXQWD?=
 =?us-ascii?Q?Xh9EDiQTXc0An45MfnTPiAbEQdCITgek8v6oKDZJc/Hmzx7ApvHll9O2dT2k?=
 =?us-ascii?Q?hqKh1s+JgXga0g55GZZi2c70Yv9NWlbgAUeLp9Y2e5sMdbtUBszk8aYUbSqj?=
 =?us-ascii?Q?UdpiLXBwEiSzKx/CQR2fIbYFIukXfGZgLGz8cn9kSaW9IKqx33yMxffV8O6B?=
 =?us-ascii?Q?bdFk0XrAndKQ4csS3CqiFIX3mkmawWDnYSQClDVtTlxkSCW5D7gY/zAYiw/K?=
 =?us-ascii?Q?yPMP8gn8KIJVQXzgzM79WpqjHHdyOrqdBobJ7OR7eZh0YXtCD3KzlKRf4Az3?=
 =?us-ascii?Q?pkQwsvlqCjIF35aPsKMCVkP8UmXLAp7PwoX1Jdngmcv64wTiovgHb76OG65t?=
 =?us-ascii?Q?V+iqUBryqpviA4bexARmYeOEoT1DwLrBjUfG9ecTzZQ4cJSGoBQq2icyKAyD?=
 =?us-ascii?Q?JoOBoL9hErzgdT3fhTFbwUW3gNs1J7xx3mYmZoauEB27yZ8HXh19vCHGj9h0?=
 =?us-ascii?Q?UskT0njGNwpOji6pFQm1dlZfCqZ9SAUe8h0VOyMqal66QPlsBYmf0klUrAJ6?=
 =?us-ascii?Q?GtRn8+NtqHiD9YltNYTEtzzqbC7REC4Seu9ZGWP1ZqC9BBb+NgMgJcfuViNs?=
 =?us-ascii?Q?L6cAtHQIQpv3UVyCA10hBevsxgZuo0QKuA5/hOrGugl+ExV+GnfS5kBxGMFE?=
 =?us-ascii?Q?I5L7/c0SFG8P3RuuBigptZlMYfSFdMLqSIfZeEHwCCGgNWaMQfGEHiNO+9bP?=
 =?us-ascii?Q?EJ5craEOxoYWg3bymOQJlOPhz1EOM2iUxsaz73qCPTtcMXG6iFVdlOiN0Jcj?=
 =?us-ascii?Q?zi+to7ap7wpzw9UZMlKyzi9/HdsyiL6oF7M0jujMLkkfcKJMuwJfbAdh7/Q2?=
 =?us-ascii?Q?ldeVP2kmleA3uXSdXcQxPkcz/BZxuM/n6Lfdw8esFwxi56cRm07HnUsnQv8y?=
 =?us-ascii?Q?wZM0XrEmbdIvByq3VO2NnR/A4yBAtp6Q1IaAuUJ6ypQ+TeC4O3axkN0wwsQJ?=
 =?us-ascii?Q?L3NOakDZID/LSoM/9PlGEPopti9qBO5MLAvGGqgSkI2Ejz4VIqGUryb5dFXE?=
 =?us-ascii?Q?hHnRQX0QvhPnT4PgyTSJUQgcFjBOcbbBz+msG6hmVrQubjl3OQi5nhJPmxu3?=
 =?us-ascii?Q?Ogfi1/V7sTYaF2egSlFgFsQMGleB600mZo8QufgPpV8f/a6QxkJkK3px4pAH?=
 =?us-ascii?Q?KI9Hrkp3iLE48PFl4/R+eVtK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef1cec7-a297-418c-96d1-08d94c2f42e0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:52.0507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6j5PSqI+M4eqr19ByeVaaFcqnszqQFxQlUjl6Kd1LgXi9G00iRiV7ysZvT7gUUMT389SBwpg8qLi2REdE06xmxoHyj1c06aV+N5uHwzwT90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.21.135;
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

Define scsi device to operate with it by qom-set in further patch.

Give a new node-name to source block node, to not look like device
name.

Job now don't want to work without giving explicit id, so, let's call
it "fleecing".

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 12 ++++++++----
 tests/qemu-iotests/tests/image-fleecing.out |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 799369e290..961941bb27 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -70,7 +70,11 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Launching VM ---')
     log('')
 
-    vm.add_drive(base_img_path)
+    src_node = 'source'
+    vm.add_blockdev(f'driver={iotests.imgfmt},file.driver=file,'
+                    f'file.filename={base_img_path},node-name={src_node}')
+    vm.add_device('virtio-scsi')
+    vm.add_device(f'scsi-hd,id=sda,drive={src_node}')
     vm.launch()
     log('Done')
 
@@ -78,7 +82,6 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Setting up Fleecing Graph ---')
     log('')
 
-    src_node = 'drive0'
     tgt_node = 'fleeceNode'
 
     # create tgt_node backed by src_node
@@ -94,6 +97,7 @@ with iotests.FilePath('base.img') as base_img_path, \
 
     # Establish COW from source to fleecing node
     log(vm.qmp('blockdev-backup',
+               job_id='fleecing',
                device=src_node,
                target=tgt_node,
                sync='none'))
@@ -125,7 +129,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     for p in overwrite:
         cmd = 'write -P%s %s %s' % p
         log(cmd)
-        log(vm.hmp_qemu_io(src_node, cmd))
+        log(vm.hmp_qemu_io('/machine/peripheral/sda', cmd, qdev=True))
 
     log('')
     log('--- Verifying Data ---')
@@ -140,7 +144,7 @@ with iotests.FilePath('base.img') as base_img_path, \
     log('--- Cleanup ---')
     log('')
 
-    log(vm.qmp('block-job-cancel', device=src_node))
+    log(vm.qmp('block-job-cancel', device='fleecing'))
     e = vm.event_wait('BLOCK_JOB_CANCELLED')
     assert e is not None
     log(e, filters=[iotests.filter_qmp_event])
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index 16643dde30..314a1b54e9 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -50,7 +50,7 @@ read -P0 0x3fe0000 64k
 --- Cleanup ---
 
 {"return": {}}
-{"data": {"device": "drive0", "len": 67108864, "offset": 393216, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
+{"data": {"device": "fleecing", "len": 67108864, "offset": 393216, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"return": {}}
 {"return": {}}
 
-- 
2.29.2


