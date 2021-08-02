Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ADB3DDFBD
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:00:09 +0200 (CEST)
Received: from localhost ([::1]:33658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdAV-0003Pp-LI
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:00:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5Y-00038K-Ag; Mon, 02 Aug 2021 14:55:00 -0400
Received: from mail-he1eur04on0709.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::709]:64771
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5V-0001rV-A5; Mon, 02 Aug 2021 14:55:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JN91aBrgPMfDrN/EhpEsflKwCm741pHo861BvxOWTLRKom1CmMODkGis+QJg29IyC2cek3DtMGMZneUfrYy5/kb3nANw410roKm4Yj9w6U5BG8PdRtphLELk7sCFOgI4bHkB6krqVFAX/ewV8wPe8UjIKgWEUNco5dWpUcVOnbfjg5es0Q765vLohT7CsufWmnfKZeKBA84YD35udoi+WuyBTz/PigI+YoYRqKoRpjNTMDyfY4aPzxXdaUV47pSNVU9ukFBlyJMTyvEF0iKmVDYhWjz8v7F6VWwX6Q3NzXsReURMPaekvopCONS7e62BCc7DT5ll20YeoRsG+wUngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtK9lC08lwDHfbZaSoGE93xu6Hv/m1aY+6vRmZac7bQ=;
 b=BH1ir68PvDv6gHy0Jat50Jl2ABJVZNut+kwQbhcKPmCf//BTPCy+9Zver94cLx4PA+kTwjmPV2pGce3TK+Rfe2po/FNaJIV+TzGCxd3tuzZSIIfKYb91VRsL4Pqc5mt84G3oilI5gTc3GppbUR0jFRobVJinh60WnBlRlkCBceYuS7xHXeC7YfpMAczVD+mFy1WYaz2CQjRbEavanJ84bOG62Xgz/z9XwAz+JGcOWnCQntAiLsUZm5S1iHhIIBiRQV4fKkHNpAfbtVfuZfpR/L4fQ3nVsuyDWGnHflTFBj5xH2LiJDu/JhlxER56ypm9TwDE4aKHhqSBe1+F4PzIeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtK9lC08lwDHfbZaSoGE93xu6Hv/m1aY+6vRmZac7bQ=;
 b=Dcozvyl695nXyzoIfjojRN3TlkMrc9xr8fDn1CWM9VTbH8HCXNostnM+iGE1wNSph/V4p1EI2RszaysoSvFOz7fIBS7hNw8Fta8hcxwaEedW0t3Wo8ivLzAz1fpkdonygPQzbYPZwj4MifZJkpwF7Bwi7NcKqGiysBcgxk0vyAU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4278.eurprd08.prod.outlook.com (2603:10a6:20b:71::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Mon, 2 Aug
 2021 18:54:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 18:54:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, nshirokovskiy@virtuozzo.com, yur@virtuozzo.com,
 dim@virtuozzo.com, igor@virtuozzo.com, pkrempa@redhat.com,
 libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH 7/8] block: improve bdrv_replace_node_noperm()
Date: Mon,  2 Aug 2021 21:54:15 +0300
Message-Id: <20210802185416.50877-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210802185416.50877-1-vsementsov@virtuozzo.com>
References: <20210802185416.50877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0240.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR05CA0240.eurprd05.prod.outlook.com (2603:10a6:3:fb::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 18:54:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcf6093c-ae62-4eba-e077-08d955e6ffe2
X-MS-TrafficTypeDiagnostic: AM6PR08MB4278:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB427844F3FA1937114974786EC1EF9@AM6PR08MB4278.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:374;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oVUPEDup3EwQZHI84ocZGc5U8NeF6+HMsqAw/bbnJP7ibK/RQBPuLy0ncngu+bou1+vsilTXlIoqJkIfYtUgd9gB24s7swasAXNY5qrU2PjzPwFe/TJSbdxP5YSgp4XLToEanKo+2wqC2fRVvYo0QvsHlMGbr7vlz4jZu7hecUokV7Tqv2Hwy2+B72Ic3SlrxX/OJEyYeT/wou2+05CQgx0eslmMV1cNxOoXRZ8zQSJOTtYm3TQyz6r7OXaA5q7J7edGYtE4d0ACVzYIrNZMciR/mW0VVVryO+qKJsovNtiEhcJfHqItcbE5hW6Ah0jMhzvRIC/khoSpEY8ddOW6qoKVreoXuYbWyRwXpxiDBmqX2M+CtI/W1lqc4+QDeKMFadxYhmC9ouwLFKCmnAvvu+CIuyppuO3IcfLHfl/9kC16vrp0FMqBpuGVoqsetVnCQOe43T6o54jDMEsoldhVrfrIGIfRcS5+LP/Ge+bZpae38GqXLfU81f0Woq+NmHeYIZvNnNnd5WZ85RfbgumuSbkhYd+0oZgEBx38Yz07lP1GitOupDP30kIYpeKCE6AdXG3eu1eQ13GpcCulvHzgBZDQqpv7bZEwbaBs7pD1POOZ4EKOiAQJquAVWgpF0sYlE5t2INgleYTr2Sv/eOwS95C1TiFtS8aH/0F3WlX75H1N/5Q+5YZ1ZFWulBclE/4GWri3IpUNWtlQwllCe+yeJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39840400004)(136003)(396003)(366004)(186003)(6916009)(52116002)(1076003)(83380400001)(8676002)(6512007)(38350700002)(38100700002)(2906002)(7416002)(6506007)(2616005)(478600001)(6666004)(36756003)(5660300002)(8936002)(956004)(4326008)(86362001)(26005)(316002)(6486002)(66946007)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W8qQqVpF7qL3+t3SJyI4xyOhbSk9RI/4KBaPGpFN6F2yNZB2t8MVzg1OeM5Q?=
 =?us-ascii?Q?PWUhoy63IP0QxfUbPtmTmVS0h1GTGq9t1yoBMXudVlmhpnCZCTTOcW2ATXrM?=
 =?us-ascii?Q?qmalesMiVWzzMEgLECEHmY70A0SUmdJ2OTXhOOA3xhjp0Ig/k32ehHTIt6UO?=
 =?us-ascii?Q?3lMLCLEhXMwwRCRgjWnRvraOXQ/yfpfJOmt74N8IkTQm08IJXZz9o8Wj9nPG?=
 =?us-ascii?Q?OrRDWvWS/5d159L9NqFR5MLyRYuVp//Yzy5G5rGsF/Lzf+bYhSTurUQfA/gm?=
 =?us-ascii?Q?iZozVXhIytG9QFFUbds7Dt+Uleqi0Q2oXsasktySE9v+AQI+gABt+PCIQuD2?=
 =?us-ascii?Q?m3vzPQ79IrXU0twnPoBe+eLDRDqrIL+xBhO5kKtGekvB7s53SKS5nrOBJ2ga?=
 =?us-ascii?Q?Cq6lif8/Qg8809sQTWEW8XIT5QNTkFm7F1kWj0RNW21R9hBb9oc97f4lGtFZ?=
 =?us-ascii?Q?ZL6w2u+HwCOAh/ctoON01c+I7gLouOfZuiGTo8GpInXtURGq+NvgQmUpaYQX?=
 =?us-ascii?Q?vtjvAv90bNOhrL4meVHNQbPoUtRukpgIMcJiSjQY9uK0GWSm071zWGnXYKj2?=
 =?us-ascii?Q?sEiz9f5+EWvIiqPrjs+3jCXbaRBouYfsGb95lJF8WH3ITKRYc4y0/oPS5irI?=
 =?us-ascii?Q?XRgEBXPDf+ktd06/Sp9944gwoRKgi0jAUW5ue3yRr2ouxAQYVcae5yQg8liD?=
 =?us-ascii?Q?RBPVzKOende7/C8RYsR99dimpeEezGj2RLDJHcKw7ajj5vt+owwlzIkapjPR?=
 =?us-ascii?Q?ty61nBL46ns8ynxzSYiQClAmrevg5x8ULg3B9C70PuEgLr3e8vrIWCJLQXHM?=
 =?us-ascii?Q?q/3DChsx7Bha+ljkFXjfCPdUW4upQhLIXvyD9PLDdlZ4+BunMxVD83vuDfYg?=
 =?us-ascii?Q?XN/dUgbn6cGgmQZDkhWwAT1VEByKxm4xMyU8qITNky6+6LQo3JPKEh1LnFXn?=
 =?us-ascii?Q?1ia3IIWfz9Z1dEpnMpVvhQZdIJKNbFM9mVoGFkucuhjybZ0Y6DyoidfBb7jE?=
 =?us-ascii?Q?X8tHu43ONcBJANKXi2OyIOzJjuEt7DcBTAHXKUTtpS4udIbedi/TgKNJxi9h?=
 =?us-ascii?Q?IXeNavty61jOGBOoldaWHHt7mG+00rUB/Qil4FVXmnS7JZT8uNa9ak+MoVqV?=
 =?us-ascii?Q?M6LuWcr3dGVipPYw6V9qeRnT5MOQPlF6gEEQZbCbzCcu38s+4N18qz27XS7f?=
 =?us-ascii?Q?/jXBPMBrYXEKFW8YORMTa9hk/oi7w/Z8BJxlOkAlwjB8wuQbtUQFkDUCWH6z?=
 =?us-ascii?Q?2jwMOaGav7gk6rfuA5T2KCzz7wj9PRBVlzlalDEvl/hR3WCfFtGzd5Tkg0Hz?=
 =?us-ascii?Q?YoTxqVkAeVcKGgKfzX2PwCks?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf6093c-ae62-4eba-e077-08d955e6ffe2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 18:54:47.5315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfFhrYQyqLGJO02YkeVQkM/qXlOOw8FH8lNXkSWkFlyOC99QrEWFgC6T7OFn33UGGtwKZarboX+2Krsu/WLmfj5DMGHmuR5Pg9Tbm+qoOR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4278
Received-SPF: pass client-ip=2a01:111:f400:fe0d::709;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

Add optional block edge name filter and new mode: "exactly one", which
we are going to use soon.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index 449f933661..ae8c8c4032 100644
--- a/block.c
+++ b/block.c
@@ -4894,13 +4894,22 @@ static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
 
 static int bdrv_replace_node_noperm(BlockDriverState *from,
                                     BlockDriverState *to,
-                                    bool auto_skip, Transaction *tran,
+                                    bool auto_skip,
+                                    const char *edge_name,
+                                    bool exactly_one,
+                                    Transaction *tran,
                                     Error **errp)
 {
     BdrvChild *c, *next;
+    bool found = false;
+
+    assert(!(auto_skip && exactly_one));
 
     QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
         assert(c->bs == from);
+        if (edge_name && strcmp(edge_name, c->name)) {
+            continue;
+        }
         if (!should_update_child(c, to)) {
             if (auto_skip) {
                 continue;
@@ -4914,9 +4923,19 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
                        c->name, from->node_name);
             return -EPERM;
         }
+        if (exactly_one && found) {
+            error_setg(errp, "More than one matching parents found");
+            return -EINVAL;
+        }
+        found = true;
         bdrv_replace_child_tran(c, to, tran);
     }
 
+    if (exactly_one && !found) {
+        error_setg(errp, "No one matching parents found");
+        return -EINVAL;
+    }
+
     return 0;
 }
 
@@ -4966,7 +4985,8 @@ static int bdrv_replace_node_common(BlockDriverState *from,
      * permissions based on new graph. If we fail, we'll roll-back the
      * replacement.
      */
-    ret = bdrv_replace_node_noperm(from, to, auto_skip, tran, errp);
+    ret = bdrv_replace_node_noperm(from, to, auto_skip, NULL, false,
+                                   tran, errp);
     if (ret < 0) {
         goto out;
     }
@@ -5035,7 +5055,8 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
         goto out;
     }
 
-    ret = bdrv_replace_node_noperm(bs_top, bs_new, true, tran, errp);
+    ret = bdrv_replace_node_noperm(bs_top, bs_new, true, NULL, false,
+                                   tran, errp);
     if (ret < 0) {
         goto out;
     }
-- 
2.29.2


