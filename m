Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104E74B91CF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 20:53:37 +0100 (CET)
Received: from localhost ([::1]:41238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQMp-0007SM-QC
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 14:53:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQG3-0003je-Q8; Wed, 16 Feb 2022 14:46:35 -0500
Received: from [2a01:111:f400:7e1b::707] (port=17600
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQG1-0006Dk-Pa; Wed, 16 Feb 2022 14:46:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMWk0jVHQugcXZRclm3ZBEr3/4EF9TC34hLcbZXI/On6ttWQz+xtK4Rn9Jag/VFzgL729eZoitdx0HIo7qNOeYBvFox1mXfrMwCjO2W08RfmTVYtEzlv4m59lvYHY/hml0mAFuX/ZbXjq68msArxZwdsHPz92O/Fvjs3d/ZxsuHAF3HsToLHxqEnDx/B9S/ZRKVHmBujbZChO+N4KcQX+rW/itm3RoIG1exB6c5SJWk1WCCBBg+nz0AGXkEymxOUPc8H3kEN+7RMzEAgt8z3srzwM0rd0QNlR85WQe+BdR2+9WSJaG/Ih85l905kY/qQRxmnil4LxHdMLXP8srbrgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYCkIsx9+bhwl6XDNZ+n+3c2V2cwQDr4V3HIXM5vypM=;
 b=X78PVxGgK08FWbBD6xjVGoFrCTkcONKnJlKOUeOIEFWmQaGbf9NLh+lPKTNny5VrGZkyl8pxgdE4KlLZIIOt3HxEPD+g371xtc8alahqaoMr7C3OSr4Hw01nnKTfiEnLIw951jzFtXT5alCeOaMtJM3L95AHwHbFXBk216kOWj+c6u1H0z1Shb9TDbELu7IO+LwuuRJoOGzh1NdW9HdjIGnYEQJ1M/k4YCH4GPP/R+okghusjftxJLAskLdSfkG7ZsHNkxPv2LiR4jbwBIRLVongMu66QcjhEclBoPm23yCIpK+w253Rafw9NGxZjnLN9KWisI7iwLWFhWalv4GV3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYCkIsx9+bhwl6XDNZ+n+3c2V2cwQDr4V3HIXM5vypM=;
 b=Wi/EFvt/m9/NfYDSTc7KAkqd7C8XzEqG2u1HuvOUQvZsNs0YZs4HIttrWfWispCPpFp51CiaqzWS2kyeaFnjGiFiHs4S8mnI3hSAHqNISu4R5iVJzMWEgEGILIA0A/N897fUKx9m1bFWehgAQ1M2bJrWWe1OnXQ1F8ETMFXcMgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Wed, 16 Feb
 2022 19:46:27 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 02/18] block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add
 return value
Date: Wed, 16 Feb 2022 20:46:01 +0100
Message-Id: <20220216194617.126484-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220216194617.126484-1-vsementsov@virtuozzo.com>
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9dde527-aa0c-45d6-9ee1-08d9f1850596
X-MS-TrafficTypeDiagnostic: AM4PR08MB2851:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB285144428EB3BBEBCAC75592C1359@AM4PR08MB2851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HjkpVEGjGrL2bm4XRX75cgiTANTyy4ch5JZnyyrzFvvbjhgy7oLu5n3dz0i/PobdJJI1LUdmn6N0LIFij0AfbLX7hF/8YdHxxZbawMk1M6TuePawSBKDbSrIs6Pp15WjBS/QB8qd5S6aI2uB8mI+fXRYLIqGHM1uoHV0k71CqS34+pQQQRBgw01rd9BJqU5wFTUay7RVgUwDLXsY/KR2FfnisWIovMcKkYTLl+lrhFjn+spk2oy8sI270l2TMzkbbxfcw2Z9a31psjJwaVKNCp+BqDHuj8IjDqLCrP6COKSsZwc2q7C1nEcyXzRZBORE4GqLt9Tn/oqzmcBrWE/hnTr5lflEeGKrfiTk41hapqVcAae22FI05sY/PQmc3SfzA0EoXWZ6eC1e0BOviba/fPIh7bNR8+T6Ph/lC7pcb8m+DHWLmQljSNDedQbuBEfa/MBq5maKjk/pZnB/hKtcvAO6IA6kcqzKqXQ+1/T0d3QdEuH+DcAxwRXSBhNjViQpW8+XVrpPcNMKPKuMem58m57aCsyDxVyWsNG58dohpZb0gbqUKqBJp2F/Ux90OfPVvsJZFWv8P1ce+wnrzW61QcRuwHui61ImdN1eQxK151YJLAocQKqyYCi/wL5OXZI33hIyTQydbmGu44JuR8ZIfib0GVlr/+xRqKVNLRdM+2+YD/QHdeDd4l++1MWw91sQ0eMpi8v8rNOOjIzG34nzX53ZVVgeoWv8IrT9et7DaPQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(7416002)(6486002)(1076003)(36756003)(2906002)(86362001)(83380400001)(508600001)(316002)(6916009)(5660300002)(66946007)(66476007)(2616005)(6512007)(66556008)(8676002)(107886003)(4326008)(26005)(6506007)(8936002)(38350700002)(186003)(6666004)(38100700002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tk4Z5iCJGdBPy4SyE8w6msEKpLkdjhxhgadcUuNstEi8xF5iYnkIucfRH94B?=
 =?us-ascii?Q?FWSw2XJzCtP8vwYxJtpmcvnSlXx4Jee2iPwDxDr7+npYI5FvAaqIBeq/sQy0?=
 =?us-ascii?Q?HhzF9VwGOTxQIlSbujK6sAP+LAeumb8r6Kar2G/yEgT4Exhax19/SQO4gJir?=
 =?us-ascii?Q?CFxwv62F90dx9OKRSPna+w66NVnPHYtv7i5jd5GZ7NZzB9M1oeOYJdLg9AgY?=
 =?us-ascii?Q?o8R7cWlrVPxiah5cHop1+TQGZwn3cwSzcx/C7wdkB8h+sR7mcRQ8XkKnOAhR?=
 =?us-ascii?Q?TpJSHX2MsY5qrvLnuO6OOEusSiFscSVUiYxrLktJIFe+rx3K+rOzUbyfkzFf?=
 =?us-ascii?Q?vGsBL9iNjr+P/sZsM9m/VU6gRJAY/pgCEvPJo/jXwMZ5O0J5sPOdtVNOmPod?=
 =?us-ascii?Q?J0zo9wlt3SAHcyMf/ybfID8KUbYhshDSxIHIPSuO0pvNGSUR3OhrBZmtvmIH?=
 =?us-ascii?Q?35ob69HZ6rltxQxoXPZTRDQnAo5cUxez6Y2StI4qehqre9vP2zsGXt/9ojxf?=
 =?us-ascii?Q?ei1+i4GUptppHPTeqT2p04MN/VMtPkuVVGibjSJv2DULxdX16oOb1scFLD0Z?=
 =?us-ascii?Q?snjOxMg2EQ5nFeIvrzv9VXas6JpHA+mzD1kVwTJWW44BnHPu0MPSzljXeeqm?=
 =?us-ascii?Q?wEdm9ffStbfVkMGpC4N4hgcGse+bEQ0nGxV6PET5XH5JUMzm6qWdEVS6vkOM?=
 =?us-ascii?Q?BxpD8OWFDPjvE5YTL1bfO9+5n5ScFZZqwi9xfwuYgQmBGOsmdzAK8y+ARtFW?=
 =?us-ascii?Q?D4kcNyH5uZ6gsZTz0K8o4bn19mhQVhWFsDXsaei7hWGZBFRNT/KPzZMNxfHt?=
 =?us-ascii?Q?wmFIsMtb3wrNCGWC+7iAtm/hyoiuA8ACCfqWfK6TohFVqI9kXivswXE8TT4R?=
 =?us-ascii?Q?n9G4yQh60z9wqYSjSgXE4Kq8gTcLMDMmh+4C7keERETtcobL4ldvuA4qWbNg?=
 =?us-ascii?Q?qKLTv3+OTP+TtQM/mPt0hLmQ9Y173wwDPrGT8bAIce6UHp/cfnt4fmMtTKJC?=
 =?us-ascii?Q?0WVMA473jRpVcwTygXcCDQfigYxgte0t2vC+O+cGSvTftP4Eys2Id7DlHefz?=
 =?us-ascii?Q?Pd4lHEjaT3o4lLY6Sw149PhoPC47qumuBPypUHYnMC85Muv+EtgFK5wHc9y2?=
 =?us-ascii?Q?PGSHn9dpXc7PU0u7M7+Vm+aDTV6tskqim5HEYUwQoIXvWiDje7PAUN+4Od4w?=
 =?us-ascii?Q?TxzVAVBI+H65HhmM7Gujv0QzGVBo6rypk0TS+J3dZc/CcoORMCLSWb6XQuSK?=
 =?us-ascii?Q?+YWLVIxjCyF0j8X6suN9j0CnCz3HakNBqwIhdoCCIi9SP989HC+RVFp9Ncjo?=
 =?us-ascii?Q?BbW5q0CiwEg+6V8wCx5z24DIwC6pHn99Eo49kNKOR+TOviM7s6GqOi7VVy1K?=
 =?us-ascii?Q?R2nm2PmniPw8+u21IXv74qlA8YZJYnW47DPIn0XvU1hq+twEnOLl2r7KhMTG?=
 =?us-ascii?Q?/sH18xSUTZNRFTM4ROoWnH169dQ7AWepO661N922bc95AYRTeLXDAwWKqi4p?=
 =?us-ascii?Q?+T8n8tZV8aUvcwS8b6GjlIQiCbHB/ZXWHT4v+qdBGbdgG5i0AWzaiM0fN6N1?=
 =?us-ascii?Q?LN+Gg+7mf3PmV4r8zT2mK+XDDodYcnSzw6+6NyrB+KrYYiBbYnHJLSsRr36G?=
 =?us-ascii?Q?E9V6SyTS1XowopW/P+wo9yalWnjLWmD1jw00jKoZluOt31vODzl0YvYJKeU1?=
 =?us-ascii?Q?VvlujQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9dde527-aa0c-45d6-9ee1-08d9f1850596
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:27.7430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXhrh7a+lbcgtFKgGapcUQm0AR3DHeYBSmyzmMH5ydBaMgMXze8yeVM4cyGoC4JeEEkIb2ASzh4l4Pi4HZuQKag2wd+6eTBj3qcpkGWAIk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::707
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::707;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That simplifies handling failure in existing code and in further new
usage of bdrv_merge_dirty_bitmap().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/dirty-bitmap.h    | 2 +-
 block/dirty-bitmap.c            | 9 +++++++--
 block/monitor/bitmap-qmp-cmds.c | 5 +----
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 40950ae3d5..f95d350b70 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -77,7 +77,7 @@ void bdrv_dirty_bitmap_set_persistence(BdrvDirtyBitmap *bitmap,
                                        bool persistent);
 void bdrv_dirty_bitmap_set_inconsistent(BdrvDirtyBitmap *bitmap);
 void bdrv_dirty_bitmap_set_busy(BdrvDirtyBitmap *bitmap, bool busy);
-void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
+bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
                              HBitmap **backup, Error **errp);
 void bdrv_dirty_bitmap_skip_store(BdrvDirtyBitmap *bitmap, bool skip);
 bool bdrv_dirty_bitmap_get(BdrvDirtyBitmap *bitmap, int64_t offset);
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 0ef46163e3..94a0276833 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -880,11 +880,14 @@ bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
  * Ensures permissions on bitmaps are reasonable; use for public API.
  *
  * @backup: If provided, make a copy of dest here prior to merge.
+ *
+ * Returns true on success, false on failure. In case of failure bitmaps are
+ * untouched.
  */
-void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
+bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
                              HBitmap **backup, Error **errp)
 {
-    bool ret;
+    bool ret = false;
 
     bdrv_dirty_bitmaps_lock(dest->bs);
     if (src->bs != dest->bs) {
@@ -912,6 +915,8 @@ out:
     if (src->bs != dest->bs) {
         bdrv_dirty_bitmaps_unlock(src->bs);
     }
+
+    return ret;
 }
 
 /**
diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 9f11deec64..83970b22fa 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -259,7 +259,6 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
     BlockDriverState *bs;
     BdrvDirtyBitmap *dst, *src, *anon;
     BlockDirtyBitmapMergeSourceList *lst;
-    Error *local_err = NULL;
 
     dst = block_dirty_bitmap_lookup(node, target, &bs, errp);
     if (!dst) {
@@ -297,9 +296,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
             abort();
         }
 
-        bdrv_merge_dirty_bitmap(anon, src, NULL, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (!bdrv_merge_dirty_bitmap(anon, src, NULL, errp)) {
             dst = NULL;
             goto out;
         }
-- 
2.31.1


