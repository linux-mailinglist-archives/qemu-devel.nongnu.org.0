Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B453A2B2F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:13:23 +0200 (CEST)
Received: from localhost ([::1]:37068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJYo-0001RP-F7
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRx-0002Dy-0g; Thu, 10 Jun 2021 08:06:17 -0400
Received: from mail-eopbgr80090.outbound.protection.outlook.com
 ([40.107.8.90]:15424 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRv-0004Nw-AU; Thu, 10 Jun 2021 08:06:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRl7y1j44M/nhTr1QaVJrNustxTJBlSkjJH3QUQFeiOJzPsOg1PiFvQ0h7FohSRXoIgGISoPg1vhynRRjWM0hS6GUWsn7hWShpvjaiFDAqNpACAJTqEZiQG1Gvq60rrAYFOtPe8A2iPSweEQinpMw3tlSqQYN02+Os92JFuiLeK6ugesEswL/wFGViKR0wsF+LpIM0DOCigaGpHZndOeZ7yQtA/WJlqBMWLnlOTrDxIqEVeWP/7ukEEdwMBumQyek/0ay1Mm3eoVRFtpSRKv2I9+/uI8w2WaqJ1onacHOVUC3q5+QZ2/5Vps6Pdc0iH+kU7AGRf6MIoFR3PBO32GjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7JfD+Iv1a1uMrRzPGe28zUw4jVfNKDQhLGkEcmRh3A=;
 b=By0B3bJ+huIsGdhleOnGw1pLvf2gDRIYYv48073AmrxoL6JORKNiAEehOMYRtthPse5I0YIJlcXjBE9Pe7+l/31/EC2zEmTwrHvWRPnmKj2c3+2m4lXOMF8B+Hnfo0Pwwcuhb6x+MNTE5M+U0iiGcMgLJ8s7yyo7x84IZDlVTmBjR7fKLbt/xBJH256ZJlN4pIJf6Nz5OmOYcEdvLMcKUpA4ZeZ/PfAIr6ks05O/61Su1MopgCjQMStlTEfOQipdoCFzdmnZRParVXHOhme0fZAgbyIAA6cHbva3sT0UH+k28H/F8aetgcHqks7o3q+Nbl2Fqt20GQjqBhWKBpJO0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7JfD+Iv1a1uMrRzPGe28zUw4jVfNKDQhLGkEcmRh3A=;
 b=HGwfqe0Eah5akcU8nQ3rVgbr6sk3ctEyOGV2LNjhV1SzcFvStIPL0uZI75M6fR6NT8GhC2h31ZaSE1778gpfx+xWhJwl8nNN+iMsa2zPM+/54DRgbkw8EuW16cXMKU815LA5LihlS3oD8QO8IRu8394bjXGjJGXK0w203kBNPtA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4277.eurprd08.prod.outlook.com (2603:10a6:20b:bd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Thu, 10 Jun
 2021 12:06:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 12:06:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v6 7/9] block: BDRVReopenState: drop replace_backing_bs field
Date: Thu, 10 Jun 2021 15:05:35 +0300
Message-Id: <20210610120537.196183-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610120537.196183-1-vsementsov@virtuozzo.com>
References: <20210610120537.196183-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0802CA0005.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0802CA0005.eurprd08.prod.outlook.com (2603:10a6:3:bd::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 12:05:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68559fe4-bf0e-4bc1-4ed7-08d92c081c5f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB427795DC48ECAC83BE854515C1359@AM6PR08MB4277.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iz4KG2eVBsUjSilCrHHZk2ES8P5+y7XraT24tH3CDtwAiu0HWqckSlM16Wkaky/7g4Pviqnxg1wCKXPC4Ek0hoIayCVxJc3Kjo6kCnvIgZ5Odn/xoNMk3DjLplFAy3QpA079jO1jv48GLgO7GtJzsMnmSmdC1Rtt/ayIllo3jSOxHXGYKDJd+FvF+8jSMrLtOc9G2+ARiM44WuE5cuMiatIySLRrG2HXXupjBx8/rZ6AY1VKsCpsCcBeHTd791PDC/DraqaGTYZAHUJubLWyJ2iLAqkEzXDNqXnIWyl2LnDvwxpHRrtvX/U/R7aEtpLdfCQ3PKqlG9JGP2ir7WNR3e1DiqyCLtNL5pVsUS75igLfm9W1oEN4LmxfroP13jPFoHiMrS/sXCSn3zzcCzIu5/dbssIVG6F3b/aCD6W5oEEBA6p2Y27CXbp2mHBMzuChE+awYc2+ux1z1VkUEvzYzIM4UgmC416ILDeyvafFmwvqWrRAMySr+vnB7V6bOLcC+TlPkbipEheDQzjr/Tvh0B5X8BS0SzSFPnv36a8V9cNsmR8jr7l7L8sLRpxDVvu8LZEKAeAHVG8rD5EFrxkqHCJNzLDhI4uQVYHK5y8/GZ8Oug7RdzmtndfuWJY3RASwQthYwRQBtPK2Orr5HMao5tP0VNpGDU3GcZ5Noeby9NL6M94HPkLLNwjSQlS5JrWL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(396003)(136003)(956004)(6486002)(2616005)(6916009)(6666004)(186003)(478600001)(2906002)(5660300002)(38100700002)(36756003)(107886003)(8936002)(26005)(16526019)(6512007)(38350700002)(86362001)(1076003)(6506007)(66556008)(66476007)(66946007)(316002)(8676002)(52116002)(4326008)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ohUhLyQ4lE+Wbn7gUR3J/1urSjInZy1I7km+wmeznqlOT2tnHruUMSqbG9R3?=
 =?us-ascii?Q?/wiwSrqqMDheREHEHrO49Wh0aTgJkoJbsv+7zG+6IW2pkS8Pjye5axB1pVWE?=
 =?us-ascii?Q?GVCQZaPLm/4WgChh+Q8xHzyOKq+yv+a281ltHldvbODflFg+MB/H5BPJ4U9A?=
 =?us-ascii?Q?lIH3eS8j39V9+yRZOKH/iSwsLbwTqMdlkw056kvJzcWWI5+BwU81b3pryzWB?=
 =?us-ascii?Q?+4m9chMhwkyYSS+jQn6A4UxEcyYZZiIlB+3svl9lO8JbBr1g1fCmp+7YCuwT?=
 =?us-ascii?Q?CgBZdcivN5DCnRubCWDg5ZLVoaE6sEplZifhQs7PD7vBd46qi77Oedy0a/x+?=
 =?us-ascii?Q?jV0io3eL8PkRfpd/CIlHzAeoxuOtVlwabUgCUXZyAmyqaxhemMwdBClIBXCd?=
 =?us-ascii?Q?qnYCTR5SZXJoacGy1+ARykyBRn2K7IvkbM6T0MPbezj31l5fYG+PGzM9zEFN?=
 =?us-ascii?Q?FGC4P1TBnk9gg8c6w8RG7dj9sEhPVLnavV0dQlToR64Vb638UgDLfTSc0zj6?=
 =?us-ascii?Q?8Kah5LK1WVU97zyuuqKb/je+gwLX/5DT32Dr9/FSW1XCx+Rvo2UHmJ9fIytq?=
 =?us-ascii?Q?ygNRirsuZXppv+Jqat/ldfr8j/3SbpUENHBY/n3i1EX2MyupeQobmgLa+YLn?=
 =?us-ascii?Q?AkBsWR3gv+yu6qudkDmI46NHyJcQIi61Aepn6NkhiqH2FvD3NrCFBmAqB30e?=
 =?us-ascii?Q?uaBwo+yzKqh5bWJ2Nf+2b1sQ9+od96hnJwz9AybkaHG1E8xLLkEJGEj8+l/I?=
 =?us-ascii?Q?kAf1csm+2Mtia2etOWKT0+J22O8w5twJPKi34RJeQvjQBPIgs2w4teohySHm?=
 =?us-ascii?Q?HGuOhR9NGCjwYF8d8dYwAzu44zx9+0Mic/6P1fihpJjdEtenK617V5liminL?=
 =?us-ascii?Q?1fK40sXzBCbEKV8ZKBaLO1s2UUNoDO2sG/bZPaL9H4MyH/F6IHsycHe4oZXn?=
 =?us-ascii?Q?L4FXFDUGumxDxXvMmND27XDbMHQaX/YG6i7wLyp1nUvlkBMNE7gtGY7cfoUU?=
 =?us-ascii?Q?3M2zF76NeAuIk1CSmV+kw5qfRe43Uuc9XE3a+oEDDX7aXkGHH4Q+dFh4QHfZ?=
 =?us-ascii?Q?OmZBCuCiHAA1EBXOqCCwwCcZ4mN6uUDVaDh4q3XMWzY3XWYvFdTD94zzGFu1?=
 =?us-ascii?Q?HisROIqOoZeazfDp9KcHouefLMDb5uCkyZI6OgvhMKOc3rLtDHsKMNdaPxCf?=
 =?us-ascii?Q?vJ5pXd/FwdM0QLpo554n29AlntQ0AKLv4o0z6czrkq6JU+52FWvmlIRWz4F4?=
 =?us-ascii?Q?gryXXgJl87PxINhhhUkREBTT9fc0ZANF9BswSaugfeK+QnP8DsddV1V2vwZp?=
 =?us-ascii?Q?1xjCewp2745i+uXVVIrO3iia?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68559fe4-bf0e-4bc1-4ed7-08d92c081c5f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:05:59.8338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I13pKGUQ9fUPodcarv0SvE0fOpSFWGn7wS1MNbqd8qQTz2bFaytWgnV1uMyJchto3dOTnLgm5EQW+iA3Km23uNZsuThwmkGy/X0hbeoqLTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4277
Received-SPF: pass client-ip=40.107.8.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

It's used only in bdrv_reopen_commit(). "backing" is covered by the
loop through all children except for case when we removed backing child
during reopen.

Make it more obvious and drop extra boolean field: qdict_del will not
fail if there is no such entry.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |  1 -
 block.c               | 10 ++++------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 8e707a83b7..d28022e761 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -208,7 +208,6 @@ typedef struct BDRVReopenState {
     int flags;
     BlockdevDetectZeroesOptions detect_zeroes;
     bool backing_missing;
-    bool replace_backing_bs;  /* new_backing_bs is ignored if this is false */
     BlockDriverState *old_backing_bs; /* keep pointer for permissions update */
     QDict *options;
     QDict *explicit_options;
diff --git a/block.c b/block.c
index f835b576a9..eb98aced9d 100644
--- a/block.c
+++ b/block.c
@@ -4296,7 +4296,6 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
         return -EINVAL;
     }
 
-    reopen_state->replace_backing_bs = true;
     reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
     return bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran, errp);
 }
@@ -4550,17 +4549,16 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
     bs->open_flags         = reopen_state->flags;
     bs->detect_zeroes      = reopen_state->detect_zeroes;
 
-    if (reopen_state->replace_backing_bs) {
-        qdict_del(bs->explicit_options, "backing");
-        qdict_del(bs->options, "backing");
-    }
-
     /* Remove child references from bs->options and bs->explicit_options.
      * Child options were already removed in bdrv_reopen_queue_child() */
     QLIST_FOREACH(child, &bs->children, next) {
         qdict_del(bs->explicit_options, child->name);
         qdict_del(bs->options, child->name);
     }
+    /* backing is probably removed, so it's not handled by previous loop */
+    qdict_del(bs->explicit_options, "backing");
+    qdict_del(bs->options, "backing");
+
     bdrv_refresh_limits(bs, NULL, NULL);
 }
 
-- 
2.29.2


