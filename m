Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7360936670C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 10:34:34 +0200 (CEST)
Received: from localhost ([::1]:41298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ8Jd-0007Fh-IZ
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 04:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZ8Hq-0005oe-C0; Wed, 21 Apr 2021 04:32:42 -0400
Received: from mail-eopbgr20104.outbound.protection.outlook.com
 ([40.107.2.104]:3974 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZ8Ho-0002gV-G7; Wed, 21 Apr 2021 04:32:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vj4HsDPf4DVOHXmS5+vU8PdCg1JhSzldWKTYLQqwMadn/rrkZMEpGGJULxrnuFzGKLVeNTkowZmAaRw+vF/Kl0pN9Zm1XFg4XvwPe1usQ3vODE8sZgOllGZmsczjUY1n9YwjFvBDA6yD1txNbkqB9i8GBaYL8Cg+1bXV0OFVzPROSld93WEmi47k0siSEZ4v4CSmwRZDa5hVxKDXzMsuB6nY0jM8vKBnoAIqDQ6meJtu2yHHWbJ6e1CP4qLta20zEhP/UbI24Qm0KAGAZ/WkXpK5bbv5z4M+gk43Y4aT/BdcrOHTNMspzOEHc+XUqP6bSbA+dkBcE28amh2EFfUUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsDr4q1RYKve5dwnkKtV0QRu3gq122tn4FvGJIxI8VE=;
 b=F7ZFuHEEfBrh2B9EaCjmggCAYqMBlGK0yiGX9FIgBqsc3e3FaXiNU+Ii4xXfZgcTNKsY/7pXVu/WVghH43ue9xahqI/Kz6WGeJznkVZG6xpqsKjnYIEc/5BJnuuBgkXwi79S0W6zpYP28k2sju5SHhSnjl/baO+/dL9Z35z04uwJ0Ty1WeHnHDmB4wyFVEMcYelSK78mpOIrWY69PiWeN8lRYQaLsb0jZ5zbc7RtlUOpCM+Y/MMrzykqZ6b6tBzdifQcg1fCZu2X75tp9bhrshfd0MpL4s3jdQz6h0C6/6bGASAVKFFVLCcvuU2vKMRcFJafYjJpMv+MkYKePBg8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsDr4q1RYKve5dwnkKtV0QRu3gq122tn4FvGJIxI8VE=;
 b=pw7rvam82zZRfyL57PIwlDlIYNwaO7yNYKcDdmOxYmCps+4h/yCwc+5vxNkee1K8kSL+ZKiq6sD0ufT84wRtQGQx/bHgDAgk4aU52VWWGFlIDsix8gNv0jkOdh9jtznUSzjStQud+cAr6fFiGGAZICuyBhC1dNwBRdUwTCRngqg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3896.eurprd08.prod.outlook.com (2603:10a6:20b:83::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 21 Apr
 2021 08:32:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Wed, 21 Apr 2021
 08:32:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH] monitor: hmp_qemu_io: acquire aio contex, fix crash
Date: Wed, 21 Apr 2021 11:32:22 +0300
Message-Id: <20210421083222.72600-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR05CA0167.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR05CA0167.eurprd05.prod.outlook.com (2603:10a6:3:f8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 21 Apr 2021 08:32:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3af41c1a-8ecf-435f-b46c-08d904a0047f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3896:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3896B9458A94DBBD5C991FDAC1479@AM6PR08MB3896.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v7ki927O57gGF4ymuCRKAoU6TgnKR20XybQVaMiDlqrRK3cwDuWrkyueZvSpWBKCbr6/sCyhOObFI/90yxPs5hslR/0zG9iEX1nYheSn8YaYYOV/DPo8BqkM7EpQ+W6txXbf+5s9tUUYzrWc57h64Nxd0sRuGpqcqjm8FI6oQaZUG65H6LOq/nkCdTVv+Arn3CXVt4aUBdoQdKVyVH0/7CXsdpJvJtXp00r2sbreSFgPV3rRgxLkj2qbhY/P9qQGpTiNnEDW/Lwhdj5d47oM0mi8IEN4daOsnYzhrERgI6tBFEiHj79Q2QqTzuLhxaJfyi1O5mjkcu5GnYD/B4jiY3LjaDeATrddXue2CS8cKp6Sq2sqkHhcQCfqZIzmB6EqGUxE6E+/jiJg10i/jm16NDiucYgcT03UVtKf9xjqrUFY512J7j5aqllz1th26qhmSXQ0nb1OZYA000+c0mHWjY1kdE8odATQcGapGHv9A7uT65XrXu03z9b0+nVIcZ6a/Hk/I+q0S8x5pre6+wu9SrLkVhzFrfwJhsMEuM0YOyMGlnnLEsRzpQuljs95h2NVRGSx9//qIJ2XfE0ERLDCET6RKluhM1p7f5j7s3VYjPQQRAXDZmEvOIH/ebLKwt80WeRw3uhoZ1tRfzYRXIuowjIQIMLbvUhuvZhZ+1M0yKsQM5i69H5uyBFJSBWhhj2K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(376002)(366004)(396003)(136003)(1076003)(66946007)(6916009)(478600001)(6666004)(107886003)(4326008)(36756003)(2906002)(8676002)(66476007)(316002)(66556008)(52116002)(86362001)(8936002)(956004)(6506007)(38350700002)(38100700002)(2616005)(6512007)(26005)(5660300002)(186003)(83380400001)(6486002)(16526019)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5LLzjCWw1e4ohMUVNS+tGy8FVOBx+YHnu8netAX6zqAw2Vp1kJtxJbo/eNof?=
 =?us-ascii?Q?J6Nz7e6Gz/JyhEBE0leyMV3VBZGz0UcrOEEulk6HtsuGIKwge7nGyGv7SqIP?=
 =?us-ascii?Q?XFzaFyMAEQbrylpRbhACKcTSo7FqIzIHI09ZN/w18QuMhUCzyFClQCxu1iTe?=
 =?us-ascii?Q?rbtu9rXdBiS6Prkj2dXFj+I1gqrUW8+fs6ojdEFWvGxvMbbgMqYsp8dlwaW6?=
 =?us-ascii?Q?BL1Hc59YxvJT0RCsGU4SPNRtpC/T9ORahaikTfHB6cNQDhlJLAhz93/SI5QW?=
 =?us-ascii?Q?VgV7vtRVQQqFXupN+9UHD9datQKR048g84RpX6ipHwZNLetmCGNKG+4ODtgc?=
 =?us-ascii?Q?HZig2qUQdf45Ob9NY1rf+xMqtd9g+zdf/XiRfTc7g6+sKznbUzl1ey6cHjVt?=
 =?us-ascii?Q?VG0PgRdRD6Obfu/Ffb5Sn3YjSgr12MtwtP8so3WNZ09Grt1l8QW66ITY+m8d?=
 =?us-ascii?Q?ZFDJHboA0tAy0zbOorYwEsrkYXTFf5bsqYlxqQbfW+tWl/dDpzeKluHjBeH/?=
 =?us-ascii?Q?rAf8NUgzrTiY1O66m+h1GHcbpfD9zU8QLHs+oiyqXMDMPIogizb/hNWWYhbZ?=
 =?us-ascii?Q?xKD4aThnC/oEUgH2NHnodJmbDWboTVblEgMgi6I6gWlUgmDYoRh4L1osRN79?=
 =?us-ascii?Q?0IV3rmR6tSMuKVEii8cXhdCqcWU05bbAyGknQCZRFZHZ0WzTlAPIKkrWQF0L?=
 =?us-ascii?Q?kPMjshu9d95+LXA8tqJSnfCz6vF3JT7GhWJJlOf8H7eUS9AtFoUsjvNA3Mwc?=
 =?us-ascii?Q?krLXB1BAAZPxXucREO+mrZNEgd2crHsJNJCaAHMMSzP24VA+yiT+/U9LfTyY?=
 =?us-ascii?Q?gYL+OV4lmrHOfrUPVD43VR6gzll1BzqZeVgSmT24UEmHV0zmAMLK+y3Paqrn?=
 =?us-ascii?Q?QtQm2HutIlnYE0f1Pw6pIQ8evIsxUZzcOTCLbiEj2ooMF64+t3y8p9s3t3s2?=
 =?us-ascii?Q?doBE8zyw+2yxCJqJrdQdU4NP9JJBQDGlPnDOOhzOZkysOfkLSmaj8pOdzABg?=
 =?us-ascii?Q?mn25ms1ekpMgys98yxijJsw5bplsxCbRDzNF0raUU0bnXxOKKe8ZuHVSBJZt?=
 =?us-ascii?Q?ShzHw17trB8Byw8ANXBrmp4HamvhjeX1NZhgfdxQvhZZf6qaYthpjy6BGDM3?=
 =?us-ascii?Q?NG1rOlQORPfl7GEOT0MN5ImqeQbe9Hk5CnQAKYOhCef/+F4r5z9L3XTnAWny?=
 =?us-ascii?Q?4cvGXkg7XZ7myqRw+NQnPiMTpMhC1ePlGO9q1MRmSMQKbUsBViKwQu/eWjXM?=
 =?us-ascii?Q?AegQfNm8SfEPoF6PJmq1DNpBLXLTibqjT29FyrtBqkFKxfvJFQLyHf6tJ083?=
 =?us-ascii?Q?8cTZOcAjOh9XePOfVR6HBTq3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af41c1a-8ecf-435f-b46c-08d904a0047f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 08:32:36.8313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hskPOt88p3FaFw1dwA6qq5MC5+G4zRe8dd4FdPnEPEXuphHlE4pJCkHNYCoVhAVhlidHkY4GQynzFu6O4omWFSOf+jgp8zmdI/aCvVWwnKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3896
Received-SPF: pass client-ip=40.107.2.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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
around blk_unref as well. Let's do it.

Reported-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/monitor/block-hmp-cmds.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index ebf1033f31..934100d0eb 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -559,6 +559,7 @@ void hmp_qemu_io(Monitor *mon, const QDict *qdict)
 {
     BlockBackend *blk;
     BlockBackend *local_blk = NULL;
+    AioContext *ctx;
     bool qdev = qdict_get_try_bool(qdict, "qdev", false);
     const char *device = qdict_get_str(qdict, "device");
     const char *command = qdict_get_str(qdict, "command");
@@ -615,7 +616,13 @@ void hmp_qemu_io(Monitor *mon, const QDict *qdict)
     qemuio_command(blk, command);
 
 fail:
+    ctx = blk_get_aio_context(blk);
+    aio_context_acquire(ctx);
+
     blk_unref(local_blk);
+
+    aio_context_release(ctx);
+
     hmp_handle_error(mon, err);
 }
 
-- 
2.29.2


