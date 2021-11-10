Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA0E44BEE9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 11:39:33 +0100 (CET)
Received: from localhost ([::1]:41172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkl0u-0000nV-KL
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 05:39:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkkzo-00005b-D7
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 05:38:24 -0500
Received: from mail-eopbgr70133.outbound.protection.outlook.com
 ([40.107.7.133]:54452 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mkkzl-0007O3-QR
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 05:38:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUNPTrwWTtJYaKyCm45X9RjOtBXMa+6h03Po2MkJbFZ3FUD+2rnoWimung225Peo3Kp/N37A9qOXfSSh7TB7ja+kRKAklAQ4Cmdc0AqAOPT50zmuNDsWNHQm2rdYW6WE3ESs1dkzCMbAP6eLeHfb1I+H2y6v3bO+uM2KRLVIOQPEN9saAUzbdF3g0ZLiQ7zJ5zYj2nGX1FMus6oC5OluweKnY7CUPT/3AS9CyB2iQOcEPL0y/kOSzRdzkPrgLLGwguADyOeXJ2oEA3G4m02UjViNW/JuAmZ1eCta6iq4CHw83YItKluClbMcAbV2syemkUhP0R8pbfZJsy21nowe/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9x8nqy6xYicjeZ0fLAyRkyyDVKZjFeR4s8Grb4XV6tM=;
 b=PqUeAyXO/V+loDz/LBEaiKbhGBy1HoXeAKToQfMDvzLpJLNrBGIW7AKN/iBlYbzx326J4dT+IiFa+Lj5I9P8cQ5DSyRyuHbtsCUgr7+d1EJ5yfm01d0ym+uib8Z0uVjWFea0Yl3H+x2mSGrJ4UfbnQRnoaPn0buHNzO+9WonwhDqp/OjvFOKB7mpjGFFDZZ/lVu1C6MafyH0lY/KqK+bPUzuj5TslKRJ3cRzWY/B537IP4koj1jicjNgIVTvvtZPbWltKqCZEyxcE4s05nPUKDLfRzby0xrUr3EWES1q6j/AaVmaynkHIJ+Zmd1MLJeBN5KX8toor7JMKce98osqtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9x8nqy6xYicjeZ0fLAyRkyyDVKZjFeR4s8Grb4XV6tM=;
 b=PlsQsi/EyMTAP0mmyk+vgLYpJj2G8VFeu6a//6c8pIvW2u32Clv8X/BL3C3gA6XPb+8Vt+xyA+OOpknDFgizcTnkJ7oXmlR2QMy5vln0Z+uRVDJBIUTJ7G3vgzs4UHiL9+3C3p7nqzU93EDbQmEc6DlgSSTjJ3+6oMM419h5jd4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4852.eurprd08.prod.outlook.com (2603:10a6:20b:cc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Wed, 10 Nov
 2021 10:38:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a994:9f7c:53a5:84bc%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 10:38:17 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	vsementsov@virtuozzo.com,
	den@openvz.org
Subject: [PATCH] ui/vnc-clipboard: fix adding notifier twice
Date: Wed, 10 Nov 2021 11:38:00 +0100
Message-Id: <20211110103800.2266729-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0074.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0074.eurprd06.prod.outlook.com (2603:10a6:20b:464::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Wed, 10 Nov 2021 10:38:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 371ae7ad-d4d4-4121-c383-08d9a436350b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4852:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4852754E3E0F860C98A540BFC1939@AM6PR08MB4852.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xUEujE6ipruEAaymZN3B35kU77F8VQeTHfu5qh2tOFIGVKLSyA4HfKO22Vag/h0RjNtjnjcH3gE8h4gimupKz/CkBvsxoNvxzK2jDj8fqwS3Ffxz+WF5lojLpaoqBN2eX8RxgsBjKhHGBQxjcIOrzOJ8Mt0Rd3RF65qCAGGM3jsP6nilSPxpLtIyi0RgMa2d2gZmQj5EwHKxkTWXLch8aeyq0dTtfIwLhSSJl1j6TY6QM5AzOcaY36OpSkwj4CC/txio+h9HVH9sL1YaPnAyUXDXxoPcXCiMytWH+j39oQpkEHQIpl40o1MTUcBf3I6JZ+ysipPWLoDXUyV3RXCIzaVX8R62tXXgHyoZlcEd9kHZBK60VoVs+RkG0EFVeUOtGSt21uPqpvBpVWBocI1wfd6z2Xgcc2FuRL+k24HJ1P2DJ6dekKaEQrilNZbnfXqepxCYUQqg3YAKs0vF0RwQFAK+zxXRXSRrIQZU+GovgyIAy5BqKkot3CFKeea2VzQD6+dy/8QufcItjAqLujSrP13hdP38KdLXDhKAxYlKLuCXyDRh8fAqBFLW383Wp5pgll2GIE7cfJCT4a0KAVsvmqyE6bKai/rcSbNneb2n857EJy0syXcloPAfWm28ACRfIaICcW4hD2eVZCA8BDjW1Zl0H9srAIWEDbK/iZi4ndflX1oPRou9maxygYGg/dEN1UPdk9f1EtPW/0Yn77Rc7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(6486002)(316002)(26005)(508600001)(8936002)(186003)(6512007)(86362001)(4326008)(1076003)(8676002)(6666004)(38350700002)(6916009)(38100700002)(83380400001)(2906002)(36756003)(66556008)(66476007)(956004)(6506007)(2616005)(107886003)(5660300002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W+ENqYmHbb9PnDyolQxmrXzwkPVGExLdGwAX7Hr+HF0WxF+hkc6+0TX78c+D?=
 =?us-ascii?Q?skZr29FdAUQuYQptfPuJyx7acVOK5H+o7O5VmfoXfNxWdOLlE7x9m3h2nlQx?=
 =?us-ascii?Q?EbL1XdzWDy9Fk+j9y2HOggotJNU3Gb3ik5r5j5nDwWC+oEDSJz3KwFCAyxwM?=
 =?us-ascii?Q?AISN+GoFBBXTwz+IocflOJNWbdh2J9/MGo9+EwtPEtvs9uNhFEbrXJHtwFPH?=
 =?us-ascii?Q?JjHGJATRyXgoW5wB9FHbDdKBKoq3d4UQhUSLmZbX2jBCJmGq2gDJbrb9h1vi?=
 =?us-ascii?Q?VUNOXYl/YWukI95z0tlmsUqwqRWQd41zShGRSfrYu6eUHq6dI1jJbAP8qMik?=
 =?us-ascii?Q?Sti1FFPZyVml1hN+Hfy2o9QVfAXJd55DtyuWEJAw7bPehjjfiEM/i5XrCiUd?=
 =?us-ascii?Q?Cwylw+7MnxPTlgLnjViBTkI5PCNrcJVMz7I3LwEhjjwGFgk5t0J4HtiTlNvl?=
 =?us-ascii?Q?MZ3mJj293i2IDiT3i1XxZybkLBBF4PmNlbSmGTUgVwwDmgurt7LPizM8xcPs?=
 =?us-ascii?Q?sQZVx5nNxvUgg1MAhELD6x8LVSoYkGZqUI7MxXmvfpRwmRBI/birx4c7KhgE?=
 =?us-ascii?Q?M8gyr5pQe3TI1tfgBS7aZO/g3OSyRxON95ryPIx7CsfJzCuJELq7op9wftKS?=
 =?us-ascii?Q?kUYGkf7tSjBYA91oIr1JQ4LW/0gZczHT2HPi5EnZ5s2fGdA/G0ACAmzJkM/n?=
 =?us-ascii?Q?MsagMlAeStSkZG0IzHwbFRQsv91b2W2RfAQXvDCUT6alxYhlHFvD+cCXdPP6?=
 =?us-ascii?Q?1DnH8MBpdpIQFic7dweIgUKNOpKbWs5kKRQIXFeCc+q7Y9pHrRxk0OJflVzc?=
 =?us-ascii?Q?D/dI8wj8htJmU1Bb1nFRmhk+j0WAPSXE5AIBWRAiaO7FQ2LPaXixtn2ey5j5?=
 =?us-ascii?Q?Rm7cDPm8WruuXdGaPdq0d+uTsS7BgpNXoKLHIzxitLhdF4iR74A7N6tXOo6o?=
 =?us-ascii?Q?0wKcUt4v31bLD82wmnloL3JMqHUBznm6ESBGPJ9Vq5rO7FYyLSLkc3+hoU8B?=
 =?us-ascii?Q?rszDAMOSyN9QsZC3x/PhX0bam+fpFhCpy4y0zQHKsJ08P1B0rcAhQy1Rt2SX?=
 =?us-ascii?Q?rtgQNAyKS8kfK2wg5E91p8zBNAuvmQieTcjMctm4b4OrxtTzXM1z/uusD0Vo?=
 =?us-ascii?Q?qUXNmzAiwqK+Ri6wWKY8jDUMIAC6gDf5vlvsR5So66sSBLlq+DUXMZ1Mqvqu?=
 =?us-ascii?Q?AaZvqfTsLt3i96z7Z2UsFPIRlyaR2YNcsyi21I/UCzggpay4UGvOTKd9GXvq?=
 =?us-ascii?Q?sZpFKPc2IPVVsIEH1N8d6L26EvigXg5WqxXL9Ezwv2yEi5yw2CLy5vx2sJ0z?=
 =?us-ascii?Q?1d/TeaJ0YyZj2RMtn9AeWrXxh3rLEF2IYvBHiyzbmaeNq9xrCCBYBS4bXcaK?=
 =?us-ascii?Q?ppVKSgtFQYAw3BRWYiypuc+oTpx3eQyXFM8KixKrleSMJQ5oKkPvXCsnQNPP?=
 =?us-ascii?Q?biT7imEsFU9v9Q1AjFQLSe2kcI8fP4Xf6WLSZ4ofMHG8ojVKwJRZhYolJz7h?=
 =?us-ascii?Q?5bzBGsB9erKEsMM5e/fg1GOH78AboQ0PtnRlm11fQLcCdZxtWLyFLyvL/vF7?=
 =?us-ascii?Q?Bx2IPIULtL5HMjmxyIg2pc2BI+WqOJ7g2GuV7c7/uwMYx67/eFbDV7xXQ/zr?=
 =?us-ascii?Q?YVyz+hOGkqgK2HzVslUHv3/S28wrhfiKKii0gOGk7ETLOCkPAz4JbFski0Xt?=
 =?us-ascii?Q?CYGgkXPapGMpA3JcC4FHrh2MBOs=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 371ae7ad-d4d4-4121-c383-08d9a436350b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 10:38:17.6630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/1GKbg/ZvPQh6CnUbHNLuhBPkC0cojrjv1fHW0RE1FrIHQraBu8bdMBwPAFuedhqN0Vk8HynQtLif/Js7XT2cwtjuX1nWVLul7013a5WzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4852
Received-SPF: pass client-ip=40.107.7.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

vnc_server_cut_text_caps() is not guaranteed to be called only once.

If it called twice, we finally call notifier_list_add() twice with same
element. Which leads to loopback QLIST. So, on next
notifier_list_notify() we'll loop forever and QEMU stuck.

So, let's only register new notifier if it's not yet registered.

Note, that similar check is used in vdagent_chr_recv_caps() (before
call qemu_clipboard_peer_register()), and also before
qemu_clipboard_peer_unregister() call in vdagent_disconnect() and in
vnc_disconnect_finish().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hi all!

After backporting clipboard patches to our Rhel7-based downstream, we
faced Qemu stuck in notifier_list_notify():

    (gdb) bt
  #0  vnc_clipboard_notify (notifier=0x564427f283f8, data=0x564426c59a70) at ui/vnc-clipboard.c:193
  #1  0x0000564423455887 in notifier_list_notify (list=list@entry=0x564423d2b258 <clipboard_notifiers>, data=data@entry=0x564426c59a70) at util/notify.c:40
  #2  0x00005644233273bf in qemu_clipboard_update (info=info@entry=0x564426c59a70) at ui/clipboard.c:19
  #3  0x000056442334efd2 in vnc_client_cut_text_ext (vs=vs@entry=0x564427f18000, len=len@entry=4, flags=<optimized out>, 
            data=data@entry=0x5644263cc00c "\002\f\001\251\020\377\377\377!\377\377\377\314\376\377\377\315\376\377\377 \377\377\377\316\345\241\300\307\376\377\377\310\376\377\377\376\376\377\377\a")
            at ui/vnc-clipboard.c:256
  #4  0x000056442333b172 in protocol_client_msg (vs=0x564427f18000, data=0x5644263cc000 "\006", len=<optimized out>) at ui/vnc.c:2396
  #5  0x0000564423338af6 in vnc_client_read (vs=0x564427f18000) at ui/vnc.c:1537
  #6  vnc_client_io (ioc=<optimized out>, condition=G_IO_IN, opaque=0x564427f18000) at ui/vnc.c:1559
  #7  0x00007f07b02cf147 in g_main_dispatch (context=0x564425546bb0) at gmain.c:3192
  #8  g_main_context_dispatch (context=context@entry=0x564425546bb0) at gmain.c:3845
  #9  0x00005644234468f7 in glib_pollfds_poll () at util/main-loop.c:215
  #10 os_host_main_loop_wait (timeout=<optimized out>) at util/main-loop.c:238
  #11 main_loop_wait (nonblocking=nonblocking@entry=0) at util/main-loop.c:497


investigations shows, that notifier list has only one element which points to itself as next. So, we are in the endless loop.

Seems that it's possible, if vnc_server_cut_text_caps() called twice. Then it registers notifier twice and it added to QLIST twice, which leads to the situation.


I don't have any reproducer and not sure that bug may be reproduced on
master.

I'm not familiar with ui code - may be vnc_server_cut_text_caps() should
never be called twice? Or notifier should be removed somehow before the
second call? Maybe this patch just shadows another bug?

But what I do know, is that we should not put same element into QLIST
twice. And if the check I propose is not needed we should add an
assertion instead:

  assert(!vs->cbpeer.update.notify);


 ui/vnc-clipboard.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/ui/vnc-clipboard.c b/ui/vnc-clipboard.c
index 9f077965d0..67284b556c 100644
--- a/ui/vnc-clipboard.c
+++ b/ui/vnc-clipboard.c
@@ -316,8 +316,10 @@ void vnc_server_cut_text_caps(VncState *vs)
     caps[1] = 0;
     vnc_clipboard_send(vs, 2, caps);
 
-    vs->cbpeer.name = "vnc";
-    vs->cbpeer.update.notify = vnc_clipboard_notify;
-    vs->cbpeer.request = vnc_clipboard_request;
-    qemu_clipboard_peer_register(&vs->cbpeer);
+    if (!vs->cbpeer.update.notify) {
+        vs->cbpeer.name = "vnc";
+        vs->cbpeer.update.notify = vnc_clipboard_notify;
+        vs->cbpeer.request = vnc_clipboard_request;
+        qemu_clipboard_peer_register(&vs->cbpeer);
+    }
 }
-- 
2.31.1


