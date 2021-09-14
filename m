Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFED040ABD2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:39:15 +0200 (CEST)
Received: from localhost ([::1]:53198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5qN-0002Rw-21
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5e2-000503-Rw; Tue, 14 Sep 2021 06:26:30 -0400
Received: from mail-db8eur05on2115.outbound.protection.outlook.com
 ([40.107.20.115]:20224 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5e0-0003Ok-E7; Tue, 14 Sep 2021 06:26:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bA4jkPVWrqvuaw8ZXd05+4g0kFLOcnGd/fSmVhrJJSyLK0bG5ubmbKRDanYhYgQ2or6k+Knm38FJUQXJ1SZGnYl4QCPG+bdkVFlIE9Xt2HkTth9/1kBJkMgay61DuYsKPT0H1Xv5ccZKVE95dQvFv/vk0xzzTZXqcFpmdTGWOU170miRAwGpSfswYApELM1fKp2JMYsrBs85wzRo4gW1fkuPfx7YYJ/9TlGDdTcWjYl+0/p3yR1250SSg31bdhCIxtFrZv7160SOEVkV3nYVsDGJWvZnyovlb2mqLfpEFEuswQ5agDcPOLx0PQ0avjB+JicSaJ5/w7GMoCo5SV3JCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Jli+GD9A24jlE3s8WTSFyIu7FrhAimoplmvans/jOLQ=;
 b=Ury+d/QEhKibqj4haGDsjG16ye08F4rIRHkirP6QJe5vNZF21pnEIi8eSxl79b8tkaqByeF4Zc4E1KBBuoToqpe8ld3YWaWGSb4OtQSuK2kGvVseGzxrxPLW7H3VwPxlFhvtLs+4E5A2X2cg/939j8cDZmw4KAohoK8z+fJzv7QoGkIFcLyhuLboyKwnrUSxv2zZ9BgmDMMEMulLX3m/sp9j+QxlepAjw8ebgh0RGFM+W5+yf5TonM5JYU2pamrx+cAzGK6XuMMhVeSID5Yjvw1IcJLLEemQjkHXZOl54zqmzuz2F2BHWjqUgqNs+wJGUIWoimDxCMJ0ESSyIKroeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jli+GD9A24jlE3s8WTSFyIu7FrhAimoplmvans/jOLQ=;
 b=F6nggO2A/GwqTZmimL0ijvLQ9dgULyuTN2g6ttrcC099rBFQY7Ef9o7/iM4r4AbbNoF9w4614wHgNSRPdFA9H+Id51hShPjUmBndfzw0OhEHA559/gkcC1ABXJIAQtgcDOb7PyYtDYnoUCpAkwPGHv+MYGnGIrzbgeuXoJQnQrA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6071.eurprd08.prod.outlook.com (2603:10a6:20b:29f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 10:26:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v3 10/17] qcow2: simple case support for downgrading of qcow2
 images with zstd
Date: Tue, 14 Sep 2021 13:25:40 +0300
Message-Id: <20210914102547.83963-11-vsementsov@virtuozzo.com>
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
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f359ae2-12eb-4292-6031-08d9776a1631
X-MS-TrafficTypeDiagnostic: AS8PR08MB6071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB60711B5F022C414B53A42C8FC1DA9@AS8PR08MB6071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dvmkczk9ogkcg3RWLhWMkGHwhOfIFC/BWxLu4671smf20bs6jKrOuQPhRs7tzaY+hmuZAZ99XuUmrWfvp5lKzs8UqUyU9ALGyEcnOb9XTrs9DTqatVmHfl1mNSa+Mw9eqZ8zOFfWvGCQJn5sX/7soMGh+wHXUcgc44bbVhgZPfkFRHgRN0kMJO105B1/34wP5h2tAait8qAxVY2I/i2/QRYcBd4oLIqglRGYo1HlQRnxV4p1EGQrTSaSlZdjWe9xGmR1wf96KhXPWS8y4OrwdPJgI5GsJJeQ95twqlvtRDoac4L7y7Md4H/T8NuMPCbf3qfw6MZ4QbAO7nby/VSy3tKs6DOBMDhpHlw7fxzhi7YJr6tqBzmmrddWjaHot9a7T5Y238lwYjoD4Dp41upJiujC6QeNaL5M4KdPXVMORtOdS9nLj1FYNFXIJAJZPmHWI3X+Akw26lhEDr51dWDQ8+wns0HCZb2A53QQRYb72w/GjUN417z2n8YkgjRjf5tJOZpKxHP1Uf4eQTqc7gYJlWeqSwFPLQxgOVtU1JPuUHTwgF8Sf7/F8VQTGiXsPhcXIMTDeO3o4dJ0QHyj/VDoY6NtgnQdq3tnhhiWCNMrJ9UrZmLXPDQQWKXDVDicwE/sjKh7AWedBjlqN91IMxu08JhSh/Rs330Uk/0yKtKRljNVABgvi+rc3VruG3mGna+InjxHaypDO7Rp5VVGVkfuQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(366004)(136003)(396003)(6486002)(26005)(86362001)(2906002)(6666004)(38350700002)(66476007)(38100700002)(66946007)(478600001)(8676002)(36756003)(956004)(66556008)(1076003)(186003)(6506007)(6512007)(6916009)(83380400001)(5660300002)(2616005)(8936002)(4326008)(316002)(19627235002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n3uvr6aG2L/1uNELkQx8PqVlYfANkdtZZvThOsZrcaYXOluungUC9kwLgiIa?=
 =?us-ascii?Q?Chks7rQuxcp9pKS3NNxAU/6v7wfemiYMWiFGsXX9eeNXZPKLo1gcdzPav709?=
 =?us-ascii?Q?eTb6O9Hnbaob0wpilkV7OcIGs3c1hfqcnXHH4IjlfAF9UvFQ5ep0J7ImQUJ/?=
 =?us-ascii?Q?j/yTJmmi95hF6KP4XmHL/Bok5SUxJfJxgdpNtFqaEkfqYnqycoBwprSGvzwL?=
 =?us-ascii?Q?TcXFf0VUq15QJDQJKhD17cWctoFvsHvPT7DauIOvlwLJ3dDbK/ZNLcr7MyJi?=
 =?us-ascii?Q?U6yLfmkvrUoSLGGk7owmd7iPNR4qaDdOTQxWEQs+nQoUr2LBRPvMvr5Q8dCN?=
 =?us-ascii?Q?uojUC6JcSJ5tu/JI61bbeDy+0DL58ZSHuZC+/vWRgDyJmmkCPXI7rutV1qo4?=
 =?us-ascii?Q?nX/dLg8CBj9UgGEmUX/TAlk4ltXZ4Llz/4XULSajndfufV+t4fR4qxxJ/ef+?=
 =?us-ascii?Q?9mPwKfF0nHw0Cazc+d9eKAQiZDDoH7F9bdigB0f6x9pIC6pm6ic/WeXyMnmg?=
 =?us-ascii?Q?EV8oPHgfbT4OS+m+wxZ8wGaFVlTAAiiU96UtvDMsd0YoLtbsfoid2bMKOC8k?=
 =?us-ascii?Q?EudWgeXn5e4lomBzH6gvUO2iWMw8VLkLYcPFAzzl+dZ59/Trl+7CnXw9UunC?=
 =?us-ascii?Q?IZInxvwP+cnkhGeFs0ivcUv1jjGf6TNjC0mz3I9Gff9hPLna8XY1p9I2pILi?=
 =?us-ascii?Q?7mn5p1D8HRons8KuvSIGcUwDGWAmi3caNO/kqtyaxRP4rfVmM8IQbXE2wZkX?=
 =?us-ascii?Q?kvO6TWu4uVk3XqzYzMCXKoa17u5DJOjCfU04hyf1MMjan3unJXT9KvvO3GoX?=
 =?us-ascii?Q?/AW3pLO3wAkVkFh34f4m2aA+MYmp5IpG6vzdhx4imk9+YTG2dg+O/KkhBIny?=
 =?us-ascii?Q?O0laAmzQEvhQ391/b9OBLvohyyPFi0rda9ukKahSUWcBVK4yi6HvEClE2hxs?=
 =?us-ascii?Q?tWcTs11ZXDL9oV2QGYzwHU0U05amUIDLLzx19tNmNYF+8QE+MNujJYiKT6jn?=
 =?us-ascii?Q?d7oh9sjYWUz9QPj9y6/G53eef3/mrYUtOfaDNo6jfbGphwmoQLDJbYO32CYy?=
 =?us-ascii?Q?X8BObXx7vDlk2o2Dao3//06yGlaEfI4CYIAksvx/7C9IaxtsCC+c6VABC2BB?=
 =?us-ascii?Q?3TXa2eLqjGU1Pa7JOfgG9kV4XVOauq0maiZuV9275KzHQzYEZu/0HRAF9ZDH?=
 =?us-ascii?Q?UeQ06lLItGGuRyhVvJal9rfSzt85rT08z4mO2lFxUfVazII/knA2rsE5d2PT?=
 =?us-ascii?Q?hNN/P4udiGZA+2ViFWSzRWeaP4aETBK/uwQFjU26oH7q07JUhN37a4r0oeUQ?=
 =?us-ascii?Q?C7seeICzNGH2R0XZshN0+D+Z?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f359ae2-12eb-4292-6031-08d9776a1631
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:17.3662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0TV5xprP01SGpWo2QueZIcoyeSyLYRNAdoQoCZeuT0SkFKRUYXGNmipGM1+etKDQrzW3SRJsYKe6ug77XCJcW5kuzBVL908FjR9EHllKNDI=
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


