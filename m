Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEF63A2A76
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:40:04 +0200 (CEST)
Received: from localhost ([::1]:56474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJ2Z-00013b-HO
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpt-0003f8-Bq; Thu, 10 Jun 2021 07:26:57 -0400
Received: from mail-vi1eur05on2122.outbound.protection.outlook.com
 ([40.107.21.122]:49376 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpr-0004NZ-Cd; Thu, 10 Jun 2021 07:26:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDpSCQ6LzCLgTiVHAuNq7j7qSEZGtlDvrDKJpoZVGLCjCeQ2zCYHa+oUu5szXon/6oNa3r/+jVIfDG+y0kJ3FebKPGFljl3DmBMOr6cAL2Z7iIoV1QjIgfUbVODKU0pT6iXpvXDEuHSSpZkahd4XJ4TMza3yIbYwWHouPtDbSu9wVFWd0V5hrXfRmCQxG0VvOWoou/HpqS6adAjAWviHfJJ4QVV6+cVVy2XHZnn1udUSvcK6byDQb8yVHEYFX6hfGWSEqF1GffIJfU6WshYKhDOwcGXA2STT9Qm1GEWSle6A9gcL2RQJrUU0IsJOhhweO4HWCcpqQcMH2Q/QGsnfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDvvfdk+qNZ/K0NLMJ1t2U6awdk74v/hZzY5n8Jf9Fc=;
 b=n6zi1zJ++9WdVrgNMxQf7jL4bz0nNs/BfEtMMCqprdGVFEr1m3N4xv34RFegiz4BBVjNk1L0E0tgFBCGkhUu9s+oQn6ykO/GNQqgCBxxxFuq9YISgpnCpm/oD+ncMNXZ//C1ETsPXmKbueZRtajco7a/C675+2yvyFzyXWNtoGk+yeCgMIjteOPX5IUIrjtgsJRmiTG9LZGQVDCRJwi/yW6lWP0Fu/oWHahDQ1/hyGuxUKL/AJlAnWaNc13cVo5tLkDAWxtIwBocAEOH+W4Kht+bvipSLzpNXKsCbqiANyJqKC7QJqRxABUAJG0bPs1Z3v7yCudy3nqbts44Hk5y4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDvvfdk+qNZ/K0NLMJ1t2U6awdk74v/hZzY5n8Jf9Fc=;
 b=WZvsIWDRh1T5o4ywaUk0d1GSKBCtjwtITimhjTHXo4ICjiEAj2uWc3+ODFG5qmeZ9Sq+Zf1TlSNpaWb504NdFSCuEqQugzg081sPkMI025GagOfAln8ZY9E9X+nC6Tzo3lQvs1ZUKIInnyBnAHMOC3jxOV/6PE+XC6DF5E3VmNc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 11:26:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 09/35] block/block-copy: introduce
 block_copy_set_copy_opts()
Date: Thu, 10 Jun 2021 14:25:52 +0300
Message-Id: <20210610112618.127378-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7cf7f4f-3628-44d8-5552-08d92c029ff9
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6280E2EF7BD423AE9B0EF776C1359@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:85;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nkPqsmBfdrQXqyxX5mXZ4Zwn4IemOMluR4L4IAfq/98oj/rJosAuw80Lqe9DB6+Is74MYZiZPMQJY26KyutFP7zQhGVzWFEWzm5s+ZjYAQXpHqf9FuiqT4PE+zZ6PPrW4JRam6ztx1tgalDLRxE/OwU8a6B+QSTSY2I3enCu77s3QXVfNhkVDSlxb3J4yaqf8FRJmJrZqLxxnjvd+L2cRnrlW0tc5MSunNsiW6DFK5gAh8wnLgv0Nb55dHLzSVp7GuqV/bU4NBpSjQCsC5/m34+Lo7rn95xYLDif6CcjAe0M6Eoq3Ib7vD7I6r5HQbpB5TQ+SAx2cS9tjFg8pI1rWLi+7Zsj82DgTIyA9ATij+2piQaz9jxtbTZ1AIrri+AsDopCzEANOZH9LMuPZhbUIGQ0iug7wr0fk9LVcnbfU8NzW6pP/ZhqOFDlr52eAiGldKMZsGdibpHwtDeH/lIgbHXPhTR8pRmga8EuRbjCaP8EvitOTPzVXx+0TggB4x85YuhA/uh0KiGyyBLeBA3tQcOpU2ox/aJbl5+r5TwaKmrOuKTefapvXIf06IPCXPTE9pHTAdIQnHa2+roWEm70Up0AOCti8gCrzLX7A49LIxDIeF5v3NHZE/KkufhTbxsRzWLpFGfP0fnlc3Q2811tmaG4QmUM1xlRIuOOFhIczo5igl108NRjfU7MLErBkvf0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(376002)(136003)(346002)(366004)(186003)(26005)(86362001)(36756003)(6666004)(1076003)(8936002)(4326008)(6506007)(6916009)(8676002)(16526019)(6512007)(52116002)(38350700002)(478600001)(38100700002)(66556008)(2616005)(316002)(66946007)(2906002)(6486002)(83380400001)(5660300002)(66476007)(956004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bgeIxEgmqKem69McZnaCG1Jk3l0gvbJoxLJfT7aQzY1wSl/X8oJx6+JovVwi?=
 =?us-ascii?Q?iX2ehUbySCWCYAAr5ZgzrpielEu7NHIgFsWvkcLRka0TLVrgxknhGUAAJvuB?=
 =?us-ascii?Q?MenmRtpUjXIMDxA+MP1J36c0mPzAzknY0IMk9dHt7YqRlqAn2Kfsbm0JE5Kg?=
 =?us-ascii?Q?olMnIQYwbBJCNX+7sMeQzYJokCkco1lG3guJ+eydDTZFbohWdPmgFJuPBl4G?=
 =?us-ascii?Q?/aL/gBxGhFgcHczQ+axket/mavV/2A8D1SEka2INuSAxyj2veswDidQoj8Tn?=
 =?us-ascii?Q?IyuLlcKxgpFzqVMt1Sf4PewHIMxfqG1v1QOoirgQTm6K4HdfZe/P+NAXbCE6?=
 =?us-ascii?Q?RWRJcOx8FdiExOP/4SMXike8naqhWIx76cYX179ME3TBmnjM2p41IJdt4WGp?=
 =?us-ascii?Q?+SOm2phWomdwTLNOYcUKZZQq37E5+/DYKb1uxRiCbkMXwK5xkES13HjBmVGV?=
 =?us-ascii?Q?f5TCoaFw5LKe8Hvqgt+ns1pJRScegmqC98ql9uTeiuyhxCLzPb8keimcH8iu?=
 =?us-ascii?Q?s2hmgJ/x+1ZHSVXVqKe5aQgdXgBehR8g5vZbKeZMfeQLzW+CM8nKS33eV/DS?=
 =?us-ascii?Q?Ve1shk0drD4LaAtFmsUbw1cLv+4KDzbzwGrf+VtSuXPxRg1Uav4nY5326cAd?=
 =?us-ascii?Q?iTh7GF9EqsUzGOKMA8ZOlgZv6u7I0bwAKaipv4gHJ7pH+nck2h2BatFfOajy?=
 =?us-ascii?Q?M9qsrwytG1r+dtTrpWJNblvHou5GuFt/B2JGdc+tJemxg5IhfK4QOf57taNc?=
 =?us-ascii?Q?sEZxb2KpMKNfTNENfLf23RL1beJtvhRegM9M1N1/UjevZsKIUOI2sgwlozqD?=
 =?us-ascii?Q?dptnV81VfjBTlotddQ+YmMo2gBLYoKJxO6sXQrfuojVbKMZnDxdF2vW8P5Jn?=
 =?us-ascii?Q?OGMb6lrR90sTDFcL67f48kqfT6trXACjwpNPLq7HhoqQkS7mkyW6cWlOfRrq?=
 =?us-ascii?Q?YsL11g22s+Ca3k4kmKZ9TP7wf2SJMFmwj/1883Db3TlNnDLSFZABTLqkydGO?=
 =?us-ascii?Q?NQjVQZ8r0WTKr8eTQZuuoPAFjBl6GaYj606XOsO4+5frgX88iCfxEnPHgf17?=
 =?us-ascii?Q?68f0P34MrahduI4k1JItb5h8+rloRqicUvEMeaBUQqDfq/JE3ZK8500LSFWh?=
 =?us-ascii?Q?SYBr5Oa1DhOlbpa/Kv+bKdZXTHewJhSowHlud90fJTljg6V6WUYnwDlR4dxg?=
 =?us-ascii?Q?XIk+ERBdwGRywNmDhMT+eoCMk/RDMyc8oFid3NIotm4gTJJcNUnb3h9CQtBc?=
 =?us-ascii?Q?3btx3JWl9yIYIIeEBEGCxaKfsUOykNwj0cCRNkYxZdaRgHsyjp/FkVvEj2RB?=
 =?us-ascii?Q?bu8uoV9LjIcKdMwM+Kx5GjGN?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7cf7f4f-3628-44d8-5552-08d92c029ff9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:43.6135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7uLNQG+oPswaAJrqn4GyzrjsrL0j3efIlOV70pPGiA7zCBDz3jg/DaAkJFSXaF1GS5zqQxsIMAfKeLiN5hLGIiqKPbSmGafF3AMC9D6cwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
Received-SPF: pass client-ip=40.107.21.122;
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

We'll need a possibility to set compress and use_copy_range options
after initialization of the state. So make corresponding part of
block_copy_state_new() separate and public.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h |  2 ++
 block/block-copy.c         | 56 ++++++++++++++++++++++----------------
 2 files changed, 35 insertions(+), 23 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index c013a20e1e..b74fb80067 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -26,6 +26,8 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
                                      bool compress, Error **errp);
 
+void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
+                              bool compress);
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
 void block_copy_state_free(BlockCopyState *s);
diff --git a/block/block-copy.c b/block/block-copy.c
index 22a7c64c10..8baf8b9403 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -245,6 +245,37 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
                                      target->bs->bl.max_transfer));
 }
 
+/* Function should be called prior any actual copy request */
+void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
+                              bool compress)
+{
+    if (compress) {
+        s->write_flags |= BDRV_REQ_WRITE_COMPRESSED;
+    }
+
+    if (block_copy_max_transfer(s->source, s->target) < s->cluster_size) {
+        /*
+         * copy_range does not respect max_transfer. We don't want to bother
+         * with requests smaller than block-copy cluster size, so fallback to
+         * buffered copying (read and write respect max_transfer on their
+         * behalf).
+         */
+        s->use_copy_range = false;
+        s->copy_size = s->cluster_size;
+    } else if (compress) {
+        /* Compression supports only cluster-size writes and no copy-range. */
+        s->use_copy_range = false;
+        s->copy_size = s->cluster_size;
+    } else {
+        /*
+         * We enable copy-range, but keep small copy_size, until first
+         * successful copy_range (look at block_copy_do_copy).
+         */
+        s->use_copy_range = use_copy_range;
+        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
+    }
+}
+
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
                                      bool compress, Error **errp)
@@ -288,32 +319,11 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .copy_bitmap = copy_bitmap,
         .cluster_size = cluster_size,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
-        .write_flags = BDRV_REQ_SERIALISING |
-            (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
+        .write_flags = BDRV_REQ_SERIALISING,
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
     };
 
-    if (block_copy_max_transfer(source, target) < cluster_size) {
-        /*
-         * copy_range does not respect max_transfer. We don't want to bother
-         * with requests smaller than block-copy cluster size, so fallback to
-         * buffered copying (read and write respect max_transfer on their
-         * behalf).
-         */
-        s->use_copy_range = false;
-        s->copy_size = cluster_size;
-    } else if (compress) {
-        /* Compression supports only cluster-size writes and no copy-range. */
-        s->use_copy_range = false;
-        s->copy_size = cluster_size;
-    } else {
-        /*
-         * We enable copy-range, but keep small copy_size, until first
-         * successful copy_range (look at block_copy_do_copy).
-         */
-        s->use_copy_range = use_copy_range;
-        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
-    }
+    block_copy_set_copy_opts(s, use_copy_range, compress);
 
     ratelimit_init(&s->rate_limit);
     QLIST_INIT(&s->tasks);
-- 
2.29.2


