Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A52343D3B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 10:51:53 +0100 (CET)
Received: from localhost ([::1]:60478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHE0-0006cB-Jv
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 05:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOHBr-0004s1-FA; Mon, 22 Mar 2021 05:49:40 -0400
Received: from mail-eopbgr60113.outbound.protection.outlook.com
 ([40.107.6.113]:25015 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOHBm-0007bG-K8; Mon, 22 Mar 2021 05:49:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHQJUSzH5B1/vVVQVtBsbEzp9nfutrSlnwgyunPjo6tMLz8H2jfyS8lLfNz7DTcp3IevdOPVWp0k4bOFA/xJnv+XxO8sPedndBwu5ovIeeIJbhYm/fwfvLUrrFOWc6zOFhKcma7e4VXwYXen6elQ/j0k8Uk3TO/AHIjwBRaCpudBqcKSFz5mzzqWOtaCV6i3lHfDs5YqIcYaQxXaYE2vasHj8HqxqRf0+3rmcJIlGVs7E7qxr5dqsW43n1YHTg3nyBZRZIsMxhavANqFSlt9bEQz7RMp8BXUlWZz4ocUT4+Y2iTDBvjBkB876W3veDLs6GEOm57KuqXthLlaowRnkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXZAthAOCVj9CHmxfKHSKpmnm21kvNSXAJ4IWE/G9Oc=;
 b=LaOqtkvuMmuNXK/ekJ2bv3JvPdsojL4c2oLOUyLROQix52tnnofxQMgo7lZe7o9JIcu19lvWfM5DysXYjT+zwHaZvQkXrY8rzOl79d+oqAfD2eD+Zp734QBZchOO4aptfNjLdaEdhpUotBm11c76/0JGr6Wn+Db+A/csiO5BInss4TrmU0ORV/RsWeEr3urzJslbdEktcCqvyLKNw9Stl2H00+eINJX8H7QSZ1J0oZauijTL+GkgFHe3gvCref3LUEYzUycEeYAPT00ZwTk797Zw20PC2Glwa2aKK3n2Xb18aB/HCwSQE7rJ0tuQx+BT4q7PJIHmzLwXz1kYXyYqnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXZAthAOCVj9CHmxfKHSKpmnm21kvNSXAJ4IWE/G9Oc=;
 b=vwN27zl1BrEnoo3/dmFxm84Z4ZKI3nT4VuEdVoL4if/aJo5yGaeJGhSFZhjnUUKmjrzriFubXaOLmiV37D6tGqxRn6ulgerfhL1MfOYG5/mf6KE/IuvyXZDEP02s6VblKQ6hGY+H7eb4hmpSnfFhDSoWtkLyOmUDvfNqv38fNnk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VE1PR08MB5614.eurprd08.prod.outlook.com (2603:10a6:800:1a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 09:49:23 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52%9]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 09:49:23 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 dgilbert@redhat.com, quintela@redhat.com, fam@euphon.net,
 stefanha@redhat.com, jsnow@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com
Subject: [PATCH 1/2] migration/block-dirty-bitmap: make incoming disabled
 bitmaps busy
Date: Mon, 22 Mar 2021 12:49:05 +0300
Message-Id: <20210322094906.5079-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322094906.5079-1-vsementsov@virtuozzo.com>
References: <20210322094906.5079-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0121.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::18) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 ZR0P278CA0121.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 09:49:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86990d07-c0d6-4e81-0f0e-08d8ed17c5e6
X-MS-TrafficTypeDiagnostic: VE1PR08MB5614:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB5614EDBADDCEBFD6CEBE0EABC1659@VE1PR08MB5614.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gjhj0P5tiidACYmDfGFpCiz3DJWp02U+oKK0PSIl632PEhLNkbPkVo1eMpTcDeLMKIUaLs7Dpey6T+sEbihFYlFB8aDs23ocSVQ8fpMv/H4V5bjfcQqK0cIoumhD8g4GyNH4za45Vsy3AnPVb+IqLa6QckBbiNIu+LtzuHkiuRGNyFVDz5ScTxlvGjBTBSK3HRzxgDi3KFoGi4mH+6N/iCcIkKufbF3GH3LK1i3ndA849F2MqQ1qAC/7POxku9UjT5sj98g2hqjUwrKXzg9PT2+TRANXztBQtC4JwzC6cvVpzpGH/G2KLmffPZ8OQq8rreMjKGWl27wTQg7IBKBZLlVBA1Cr7fbI4jLnuXxuPX9LyJWxsEr5l9FLtPZPP6HOrmzpfuh+UoQoNi8YrF/izAUFanxPNU1dWpGfZ3vrDE4uRDQFLa5C3wQxdhPLpn4ADXKqhp2AnhyDwDwurLeAAIG3Kk4AP6EG5/EYpwYXsVykbjUdsRmqbrMr53vluJckeSRAAKO74LLPduC+HPLX2ZQcVmIit8MLVAfeGiRtqzUGxHta55usKev9ZOXbgwDzoTEUJc1QwZqev2Fve/feVIxxf32sIrM41wCIS1tMOAWLIVAXdWmVWpH7D/tz8wdWFwdF429mDgldyZp06PZkyM7cYtQQwhsOh1l8oO3avDzCg3MntuWBCcaIDtMsjWNjr09UsszBxRDHkgebBSeFaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39840400004)(6916009)(5660300002)(36756003)(69590400012)(1076003)(83380400001)(2906002)(86362001)(478600001)(6506007)(316002)(6512007)(4326008)(38100700001)(66556008)(66476007)(2616005)(16526019)(956004)(6666004)(8676002)(8936002)(26005)(6486002)(186003)(7416002)(66946007)(52116002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?s0z+jKFYcWmh2lz8w8v157sMFPx4T2mzFHdFtYFVpbOPFTbd7zL/yjBX46bj?=
 =?us-ascii?Q?K/pJQ2lk87K8b0Cb5HM5JNU4JuqbfaUJW6uCoDSf7Dzc45CXfO5cYVqJ+HYW?=
 =?us-ascii?Q?yk3rSdBVd6Yp1wrZ1MLVh/i3aDGYc6zt65ISjd9Xw82v/epU/xIUL1iP46+B?=
 =?us-ascii?Q?8oxseNYwEmyVd5hJX5rbunBP95/FsA51kvb+FZZHLAbZaOE+NUMz8DF66SZd?=
 =?us-ascii?Q?mDjw74azmPj1eKM47vXGz0BosO6o5VZ50fdIK6munGsNnb2RQw32Rg6Kz8cm?=
 =?us-ascii?Q?WFtff7Db4RtZjuruouD7plE0E/HiDKk+4O9fBffCft22TBrttHU+dad2jeAX?=
 =?us-ascii?Q?jYoWU54eI5IwVLMw89V5afPENYisMpmoPoC+9xYEXjMixkEfgd982YW3rGE7?=
 =?us-ascii?Q?IFOK/aURlca2k38PugeoRNNUcXHv88Eo3M0OcnoiPvt4sg+hFTQcxM7ZLWmX?=
 =?us-ascii?Q?YVUl+Y0OlajiSzryQ9IPIiJ8D+NsWhZOpTCpr16u8xRQ3nmurHsVmYxBG5jP?=
 =?us-ascii?Q?l7FxfPmko5vDm9Lrl6ilwZu6dKZK685HCpPdsEpQillprBfyzGAOwpDYheNu?=
 =?us-ascii?Q?3v+p8n32bKQN1gVSISz8bpZKOqNG6n6r/2Ga6+sbz6IT3w9slY95CUCjCNEQ?=
 =?us-ascii?Q?N0I5cc4q+zZ0MHaTUrNEFEHdoGy1HqkSYVpZ08piiHBS2JV1vrNnjJ/3IWsN?=
 =?us-ascii?Q?CNdOtuWe8+R4TCyz0+NEzsXnjQShsqj+bqKGOISWyctE83ntWfIVNTGxKRDR?=
 =?us-ascii?Q?QpU6iE6Vn78vDXOuX89b0NTjQRB7DVPU0Jwxp5SeFcWJ9ku1xumcRsogA/Ab?=
 =?us-ascii?Q?9tU+M2Cl9JBp7ZGDpYMGGj2mfVPEnkLFg6BKgZuA/rkNg1Vn8NMNmo3bHfaY?=
 =?us-ascii?Q?nrfjb5WVPxuYtdxSYny/s/jhyVeHzPC830oSrPfaSk54O0CvVFScwf7n+H7B?=
 =?us-ascii?Q?uRuT/uHRaoSON6ac+vHX1RL79RNZAh9+8p+HrlCMiwbwMahM9DPahnXfW8Nt?=
 =?us-ascii?Q?5P3H7Ge/VpvoybUG0/CLwtqsF8uQ5FcbkazDBarayRtb6mxUny69maO0Hss4?=
 =?us-ascii?Q?DAZYWAKSway8Zg0WnZC83uYHNZYJbVG6cdQi6hKqt6/SN47jin6HjDIlc0MT?=
 =?us-ascii?Q?bmZ7z0RzEb4szj7MTulKKnCUYu+8jOgcLrU5M35teOX3vSxOU494Px/O6Ecy?=
 =?us-ascii?Q?I5uEoRArJ6hqMF0kVUOz0VSemJYVMQyp48J+t6A//pZMGcHXHHQ/AZLluKlO?=
 =?us-ascii?Q?XR9S4UQZ53Px6ay/sLRMdKcVEVwurgxxcwYN1k9p0xX7xj12F/k3CFKq5lTv?=
 =?us-ascii?Q?8tLcVd+TKI4LayRce0wgdi0i?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86990d07-c0d6-4e81-0f0e-08d8ed17c5e6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 09:49:23.5165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tPkyUCFZKm6ZPyXHGIlQXwbtVbVIrVV0G2XtycNDlMzCuhhDpj6PXu92qI9Kbd8iXPQCt75QQRVVomDHr6goz5rAmBstlAohYnW9y/ej9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5614
Received-SPF: pass client-ip=40.107.6.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Incoming enabled bitmaps are busy, because we do
bdrv_dirty_bitmap_create_successor() for them. But disabled bitmaps
being migrated are not marked busy, and user can remove them during the
incoming migration. Then we may crash in cancel_incoming_locked() when
try to remove the bitmap that was already removed by user, like this:

 #0  qemu_mutex_lock_impl (mutex=0x5593d88c50d1, file=0x559680554b20
   "../block/dirty-bitmap.c", line=64) at ../util/qemu-thread-posix.c:77
 #1  bdrv_dirty_bitmaps_lock (bs=0x5593d88c0ee9)
   at ../block/dirty-bitmap.c:64
 #2  bdrv_release_dirty_bitmap (bitmap=0x5596810e9570)
   at ../block/dirty-bitmap.c:362
 #3  cancel_incoming_locked (s=0x559680be8208 <dbm_state+40>)
   at ../migration/block-dirty-bitmap.c:918
 #4  dirty_bitmap_load (f=0x559681d02b10, opaque=0x559680be81e0
   <dbm_state>, version_id=1) at ../migration/block-dirty-bitmap.c:1194
 #5  vmstate_load (f=0x559681d02b10, se=0x559680fb5810)
   at ../migration/savevm.c:908
 #6  qemu_loadvm_section_part_end (f=0x559681d02b10,
   mis=0x559680fb4a30) at ../migration/savevm.c:2473
 #7  qemu_loadvm_state_main (f=0x559681d02b10, mis=0x559680fb4a30)
   at ../migration/savevm.c:2626
 #8  postcopy_ram_listen_thread (opaque=0x0)
   at ../migration/savevm.c:1871
 #9  qemu_thread_start (args=0x5596817ccd10)
   at ../util/qemu-thread-posix.c:521
 #10 start_thread () at /lib64/libpthread.so.0
 #11 clone () at /lib64/libc.so.6

Note bs pointer taken from bitmap: it's definitely bad aligned. That's
because we are in use after free, bitmap is already freed.

So, let's make disabled bitmaps (being migrated) busy during incoming
migration.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 migration/block-dirty-bitmap.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 975093610a..35f5ef688d 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -839,6 +839,8 @@ static int dirty_bitmap_load_start(QEMUFile *f, DBMLoadState *s)
             error_report_err(local_err);
             return -EINVAL;
         }
+    } else {
+        bdrv_dirty_bitmap_set_busy(s->bitmap, true);
     }
 
     b = g_new(LoadBitmapState, 1);
@@ -914,6 +916,8 @@ static void cancel_incoming_locked(DBMLoadState *s)
         assert(!s->before_vm_start_handled || !b->migrated);
         if (bdrv_dirty_bitmap_has_successor(b->bitmap)) {
             bdrv_reclaim_dirty_bitmap(b->bitmap, &error_abort);
+        } else {
+            bdrv_dirty_bitmap_set_busy(b->bitmap, false);
         }
         bdrv_release_dirty_bitmap(b->bitmap);
     }
@@ -951,6 +955,8 @@ static void dirty_bitmap_load_complete(QEMUFile *f, DBMLoadState *s)
 
     if (bdrv_dirty_bitmap_has_successor(s->bitmap)) {
         bdrv_reclaim_dirty_bitmap(s->bitmap, &error_abort);
+    } else {
+        bdrv_dirty_bitmap_set_busy(s->bitmap, false);
     }
 
     for (item = s->bitmaps; item; item = g_slist_next(item)) {
-- 
2.29.2


