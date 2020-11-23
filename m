Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414152C16C2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:49:15 +0100 (CET)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIlu-0003jA-9A
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khIDU-0004c1-BD; Mon, 23 Nov 2020 15:13:40 -0500
Received: from mail-am6eur05on2106.outbound.protection.outlook.com
 ([40.107.22.106]:21121 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khIDQ-0007NS-EH; Mon, 23 Nov 2020 15:13:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxKljSk5wMhejXUAD8gmTApzp5VHQprqgABmAFiRkJ2REEZD5RhF05/drx87iqZO3xN/87qt+KmqJBY9sqx7ycumSu5Ab3BhrBTVyy+GNal/X1YDfSQpxHtw+EbfIwFQjkbx+i7eFe1FQKbeh8kple02Xb4XsuD35Bzh4r0g2IBGJN75ronuW9KMlDeU3Jitk9lqWsy7K1ADRtvc7o+gcN15FXHCKH4L9Afdt9U0fhpTPj5vxAfpr2xEotmLGf/ikVs9PsQT0S2Qn+zzorslldr4Tp6D1Gf1KjOb3f/WYuMMRr5JVAjXajhXMgWQXurNa8qIbqCZhJSo+8tpE8EboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nh6I3AlKg+nFDjFVbPn6E0OVeZQHbZ/WFz3iprfrg+Q=;
 b=gk8E7Y4dUDf60hgsOP4sW5D96po3uTEz0IpQGCu0KHtvtOdF5ppf4fqTjc2N6H0+gQdarsVcCNq+r12NS0yYAxye0USuoM9mldshqFa4MaarOSncQSRgj8IVeytESLFqb9LCyyZO2Tkm7UM6B4qkYKBxpoQ5stV9NvQ0oAm7BB5ne9LHntt5LIs5LlduE99qUXi+1C9i/+T1H96uliE/fCXJiD5ZulLYjQzuOoauV51Tq3/QyWP5qgyg3/wiYVL2vEfBKaTalrhzqplPF4+0kr6x4zoNal2b8Q6bZWpiLyhrqq7Kj7tETlWIAa0TJ2/f88+UmpUBlIRRAqwtp0hkYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nh6I3AlKg+nFDjFVbPn6E0OVeZQHbZ/WFz3iprfrg+Q=;
 b=dkwZ7ndKbGHsf1fhV7r0gwI8HRrzg/5UiNCRr9FrBSSzZUJ2rfePKsQkcOQS6J7FZR1N+lk0SXV/pz2im2zAi6dYWq912Z9hgzt0JFo+SykHl0Ak1e7HpIFkS/+1dyEplRb2NMhb8s2BdjTZcthTfEA5mulkZ26OPeo2dHcxxy4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:13:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:13:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 20/21] block: introduce bdrv_drop_filter()
Date: Mon, 23 Nov 2020 23:12:32 +0300
Message-Id: <20201123201233.9534-23-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201123201233.9534-1-vsementsov@virtuozzo.com>
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:13:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eff97a0d-cb62-4190-19fb-08d88fec3201
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4690C362E706ABC8A5A57F9EC1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OkEcCqOQNrzjmunepqKYE3BB5jIYh0MbFxGX4bcZWIXYFWKNoQiNJvah/W4//kxTDHatGOdxPTzBSU2HK94PbZqFpI7KpYp0dhKc4oVrj85HpyJ4CX00L+H+USMzF1va7hNejJesFU0EbZLey/VD6zTFjSg890T9/XcIDIhUYbBh3Cy578wpVFeR6ssHJc6dOTqDcYIlS5L0ZUG0Db7lKd5B5q6Lg0BfTgkNmFNjHBLrTzlL+N2ReQuocd2yVVQdymzbvZ8cKCoHR89SfX521LuYUeCk8WyAXOnFXVFW95HwSNJVLcW1zPRSooY+MUobwyyosegNbfRBiB500ZYfPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39840400004)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: qddXJh5HLLcwhejETn1XKSAjdDDPHR2a/V2cm1/xh4NlnjESkcBf7RVhH4vkVGESl0fnCVNun9pEUl5lBQyefhLaycb/+XeO+uVLIJ2H0WCMv+kEB+RN3iLZsf51Qa3pVh6AmEcJcmBIgDbPvYNr0O2Aa8RfDxQIsAjupmrAMTaAuAEw6u4mGqg+o2z7osOJ5AySeUDyNtTph5uE/a0YPRn7V6JcE738Pq+64ouV9zlWdTbMd9F3RXsxR38ujrIw7oRksfMCahYZumbVgD/xduupfTZ7M+gUAyvADoVhKsRy3UMWqFKBnlG6ARdfMV6Ps7fhv2MzUqfSiohcFtARrZF/m3TrqFE4k04t3dJl9irH37lU2Pk6K/zS8/qSr03KVh4qEn66sqkvjeaXmdmg2QgF0kMJg9SLQDpB3BI02ZvKW7c5PzWNyes9sYQRSnL4kOwjWQdTA6BmvYB2r8bQLu/o5sAKnFhOQ0UO0lNel3OQP9X5a8hgKzMS6dJqAQoy6vWKg0GtMuGeKzU+rWf264jupMDi8R6qQfI3/PXvMdjDLelw8P/ECFa7HAx269O14iqEL4Irc4bBe2itL8tOgJKBXuShlCrHIfm76yD1jctZuWO2QK3In2bKJi3MKgImJQP7skkH0zZsRfbCHlh6BE3SVPVhC6/wfKlv1QU6kbv6xV0ZI4ECQzVyk59swxLVXYA/zozL3f6QtTAy8kEf/6M1DaSOG7+ic/JgV1WgLf/jHC8Opm7Xi5cOcmrP2z29ZRaKRCwSjJntdaQdXyuBJvfyMQxTnOfnvi1NGEo7RqVjhaLvy/pU/IOHoSkFjJa7GvkYqCKSfyz2p59Hmwx94FQSWkpEEGn+Gmd0Z98FV2DoqEuZJdcrFPgOPEV8Viy99GkW9NoGITJs7m+ClVIA+g==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff97a0d-cb62-4190-19fb-08d88fec3201
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:13:08.9291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TacTCwM2lMqjc1A07a5O+f03tWtF9KjMg0LnkqpyZf6AxJKou1C1Eiq4XwtqOr88lfxDQMUZkrQqzZ41Gnezxw8jA0htvMoYYbMTC4Y4/vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.106;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using bdrv_replace_node() for removing filter is not good enough: it
keeps child reference of the filter, which may conflict with original
top node during permission update.

Instead let's create new interface, which will do all graph
modifications first and then update permissions.

Let's modify bdrv_replace_node_common(), allowing it additionally drop
backing chain child link pointing to new node. This is quite
appropriate for bdrv_drop_intermediate() and makes possible to add
new bdrv_drop_filter() as a simple wrapper.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |  1 +
 block.c               | 35 ++++++++++++++++++++++++++++++++---
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 6c1efce0c3..981a07e29d 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -348,6 +348,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp);
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp);
+int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
 
 int bdrv_parse_aio(const char *mode, int *flags);
 int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough);
diff --git a/block.c b/block.c
index 6ea926e2c1..ee0143aff2 100644
--- a/block.c
+++ b/block.c
@@ -4923,15 +4923,30 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
  *
  * With auto_skip=false the error is returned if from has a parent which should
  * not be updated.
+ *
+ * With detach_subchain to must be in a backing chain of from. In this case
+ * backing link of the cow-parent of @to is removed.
  */
 static int bdrv_replace_node_common(BlockDriverState *from,
                                     BlockDriverState *to,
-                                    bool auto_skip, Error **errp)
+                                    bool auto_skip, bool detach_subchain,
+                                    Error **errp)
 {
     int ret = -EPERM;
     GSList *tran = NULL;
     g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
+    BlockDriverState *to_cow_parent;
+
+    if (detach_subchain) {
+        assert(bdrv_chain_contains(from, to));
+        for (to_cow_parent = from;
+             bdrv_filter_or_cow_bs(to_cow_parent) != to;
+             to_cow_parent = bdrv_filter_or_cow_bs(to_cow_parent))
+        {
+            ;
+        }
+    }
 
     /* Make sure that @from doesn't go away until we have successfully attached
      * all of its parents to @to. */
@@ -4952,6 +4967,10 @@ static int bdrv_replace_node_common(BlockDriverState *from,
         goto out;
     }
 
+    if (detach_subchain) {
+        bdrv_remove_backing(to_cow_parent, &tran);
+    }
+
     found = g_hash_table_new(NULL, NULL);
 
     refresh_list = bdrv_topological_dfs(refresh_list, found, to);
@@ -4971,7 +4990,13 @@ out:
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp)
 {
-    return bdrv_replace_node_common(from, to, true, errp);
+    return bdrv_replace_node_common(from, to, true, false, errp);
+}
+
+int bdrv_drop_filter(BlockDriverState *bs, Error **errp)
+{
+    return bdrv_replace_node_common(bs, bdrv_filter_or_cow_bs(bs), true, true,
+                                    errp);
 }
 
 /*
@@ -5303,7 +5328,11 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
         updated_children = g_slist_prepend(updated_children, c);
     }
 
-    bdrv_replace_node_common(top, base, false, &local_err);
+    /*
+     * It seems correct to pass detach_subchain=true here, but it triggers one
+     * more yet not fixed bug
+     */
+    bdrv_replace_node_common(top, base, false, false, &local_err);
     if (local_err) {
         error_report_err(local_err);
         goto exit;
-- 
2.21.3


