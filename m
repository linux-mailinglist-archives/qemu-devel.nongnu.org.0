Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C443824B1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:47:30 +0200 (CEST)
Received: from localhost ([::1]:33580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liX2H-0005tf-O1
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liWzl-00038Q-BE; Mon, 17 May 2021 02:44:53 -0400
Received: from mail-eopbgr30130.outbound.protection.outlook.com
 ([40.107.3.130]:60322 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liWzj-0001jR-KQ; Mon, 17 May 2021 02:44:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGSfp4A3Aqv5Rn3IT/ZHmtdagOKUXtXokg+j37XSPPld2RfVydtG+0gUZ5+ixmminksW5dYt2Hd0I8CIp6jOm68j+Fj8LetfVTBmdCAC1Yl1CEQrZT0GjDsj1YOQedPmEfoQJtp5ezuIm1+1XdZMHN3oAM3DohywodNpOj/FvkAx+nQYO8+OxWnUyUQjhrBAHegDY3ndfogq/Vm5Eg6Og8oHw64ruJkSuYKWLQzPTN0WdTK6747zDpKIL3uS20NudYReiJpc0eiSocXo5HHZcBcpVPRVCM8Ohf/5WS9KeTCHfqNrdN3XVdOULJxKcunTwdlgrHFyQNMISO+vlkXZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKMLfRG+0XwSxj/Anf8+H5ERipCMV1cx9AWoGmm/KrM=;
 b=ML/y53+KXmipydO+joGPfAZoBKGXfzQlgCFDRbWAIWcdm5dbbVEyhfEhFttvbByGade3xObfFaj+92T9+wNVd1h9VM9ptpxR1XYQ1JazJ7cifrpNd2IPgaoeIUlXgzTkdwYB1OaJUohwyGNRYA0WU3Xn/QBloxIN6sAwkSQS5RnMOmubTMCQzm+XLdnVaAjQ46KvB2Z4P8i/fw5N/HAlsdqp39iNIXsP0SWhvwt0MPrjGTygMbFM6h93MWBXgp1GDMUmvnzw4vjJnqPvm8Jm5vGm4pG9kd7AvCq5CJO7RA1Z/XeCkGzDEyIToVaItoXks1GJhTUbkwKxRyCmlA6ehQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKMLfRG+0XwSxj/Anf8+H5ERipCMV1cx9AWoGmm/KrM=;
 b=cx9okBsDAtQqozHE4jEZKGjmUxvyIzDa5UUVg/iwEPBnJd7laE6cqoo+IavXhE75gAOuHH6j9fbBPnpOlWZt20QwNv3Pu08oYNp4DExL2wQYagY4gj1808kUm2M3+LPVdcVgnPvRi/UZJZ+bzG0m/UccD2y/K24epxEcAUHdSdo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 06:44:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:44:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH] block/copy-on-read: use bdrv_drop_filter() and drop s->active
Date: Mon, 17 May 2021 09:44:07 +0300
Message-Id: <20210517064428.16223-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517064428.16223-1-vsementsov@virtuozzo.com>
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.231) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:44:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba86847d-4ef7-4432-1e45-08d918ff41cb
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB33826DAF9153DD196E596CB3C12D9@AM6PR08MB3382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:111;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oeWsKg2v+NQAC2yLwujgcLYDS33epWUGy4NxdeJefKcGa4FmYcCpVeK59lcLIPEYatJgqm+U5w9XnnPR7kXcUeYEwHIvGJZfbInSawtTTeN7yjfx8sn0WdnmWrhYbMafPWBkRZJtk9rLlxBcZvbf/GHBuI7P1n1xuC7pRiKu1zbZlG7jyl5ohh5ST0oxH/QrzFwhcC3dF9cCFHK6Cl3QvMDtjz8kw5YW/88cYi3JcLYVhIdf0VXPnEg0JG7Ap7VX7kQfuurMy/4OTL/AuaCrte0H51yfP7Z6qZmwSMVPuKZv3CfdO3jGIQUWJ2B9ESyu7tedFkdEaNZlVHl/m9IyjbVkP+6Sb1LA/scyDuJxUrRLWr4lfWskg9Vm02bp5PQr1wrt4UAFTcXg+3gvkSJ/6ftVrDB2CAVd0B/XicGb/ZpPxnOaipi4TdmB54yQzbi5T+8iJwGdiaviAJK52Mz0FMVMUFJsgZRJFRjVWivX+ah+AJZN9+4LzXjgdu5EskYZUHTQFz9KwjxO8mnTIH3n9YDIkidfrfWWOgkDAqbqCKlDCmxu34SR6W2ls0jWMFXZ3KKGxUaxcV1G2qAW0gxgNYrFywa7GeaCoeMI48ntWehCTeFwUyTfN5Dm545hhZL6TsajzSTR/kxJDLg/uUYwiEyvYOuWIr3PqYq1bEDbjRxB3eR4QtdV9brM9leMVMiZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39840400004)(6486002)(26005)(2906002)(316002)(36756003)(66946007)(1076003)(107886003)(5660300002)(16526019)(186003)(478600001)(38350700002)(38100700002)(8676002)(6666004)(86362001)(2616005)(66556008)(52116002)(8936002)(66476007)(83380400001)(6916009)(6506007)(6512007)(956004)(7416002)(4326008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5nkyHc+0kxouLrGk6HF2XWFDUhee/Nn0SpZK3vfppjZFQbTucjj9DWFFhDPv?=
 =?us-ascii?Q?dRr9ncMsAfw22wtakfGwQuCTu85/F62WTkxBepfccfjxaNcjmToqj9cQbUDR?=
 =?us-ascii?Q?Fh+9/HzjfLhYH0x9npdk5RcO4MVYVMbfPxQzo9mPzpxPgklvFCCjF5RMnAFx?=
 =?us-ascii?Q?Mdpeu4v8UwARKH5rtMrMMkqisQSP9pGze+PW7kFQ9uevD8L+7SK42j54iLHP?=
 =?us-ascii?Q?1S+2Tgql6P6McxYNAEDmFiRdYZgi4zzyNdK0a0uHPXilABWJcSoJ/0nr0Tvw?=
 =?us-ascii?Q?GmfbBnMLnGNy2YPovxE6vy8JmKzsJOOQX2WjKlCHvqtUEDTOjS9g72dHl3/C?=
 =?us-ascii?Q?Q3ErG2YZWbT2zLD6RUqIlArFWuIOBm/RxqZTdLo+peOuoBhmpUxgbF9fHtVY?=
 =?us-ascii?Q?fggQbgl77P2e3SeIlCLfTPhGtYxSKanlfn8lkALzYy5dc2EPrQ586zZoF2qM?=
 =?us-ascii?Q?cIYo+y4iipxI2CO+BZENbIvnSE1okfUkJ6c0jfXTsqIx1/x9m8qcOSJFRYUj?=
 =?us-ascii?Q?b4vmxhL3wjK1f1boyXxr405invbiUhHD8EwU/r/gmZpVcqHItVMGdzjLvKXt?=
 =?us-ascii?Q?ffZBUC7DX0p06S7Hj+BiJ9qPEwSyL1cZ4FavZKEXvchpKUnKeIP/d7UFIIrQ?=
 =?us-ascii?Q?tl90tQpcxKZ8+wXc0Fc42nSAL9C+vNGkL997RQpPjMzgWwqxoU1ehMvDiP3h?=
 =?us-ascii?Q?KqJbm4Wcnxpph3z5iMuWypPVoqqMsyAXdEIYZrR63cqMqbfx4jnqGafjje4x?=
 =?us-ascii?Q?eB6irnyVHSbNcaNxhafAI5IptoGxxLvT+Xpe5dYN+43mHY4HZQKCqB/B4i2b?=
 =?us-ascii?Q?lPLX5hvLRooLC6rJZ7VFjFslk2naEZb7wATUf+pvr0KXc9zlTiGwnJrSpSXT?=
 =?us-ascii?Q?CIS4YNtHKOGa1c29/Rim1G9LsD5iWeSXbuINpeZXAWv4b/nPxy5sZEvZ260z?=
 =?us-ascii?Q?nmQC3+9/2Z1Y/SovJAzFvlPxMsHQjgXrU7B/ZXj9Hv35H8BsXH13uPQlXHWu?=
 =?us-ascii?Q?Bh/mxaFkfuKJ4EVNiKKuDi88KkcOZwmZ9ymHCtkvak6ZjgAWyaXwO4K6EOQ5?=
 =?us-ascii?Q?3uLzF5yYyawKmGlUYNuF+En9NtGFj1/X2dKp3SahF1Mgn/WHZvjyz3Fldmhx?=
 =?us-ascii?Q?SEQizYcvy5EVWSHE2fNMJOjzrZy2OSwYuDGfFt6BkpzOvPo9jjrS2MJElzVT?=
 =?us-ascii?Q?WwR6MU+JKzUniCkGVXVW6VcTqW95KodBHmpuX4bv7ATpRK3hePV17sI0IInW?=
 =?us-ascii?Q?qKjLI53utgYVgUtUWkcpC/bT9SGtqnFdYrsnJXDfZwpWdUJemUWGDRzMuDQB?=
 =?us-ascii?Q?+4W9ZQO52noJAjYTe8L/neS1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba86847d-4ef7-4432-1e45-08d918ff41cb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:44:45.0587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMgcuzRaeW6PFqwwk6gwuilo17itPsuDDvmVqhmygefp7/oIw1+p0DTrv2+kjQwNkADpOgJGe9nmuhIt6azcd8T+pdSchjdnRAzDBEKIUGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3382
Received-SPF: pass client-ip=40.107.3.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

Now, after huge update of block graph permission update algorithm, we
don't need this workaround with active state of the filter. Drop it and
use new smart bdrv_drop_filter() function.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-on-read.c | 33 +--------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 9cad9e1b8c..c428682272 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -29,7 +29,6 @@
 
 
 typedef struct BDRVStateCOR {
-    bool active;
     BlockDriverState *bottom_bs;
     bool chain_frozen;
 } BDRVStateCOR;
@@ -89,7 +88,6 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
          */
         bdrv_ref(bottom_bs);
     }
-    state->active = true;
     state->bottom_bs = bottom_bs;
 
     /*
@@ -112,17 +110,6 @@ static void cor_child_perm(BlockDriverState *bs, BdrvChild *c,
                            uint64_t perm, uint64_t shared,
                            uint64_t *nperm, uint64_t *nshared)
 {
-    BDRVStateCOR *s = bs->opaque;
-
-    if (!s->active) {
-        /*
-         * While the filter is being removed
-         */
-        *nperm = 0;
-        *nshared = BLK_PERM_ALL;
-        return;
-    }
-
     *nperm = perm & PERM_PASSTHROUGH;
     *nshared = (shared & PERM_PASSTHROUGH) | PERM_UNCHANGED;
 
@@ -280,32 +267,14 @@ static BlockDriver bdrv_copy_on_read = {
 
 void bdrv_cor_filter_drop(BlockDriverState *cor_filter_bs)
 {
-    BdrvChild *child;
-    BlockDriverState *bs;
     BDRVStateCOR *s = cor_filter_bs->opaque;
 
-    child = bdrv_filter_child(cor_filter_bs);
-    if (!child) {
-        return;
-    }
-    bs = child->bs;
-
-    /* Retain the BDS until we complete the graph change. */
-    bdrv_ref(bs);
-    /* Hold a guest back from writing while permissions are being reset. */
-    bdrv_drained_begin(bs);
-    /* Drop permissions before the graph change. */
-    s->active = false;
     /* unfreeze, as otherwise bdrv_replace_node() will fail */
     if (s->chain_frozen) {
         s->chain_frozen = false;
         bdrv_unfreeze_backing_chain(cor_filter_bs, s->bottom_bs);
     }
-    bdrv_child_refresh_perms(cor_filter_bs, child, &error_abort);
-    bdrv_replace_node(cor_filter_bs, bs, &error_abort);
-
-    bdrv_drained_end(bs);
-    bdrv_unref(bs);
+    bdrv_drop_filter(cor_filter_bs, &error_abort);
     bdrv_unref(cor_filter_bs);
 }
 
-- 
2.29.2


