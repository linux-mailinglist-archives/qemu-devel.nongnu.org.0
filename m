Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525AB2F8F7E
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 22:54:38 +0100 (CET)
Received: from localhost ([::1]:48562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tWn-0005eH-D7
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 16:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQW-0005RW-KL; Sat, 16 Jan 2021 16:48:08 -0500
Received: from mail-am6eur05on2132.outbound.protection.outlook.com
 ([40.107.22.132]:15968 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQT-00078U-0c; Sat, 16 Jan 2021 16:48:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BahX6HX/S2qapKDPlfBf24jVOBge7QXx12S6VniezplTnXAg/Veju3NXKoZe4zEwrwDKg+N8ChYrHnXPYw/Mlkk/LQKj1FnYVlmZpC1DJRLsIvUX9gQrM7VMGI3c5wg7J+v2VKxeKY1/pk3j4y+jpPPaLXyntFII5hykmxwwubRl0ShccViOzSvDaLgHMXF4VAYH9r9VwkV4i2/CA0oKb2N3PoISFKd1AuYZLrq5QQ9ZfWURJ7m9MoPet9LJHFpbTymOnPGlgafB7hSxBqux7tlsxQt5peRhOMF/n+Scpe2ppXfI51h14ae2gpVy6uMWzUCvgEcbIj6hYvpL7ICtXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSTi+5v91jlkbw4xejVexNbmyX/acFz4wt56i0VuTO8=;
 b=T2qeLupAicUVuhvRYGH4fl52mYL2Op3pnDSIFGb/524pzIwEqSpuvTY9NOR/cV229OMaWsobRsmXCAr03F5jCYaF7/GEjQT8LwvNkCelPIVIJPrKKTpAaubNKTGgtWx7Vxt/rympqOsJq7nZ2UXht/1y+//DNdvYhFVeJi30pnX9M07RcXhUkgc6XW3tg5yFnDAjabddbUc6BekZLjjEcigWYoUSsOdAYLg6urxY/WTbZEUhayYODfMjYXFPWH2MHFCwozClS2Wu3fOWw4HiRPC6h1sIMlh3+oPqZIXeLsdmg7pMx1teMfFSpjtPxUYctW0S6rm/EywlEW6qFZbszw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSTi+5v91jlkbw4xejVexNbmyX/acFz4wt56i0VuTO8=;
 b=qXLmuoFhA1KNEpLRiwG4Sc1CrihjdMNRAFTVTwwfHirIZLsHeVvetUiLYCo42iZbN1nyJFb8wZXQWyxMxn0p/02XRvQ3iMMAHC8HCUUW2/LA9J7/Fav1HcTd6G2XL+nXCH4Rnb38Opp9FXAtzeV2n63tlJCghUPQINp6uLUqoG0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2033.eurprd08.prod.outlook.com (2603:10a6:203:4c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:48:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:48:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 20/23] block/block-copy: drop unused argument of
 block_copy()
Date: Sun, 17 Jan 2021 00:47:02 +0300
Message-Id: <20210116214705.822267-21-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Sat, 16 Jan 2021 21:47:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d0c0363-5933-4d69-9ce9-08d8ba6864d2
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2033:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2033418D4A992427CE7CD346C1A60@AM5PR0801MB2033.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:30;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j6SaJYJavUnLfmorLkmbdvzvt9vDnoewKENrIhv/Ili35TDsQcGDJUHh8KbZZeGYHj4avQkX41rfnF1DLWacckE3MgY5hT+zt0grtNDM5uoMZXXo0nlD+NHIv2E0+b0cE5D84sizFInEQRZgwnY0jU5telZtKSy+ttk/tlylf/COPUStMbITeWRWftjrQO8f8ATNGZ4mOK5JHEMYvHDbFYvyYu0GS/YQOnMSYaC6iZ/EGoP9e86wFH9nL3HXatwbapQ9sz/Fx4RreH2/sJynHLyZqTOCCl8yVRCOMAI7/xy5j/CskvB4ddlPtTrkOv+t9+VpT9AYYz0zcifT72xXvxhNziXKoYaPCy8/oBeUaz0pCRJHSVrVHcU1OwGs+sQV8pJSMoGTFhD8Yn96Gjq5Ow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39840400004)(6506007)(8676002)(1076003)(186003)(16526019)(5660300002)(6486002)(6916009)(36756003)(6666004)(316002)(8936002)(107886003)(4326008)(478600001)(86362001)(6512007)(2616005)(956004)(2906002)(26005)(66476007)(66556008)(66946007)(83380400001)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+kgiK8zRquPDHMRumbpGf6VQYfxfPfKmt4mnrbwNcIaKaR5QBzqSfgVaxeCi?=
 =?us-ascii?Q?it4S+SnXlsfL3cIMcvOt9H5tL5RPjurmkQ69FhUUhk1E82gVlu3npzEk/iKW?=
 =?us-ascii?Q?ISURA9T51RMnwbmhl0wdIbgJcUe0qp1opHR89n3mO9iblZCfo1+DGDExcKqG?=
 =?us-ascii?Q?QQcBnzp/UphvYvH/G02EDzSColGHOqPrdJASNKVIL2zaVhnlZRc1JliFnire?=
 =?us-ascii?Q?c3wxhMF5ky4BjFDn/98O7OQpg3TqhHvANgfmKSK75/5IbSfzSA3TL/cg4Ac6?=
 =?us-ascii?Q?bigIsdH4nclsuoNNUbXs9OqQ2ja4m4ZiSRSoKesUX6Fa0aSKkgwJXTsDe62Q?=
 =?us-ascii?Q?njSnGQs37kjTjthAP35yUpD8ILN1jSNGedj61y4nHYM45Ys0Tbht3QwlQFEe?=
 =?us-ascii?Q?1Qsc0aoLhI228k5JTdTbPU9AVz9C2yg8mrLQ0stAKxVu4k1yRAc3Dywp6sbo?=
 =?us-ascii?Q?VzWUItzRTeHLGLbGaWUjBdFWWdtoSm4YjKMuGEj/FlaF0LIWzB8UyAwZ4+nW?=
 =?us-ascii?Q?Az1QXQRL61AHujjXe+bK5+BjyZ7zTtE0vxygJB2umMVPnrHZOVVe3SRdswzp?=
 =?us-ascii?Q?ycRn+SHvNUftZmQ1plD63SeepHYwI4uKzA5byTn92WlaOLkZT2vupDWqrEw7?=
 =?us-ascii?Q?rwUNw2sZqy6IdtoqqSuy8dKvDQ0WfFY5Gc3FI7Gc1SvIJZIe4oZH56wbzd/e?=
 =?us-ascii?Q?gboARHhHWl9IyjLCrC/Zyy0d3igK4wc1yTlkb+avVwmL0SubZzY8SqSXkC3O?=
 =?us-ascii?Q?c+7LKb85JkvGzBkMyvyFf3KBXF36NXxgRcZYNPp5LZ0NECro4X5JDLyjCy4O?=
 =?us-ascii?Q?Hp+FdxH8mv5dsWVy88KMQshRjqtzvTO5C+KxQxlhR9oJQzogFXXe3ai4APIp?=
 =?us-ascii?Q?Kj4OmgjJUSTT2dmEOF/brgYd29WKXDM07haXjyBdZZ7mVa/CEPJuwxjqMJ/8?=
 =?us-ascii?Q?wQ6QN0xGkdQHfiQihvD6xWcm6nPgQCG106sJGsHXIVWLyDwYVdo0QumXtmVy?=
 =?us-ascii?Q?J1N/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0c0363-5933-4d69-9ce9-08d8ba6864d2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:48:00.5009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMGrKi/XmQOpyL2CjH89Rlzi6wkD2DFhXR90Iu5y55Xjf1SoPkDqc4rC8S6N6BeUWzkIhIB3vGQL99ZxAxg6UTlMZVxbcNS9Uxm9OlGrGic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2033
Received-SPF: pass client-ip=40.107.22.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block-copy.h |  2 +-
 block/backup-top.c         |  2 +-
 block/block-copy.c         | 10 ++--------
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 1cbea0b79b..338f2ea7fd 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -35,7 +35,7 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
                                      int64_t offset, int64_t *count);
 
 int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
-                            bool ignore_ratelimit, bool *error_is_read);
+                            bool ignore_ratelimit);
 
 /*
  * Run block-copy in a coroutine, create corresponding BlockCopyCallState
diff --git a/block/backup-top.c b/block/backup-top.c
index 779956ddc2..6e7e7bf340 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -61,7 +61,7 @@ static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
     off = QEMU_ALIGN_DOWN(offset, s->cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, s->cluster_size);
 
-    return block_copy(s->bcs, off, end - off, true, NULL);
+    return block_copy(s->bcs, off, end - off, true);
 }
 
 static int coroutine_fn backup_top_co_pdiscard(BlockDriverState *bs,
diff --git a/block/block-copy.c b/block/block-copy.c
index 2ea8b28684..39ae481c8b 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -723,7 +723,7 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
 }
 
 int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
-                            bool ignore_ratelimit, bool *error_is_read)
+                            bool ignore_ratelimit)
 {
     BlockCopyCallState call_state = {
         .s = s,
@@ -733,13 +733,7 @@ int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
         .max_workers = BLOCK_COPY_MAX_WORKERS,
     };
 
-    int ret = block_copy_common(&call_state);
-
-    if (error_is_read && ret < 0) {
-        *error_is_read = call_state.error_is_read;
-    }
-
-    return ret;
+    return block_copy_common(&call_state);
 }
 
 static void coroutine_fn block_copy_async_co_entry(void *opaque)
-- 
2.29.2


