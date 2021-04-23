Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A323693EB
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:43:59 +0200 (CEST)
Received: from localhost ([::1]:38410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZw6A-0004i3-6c
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZw5A-0004CA-26; Fri, 23 Apr 2021 09:42:56 -0400
Received: from mail-eopbgr00136.outbound.protection.outlook.com
 ([40.107.0.136]:21992 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZw55-0007pD-HH; Fri, 23 Apr 2021 09:42:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJJLkobAdZ8zuqK3C3z7sfSnFLrsm9m1GziQAcaN/h/dZJkVz4StzT/ol9rjXrDue/pHp+H0fv/0LI1pB+gKvQAeOPbZoL5crBD8EcBTMhTWvThGmCQh0Fct0/2qtARG9b35rdvVNhUqKYZKOxMMYmdowEKZ8rz0+1DuyjmfruEqg0ICKUjGS2GXz964AlOIehK+IJmB5N9erQ5ej/kbOKsK2rsLqIBn5AHUlt7S8nn/BVz83AJgESUPpw0WKPJdGRWZljwgqv6Kwcua13kgPmaHPTFlOpvFhGSIneRFlelhURNBReEupCZUzVGEAWWOd64BK8nlUDbR0wUMITxvZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nkZh34/SiQaIDtmEo8NVcbtgh1/NX1fz5vlNpdnmUI=;
 b=SuEb/dIiokuOFu6v7/y653WN0qinNVXiGwNmYtc+E+Q/Ve3N0pmz3BE7C063Evbf+TiB+23b+WXzJI5E8gCWjaTAwKhSJQEvqgzP+/C09pt9QLHvblZZXOIfU91vR3CGNVnCL76VyddGnlAikBsjUDGTzlrwYLf5zZ2bvqB2zIFtKLawj1dlE/G+ufK7rO3lpHj3oizxTtnvpAGLXcxvSu5OrzbNWtjuIOG9+bBziSQYAvVpGuzleq46zqbVw7eCxgd2GECQ/Z39K93ggdZlJZTN4WB3G/EYUAP/xC31rUq17VyUTdMxdf8Cr01uqhF55yO+XvSTgVIBPG4R7tP64g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nkZh34/SiQaIDtmEo8NVcbtgh1/NX1fz5vlNpdnmUI=;
 b=QYR69FgeQV1iUX+kklr2Pyph8Jb3ryHgjYEKXaXYmqD+j7FFBIgSx1vCijEolhCdN+bjJKd3H8H1TUhQGGkrvJSLY6TwOWIMFxHwsD+wXgBvnuVKB3fxvVKIAplSf9vNIPfNoluSNJFAkr1Z+jAs3gIfhcNQK70m8JESSSMwRho=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Fri, 23 Apr
 2021 13:42:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 13:42:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, philmd@redhat.com
Subject: [PATCH v2] monitor: hmp_qemu_io: acquire aio contex, fix crash
Date: Fri, 23 Apr 2021 16:42:33 +0300
Message-Id: <20210423134233.51495-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR08CA0052.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR08CA0052.eurprd08.prod.outlook.com (2603:10a6:7:2a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 13:42:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6440773-e3ba-4673-bbb1-08d9065dae09
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652C0915EFDEA445B12EEFDC1459@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cPqDUGLWzaBOcrk2LL9LXvp/dSFv3BI5cEV7o4VJO/R+nq2v1BowLfqRKRASdtz8DRYdbyroLrWT1nRs/cbSD1+rizd7oXLqTaKiSW8oeyElf3EBIkEOFeLMiZbSsPJUOjADbglDBKfWXO1ReJqo3PeBwP890HOAeJUww+eU228OcNiOvN6nOFqvABpC2sUW51EzhfO5XlBfn8p4EMuS5UWn/5mLPY9BcvzqW6Ww2YsNo7OXgPFEHVronJRkK5/hAuGZiTY2lzevahY1KA/u4v7+s9OokU089CT5dz9jhcZXxR8axvvmLWGlCzMawe6gUSvPUer8StBC+8AgMKxLzg3WXlYZ1PEJJvaT+kwjD1tLvdvAFVy81gC0jwxtw9L64NnGAUk+xHvdj+akdxjvsOnI6/QLwVIP5oAQOtneCOpArFPhCboi1LJcket8FzrIbpI/k/sKG59w7ukkOcMF1o+ZHUqshQ6DqTjRdBnWAZDmonbY2Ipsj27Gg0yL7qIpoxiooJtiLKMX/eFTDyQ/QpVufSmye9H4FPy4iXNFEECJUPhltge3mlCFkyukDRZK17coXCrZPFLXGDc+rPWFPjAMlJZfPiB9/x4fTxhOT2czKHzs0goFCaZ7bKVeFPPj8VFvdE/sCuQs1nV4+MAG/2eNW2PPIpTZdLcUhhYsqAv/zyUZFvktaRfzypnvbzPk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39840400004)(8936002)(6916009)(6506007)(316002)(4326008)(478600001)(2616005)(83380400001)(66946007)(956004)(36756003)(8676002)(66556008)(6486002)(66476007)(5660300002)(6512007)(26005)(2906002)(16526019)(38100700002)(38350700002)(1076003)(186003)(86362001)(52116002)(6666004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Vx88ICpXEomGPGtwGXmZOv6IP1UZ0iI6nAToFGDE2yqt31dChmbRUfWvbomS?=
 =?us-ascii?Q?tUKyTSqfFLnJlEPinpf3H2KTubVhFndvEQR6qcbvDPrgURSTaLvazPTlMIQi?=
 =?us-ascii?Q?BNNk9FR7yDfTsPUPJkfEU6CvCbJXpkKJ0d7p+Je1St0Tc117GaSeNSxH+ABD?=
 =?us-ascii?Q?T2jqC1liRRT0bCcNTjq9lFqIcbS7wsVGxPxK0TenR4lzxog1f6fm/HR2iCkA?=
 =?us-ascii?Q?BAMHk6A0X8zKgqSRimyaDJ61hHwd0SuSSXRUJC4A7u0qLK5jk1LYA5U2TCif?=
 =?us-ascii?Q?zGVWc8bThZFpC1pb0HwI8xASvNsRtfHBN3ADUW4Ddfv4e9YZuadcDXTTK4F9?=
 =?us-ascii?Q?kKvv6lx2tpf23LdDNpA4AoAz/rpH6OpZvvGxqA8tJEbzIAhTpyHr1kXUyyDI?=
 =?us-ascii?Q?Ju7d1+pByErrPtFqIySb/L8MHj8K5c+p/NuUM33luOcknW0o2qf/18Ix6Ozh?=
 =?us-ascii?Q?V+pLo1hWwXXCiJT/p4ihcqZBRNjR/icaWrXOnFS2PcTuPIG/MRwvFnZeuTuI?=
 =?us-ascii?Q?6Kl5nH8cb+hB2vZBoh/9ip3geyogb/GeMXZjeYqfmxuBqD+SBFrfpGJy1pyE?=
 =?us-ascii?Q?lpYph4dmOF3/GOzQUSsgFgbuZEU+Hs09M4BQMCSM4oQ0G7rjKsPSW4oezNly?=
 =?us-ascii?Q?DKY4EvB6X5CplrEMrotBr/fB/medK6OxwFHrxyY0dxuGbZHWtN4VtBKk65sb?=
 =?us-ascii?Q?IpEAaPPfzYrPRIEO9mEN/VU+ZXJjsCCcJsRXKk2gG/2Vr5NoAveLaDCru9p9?=
 =?us-ascii?Q?FMWFW0xqFeA6/M+rCAyGKNoaUUm4paUQKasYnhvh4Le5VZaoRsivQeyjcMQU?=
 =?us-ascii?Q?A9o4osOKSfJySziXU7q0rbKPggU+PKeMeFPgU/F3S44MOB3bYJzkIW5lVVi+?=
 =?us-ascii?Q?M6s4U18xszcDvMxh0C25AZ/lMYB12nFFaIKJ/gpSw86z7YuU1P9VKBObe/RT?=
 =?us-ascii?Q?ebMCXXCc/CecBYN3hSCw2TcczRxTj0JZky5W8jzBwQJNaDMWtuKXmM35numI?=
 =?us-ascii?Q?zTnuV5zyzcN01zhzkoTZ3xOpw+d4y/GyCQ0dNc8MsLRESD4wmT7QHMkId8uR?=
 =?us-ascii?Q?mHWdSLEbsOKa/8uFgTpYZkEqBdqME+Km1GfyhIuwgHjZWjT3eJQmJLT59KDo?=
 =?us-ascii?Q?JPUlHxuyM+ICPKGske6PjtW/XZZ8Ya/FOSPNa4EMsQC3iCLIyS3U1wRe3k+1?=
 =?us-ascii?Q?mfKaH5DoaDisyuP/lx74+WrqTNKB/8KLcyf4M5WufH8f7bkMVKyIIjnlQV2Q?=
 =?us-ascii?Q?RWxJ5kwAHJ77/YaUFEKibQA1Gwdz1ZBlLY5r3TNvE0MhJebQaJW2g88cdke0?=
 =?us-ascii?Q?yun5H8DdUOSjKhbK30ptpNE6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6440773-e3ba-4673-bbb1-08d9065dae09
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 13:42:47.3076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjTScC0TflGJZGlsk9tSZlxzQQSYcRpZVoWSWX+jojuUIo7fkHUMXKBpyzx7uTGtQ50Q1HuXdjT5iI3+JiETwYUsWzVfKppTIfbaPC84Um0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.0.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

Max reported the following bug:

$ ./qemu-img create -f raw src.img 1G
$ ./qemu-img create -f raw dst.img 1G

$ (echo '
   {"execute":"qmp_capabilities"}
   {"execute":"blockdev-mirror",
    "arguments":{"job-id":"mirror",
                 "device":"source",
                 "target":"target",
                 "sync":"full",
                 "filter-node-name":"mirror-top"}}
'; sleep 3; echo '
   {"execute":"human-monitor-command",
    "arguments":{"command-line":
                 "qemu-io mirror-top \"write 0 1G\""}}') \
| x86_64-softmmu/qemu-system-x86_64 \
   -qmp stdio \
   -blockdev file,node-name=source,filename=src.img \
   -blockdev file,node-name=target,filename=dst.img \
   -object iothread,id=iothr0 \
   -device virtio-blk,drive=source,iothread=iothr0

crashes:

0  raise () at /usr/lib/libc.so.6
1  abort () at /usr/lib/libc.so.6
2  error_exit
   (err=<optimized out>,
   msg=msg@entry=0x55fbb1634790 <__func__.27> "qemu_mutex_unlock_impl")
   at ../util/qemu-thread-posix.c:37
3  qemu_mutex_unlock_impl
   (mutex=mutex@entry=0x55fbb25ab6e0,
   file=file@entry=0x55fbb1636957 "../util/async.c",
   line=line@entry=650)
   at ../util/qemu-thread-posix.c:109
4  aio_context_release (ctx=ctx@entry=0x55fbb25ab680) at ../util/async.c:650
5  bdrv_do_drained_begin
   (bs=bs@entry=0x55fbb3a87000, recursive=recursive@entry=false,
   parent=parent@entry=0x0,
   ignore_bds_parents=ignore_bds_parents@entry=false,
   poll=poll@entry=true) at ../block/io.c:441
6  bdrv_do_drained_begin
   (poll=true, ignore_bds_parents=false, parent=0x0, recursive=false,
   bs=0x55fbb3a87000) at ../block/io.c:448
7  blk_drain (blk=0x55fbb26c5a00) at ../block/block-backend.c:1718
8  blk_unref (blk=0x55fbb26c5a00) at ../block/block-backend.c:498
9  blk_unref (blk=0x55fbb26c5a00) at ../block/block-backend.c:491
10 hmp_qemu_io (mon=0x7fffaf3fc7d0, qdict=<optimized out>)
   at ../block/monitor/block-hmp-cmds.c:628

man pthread_mutex_unlock
...
    EPERM  The  mutex type is PTHREAD_MUTEX_ERRORCHECK or
    PTHREAD_MUTEX_RECURSIVE, or the mutex is a robust mutex, and the
    current thread does not own the mutex.

So, thread doesn't own the mutex. And we have iothread here.

Next, note that AIO_WAIT_WHILE() documents that ctx must be acquired
exactly once by caller. But where is it acquired in the call stack?
Seems nowhere.

qemuio_command do acquire aio context.. But we need context acquired
around blk_unref() as well and actually around blk_insert_bs() too.

Let's refactor qemuio_command so that it doesn't acquire aio context
but callers do that instead. This way we can cleanly acquire aio
context in hmp_qemu_io() around all three calls.

Reported-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

v2: rewrite, to cleanly acquire aio-context around all needed things in
    hmp_qemu_io

 block/monitor/block-hmp-cmds.c | 31 +++++++++++++++++++++----------
 qemu-io-cmds.c                 |  8 ++++----
 qemu-io.c                      | 17 +++++++++++++++--
 3 files changed, 40 insertions(+), 16 deletions(-)

diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index ebf1033f31..3e6670c963 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -557,8 +557,10 @@ void hmp_eject(Monitor *mon, const QDict *qdict)
 
 void hmp_qemu_io(Monitor *mon, const QDict *qdict)
 {
-    BlockBackend *blk;
+    BlockBackend *blk = NULL;
+    BlockDriverState *bs = NULL;
     BlockBackend *local_blk = NULL;
+    AioContext *ctx = NULL;
     bool qdev = qdict_get_try_bool(qdict, "qdev", false);
     const char *device = qdict_get_str(qdict, "device");
     const char *command = qdict_get_str(qdict, "command");
@@ -573,20 +575,24 @@ void hmp_qemu_io(Monitor *mon, const QDict *qdict)
     } else {
         blk = blk_by_name(device);
         if (!blk) {
-            BlockDriverState *bs = bdrv_lookup_bs(NULL, device, &err);
-            if (bs) {
-                blk = local_blk = blk_new(bdrv_get_aio_context(bs),
-                                          0, BLK_PERM_ALL);
-                ret = blk_insert_bs(blk, bs, &err);
-                if (ret < 0) {
-                    goto fail;
-                }
-            } else {
+            bs = bdrv_lookup_bs(NULL, device, &err);
+            if (!bs) {
                 goto fail;
             }
         }
     }
 
+    ctx = blk ? blk_get_aio_context(blk) : bdrv_get_aio_context(bs);
+    aio_context_acquire(ctx);
+
+    if (bs) {
+        blk = local_blk = blk_new(bdrv_get_aio_context(bs), 0, BLK_PERM_ALL);
+        ret = blk_insert_bs(blk, bs, &err);
+        if (ret < 0) {
+            goto fail;
+        }
+    }
+
     /*
      * Notably absent: Proper permission management. This is sad, but it seems
      * almost impossible to achieve without changing the semantics and thereby
@@ -616,6 +622,11 @@ void hmp_qemu_io(Monitor *mon, const QDict *qdict)
 
 fail:
     blk_unref(local_blk);
+
+    if (ctx) {
+        aio_context_release(ctx);
+    }
+
     hmp_handle_error(mon, err);
 }
 
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 97611969cb..19149e014d 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -2457,9 +2457,12 @@ static const cmdinfo_t help_cmd = {
     .oneline    = "help for one or all commands",
 };
 
+/*
+ * Called with aio context of blk acquired. Or with qemu_get_aio_context()
+ * context acquired if no blk is NULL.
+ */
 int qemuio_command(BlockBackend *blk, const char *cmd)
 {
-    AioContext *ctx;
     char *input;
     const cmdinfo_t *ct;
     char **v;
@@ -2471,10 +2474,7 @@ int qemuio_command(BlockBackend *blk, const char *cmd)
     if (c) {
         ct = find_command(v[0]);
         if (ct) {
-            ctx = blk ? blk_get_aio_context(blk) : qemu_get_aio_context();
-            aio_context_acquire(ctx);
             ret = command(blk, ct, c, v);
-            aio_context_release(ctx);
         } else {
             fprintf(stderr, "command \"%s\" not found\n", v[0]);
             ret = -EINVAL;
diff --git a/qemu-io.c b/qemu-io.c
index bf902302e9..57f07501df 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -411,6 +411,19 @@ static void prep_fetchline(void *opaque)
     *fetchable= 1;
 }
 
+static int do_qemuio_command(const char *cmd)
+{
+    int ret;
+    AioContext *ctx =
+        qemuio_blk ? blk_get_aio_context(qemuio_blk) : qemu_get_aio_context();
+
+    aio_context_acquire(ctx);
+    ret = qemuio_command(qemuio_blk, cmd);
+    aio_context_release(ctx);
+
+    return ret;
+}
+
 static int command_loop(void)
 {
     int i, fetchable = 0, prompted = 0;
@@ -418,7 +431,7 @@ static int command_loop(void)
     char *input;
 
     for (i = 0; !quit_qemu_io && i < ncmdline; i++) {
-        ret = qemuio_command(qemuio_blk, cmdline[i]);
+        ret = do_qemuio_command(cmdline[i]);
         if (ret < 0) {
             last_error = ret;
         }
@@ -446,7 +459,7 @@ static int command_loop(void)
         if (input == NULL) {
             break;
         }
-        ret = qemuio_command(qemuio_blk, input);
+        ret = do_qemuio_command(input);
         g_free(input);
 
         if (ret < 0) {
-- 
2.29.2


