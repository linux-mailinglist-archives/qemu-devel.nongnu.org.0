Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731FB3CF904
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 13:43:44 +0200 (CEST)
Received: from localhost ([::1]:47302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5oA3-0007zN-CL
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 07:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5y-0003Pl-NL; Tue, 20 Jul 2021 07:39:34 -0400
Received: from mail-db8eur05on2091.outbound.protection.outlook.com
 ([40.107.20.91]:40417 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5o5u-0007CC-SY; Tue, 20 Jul 2021 07:39:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5ST6/4IdNNJs+Jy+fVxY++ePcDyeKbQ9LFchEXd8VNjrL4f/g9niBGQv7ywKKNZBTQZyYRFNgm0MUm1+knk1ClP6MSGbWAdVUbBO4RrOIXStK2HpwZij4uSFI/Rivcaj+GzWSTBIo5rNFkuPSrnT789G1KPuVjSw99/TuaBalv36pd1WoxFtIlY7+hCtxAx+zmTY9uElDvg+aTD3GMLcp39ehQbtMI6Xk6QS8UVferzfDhrg6vNdRmZitdQ6Akue9ppcycA88y2jSMnS4N4LQbLBkg1NLtw+grWSiiYKSjDTQVo/FpkOKrxgb4K/Hcv0Z5Wzy8xgcEa2PmP1LJ/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jli+GD9A24jlE3s8WTSFyIu7FrhAimoplmvans/jOLQ=;
 b=gEUh/16H2FMLDYqKzkjzFFj7gijN8OqlVNIjQ+s5nQz/sWR5Jpqjf9d7fqd9yZQLDT7+4c00E2Po2an7FXINMegc1TvvL6Gg24EsUNEjZ0zCtSIFOFO9XxAlKLF+V+rgYARAXLUSm67eN2qABslLYoj32Whf4kAwaoY9SMCTzFEjc7od5EvbonStgJevVIvnzuCnCv4YNri1MlLeB3/rptz5rzzZ2AHuxKbYMo/Hw6GRH+i5LUrM8VoVeFsh/VnVLph19x+6FdcuZvbCW/iOy5HCnhBOq7x0c8BkHJyxwZpi3pIpbRqhPRE9NhlGUK2HnMGniLwFeETGDdXh8fIWIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jli+GD9A24jlE3s8WTSFyIu7FrhAimoplmvans/jOLQ=;
 b=F3gjByq/RQJ2ndtTNWEUKfvEWCKImqOKdqCzDA6x1XB2daN7d3XPHYWmuHGRXox/La8KnwEVXzUbAfAZWqiVAJZe8Ir9aLrQxI780DjtORIXnTPx8CudfGkpDHSmkXL3slCIXwd7NP7jhQxaLsSLGV1pjwMYtHiTR5ofN4upWCM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 11:39:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 11:39:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 jsnow@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH v2 10/17] qcow2: simple case support for downgrading of qcow2
 images with zstd
Date: Tue, 20 Jul 2021 14:38:25 +0300
Message-Id: <20210720113832.586428-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210720113832.586428-1-vsementsov@virtuozzo.com>
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0146.eurprd05.prod.outlook.com
 (2603:10a6:7:28::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (31.173.85.199) by
 HE1PR05CA0146.eurprd05.prod.outlook.com (2603:10a6:7:28::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.25 via Frontend Transport; Tue, 20 Jul 2021 11:39:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 785e8422-949d-41c9-d234-08d94b72fa59
X-MS-TrafficTypeDiagnostic: AS8PR08MB6119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61198D3D793207DBAAB9DA34C1E29@AS8PR08MB6119.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h5xj37AYO9jx0ofRxZhGPuesgVOCdfWhml2A4XqDWD4VwSxKwvgKW4G6665vtSjmMxH+N6nxXaduNqjhzoEJk38j9seq/0TlsQyMYjqrCLJpUb957JB9u4f4EKlPOnH9BrTRmiaN9nqNu1wTDDG3eBLG1Dlh+06npHInwN9UQpvy2qCIQnVV6L0yazxPzbxB+TBzMRd2/BJLZRzv5TpZW8MaFAH+yi5OGTsfdWBxid1Yz1iRoZonrI85KuNNuOi5SlqSgqJ6O4qH2UfDGV+8maTldswxVrTL1HJ6Oi+RUg++WxM+iwxbtAMUHSsangfoSKMvAplXX1BYS3XabEUJ5RK9XN3JG1Xbol/Js24x3M8FnJvS59qcOk3QvfT20vWQZcUk3E9qViLC9+5lX6V4KwClCu1gYg5ZWth9OQH+ADdbY2q3Gp+Y4MMQyhJdkLP9rp3bwQgNHgFmY2y0sdcPzoqt1XXDruNgQH40zV/1yk2gd1irTZluDAS82yvAhxmScT2qzsgJQ/0995TGoOH7ZEGBXjsAp2BZQfBoOCQbk4ks5S0yYxIhBmws1eZo758ILGUFSwiOr3ZuFbN4dvd+5DjAUKgTgUSTPq4UeWBEl9xlL2agqEUFY8jnTd7Zw+wl/gD0GLuaqtkj+VkMm9ZANbMf+Oel47+ehIxWYEmG3F/4lJOO0/CbT6lDRurWEg/AuMNk3bsyM35MPm+0o5vmVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(186003)(1076003)(478600001)(5660300002)(6512007)(6486002)(2906002)(83380400001)(316002)(956004)(2616005)(86362001)(107886003)(4326008)(8676002)(6506007)(19627235002)(6916009)(8936002)(26005)(38100700002)(66556008)(38350700002)(6666004)(66476007)(36756003)(52116002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xDP4ExlTx9G/rqUeowhD1gSqdP4sPHLzHEZuLyeaJ6LM4JPtlAK4aSJH1vjK?=
 =?us-ascii?Q?z05+XyeN84XL0rrclxYBWaSeCT1WXj/YMrn2JIEgcOAY2GhZ/Jy6RSj0UGvU?=
 =?us-ascii?Q?f1PuHR9ohD6KPIVpLOvyIK6djKj8X5pRc82+M9Aw88rVTU5PRP81PblXvfAL?=
 =?us-ascii?Q?dUv10J01bJkI3Mz7K4F+AEjIfSUcoknPAQV36MV0rjrm3SJgyl3gPphON2Kr?=
 =?us-ascii?Q?CEIzgv1Kdw4pKxjExShDTHhbl5PuU3iEzcIuEvOcs2j9ho6D3hHlC9F8ODLk?=
 =?us-ascii?Q?wpmrgPdjQUXCPoJ/SNGHwaOR6xdWfJvnog2Xodlfr5lh2W01e8d1Csl0ShJF?=
 =?us-ascii?Q?Snau8Ynex/fo6IWTgelhWC8XRrqyIxO7ZF4X8muhXYANrvNNBW3wyNg+jmPU?=
 =?us-ascii?Q?5+5y8CFVwK4p6JkXGaGLpkbQ2DnwPDfZP+qjBKL8G/3iTtKxWCAbNB2gM7tJ?=
 =?us-ascii?Q?UfGOehGeedfvvm51iuFfl+rcXwYGno3fL0ArzfbcRi3qp2HdmndOHMZ5QT/J?=
 =?us-ascii?Q?4hG+4cmPimlhyTwQCE+h2HVG8yygvG/zTPUwSSZ0UAJZyukJNPCDy34U80PG?=
 =?us-ascii?Q?iA1BhWVEewdtwHDw/Zgr4D4gKv3qASHvIpFawq0THO0i88FiZ5Fq+aXhwqa2?=
 =?us-ascii?Q?YgKJdNMOIfuF+db//vAvRMEh2CLH7qp3DJ1MKAddM4wV5aI7WIi1TLl1F3ET?=
 =?us-ascii?Q?PrKxzXMVWU0P+1VTQ91DsFn7NF45PkT5SabuWMvdEQT03AS7o/QSeguPkXKa?=
 =?us-ascii?Q?3A9P2xkPNpxi92xHIQjkLhF20KdmOUhewMyStDPLrME1C3vNGWTt5yqspoAZ?=
 =?us-ascii?Q?TIBeQPcZZrFJkRuxv1wERRQ6WFfM/2uuvlZOVPYel0i0czleLHvpPiXP4GJY?=
 =?us-ascii?Q?1lbkhZ5hX6nDSu2ZMwjWrSXFjXxw47DEnHqslxn7bE+JzpCClG/zDzVsu7SV?=
 =?us-ascii?Q?D+QB01pfo09LINS2ltpwITaGobMMd6hsBLgS0fLL4dhE6hf7c8sHYZYFqZMr?=
 =?us-ascii?Q?CcuMIQ8DyxbEupBOjbYUjyz54myVkCSewcYaqjnpCPCWPko/rdIjBOkfYRpF?=
 =?us-ascii?Q?no8rfnQGTjwXzNDxbKz8OUA3Mvg27Xtz4eB2eEtFm47V8Rz+Za5IzMIvLqIy?=
 =?us-ascii?Q?ciug7dQvD/gQ4aJiiFUjET0zXv5S4+HF5iBI45X8xL/LJKqwdr/WCfvyWM6S?=
 =?us-ascii?Q?QE4ySVtR8snq86quS9YDNjA0FU8aByUF4mVWEYbFtecS5XWiyjOHQc3N6GxG?=
 =?us-ascii?Q?Mv3MmmQdw5/WTKmWfjXNkog4oLM0iNEXcaSs6gFS/j/OeghZ5wCRFPNdMzJ8?=
 =?us-ascii?Q?vq5FwS9pzSvE1Bx7952mGTW1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 785e8422-949d-41c9-d234-08d94b72fa59
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 11:39:04.9804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITbkO63DkOpHef72Fducy3U5LG9rlIjTvOiU4wrZTR0/BNG+aX+3xeuG+t6Qpr/JJQiBchaDd0ttJLROICAn7Wjt1g6qNJITvPoPi29TJSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
Received-SPF: pass client-ip=40.107.20.91;
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

If image doesn't have any compressed cluster we can easily switch to
zlib compression, which may allow to downgrade the image.

That's mostly needed to support IMGOPTS='compression_type=zstd' in some
iotests which do qcow2 downgrade.

While being here also fix checkpatch complain against '#' in printf
formatting.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 9f1b6461c8..a841fa4c72 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5250,6 +5250,38 @@ static int qcow2_load_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
                                         qiov->size, qiov, 0, 0);
 }
 
+static int qcow2_has_compressed_clusters(BlockDriverState *bs)
+{
+    int64_t offset = 0;
+    int64_t bytes = bdrv_getlength(bs);
+
+    if (bytes < 0) {
+        return bytes;
+    }
+
+    while (bytes != 0) {
+        int ret;
+        QCow2SubclusterType type;
+        unsigned int cur_bytes = MIN(INT_MAX, bytes);
+        uint64_t host_offset;
+
+        ret = qcow2_get_host_offset(bs, offset, &cur_bytes, &host_offset,
+                                    &type);
+        if (ret < 0) {
+            return ret;
+        }
+
+        if (type == QCOW2_SUBCLUSTER_COMPRESSED) {
+            return 1;
+        }
+
+        offset += cur_bytes;
+        bytes -= cur_bytes;
+    }
+
+    return 0;
+}
+
 /*
  * Downgrades an image's version. To achieve this, any incompatible features
  * have to be removed.
@@ -5307,9 +5339,10 @@ static int qcow2_downgrade(BlockDriverState *bs, int target_version,
      * the first place; if that happens nonetheless, returning -ENOTSUP is the
      * best thing to do anyway */
 
-    if (s->incompatible_features) {
+    if (s->incompatible_features & ~QCOW2_INCOMPAT_COMPRESSION) {
         error_setg(errp, "Cannot downgrade an image with incompatible features "
-                   "%#" PRIx64 " set", s->incompatible_features);
+                   "0x%" PRIx64 " set",
+                   s->incompatible_features & ~QCOW2_INCOMPAT_COMPRESSION);
         return -ENOTSUP;
     }
 
@@ -5327,6 +5360,27 @@ static int qcow2_downgrade(BlockDriverState *bs, int target_version,
         return ret;
     }
 
+    if (s->incompatible_features & QCOW2_INCOMPAT_COMPRESSION) {
+        ret = qcow2_has_compressed_clusters(bs);
+        if (ret < 0) {
+            error_setg(errp, "Failed to check block status");
+            return -EINVAL;
+        }
+        if (ret) {
+            error_setg(errp, "Cannot downgrade an image with zstd compression "
+                       "type and existing compressed clusters");
+            return -ENOTSUP;
+        }
+        /*
+         * No compressed clusters for now, so just chose default zlib
+         * compression.
+         */
+        s->incompatible_features &= ~QCOW2_INCOMPAT_COMPRESSION;
+        s->compression_type = QCOW2_COMPRESSION_TYPE_ZLIB;
+    }
+
+    assert(s->incompatible_features == 0);
+
     s->qcow_version = target_version;
     ret = qcow2_update_header(bs);
     if (ret < 0) {
-- 
2.29.2


