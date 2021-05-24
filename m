Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D47F38E3BE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 12:15:08 +0200 (CEST)
Received: from localhost ([::1]:40792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll7c3-0001Ly-3n
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 06:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ll7aL-0007Hg-Nm; Mon, 24 May 2021 06:13:21 -0400
Received: from mail-am6eur05on2116.outbound.protection.outlook.com
 ([40.107.22.116]:27488 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ll7aJ-0001TQ-Ub; Mon, 24 May 2021 06:13:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5VDFxByMk/ZADvYJIJcMOpVGDVmi912pdtrPaMVD4frHRfXf8Fo3PIyYe5UU4hF4J5vfPmG64u0LpThtQw4hgLk2oakKqg67vymGjbDw+OSzP7u6CMslmt4+EGCh0TOnMVYPFbl0gAMXee0PDKOrnAuUKQSHpGMmfexHBN0CpQMjo5YRsgYvP9ZPaMDt08DF4b2PwIaTJPYqDsP5KOy51XNTxIrocsgaF2u1BH8aGpfdtSWtJz1GsamS3y59qfODFZzXaClIgPgsAMqeu9Xq3MDYUR4Q/t7hUMBY5vVbWEKJwxeMYcZtnvZSiLhNtvfDkg6yoS+HMMwpXO8N7Kllw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4W9auNu1VkK/QntkwWrvlaR5BxI6dNGqbw0D0vADzY=;
 b=MYgHONznWGi+C7CfNGvMOwCVgiEfdf4zHhWFWBYu6aQCitWtxhoIug6mqIFnwVUe5x1XMXqxKTycR1jO0wZx02qAcndlaplLXRsX27Pf+P9rUUEjtHrydMchYfgP+3pEHd2zxTNlYLcQ+OlzewiwcukUy0xybGkSdqzaJX3ICOs/kKPf28OwnnBQA0AFbnL4EfohNVzBqBfg37j9iCqXm4med7UbxDRID4YMkazwENutOUewgNOqoVMe7xewInUpwt9+sRzqZ5ZM3LT0+fEzpVdkTVHjXv9j7KQWQoOvpMIdGitchvh/qtszg5cX3TsLgzH6VjWAVB6rA9PFuKdPvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4W9auNu1VkK/QntkwWrvlaR5BxI6dNGqbw0D0vADzY=;
 b=YC42+NYZ688DrlRVIPJldmziZq50v8LQ2He7AM8+WOw4o74mScfuZoHOsdS8j32xuf1kjjyhmomd2ccXg+oKhOsFbJusXXPOtflDxM/3NvW3m9zKevNGtVj2eqbA67S2r3BXT7dj+xvT7EXac7+hq6Rx2v+9QPgEU+3RgWSfwmU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5446.eurprd08.prod.outlook.com (2603:10a6:20b:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.31; Mon, 24 May
 2021 10:13:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 10:13:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, programmingkidx@gmail.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: [PATCH 2/2] block/vvfat: fix vvfat_child_perm crash
Date: Mon, 24 May 2021 13:12:57 +0300
Message-Id: <20210524101257.119377-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210524101257.119377-1-vsementsov@virtuozzo.com>
References: <20210524101257.119377-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: HE1PR05CA0186.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.195) by
 HE1PR05CA0186.eurprd05.prod.outlook.com (2603:10a6:3:f8::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 10:13:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54b6fe3b-8419-45d4-0a90-08d91e9c8a71
X-MS-TrafficTypeDiagnostic: AM7PR08MB5446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB544646D7BC8CAD0C580C8D23C1269@AM7PR08MB5446.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:37;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T6JcCOt0E0nhT3wrlCKqYYRqK9gdvPfbimazwKRicqC2wCtJLZoFxgjJUmvCHewV4cCkwRoJaPZxItjaN0wAA8KMDVznnjGm9ShR/JTcCaLlkeAGisoo9O4s5HaWRe7bWxIR0G/B2Q9Y4LNVfR+FZ6zxh5SGr8FB9hjUEFs7zwSIcb/Vh+PFwva+ulIHecaVeri09W5mp+BRwyvL7/qu6wAUefFSJDekyg9W+LcSnZ6dZI9wrm9vaH8dopl0L0IwDbpULgTrdg0B4KdEw5ELAUBVS3BHztSMsJvxXORQZgW8pZNGgPdatnsFAI0oIMX6YC1vzH0FbDUbbsmoOIdQFFS72yuU841i5tZCTP0K2BTZaRccRwvITkckaxxpj3zlC62pccvGafr8C0K70CdYez6Vtt4DBxth7TZtAY4tTltV5c/O4OUl7rLuzJKNKwrTWoKN71YUzWn2t8P4o3q+gbxGIRKi7IIwUVrqs5reOOnkaTzLF/VUZfHlZ5TnK2r9MAmnUAw7IlAImozCJM22yoUJEK5QFA2B1X87PBvAt9NCqmFR0/KgTpYcSHtRPUXnIqrNZezUxw5vOtC2CuX85gzNK89MwfBmyGFrl+K0E1dbbjEzAfs16OL7duWyh9Nrc3f35de8n9XEcl0OOX+wPJmfxC4x008vmJ+gh+CYR7p/O/TYn0jvMoXRT4FFBLBK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(39840400004)(136003)(6506007)(66946007)(66556008)(6512007)(4326008)(6666004)(66476007)(52116002)(86362001)(6486002)(2616005)(107886003)(36756003)(5660300002)(2906002)(186003)(6916009)(956004)(316002)(38100700002)(38350700002)(478600001)(8936002)(1076003)(26005)(8676002)(16526019)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KBw20XA4dUJVS1Sq/ihnOEdOsRR0tOveG6q35Vw5aYjGjOfLN2tKiH1cUq9t?=
 =?us-ascii?Q?dvy6K/+jwHXLjqrU9s9CrGp6lpA5QI5R+zGMFD4maTiKW5KQfHc/lS9XJ1oy?=
 =?us-ascii?Q?ZC1ExkZR0qbiaVqrmQTAXKlO8vjL+7NVlK5VPFC69BYXszRIhWwVLZ5iXj1U?=
 =?us-ascii?Q?50dpinM4FqAROFsvk/ZDQGr0jFaPTh7G+IfV1LMbLd4rkdJDsz5lRr39y5ST?=
 =?us-ascii?Q?hRIFgbNkbVRjFoHSHiVDhkdfsyY1hhqDfW30km9yFn7zSjnQzN1CjF3IX98S?=
 =?us-ascii?Q?HorGqUN4WDDGYC5/lZVHVHTmeKHp8QbZ9YXL7tTl4obiuiUKgzQp/qd8Y9zc?=
 =?us-ascii?Q?65BOiixbJFWyfQ2h/3UtNI5sMi0+hPe6phw/A1UF5d34lefGOe/mJVsUS6E+?=
 =?us-ascii?Q?YG0xk1l7sA0SfGXz9ARXj7snTJ21s4l9ypsnrxNlRFK8eQtnroAi0RdzsiaW?=
 =?us-ascii?Q?X8L1UK3n4LAYx2FL0L8MwYvCwW7b3ap+BzTnv/PP1/7kCpl4ALdFjXJGfwfc?=
 =?us-ascii?Q?RVWR/KyouL6kQylanGnSC+ss2W1j2ZD0FtN4NKlMGx7JQEzyujOR0z/7kI6y?=
 =?us-ascii?Q?PzpKMWoZllpBzVkpCuBkRollDqQv3vpQz11IGxVDS3ewD+h5ihvJZPAGndwM?=
 =?us-ascii?Q?8Qeh9lVvwyPxj+yZvvWxpZM1GLKPmpH16XPfV3Z7VbItA5pxEonLgV8UbKVI?=
 =?us-ascii?Q?I4AoEFoClkHq5kWIuOdkEkedhZeXnAQ7m8R5BY0wjGbs6fFvT/GRELBDcYpN?=
 =?us-ascii?Q?Bd0odzPdJ4EB7jzemXSSIf6UwRVTV+eExyM6GewhPqcgKSHLMxE3TkLmPPAL?=
 =?us-ascii?Q?dskUAEySj6Vut7b8CPWE1ZbWSqq9bX/L5Cb3uI/UiCCl40iiHQy7InboL8pA?=
 =?us-ascii?Q?0n4+r0O6TqI/vQh786jIZK2by9GxBuYjOURc9NfdiIQY8eWeNAZxNjF50CGt?=
 =?us-ascii?Q?sYEMGNxszugigtwMWEogwTXJMQLApOWa6cObnrQqozSJdLoGiwp9QHm283pT?=
 =?us-ascii?Q?IapKIesvBcjkb+cHX4cd8fcCLBqA9dM85WbtXOUnFN7Ay7n2yuCIcAxANfSG?=
 =?us-ascii?Q?IszIULMIdLBzN6xRXyZ/sQELr5CvRhYxN50GdO96+FrnRoZnVgHlK+bU2YIu?=
 =?us-ascii?Q?S2ZDQPD7FVyuGERvVViyekaVvzkhBbgFBgLjFggs7juKx0so8LL6TICC5FZw?=
 =?us-ascii?Q?yKJIz1fwsw5ZLXlmnR3XcXK0V7S01hyv78wh5XFxtErA721qoVXag/gUKphi?=
 =?us-ascii?Q?pXfiY1h4GgXSyIvbHUILmkmlbpZ4VMz8BVeNu/njiAAYYE5GUleiQZiF62OY?=
 =?us-ascii?Q?3++sE3DTjkwTQ/0e67eRnVgx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b6fe3b-8419-45d4-0a90-08d91e9c8a71
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 10:13:13.7694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bz493QCGyQCeRM0DRH03cIULiinS9bXVp2aFKWMdbCd7W0pic0N6C1HRUJyzp4j18m3I5A/OPLRjfuimVyeTyClU9B+RkowwAokarpj5zis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5446
Received-SPF: pass client-ip=40.107.22.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

It's wrong to rely on s->qcow in vvfat_child_perm, as on permission
update during bdrv_open_child() call this field is not set yet.

Still prior to aa5a04c7db27eea6b36de32f241b155f0d9ce34d, it didn't
crash, as bdrv_open_child passed NULL as child to bdrv_child_perm(),
and NULL was equal to NULL in assertion (still, it was bad guarantee
for child being s->qcow, not backing :).

Since aa5a04c7db27eea6b36de32f241b155f0d9ce34d
"add bdrv_attach_child_noperm" bdrv_refresh_perms called on parent node
when attaching child, and new correct child pointer is passed to
.bdrv_child_perm. Still, s->qcow is NULL at the moment. Let's rely only
on role instead.

Without that fix,
./build/qemu-system-x86_64 -usb -device usb-storage,drive=fat16 \
    -drive \
    file=fat:rw:fat-type=16:"<path of a host folder>",id=fat16,format=raw,if=none

crashes:
(gdb) bt
0  raise () at /lib64/libc.so.6
1  abort () at /lib64/libc.so.6
2  _nl_load_domain.cold () at /lib64/libc.so.6
3  annobin_assert.c_end () at /lib64/libc.so.6
4  vvfat_child_perm (bs=0x559186f3d690, c=0x559186f1ed20, role=3,
                     reopen_queue=0x0, perm=0, shared=31,
                     nperm=0x7ffe56f28298, nshared=0x7ffe56f282a0) at
    ../block/vvfat.c:3214
5  bdrv_child_perm (bs=0x559186f3d690, child_bs=0x559186f60190,
                    c=0x559186f1ed20, role=3, reopen_queue=0x0,
                    parent_perm=0, parent_shared=31,
                    nperm=0x7ffe56f28298, nshared=0x7ffe56f282a0)
    at ../block.c:2094
6  bdrv_node_refresh_perm (bs=0x559186f3d690, q=0x0,
                           tran=0x559186f65850, errp=0x7ffe56f28530) at
    ../block.c:2336
7  bdrv_list_refresh_perms (list=0x559186db5b90 = {...}, q=0x0,
                            tran=0x559186f65850, errp=0x7ffe56f28530)
    at ../block.c:2358
8  bdrv_refresh_perms (bs=0x559186f3d690, errp=0x7ffe56f28530) at
    ../block.c:2419
9  bdrv_attach_child
    (parent_bs=0x559186f3d690, child_bs=0x559186f60190,
     child_name=0x559184d83e3d "write-target",
     child_class=0x5591852f3b00 <child_vvfat_qcow>, child_role=3,
     errp=0x7ffe56f28530) at ../block.c:2959
10 bdrv_open_child
    (filename=0x559186f5cb80 "/var/tmp/vl.7WYmFU",
     options=0x559186f66c20, bdref_key=0x559184d83e3d "write-target",
     parent=0x559186f3d690, child_class=0x5591852f3b00
     <child_vvfat_qcow>, child_role=3, allow_none=false,
     errp=0x7ffe56f28530) at ../block.c:3351
11 enable_write_target (bs=0x559186f3d690, errp=0x7ffe56f28530) at
    ../block/vvfat.c:3177
12 vvfat_open (bs=0x559186f3d690, options=0x559186f42db0, flags=155650,
               errp=0x7ffe56f28530) at ../block/vvfat.c:1236
13 bdrv_open_driver (bs=0x559186f3d690, drv=0x5591853d97e0
                     <bdrv_vvfat>, node_name=0x0,
                     options=0x559186f42db0, open_flags=155650,
                     errp=0x7ffe56f28640) at ../block.c:1557
14 bdrv_open_common (bs=0x559186f3d690, file=0x0,
                     options=0x559186f42db0, errp=0x7ffe56f28640) at
    ../block.c:1833
...

(gdb) fr 4
 #4  vvfat_child_perm (bs=0x559186f3d690, c=0x559186f1ed20, role=3,
                      reopen_queue=0x0, perm=0, shared=31,
                      nperm=0x7ffe56f28298, nshared=0x7ffe56f282a0) at
    ../block/vvfat.c:3214
3214        assert(c == s->qcow || (role & BDRV_CHILD_COW));
(gdb) p role
 $1 = 3   # BDRV_CHILD_DATA | BDRV_CHILD_METADATA
(gdb) p *c
 $2 = {bs = 0x559186f60190, name = 0x559186f669d0 "write-target", klass
     = 0x5591852f3b00 <child_vvfat_qcow>, role = 3, opaque =
         0x559186f3d690, perm = 3, shared_perm = 4, frozen = false,
         parent_quiesce_counter = 0, next = {le_next = 0x0, le_prev =
             0x559186f41818}, next_parent = {le_next = 0x0, le_prev =
                 0x559186f64320}}
(gdb) p s->qcow
 $3 = (BdrvChild *) 0x0

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/vvfat.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index 07232a7cfc..86d99c899c 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3209,15 +3209,12 @@ static void vvfat_child_perm(BlockDriverState *bs, BdrvChild *c,
                              uint64_t perm, uint64_t shared,
                              uint64_t *nperm, uint64_t *nshared)
 {
-    BDRVVVFATState *s = bs->opaque;
-
-    assert(c == s->qcow || (role & BDRV_CHILD_COW));
-
-    if (c == s->qcow) {
+    if (role & BDRV_CHILD_DATA) {
         /* This is a private node, nobody should try to attach to it */
         *nperm = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
         *nshared = BLK_PERM_WRITE_UNCHANGED;
     } else {
+        assert(role & BDRV_CHILD_COW);
         /* The backing file is there so 'commit' can use it. vvfat doesn't
          * access it in any way. */
         *nperm = 0;
-- 
2.29.2


