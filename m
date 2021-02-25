Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0749D324F83
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:53:56 +0100 (CET)
Received: from localhost ([::1]:59980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFFDO-0001A2-W5
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFFC6-0008Ac-M3; Thu, 25 Feb 2021 06:52:34 -0500
Received: from mail-eopbgr30137.outbound.protection.outlook.com
 ([40.107.3.137]:1858 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFFC4-0006sd-SJ; Thu, 25 Feb 2021 06:52:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7Php+SN+SYvAfvhWmf6zkKjhixuh0OQvDqY5qqLD+NQlk0/TRP5qABVJzKkfh/uYC2TSGoh+fyW/pBJ6jJqZhAQZF5cwdt/yyGX4Sox7pxRdird7zcSXauxQjT1A3vO/lLwUfP5avJ91lRWxwCvywYbyKbcXW7Vz29lc/eFbzozCQPBU4GA8uPMvw0oevlautdK87I+c+mex/TOE6qVBhrbAaTKAeWs0F4lsBDKv8jZIaxdjirPdxYkuLKnbT68QimTdkWZBKgxLBr7Sx0LATpM05R4L5C6J49KTOHmoQxrH4dfzCkHVlfoNI5bOFnTpwKIw4ks5OfxaYiEDUUqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqyq/wzrWvPl3Y8oX+bTp4PhAiv+/b/Ay3++YaCl4A8=;
 b=Kq9q2xUxXmW9IAwGUYwyRYiq9yO/fm2rQ9I2CmCBKMVzi9hchYfNjRqCdxk2YWX2os3P++FYJBRgWkHkv5yp62ZRMN+BemsdYgnVKhpPIBHPS6nJ/+8oySYVv62CQUczQDj/bmVGRmCsskgyvni1aeNJFp4dqHZYJfeDwBumdtPth9SFsEcWO9FPN2dYkgHjz53lw82yR9C13UGVuxNd4lQoOg1nBLsqI4d/BbMaIftU/Px1z78R/iGY3goavLC+N6bonrW1jQ2hnc+/GXQvt8V4GKWVQgqpzwobFZKDtqW3M2PZmiHNuHk06JX/Sppgmcd5/weW/dncpTkaZu6v1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqyq/wzrWvPl3Y8oX+bTp4PhAiv+/b/Ay3++YaCl4A8=;
 b=Fr4DIw25y0ydLNYbLPYjIZmOt3xLj8utNrjzFCL4OVM3XW2FxXx0Kkw2XU/2EYBUjOAONyvXLouRTDvLN0lXkvhAev158heltWEGFLYxU4MlPeRbFxNGU4ZoG7IkheG64Tc/xLTl4E9BQEcd0w3mxG0yJpwOKTAtpBo/XDl6M9Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6008.eurprd08.prod.outlook.com (2603:10a6:20b:29d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 25 Feb
 2021 11:52:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 11:52:21 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v2 1/3] qemu-io: add aio_discard
Date: Thu, 25 Feb 2021 14:52:03 +0300
Message-Id: <20210225115205.249923-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210225115205.249923-1-vsementsov@virtuozzo.com>
References: <20210225115205.249923-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR09CA0074.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.253) by
 HE1PR09CA0074.eurprd09.prod.outlook.com (2603:10a6:7:3d::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 11:52:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12590a19-a567-4157-07b7-08d8d983cee9
X-MS-TrafficTypeDiagnostic: AS8PR08MB6008:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6008868B36A7B5306319A5B9C19E9@AS8PR08MB6008.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +wasHa47gG839K/8o83zEkHNUXeNKefQgqNJ33nFumq3ITozK5znjpVoMBDubuABWIk5NN+xbLsC3evAJ5u3whMoVP2dSGPVXSWSr08UngSeW5kfisk8xMJlX6zSwhaMt1OqbBqATocbs/k3HHPg7aXVv0iSnwTFV/VsAV7W/eJIUsAieJrtE/KOEQ3rH7FG0mY5Eb7Z3nctU/1l7jhR2XFw8tfsMI1BDAA3xLbc0grZj1/3RnP4R/xs59XbVq61iGXAIiyympkpk/NMQ5nRTRUFmAWH+oF5qxOLirvr09i/f3/NFeHWxDBUIq7gSvyZQ07i6E11mdhXkuRytSOHOTbqkvWE4svbltd7i6/ccvvV0ZdyqEktyHePj2lc2CUlOqHFac8JdQbBoZE0FRo2Hlerz29zeb1+sfD9e7PDf2IAU2pg4gdV9yWqUK7IzOup45etrwUmtw8svKg+aCP5x3S0dYYaYryBOOLqgwXvZivGE474PdSXsddoohMbTpu9VeEMvJCA1js8KDHFzIbV8cplxFvanrbTVBmSZ1Tl92fbSAaAHd60g5HByiwRgWKWe7NE9kiQm0Qle36CPyZaEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39840400004)(346002)(83380400001)(36756003)(186003)(8676002)(16526019)(6666004)(478600001)(1076003)(5660300002)(69590400012)(86362001)(4326008)(6486002)(52116002)(6506007)(66556008)(107886003)(26005)(6512007)(956004)(8936002)(316002)(2616005)(6916009)(2906002)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?csgJm+uar3VCt89TNC+PjcU0pmCqn5QKVzqsI3BJeDRONBopTuKs02c0g3jg?=
 =?us-ascii?Q?VYN02SNSsk076/RZzk0dFVW3/nbpJWtQgJD0m7kXH7mAankULgi7UIe3q/R1?=
 =?us-ascii?Q?27KApDt2Dyy8NZNhakJ2tcZJbjFu2g4+sKqKoYhKn1sn32Hp1wgdD7WjR4nX?=
 =?us-ascii?Q?gTkNgcgm9z7luJwEBqjE2GioKHaTIj8FCEb8KzDmeWabTkEPWxnmePNy+GxZ?=
 =?us-ascii?Q?dHaySwyk+b9MiXp8opFYu7kvUAu2ayJRCxx/wH+eO1pbOs21DP0JzST2xB0Y?=
 =?us-ascii?Q?8K2rguS4zCqV9Pwojbv66wdiLN9jYaMpbDqchckzltwnh4KiwEFMWmv6GATm?=
 =?us-ascii?Q?fDL8ZjV345nTPwbyxQatCyHnxnN9L0G/+4QQkuozBlFpBusGy8nQqHjpoif2?=
 =?us-ascii?Q?AyTfHhEpvhzUueOTiBpwdidSI+g6l3eCGpyPGTlJiCAqWWj8z1YuL10DuX8M?=
 =?us-ascii?Q?QCr/CbpnddNbFkGtkyic3LrYf9EBk04ZIgCiVJr1GM0I0K8Ck3Oa0FqdVOZm?=
 =?us-ascii?Q?MT7yLTb2uClAlHUXE/b6YId47hEg1t+3zrmED5IS9agPMSaUrFrwl0eBZhzN?=
 =?us-ascii?Q?pCbcNwePHXcploZqu7/sIowxFTT2WqLa+b+RFzs/KitMauA05sCY2lp/qoA9?=
 =?us-ascii?Q?aIhycGYMfZl1/+i6Uz4Qt4nt6QBbR8NSZDxaMNLCmIvuswxCwGbw87I9bHo/?=
 =?us-ascii?Q?rcjxn0BDL1sJjVsSnVITH24DuPa6dOG6At/eDCUBj7gesVhUiQ8QUBY8tAiV?=
 =?us-ascii?Q?zXdh4+v1ByrZoN4CmMJC1DNTTTHRjRePbgddFbyP9yWGYrWZet2qwU1CEySJ?=
 =?us-ascii?Q?JVMvTxNYEGejkIpOR6GMukNpXqm6tNvkFNjdgP3F7tepYAGvATBoqhD69gMh?=
 =?us-ascii?Q?/SL5eDXwD+cSGfvO6hLrrvdxHJDHENvIAaU7n82LLkGB5pXpsjSwHc67GzzY?=
 =?us-ascii?Q?41nQ/X057SBesmekIxg0aMq39VYFnxiwqw2m5GyQQCznqi1NmkL5RYfer+tc?=
 =?us-ascii?Q?FXbkvk6pOeNKkJLrYjaOKnwFVvthLvgMAbt4cZsJf84i4i5NRUotbHElHhgr?=
 =?us-ascii?Q?aog2qDMzQaoqA/Y3BZt+Ib7Uto9xiVE2+A2qkluur11LbLcOwVuw6YKRmRsB?=
 =?us-ascii?Q?IVOAEu7Gr9wh32vcuMRLIG69b7/mGvwkFXWLFlHSTQoxEYygdfs968CdpjDp?=
 =?us-ascii?Q?bI5obIKNBLPa8hh81dGtI+6FD+I2a8L4OQnvlVBpgqFQJ5hAbSYY+uAM/taH?=
 =?us-ascii?Q?kFyqBOLSFyCWZxB5TORzUhwcyvbi5KBe/HMlzBF+7UczGPbcCjIUZH5WD9Rm?=
 =?us-ascii?Q?ANBiDYZIXCxEp+dZE1Ec/68R?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12590a19-a567-4157-07b7-08d8d983cee9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 11:52:20.9959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVn70magChngKe9adjTFlf+bnxGJmlz6ksm3FHZP4BFbljbm+KfG8UcmnAAqTRtCPv88jbAFW5SfNL+2jBV/XDii5/wzd+6ueGbktO+InoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6008
Received-SPF: pass client-ip=40.107.3.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

Add aio_discard command like existing aio_write. It will be used in
further test.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qemu-io-cmds.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 97611969cb..28b5c3c092 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1332,6 +1332,7 @@ struct aio_ctx {
     BlockBackend *blk;
     QEMUIOVector qiov;
     int64_t offset;
+    int64_t discard_bytes;
     char *buf;
     bool qflag;
     bool vflag;
@@ -1343,6 +1344,34 @@ struct aio_ctx {
     struct timespec t1;
 };
 
+static void aio_discard_done(void *opaque, int ret)
+{
+    struct aio_ctx *ctx = opaque;
+    struct timespec t2;
+
+    clock_gettime(CLOCK_MONOTONIC, &t2);
+
+
+    if (ret < 0) {
+        printf("aio_discard failed: %s\n", strerror(-ret));
+        block_acct_failed(blk_get_stats(ctx->blk), &ctx->acct);
+        goto out;
+    }
+
+    block_acct_done(blk_get_stats(ctx->blk), &ctx->acct);
+
+    if (ctx->qflag) {
+        goto out;
+    }
+
+    /* Finally, report back -- -C gives a parsable format */
+    t2 = tsub(t2, ctx->t1);
+    print_report("discarded", &t2, ctx->offset, ctx->discard_bytes,
+                 ctx->discard_bytes, 1, ctx->Cflag);
+out:
+    g_free(ctx);
+}
+
 static void aio_write_done(void *opaque, int ret)
 {
     struct aio_ctx *ctx = opaque;
@@ -1671,6 +1700,93 @@ static int aio_write_f(BlockBackend *blk, int argc, char **argv)
     return 0;
 }
 
+static void aio_discard_help(void)
+{
+    printf(
+"\n"
+" asynchronously discards a range of bytes from the given offset\n"
+"\n"
+" Example:\n"
+" 'aio_discard 0 64k' - discards 64K at start of a disk\n"
+"\n"
+" Note that due to its asynchronous nature, this command will be\n"
+" considered successful once the request is submitted, independently\n"
+" of potential I/O errors or pattern mismatches.\n"
+" -C, -- report statistics in a machine parsable format\n"
+" -i, -- treat request as invalid, for exercising stats\n"
+" -q, -- quiet mode, do not show I/O statistics\n"
+"\n");
+}
+
+static int aio_discard_f(BlockBackend *blk, int argc, char **argv);
+
+static const cmdinfo_t aio_discard_cmd = {
+    .name       = "aio_discard",
+    .cfunc      = aio_discard_f,
+    .perm       = BLK_PERM_WRITE,
+    .argmin     = 2,
+    .argmax     = -1,
+    .args       = "[-Ciq] off len",
+    .oneline    = "asynchronously discards a number of bytes",
+    .help       = aio_discard_help,
+};
+
+static int aio_discard_f(BlockBackend *blk, int argc, char **argv)
+{
+    int ret;
+    int c;
+    struct aio_ctx *ctx = g_new0(struct aio_ctx, 1);
+
+    ctx->blk = blk;
+    while ((c = getopt(argc, argv, "Ciq")) != -1) {
+        switch (c) {
+        case 'C':
+            ctx->Cflag = true;
+            break;
+        case 'q':
+            ctx->qflag = true;
+            break;
+        case 'i':
+            printf("injecting invalid discard request\n");
+            block_acct_invalid(blk_get_stats(blk), BLOCK_ACCT_UNMAP);
+            g_free(ctx);
+            return 0;
+        default:
+            g_free(ctx);
+            qemuio_command_usage(&aio_write_cmd);
+            return -EINVAL;
+        }
+    }
+
+    if (optind != argc - 2) {
+        g_free(ctx);
+        qemuio_command_usage(&aio_write_cmd);
+        return -EINVAL;
+    }
+
+    ctx->offset = cvtnum(argv[optind]);
+    if (ctx->offset < 0) {
+        ret = ctx->offset;
+        print_cvtnum_err(ret, argv[optind]);
+        g_free(ctx);
+        return ret;
+    }
+    optind++;
+
+    ctx->discard_bytes = cvtnum(argv[optind]);
+    if (ctx->discard_bytes < 0) {
+        ret = ctx->discard_bytes;
+        print_cvtnum_err(ret, argv[optind]);
+        g_free(ctx);
+        return ret;
+    }
+
+    blk_aio_pdiscard(blk, ctx->offset, ctx->discard_bytes,
+                     aio_discard_done, ctx);
+
+    return 0;
+}
+
 static int aio_flush_f(BlockBackend *blk, int argc, char **argv)
 {
     BlockAcctCookie cookie;
@@ -2494,6 +2610,7 @@ static void __attribute((constructor)) init_qemuio_commands(void)
     qemuio_add_command(&readv_cmd);
     qemuio_add_command(&write_cmd);
     qemuio_add_command(&writev_cmd);
+    qemuio_add_command(&aio_discard_cmd);
     qemuio_add_command(&aio_read_cmd);
     qemuio_add_command(&aio_write_cmd);
     qemuio_add_command(&aio_flush_cmd);
-- 
2.29.2


