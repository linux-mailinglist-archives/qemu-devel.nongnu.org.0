Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AF539787E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 18:54:37 +0200 (CEST)
Received: from localhost ([::1]:60252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7f1-00025X-Vo
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 12:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bY-0001Vy-U6; Tue, 01 Jun 2021 12:51:00 -0400
Received: from mail-eopbgr50117.outbound.protection.outlook.com
 ([40.107.5.117]:4526 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bT-0001yq-Om; Tue, 01 Jun 2021 12:50:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggtbzzJfflItahyI88HvJp4xvzsXwtS9Si57m1DRw733Ol/8zOIn530q7RrgtBEZG/Rsg4VzhtQE6Zc0S4P4DYJpR61Or82YUFjR77AUgthi7JWQzWV9amWRUr99baFgK/OoP7A3AzmCx0+hFadfLh95mnYiyNqd83cBKUHTzpyQU3JOSCxSiPMEja21TMFfeHdSxQlFBrhhp47affqDh/OAFQyi8hYb9yZC9ydmLSx2IgguMfhw8uf4JrUoecSvXPVppSNZ2FGc1y4hBASV3Q/UXJuVFcRhh4bG7Nh7TQ8nAanyO4wUdwBkvBEj2B2pb9HZrKz/9TbzqvzBQ1iGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKxLbugDJubPAY9fuZ2oBIFlTyHg291fyQkudaRuuvE=;
 b=O3+S0clJqhSC5fyqeThYi4Pb5MQ2pCcQ7Vj3RdAzi/jIHCH12Oqwv83avDq/8Nv4QPYw3G+rUuRJhDnC8BPMYfz50EpRUW25j2cR/Kl64QGu/TUgaAj5/3zDH6q0n+PWbYbgSBnT7ooOEdkIBmsNWqXdMYMKWdjbteXir1XKs5ERc4+OnTS2GGTkU0+CSuxcKTEkaiq76gb79SntNGw+MPCUfI80rlzTAk33zSwc46hFzgW5zBaCvY1EHzynpuEeoUOnPDU4Enxjqyr2IldRaBUyX3qZulVVzVYsU9b/HRhxrlbr9sgFNfg7BIFdEebYFBOBaFuRMuaDZEIlYB328g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKxLbugDJubPAY9fuZ2oBIFlTyHg291fyQkudaRuuvE=;
 b=VyGjB78aI19LEmliogi9RkmCSphzjuI0tXY0kTINLKEWjxdMEIweLOPbhU221NgJgNlswi9AaAjv1Ln0psPlCEMwGqOgKopeCbXOTOros5azBRmsCZ0CBpHRjXG1vqQ5kkW652YIzJyPtecJ8RHb2wBY/an+OSSw6/r6aW85VBM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4471.eurprd08.prod.outlook.com (2603:10a6:20b:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Tue, 1 Jun
 2021 16:50:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:50:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 02/35] block: comment graph-modifying function not updating
 permissions
Date: Tue,  1 Jun 2021 19:49:53 +0300
Message-Id: <20210601165026.326877-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:50:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 754d7ace-ab97-4ff9-025e-08d9251d669d
X-MS-TrafficTypeDiagnostic: AM6PR08MB4471:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44719999ECC66803BA1D8126C13E9@AM6PR08MB4471.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c6EwTh5gXEq+tg4Obs+R03MG/TupIRrLAaCf7aV5GNtNU/zibK3UlQSMQ7D+ZPlltQqKs08SMTDIDV34wxQ1uXaYTvbZ0Lfhsian2GRmNUwMDYRk6gc7I2+/xjl8uSIQX31GWkZbN9mPubUCdfC2rvRQpRgeQqluWej+e6EUDP6CllSfqBTBk8wZGDAMm+rZmgqt1g7WiEVpu/BbQkb+36i7f/gln50K+KiV+hLXJlbRLMWa9quqKIrx44pFsZE20lQjVVsL6ugIGGLSEdnkNtxOjP2YBoaZfRc7bYHRBdQtY2o8dNOUXxCe2/fQ8P9OjHlogedHTsPChRKheCpFfTkHg8K+Oi9ZdKf8FOwA6IHxDtyKFzp9PZKJWrfdYLps9Fv8t9a9MTncKdv+Uv5BqZXUwTJP6idAJ4p9b8j0GBsRkCathE0MhhSzeJaf3t9xsQ14lYo0ojt0LtPHXVdf0hP6Bo1Iqge72hULaZP1xF0rv2MAblTzBbgIiqIcdbf4Bt7aJk5tEUO4kkYYOv+iVMbFfp9arTdqGGjrAq+36tsdthVLg6KDchL2Wi0k0aRa+uphENP8rlhpMk3Hyf605SuM7IzpQl8yecCaLAd6QnLhwTA8xd8gaTfdAfgC+jbSA4/IrUkE/yD8xqaxZdgNzHL9OFTcDME9llk3r3ufavkabL89qmS7CX7816BQUOZa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(83380400001)(186003)(6916009)(16526019)(4326008)(26005)(8676002)(2906002)(8936002)(7416002)(38350700002)(38100700002)(478600001)(36756003)(6486002)(316002)(5660300002)(6666004)(6512007)(52116002)(66946007)(6506007)(2616005)(956004)(66556008)(86362001)(1076003)(66476007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0+MAOaTeEzUjMBPOpPy3sbENfN3WZqDZrj06esIeO5EOy5LT2aTiO/rS6jxL?=
 =?us-ascii?Q?4/vIg60auy0jwohju/eJ3+f4NFnMO03DutgUOIcQ0hCnZisYFYn1RrUMdErm?=
 =?us-ascii?Q?wH4W6NSyoRHnSCOjlYaay+wLxVA1dsBrGWblo+3q7v226zoOSsy1rnqMDOKT?=
 =?us-ascii?Q?OG0otkvfEhHhyyai/IksSHvfN3p8MSY9BTnUkMnewWVXFO/n54PlRdptYs2e?=
 =?us-ascii?Q?b3dlSE+OOt+0IX3TyAiRTMkqh+YVgvomW3FWRI6zH64WbrliyLTPZPJASHcN?=
 =?us-ascii?Q?vAw/lm8ocj1oabSqjVFcUjfkl70Kvwwq/TNkj2Vx1r8DyyPm4FEiG4cu+PXv?=
 =?us-ascii?Q?EreglpohyUJGbbSeCNMMvEKThDZ9i4tjkq65qh81dkuJLhrOxxqGhcPfcO0x?=
 =?us-ascii?Q?I6EPkGR660rU6ZH1LbTrgolAx6kmPCZnPid3NZe2k3UF+NFWg/BGNYqX14e7?=
 =?us-ascii?Q?h4WhEaO8l+nRJTDoajBakairckNIkbGQ/pw3FT3fMkmkFyCA2ZMhKanuHagb?=
 =?us-ascii?Q?BUtZ+7h8tOsMWN4vFmh6jx1ogq1qCfiqcQXpKv8m1ne9LSSlsL28I66JXwap?=
 =?us-ascii?Q?Mvt0mjQM6t1GnuVpWkfN791TdIGljJjEEaH0gLk5KVuYiTvywHtCnT6cH1wi?=
 =?us-ascii?Q?AjZxoX+mzBGFXwApOhU9kgycOarnhnKSnIyf6Ayk548kjnhhM4VrRNH9PtKY?=
 =?us-ascii?Q?Sjzd7CnMBjRP5C4q6ypymL8iiXNbas4fh0U2EElRplqDr4Ygyw9N1pnc4XVg?=
 =?us-ascii?Q?QzyRH9J+/JvQd4KCn4c1+PCFvJjay85eA+77odOmisbMBx8nLhpg4sRrdzlm?=
 =?us-ascii?Q?Wt2yu0ZSsFxqrAw9OT8/9JnXIvQTC9xpJvgUVFsg2KH/Gvpr7vVprMDp9QVD?=
 =?us-ascii?Q?CdTYO5Y1IEZgmAdFKgIHEYPGFvF0pvM9coVKwO6iax0SY9UzQv/c2MDsvyEP?=
 =?us-ascii?Q?+RBiMBpbohsTFj35Sd3EIOLxjBHRVKLVeWlqxAQT1rbqZqOHg5+lzmXa/hC7?=
 =?us-ascii?Q?DG7bIwy+ebqlUmEILcS6lyBnhD5mglcgoMY9VLNeQxqbygI3HKyh5+MEPame?=
 =?us-ascii?Q?H2gzIsVKhmq4CvfymDksb8QreQpf01v5ad7W1xGf7pC6D7boZG02ulmi3nSg?=
 =?us-ascii?Q?jcy+KMnNxNzUvdxRut9BvDjhYKly6JKCAAMnkpjNnR5CwELosuabAGuDKguY?=
 =?us-ascii?Q?3XK/jFMePqWw+RDccuo/J+zK6GeSZqelABpJaGEc37eh0ve8SxCUPkv8s5oc?=
 =?us-ascii?Q?5BQw1pXJjYa/o7qXNfesJTB/+pvAW7M8CtEAdsUzaVJ1AUVJ39G1+3snmGTm?=
 =?us-ascii?Q?attTb0cqlXvju4OaaeIxlcM2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754d7ace-ab97-4ff9-025e-08d9251d669d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:50:45.6596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mFImOeADE27frwmO+nNhMScytd2E5xnfZiO/VD7EBSrouqhnVB10hBYvpiqJD+PbONmL5cIIZSzo7cKAGNxErpwzGAiQFV5Z6uj1hDR4CQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4471
Received-SPF: pass client-ip=40.107.5.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/block.c b/block.c
index 3033c90666..025df4f02d 100644
--- a/block.c
+++ b/block.c
@@ -2762,6 +2762,8 @@ static TransactionActionDrv bdrv_attach_child_common_drv = {
 
 /*
  * Common part of attaching bdrv child to bs or to blk or to job
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static int bdrv_attach_child_common(BlockDriverState *child_bs,
                                     const char *child_name,
@@ -2836,6 +2838,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     return 0;
 }
 
+/* Function doesn't update permissions, caller is responsible for this. */
 static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
                                     BlockDriverState *child_bs,
                                     const char *child_name,
@@ -3098,6 +3101,8 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
 /*
  * Sets the bs->backing link of a BDS. A new reference is created; callers
  * which don't need their own reference any more must call bdrv_unref().
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static int bdrv_set_backing_noperm(BlockDriverState *bs,
                                    BlockDriverState *backing_hd,
@@ -4776,6 +4781,8 @@ static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
  * A function to remove backing-chain child of @bs if exists: cow child for
  * format nodes (always .backing) and filter child for filters (may be .file or
  * .backing)
+ *
+ * Function doesn't update permissions, caller is responsible for this.
  */
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran)
-- 
2.29.2


