Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB8933F3B6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:52:01 +0100 (CET)
Received: from localhost ([::1]:45632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXWi-0004Eg-Dp
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHi-0004iV-O6; Wed, 17 Mar 2021 10:36:30 -0400
Received: from mail-eopbgr60123.outbound.protection.outlook.com
 ([40.107.6.123]:28737 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHg-0006ux-0y; Wed, 17 Mar 2021 10:36:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwuRR4moS1Fk4SKgcpK8FCRDsX6uSbnb3aNl+/C5RQ+mSlLvc2RonsqqHSiR99UCmEhXzmi7Lr6TdnEWH/JvhprXtObaIB3yC1jW++H/LynJYVotPyyDREtJ7j7VEZKr5X09BVeEI03tOlwSXrDdyQNXq/gpCcFCpRlhVNib1E2JlvkK130IdXGlS6cSM68JDu9NZ4biMvT/7oscKfkX3+YBOSLTtZRkWL19fIDKRe6+NyKbOoEOHrX+EZ28bR8PdweNBXn9THqlPx/ZgW0o2S3cc9qBoswZzLHUdD1b33X0hT+na932F5uF6t5UkfYlaNmRv93KvuN9mLAoeaYGVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeAyPFXMxUDHKazQMEbvQ9kXfFq2N/wTghh6ijVg7Bo=;
 b=OpnaxagJ5t1PeyFc4dl/HbgsOdceKQmmKIb+R4iewyZNzLv9XGiY4dgFmj1gqX45JXgJYrHfNBCdQ1B2n/CdMu2qMPFGNpEhML9YO1xZGJ6L5b2TmxGPGz5yX/jUsgGIbiasL/6ho/ClsGvaPzvgZvBdlXc54YwBslzuz4wKxlrAfqYmFdbT2j7U9+KEHhWzT5lRECnwLx1rHnV8N13BxUCIO50+BXPcodolA4NejQ6KBgw6NOrtsZjQG3zohJ+BYbnHxCGuoYDEQ4+MIP0Qh2sY0l/kSjr6Z++PE4tfr5Wlo2pwfVotaYzkSE7VeldbkRiPRqF5Q9VLVbN/LeNe5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeAyPFXMxUDHKazQMEbvQ9kXfFq2N/wTghh6ijVg7Bo=;
 b=Ft1B+175J4zYRelTJuoAy+H5fEZpErbB9n5fFXGwBV0IlzX/Wie578EJwSAe8uEWjXzaSD3+GJ7vAoHA2trjopGPGDqvzRA/8RgbGGHQ1bg5cTQ+PMDNvKxRC+nkGSwsG3CGtbQz/irZj2n3TKW2ylnpFFBnMZF6G7dtkE8vgQA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 11/36] block: rewrite bdrv_child_try_set_perm() using
 bdrv_refresh_perms()
Date: Wed, 17 Mar 2021 17:35:04 +0300
Message-Id: <20210317143529.615584-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38c50336-6cca-47d6-88f3-08d8e95206d8
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544755DB7278F38ECDEACFBC16A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SnSu1VPj2MEVaGNHfocusPW6r9igDFwKOuu56scHTqFZ0Js/M5x7Iqo0ktMSWfUj8pGzOVzKbKdmEmF9mKKpFhao9Ubj/ins1b5ZMXBvcNmmtRzRSJgONBiH7Zk1WZW75c3EIu5sU3lWZbEn57lKAWj230MolMf5fhzNLrLSg8/hX+UPdAN5sbaFOZiUucWnUzxNXORuqRdyf83yWYFkKrdmCEGBQ21IPDJo79Rhz+vkrdqFXByUgsfxF6hJkM7SxveDfgMkF6E4TyOx4HUcJ6WLkj1fpRpnGW7lxIlVGZQr+LXdmMK6U3RcISJvRw2e0y1PuCnIjy0PPKCh47fy1v3isX5zWzfaOZnwqTnsNUf5+Q6OVDzoVOak7in1Pp8TWA5QJq+8PVnPfDHBHzHD68SOTvYZPrTnNAhzLS5u7mu+Vm2wBEboiDVEBeuO0m06wXEULMCK4hAPVKiS7s4wHI2TUPaL43ob3RrKnQALeczn0h91eXaQ8Cpbcej47op5Wl9vMpHIUBzUdJLLZNuV6a0t3Z1LQujg6AcHZsxvG6CbnYqzMWPYfmiQdZC7+NePHuYfvoP9MOUi8MhAroMAMq8nTgL4zBaGajZWQ8xNRKPTgU/wtKxHa9vaQ5NUeZ9S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39840400004)(136003)(396003)(186003)(8676002)(16526019)(26005)(86362001)(1076003)(52116002)(36756003)(6916009)(66476007)(6506007)(4326008)(6486002)(2616005)(5660300002)(8936002)(66556008)(66946007)(83380400001)(2906002)(478600001)(956004)(6666004)(69590400012)(6512007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?B/3cOr+9Vf5nLCx0NuLiEm4uEBHLkIOkiv3qwRLKMu58xxP7yZP39Jzy16nO?=
 =?us-ascii?Q?ccX0tLw+Ys/caJsZQ1VmtpSvHzZjCTyFKT3BeOtQ/vZTI9gYF0tyg9sakBU6?=
 =?us-ascii?Q?VkXw9gVgFzm2Xnoq0lAvASiEIJwPkXGc0AOpB5oXTmgpffWZy/ypUps3MAaP?=
 =?us-ascii?Q?2dxgHtyflcI5bKKFbfN4egBXipMGhQDR/Lo3fYWVCLShT1QdQ+eNX5ffTDxh?=
 =?us-ascii?Q?zuxGZVHlB5XEEGUPqFD9itQ4Xomt/0Pk/12BeymTu2cmaIiuDOj1sZAdz/u3?=
 =?us-ascii?Q?MlesBCw0zR4MMPC+Y5KUEKNd5HC9aKdkb/TcuVufVNWA+C2+WuHOmOlvX4Xw?=
 =?us-ascii?Q?G9YXBNcxTknhdWzNbgFzorDdJLiVBt6Uiq4yS52GSzQL4AkZigno4h5elr4n?=
 =?us-ascii?Q?ZMNWgyF9fjDDSPmshXXkTLZEr5lAD7BvtagvU61Gzz6cdAs0KLr0zCjNoePu?=
 =?us-ascii?Q?sWNv2fmiMiy7pquw3nW6/313vs6IFgXJTATqg5N4QZYutEKhDKzk9259lPE5?=
 =?us-ascii?Q?sBDD1a3/XhwD6LeB0SpYcmxUIf4lxqcYH/z3EUV5JjPxZ037FVbF8k6NV1iy?=
 =?us-ascii?Q?DaoiH47mu7LifVTZV3YobeTIKeb1FEJusSC5YzBRMAlY4bJ/239SFT8Lf/0j?=
 =?us-ascii?Q?jRno4Lx963OR6FXXw/i65Db/lnMoZEqJ4haMBdICw7iHgHBUwxc/4TUzLSI+?=
 =?us-ascii?Q?1eCln04PYWzq33rEI7UKwtne1lYjdYkcLo5p2cRELZJZR0tu8kW9c2EfnFr6?=
 =?us-ascii?Q?Yl406PkwnVgkR9/DBYveK9+WFuzHeu/ESNKQZqwplXw69q61RLsORDRcfiBx?=
 =?us-ascii?Q?cLCYrMj5vHUolBuNj1z7icV4/vI2U3JYkoEhiVqb2WBhpStUhEtTr443GFz8?=
 =?us-ascii?Q?CfD/jdGlPNGGR1U2ebtgchPlmlLyCGWwGwilT5IifyJYQ82RjoBoxp8tAwNs?=
 =?us-ascii?Q?b+6xFoU7V9JVSgxK2wBZWUe3Fi1LSimFGzdHuK/fZ0mAeG4ysdcboYZ6zCHH?=
 =?us-ascii?Q?2ajanoiWcdqS8RNV9+bSrqFUOGUv2k02JSZ2gzTvBvS6tNQGB+NmyUbQSHZk?=
 =?us-ascii?Q?aHOsvk7Xm4vzI9S69rd8/W9fMyzDFYQVUXwGWAH23uCS13bZ2S1xsAvM78HF?=
 =?us-ascii?Q?rJQZwW+SXGF1Amhh6wvDga2EBtrE2Z0EwL9kj97QCenspdZ6sYuYj8o4mBB9?=
 =?us-ascii?Q?F1ykwfaPAcn8s5e3dEHpZ+VkKCa3zX644nRtrME7jTS5erxKdqf7VQwqIgO2?=
 =?us-ascii?Q?YlQ5H82mGsXUCyg8QoH94zSx5jJlBlMxgWFQzMbJ9Ztwoh4dcLp4HPfXHhe1?=
 =?us-ascii?Q?E39mnfX3LE0YHmpzEcL8wtcc?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c50336-6cca-47d6-88f3-08d8e95206d8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:18.6958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bv0m2dD3olmtoehOu3+6WMYxwr9Ejagx8v8ZnGGO8E6zfP0dK29jA1BvCcjRCjvylaEbQc2lMpOxIggUO2HQgU9x/pAoVouVsZ/k0cIN0f8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.6.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

We are going to drop recursive bdrv_child_* functions, so stop use them
in bdrv_child_try_set_perm() as a first step.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index 2d64c498fc..1f10ce1861 100644
--- a/block.c
+++ b/block.c
@@ -2420,11 +2420,16 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
                             Error **errp)
 {
     Error *local_err = NULL;
+    Transaction *tran = tran_new();
     int ret;
 
-    ret = bdrv_child_check_perm(c, NULL, perm, shared, NULL, &local_err);
+    bdrv_child_set_perm_safe(c, perm, shared, tran);
+
+    ret = bdrv_refresh_perms(c->bs, &local_err);
+
+    tran_finalize(tran, ret);
+
     if (ret < 0) {
-        bdrv_child_abort_perm_update(c);
         if ((perm & ~c->perm) || (c->shared_perm & ~shared)) {
             /* tighten permissions */
             error_propagate(errp, local_err);
@@ -2438,12 +2443,9 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
             error_free(local_err);
             ret = 0;
         }
-        return ret;
     }
 
-    bdrv_child_set_perm(c);
-
-    return 0;
+    return ret;
 }
 
 int bdrv_child_refresh_perms(BlockDriverState *bs, BdrvChild *c, Error **errp)
-- 
2.29.2


