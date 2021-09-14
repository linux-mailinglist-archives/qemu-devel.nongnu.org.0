Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A480440ADB2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:28:55 +0200 (CEST)
Received: from localhost ([::1]:43364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7YU-0004oh-LP
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7V9-0001mi-NX; Tue, 14 Sep 2021 08:25:30 -0400
Received: from mail-eopbgr50116.outbound.protection.outlook.com
 ([40.107.5.116]:58241 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ7V7-00065R-PD; Tue, 14 Sep 2021 08:25:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UegPbjcE3eLbBfTMVpcpNkvgmnFnyWkUDh/ZjTGcClu3szChMcVlZ81PwfWQdrCnbElfQE8GXAFWZVGXfTB7fcoPD+Vb3zOjzoMa0jF6RQu95CoPc9oyCutfftF7CfEorMEUVqPAz1i1zMsGvhM9+R6v+wV1hXglKPcXkD8uAUXs+XKUN6mIR0LB1Fqk8BK6ipwp5pOwSPEHMLktEqokmTMvwt8wnLC7LMUD4PqgGP+lpokii5Lr+a8pptWmUzp9C+uq9L9EmPns4fH9aXha+RCB6tZHLBCNARmN3AJyA0F/tNyRvZmOS9NTLu2+OzFIeftQOHsrIgaHB/cGXH/xtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=KWpJEs2ax9Fm5ZtED2XL1ytdm+DemfPtHxDHmT+2ZtI=;
 b=Qj4RosI/tH3n7VnMpETbTPB0KjAB53aGagIGpydMQBZjbOYWdW8LEbqSqMeMeSIYVHatNaz7kp8fxab9zvEXz/xLl3i5ZiyZNRsQqDpQK9ePrZZDb7X6mfRnWbBid3KXLSGGjiukOVYV+dVuoHLtvFUeYNvfWl5F/vKEPbAOzwJVw1vTAbJK/k1xapXOYbc4SoueQa6/ZFbRIh0bCbP83eDYVSeBacYSKRP0Hp5yekhDcZgJnBpu0fG3PARJfFY6oseMmtku5TQNQbjEv3UXIiP5eMr7TCtBrjEuR9rZJoc0VW7Zb49yhoeB4fMOfsZGPktAYjawc++Vkq9fI04FvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWpJEs2ax9Fm5ZtED2XL1ytdm+DemfPtHxDHmT+2ZtI=;
 b=kD8EarMCbM1b/VLlvbLgowEtZj3j4GN2y3dBjc27VOVxpcrfcwMIadPsZEtglTQ+AcXTfCO+B8MJ3UkRb6Sr3o5O0V7kFkN8ctSGBrX41QYq6Xqg/Rw1EsLU9d8b1uAbq3jfE36w6444qDOFxuaT+YRu/LTiDqhlR50xKssQIn8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3158.eurprd08.prod.outlook.com (2603:10a6:209:44::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Tue, 14 Sep
 2021 12:25:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 12:25:21 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v4 04/10] qcow2-refcount: introduce fix_l2_entry_by_zero()
Date: Tue, 14 Sep 2021 15:24:48 +0300
Message-Id: <20210914122454.141075-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914122454.141075-1-vsementsov@virtuozzo.com>
References: <20210914122454.141075-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P18901CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P18901CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 12:25:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e58293b7-2648-4c6a-4af0-08d9777ab884
X-MS-TrafficTypeDiagnostic: AM6PR08MB3158:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3158F48F44FE9A933DDF7DD5C1DA9@AM6PR08MB3158.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JIPvY4zhKN1IbTahf9oJGYsxSf+1jCvz0VEypyaSId+HrtBhyWG//r5CNIAZi2e9moLhlEFT1R8LgkdXpn7B78AXTWy/jPwO0WfHGHSVUwAXa2+P1cAFFpxLKFeiPgaQUZclTEAjdHk6S+DF+1VMiNQyhmOMZv2rJTV/eP0ECzIirp2HqY900uEjHFKDkagJ/zJg5+qKXE4dzsEsKniCq8mboQ7upFqv1bFF2iiWQQSnaTTEEZ3l/zfEwetQuEM5kkx1G4d8jNUtdEMhxorRQh2O4uGD+8ULt22M585y+Y8P8LidIOChDab5XE7rfnT3cj/2isXFkm9/rZht7cpCAY47fxaPSin6Xzm/yItnU9p0nHWmQBXU2YGuwGPi/Gx5+pWJwZ50L5woyJEpHMdVxxgNBooENWxeEeUHalxMBqwbEQTZAk7KFGx8ItxHzKmeO3eSbwW/HeC/ElHeLt+k+Y5ukptqD24Ea2LL211TSruzX3jBu/N8xP8CMDNbt+bWgtzsyvxlPB7Bik4/26/kLaCExu66Fm1+tg3jiFR5q52FHaPSHpFVsn46dldfpTMG3EjFeQzBzM2SwxV3AfhzFJ9wP7+Anl/pxjoXhakKI84CtU3Yhk49kXybyIJbZxWLTKPL80ibKlwk2c232Omv0HE3v5mC+FbgDAdFsi3lHqrVQe/s+3yd3FQ1IyR5Gje+58CkGS33kpUFMFiqr2fMlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39850400004)(366004)(26005)(186003)(6506007)(478600001)(36756003)(38100700002)(38350700002)(86362001)(8936002)(1076003)(2616005)(316002)(4326008)(6512007)(107886003)(83380400001)(6486002)(2906002)(956004)(6666004)(66476007)(52116002)(66556008)(8676002)(6916009)(66946007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T9ynxrHSGiCBeJ26KytEkRYiKFYKamdc3f6iL/934yrEvUvxXZgFN4jtEVNt?=
 =?us-ascii?Q?RhaX5nByPzskx/Im7p5B2Y/tJI2BmdVhhgapnGl5yMyJQh4Trd0UXVGPZbFE?=
 =?us-ascii?Q?hT7Vgp1h7067gZp234wt31Xdf1pZSLWL7+1ZTbHmIagbENDtv2VBpb67t6NQ?=
 =?us-ascii?Q?g+VyYXiBeuu9K7HpkjU7ODlH3GyBTCGbK1fDcCsUJL7jt0/2DWsbcVFboYWl?=
 =?us-ascii?Q?QJSgeYxDVEV2S9QJlRRXWo5nahMlvqlbmxaLCvkIhg0b5DXIQGwlvcrxF9cK?=
 =?us-ascii?Q?4AwPFHbEwizd1g8DpHwRHVPS4BS4gfS3Z/K/hvASQLtnd3Cwr9IteJebtfDM?=
 =?us-ascii?Q?g8Ef1pt/MviN9uIp3XVm+bgW/kaKfpMTLVtfztx90ogekez2oxbZbJGpbMeo?=
 =?us-ascii?Q?+OONNqLDLpw39nb06o3dpFUVsOKIqnteXZ+GTsyhVmAAY92bhVLluLZpu7Fw?=
 =?us-ascii?Q?uBkdEiQMR6nDaZSSVXi3xhiaK7JgGxcQDz4Mu3J4DgQoh1cncuCHUxKhWrPr?=
 =?us-ascii?Q?9r+IXnP3Im/wMHBZc71HbhC4nAJSyRJ9iP2VdRrJNoXoQ4rVclLVG8kRwF81?=
 =?us-ascii?Q?QeZ+Gfym5pzHlEFEbpOn3Zp8m9/TGz+lCHHjDgKah8mtxPyPlsvRqoNWUtW/?=
 =?us-ascii?Q?r2L8zPABsf9fWl+l1oVnjq9x8G5GRWE4wuXZkWkI1IllvYF9YMVXCi33nyYE?=
 =?us-ascii?Q?T3RiLgVTc3XDIePiAhA3zb1hh6iu818JtLIsmj8HNE7nfTtkaAEvPMXvzK2P?=
 =?us-ascii?Q?iTsDK1Gvpk8SLhxQSYUEH6uT3ElIxW07i6oLczVH0+5MTxRdpAoXs+XpHNsq?=
 =?us-ascii?Q?dTOobaEqNAiSkTFXO93bgcNGHIK3kTze69MU3OB0HE0T12DEHyG8Wb8qgoH3?=
 =?us-ascii?Q?2onu6MAT/NDdcakzvIdimFOVUV3GwUTwo4t7ZAoZ9r4HBxLWMbRu0q0QCxyK?=
 =?us-ascii?Q?R/VhotpnQ53fIipecPdhuH0UAL1kdsQ1MaCmrMv1MLKqd5MueLEDgmLMgDNk?=
 =?us-ascii?Q?W1uRbZXbNZpbU5dv/2S1S5RJDzcMtS5UqqerbcKn8Z9fx7Xsmj0eOqihNmzP?=
 =?us-ascii?Q?zV8/qikWSz/5y4tqFFAUK4uLdNyIrmBL4mCFVA5BxybKPBA5Ot4Rwez+xfUz?=
 =?us-ascii?Q?lyCpvbb7g2i8xafB9bfNV7T7Qdmrs8cISYWtuXuC45ZaDEDIOXaJUnNS+f4i?=
 =?us-ascii?Q?tOuIq9Rk+EHPu+4UN/2lPS/rBwSPbRZtrnf19Mz6xRh8yf/NmezOeBpxEI9/?=
 =?us-ascii?Q?Dega4g18DIfYq8BzEGaU1psa6qGDnii+tCHOYL8yYEYHGEZLQUwA/D3xhb8Q?=
 =?us-ascii?Q?3Sq69gxyVUElKNMe+lRHaJ9e?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e58293b7-2648-4c6a-4af0-08d9777ab884
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 12:25:21.7408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJPsrDMbrJHeFvjD/W6JI2bav1H2SttajSxRGwEEUJkg2vimipZrd2dUwJVgBVOCJnPcC1sxNB1ZFqu/W/5YCu8aQFou54Tn68lT0yXt/+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3158
Received-SPF: pass client-ip=40.107.5.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

Split fix_l2_entry_by_zero() out of check_refcounts_l2() to be
reused in further patch.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/qcow2-refcount.c | 87 +++++++++++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 27 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 66cbb94ef9..184b96ad63 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1587,6 +1587,54 @@ enum {
     CHECK_FRAG_INFO = 0x2,      /* update BlockFragInfo counters */
 };
 
+/*
+ * Fix L2 entry by making it QCOW2_CLUSTER_ZERO_PLAIN.
+ *
+ * This function decrements res->corruptions on success, so the caller is
+ * responsible to increment res->corruptions prior to the call.
+ *
+ * On failure in-memory @l2_table may be modified.
+ */
+static int fix_l2_entry_by_zero(BlockDriverState *bs, BdrvCheckResult *res,
+                                uint64_t l2_offset,
+                                uint64_t *l2_table, int l2_index, bool active,
+                                bool *metadata_overlap)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int ret;
+    int idx = l2_index * (l2_entry_size(s) / sizeof(uint64_t));
+    uint64_t l2e_offset = l2_offset + (uint64_t)l2_index * l2_entry_size(s);
+    int ign = active ? QCOW2_OL_ACTIVE_L2 : QCOW2_OL_INACTIVE_L2;
+    uint64_t l2_entry = has_subclusters(s) ? 0 : QCOW_OFLAG_ZERO;
+
+    set_l2_entry(s, l2_table, l2_index, l2_entry);
+    ret = qcow2_pre_write_overlap_check(bs, ign, l2e_offset, l2_entry_size(s),
+                                        false);
+    if (metadata_overlap) {
+        *metadata_overlap = ret < 0;
+    }
+    if (ret < 0) {
+        fprintf(stderr, "ERROR: Overlap check failed\n");
+        goto fail;
+    }
+
+    ret = bdrv_pwrite_sync(bs->file, l2e_offset, &l2_table[idx],
+                           l2_entry_size(s));
+    if (ret < 0) {
+        fprintf(stderr, "ERROR: Failed to overwrite L2 "
+                "table entry: %s\n", strerror(-ret));
+        goto fail;
+    }
+
+    res->corruptions--;
+    res->corruptions_fixed++;
+    return 0;
+
+fail:
+    res->check_errors++;
+    return ret;
+}
+
 /*
  * Increases the refcount in the given refcount table for the all clusters
  * referenced in the L2 table. While doing so, performs some checks on L2
@@ -1606,6 +1654,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
     int i, ret;
     size_t l2_size_bytes = s->l2_size * l2_entry_size(s);
     g_autofree uint64_t *l2_table = g_malloc(l2_size_bytes);
+    bool metadata_overlap;
 
     /* Read L2 table from disk */
     ret = bdrv_pread(bs->file, l2_offset, l2_table, l2_size_bytes);
@@ -1685,19 +1734,10 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                             fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR",
                             offset);
                     if (fix & BDRV_FIX_ERRORS) {
-                        int idx = i * (l2_entry_size(s) / sizeof(uint64_t));
-                        uint64_t l2e_offset =
-                            l2_offset + (uint64_t)i * l2_entry_size(s);
-                        int ign = active ? QCOW2_OL_ACTIVE_L2 :
-                                           QCOW2_OL_INACTIVE_L2;
-
-                        l2_entry = has_subclusters(s) ? 0 : QCOW_OFLAG_ZERO;
-                        set_l2_entry(s, l2_table, i, l2_entry);
-                        ret = qcow2_pre_write_overlap_check(bs, ign,
-                                l2e_offset, l2_entry_size(s), false);
-                        if (ret < 0) {
-                            fprintf(stderr, "ERROR: Overlap check failed\n");
-                            res->check_errors++;
+                        ret = fix_l2_entry_by_zero(bs, res, l2_offset,
+                                                   l2_table, i, active,
+                                                   &metadata_overlap);
+                        if (metadata_overlap) {
                             /*
                              * Something is seriously wrong, so abort checking
                              * this L2 table.
@@ -1705,26 +1745,19 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                             return ret;
                         }
 
-                        ret = bdrv_pwrite_sync(bs->file, l2e_offset,
-                                               &l2_table[idx],
-                                               l2_entry_size(s));
-                        if (ret < 0) {
-                            fprintf(stderr, "ERROR: Failed to overwrite L2 "
-                                    "table entry: %s\n", strerror(-ret));
-                            res->check_errors++;
-                            /*
-                             * Do not abort, continue checking the rest of this
-                             * L2 table's entries.
-                             */
-                        } else {
-                            res->corruptions--;
-                            res->corruptions_fixed++;
+                        if (ret == 0) {
                             /*
                              * Skip marking the cluster as used
                              * (it is unused now).
                              */
                             continue;
                         }
+
+                        /*
+                         * Failed to fix.
+                         * Do not abort, continue checking the rest of this
+                         * L2 table's entries.
+                         */
                     }
                 } else {
                     fprintf(stderr, "ERROR offset=%" PRIx64 ": Data cluster is "
-- 
2.29.2


