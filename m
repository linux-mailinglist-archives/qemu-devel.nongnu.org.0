Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9FE689371
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:20:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsE1-0007B1-KG; Fri, 03 Feb 2023 04:19:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsDu-00079j-0d; Fri, 03 Feb 2023 04:19:10 -0500
Received: from mail-am6eur05on2072d.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::72d]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsDs-0000nb-2n; Fri, 03 Feb 2023 04:19:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzNsy0f/nVvm8HsRyXA5YPmjKfNDl9UeJsNcfU9jEVsabIZW5PG1ECbkzSzMirLNi/uozHLWDVdRks5Uua/JvFuJ+4dUnfNwy7hophJKwITkmrAM4WP4uvNyutU859k8zmAgSx/5PqRBdEbOaBEQ0zN2nZwqYZyJH07GkO0fNgFNkDhZvw1twmspEDSKei43sRzuzBZmlg0fbw8du28fP/w+dFT5sOtcQ67JxcJz91xYXoYMisTdmxBhezSUgu8XuRfWiED1wFpoFjy/puHycTOxEyIQPWu9BPHIsjOMmi8tCCGs81c0jTPWVOyYb1R2Zzh9znD4WBZzleDGVg2+0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzrCE19U5Bc+4gW+rzytIfAwTYgTCv7OsgBMKOeLLug=;
 b=FX+uVQT/L3XrOMvIvX+V5wPAERKvLlleTgTuBvCjxx9Y6GpGGJOYvHbHKbKv+7Wae9GZzhBVFMdWijFH1d4EPN6C+AaR/PQepWn2/K1QxfKSE9OVIE8JSg1b1OgTna5zQaxOvlVTqrUATtXLCN6UFEmvqteP3ENh5ynwwNt1Tlp3K1zXMxoyqhfze7ax0125iXQpPP82Sw0TtUava6gjIUxeVXq64a5IW6rzfjip1FKMM3j27+lDty25HAcV62Iieo3/Qu2RWd585hqxLavccspVt5wekBvdnQJW9ut44f4E6oqrpsHz6UTUQ5GFpylSv+wEgp9OExyh8JU9XmT9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzrCE19U5Bc+4gW+rzytIfAwTYgTCv7OsgBMKOeLLug=;
 b=XmXM8NwqWUu9kK6KEtI+CaPeR9Z60q2DWv0ezyaCY4OdMIdwpN100oI0bztaacCv9vYdzmJLpXw9k9fpt17S1HJFW4/VPYqIHAN8MImzpFZlHiFbPtHsSyLL3Y4pxqUWJmd+voXbywKiPsnjSZzZroxNY5p7IJrNsDYkZFyc+zw6r6zWinHfA0bL2bye10LUn33DH26pqck96LfZpJRnFIxMApqaBh+ylRdCmC8aYCpog1EtMaIOOd8TegVocJPgHS0FR5PKkGhcqUyZYalt9YdV3UUrSR6RUv+l3NJrMRFcvMqqZ+E2LhFhf85f/hhtxGilVx4jLIL3Yu4PT1D4dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM7PR08MB5525.eurprd08.prod.outlook.com (2603:10a6:20b:107::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.28; Fri, 3 Feb
 2023 09:19:02 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:19:02 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v10 01/12] parallels: Out of image offset in BAT leads to
 image inflation
Date: Fri,  3 Feb 2023 10:18:43 +0100
Message-Id: <20230203091854.2221397-2-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::33) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AM7PR08MB5525:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d2edd4d-9fd4-4b74-d0e1-08db05c7b0bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hppDnuIjYdHiSP0acn5VLrXS7RLlOrSb55bdBzQGD/rs3i1APHR92+j6eoEf6hXFJzWha8jXU4gUjIiLT9XSAf9zDJ5rzIKmey5QIQp6X+YXjA5BARQPWS84Uwd4mfz6ZQsiOKv1x5riVCYzmgPnySE/KS+uJkWEDvhSGAs4nzPocSkgIWgxr9Xh/FJVYweqCBRGpfrnRW3UN/fS1vpRH2ELpATrWKnSdag1bOScLXLFmaOUNyBtC07krkW7Uh3dK4Kw8kt4oaYJO0eQvnfa1uQj2VqMR8OG2aXRJb8FY361Ek/w2djykEbCPv+hgLGfAkHAM9mvnxB38AUXxkASjMjV219HCnF32sl7c/rxthKX+P9NNHHLKXmvo0Z6UtIf95VSsPkc0RRxIjzQgBq+UE6UYVcmF1YpDs5tf/JKbgxHUeW1m2kOt3IyiWu5sYt5xLeOYxduqxGdvbRgsN/L+zQTvtAOEaMXlS1XAIK2P/OfZzVxvVy9uIv6ufnv/RuT+7/5DfoCOgjEc7Biibb2qtr6+qI6nFBGb2XjDcbhw1SQ1mR/Xu8pjl/i/BJc9TwC/13bsJZGw7ejSHbYJ8ZbraUSY7Bv6ciNfxxaGdIFONKWbzpqgtB8UeJGl4a66/sbuoZkpyuWQOQsCSYkTBTe8IYYC/hNFqmPgToSG3ei5iMUJd8/Aeqnp8wkDw9MRBWoNsRnnZlZqdil5CNEa4a8JA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39850400004)(136003)(366004)(346002)(396003)(376002)(451199018)(36756003)(6666004)(478600001)(6486002)(52116002)(6506007)(6512007)(2616005)(1076003)(186003)(26005)(66556008)(8676002)(4326008)(41300700001)(6916009)(8936002)(66476007)(66946007)(2906002)(44832011)(316002)(38350700002)(38100700002)(86362001)(5660300002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YmhMFErVKD8haC3gxQuB5QrEvdWxa7SRZqitGvJjlmIFFF0T7P5AKBPAN43l?=
 =?us-ascii?Q?tb2fD4NhMyNPJ5gjnjTk/yAhq/JhEpWvgd8YvroACzlnJ1nufpaBH2Xog8w/?=
 =?us-ascii?Q?ZuE4qc3NntLQYUVjxs1I6JJq/Q+HsUnALOAqrOxUhBLgiKENRJvRUoFcRTQ9?=
 =?us-ascii?Q?+BH2IcOOrzgAKnZfBoRUbLARXDRA0n3VP9b7Ty/19fx2zs/a08Kc0VSc9imY?=
 =?us-ascii?Q?w3rgtl4+90jqCcpabcqS+I7ADHkS92EqJ4f2waOfuOv+22JRBiEkoworSOox?=
 =?us-ascii?Q?ByI9Nkc+5VwwlYK+iMIgw+ycid+Dq7aqGk/ZDCM1s5CBAhx9OsmRm4sZ2EuU?=
 =?us-ascii?Q?Mz/y3fwl0ay02gauYv48zm4WcwXcdK5njL2wUxVYmWac2vHTmo1LfK62M9AZ?=
 =?us-ascii?Q?vrbteB+Yh6Qe9g6xHHyzSgnpmzR6jYRj2M1Oyw9Fd2H4xsHLRBleR7hf3SSn?=
 =?us-ascii?Q?hMvU/wW15/c+Isx3N2k221oq9bo589ldwdHsOoksEmErq1mA9xjDXSoOclZj?=
 =?us-ascii?Q?qkb2flsSxP0MaKlspiF+cmnENla7ljnI194F9aeb2pN2dojorp5sy7NmQUEC?=
 =?us-ascii?Q?HhIoPeK0LoJKX27VOo5AjXIdNqlHOOo14hCNJs0Uxd6a/vNAKnZO7iAjqwVO?=
 =?us-ascii?Q?GgsHGqsUGnQcUCRvAYoMkEP5PdYpYRHufZIRqCocehOXzL0OmWxq7Kmcbh+F?=
 =?us-ascii?Q?EWSkXRUIp7Y8cT+qTan9Vl1Tkv8dYrOhbnSspAKsLcQMfwzwYP94FH3Na9Mk?=
 =?us-ascii?Q?s05b7/wu8qoFiGtxkydVtVCn42SnHJaNPN3agL9tCfH4M72fxm5U5bX6Us4b?=
 =?us-ascii?Q?s/ir1ViBir3fV2KGz+xP/EhEiHF1+qgkj95n6t+y3/OQYyNAjvZOxxcbprGN?=
 =?us-ascii?Q?a4bqVEc5VLqc+YgXhIlQ8h1EZWiOmWtFuVDx7QWIMHkSAUZM6whck7yqj7k0?=
 =?us-ascii?Q?rNytxOchbPQDxG0lOkeShnVZvChMdZdJp9zoE9NJA1B27rIOkS+e6c4yaQ64?=
 =?us-ascii?Q?FvHnX1JfhU5GVEzkCX1Ub1GGjUSZTOmaDMAiJcQ62cA6gqk7/T3RAwnodCme?=
 =?us-ascii?Q?xthNyBboboisY38oc3z6QQZP3tzb6mqTCX/8Buu/gNmtTj20YBGdPivxas1k?=
 =?us-ascii?Q?ueYxR6J8QMB2qUP604OWLzzm1VFzwDmxHxOsVXZGZTlNeyg+AD+cEpyaGWcW?=
 =?us-ascii?Q?5rKsVVEwl46T8K8XcEo0QItF+f9vn5nsV12C0HCFZQPN3CtsOdk0SMAzBojO?=
 =?us-ascii?Q?Va4WKo4kxf/b2HTIG2Eiuzfen2dpYnpqU6NZIGAbp5sKafTb5YPuLyHQp6Vb?=
 =?us-ascii?Q?1ppLwwxfYdFU5l7yi2wcrKIpEYtqjY0V+YbGkHZaLzJVkpL6hpN3Uwf2CAfi?=
 =?us-ascii?Q?i9n7LRXNGBzKpe5+OkCFFqKC2Mba+iX042ziSbTLr1iFl+oFQJ30+pbwbUmW?=
 =?us-ascii?Q?A7bvlI4e3WxkhA8FMuOfFtI36TT+gIFttiLRuGjQQt8oTh/0WN2UuhCYbDw/?=
 =?us-ascii?Q?BIPh8GJ5LMsYv0EVxeSp9Zesm7gjto3fIet+65+TK5NPN2jgkhekdRJfXlFN?=
 =?us-ascii?Q?CsHD9PbAf77z9V8rumQMkdxTGEwAmLLyQ6D8dr7MNdOH8l5DRKJDKLN2nDfB?=
 =?us-ascii?Q?sEmYS2jkrp6H/YKfFV6ZxAU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2edd4d-9fd4-4b74-d0e1-08db05c7b0bc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:19:02.5789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVvmv23n/T/mkTrP1CjSSl0egPUjcU8CLjl+cNHmMeUT4fj9GTtLUNwEO1o6TQ4ul/OBDx/TzQjobiSgzvnK/I0GUloOZNs+tFliy4ELA/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5525
Received-SPF: pass client-ip=2a01:111:f400:7e1b::72d;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

data_end field in BDRVParallelsState is set to the biggest offset present
in BAT. If this offset is outside of the image, any further write will
create the cluster at this offset and/or the image will be truncated to
this offset on close. This is definitely not correct.

Raise an error in parallels_open() if data_end points outside the image
and it is not a check (let the check to repaire the image). Set data_end
to the end of the cluster with the last correct offset.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/block/parallels.c b/block/parallels.c
index bbea2f2221..4af68adc61 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVParallelsState *s = bs->opaque;
     ParallelsHeader ph;
     int ret, size, i;
+    int64_t file_size;
     QemuOpts *opts = NULL;
     Error *local_err = NULL;
     char *buf;
@@ -741,6 +742,12 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
+    file_size = bdrv_getlength(bs->file->bs);
+    if (file_size < 0) {
+        return -EINVAL;
+    }
+    file_size >>= BDRV_SECTOR_BITS;
+
     ret = bdrv_pread(bs->file, 0, sizeof(ph), &ph, 0);
     if (ret < 0) {
         goto fail;
@@ -805,6 +812,16 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
 
     for (i = 0; i < s->bat_size; i++) {
         int64_t off = bat2sect(s, i);
+        if (off >= file_size) {
+            if (flags & BDRV_O_CHECK) {
+                continue;
+            }
+            error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
+                       "is larger than file size (%" PRIi64 ")",
+                       off, i, file_size);
+            ret = -EINVAL;
+            goto fail;
+        }
         if (off >= s->data_end) {
             s->data_end = off + s->tracks;
         }
-- 
2.34.1


