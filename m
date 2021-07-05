Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DC23BBA1F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:23:13 +0200 (CEST)
Received: from localhost ([::1]:53688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Kor-0008F1-0G
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0KiB-0002GG-4G; Mon, 05 Jul 2021 05:16:19 -0400
Received: from mail-db8eur05on2138.outbound.protection.outlook.com
 ([40.107.20.138]:40000 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0Ki9-000816-2y; Mon, 05 Jul 2021 05:16:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvuoB5gtoKlhJqD+m8j8BRw7qIKHsK0wcduJl3yHYUyFextWrXapEYL38xJzOVDy8EURUC3Uii9EyK8APoy9gCg/yeZ7IAmxASfwzqVSy1EUgdn3AckFaZeBgdKv2Eoy1XJ45VIbFfbM1JX4hdydhOz2shFQDrt7c1hVRBIo9U81480W4Jxh0V6SlidLRACPIbahLSau0o6uN5nCx3Wn/zMrg98z6xg/3YoN88lhjdtsqnfQ9YZThTOBkocfUACOawbeU0EnzQXO8OeCSP4BiLTMUGdCpIBMuY6KUgqkwJAcLF9krb2pkP4rmDR8zWzuEmHjpbJe4r8im9JLExMn7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NH3bshTPyuYTxGnubDCiHXiX37McMNu8ImyQFiJbpVE=;
 b=Rl3ZPvdZC70scAvIbZFWVM0hivgZ4VJdZzcs+WBZLzj4BjjGy76/R7hQthJj0Ow35zwiDU4JfoBU0VdagFIAlbgqv/Pir0lJjVsBTaEIdYdFk+Hi8tvvhRgtBlS1FJfK7dg4gV5pxmzuCEGf9AYS9Jdr9gG5OJn04zP+TCg+aY220vDTeWXB2dCgj6Cfytg7WvM9wXPHPRBbgBm8j7oEL6KFrQWsJdnoSWWUqPhHvvMgChG83F+hjuoCHAH49alsS40r1V6K3P3Jbdg+QEq5fuu68RtGysTt6/jHVqBVw2/nrHASYk7aI7K37S9r4LVPwl88OvUke4693UVRWW4hjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NH3bshTPyuYTxGnubDCiHXiX37McMNu8ImyQFiJbpVE=;
 b=tw1mnsEuWLB1NeVaam6mnzjKaGOg6gJRgz6ZUT1JaXGAbc1pDUiWHENFfGR1um3JExtf/VtqOhEs9GcdlOp8pH0a3msazK0tFwk6pKvBa8iI3kuoq04j6iHZVXQ0ecLUJQn4vFxY0z7rHOWaMGrtd2Y2U4nZRTn+/EyFIy8IAgg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 09:16:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 09:16:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Subject: [PATCH 07/14] qcow2: simple case support for downgrading of qcow2
 images with zstd
Date: Mon,  5 Jul 2021 12:15:42 +0300
Message-Id: <20210705091549.178335-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210705091549.178335-1-vsementsov@virtuozzo.com>
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR05CA0235.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR05CA0235.eurprd05.prod.outlook.com (2603:10a6:3:fb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:16:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5cd1816-656d-4f1a-65e3-08d93f958834
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44705E95AAA779D092215C29C11C9@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KXt+GaC7+XE03+HM4ySinhuZyoAX8HsmV9YqxL11flDYRXj5AIbt1Fnhnff37Ui9G7en1BkkGC4/lZcp4Grr7lynZg/wJhMTJhmlHf/gZRq8/Kjt2jKS0eYNADkf6+4TJia40ihJPF4tEUZDtAbInlISLmSjksqcFs1ZoTH4/y3anLu7WBAS5sk8+W8KDNLmNAvKACRvlrotS0nXZeTg+aWy0ejA6qr5AQ7k/xrjOAZHb1P87l44qIlEOyfSNU7IczsspqPM3GRj90LN3U7/z3yAqosJthiENPq4Jr8l/Bge9T8B5xECyrLXo0H/wiFMF4DNRMPVHISmU+5PvC2s6isi49YtMB1fNkXlUQL7fXi1USIZgNnMjgpgiIkwn6cPvVHzE8rBpWLKQ8+WuJ3UPNWELuy365qctZbbXbG4EWQ89KSgvgIh0C6XF1Kjp2KZdYAxyG7DfYJBewG1xvCWfskF+KIit+d1U3b3wGlS7j6e71kEjMCT06r+Zaz3esR+G82ZIFwO+Hh2uURoMLrpj9AZ2Hc1VjsvnXomQPTvjUgiFnFx1pSHGBED1lBPkmZs/Rv7BZKpsSxFXrxHGV4OhA6zo/qu3mHlRVuDEKg20rXwRpw/OUbxCIpvH7EkaCb35+fHy+Fkf4olMXMqo9bSPsnB05LlRjpwCyTc8jzQRXX1Qosr4e1J8dnEHioFmY6TWdBiRj6/52IjcRZXBw4tKAaRWFNOr4WiBO14P2mYMx/Rjci3vz6qeaZrmYoAeGMd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(376002)(346002)(396003)(478600001)(66946007)(66476007)(66556008)(4326008)(956004)(2616005)(83380400001)(19627235002)(6512007)(2906002)(38350700002)(316002)(38100700002)(6916009)(6506007)(6486002)(1076003)(26005)(186003)(16526019)(5660300002)(36756003)(52116002)(8936002)(6666004)(86362001)(8676002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NLrPf8nB8fEn/7rafBmvU1ZtNyzoMV2Yd2y4pLCyunSKbVeotsx9O3kUtaHH?=
 =?us-ascii?Q?PEyiJDtwWms46htrMU9BrBZzAXa3PR+kCO6W8epWni45NlOG+hBIpHZJCX7T?=
 =?us-ascii?Q?qPoFuGIf65RmSL8qqPwHYYY6VODMnWnc4oJ7TgXEDeMMO0RiTT9GxzdLWnK1?=
 =?us-ascii?Q?zW7HmhS2ZZalObPBkxFpXdx/hrQXXTSCXYq0nQ4U2PEouxe3E0DdRrTeyjQO?=
 =?us-ascii?Q?Gt0Ws0+7r+mu4+Vv+6sulzjKe1+xtmegyMb8ptUcxJ+8CW4NCL4fuCiSaWpz?=
 =?us-ascii?Q?WFHWDV831U7Ah5CN9FPUJfgSHjVjozgOBDZYbfQxnNTytiODrSRcuuo6YyX5?=
 =?us-ascii?Q?pe1XJuRz2SNMNUXsppOld+HQPtsoGiWpAIxaT0D5lPdeewBlJ8pfX46fXnJq?=
 =?us-ascii?Q?fPAD4bMUyUAS56suud06pyQPlIxujdZDQj0TnEDC48QpiDa3La2mPVDM18ku?=
 =?us-ascii?Q?L2JXehdi4PGOfcb0hbf12PQtse3JA7b75DXYKh5JLakYROBN41jeZ4+/75yb?=
 =?us-ascii?Q?oBjEgAkx7wljl87lmC0GxlFxeSh9QzGJKlp29MBq6qtutKYmybqgQnbVdmir?=
 =?us-ascii?Q?MVQmjUT4ND4EpAgvYpp/X89keZcTllV8+XJfJ0fJb9nye3wAdvvXCBFxIuk4?=
 =?us-ascii?Q?2N4ccVCoNsRhBtd74jr3xCshxHv7gB3UvIEMJUpPjxKvvx9I6bYMSwQx3ZlR?=
 =?us-ascii?Q?WuRjhOi0MsgBWcmDUQm1h6CUgkHPNjCaYrGO1XuBDcllpyIKRbaaDehhEXV1?=
 =?us-ascii?Q?DEQ3mCwKCAig1uoAOtbWUWmiFVKEHmk4rHhpD2qikKWmlXcvJ9HxqjBt5U43?=
 =?us-ascii?Q?Ax9UbQtqRg8WHDCoiJ3i7UxKokZT7JIi7kOWj6o+Jw1JZ6Nvbb88SNZSbEwP?=
 =?us-ascii?Q?D2ATUkmwa3X6jk7psc+vobDddvMGQFeal3exctiBcmJGYQz73ktXHoIZUsSp?=
 =?us-ascii?Q?uS/7Ov/O6gf/QJrODuRdbpg2RrJaoehMgW92VRzVMlG/Ep4U/UsJUsII9DD8?=
 =?us-ascii?Q?FXr6MxTHwfxsXThAhjJB5SI7a1KzTbWkafjjvY5I6m7ZS9oalh7JCD8baYSA?=
 =?us-ascii?Q?JqVvtxRYF/K8GgutqPivhJkn/lp51jznVHPRVwN3CKhBlKIHQ27g5g2KmE8N?=
 =?us-ascii?Q?YR3q3UdQNl3StimAsBaMt2xC/YBVrreJRxW7gEVio8Fy6bsMAvW4pFZcEpO5?=
 =?us-ascii?Q?PiyJCqDgQIyFxbkmDpvExx+bbDCxAea73aQ6T5KAGrMbe4qmmsxGYKynZITk?=
 =?us-ascii?Q?jm9PbqaqnS/lmGoYBTYwhqUCxiC3vFOvrK9bt2ESHaT3zFOUSVklYxHoC4L8?=
 =?us-ascii?Q?bEUzpRU24HmFbqiBVMaqUQQN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5cd1816-656d-4f1a-65e3-08d93f958834
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:16:11.8931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHEkq8qPWcJulqmpK2x5dPcQSUJaV59rPmYFDuTemf5mZz857BjdjXK5QLiZLxERgH4zElP47r+85p6O7D+wDmPVfHN90OJDvSDPuHIU/W4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.20.138;
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
---
 block/qcow2.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index ee4530cdbd..bed3354474 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5221,6 +5221,38 @@ static int qcow2_load_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
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
@@ -5278,9 +5310,10 @@ static int qcow2_downgrade(BlockDriverState *bs, int target_version,
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
 
@@ -5298,6 +5331,27 @@ static int qcow2_downgrade(BlockDriverState *bs, int target_version,
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
+        s->incompatible_features = 0;
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


