Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1F6341992
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:11:03 +0100 (CET)
Received: from localhost ([::1]:37536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNC5u-0006ZH-H4
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lNC3Y-00056r-Jh; Fri, 19 Mar 2021 06:08:36 -0400
Received: from mail-db8eur05on2125.outbound.protection.outlook.com
 ([40.107.20.125]:53216 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lNC3W-0005Ve-Nz; Fri, 19 Mar 2021 06:08:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nU8/YHr/TXNAPuCoNz5EMW+8CV+aJVq2NubolC9z7vJzpreX7r15DIZHfBHdawSD5JXogV9U9U3jS+9cIk3FW61Kucwtgz+RYD+Q9j+mJWMvqCuN+lvHNLdqC1gob/zIxJhaSVjjkincOwkdePbN6IQr7yPZ04CAvPXInBqnGCxR0YPSxo4YsMwLM8JOmlIxNaWprHNI5Fo8iyXLulFJUEVYRJavIHTSVmghI8pEXRVeGst/hnfK9WLYJKsaIWOJI0grRbquQpesKGTxhQorCDDPgR+Z+N8FmFpVmGgdZSx7f0avpYQJyLJAAOLi7w52NdcuCU/8hlyfHjat0oEw7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqyq/wzrWvPl3Y8oX+bTp4PhAiv+/b/Ay3++YaCl4A8=;
 b=JNQt/NjcPwZsr+9Q3j47TMEGQ5pXm1J0gifRtZdmRMOnkQhgNulshUmhlbNoVbr20GeapfLEabEPshJL8VsLLwWaEFM2WGXf+ZvxRaaOHv/Brb26ToB/hA3MzqL3l+n/hy9er9HnDziS4BOd8zQfOdbnxf2o/3wplN84xZdrkNUy42ewQVwNG/aXFsNjhuJFdme3PXlhcxTJSmG7WR0gEgY/zjEMzDxj/RI72nE/LeSoMJLExuxFsOvItv7As9E8XHK3sBIrCWnn3zpCUV7ufZjgICq/rDiiEHjrlatkSbWSB0ob+hr+wRnttrEbdADK3uaiNj1C7YunZLCxpdiNJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqyq/wzrWvPl3Y8oX+bTp4PhAiv+/b/Ay3++YaCl4A8=;
 b=HkHPG6nV9SUllhavV/zzctcsOHoJkZBLZUenfNVhApUl4Wkj81V3MUEZB3c/qVInaXxAbzEBScKxNBLrIdYD/kKMrrkXJH0K70TqWWV0PzWUJLismoubb2TVcmPDYa87iSRa7JJR7TeDcSZxCDt1nnF9+lbB76/l6pR80NDaDFY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3720.eurprd08.prod.outlook.com (2603:10a6:20b:8f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 10:08:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 10:08:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v4 1/3] qemu-io: add aio_discard
Date: Fri, 19 Mar 2021 13:08:09 +0300
Message-Id: <20210319100811.342464-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319100811.342464-1-vsementsov@virtuozzo.com>
References: <20210319100811.342464-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR01CA0082.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 AM0PR01CA0082.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Fri, 19 Mar 2021 10:08:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f28bde9e-3ebc-475d-83ef-08d8eabef087
X-MS-TrafficTypeDiagnostic: AM6PR08MB3720:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB372079B10A7E09565A289A9EC1689@AM6PR08MB3720.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oTJ/muLfNFiKyXKaNS4eJ03kmcJ/i0MPMMKgNpjoZWuxrvvwNKQuaDm8RvVqUkfWksa+/S6TzbsP7Pq/pZMgqfs+H+kyGsYnokklGJ6ldtB8L4Q/UEgwmGza8E4rpbPRiTIxrZa0U2EDNX1yB4Kd9RDIBzaga69t9M+FQgqKrtMx+/1U+SpkC6N0se94VAT0Qut/boYuZ4OxiezrlHIlueB4eGVNC4T+bIDQH6AAHWNsOTORmmlM4h4/XJHoS02PBdgAoXKUUCypCcYtZoiMq+tMDcuTxl1TcCIumKy52+1ixGPILBooAd3Mk4I0OwX71wIM2MuR2EPcjn1zfBMb3whS8bR53sI3peytLJIe3Aw4QDvK/iejW/DsBw8eaWey2jBE7PXdoeUGwYwM+rQTmBaLk52V/ZdB/y266PYH48beivAUKZujnYMeEMB4CqmxkRE3AqkdFCMOCPp5FlGwfrvrBkGQgbvZDyXzHDbEZ19denUbmvoFZ+LeclNaJbEe1lDvNN0WWGDKABj64nsZQ3Fs720N1HpOUyyqMTNt+Gk1dHyElWx2fudACL4l8ZHHYAyDa+GulEgZt0ktugdZ5932wJFseun2dWeOlz1KrCpPThrLPMHh4oqZBf6+9cuOJ+NlSmDihWO4AO80whjlEzyyCrodAq1Q6U6qR7b2YqYexm1GPRFdjRdtgz86Gtsg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(39840400004)(346002)(136003)(186003)(956004)(69590400012)(2616005)(83380400001)(16526019)(107886003)(66556008)(6506007)(38100700001)(66946007)(316002)(2906002)(86362001)(6512007)(5660300002)(8936002)(1076003)(6916009)(8676002)(36756003)(6666004)(478600001)(26005)(4326008)(66476007)(6486002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ovp0NZJEpONnfIDjonp+Mcqu8i/lf2n3cCJoAEhuoeLB6fZrKkjTu3/bvuG6?=
 =?us-ascii?Q?QLhA0EYaX0XqbWwtU/blQy8xxPpdjovPX3ODHeYEo6DKrrYleH+0bQBuQ1ni?=
 =?us-ascii?Q?WTbo/xWskCAY7+CuqveBSZlObTG9xALrUQzA0W7Y1spgbChtiNBv/3siRHsJ?=
 =?us-ascii?Q?2MzDQECYPLluvfQ05cSsS+aKvavSmdBx6xn4WiA18JJG+GGSb8hFk8tYq0Fu?=
 =?us-ascii?Q?uFV6mry70mXl75e0F2w2U2nQxio3WKmQfM7aYynOOk8eN1oMXdQQHGu85ja8?=
 =?us-ascii?Q?J4aUmjMDnhjxYUfgpQ2XXF0J/VEjsttPbmnRZM0PrFrMuhmkHzEgJ5uAeSpk?=
 =?us-ascii?Q?eOM8CJHZPQkLGdjijUkSEUDQGPqBxMNmH6JzZ8jlPt2huAI8TxRNcHj1E8Wt?=
 =?us-ascii?Q?GZfR/AOFxWW02p2X1l7yvJFiMCq9esXferWoZgjVis0i4gnaZPercMiOIfYp?=
 =?us-ascii?Q?+WHUnU3V4Y6e85o9H2hgl0cQA1PCPnrsdEPX2RFu/Y8rDt1OI9BZBqZEp1r1?=
 =?us-ascii?Q?RYVEpENZ4c5MSAD0o4w5HxJGTqkvAXTguOLpp5t4WB5CDUTPdaL34WqxIoPz?=
 =?us-ascii?Q?e1KJNpoIFCpD7RsgPST+yK08+MNm99IKEP2Zx+ySCYx7EW1YU4r6BCIMrnm/?=
 =?us-ascii?Q?nwVVwVzOoUYFBMXxXthMzZcdxgwIbotEJXd3laeeHU0LLVK3uTXvfr8VP5ES?=
 =?us-ascii?Q?dLxPWaXbZDwkV6xfAfPc0S7jX3OdcBm31q8FCjpFu20bnWBqzelJmaxU3yXt?=
 =?us-ascii?Q?JTjD+v35U5QvSHXhE9yQr/OGPNE1nsg7UxADNqmmeKBHJWLaznYBJdqwPa/E?=
 =?us-ascii?Q?xtLrkeTZyHM+BMAhaYa+TDvPDpnS9i7kVVY0z/JJJmdrJcuoD7RAp9ybCXXx?=
 =?us-ascii?Q?F79qp+65D8fbXxRXsx85ifGyOlA8YI36yr2sLg8kJ3t3dY43SyDvytOpo3PR?=
 =?us-ascii?Q?QdjlbMHSmX1Hj6gdUUSxNWD9xx1u88buJwl82V7/OJCd2T73vNGzL5kuFLp1?=
 =?us-ascii?Q?X8x0Xp92OuQHyWiAoX+wEK52ENzYc8WPWm+uLgPKGJGPBj7AiulkWLLu1Pa2?=
 =?us-ascii?Q?grRDH/39dFbWSPVcVVrpjJDuCUcFExV8vinnlz2YRufYlU3+siPyTAM4xjsj?=
 =?us-ascii?Q?0P6C/H1+7SPKm6QUp6UKEthROaZN/RmNAYOYF2cEnpWWwwoed6K+fNhumkEq?=
 =?us-ascii?Q?DbAGbqKvo2Lf7ZUhA5wr5T+nCGfZ1FsOzQgCISpFgFgPP9d+8sEtSrfiyjGT?=
 =?us-ascii?Q?lSDND5ag8SDtGuLAGSJ+uuTqnM+7L5LHvcceP/GVnoH5T2TDemq4d0vox3Fa?=
 =?us-ascii?Q?vwP2T1Wgbzvoc3O5jbdb1QG7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f28bde9e-3ebc-475d-83ef-08d8eabef087
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 10:08:27.9216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmUxH31PENI1YBaYdS+YYiz9Gmvn56XI8cpPSx+DfOfy8u0xsq9A7gTrz+Kv8wrf6qXyVoeQdjciqzNslgBXOEMI34z1k0xHVlC0AxSmiUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3720
Received-SPF: pass client-ip=40.107.20.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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


