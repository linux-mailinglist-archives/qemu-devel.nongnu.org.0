Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130B42B7BE6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 11:56:14 +0100 (CET)
Received: from localhost ([::1]:48824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfL8H-0001Wp-5e
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 05:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfL7F-00010G-Cv; Wed, 18 Nov 2020 05:55:10 -0500
Received: from mail-eopbgr00129.outbound.protection.outlook.com
 ([40.107.0.129]:22758 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfL7A-0008TH-Hm; Wed, 18 Nov 2020 05:55:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLP/2afe5xTLEhzHdPvH0UWdacKVUADb79Kaueyw7wGxiJsom7wFbwIV8x3VJ3qI4j4yUE157PxJDMsvAlhN0ZpbUubKKBk5gUNxDhYhle7pBJnoM6m/0zHZBk0kkGYlQxdxwzdmE47KJ6JdNPDYvy3a9OmMyaTX+rVP2ASL/WRDPgTMWif6iwYl2XYTy/IGGYoP8HJQChsHI46XiwHkHCJxlgHTpK/ypU6bMh6cPni/E0rU/QZWCGWk5v3otKattF4w0EjAczrePn8T0/BrDzrL2aj1BLmIgesxJJ8zb9GiK8tH0yF7+1hFg3N5v6vgA3A34OR3AUIuzbyCFkMCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38vWYtb9lX3vVqCrI8jF5qkMT53UE47wfQ6/Dl/iby0=;
 b=bItNiCZNcVBI6KhDBsuQaN06si6EohgdJPm3rcokh0fogFc/nT4emrICX48oCpkcBMjk39kI0yOj0qhsPIdUUzuk/4RY8m98OCOgNjjOvbpkDZfpaXkf1LK05yEgVAYf5OJQrEekyfpguWPnGkmdCc89tWuYbsAHelieuUbLtSttmv3mx3awHZeaHKB/GQm5iu86YM41Lr1FXlicj2VNEiDgBUIl8pwZaqtYrQrbal9xwsY9DD9RLsz+VkumeYVSQZjlX8AgJb8STfTLR7TIFUUIl6RFq+mJAQLN64GyNa2l8H8X/YpJ8/dAVS+K1PYbAtn/3VWxlgJA2gBhV8xaYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38vWYtb9lX3vVqCrI8jF5qkMT53UE47wfQ6/Dl/iby0=;
 b=BUY9L3NHtufct+TKrXy8wUYMDQt+zdr76JWj21Ua99ZS9U+GitHj0gPx6fiuxBa8jo677Kc8Eo6qkbleDuS0SFetCta1mjE5pRCZny3ykb+vmdhjIqae3ZaMyGYL5UMKkasSvCoBK0mjWzu8+dJx3sRO5EmsZswsisUG0izsQvQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4405.eurprd08.prod.outlook.com (2603:10a6:20b:b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 18 Nov
 2020 10:55:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 10:55:00 +0000
Subject: Re: question about bdrv_replace_node
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu block <qemu-block@nongnu.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <54b9259e-1344-b3a4-2f8c-9bd79f950a74@virtuozzo.com>
Message-ID: <3894a8a0-97d4-1780-311d-a77ff0ba8d18@virtuozzo.com>
Date: Wed, 18 Nov 2020 13:54:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
In-Reply-To: <54b9259e-1344-b3a4-2f8c-9bd79f950a74@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.112]
X-ClientProxiedBy: AM0PR01CA0163.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.112) by
 AM0PR01CA0163.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend
 Transport; Wed, 18 Nov 2020 10:54:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fc640d2-6855-4cb3-9275-08d88bb064f6
X-MS-TrafficTypeDiagnostic: AM6PR08MB4405:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4405DDF4BADAB15D5FAC9D0AC1E10@AM6PR08MB4405.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CEkuYhjHO1iXWgIDV5+u48w/ca8PKliHlbSeRzG7upQLZ4uhWcmPk5VklTefLAEFFzgv3OXLzurQ4dCjbSPmZkqPbdCihhwZv6RscghCBI3k6IpajeOe1jeLeFV+JYuct4EXiKB22ZcHHjCJxkHb1RlJN2QeXycmWaaB54BBX0eBv6J8a5gd/WO7Yes3ZvUxMxh8B5a4CHQZ0U9G3SMttZ6GdnntQ102fzzCvxttJe7vqaXqtXkwDeaNIbyvUvPxoZPQC90mxVhDBXj8jxJKwNnkXCv07cac949Fz7veNFXRmSAr5vhEbO/Engbqv9obpPYoH+Wzm4td5OuqeFtodulg8QNZfAGpn76+bU6DagZY0HXbGH2shjWay/UYJSp5nT3Me3UG9FPHCfj6DkNGTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(346002)(136003)(366004)(376002)(16526019)(2906002)(8936002)(4326008)(36756003)(86362001)(186003)(6916009)(26005)(54906003)(31686004)(8676002)(6486002)(66556008)(478600001)(956004)(2616005)(16576012)(7116003)(66946007)(316002)(66476007)(52116002)(5660300002)(31696002)(83380400001)(30864003)(60764002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: pEr+6XLVayCH7nHALgcXQ8SWA0KTFmzbMRwRonZbD82YW6k6dVy37j37gLAKhQ13C1h4GMBOsyfdVN68ZGeLMxUMVNzSUYTeQz+1RuxNBmJLDbPcs2Z36y3TYfhVgC90u+cwJyYVZOcWurky78iRKLYZV1u16KpB+e9b8L0IWsmy6bsmlpu2wbm/vphGw4B6QHnqsg/okVUH5ZwW29IRwVJbfVVW4lcnvhAntsKepjagZiMyMXzT+Dv7WPDRw8lYUT3w940YulxNbags1oZSjTJ6FfvBwxYtTwRH3ejNOGGw0bAF6koOoix8CWOos1FMgdCiMTxYDwe4eoxB5oBfgjJXkRNtQe5m2odnxslOKf873ks7KdEyyXwtHXdoQXzhEdD/29nIcCQRj/udWVO1eLO/Q3Sm7zRr1PPxr649SAImjco5JAFazm4IzqW8ShKfF1ysGcDmxfoMW7t2hB/n+nTQKiS4SkceWiUu2djLdTHXNUQX8ilP6rSs5eYkPVUH8llp7ct7Xr9hicfcIFakC4Bd+DK/hBXMGEyT+m/4ekt2JvJ5aX6cv/jY3o5ILxzbVugpfKA9Aje8Yoi8sMx9QEWRGjATrVt9hZvKvI2iRXiaOuaxrPDU+nk54clzINVtZfCfMTOrWalkfiYVdwcnog==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc640d2-6855-4cb3-9275-08d88bb064f6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 10:54:59.9212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPWQnSccB8rOb6/gCTwekNF7ytWRqz2YXKg29jGT17bRZTlko+2nBYalXwZmsrgFfOg/C2W+9OkHpNaFqWr+ejuFOLh9yuUrWH7PppVOkyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4405
Received-SPF: pass client-ip=40.107.0.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 05:55:01
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

18.11.2020 01:28, Vladimir Sementsov-Ogievskiy wrote:
> Hi!
> 
> bdrv_replace_node_common() keeps old node parents in a list and call bdrv_replace_child_noperm() in a loop..
> 
> But bdrv_replace_child_noperm() may do aio_poll, which may trigger any graph change, up to freeing child which we keep in a loop.
> 
> Actually I've reach something similar with a lot modified code, not sure that it may be reproduced on master. Still, here is a backtrace, to illustrate what I mean:
> 
> #0  bdrv_detach_child (child=0x5555557e50e0) at ../block.c:3073
> #1  0x0000555555609d53 in bdrv_root_unref_child (child=0x5555557e50e0) at ../block.c:3084
> #2  0x0000555555609e57 in bdrv_unref_child (parent=0x55555582de10, child=0x5555557e50e0)
>      at ../block.c:3124
> #3  0x000055555560db2a in bdrv_close (bs=0x55555582de10) at ../block.c:4728
> #4  0x000055555560e7eb in bdrv_delete (bs=0x55555582de10) at ../block.c:5056
> #5  0x0000555555610ea6 in bdrv_unref (bs=0x55555582de10) at ../block.c:6409
> #6  0x0000555555609d5f in bdrv_root_unref_child (child=0x5555557e00d0) at ../block.c:3085
> #7  0x0000555555588122 in blk_remove_bs (blk=0x555555838df0) at ../block/block-backend.c:831
> #8  0x00005555555875c0 in blk_delete (blk=0x555555838df0) at ../block/block-backend.c:447
> #9  0x0000555555587864 in blk_unref (blk=0x555555838df0) at ../block/block-backend.c:502
> #10 0x00005555555aeb84 in block_job_free (job=0x555555839150) at ../blockjob.c:89
> #11 0x00005555555caad3 in job_unref (job=0x555555839150) at ../job.c:380
> #12 0x00005555555cbc7f in job_exit (opaque=0x555555839150) at ../job.c:894
> #13 0x000055555569a375 in aio_bh_call (bh=0x5555558215f0) at ../util/async.c:136
> #14 0x000055555569a47f in aio_bh_poll (ctx=0x555555810e90) at ../util/async.c:164
> #15 0x00005555556ac65d in aio_poll (ctx=0x555555810e90, blocking=true) at ../util/aio-posix.c:659
> #16 0x0000555555639c2b in bdrv_unapply_subtree_drain (child=0x5555557ef080, old_parent=0x555555815050)
>      at ../block/io.c:530
> #17 0x00005555556062e1 in bdrv_child_cb_detach (child=0x5555557ef080) at ../block.c:1326
> #18 0x000055555560918e in bdrv_replace_child_noperm (child=0x5555557ef080, new_bs=0x0) at ../block.c:2779
> #19 0x0000555555607f11 in bdrv_replace_child_safe (child=0x5555557ef080, new_bs=0x0, tran=0x7fffffffda08)
>      at ../block.c:2189
> #20 0x000055555560dfce in bdrv_remove_backing (bs=0x555555815050, tran=0x7fffffffda08) at ../block.c:4884
> #21 0x000055555560e3fc in bdrv_replace_node_common (from=0x555555815050, to=0x55555581c1e0,
>      auto_skip=false, detach_subchain=true, errp=0x7fffffffda80) at ../block.c:4972
> #22 0x000055555560ee57 in bdrv_drop_intermediate (top=0x555555815050, base=0x55555581c1e0,
>      backing_file_str=0x55555581c211 "json:{\"driver\": \"test\"}") at ../block.c:5318
> #23 0x0000555555583939 in test_drop_intermediate_poll () at ../tests/test-bdrv-drain.c:1822
> 
> Here a child is detached which is kept in a updated_children list in bdrv_drop_intermediate(). And we'll crash soon with use-after-free.
> I'll try to find a similar reproduce on master, but anyway, it seems to be a wrong design to loop through children with possible intermediate aio_poll..
> 

OK, how to reproduce on master with simple change:

1. Add a "feature" to bdrv_drop_intermediate: drop old backing link from base overlay to base, so that dropped intermediate subchain is separated from the rest graph. It make sense only if user keep additional reference for the subchain being dropped (otherwise the chain is removed anyway together with backing link). Still for safety in common case, make additional ref/unref pair on top.

--- a/block.c
+++ b/block.c
@@ -4948,12 +4948,30 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
          updated_children = g_slist_prepend(updated_children, c);
      }
  
+    BlockDriverState *base_cow_parent;
+    for (base_cow_parent = top; base_cow_parent->backing->bs != base;
+         base_cow_parent = base_cow_parent->backing->bs)
+    {
+        ;
+    }
+
+    bdrv_ref(top);
+
      bdrv_replace_node_common(top, base, false, &local_err);
      if (local_err) {
          error_report_err(local_err);
          goto exit;
      }
  
+    /* Drop old backing link to base, why not? */
+    bdrv_set_backing_hd(base_cow_parent, NULL, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+        goto exit;
+    }
+
+    bdrv_unref(top);
+
      for (p = updated_children; p; p = p->next) {
          c = p->data;
  

  
Now test is crashed:
# ./build/tests/test-bdrv-drain -p /bdrv-drain/bdrv_drop_intermediate/poll
/bdrv-drain/bdrv_drop_intermediate/poll: Segmentation fault (core dumped)


(gdb) bt
#0  0x00005555555a8c30 in aio_disable_external (ctx=0x0) at /work/src/qemu/master/include/block/aio.h:599
#1  0x00005555555a9c2f in bdrv_do_drained_begin_quiesce (bs=0x55555581e7e0, parent=0x0, ignore_bds_parents=false) at ../block/io.c:387
#2  0x00005555555a9cd8 in bdrv_do_drained_begin (bs=0x55555581e7e0, recursive=true, parent=0x0, ignore_bds_parents=false, poll=true) at ../block/io.c:406
#3  0x00005555555a9f15 in bdrv_subtree_drained_begin (bs=0x55555581e7e0) at ../block/io.c:439
#4  0x00005555555fb8bf in bdrv_reopen_set_read_only (bs=0x55555581e7e0, read_only=false, errp=0x7fffffffda68) at ../block.c:3905
#5  0x00005555555f5ada in bdrv_backing_update_filename (c=0x5555557d60d0, base=0x55555580b250, filename=0x55555580b281 "json:{\"driver\": \"test\"}", errp=0x7fffffffda68) at ../block.c:1203
#6  0x00005555555f5dc9 in bdrv_child_cb_update_filename (c=0x5555557d60d0, base=0x55555580b250, filename=0x55555580b281 "json:{\"driver\": \"test\"}", errp=0x7fffffffda68) at ../block.c:1329
#7  0x00005555555fdb7d in bdrv_drop_intermediate (top=0x555555813220, base=0x55555580b250, backing_file_str=0x55555580b281 "json:{\"driver\": \"test\"}") at ../block.c:4979
#8  0x00005555555827fa in test_drop_intermediate_poll () at ../tests/test-bdrv-drain.c:1822
#9  0x00007ffff7d37f7e in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#10 0x00007ffff7d37d24 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#11 0x00007ffff7d37d24 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#12 0x00007ffff7d3842b in g_test_run_suite () from /lib64/libglib-2.0.so.0
#13 0x00007ffff7d38485 in g_test_run () from /lib64/libglib-2.0.so.0
#14 0x00005555555834b6 in main (argc=1, argv=0x7fffffffdfb8) at ../tests/test-bdrv-drain.c:2227


In frame 7 we now handle first element of updated_children:

(gdb) fr 7
#7  0x00005555555fdb7d in bdrv_drop_intermediate (top=0x555555813220, base=0x55555580b250, backing_file_str=0x55555580b281 "json:{\"driver\": \"test\"}") at ../block.c:4979
4979                ret = c->klass->update_filename(c, base, backing_file_str,
(gdb) list
4974
4975        for (p = updated_children; p; p = p->next) {
4976            c = p->data;
4977
4978            if (c->klass->update_filename) {
4979                ret = c->klass->update_filename(c, base, backing_file_str,
4980                                                &local_err);
4981                if (ret < 0) {
4982                    /*
4983                     * TODO: Actually, we want to rollback all previous iterations
(gdb) p updated_children->data
$1 = (gpointer) 0x5555557d60d0
(gdb) p c
$2 = (BdrvChild *) 0x5555557d60d0

But it is already freed, which is simple to check:


   #  break in bdrv_drop_intermediate, when updated_children already set:

(gdb) br block.c:4951
Breakpoint 1 at 0x5555555fda88: file ../block.c, line 4952.
(gdb) r

....

(gdb) bt
#0  bdrv_drop_intermediate (top=0x555555813220, base=0x55555580b250, backing_file_str=0x55555580b281 "json:{\"driver\": \"test\"}") at ../block.c:4952
#1  0x00005555555827fa in test_drop_intermediate_poll () at ../tests/test-bdrv-drain.c:1822
#2  0x00007ffff7d37f7e in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#3  0x00007ffff7d37d24 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#4  0x00007ffff7d37d24 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#5  0x00007ffff7d3842b in g_test_run_suite () from /lib64/libglib-2.0.so.0
#6  0x00007ffff7d38485 in g_test_run () from /lib64/libglib-2.0.so.0
#7  0x00005555555834b6 in main (argc=1, argv=0x7fffffffdfb8) at ../tests/test-bdrv-drain.c:2227
(gdb) p updated_children
$5 = (GSList_autoptr) 0x555555809e40
(gdb) p updated_children->data
$6 = (gpointer) 0x5555557d60d0
(gdb) list
4947        QLIST_FOREACH(c, &top->parents, next_parent) {
4948            updated_children = g_slist_prepend(updated_children, c);
4949        }
4950
4951        BlockDriverState *base_cow_parent;
4952        for (base_cow_parent = top; base_cow_parent->backing->bs != base;
4953             base_cow_parent = base_cow_parent->backing->bs)
4954        {
4955            ;
4956        }

   # break when we start to handle updated_children

(gdb) br block.c:4975
Breakpoint 2 at 0x5555555fdb35: file ../block.c, line 4975.

   # and when we g_free this child, and we will see what happen earlier

(gdb) br bdrv_detach_child if child == 0x5555557d60d0
Breakpoint 3 at 0x5555555f8cd3: file ../block.c, line 2775.
(gdb) cont
Continuing.

   # we remove the child! :

Thread 1 "test-bdrv-drain" hit Breakpoint 3, bdrv_detach_child (child=0x5555557d60d0) at ../block.c:2775
2775        QLIST_SAFE_REMOVE(child, next);
(gdb) bt
#0  bdrv_detach_child (child=0x5555557d60d0) at ../block.c:2775
#1  0x00005555555f8d7f in bdrv_root_unref_child (child=0x5555557d60d0) at ../block.c:2789
#2  0x00005555555f8e83 in bdrv_unref_child (parent=0x55555581e7e0, child=0x5555557d60d0) at ../block.c:2829
#3  0x00005555555fcb20 in bdrv_close (bs=0x55555581e7e0) at ../block.c:4433
#4  0x00005555555fd4a9 in bdrv_delete (bs=0x55555581e7e0) at ../block.c:4696
#5  0x00005555555ffc2d in bdrv_unref (bs=0x55555581e7e0) at ../block.c:6067
#6  0x00005555555f8d8b in bdrv_root_unref_child (child=0x5555557d80c0) at ../block.c:2790
#7  0x0000555555592ef5 in blk_remove_bs (blk=0x555555812ac0) at ../block/block-backend.c:831
#8  0x0000555555592393 in blk_delete (blk=0x555555812ac0) at ../block/block-backend.c:447
#9  0x0000555555592637 in blk_unref (blk=0x555555812ac0) at ../block/block-backend.c:502
#10 0x00005555555c82fe in block_job_free (job=0x555555812e20) at ../blockjob.c:89
#11 0x00005555555c6783 in job_unref (job=0x555555812e20) at ../job.c:380
#12 0x00005555555c792f in job_exit (opaque=0x555555812e20) at ../job.c:894
#13 0x00005555556ae1b2 in aio_bh_call (bh=0x555555813180) at ../util/async.c:136
#14 0x00005555556ae2bc in aio_bh_poll (ctx=0x555555807230) at ../util/async.c:164
#15 0x00005555556c2e19 in aio_poll (ctx=0x555555807230, blocking=true) at ../util/aio-posix.c:659
#16 0x00005555555aa48c in bdrv_unapply_subtree_drain (child=0x5555557e5080, old_parent=0x555555813220) at ../block/io.c:530
#17 0x00005555555f5d88 in bdrv_child_cb_detach (child=0x5555557e5080) at ../block.c:1322
#18 0x00005555555f8575 in bdrv_replace_child_noperm (child=0x5555557e5080, new_bs=0x0) at ../block.c:2567
#19 0x00005555555f8702 in bdrv_replace_child (child=0x5555557e5080, new_bs=0x0) at ../block.c:2623
#20 0x00005555555f8d3d in bdrv_detach_child (child=0x5555557e5080) at ../block.c:2777
#21 0x00005555555f8d7f in bdrv_root_unref_child (child=0x5555557e5080) at ../block.c:2789
#22 0x00005555555f8e83 in bdrv_unref_child (parent=0x555555813220, child=0x5555557e5080) at ../block.c:2829
#23 0x00005555555f901b in bdrv_set_backing_hd (bs=0x555555813220, backing_hd=0x0, errp=0x7fffffffda68) at ../block.c:2889
#24 0x00005555555fdb0f in bdrv_drop_intermediate (top=0x555555813220, base=0x55555580b250, backing_file_str=0x55555580b281 "json:{\"driver\": \"test\"}") at ../block.c:4967
#25 0x00005555555827fa in test_drop_intermediate_poll () at ../tests/test-bdrv-drain.c:1822
#26 0x00007ffff7d37f7e in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#27 0x00007ffff7d37d24 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#28 0x00007ffff7d37d24 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#29 0x00007ffff7d3842b in g_test_run_suite () from /lib64/libglib-2.0.so.0
#30 0x00007ffff7d38485 in g_test_run () from /lib64/libglib-2.0.so.0
#31 0x00005555555834b6 in main (argc=1, argv=0x7fffffffdfb8) at ../tests/test-bdrv-drain.c:2227



========================================================================


So, what is it all about? Of course, the proposed "feature" is not really needed, and we can just not add it :)

But IMHO, this shows that fundamentally it's bad to go to aio_poll keeping some local references of BdrvChild. And more general, it's bad to switch the context during graph modification..

Or, what am I missing?


If I'm right, what to do with this all?

It seems that everything that trigger aio_poll should be postponed and done after all graph modifications.. Or before them.

What bdrv_replace_child_noperm does?

1. drain parent if it is drained less than new child. OK, we can solve it by just draining the whole subgraph to be updated before all child updates we are going to do.

2. handle new_bs->quiesce_counter changes during the operation. If will not call *drain* things, than nothing to handle

3. do child->klass->detach before changing the child and child->klass->attach after the change... Look at them. Only in child_of_bds these handlers may trigger aio_poll and only due to bdrv_apply_subtree_drain/bdrv_unapply_subtree_drain calls. But they seem to be not needed if we guarantee to drain_begin everything we need before graph changes and drain_end at the end.


So, assuming that we are going to do several child replacements, could the whole procedure look like this:


1. drained_begin on everything we want

2. update aio contexts (for example if we are going to bdrv_replace_node(), bring old and new node into same aio context)

3. do simple child replacements, without any kind of polling

4. drained_end on everything we want


If we failed at 2..3, then rollback operations in reverse order, and do drained_end at last.

Than 1. and 4. may look like the following:

1:
1.1. search for all nodes reachable from the nodes/children we are going to change
1.2. call bdrv_drained_begin() in the loop and as well call child->klass->drained_begin for all reachable non-bds children

this way all elements are drained once

4: some elements may be deleted, so we should search again. Still with similar to 1. approach we will find everything we need, and all nodes/non-bds-children are drained once, so we just need to call drained_end for each.


Any thoughts?

-- 
Best regards,
Vladimir

