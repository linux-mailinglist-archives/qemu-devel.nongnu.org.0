Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3542C168F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:32:54 +0100 (CET)
Received: from localhost ([::1]:33262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIW5-0005io-3h
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICr-0003pe-0U; Mon, 23 Nov 2020 15:13:01 -0500
Received: from mail-am6eur05on2106.outbound.protection.outlook.com
 ([40.107.22.106]:21121 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khICo-0007NS-Tf; Mon, 23 Nov 2020 15:13:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1tTrsWNvzvl5dMugmZ7piuK4CT2eBjPEspPHnvw+hpWQjLIQwRa7e/ST2f39V7cRk3BGMEcXIQxtcIYESuKPdv7czXqQKZOgbBphCVsVuU7tYP/zulwtwvC6cj0W2OWDqeyE1MvxIr3/NCpzcZFv0AkbetxIv+7Nk/+ZAGCdStWqr7osMLLzo1/n6+tmX0HFjl4ZMIrdbJC/Aj6M3ZktGMnkY0/NFLyLXquLJST3N7DaFOc1CMWbcGW37ff7osLv4S5/5H3V7f8NQhRLUZhFQeEY/+aHWvpQT3BJ27CttTmRFbQ4ysYSt2eS5H+g4aADvgLrxUcfCuRqNmHF508Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcJJOEbqu4yHarlC96vOfIQCdQa3o4nLmn3cJ1c2fTY=;
 b=gaxs/26KW6ylsSBYE2+xU0CVPiIqcRUGtQ1vnytaQDvPblu5ZUEpj3KqSFfEeCfOB4HpuSGReV9pLG7JF6pj1gnfvCT9mVf6/nikYaeloxArFL6u/2tt+9J8+ELs7wKsqk44YBX2j4sm0OM0txCwms1wkdn/NDf2u4Awx/L9CpekcjI1aZ+eKy+zgGDNdOQYCuduJD/I51GJluexWI5mMN2IZVizN6a1ekKPtMHiBMDyDlRQQZ4XHhF0fblkmXLCv7+TwzxLFfXcEv1T3RaEZpfFmmgmHy9ZU0CXU13kQyHCR2vDoGArvzrLjNvQIOX2ta2CEvT5me8vt9VBvd/0vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcJJOEbqu4yHarlC96vOfIQCdQa3o4nLmn3cJ1c2fTY=;
 b=LlFrt8TZxQFpRUh9qpTC925pswDuUn3nYjEgPRp4y9aJR8QXuGjcc0uTJB9lZvwyS5oWxn2uoghj7kY0/lZiz/ZpIbMVGSXAKYqThx++/fYdakJANPPejIEqpbyKhGsdfSfmD3xIE6EXHGcHphXSPrQxzQ//UQAnbfgPCv3wkXw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:12:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:12:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 1/2] block: make bdrv_drop_intermediate() less wrong
Date: Mon, 23 Nov 2020 23:12:11 +0300
Message-Id: <20201123201233.9534-2-vsementsov@virtuozzo.com>
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
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:12:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c471b22-716e-4ab9-afd1-08d88fec2604
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB469087A7F924C46894C97F91C1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7VNe5SuilSldth4O9ZpKVks9fsC9mflhkAxwepfZYeStrfvHDwWRLkNiJH08vVV0BrO6T4CTbiENxwce6h2LEtgDKNqbfof7NwqzgJcHfgnfu31fD7pK48Y6S+R3zC+SoOc6M72QsdBfgpwFJeN1dNsWDyJ88Sk5u8DJ/PBFPHmOAD4mZaPn69WkgrmBYnR9DQcsVmzXTSzCG3rpwIwkdCp/sumtrh3+OKS8uEZNFoMSPHFTeFhsH7TZzy6FJugP36cc1Jn8L5f3H0Df+YETIJg6ItNF7CFXrPCRBR8jegux5qnScGqNx3/mFO0RIoXvRHpSeJyog9RBgJQVPMpkKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: aXwUiPwr2uoUjxUx2iTUTdiyHCGWXw+yGhE1cg68uO3aHMzjl2UG5twYNLPz4k0bLhASKs86m8UkvvkLfobNtZnMju0ZuzAsxU6GbEH71hU5+h7SQyPbVpsVvxF1Fkp+aFB5t0ntaH57gwLvVITzLIfHslcEJiMic9SDoFAcujsu5J+0c0wxrs57DYFZxF6+okee6Vt/+trOiL6aGmpWICZecvQPttrJ+73e2MeLyRnohGYdXLkfufcUgG45YWYKx2RKcyosU9ojBSDfCBA1xgKEQSTVNjzwI4G8kkxbTfUfMjtJAxz5ttzLZPiHn+1X2bLSj38l8QZyIyZEUus1T/huEnhxvRfpKB+iy9cIwl9KXgKph4Xy8p0Sb0w1wPHwVhluh5h93gHjwY11r0IBHCnDIgymxlgKpXK1zXzox129Lac4wuAbCIW/VjLoFjSPyWR8XUegke12hMyKX3iXTu6r5OCF8+zVmFdmSpLaUAwmsRsm7HF3CXZ580vh/COKIJr1o9xqw8FQVVORaaA856bTST5CPFGmlSaAPLN74IF8W08ZOb52VKRqcPuuSSW/xTl5h+mWh0w7CrKoo37HIPtwMo3qYmVyCEn3vybo4ifRgllJ7zL+cpgCiYnuPftpeV+qrWNzJ3olMDCt1s9v/mMEX2ABNKm1vDVe5PCO/152wD/6uu3oSMNF0GXkQhCh+/tsXg+K5mIImzP+84mzwqoG3YYjC2w1CAyU9K88TTRVqwaFYI0mVbSC0hPkZc9Bf+Q4qvx1Nmm9Hvn6Ns0b1WhxQUWrdVH6O3rbNCg1qyK4rlusJCoX5HXI7mnszNi5EcqAfWcSx6a+ebKzeLKBdKxvgvk0Og0sb+aQXZXPKxIfiMu3NmabvD56q+V3ij1o+LVRyQLEDXuAjsKLLgcaKw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c471b22-716e-4ab9-afd1-08d88fec2604
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:12:48.9812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d9tL6YAR8P4BVz7WpSC2SAJNlNbiSs6HBqkejyJdkYBmB6A+tiHRzOkB/CoIGDu8asxNzNDpDvCPAKGlZi572exBL7nK752fZiuPkD1+qJw=
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

First, permission update loop tries to do iterations transactionally,
but the whole update is not transactional: nobody roll-back successful
loop iterations when some iteration fails.

Second, in the iteration we have nested permission update:
c->klass->update_filename may point to bdrv_child_cb_update_filename()
which calls bdrv_backing_update_filename(), which may do node reopen to
RW.

Permission update system is not prepared to nested updates, at least it
has intermediate permission-update state stored in BdrvChild
structures: has_backup_perm, backup_perm and backup_shared_perm.

So, let's first do bdrv_replace_node() (which is more transactional
than open-coded update in bdrv_drop_intermediate()) and then call
update_filename() in separate. We still do not rollback changes in case
of update_filename() failure but it's not much worse than pre-patch
behavior.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/block.c b/block.c
index 9538af4884..bd9f4e534b 100644
--- a/block.c
+++ b/block.c
@@ -4958,36 +4958,30 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
         backing_file_str = base->filename;
     }
 
-    QLIST_FOREACH_SAFE(c, &top->parents, next_parent, next) {
-        /* Check whether we are allowed to switch c from top to base */
-        GSList *ignore_children = g_slist_prepend(NULL, c);
-        ret = bdrv_check_update_perm(base, NULL, c->perm, c->shared_perm,
-                                     ignore_children, NULL, &local_err);
-        g_slist_free(ignore_children);
-        if (ret < 0) {
-            error_report_err(local_err);
-            goto exit;
-        }
+    bdrv_replace_node(top, base, &local_err);
+    if (local_err) {
+        error_report_err(local_err);
+        goto exit;
+    }
 
-        /* If so, update the backing file path in the image file */
+    QLIST_FOREACH_SAFE(c, &base->parents, next_parent, next) {
         if (c->klass->update_filename) {
             ret = c->klass->update_filename(c, base, backing_file_str,
                                             &local_err);
             if (ret < 0) {
-                bdrv_abort_perm_update(base);
+                /*
+                 * TODO: Actually, we want to rollback all previous iterations
+                 * of this loop, and (which is almost impossible) previous
+                 * bdrv_replace_node()...
+                 *
+                 * Note, that c->klass->update_filename may lead to permission
+                 * update, so it's a bad idea to call it inside permission
+                 * update transaction of bdrv_replace_node.
+                 */
                 error_report_err(local_err);
                 goto exit;
             }
         }
-
-        /*
-         * Do the actual switch in the in-memory graph.
-         * Completes bdrv_check_update_perm() transaction internally.
-         * c->frozen is false, we have checked that above.
-         */
-        bdrv_ref(base);
-        bdrv_replace_child(c, base);
-        bdrv_unref(top);
     }
 
     if (update_inherits_from) {
-- 
2.21.3


