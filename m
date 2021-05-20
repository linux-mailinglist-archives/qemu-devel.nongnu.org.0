Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2D338B1C9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:31:37 +0200 (CEST)
Received: from localhost ([::1]:38442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljji4-0006ef-Vg
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZr-000630-ML; Thu, 20 May 2021 10:23:07 -0400
Received: from mail-eopbgr00128.outbound.protection.outlook.com
 ([40.107.0.128]:8320 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZn-0005ij-F9; Thu, 20 May 2021 10:23:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3lFWwePFCdUdvyls+kn9z+6fWzgNPgLYXkd/j+uVt2hpSDl4VMetwidxQ/tGMF1A5VU0y7NdktF+7ZmCwNoI7vt1DGDqPX86wQn9czpK9J/fg9IBoh3IVWNYmqE/gcSPtOMmfEdDyQrKMfrlwe9r+/9wpazhBGsIP20VfIgBsUejzBuYj4Z6PjALDsq5qv+De4J++AhbjAUGgowrRSKjXNMhTy+l1SWOZEO5PfvPb5VlYdLhZZub/nbdpkHRXIWSY6/p+jYhXf8h/DSLVlg2/lIacVToCVGo3TVf2BM3Kh73TmY9QBkspkOxqBb+y7LZ5TcHEJ9KKob1L6QZ+uCYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLEcwV812q0rn8jo/2hQk2s9oTPzmacZKAyLmJxp13A=;
 b=mXQEPG3Q0+oLWqkzR5XvAjpk2kCA3j+q3kibSskt6JmJoBvQfxoBB1BHREtJCRLxrXhaZUGiOeTXs6FwvhgnXligFhd9FmBYGP7IwcWZpPVjrQr7Nd2CBEPJtjHwh32VgdZzaCZdUCNCIxMuEy3aiNHsD9DmM1ljW2lzv1ZlXHn7aBWcjgy4kkDedaPAI/2uUN5uOYqVUgvKjpHcfXhkIicyVFQgOzsMdi3POaDcRFi1L/T96el3SnkaO7oijqQiCtHRKWU1+63krIoef+I2khb/ZtAQ/JfgjXfywEzZGqiFGwdWPCt70pOI16v84cBMaIxT7oqac5+XxhmQUNMH1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLEcwV812q0rn8jo/2hQk2s9oTPzmacZKAyLmJxp13A=;
 b=Zp2ZNv1yr/L3zt+1+RVvafNLxAYL2b5EnghHjKfLirej5MBbJMEKrHe5u7avXS0siO69757vjy4/78Gh6PFkuM0KOtWMx5WAQm9KB/vAmIM+y4OuC5z1p6rfeUEan+v3fwau7z5JCVXJLZuo57+gyctZAQmhuJCaGZgkxheqVys=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 14:22:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 14/33] block/copy-before-write: bdrv_cbw_append(): replace
 child at last
Date: Thu, 20 May 2021 17:21:46 +0300
Message-Id: <20210520142205.607501-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c0640b1-8331-4a36-8b18-08d91b9abad8
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB354479EFB232D8466175AF78C12A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UoMB8sBaB4Vg6EzYnXkbSiYu9CEiIZWCy4iaI6ijyOw8UOaiKm0kxV2K4WJU2CVFBo4Qx6lE3yff1oepgo4GLXnUw+pcCiI4498YgMuDY5vU8vNSNjh6FFzjMgeu6RMhs73HJuJf54OqOfFdm/KhSEhVAbUNR3eiJQSuP7QOGTSoYcX7YRQXdPznbOgNJkzq1JHIGQY0lxjjDa1NnBNM5GOstrjZhHcUDo+AEEybIz66BjWZM/SmyUKKAOmAr4Ct3Ofki2alqn8o9NkhKRetmfj5FvDjNh7JtjkYcMzhGYLJo0TCic5clxWZnRA9q1dLQQfr1+5CMLNsYh8YJX5V58uXGeo15hFK7JZylGv2oAfvGAtW4Rq6k7oLQZQPID5OxmmcC+6pV3SVJHScjxJDUL/xiJsdPTOuMsbWBVprFBRKi5N89WlukzkdX/iDzyhp2nZpeY8c3ZbeyaJd/+CzOCdSuNUAlo5NA0zoaHJ00e9IcdpKfxdtudWRWVBBieCJNSgoa7stT/aYyuuCLZUPttccFWOJ7PphWJ1ua8pzQs+9EazZrq2AX+qaufL8ASHre2k3rovh5DbsmsudJRQfB1W/Zm9jZ039rPFuHVz0q0MwHdWNm+kYy6h1H/I+bvh9xzN20ktGt307hqxh/C3eR/buMVh+503rIxCHXsjAwzbgR/LGVyzg41L+b2tw6xbj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39830400003)(478600001)(1076003)(52116002)(86362001)(66946007)(66476007)(4326008)(6486002)(2616005)(66556008)(956004)(26005)(5660300002)(6506007)(107886003)(7416002)(38100700002)(2906002)(8936002)(36756003)(186003)(316002)(6916009)(6512007)(8676002)(16526019)(38350700002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?L4V+Yrxk0Mas9I6rjtNghfF+2MOCXu/vvcGGPmVgfxxWxtrIWNuNK/GfIxZp?=
 =?us-ascii?Q?tD6+iaF72zot9ff9ft/rXb14Hlvfhpgyxj2yC+yyvSp5s1A/KZfIETaXceQg?=
 =?us-ascii?Q?lg+Yjq6fvrC5036yxPhGwOQvQjBY/GYF+LiQTWxtpqBl8basjIRTjDQhrVi9?=
 =?us-ascii?Q?QpStyVEVf8EGz/yzt0QMfpyjHn95V5/VGvvwur58Tt6uFwrigWq49zb9iFbO?=
 =?us-ascii?Q?pOoMRZ7TsQgkR8hjEnH52FANLdFoPXc9LQSRUEpmnjdPhlOotXLqbXqga6jT?=
 =?us-ascii?Q?KNj6ZXiBkXcNxmBJEN1QWgXE4unbaCskcY2YYf+fzj4TIdaVfFhLefeKXMgd?=
 =?us-ascii?Q?EhE+3ANNtVw/nIju5tlSWsWqmJW0vgU88nrMExTI64uT71Gw8/83Q0h7H0Rw?=
 =?us-ascii?Q?zMSKA2vUOyTrKeVWjYNlj3I1Rodu40BBo5mPD6345pIqVY2chwRBwYjhBkfC?=
 =?us-ascii?Q?dz0b27rE8fas+TcVl7/w7nGoNwgbGsouXlaLpsKBPq4tOXIqOiHnJ4ljm9yi?=
 =?us-ascii?Q?Oniq3dyVzMA798uPr3Iy46xZrGREl1IiSVAs8UKZlB7xjYz7r/3gM2l6+Z41?=
 =?us-ascii?Q?1bW5KgrZu8G1OJluacubIsz1WjwG8ZeB25D7vXKuLRU/vQvbwC2FfncTs0Zg?=
 =?us-ascii?Q?IIIoGR1PeMRwuwc1arOqjRkpe8R7cfw8RrUo8wVxZCy4Qfb//ZFqzw4rJoeX?=
 =?us-ascii?Q?pnzrRI5pW78Y1fuqZSZ3GnSKI7Wp12ZIasPRA8Nvr/vdpcTEgMZpGLIYwW24?=
 =?us-ascii?Q?dXSbIP2imstRWkzPNwnqqULIvQAsAXHCjo0ZDo0pqVnhm1ooH7EHMwIyUd2s?=
 =?us-ascii?Q?rbxQxFlC+0lAoDfCL3oZ/82EY3doCjUc/jSheszvIy9pTVfbEWq7PUgxRQZw?=
 =?us-ascii?Q?8KkDBZvyHkrkhFrhi2+iQEVNaMDD7Ou73E1nr1C852lSUzGbEnJHaL8C2fTi?=
 =?us-ascii?Q?Vri/8flKyMc/AHIIIMATFdeFKipS2tw2ueYr8JkUS5htvoZlb2JkkB6Eh9uy?=
 =?us-ascii?Q?4mydjG363jZrDGjgw/7tsn3I5RdqAfjxrv/bkI7tmwQ7sS2Phb9/cFHy+JkL?=
 =?us-ascii?Q?UWdEBPSkhb/M8ZgJ7vqp3aRUIMgOwKY1G7qAAm8eV5/+0oxwR9xzDGkQlUQP?=
 =?us-ascii?Q?sRGGZsgUpkF6I7ED7VzKN+nzePUomauLZtzDU7XJDzrMfrMyu+Pki8E2dBRd?=
 =?us-ascii?Q?29PGljhx5M4Fl62kUQR3v2BDYEJXlMgWNqWPZYoNqUofhMflI67ShgLgNz5Y?=
 =?us-ascii?Q?key/LUjMPkvnYNHrnEyPgH6iPbJ2IR5567Ai1gWb5sZaZwgDjlWxtjfJ8Hho?=
 =?us-ascii?Q?kEfJK2/oGAPOuZJlEEZg6mhs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0640b1-8331-4a36-8b18-08d91b9abad8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:42.4647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlLY8YmXnSXz7OiFnj9CN/RLK6YyOr8+wpptNuytDiAqRQQmbcx4gGscrSqBiIosdestPf5siQm7AT67FCFsBlw2m8TuxQdLtIEBtb89IZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.0.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

Refactor the function to replace child at last. Thus we don't need to
revert it and code is simplified.

block-copy state initilization being done before replacing the child
doesn't need any drained section.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 7a6c15f141..adbbc64aa9 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -172,7 +172,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
-    bool appended = false;
 
     assert(source->total_sectors == target->total_sectors);
 
@@ -196,8 +195,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
         error_prepend(errp, "Cannot attach target child: ");
-        bdrv_unref(top);
-        return NULL;
+        goto fail;
     }
 
     bdrv_ref(source);
@@ -206,18 +204,8 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   errp);
     if (!top->file) {
         error_prepend(errp, "Cannot attach file child: ");
-        bdrv_unref(top);
-        return NULL;
-    }
-
-    bdrv_drained_begin(source);
-
-    ret = bdrv_replace_node(source, top, errp);
-    if (ret < 0) {
-        error_prepend(errp, "Cannot append copy-before-write filter: ");
         goto fail;
     }
-    appended = true;
 
     state->bcs = block_copy_state_new(top->file, state->target, false, compress,
                                       errp);
@@ -225,21 +213,22 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
     }
-    *bcs = state->bcs;
 
+    bdrv_drained_begin(source);
+    ret = bdrv_replace_node(source, top, errp);
     bdrv_drained_end(source);
+    if (ret < 0) {
+        error_prepend(errp, "Cannot append copy-before-write filter: ");
+        goto fail;
+    }
+
+    *bcs = state->bcs;
 
     return top;
 
 fail:
-    if (appended) {
-        bdrv_cbw_drop(top);
-    } else {
-        bdrv_unref(top);
-    }
-
-    bdrv_drained_end(source);
-
+    block_copy_state_free(state->bcs);
+    bdrv_unref(top);
     return NULL;
 }
 
-- 
2.29.2


