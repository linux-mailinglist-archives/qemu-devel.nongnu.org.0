Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FD5435ED4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:16:48 +0200 (CEST)
Received: from localhost ([::1]:33038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdV7v-0004HQ-GN
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mdV4J-0001Vb-Dt; Thu, 21 Oct 2021 06:13:03 -0400
Received: from mail-vi1eur05on2114.outbound.protection.outlook.com
 ([40.107.21.114]:9813 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mdV4F-0004tm-SO; Thu, 21 Oct 2021 06:13:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFcovhiWGn0pPpVvzFiA2BIRi0n1ZNtdoUy2W9aEq7urw10sXTGaQb8+G6Z6rxUqp5wZ0cDIDAMaODCSVmy0O1HKGUPzW62CHGQft5vQRqkkO1KmMD/kSs0xhTBRFe2KX2vwVPVmBBCzZCkWRbNDYLsMKwfjxEIVF2jiQcRENsOOQqJMWPiAIa/OAffoEuh1ASTFNIi4s8x8ZOzMvJYlOoDXmP5d08GSdJBcvoZltZvPNswX3yZCy5TN/F/g1Z9NsKr8cipuWcmNa+I1CyaEX4rM1u/u4OcuBhV+VTPO5EjmjU8/AP5zkvi2w7IgjElRZTyxsUwyNcAI2fTUVMk0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1KLHZhV92FRiTJVkQ3xdUvIyFmNYqYc9d3pcNE1WIU=;
 b=NZH/59Nabkl34vKOL21A8yVkDkD1ap6IxV/mZOcc0Zy2P+V+fOip/8G0JfmrfevBFWFIWl/gBwbaumuovEuKN0Lu9U0ivZA3D6xgCvBlOPaOxPwTypxRatvNih6QMjICN6OD8JdTzhFGYER5I57Euc+W2LG4UOx/WMhBZ8TDBJfTMV76ju6GNUWpCdk3K6zpDpJ9fqtV6e2LdD66wKQixeP4LMfqklaSY9gbwGOLatkAXxngK8zdSWIEoiVd1nptV+oV0Kyw00/HOYlIPdRZLEl2EtDv8jqKZMVAeWk7hjQPLC5qpd4ytDH7utLXUM53TXWRUWQzHBQyceidDc+4HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1KLHZhV92FRiTJVkQ3xdUvIyFmNYqYc9d3pcNE1WIU=;
 b=tHZIuyuo0RWlOBZ6TwdpjUWi5m3b05ZJIjd0k/O7BM1a1KlX3Kn2Ms4ACMkHViAVToroxSqlUOawUrd9HYHraUWPJ9yFBJgjKM+AEz5VdGMhGzQQEfmj9JyUWMAd+ssXPrQwoAirUVH/MeqWtfrPF514gF0DZxVK0PZLJfXGmYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 21 Oct
 2021 10:12:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%4]) with mapi id 15.20.4608.018; Thu, 21 Oct 2021
 10:12:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 nsoffer@redhat.com, eblake@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nikita.lapshin@virtuozzo.com
Subject: [PATCH v2 1/4] qemu-img: implement compare --stat
Date: Thu, 21 Oct 2021 12:12:33 +0200
Message-Id: <20211021101236.1144824-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021101236.1144824-1-vsementsov@virtuozzo.com>
References: <20211021101236.1144824-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR04CA0080.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS8PR04CA0080.eurprd04.prod.outlook.com (2603:10a6:20b:313::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Thu, 21 Oct 2021 10:12:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d783e66-3639-438d-0fde-08d9947b54d1
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-Microsoft-Antispam-PRVS: <AM6PR08MB507841678B211A51ED6D9464C1BF9@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:134;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U8L/6yFPS63+ZIVCF71QRTfGu7ITaldos8YAakfOu+/1gtdDSPbr5OOAhl4WCeb1C+n1LobUhnQFvFPGvPo344y/a4rIGQ6zNmOnuM2NebPO401KAo9MUNvlrMydSzkC//Sa26h1bbdf6WMPousurXckv8DmOxNbOzHjCiOymy5Zc1Ejv4pnqhPC8ueawnNQhZOctaxDBSxHy1WsgqlXRp7Zot44AdFr/GsJHbplVz0EdYt4He5IJ3TQHJt+ENPW3xxhyco3ZM8XiNy5siDUUvladhEJqJhB+/oV6PkeilI7hlIKLpickKP2mu5Pu3Q4Auv2fal17iWhNy3jIf1HmiD1AVXEYgtSYfAWt1ZNmfJADIZZ4AQX9ThgZ6aspIEmo1CtqOyyoWyxjLLxf9KzS8veEQJcAGe5OabzRGNoZcr5rscrIpF6L75QrjR/vi1INhSuz+oZ+MZDCYX/vIYuzlglK/+2AfDEhsqtG/jnCo4lhwYR6BFB36Ifavnm6H8rNMVrLblOoMQgFNgAZdZ7ZgS7l6Z6HCENSuVcbVoopol+tVNt9A3N6rFYE/fvfbCfVq8ZTY3jZ9vrq+s9e3wgTO6zpt4YpuWsyAndZEyorNM9lD60dDLnP7sp6HSxRtdNvB0wcNvlYJbwcTdYGMbt2dBdvpFrMpQJzCsTVZveMa1gmNZ+0YBUd2VpDPoGQCAVVjNZCillPp6gq9IJ1cWbzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(107886003)(956004)(66556008)(508600001)(83380400001)(66476007)(6486002)(66946007)(4326008)(86362001)(6512007)(6666004)(6506007)(52116002)(36756003)(316002)(5660300002)(8676002)(40140700001)(186003)(38100700002)(1076003)(2616005)(26005)(38350700002)(6916009)(2906002)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A1BksmoQSrqfoqQJNywP3naGsH2GiqZ9ZPOIwKO13zDdqoT4U3f664GVitZh?=
 =?us-ascii?Q?4XtkFzldp7ZMsoLlvwWSwSmxln4+1fjB70RcbYZ/z0jL6uPRokRxu6iw1wUU?=
 =?us-ascii?Q?grhNf8h6Uxy3aehzAJOzk4F7JMHD1HyolCDSpf2TN+DBRA9nwEao7KgEGwb0?=
 =?us-ascii?Q?pBGzZhsUlvNuC1UAqD06KwT6N/Kn68hEfij6MLdK86EXEyCIutTqgUH84ywt?=
 =?us-ascii?Q?2NgHryJZdHfRNDez+jUVth8U2nx6EEWD6IgquF9sJx93rj8k8MAjDfuVKECu?=
 =?us-ascii?Q?sGGyRmDJKyxF/ndC6vBxagCFLJP8PJgfL0rd9+5p9sW4kunCiUFEw86L801B?=
 =?us-ascii?Q?RR1cF0crFxoUyTSPc1mcnAaOZaeL38ySlPT7QVCCq//LSnMMOoFIZ3rh1IUU?=
 =?us-ascii?Q?Q3fIiCDepModx9L1UKd4Xk/zhoCdEt10cHyFYCvfTmdc8gMma/AihRLCObue?=
 =?us-ascii?Q?DKq/5uQpWrB3cmSZ9QtKurN9W9/gg5q2VXB9pKoSZZq21eBLC2s/SmeFwt+6?=
 =?us-ascii?Q?hWhwr02pzvdzo8E9A63jlHHS4W5nnujUIZOJGrYISvZzZ6oUOVi3kiIU3ilX?=
 =?us-ascii?Q?LUdJV07YsKf3ix+v+83HLJkf1KX2rGl+05Cs7c7HG9Bljb7vgg8FNKfHzI4T?=
 =?us-ascii?Q?nlCn4pqwYmSApJ68B2X320UAscjFfltnn/XpeRExGQe7XopSdQ/B5FCnukOM?=
 =?us-ascii?Q?rQJnz7DyXmpm+SmHn6xJIOQ23qVlnoVXnpBjc+k5axUE3xru3bPIsSZ0S7LH?=
 =?us-ascii?Q?EAlJkIj0m99TUFQ5F9AX6e5LTerJETqHccj6w9IAsxUfOfkd7XL4O2Cwq/TQ?=
 =?us-ascii?Q?2EJEdpcLVmtDD3kSHkJszxKvVwsg4cT5SAI8dTWVWrKl2Zi2vD3lAmadUEhs?=
 =?us-ascii?Q?TWFVttJsIQPx5OYpQJ0p3tz8IV7ho0J8YO5S2pfgvZ6GGYhbHAE2vtFDfv3+?=
 =?us-ascii?Q?MLutK7Jim9rp9S74y7xBIPKHOUkqWRyCIA58wHNNjzjXcghrldfOny2ZKAYO?=
 =?us-ascii?Q?a+76Cdd5LxOTgZCYbKKq+8vg++4picrs3hyEzG4ISnw5ABD8q+iRHrnM561q?=
 =?us-ascii?Q?OSBg9qI/ayTiiygAERiGBEXeeWJtMpKHYzgqnM/8C0e1rFcpYM5SB2/8uRq5?=
 =?us-ascii?Q?dT53XU/qmAUvmusCCvQaO5hxneXzvrahwJcr0B0/jC2YJlXmhB1eVlJBvo1y?=
 =?us-ascii?Q?ORnWpNIDOobGvLZoQp6/YR8kvK77mXiS+Nf1OBy6QpBBFf1B2YJ0N4FppbSJ?=
 =?us-ascii?Q?g7RGUTLIHenxRgPnMD5fmf/iFpi9YKp8IlHWBz2YJ0tInAmMt8HQ3cytXEI2?=
 =?us-ascii?Q?VNu/e+eSZveGNn6LQEgvi+FTKYVKkeiAn1JAe6CbTrAdyUUnd7Aztm7xCZ8r?=
 =?us-ascii?Q?/ZyMZpVlpQJ3otrToHz8M951nWh78+Gbbj7WYfMUktxoxmxerE9HkiNpPDwD?=
 =?us-ascii?Q?JTrhRVS6czNnSotX/D+O8ZwTve1WBXNo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d783e66-3639-438d-0fde-08d9947b54d1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 10:12:47.5875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsementsov@virtuozzo.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.21.114;
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

With new option qemu-img compare will not stop at first mismatch, but
instead calculate statistics: how many clusters with different data,
how many clusters with equal data, how many clusters were unallocated
but become data and so on.

We compare images chunk by chunk. Chunk size depends on what
block_status returns for both images. It may return less than cluster
(remember about qcow2 subclusters), it may return more than cluster (if
several consecutive clusters share same status). Finally images may
have different cluster sizes. This all leads to ambiguity in how to
finally compare the data.

What we can say for sure is that, when we compare two qcow2 images with
same cluster size, we should compare clusters with data separately.
Otherwise, if we for example compare 10 consecutive clusters of data
where only one byte differs we'll report 10 different clusters.
Expected result in this case is 1 different cluster and 9 equal ones.

So, to serve this case and just to have some defined rule let's do the
following:

1. Select some block-size for compare procedure. In this commit it must
   be specified by user, next commit will add some automatic logic and
   make --block-size optional.

2. Go chunk-by-chunk using block_status as we do now with only one
   differency:
   If block_status() returns DATA region that intersects block-size
   aligned boundary, crop this region at this boundary.

This way it's still possible to compare less than cluster and report
subcluster-level accuracy, but we newer compare more than one cluster
of data.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/tools/qemu-img.rst |  18 +++-
 qemu-img.c              | 206 +++++++++++++++++++++++++++++++++++++---
 qemu-img-cmds.hx        |   4 +-
 3 files changed, 212 insertions(+), 16 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index d58980aef8..21164253d4 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -159,6 +159,18 @@ Parameters to compare subcommand:
 
   Strict mode - fail on different image size or sector allocation
 
+.. option:: --stat
+
+  Instead of exit on first mismatch compare the whole images and print
+  statistics on amount of different pairs of clusters, based on their
+  block-status and are they equal or not.
+
+.. option:: --block-size BLOCK_SIZE
+
+  Block size for comparing with ``--stat``. This doesn't guarantee exact
+  size of comparing chunks, but that guarantee that data chunks being
+  compared will never cross aligned block-size boundary.
+
 Parameters to convert subcommand:
 
 .. program:: qemu-img-convert
@@ -378,7 +390,7 @@ Command description:
 
   The rate limit for the commit process is specified by ``-r``.
 
-.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] FILENAME1 FILENAME2
+.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat --block-size BLOCK_SIZE] FILENAME1 FILENAME2
 
   Check if two images have the same content. You can compare images with
   different format or settings.
@@ -405,9 +417,9 @@ Command description:
   The following table sumarizes all exit codes of the compare subcommand:
 
   0
-    Images are identical (or requested help was printed)
+    Images are identical (or requested help was printed, or ``--stat`` was used)
   1
-    Images differ
+    Images differ (1 is never returned when ``--stat`` option specified)
   2
     Error on opening an image
   3
diff --git a/qemu-img.c b/qemu-img.c
index f036a1d428..79a0589167 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -83,6 +83,8 @@ enum {
     OPTION_BITMAPS = 275,
     OPTION_FORCE = 276,
     OPTION_SKIP_BROKEN = 277,
+    OPTION_STAT = 277,
+    OPTION_BLOCK_SIZE = 278,
 };
 
 typedef enum OutputFormat {
@@ -1304,6 +1306,107 @@ static int check_empty_sectors(BlockBackend *blk, int64_t offset,
     return 0;
 }
 
+#define IMG_CMP_STATUS_MASK (BDRV_BLOCK_DATA | BDRV_BLOCK_ZERO | \
+                             BDRV_BLOCK_ALLOCATED)
+#define IMG_CMP_STATUS_MAX (IMG_CMP_STATUS_MASK | BDRV_BLOCK_EOF)
+
+typedef struct ImgCmpStat {
+    /* stat: [ret: 0 is equal, 1 is not][status1][status2] -> n_bytes */
+    uint64_t stat[2][IMG_CMP_STATUS_MAX + 1][IMG_CMP_STATUS_MAX + 1];
+} ImgCmpStat;
+
+/*
+ * To denote chunks after EOF when compared files are of different size, use
+ * corresponding status = -1
+ */
+static void cmp_stat_account(ImgCmpStat *stat, bool differs,
+                             int status1, int status2, int64_t bytes)
+{
+    assert(status1 >= -1);
+    if (status1 == -1) {
+        /*
+         * Note BDRV_BLOCK_EOF: we abuse it here a bit. User is not interested
+         * in EOF flag in the last chunk of file (especially when we trim the
+         * chunk and EOF becomes incorrect), so BDRV_BLOCK_EOF is not in
+         * IMG_CMP_STATUS_MASK. We instead use BDRV_BLOCK_EOF to illustrate
+         * chunks after-end-of-file in shorter file.
+         */
+        status1 = BDRV_BLOCK_EOF | BDRV_BLOCK_ZERO;
+    } else {
+        status1 &= IMG_CMP_STATUS_MASK;
+    }
+
+    assert(status2 >= -1);
+    if (status2 == -1) {
+        status2 = BDRV_BLOCK_EOF | BDRV_BLOCK_ZERO;
+    } else {
+        status2 &= IMG_CMP_STATUS_MASK;
+    }
+
+    stat->stat[differs][status1][status2] += bytes;
+}
+
+static void cmp_stat_print_agenda(void)
+{
+    printf("Compare stats:\n"
+           "Agenda\n"
+           "D: DATA\n"
+           "Z: ZERO\n"
+           "A: ALLOCATED\n"
+           "E: after end of file\n\n");
+}
+
+static void cmp_stat_print_status(int status)
+{
+    printf("%s%s%s%s",
+           status & BDRV_BLOCK_DATA ? "D" : "_",
+           status & BDRV_BLOCK_ZERO ? "Z" : "_",
+           status & BDRV_BLOCK_ALLOCATED ? "A" : "_",
+           status & BDRV_BLOCK_EOF ? "E" : "_");
+}
+
+static void cmp_stat_print(ImgCmpStat *stat, int64_t total_bytes)
+{
+    int ret, status1, status2;
+
+    cmp_stat_print_agenda();
+
+    for (ret = 0; ret <= 1; ret++) {
+        uint64_t total_in_group = 0;
+
+        if (ret == 0) {
+            printf("Equal:\n");
+        } else {
+            printf("\nUnequal:\n");
+        }
+
+        for (status1 = 0; status1 <= IMG_CMP_STATUS_MAX; status1++) {
+            for (status2 = 0; status2 <= IMG_CMP_STATUS_MAX; status2++) {
+                uint64_t bytes = stat->stat[ret][status1][status2];
+                g_autofree char *bytes_str = NULL;
+
+                if (!bytes) {
+                    continue;
+                }
+
+                total_in_group += bytes;
+
+                cmp_stat_print_status(status1);
+                printf(" -> ");
+                cmp_stat_print_status(status2);
+
+                bytes_str = size_to_str(bytes);
+                printf(" %" PRIu64 " bytes (%s) %.1f%%\n", bytes, bytes_str,
+                       100.0 * bytes / total_bytes);
+            }
+        }
+
+        if (!total_in_group) {
+            printf("<nothing>\n");
+        }
+    }
+}
+
 /*
  * Compares two images. Exit codes:
  *
@@ -1320,6 +1423,8 @@ static int img_compare(int argc, char **argv)
     uint8_t *buf1 = NULL, *buf2 = NULL;
     int64_t pnum1, pnum2;
     int allocated1, allocated2;
+    int status1, status2;
+    int64_t block_end;
     int ret = 0; /* return value - 0 Ident, 1 Different, >1 Error */
     bool progress = false, quiet = false, strict = false;
     int flags;
@@ -1331,6 +1436,9 @@ static int img_compare(int argc, char **argv)
     uint64_t progress_base;
     bool image_opts = false;
     bool force_share = false;
+    ImgCmpStat stat = {0};
+    bool do_stat;
+    int64_t block_size = 0;
 
     cache = BDRV_DEFAULT_CACHE;
     for (;;) {
@@ -1339,6 +1447,8 @@ static int img_compare(int argc, char **argv)
             {"object", required_argument, 0, OPTION_OBJECT},
             {"image-opts", no_argument, 0, OPTION_IMAGE_OPTS},
             {"force-share", no_argument, 0, 'U'},
+            {"stat", no_argument, 0, OPTION_STAT},
+            {"block-size", required_argument, 0, OPTION_BLOCK_SIZE},
             {0, 0, 0, 0}
         };
         c = getopt_long(argc, argv, ":hf:F:T:pqsU",
@@ -1395,6 +1505,15 @@ static int img_compare(int argc, char **argv)
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
+        case OPTION_STAT:
+            do_stat = true;
+            break;
+        case OPTION_BLOCK_SIZE:
+            block_size = cvtnum_full("block size", optarg, 1, INT64_MAX);
+            if (block_size < 0) {
+                exit(EXIT_SUCCESS);
+            }
+            break;
         }
     }
 
@@ -1410,6 +1529,20 @@ static int img_compare(int argc, char **argv)
     filename1 = argv[optind++];
     filename2 = argv[optind++];
 
+    if (!do_stat && block_size) {
+        error_report("--block-size can be used only together with --stat");
+        ret = 1;
+        goto out;
+    }
+
+    if (do_stat && !block_size) {
+        /* TODO: make block-size optional */
+        error_report("You must specify --block-size together with --stat");
+        ret = 1;
+        goto out;
+    }
+
+
     /* Initialize before goto out */
     qemu_progress_init(progress, 2.0);
 
@@ -1465,7 +1598,7 @@ static int img_compare(int argc, char **argv)
     }
 
     while (offset < total_size) {
-        int status1, status2;
+        block_end = QEMU_ALIGN_UP(offset + 1, block_size);
 
         status1 = bdrv_block_status_above(bs1, NULL, offset,
                                           total_size1 - offset, &pnum1, NULL,
@@ -1476,6 +1609,10 @@ static int img_compare(int argc, char **argv)
             goto out;
         }
         allocated1 = status1 & BDRV_BLOCK_ALLOCATED;
+        if (do_stat && (status1 & BDRV_BLOCK_DATA)) {
+            /* Don't compare cross-block data */
+            pnum1 = MIN(block_end, offset + pnum1) - offset;
+        }
 
         status2 = bdrv_block_status_above(bs2, NULL, offset,
                                           total_size2 - offset, &pnum2, NULL,
@@ -1486,11 +1623,15 @@ static int img_compare(int argc, char **argv)
             goto out;
         }
         allocated2 = status2 & BDRV_BLOCK_ALLOCATED;
+        if (do_stat && (status2 & BDRV_BLOCK_DATA)) {
+            /* Don't compare cross-block data */
+            pnum2 = MIN(block_end, offset + pnum2) - offset;
+        }
 
         assert(pnum1 && pnum2);
         chunk = MIN(pnum1, pnum2);
 
-        if (strict) {
+        if (strict && !do_stat) {
             if (status1 != status2) {
                 ret = 1;
                 qprintf(quiet, "Strict mode: Offset %" PRId64
@@ -1499,7 +1640,8 @@ static int img_compare(int argc, char **argv)
             }
         }
         if ((status1 & BDRV_BLOCK_ZERO) && (status2 & BDRV_BLOCK_ZERO)) {
-            /* nothing to do */
+            /* nothing to do, equal: */
+            ret = 0;
         } else if (allocated1 == allocated2) {
             if (allocated1) {
                 int64_t pnum;
@@ -1523,25 +1665,37 @@ static int img_compare(int argc, char **argv)
                 }
                 ret = compare_buffers(buf1, buf2, chunk, &pnum);
                 if (ret || pnum != chunk) {
-                    qprintf(quiet, "Content mismatch at offset %" PRId64 "!\n",
+                    qprintf(quiet || do_stat,
+                            "Content mismatch at offset %" PRId64 "!\n",
                             offset + (ret ? 0 : pnum));
                     ret = 1;
-                    goto out;
                 }
+            } else {
+                /* Consider unallocated areas equal. */
+                ret = 0;
             }
         } else {
             chunk = MIN(chunk, IO_BUF_SIZE);
             if (allocated1) {
                 ret = check_empty_sectors(blk1, offset, chunk,
-                                          filename1, buf1, quiet);
+                                          filename1, buf1, quiet || do_stat);
             } else {
                 ret = check_empty_sectors(blk2, offset, chunk,
-                                          filename2, buf1, quiet);
+                                          filename2, buf1, quiet || do_stat);
             }
-            if (ret) {
+            assert(ret == 0 || ret == 1 || ret == 4);
+            if (ret == 4) {
                 goto out;
             }
         }
+        assert(ret == 0 || ret == 1);
+
+        if (do_stat) {
+            cmp_stat_account(&stat, ret, status1, status2, chunk);
+        } else if (ret) {
+            goto out;
+        }
+
         offset += chunk;
         qemu_progress_print(((float) chunk / progress_base) * 100, 100);
     }
@@ -1549,17 +1703,24 @@ static int img_compare(int argc, char **argv)
     if (total_size1 != total_size2) {
         BlockBackend *blk_over;
         const char *filename_over;
+        int *status_over;
 
         qprintf(quiet, "Warning: Image size mismatch!\n");
         if (total_size1 > total_size2) {
             blk_over = blk1;
             filename_over = filename1;
+            status_over = &status1;
+            status2 = -1; /* Denote after-EOF for cmp_stat_account() */
         } else {
             blk_over = blk2;
             filename_over = filename2;
+            status1 = -1; /* Denote after-EOF for cmp_stat_account() */
+            status_over = &status2;
         }
 
         while (offset < progress_base) {
+            block_end = QEMU_ALIGN_UP(offset + 1, block_size);
+
             ret = bdrv_block_status_above(blk_bs(blk_over), NULL, offset,
                                           progress_base - offset, &chunk,
                                           NULL, NULL);
@@ -1570,20 +1731,43 @@ static int img_compare(int argc, char **argv)
                 goto out;
 
             }
+            if (do_stat && (ret & BDRV_BLOCK_DATA)) {
+                /* Don't compare cross-block data */
+                chunk = MIN(block_end, offset + chunk) - offset;
+            }
+            *status_over = ret;
+
             if (ret & BDRV_BLOCK_ALLOCATED && !(ret & BDRV_BLOCK_ZERO)) {
                 chunk = MIN(chunk, IO_BUF_SIZE);
                 ret = check_empty_sectors(blk_over, offset, chunk,
-                                          filename_over, buf1, quiet);
-                if (ret) {
+                                          filename_over, buf1,
+                                          quiet || do_stat);
+                assert(ret == 0 || ret == 1 || ret == 4);
+                if (ret == 4) {
                     goto out;
                 }
+            } else {
+                ret = 0;
             }
+            assert(ret == 0 || ret == 1);
+
+            if (do_stat) {
+                cmp_stat_account(&stat, ret, status1, status2, chunk);
+            } else if (ret) {
+                goto out;
+            }
+
             offset += chunk;
             qemu_progress_print(((float) chunk / progress_base) * 100, 100);
         }
     }
 
-    qprintf(quiet, "Images are identical.\n");
+    if (do_stat) {
+        cmp_stat_print(&stat, progress_base);
+    } else {
+        qprintf(quiet, "Images are identical.\n");
+    }
+
     ret = 0;
 
 out:
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 4c4d94ab22..0b2d63ca5f 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -40,9 +40,9 @@ SRST
 ERST
 
 DEF("compare", img_compare,
-    "compare [--object objectdef] [--image-opts] [-f fmt] [-F fmt] [-T src_cache] [-p] [-q] [-s] [-U] filename1 filename2")
+    "compare [--object objectdef] [--image-opts] [-f fmt] [-F fmt] [-T src_cache] [-p] [-q] [-s] [-U] [--stat --block-size BLOCK_SIZE] filename1 filename2")
 SRST
-.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] FILENAME1 FILENAME2
+.. option:: compare [--object OBJECTDEF] [--image-opts] [-f FMT] [-F FMT] [-T SRC_CACHE] [-p] [-q] [-s] [-U] [--stat --block-size BLOCK_SIZE] FILENAME1 FILENAME2
 ERST
 
 DEF("convert", img_convert,
-- 
2.31.1


