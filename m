Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FA466B23C
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 16:59:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH5P9-0001j5-U6; Sun, 15 Jan 2023 10:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P7-0001gq-Mo; Sun, 15 Jan 2023 10:58:41 -0500
Received: from mail-db3eur04on2130.outbound.protection.outlook.com
 ([40.107.6.130] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pH5P4-0001Kk-Di; Sun, 15 Jan 2023 10:58:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uu/n7WoIDJd5PTk14oUkmt7UMBO/rEttVhPFypW9c6lkH8cYaeEkCIlB+5WfGGDIm1XQLX5ijaXo+hG7RnlLjvQ6doGNYOxZ++OGkGlEHDV0yP9lGMlMMoRwEIv4KxUvuhl8pFqyC4OsJIqLZrzC5AMdlxOL2IqtVSjJxtLEcPa2OIeKbI3u+Mkf90L2CVR2AZ2gWMgtBdoeBwHDMRwgLux5MVr2vm4yXHRdVehXIYdKQfSQyRim+skueKRjd3oQuVIHW7zGQ+QepkISNEYv278f94M9aw1xEQcT5UU68uIzbbtfyTzN3cDmlIydWDb7xvQm1Z5fR+zGpYVF27gNhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3z9C4Ki+nBn658vBnYINdNZUbUC/HBRqTWRxLV64hQU=;
 b=dgklA/a2e+4kwQ4coV4app3XkHuzdRiyVpaOGYXQAKNmk/pcEfTN1ILTMVxCh1d7pNX+Er1LJnPsjsSD8VnPoDbdKuKV3JGyUm65nbX8t4KCnmIW/uw8kYg6jTXch4e57t3oci7/ceR/tavzp7hEFnlQz7mMK7ZVyB1qCIOByQBg7vNwFurOfDggDmxyxRgK5T3e8QFzZDK8gramYi4yXS9q4T554mN+hnPfqjHKyUCC5yPhdqaMCkgYV2vZaRCRcV+jCFtfkVrp5jOID0JF/4AMA9z+zKYSOk3GKFJ0qkO7+Lbp2XBhVFmZV+dotNgJhvNx8rEmIc1qBlEEq0WAiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3z9C4Ki+nBn658vBnYINdNZUbUC/HBRqTWRxLV64hQU=;
 b=PchoVp/aXY6lWCAB22q89TfWuDRl+lQIjOG7ltTY/vPWiRiPA1eB0NOVH1X03CHNnc5tAczm8B/pLMSe7n4HULdibBBNIeav5bqcf2BbR4ksstbAoVMBXLCvaVe9IPKG8Lz71cDPmK+B9GCRqrVtQC5iDVRytRuRfHERSVAKgXDU1FfQqzepC1YJC7LUmBKg8oxO7k9XE/o1aQIf40G0855XmYpOicIaV/oSZ4FBJOE531G4/ScM424/SyPGUI8dRiBHSO1XzJuQ0KHa1cSJbtUPIrCMFBicI4wjLI0xbzJqypUIlBmFSa0o/SfGxQ5HzC2nud1NocLd2DYFIfhv2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB8PR08MB5467.eurprd08.prod.outlook.com (2603:10a6:10:11b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14; Sun, 15 Jan
 2023 15:58:33 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.5986.023; Sun, 15 Jan 2023
 15:58:33 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v8 06/11] parallels: Move check of unclean image to a separate
 function
Date: Sun, 15 Jan 2023 16:58:16 +0100
Message-Id: <20230115155821.1534598-7-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
References: <20230115155821.1534598-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0312.eurprd07.prod.outlook.com
 (2603:10a6:800:130::40) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB8PR08MB5467:EE_
X-MS-Office365-Filtering-Correlation-Id: d10373fd-eb59-4103-1f5e-08daf71159e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QXZIFMOegOWK9WpAGrRI1f1td/yFDQBlti7qYldVSvayetY03kf+VSyGzqgTEFy6K4rXT3l9M3tdRE01W6BW4R7oFjpXHyuDC+5ENHcbg64adPy4lws8TrD2rJVj+dz9zNNv7ds63ZwuLUVnKFtCpz1rzTV1JbTby/u0KEhVWor7CKB4gtvKkq+LmF8EQWjNZrlRHNW21hReBBL9PmFgYMtNGyLyAZjxYbpqBnxNtUg3IM0cCI90WQ2q3IWJtB5uVYd62o5Ur/uSIHoY5hM3FkH85gp3MkWvWRDKT+wAhS8fD7VxQuOYJCyUFz6pWhX7sA6cQ4rXKxzilgxc+I/MAXcAKE7h1OcKWIwQktPKugp776Sfkd3bhJkcQXDYeJxyx6v5eLOwLqEb4TFri7hRh1y609DOm/xkQvc+HTA9TKWv4wZFUYZ7JqGITFsHB9PO4+t5bSUvoQ9z/FSSAMgB4h9pzM37Hc6FQitjTOnRuu8a2L2RB4+vr+uP4oM7OjXdnz4IWsfM96+Ge63WqNgQlsl5X2XRCoAWl94jUx02+TRJFsFr5koc1GI3n8rYHFjHIPV3HqtRpRuJC370k5fEo1iNyyk0Jf3DUkaPv1kifIXHT9u3N6iEswEsDO8z/OKSNjGFRbxfixLHJljmtD+nO5SiFqoglsh0GBnE1Wk3/fbQ+rMi8NgyouksIj/daLwh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(376002)(136003)(346002)(39850400004)(451199015)(2906002)(86362001)(38350700002)(38100700002)(36756003)(2616005)(6916009)(1076003)(52116002)(316002)(5660300002)(66476007)(44832011)(41300700001)(4326008)(8676002)(66556008)(66946007)(83380400001)(6506007)(6486002)(6666004)(8936002)(186003)(26005)(478600001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zhJ7GMJBP8C6GmMag5b954uDGEhXMJ7SQujzAqTSoIHXcZvtzjUK1MhZgsne?=
 =?us-ascii?Q?1YSXZiaHLuLgEOJkibvhskqAvnIJp41JW13FG8DjW76RwZoi89xjzFYLhSFO?=
 =?us-ascii?Q?Skncp92eWqa3xRIwrzepfYYW8A3C2mLQplDzC9jAdl/AFw8vgd+P0/pqSPZP?=
 =?us-ascii?Q?PaG5z0pottorb42vw4r6rm/law102WpA1DeuZ4OF8wlmhZZ8iMVrg/8GKVy6?=
 =?us-ascii?Q?FENayacO7xbNFOvkZqbfT4P1+at1yQTml4fTMD4g7nbu/qPZSwPYMQWkNquG?=
 =?us-ascii?Q?N2NkSk4piU4x2fiJjyDHZg1aU+l0/KM2uYcy0BL9tZ29No7bWIOygVmc+Hfv?=
 =?us-ascii?Q?GAdgHV9TiWwAhkqh/LzA5JEHUjL9TwI52D7NoZLa7bdr6jX8pw7+Db7mDnXO?=
 =?us-ascii?Q?pidN93zwHo9ihAz6RtpMxdLCW4FDYBikPRZGH1r99mKuXZPHfFVPIWA+/jbA?=
 =?us-ascii?Q?FsUebIEaYsMPks45qcmtkvOtq73jO3wDTQ6n4BnJXa90rpgfcfBtOpe3CemB?=
 =?us-ascii?Q?s1sBQIjmg2sKYZCqfmohRpMIP4EaR43vX857pwutR5ZXfwkuYtjEG2bn2L4a?=
 =?us-ascii?Q?ScM7WY1yUEwmHEgjIZsfjsa3F4UWkiv+LVa6JSRtU+Hy7wPr5qfWqNmd5Q7k?=
 =?us-ascii?Q?0vf0aJUossAB7TEuaXzmw+LO+jN4vscKG0E7VIG0R2QzdicXxE73fHhP6cXX?=
 =?us-ascii?Q?OUJJC1AqcEmjogur0RPbaVh0++d5RLTOCts/ysMCqkwFOB1LHs26Ez69W+56?=
 =?us-ascii?Q?mDDdr+t9WwMbIQnZM+l2WxsQmhxd9WIh9TsBCum6nkq8k0bjcrsoYOSe5YNP?=
 =?us-ascii?Q?Cdu71qA1MIzxoFpG+OhAvsVtHkaVPteIVUMaXbCShigo+EgDpxDk1jmOGwFj?=
 =?us-ascii?Q?3TScqSas682XtmjHH21KWwU29wEu84ba4w4GrbptGpS9oV9xMpJzr4U0rmUl?=
 =?us-ascii?Q?pFKGKI7Bx4EJjZwEk86K2EqzOgNu470ew7EFvBcYNDSFM78Jnfwhj7PfKyr4?=
 =?us-ascii?Q?XyvKATLV+WvSK3etCEmSJC2St2ebc0x1iOuoNANTRjoQ5UC6I2roONvqR5oB?=
 =?us-ascii?Q?o6G4n5c6V24eR1z9QZjFKnaOHsnePJBhzabbOJdDHK9kmxuHbZdho4cTCcA/?=
 =?us-ascii?Q?LYANVy5VMSHV31qne1ZMUv/C8/dcALxS4PP1XrK14E8ulp2RRfOIsPD+I0Z9?=
 =?us-ascii?Q?jEJstI95JoOdSOjO4bDhPIze6SF9K8rkViiNaUWFJyO/dAF/CyxW6TuM3z6p?=
 =?us-ascii?Q?uTPuBgk3FkR7MFHyb5k6f6MOuVHdpPbp3yod4+OUw2ts/QSK0QbT9gqJSHGm?=
 =?us-ascii?Q?QvD9b/Gyz51m111u94M3Jkn7E0P43vfF2hPTtKDm/yLxQwgu/5kRUqtlZX9V?=
 =?us-ascii?Q?NzArKaxWe1RGmPLfl1cwHDtUNY5yo6UyvSTjQwQgy+Ydj3gKI0eupFhVtg5p?=
 =?us-ascii?Q?hXNMv7EBCEkPZ571WG1WccITxGyAwWf06DkvtXDDu7oNozJHZiNm8zWsyoKz?=
 =?us-ascii?Q?+SnzL8ZtVrhBikxlr0G+NUcpf0EqGbPZt5TBqLXQx4yKU4fh/TzFKAJqjkTr?=
 =?us-ascii?Q?OaJ0hxShZ5NffRleBumD9Q66dl+L9Va0e4l4f69R5qKy5d7kZ/Zbc6OjEhTl?=
 =?us-ascii?Q?+L0B0Y72VQ2tKsOS0vdwrrM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d10373fd-eb59-4103-1f5e-08daf71159e4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 15:58:32.1911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5E/3eTzTxNZ7Ubx/QCMRJgzsshLdt4DpVKjq5JjAxs1XxhWcXxn5emZDLJeLygoYoi84BEZEbDTX+hGjUM6J1DE7/IqZw5upZPUFXwaWivE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5467
Received-SPF: pass client-ip=40.107.6.130;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 3ca4ec469b..d48b447cca 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -418,6 +418,25 @@ static coroutine_fn int parallels_co_readv(BlockDriverState *bs,
     return ret;
 }
 
+static void parallels_check_unclean(BlockDriverState *bs,
+                                    BdrvCheckResult *res,
+                                    BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+
+    if (!s->header_unclean) {
+        return;
+    }
+
+    fprintf(stderr, "%s image was not closed correctly\n",
+            fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
+    res->corruptions++;
+    if (fix & BDRV_FIX_ERRORS) {
+        /* parallels_close will do the job right */
+        res->corruptions_fixed++;
+        s->header_unclean = false;
+    }
+}
 
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
@@ -435,16 +454,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     }
 
     qemu_co_mutex_lock(&s->lock);
-    if (s->header_unclean) {
-        fprintf(stderr, "%s image was not closed correctly\n",
-                fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
-        res->corruptions++;
-        if (fix & BDRV_FIX_ERRORS) {
-            /* parallels_close will do the job right */
-            res->corruptions_fixed++;
-            s->header_unclean = false;
-        }
-    }
+
+    parallels_check_unclean(bs, res, fix);
 
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
-- 
2.34.1


