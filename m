Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1726400C1F
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 18:32:13 +0200 (CEST)
Received: from localhost ([::1]:48144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMYaS-00050e-Ng
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 12:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTl-0002zF-QY; Sat, 04 Sep 2021 12:25:19 -0400
Received: from mail-vi1eur05on2102.outbound.protection.outlook.com
 ([40.107.21.102]:64544 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTj-0007MU-Cu; Sat, 04 Sep 2021 12:25:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPi5tE6pIl9bw+g4JSzkGVYA27ebQL/rCBWhZX2vuavcxS555/18q6MWXm1wV2n/nmR2QXn2R3TD8Bj4A/ZMi/Cl+kU/XPpod7r4oLr6Zny4S5xcsuC11EIzLsysu9dx3HF5tqP9uY/L6uNqZhbjAbXF/92xNrWxAKoCm8LyRdzbC5UxXoEjtYQld9vWVzm/9G4z3b67qv2L/MZC3GhtgwBnDRXwDtBjGfISYydXoJFVup70hhknNVlY0KW3lp5JjkbGMYGMjdOrXClPLNCuwQ/f37o2gJKBPF6ShstXTSMww1H0/8FlGJF3ypnvln3dlgj3n1LrxT2mrHY2uTu6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=2Jm/ALqpAlWR6O0eWv4deHHaO41M0YIuoGhIvVzyi28=;
 b=KpKAcki2PJmHz9ueCQXSNnVdKd6Abmc7LU9lCWxeh7J7+PDWO5lNZ95JwTwblONdk9DV1mYtRg6yeXbDJylNNjcIwqDto0crtGrMvecTAuFjy3j7CzNliBk4RXqKQhp0p0TgIpYaxLu0fXpZIO7JkvpMh1pIC7Fo7+9PYf7Ifh5cohMrnv6RncyONqymSTQg/swERvtWIFHZCK7hFrYIh4be+WpJB0iO358PQJMLSbAc0RsFDPAxsCHYSdsKT6YU0N9nqog4AAZuxSYoekAq/BPtN8fTmHJznTU7pXLuG/fwx8pVpoSeDt37KC1Egsz3ZBGoB6HrFz3C/T9xkAPR1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Jm/ALqpAlWR6O0eWv4deHHaO41M0YIuoGhIvVzyi28=;
 b=uQK46hDUomGRv94+XTzZYaKbYyCowl09y9SZllY3Zihyv+XlXh/2lUUwC8Fu5qxQiN3mV8T03jhwGY8qxpd62NTxLMvvdaK9S1pPrBg5diGyqqoGSD5OlnA5aXW2WeTUvxPDfXWbBlvDO0vPrc9Dv47ph9yp4EkY7r4HLSfPY9I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Sat, 4 Sep
 2021 16:25:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.024; Sat, 4 Sep 2021
 16:25:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, hreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v7 09/11] qcow2: don't reallocate host clusters under guest
 operation
Date: Sat,  4 Sep 2021 19:24:26 +0300
Message-Id: <20210904162428.222008-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210904162428.222008-1-vsementsov@virtuozzo.com>
References: <20210904162428.222008-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Sat, 4 Sep 2021 16:25:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7af56da5-f192-4f56-6119-08d96fc08c99
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6904A8DF34AA1FC6B7883587C1D09@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VoUGl71bORnv1KJ7ZWxac7/jG7rek4s5GiHKHMdI2NYEeedRRl1GpIaawLo0SgQJOIxv4NHHSWC3/84h4ixrCkm6fnrG7UWrb6PJ8RXHzPiGEfgM/7oNDmauqROfj92UPLeOVvPg8zXdF6wwrW510AjRmixAoXGVWP78MBX4msfxPqFhtyORAfYj/n04wDlpuPCmFnvbgDAJiCX7IBuxzpO1wzMUSCNAQpfSLpgMs7xJuzOzjvkQAPiov0srwdAxHNcNcoVo6+p+RzFKXDrIgba6J3y3KAbrv4Y17PW1gSpsQWneIMJZFwe3AaBdoiTrv5410NZl1RXv0qMBTylB2Rcf/T4EHn18y6/r/BykUslrIUf1CM5uLfRfHFsiAxISMg7Nznl4UZny4pvbQs4wdutg3jK+CE6JhuB89RVapHBlsNzLCtsvya1ryQ78Rb9vN61vWju598LTy2CNkI+wgdXQgjksSajWsDFw0VNNgItWpet2fgagblfRDZUgSP8q0izNFq9rMBExLNpIYK7kP81HkZ06oF+3ZaOLGwec5zgPAuv5fMPdkNaT++hS6xnXcbqUFyQcv0O30YOMEvcHscuPz7RdPg7Z6ZifhuH5B+guS2KRKelLVcxeZbZ+mDnHo09GU25ejOXtuKjptkIvDJDp5NggVGFu+j2dYdXVW8gbYl41lGLdbQIcd09GeeK6eyrUlVNc6H9dLapkcEci0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39840400004)(396003)(366004)(6486002)(66946007)(8936002)(52116002)(6666004)(83380400001)(478600001)(4326008)(38350700002)(186003)(38100700002)(5660300002)(2906002)(1076003)(8676002)(6506007)(86362001)(6916009)(6512007)(66556008)(36756003)(26005)(2616005)(956004)(316002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PABffIRenxw0lP6K1tT00TNJefO/5T6F3d/ZAk9fGCJchYRKNoeYw9IJC8y0?=
 =?us-ascii?Q?C1lmmmv3pcbT0jmtybIr6rL7zoFLmPWimX6Nz0e3aazTk026BlrMzpWHDXdG?=
 =?us-ascii?Q?uhatuYjPej3E3n42u968MRbSQzrhknrbh8KSAZ0xD11PnhM6nl5+gMbYn/73?=
 =?us-ascii?Q?O41BPR9ojO2Mjs4uLP4vSiIdd4VJpJEasa1HDQ/ieJt1l/T0PXuZGg3nQfY/?=
 =?us-ascii?Q?p7w/XXBD1jywsXZequGia0I4GO0QifkpZiS1leBl1200iIPyZ1BExfVmIoHc?=
 =?us-ascii?Q?aGuirS6fLxx4tHFijqlIE7fmjeSfYBXB3PRDYUewcbAqzMcYo0jZeooT6HF7?=
 =?us-ascii?Q?j6q1baWHA9/dflzvoYHXBW59z5Gba0o7Mjeevh0Z/IZ/wuRG9brE1FNV6tcr?=
 =?us-ascii?Q?xiwsb8BtOSvI71wm+lfBtPWuBoEe+DuFZoAPwax0WLa6xx/f0gYCjjBn72+A?=
 =?us-ascii?Q?P5oIIsxi+wdvm/JCRY2YmYVtd5szotm3x/QA5qH3fy+ADy9bIbjWwZOpEq4Z?=
 =?us-ascii?Q?hKlJwh6P7E0QAgKPPY65TKMlP4IRhx8Ho7jbxE2Vcpssn6LBYi72jZRw5ugf?=
 =?us-ascii?Q?gJo8lxWGCF+7Hjd6YrTydgxYE8K59YTDc4+yWICstOK8o6PzUJDJAGU0UxKR?=
 =?us-ascii?Q?w0bQhf6bl5cdrJbaOR/RorAC/3uNSG/ey3FyC9hAvoJ+qwZmVYslXItz/4Ty?=
 =?us-ascii?Q?4gSFnazeNkg0MW/7yMzNKq3o37tn4lS56Fe6LDjCIZQyuWhWnEyZZz13lTC6?=
 =?us-ascii?Q?+FMMM1z4KL7tqacE5EWa80JAEUoADS6W5ynBOXs+8cFu4FYXTJ3RhEE2Ulw/?=
 =?us-ascii?Q?XnWyfnSsHaYV5Xp5tyE3GYgWcShpS8Aygo5Gs9N4oPkZfX7AwMCu6poUmt+1?=
 =?us-ascii?Q?y8eZMfXR7G0gxBqI2XbHBVkpOFbWyD5kdbDNEsLFfPNc5qdVZLtuHr0R1ZSn?=
 =?us-ascii?Q?IfNryIfL5JAepGb5oyP7meJvXc0+V/T6UVkgJr8UxholXJiOJFWD6tTHph8n?=
 =?us-ascii?Q?W3ojkdaoivSIHk0rt7nHH375ZADJab/EhFijG7wp7h2bgsJk2/L9NnllUMar?=
 =?us-ascii?Q?gaixk8prgAQbgmVJrh1szPREjDYnEs8MlUKNEJKGa4Cqm+zE9oUHTGO4Yj0S?=
 =?us-ascii?Q?BW+agDkVuQHfeG45hFVYxpFk6B/yD1dZA/iirOl0bkhe/e0UONm0ThoPJisx?=
 =?us-ascii?Q?uG7rvc6JC8VJuu+JFKvCA7GdU8bm07Fx4YJorIgzSw3oJ7lwA+vWQIwicDO9?=
 =?us-ascii?Q?zN/fDxgthKh/IbfogEot7CBFyRl0GWQqjeex4TqyLKwrgZl5ss+RxR5azZFm?=
 =?us-ascii?Q?IdDUUClO41XbEfk+dTC/eF8J?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af56da5-f192-4f56-6119-08d96fc08c99
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2021 16:25:03.5878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8w/VXDZrSQh+1VEbdH+rFtRkxT7IeMa6CqAk3Xx4FB1LFZj7i1bR/TQeK6IAIaWseStK4zUn/aBIwtGWGcaOWnWx1s3W44EqH+RaxksfDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.21.102;
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

We have the following bug:

1. Start write to qcow2. Assume guest cluster G and corresponding host
   cluster is H.

2. The write requests come to the point of data writing to .file. The
   write to .file is started and qcow2 mutex is unlocked.

3. At this time refcount of H becomes 0. For example, it may be due to
   discard operation on qcow2 node, or rewriting compressed data by
   normal write, or some operation with snapshots..

4. Next, some operations occurs and leads to allocation of H for some
   other needs: it may be another write-to-qcow2-node operation, or
   allocation of L2 table or some other data or metadata cluster
   allocation.

5. So, at this point H is used for something other. Assume, L2 table is
   written into H.

6. And now, our write from [2] finishes. And pollutes L2 table in H.
   That's a bug.

To fix the bug we now have guest operations tracking. The remaining
thing to do is to handle these in-flight operations in
is_cluster_free() function which is the core of allocating host
clusters.

iotest qcow2-discard-during-rewrite is enabled, as it works now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-refcount.c                                | 7 +++++--
 tests/qemu-iotests/tests/qcow2-discard-during-rewrite | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 13b1fed43e..e71bb9b089 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -962,7 +962,7 @@ int qcow2_update_cluster_refcount(BlockDriverState *bs,
 
 
 /*
- * Cluster is free when its refcount is 0
+ * Cluster is free when its refcount is 0 and there is no in-flight writes
  *
  * Return < 0 if failed to get refcount
  *          0 if cluster is not free
@@ -970,6 +970,7 @@ int qcow2_update_cluster_refcount(BlockDriverState *bs,
  */
 static int is_cluster_free(BlockDriverState *bs, int64_t cluster_index)
 {
+    BDRVQcow2State *s = bs->opaque;
     int ret;
     uint64_t refcount;
 
@@ -978,7 +979,9 @@ static int is_cluster_free(BlockDriverState *bs, int64_t cluster_index)
         return ret;
     }
 
-    return refcount == 0;
+    return refcount == 0 &&
+        !reqlist_find_conflict(&s->guest_reqs, cluster_index * s->cluster_size,
+                               s->cluster_size);
 }
 
 /* return < 0 if error */
diff --git a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
index 7f0d8a107a..2e2e0d2cb0 100755
--- a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
+++ b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
@@ -1,5 +1,5 @@
 #!/usr/bin/env bash
-# group: quick disabled
+# group: quick
 #
 # Test discarding (and reusing) host cluster during writing data to it.
 #
-- 
2.29.2


