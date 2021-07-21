Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D4B3D0C55
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:16:47 +0200 (CEST)
Received: from localhost ([::1]:41688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69HS-0002fI-Mk
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697M-0006kf-Gx; Wed, 21 Jul 2021 06:06:20 -0400
Received: from mail-db8eur05on2124.outbound.protection.outlook.com
 ([40.107.20.124]:45473 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697I-0001sc-P6; Wed, 21 Jul 2021 06:06:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IeVyAYCAwjt/QfW5yEVktnqNslzyc7wL7uAIp0H4hb1sS/rm22gTqVCsWaopBNQM3YxKSrKeUIDtJ8uO6V0qF6hxcjJAr7JPomOW1YtL0Cgn2rtm4DY7hBvi19yUT0hbXVMeLNknbRkxRiTBUu0X4iezL92VZ+rF/5cRUbUPrGkcsf4oYRbWA585Gqrg3yFrMu6107g6oDHUyDLJV4fxMOo6PAuDOvLnc9Z1kfOzQgamHhFY8ilsk1IdxBuV/Wgjk8gCqaXCrpPEx9YmU2RcOjQOCsoD63v1KXJTeChQhYngkzWsfXjXtIAOpdP9ZG0Jv9LX82eQNzqhgwqR9R5uvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I99hEQYRN2VEWq2fBOfzfLSY2qDiGqXXBttcRP+uVDM=;
 b=G8vDThhpUV0DNh3pdOWqWHDk70rnGDTXoqlHlqkw3Khx4U0KjwXRLTfF5hzepy+WI+XdF7tMUQq53tMqOwvFXgRyXObVtA302qNBw5lWB07HrOrLPh1nBmaUnPpdax0ift+AkCKx3kdX+/nrsXFBamswQUWpMsqmuduO8syGUuspphWzZsqJNgBr8w6lP1dVsdVmDlu3uBFGm7B8Dw6NUO0lDzfco+/SuJyfzQs5KCVwMJxNAuyIAFMZPrwXmTexGYv5iGqV0JDdo0lHmjoegJZyE0o3PamERNter8kuCm+gDXgDoWbBLL3MJFAbTU1NrRGCMzahwW/SzK19kiM8CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I99hEQYRN2VEWq2fBOfzfLSY2qDiGqXXBttcRP+uVDM=;
 b=MDIG/aPRWYqzU11IM/WTTgLMJrsYueu2RD8opZ8hLKPMDgok6+0R0WvnMhNBG7QpU9knFK8u0yzXohixZB4JvTbflJ/KTbOfB8UWgjVLl8DojgJlGC4EhvDjdYf4FTwapQt8fPtE2C+KmvFvgHgogtHQHVKp30VsNUL7pAqd7Cg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4168.eurprd08.prod.outlook.com (2603:10a6:20b:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.28; Wed, 21 Jul
 2021 10:06:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 01/33] block: introduce bdrv_replace_child_bs()
Date: Wed, 21 Jul 2021 13:05:23 +0300
Message-Id: <20210721100555.45594-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8978401b-03c9-4b32-e38a-08d94c2f2aa4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB41683D9F244426A67173038CC1E39@AM6PR08MB4168.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sjt8xAGSglskpWMviMocuf2wTTMK2fY8wS9ws0PZpnZ/447kp7O/TjlSmadBZFvoGujYVzJql1BDW+KWpbMLU5NFaQPu0AFLpnVZybnAcCZpLZ9KpcYRbLkJXapPhFuoaa3FHxv1SndyU9rnrKgtdiit117Rk4dLFOWnVPiAm5VBiWPsOGMOBmlvFEtZwtOV6mwYn+QDAC2d2XfuZ4KXstrvUZiuqINhnVsuUdrxtz8MnQm6UxPblRQK65xOEK+Hc0BJ5+biwItdaY25TM9S5hCpjvzzsdyOgYkYwZGcfPeFHecr00WKOBHKzO0YqpYojjA6WVGWaOr6cQAg+AYvOkZn1Kz61vcS9hrnwmeC+6aOvUMLI1G7jJKm5p0iDDB3OpORvlz+8Q/ME8xMhrC4Mndd87MX8fXuU2qWNm1dKEr3MQ7R/1l8k6N97o+btPLt277CNXgAtaTTqHwvP23zTjSWJ0t5Xl1ly56RIGSICZPrILodcL2+L+xeK6/mfujcei6nRZOaioFwHndXndJ6uJmqaw7ZO/vXP4auTbawTiKD8sxP7vT2JgYAWc0I8kt9MwfrOQ0Hjyx2RDuOczdUCPqeYs7HOaXJmmJOS5KnVsaDFL370Z5WInCVh6Sw/Jdd1KiDtABLH7maRTC1SleFoj4Wpz2l0b0JMsISbYML62AqT+HbsN6q4FkSMma3Kqy24HWpbX7GUZyIaVrCUC90WA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(136003)(366004)(346002)(376002)(6916009)(83380400001)(86362001)(26005)(186003)(36756003)(2906002)(8676002)(6512007)(956004)(2616005)(6666004)(4326008)(66476007)(316002)(38350700002)(66556008)(38100700002)(6486002)(5660300002)(6506007)(66946007)(7416002)(1076003)(478600001)(8936002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aW2B5lcWJor2MmKxSCS+24bB76unzz9ByTFxtVPg2/MicP0Hhw9xmLH2Ic9x?=
 =?us-ascii?Q?wOqslN+ZV+nW+vqMqQauo1A/9c7FUZVjlRJ6qhBQmfjYi2CGojpkye6feKhn?=
 =?us-ascii?Q?avqgwg0UXBI+rcx0RKFYQhPdD1TH8VW4cDyE2mjknV+N4eAHJcz1OhUeoxAM?=
 =?us-ascii?Q?LMh0slEORHA3mZm7jBOC/JAx/ZonCJenniZZktXSwpTZTPvkUu8HIzGR6qBU?=
 =?us-ascii?Q?686AmNJ+gEs4KzWiRerwpAugS7weLvkRAuPO9hMrBNiDF9vVqjh3N9TtzUMU?=
 =?us-ascii?Q?115QsqbG/L79rvT3PsDcpdO8IGNIF9Z9gTZwcN5lj397MUtt6kLhgcBBE9At?=
 =?us-ascii?Q?mCPV8a70qsNIekict4SZZAXpILBHi8sQH0gLEyvp7wYLAMdXoXWzUxdKXJdV?=
 =?us-ascii?Q?Sb3YPhgOKedkQKA5R6q0YRfmVuMhbVEv5xCpOosGBSPeBx7iwaFcx/k2RjZi?=
 =?us-ascii?Q?wuR1o6g0zIyadOrCq6gZfwFLrwYtrY0EP+Q/nzafMBbII9c6I1MpzeTTwVk+?=
 =?us-ascii?Q?wV4vMoiH1goQ7OE2zop/unn+mQIt9cLTDlNLCRgT8iwHqF0s3I4l4pAqXWYh?=
 =?us-ascii?Q?QZs7toasTYzZENqM7aX0xv85dHWQTCymZdDGQuYjaacRkPR5l+anJCPaWbYU?=
 =?us-ascii?Q?F1KihXeq31hzhXxDZIFxt0+/pX752SpgfRr8dDgEeCQrti8ByNRqOsUntP9a?=
 =?us-ascii?Q?7xmE6kmugySqAV+MgiO5zIxznTFFyLq426qQltt+6s+woYkFDgs+bizXuEAD?=
 =?us-ascii?Q?KB64wKNuguliPnOQtfD/HopfVi8dq+nrYPJpke9Tju4uRXn0FxdWLLeeWYH2?=
 =?us-ascii?Q?A4ZivsXWh4MFdEe5FAQo3ppT4BMZ6FB1Cys+kRO/eCs2GAlJF24GkFlzsoCH?=
 =?us-ascii?Q?QgWsNaHbr98tLtDCGPT7BVHzZ8lZ9lOUqKRHI8I2Sj9nuEJBPKepwi2oPEg4?=
 =?us-ascii?Q?IGmZivGmv9J7BMvPiPp6q8yNADbXV8+dOZW2nuFjkD3amcapGbEJ39YBVSKm?=
 =?us-ascii?Q?WzyKR0c85XpB/6Y+TzK5273KKR0I+Wi7SvrZkeS2YDvNzAi4GzStkh+aPmV/?=
 =?us-ascii?Q?6ou0K3U4TXQqahruAxh3AdbzsI1Gt4YwEIEWD3K50ufddhZ3kLx/c129f0BD?=
 =?us-ascii?Q?tjoIJRrG5hoYauB7xtNNuWHP0j4nImjJk8KmDHG2HEabceGRIpRjbTqw+1+u?=
 =?us-ascii?Q?oI5/dVJ6mmruHRmtmnFQXvhcTsnJW2ocEKkbUmPorz3MkAqWAg8OvN8HRG2G?=
 =?us-ascii?Q?Q2uRctnvB0y8f3G/9991fu0cRIWGeq5k+0rqOH91l7Lip0mGpSyU5vEBiPVt?=
 =?us-ascii?Q?UVTv6unxJC774UjX48C7US0y?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8978401b-03c9-4b32-e38a-08d94c2f2aa4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:11.3503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4iIJ7MJ0hfQTXbc+6kWTBknOq15pGqHD+1V59nlwMdMeDB67gZ6j8vyQKlyeYhd0EKMRErMtrfCrSWajWthgtlPcJI4lzsARR23ifWZ1Fg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4168
Received-SPF: pass client-ip=40.107.20.124;
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

Add function to transactionally replace bs inside BdrvChild.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block.h |  2 ++
 block.c               | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index 3477290f9a..740038a892 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -361,6 +361,8 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp);
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp);
+int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
+                          Error **errp);
 BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
                                    int flags, Error **errp);
 int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
diff --git a/block.c b/block.c
index be083f389e..94a556e61d 100644
--- a/block.c
+++ b/block.c
@@ -5048,6 +5048,37 @@ out:
     return ret;
 }
 
+/* Not for empty child */
+int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
+                          Error **errp)
+{
+    int ret;
+    Transaction *tran = tran_new();
+    g_autoptr(GHashTable) found = NULL;
+    g_autoptr(GSList) refresh_list = NULL;
+    BlockDriverState *old_bs = child->bs;
+
+    bdrv_ref(old_bs);
+    bdrv_drained_begin(old_bs);
+    bdrv_drained_begin(new_bs);
+
+    bdrv_replace_child_tran(child, new_bs, tran);
+
+    found = g_hash_table_new(NULL, NULL);
+    refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
+    refresh_list = bdrv_topological_dfs(refresh_list, found, new_bs);
+
+    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
+
+    tran_finalize(tran, ret);
+
+    bdrv_drained_end(old_bs);
+    bdrv_drained_end(new_bs);
+    bdrv_unref(old_bs);
+
+    return ret;
+}
+
 static void bdrv_delete(BlockDriverState *bs)
 {
     assert(bdrv_op_blocker_is_empty(bs));
-- 
2.29.2


