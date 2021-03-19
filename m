Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E1D34271E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 21:46:49 +0100 (CET)
Received: from localhost ([::1]:43962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNM1A-0001QA-PO
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 16:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lNLwR-0006Rs-8E; Fri, 19 Mar 2021 16:41:55 -0400
Received: from mail-db8eur05on2115.outbound.protection.outlook.com
 ([40.107.20.115]:11872 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lNLwM-0000km-Br; Fri, 19 Mar 2021 16:41:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nR6uHokrNUT9y2mCUt1vb1fUDvtKgQJvpUR5+z92U6lmPaP6yglhz1oFF0eSB23nhrw+K6bCAkB8TXd728SJzJwSjr0ZwCo4OYEO0WRrqHfjUthWrK7Zn3rRzOT43deH8Sk3aiPPxd0pzjL/CZDUXoYZa2US+uVPyRG/bqPTzFW1joG4uMqMPjzpuJOfOPB61huCpXdDLkO/Q6NgEZIb/ZxrVCRZjOCiKOqQSHjwckSUcI/RmTP0La46d7hvsNR9gje5R48IQpoWMEmorJS0mxMr9/h1rCxaZ5DgW1bIe50iR8CvNdzUACeUvmEi7wpRTKGho0WaduFiIz2cznZQ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXZAthAOCVj9CHmxfKHSKpmnm21kvNSXAJ4IWE/G9Oc=;
 b=XfjZ1RmZKrn0pmmzneDeOxojO7E22PKRkEdJA0ND1C9b4nNaioPv3qOY7KU036qjcTMYwUyRnEdw30Dyg0NvH52tTP0p34e96gUaXfskI6P31Y9qkwcOqmK74Un7TFq6F76aNuxLGsiu7n0PKC5s5v39J2Ml5BEtfyKK57/WE2muzuzx7sDvF5c+fbPfNOvpF728AYa7raCImxyvN1zzeEeKJGTc4GMh8XCREFYkrYnlEeUCwYHUxAQOZYqmCh9ASvnH4IKOLiwDce+xrJ1jqSL+VeMsGxAQlZ0nBO9cSwNqWJT/NM4xHJR6hhGQSItMDRq8kSclcGcKf0ld7yoHCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXZAthAOCVj9CHmxfKHSKpmnm21kvNSXAJ4IWE/G9Oc=;
 b=cYnrlHeb58DJOGhoB42M3jmO5j9BHhQukVF/BTQJBYpx1gOP0I7PDbx2j1nAsxLzAtjiMAnzAOpqadA6FyBAbo5drQ9+DrDlLbRAjUVIQVXk/C44gUujXbGd8pU3z3QPi/VcNDyVyFsQKNw7G7IP6gdoNsb5jPgJMVsScrgRiG8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6134.eurprd08.prod.outlook.com (2603:10a6:20b:291::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 20:41:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 20:41:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 dgilbert@redhat.com, quintela@redhat.com, fam@euphon.net,
 stefanha@redhat.com, jsnow@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com
Subject: [PATCH 1/2] migration/block-dirty-bitmap: make incoming disabled
 bitmaps busy
Date: Fri, 19 Mar 2021 23:41:23 +0300
Message-Id: <20210319204124.364312-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319204124.364312-1-vsementsov@virtuozzo.com>
References: <20210319204124.364312-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0402CA0008.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0402CA0008.eurprd04.prod.outlook.com (2603:10a6:3:d0::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 20:41:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6348f3cc-a7e7-4a94-134c-08d8eb176763
X-MS-TrafficTypeDiagnostic: AS8PR08MB6134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6134E2157C47BF7B52D796F9C1689@AS8PR08MB6134.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xs4RbkQ/BpkwSl2P45RbusQshae/Cywf1Sb5ffhgh9LgnD2lfeG2ahAzR8qicpJwimfvf2oLiVmmsTwXRcshv+dqMPwh/zSz057qJT4sElxaq3G1p5PYLufB6BcYr8yMvy/CyEeMRBPGppHao6sS+ygVFY39NwD9dMjJ1Iay3x63G+jh+ii7MHVveBlb1/Vng3oWaoiiAQ+VF6TM9301W76prhcRzEGT+7m+jwiI4FeAF3QjAjefXw3OgxSNNIF6Pr+hMXUaMUEAnCwgY38LVUbb6dLGJh9W3rNBmvtpvy/DHB+UhSSP3PILy0z8H/NqBLLwHdZ7XYqsOmP36m3HpvqIW6QjU2hQWR1ARiWWg8Fpk7p8v8TBmu2DzjzLFqxZZjyCWJm6C4xbxN7ijqb2JEiybVNxqXsqay/dXR0tOJLj+Oeb15fZg0oahcTzy08jkWy4L6//x/i/wuEMJVZp2QzUnLTHYEW4sLGdbF2grLKAmmraFM2XXoYHv23pEU4tZZURKdpmcHBUKeN9v577W6Ouo5Y4KBIfPMh9wZnx665qFD0Wu+sIHC0x9FW0qeB9np1g3dzhc37Fli2poeoEdS0jre7W1vhSZsM/JJgByPcUYASjahqZ5QOX0BxFmpo6fdgKmHHyFiCgvJThWspoJ+u36qLsohyhT3Sp6D3Ubx7chIlcQ16bz6FDn7FzIH13aEHMmPQFKPGQwJi4s0wrfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39830400003)(136003)(396003)(346002)(376002)(26005)(478600001)(7416002)(66556008)(38100700001)(16526019)(316002)(956004)(2616005)(8936002)(5660300002)(1076003)(2906002)(186003)(36756003)(4326008)(86362001)(69590400012)(83380400001)(6916009)(6666004)(52116002)(8676002)(6506007)(66946007)(6486002)(66476007)(6512007)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RU5zYy53E2CaZdkxqCLFnpqxQzU/geUGX+LcsVgCWIFVdbhhP9MyiwFc9uNU?=
 =?us-ascii?Q?6K6uDjo2yzWa8oEphxlo580Cl3BNi8psTWEI0FRj8y9D4FkHpPZELA0+vEjH?=
 =?us-ascii?Q?2TUKq0WyAo8ao5RrVxPGfs3W82hqtJpoG0E+seVYC7TYKsV4VirewouX8E5c?=
 =?us-ascii?Q?77nSxTy+Ubo02ix1at/GUuaExSc7aiidJ/QF3zUTnDmdFKf5EVb+77JTawBk?=
 =?us-ascii?Q?KZikptJCOypSvqM6rSh/ijLV6/2d4YT48O3jnY0iY1Lpp793qANZjNQq6efj?=
 =?us-ascii?Q?Fj9SvQI/JtABJ0g1PlIQgO7D7WtLParzNNOiMzpcP+eGIoRR+6CvL68BMlDD?=
 =?us-ascii?Q?IChjR0M5b6gusIao9PqbtISAqRugARd0bCy0Q4RhhP9NcJLz37Rv1C/romyi?=
 =?us-ascii?Q?g2ItjuE6XaYlnBbdasnaFgovpIq+izPbpM7vOdDP0oXugBfYLIaPFR/NcHcN?=
 =?us-ascii?Q?bDmT4OJmIs2z2gpY8PfCKCsmwdvkYM9mzSNe0TOcz1v6RsyW30Qlbdf5mFPU?=
 =?us-ascii?Q?REVpJHWz9m1HNOTE5AIFLkuCZNblj4p0VT1h5WLsMfmx3JFIAWTSKqP9Ufs8?=
 =?us-ascii?Q?Sm5JFx8z/WQJwT1Cj498U6W5uXLKaAoeqpWC6RqneSZiN8QGNLVXev3sQE0g?=
 =?us-ascii?Q?CMmVpzhh4G1w3elSWMMh7quOZGabpjgWTDBPg3FXOBCkWct3aWPERD9ULu15?=
 =?us-ascii?Q?EKBRuJ8/oRYXjCQwP3I8zy+gAGyxAQbCzKe1UpAHc4X8JXnbet+LNHyYBzlp?=
 =?us-ascii?Q?iaxkFT3AYcTNZqkABsJ5cyfJJffl2Fc9i44/2BVLPPxWI9sJN5ytV7jX9az4?=
 =?us-ascii?Q?/5zriQ87l4++4NI4EISKWDwWAc+jygTTWgJTQMEyrKYCuFCwzOUIeV/wlEC5?=
 =?us-ascii?Q?0DtgfSlg6NbrnLiLoj7NQ2PPKvRQ5wCECUKpN0k31OR0Aqo4TpUB/Ro8XvMm?=
 =?us-ascii?Q?PX3rUqdMjWw6kiLxqAVVfHM3yKi8TPSN+dST34F92tEjxH8WAMVLluG/YF0h?=
 =?us-ascii?Q?JCXaagV0zdsb6KJQvaMwwBZvTYgTJVibDDCYIKaA6egf1E2e8nFc2+8GnXNe?=
 =?us-ascii?Q?rNZo+BfM1kTA8SZYxdPxn3uiG+zk+Br+W6rWV8mxjSV5w2DAPdZI9+yOJ/z1?=
 =?us-ascii?Q?4/IzhVrWLpfD76cqHtYigTVV6v4am935ubtLs7EAklY9O7/sus+yPcYaJL2C?=
 =?us-ascii?Q?XY9epshxJiBCTVuCgp/1MBgoERRRX0atUGd02FRosCy+GATtfnWNf8xRu+Xv?=
 =?us-ascii?Q?yoAGTIwskIBoXjN6+20N5FU9ikFD3rJPsPeJofSadoCTm4e4v4/n+hGdFbJK?=
 =?us-ascii?Q?8Hc3sWfoWrhlol5gqiGpG4z7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6348f3cc-a7e7-4a94-134c-08d8eb176763
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 20:41:42.5879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HlabjdIPebzqkVigrce1DgEn3lnaXgADXosmbaY/3cmKT3t3IuIl0RK71nU/C6eeDV0HIDLoFkry0N6GIGn3Hq8Y3fgIDWTUzyo516k+pXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6134
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


