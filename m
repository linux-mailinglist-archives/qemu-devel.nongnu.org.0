Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82FA2F8FA3
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:12:59 +0100 (CET)
Received: from localhost ([::1]:49922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0toY-0004K3-Md
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:12:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVK-0004gF-9G; Sat, 16 Jan 2021 16:53:06 -0500
Received: from mail-vi1eur05on2126.outbound.protection.outlook.com
 ([40.107.21.126]:26209 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVI-0000WU-Co; Sat, 16 Jan 2021 16:53:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JIdaNkV5W+utKAkd713frlgoHnmtWlP56mYEKBBOQQZ4uYDrLNBGPUK7MIB4ZFqhetZT9yYXn7o7jEalGydnsXrSM6eo6veps8ZyLC5NZh4g1XVn+Cz59DwLRGCUrqyfllkk2Z/Vjq+jAVHEXOhYU4eggeVl0zvjqPwQ5Rn4+aiMp4cZQtdL8QZYQI8fxC7KtdqYTtxUNd5LXFg0D5TeaEM3tmNHlm+4iUXluip/Mwg8EZAYLV+DLEk8x5U5T00tephpQzxkCmr+MeNjN1jbByLREdG94DrVmoXw6XySMyj6PySg9I5shZdysR9q6Zcdw6RmHdOhvqp4whiaS9Y15Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zeKglbOSbkoq0KTpzCbKUOHNoM3e4XBjXK1pjimCmI=;
 b=LzvyJ66q5e+KNXRXVgrXKHs6PG6KiLv+wBfjQeAQf8Dh0hd2L+brRIoDSDCCX/HZcfPg4OAaI1gk2mon5MI2bhuu8eGVqVqo31rTOiRtm3bUWS+PIFVblttJO4JpDFCgtaQ6NMc7D9SYMPVQjXH2kPDOKobRCMTC7MxJuo8na6ouPPodIOcRt5EwuiWxRCuyNIv181kY0gnm0nFwWsUsJz8AhevrW9d6gRt8uX6AokpzFJQTftBHPoNSvrGpWb3ZcH+6qv7zy/EKuXXoI4ypHIx51GqzwYEH9dJ3nBInSyL7/alKV12S2K/W3APes0B8OzzXpDAywpcRTvciKeaXgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zeKglbOSbkoq0KTpzCbKUOHNoM3e4XBjXK1pjimCmI=;
 b=UoCvIUXqLEyUgcquE3ebpsmjkWbbX/hxKWVH+WUopOlKJaJH/17R+jA4pKPm2nWiLyqhUYsmtaSJXSlMyt7tGP3vByY8yDONikjG+UjZeWfAYvppHCR2nm5YgYACA1xsr0Pl9bjUq3GHbYMiu/95Nd+yDB+IfMC4hvVWgL73hJA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:52:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:52:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 09/14] block/qcow2-bitmap: improve
 qcow2_load_dirty_bitmaps() interface
Date: Sun, 17 Jan 2021 00:52:04 +0300
Message-Id: <20210116215209.823266-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116215209.823266-1-vsementsov@virtuozzo.com>
References: <20210116215209.823266-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM9P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM9P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 21:52:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 209c109a-cfb5-481e-b7f3-08d8ba691478
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35427352001931616A7DF25EC1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kP+mImXiQAsX6h8vfn51gaAfbCB/EA+fXvCL3qkiWCkK6i2yGuJ33M6kx2W+97X28jll30+ZRP6pd8PXy+lAw2k11rnS7FVPIfiCkz7ogqdeyXDfTymgk6ImCWSPp2QdWUvQjRRa1CfWoUvEdf/bHi+rgBVgCoY9kutrtSdZJ8fhcq0q34GBvS1Gds8m+D+wu9VgouGmzWkj7+wSzun1xIazoZ97N4pUXUpUlMCQMycmtcb6i8i5cvER2MjWk/9NT8TO1pVltlSzwNNCv+gECY7VA0+dMUjPBoNnmN3Ao2uHc7q75IAv42XM6G2AAfWoY2au5HD4za4jkrSaq3SOl2PrjWTPfy6czXgTLogW2N16IW/GfEZBRt8GdqcRJXlpv/3IeEKMGDFxwuOMJeyne4+A7Me8JeD4nxC83i2PV+7iaZjGHgrXeFp9AoGpje61GwrAJpUoC2wCH6l3dIUVVotoHd/DtYtMSrA+nsjPDsNVQ145h+kBaM2hIvZC3H6HFrSB+0J/sYgFSnMUrHj1ATqCXPwhwUje2kkQ/o6uLSkJAZHlwu9wjIV2LgTDXxEP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(6486002)(19627235002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(6666004)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(7416002)(956004)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OzaIE34gBAasuNRToWb+JqgqJlJdcwzSyeoYdvlxCVWdUf7gyZYa5QSmQqzo?=
 =?us-ascii?Q?IcSoVNe0TVPhRpBijim3hixgw7hPt9q8j1s6pPl1c1wQ3DlYWObeWGmYf3GP?=
 =?us-ascii?Q?UsstR13qkTpnL3cFjD+Ya4zm8FNvloApMHIDfHXeRD/CaDJ9adZyCPYf4D7T?=
 =?us-ascii?Q?cL7gMbzNnD73Hy1fgfNdbRvIFMcbmzXUI4vTrULDui0YyD92hxwZNkLaNyoA?=
 =?us-ascii?Q?7WyrYDlCOC0JSsSAeD8SgM5dOFMzkjIUa7HtH/XYyYLtChCcUCkh8EETP5Ip?=
 =?us-ascii?Q?nwAANVV7jfVEz22bP47wtjJy0XjYHOvL1C8folfvEtiVVXkH7wDYzJUuOQKv?=
 =?us-ascii?Q?sH7ncsph/dPGIwaAsWi2Zlj/t+tfyJ9qA/rB28SGBV3q4sHEvuU2ga4sARQy?=
 =?us-ascii?Q?ku4dZayZnTFF4b77i8TBYslsviQD6jeMvjMM7CFIRBcHD3SPMdeuH/y6FyxL?=
 =?us-ascii?Q?epXY+mW6kHJriv2V7MD82R5bDti/Kan3T7UQCgFBnCTIg5SWDRYrZ9vZx2Mj?=
 =?us-ascii?Q?dyVi+gSGObLkl/GL/GACaZPtCoC2Rn9dnd0gAnIbSRhg/FGfYDx5BbH6E0AS?=
 =?us-ascii?Q?uMdCu87FmTlUOSuAT2sHgMbiixW7gkUfbN9GS3g4jeWG2xlEsPKb6oHiTsLo?=
 =?us-ascii?Q?iQks0sUp0H8/tWTksf0z91eEVEaRVfASH+RxtnVMtC0nrgFvvz1Sr2TKy9yM?=
 =?us-ascii?Q?xuwMw4uw70zO3vLpXHuX5jY24T8Lhx2xhVtGCGOnrKkY6YoCwmIL2q4ojNkR?=
 =?us-ascii?Q?ORRUv3fb9uvR22Lv2x4Gwu3cn2DeMGhKe/+ahQdeFdR160rP77nYV65UY2VA?=
 =?us-ascii?Q?w5xeC8PKchM+MQn0W36jRdu6LpMTEUXf+cSMM828+LEg/JGu1e6G8LarpBa2?=
 =?us-ascii?Q?DGzR0bTeOHPYnt78t17fVXO/0iJFUhN+Hfwgvv8RLhimJxASVNG1V8PQwxYs?=
 =?us-ascii?Q?ydqHY1SZPf+or37ki5HzmH0U9ocnLV8tqWf09hSOlBIMDkLymPg/uroVuCcK?=
 =?us-ascii?Q?rMF3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 209c109a-cfb5-481e-b7f3-08d8ba691478
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:52:55.1997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DpMXXI7YojZbGJbzS++KU8ZdK0oQyvJqQD3vWdvrIktdtPEosf9Kdzx3Y7/5dwH5Sj+3f28J/mZMO0HDE0zn3z94NRapWsI0G9X/OwzNhRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.126;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's recommended for bool functions with errp to return true on success
and false on failure. Non-standard interfaces don't help to understand
the code. The change is also needed to reduce error propagation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 block/qcow2.h        |  3 ++-
 block/qcow2-bitmap.c | 26 +++++++++++++++-----------
 block/qcow2.c        |  6 ++----
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index a6bf2881bb..d19c883206 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -978,7 +978,8 @@ void qcow2_cache_discard(Qcow2Cache *c, void *table);
 int qcow2_check_bitmaps_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                                   void **refcount_table,
                                   int64_t *refcount_table_size);
-bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, Error **errp);
+bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, bool *header_updated,
+                              Error **errp);
 bool qcow2_get_bitmap_info_list(BlockDriverState *bs,
                                 Qcow2BitmapInfoList **info_list, Error **errp);
 int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp);
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 55cd52ab96..ca01f08bac 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -962,25 +962,27 @@ static void set_readonly_helper(gpointer bitmap, gpointer value)
     bdrv_dirty_bitmap_set_readonly(bitmap, (bool)value);
 }
 
-/* qcow2_load_dirty_bitmaps()
- * Return value is a hint for caller: true means that the Qcow2 header was
- * updated. (false doesn't mean that the header should be updated by the
- * caller, it just means that updating was not needed or the image cannot be
- * written to).
- * On failure the function returns false.
+/*
+ * Return true on success, false on failure.
+ * If header_updated is not NULL then it is set appropriately regardless of
+ * the return value.
  */
-bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, Error **errp)
+bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, bool *header_updated,
+                              Error **errp)
 {
     BDRVQcow2State *s = bs->opaque;
     Qcow2BitmapList *bm_list;
     Qcow2Bitmap *bm;
     GSList *created_dirty_bitmaps = NULL;
-    bool header_updated = false;
     bool needs_update = false;
 
+    if (header_updated) {
+        *header_updated = false;
+    }
+
     if (s->nb_bitmaps == 0) {
         /* No bitmaps - nothing to do */
-        return false;
+        return true;
     }
 
     bm_list = bitmap_list_load(bs, s->bitmap_directory_offset,
@@ -1036,7 +1038,9 @@ bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, Error **errp)
             error_setg_errno(errp, -ret, "Can't update bitmap directory");
             goto fail;
         }
-        header_updated = true;
+        if (header_updated) {
+            *header_updated = true;
+        }
     }
 
     if (!can_write(bs)) {
@@ -1047,7 +1051,7 @@ bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, Error **errp)
     g_slist_free(created_dirty_bitmaps);
     bitmap_list_free(bm_list);
 
-    return header_updated;
+    return true;
 
 fail:
     g_slist_foreach(created_dirty_bitmaps, release_dirty_bitmap_helper, bs);
diff --git a/block/qcow2.c b/block/qcow2.c
index 1e83c6cebe..20d67bd9c7 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1296,7 +1296,6 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     unsigned int len, i;
     int ret = 0;
     QCowHeader header;
-    Error *local_err = NULL;
     uint64_t ext_end;
     uint64_t l1_vm_state_index;
     bool update_header = false;
@@ -1784,9 +1783,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
 
     if (!(bdrv_get_flags(bs) & BDRV_O_INACTIVE)) {
         /* It's case 1, 2 or 3.2. Or 3.1 which is BUG in management layer. */
-        bool header_updated = qcow2_load_dirty_bitmaps(bs, &local_err);
-        if (local_err != NULL) {
-            error_propagate(errp, local_err);
+        bool header_updated;
+        if (!qcow2_load_dirty_bitmaps(bs, &header_updated, errp)) {
             ret = -EINVAL;
             goto fail;
         }
-- 
2.29.2


