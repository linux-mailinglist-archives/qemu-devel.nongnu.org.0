Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DF92C158B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:23:44 +0100 (CET)
Received: from localhost ([::1]:39206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIND-0004Y2-TN
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:23:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID2-0004Gj-EX; Mon, 23 Nov 2020 15:13:12 -0500
Received: from mail-am6eur05on2111.outbound.protection.outlook.com
 ([40.107.22.111]:23809 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID0-0007Ry-JL; Mon, 23 Nov 2020 15:13:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GljubWxVCp47Zw8iVYY004eqrCUX2P+rsVyfxuvBKSuQu+/8KeLrcLnxqiVFhAFex4fEAoK9aNtC+pcvHuDM4H0U2aZ6s6oV8vrJk922eVsOmyeR4thXPrKXrRpEMrYbop+kR3iO1uHzF4O6BsTREZ+l5rZ2VlDofus1/kdaMRwNj7kMAOGJbyYlzyEvI812VjXtpXQUAaMQKY9Ht8d6Qv/UTAk+Ki9XUhglkKGWTv8it8jtXOiJQfAXS3lTjhlD4PrIIFlGCvklIEco8Pn96ClVcHbAsdTlAUoyhbyvzjzQQ0OjY7qodgU7CxrHr/COKy/fWbwfF80daZIipLEsUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OibO7qRzS7yhOUf9eyQuia4mFhcUb1qd3FSliT4bVj4=;
 b=mUgCvMbFHMu0+k7cXemo0er3c8kD4d8Vmddapyn0LoL4Gmg+OMnSyBY6Z38TtZJG+rFijbjT/pOCdPvcnyCm/zAr1vjfExa5DfnRBD244fIVNDqZ+KgALG4XGb/nMMayVUYDiAn0QZ6PoLq8ZBlrgeuDz11rLJelRPYt8Z1oyxhmP+Yh5urty5EQAyAGpWmumx8afGmkwzy8r1J9r7jhs3vw9C/+M0EuUrzFTB2dYwgji9dOg3jIoe9dxRlxeV6/vzcEGpVZBRxcBnM6tHha54tC83ZaX/Qj7e0UmzsYfQss8ZjcwlHHe4prGgYhXkzsVmt0oTCXZ1i8odMzfvR3Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OibO7qRzS7yhOUf9eyQuia4mFhcUb1qd3FSliT4bVj4=;
 b=ccjD3KeuJxtTPrJN37NDKcss1ovfq1L2jDOg4coQm9WdjeGvUm1xShlbdiTJbChvk3XXFs16DnQxxMxsnpf39+r6ARHC/8io6ldYZNUKsLkjDCPRpUFCAN1ESoxs1PsmdSEzTN2RPPLmpWSToDxuAmOWS8NVMZ0d8QW+TholjlY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:12:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:12:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 09/21] block: add bdrv_drv_set_perm transaction action
Date: Mon, 23 Nov 2020 23:12:21 +0300
Message-Id: <20201123201233.9534-12-vsementsov@virtuozzo.com>
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
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:12:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70fdb5ef-f84f-4a3d-4b52-08d88fec2c2c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB46909F57347BABDC5168E2DFC1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:175;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1LbXvLqH2zgsTWdOykbggqR0utxQxPJLt7R+oQw1zahwzgbvv3NbBySMrBQ2Mim0+WQGCE3/srwXb+qf/00V4wav5snp1BI8HchWc10tV7Dpj1QCTdpXOfsQrTm/gp6PW1/duY/Mi06zKroY8ZjOKOEvcAzWmLeCj79/wR1aCo5OpGebyBdNXfX8i5TkOKC5Fw+YD+9XmBJ/blbBIU3nmLeHDB0UpJkT1ifVmDuVP2udWtUnNAm4IffeXMcC4k4HvBXdeL3X0hhP4idQjKBx80TqMXSuSzLqGkqJES5AdL6/+GKDKO6xVnssj9avxhxp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: n7DXcS11gd2NOolnistXzY17jSK99uOz7p1W+3bkqPCBdzcrle+iG6NFUptM/P6vfs14OmMumKMSw5WsCzkG+6Anj8zrPyw75lO/ZGuBGtTAK9ez7FFf5Jg1Dne/1OQxRBrd/uXGfZu6N8Um+e9+mN3TlDwU1BN9QK/SWhXC+FdAuhtIrMxmMNz58NRfaUBzBPTXLRHBP5FP/0P0SvhETmYnzDMW5xUddHVanAyQCnxPe6r3vurLohVsiSOwa0z49GXvOpt6kgW1YUN5LF6vSk/VKNepaG0jsz3b520a7brl+15kYmFidAww+dRwkTo1yIr3sC3j+Fd7oz+vwGrhdsXpQMvRYxex7uX8iBtuS2QRn0fwV2cNu5CJU8nLg8zGbqC1455tJl7vKI1Klm5ZR6jnlikIIv4gCQ8yTc1KhcmV3FibBJIs4imtseTxr56WCpor+ZmjxISShlOOuQs8rY+GHOuu0EWjZ3RQmjX4Bn5Xq/YxDqtJVVmGE20u95a0JtWSQiPHSrKNTg+fUX895PM8grMdr4k5WmcEnmxdFsGx6JphfqJZS+TCVzc3hNhl/pPHqMhIWH+ouAhiTsV8W8awqUs79hvSkRxYePK7ijubkN3KnEohAyO1cMxI2yl0FrxG20VczL0zyeR8eg3WVs2pwPXyRcNgQCQdkFfhLPMFqtIN7SLOvNwwIWVqDNXsvC6T3PO0+XD5AHDlVQZjsF4iBsCb0G2gsIkhZeKDFByw/kYy6POz7uMMf2TbwLsE9oPbAzjgVeu0jJ/cuXwqHmkRhYnU1aGblxkfHVAdQZdEYqE9SH8FUW49EswIwzGOErIkta8GtOzijx6NVKP+NZPjyQHCeK6yHPcbU/ModIHA3E3/5glCB6YqmNtmmye/7xOOYDa7CHd6IVRO5QKsIg==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fdb5ef-f84f-4a3d-4b52-08d88fec2c2c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:12:59.1857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPoOdfHnWMMMESfDd72NAvWseCd5xMUJmklWb6lIvMiqIvW4Pu8fJc6Hw5MvPbw1OF72iYbWytnAPm5pfzU1/s2tfPsOPYkBZ1gfSEPoXW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.111;
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

Refactor calling driver callbacks to a separate transaction action to
be used later.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 71 ++++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 16 deletions(-)

diff --git a/block.c b/block.c
index 56263407e8..799c475dda 100644
--- a/block.c
+++ b/block.c
@@ -2094,6 +2094,54 @@ static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
     }
 }
 
+static void bdrv_drv_set_perm_commit(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+    uint64_t cumulative_perms, cumulative_shared_perms;
+
+    if (bs->drv->bdrv_set_perm) {
+        bdrv_get_cumulative_perm(bs, &cumulative_perms,
+                                 &cumulative_shared_perms);
+        bs->drv->bdrv_set_perm(bs, cumulative_perms, cumulative_shared_perms);
+    }
+}
+
+static void bdrv_drv_set_perm_abort(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+
+    if (bs->drv->bdrv_abort_perm_update) {
+        bs->drv->bdrv_abort_perm_update(bs);
+    }
+}
+
+BdrvActionDrv bdrv_drv_set_perm_drv = {
+    .abort = bdrv_drv_set_perm_abort,
+    .commit = bdrv_drv_set_perm_commit,
+};
+
+static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
+                             uint64_t shared_perm, GSList **tran,
+                             Error **errp)
+{
+    if (!bs->drv) {
+        return 0;
+    }
+
+    if (bs->drv->bdrv_check_perm) {
+        int ret = bs->drv->bdrv_check_perm(bs, perm, shared_perm, errp);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
+    if (tran) {
+        tran_prepend(tran, &bdrv_drv_set_perm_drv, bs);
+    }
+
+    return 0;
+}
+
 /*
  * Check whether permissions on this node can be changed in a way that
  * @cumulative_perms and @cumulative_shared_perms are the new cumulative
@@ -2108,6 +2156,7 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                 uint64_t cumulative_shared_perms,
                                 GSList *ignore_children, Error **errp)
 {
+    int ret;
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
 
@@ -2153,12 +2202,10 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         return 0;
     }
 
-    if (drv->bdrv_check_perm) {
-        int ret = drv->bdrv_check_perm(bs, cumulative_perms,
-                                       cumulative_shared_perms, errp);
-        if (ret < 0) {
-            return ret;
-        }
+    ret = bdrv_drv_set_perm(bs, cumulative_perms, cumulative_shared_perms, NULL,
+                            errp);
+    if (ret < 0) {
+        return ret;
     }
 
     /* Drivers that never have children can omit .bdrv_child_perm() */
@@ -2226,9 +2273,7 @@ static void bdrv_node_abort_perm_update(BlockDriverState *bs)
         return;
     }
 
-    if (drv->bdrv_abort_perm_update) {
-        drv->bdrv_abort_perm_update(bs);
-    }
+    bdrv_drv_set_perm_abort(bs);
 
     QLIST_FOREACH(c, &bs->children, next) {
         bdrv_child_set_perm_abort(c);
@@ -2246,7 +2291,6 @@ static void bdrv_abort_perm_update(BlockDriverState *bs)
 
 static void bdrv_node_set_perm(BlockDriverState *bs)
 {
-    uint64_t cumulative_perms, cumulative_shared_perms;
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
 
@@ -2254,12 +2298,7 @@ static void bdrv_node_set_perm(BlockDriverState *bs)
         return;
     }
 
-    bdrv_get_cumulative_perm(bs, &cumulative_perms, &cumulative_shared_perms);
-
-    /* Update this node */
-    if (drv->bdrv_set_perm) {
-        drv->bdrv_set_perm(bs, cumulative_perms, cumulative_shared_perms);
-    }
+    bdrv_drv_set_perm_commit(bs);
 
     /* Drivers that never have children can omit .bdrv_child_perm() */
     if (!drv->bdrv_child_perm) {
-- 
2.21.3


