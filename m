Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AB638192F
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 15:51:39 +0200 (CEST)
Received: from localhost ([::1]:42000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhuhe-0006NL-Hz
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 09:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhue3-00074B-U8; Sat, 15 May 2021 09:47:55 -0400
Received: from mail-eopbgr70118.outbound.protection.outlook.com
 ([40.107.7.118]:8323 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhue2-0003EQ-6U; Sat, 15 May 2021 09:47:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6QRb7ieNLKoGoLH/0YwWKdev1gwwxa4Ooryg76TgqDu2dF2KWfq7CMYMKU5jcy4Nx8Zjlps30WwXvhse095LJLxaMOmggGxJahaHkWB8tVNLuP3qqq1cOd8zgmmlcPkEVSY+kces4+MrxwtOcXL3YT7nHvVqc85VHcLCeYwe6WQFWirEQkWd0DBIBU9bl62OJj/4bHtPfnS+TCkUz1Xpk8+GLKsvjYOZM6SFB2M+YwaCGbdhIelTuTcn3v51VYwNWVmQM13BRIpU4aOJ1F9EFgmZwLtgEzMveO6VsykJpCLW3omlEkuoIAG1yELz0mGFbmMkrfi/RGinRi3atSZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcG9c5IS/Usq4cGyIv+4oggsJ9WQLJ/xlvCvmtQwTzs=;
 b=MnSU5ZO5PRbwQcUBitdNR+lXHSoMMAqvbDdpw+TxE+XbjXbpq/LwhMEaEV+vMwGT2VJJELivFa707PHJz5fKMGZ76AU7n//Dq5iToFfjannzZsVG3KRpzllmNZJuyTbKLe62Ojub8LvfXasevKheE6Ys3kLdgixUSdJKJSdMCAFpUqLGOgEmxkMT2hFtylmsTMwO69rwcpDjcaJz1UQlad1Ng+zTZ29BkUrMBr3QEBvmoaequilUMVr0JLVEM/fvKXdUeDvuYxPqzQHYUlmaI5nBDrSFTaTEKpYPbIwOGZBJxmajvWYZPr3yEo3LcbZLSv61p9dVXjevCF+O3TtLXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcG9c5IS/Usq4cGyIv+4oggsJ9WQLJ/xlvCvmtQwTzs=;
 b=iNLiJyHZzHq0hSyMKFNdL5J+F6y887DqmDxK2t/rkgO+J7Y12ju2LukJU8/rqjG9Q4H4eXJXbBEXGNe7DFJoYZxWEW5rYq1WyitfySMJug+3vSFwtF1SwqQ6ri387aj137eMJVGFZnm9gHOkRPZQIZjSji9h3zg0L+MVnjTTLQo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5206.eurprd08.prod.outlook.com (2603:10a6:20b:e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Sat, 15 May
 2021 13:47:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.029; Sat, 15 May 2021
 13:47:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v5 7/9] block: BDRVReopenState: drop replace_backing_bs field
Date: Sat, 15 May 2021 16:47:03 +0300
Message-Id: <20210515134705.433604-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210515134705.433604-1-vsementsov@virtuozzo.com>
References: <20210515134705.433604-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.249]
X-ClientProxiedBy: HE1PR0101CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR0101CA0003.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Sat, 15 May 2021 13:47:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f46c4f6-f71f-40e4-1b3a-08d917a7fbdd
X-MS-TrafficTypeDiagnostic: AM6PR08MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB52065A48699F3AE8F27A137FC12F9@AM6PR08MB5206.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hSQvbUd8LMv6DZIFRMKTj2/n6vXXciUhSMjlksOHIXgof49cXdpUAYEdrAGNtI512NwL6yIxAkZqsOWDxR9FJ1beoqjH49L5kTl/hAsT7k8bHcF8Ge4k03dAyRXiUKrizWWFOEwCHsXx0c4Y5uBSjU3280Vr7tN3Oj2qHJtVKj8gsKWY23Dmpim6ykzmmQqf0e5KcVxHeVizqS0kHNRvwscUxEqS8TtNd1cJonchT4CyfKyW24e15lXb29UAcgJcQE41jO6BnNwXJ+0NIKAczCQa88YqWHek1VPq1kXu3gAjo6qf1ess+iwVsxk/NQGUsniVRRx6Si+YG/CqhRzmTd7/8OCGmDJ/ECFNPqLKR4ZfvH/+e6cCZ3nahXH68Jm5mLtes9Mn1FH+JnoIRfOl/efxl4hUh41OGC/5YfgV30vJuZWlhQ058oAKa/kJ31WoXFYdI65LLw1Rmp9GzVhftXlOzyP+qE58O+07gQx70as2tUOjYGg+XM6BpAyuQCKZ/3qMJogn1Tb5u921mY8oe6B/NtnnQy7wQi7PCBwTMb8vXqdffJ1azhniJtxZqaI0Vw60Mvjvzc/PkkMBKIZkm9BpOsZdZcKHRGoKmcsV2KM/iB/o+YOu6BAaG7F/tOFuPfCdVBOiAfb7+87vfc+sKeyvhURbOJL9kX10TWdMMOQqQ6cYZOranPR4q+KqwJ8T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(396003)(136003)(376002)(366004)(6666004)(316002)(6512007)(26005)(66476007)(66556008)(66946007)(6916009)(2906002)(38100700002)(186003)(16526019)(478600001)(107886003)(38350700002)(956004)(52116002)(36756003)(83380400001)(2616005)(86362001)(8936002)(6506007)(1076003)(8676002)(6486002)(4326008)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UlhFbRQaE3SqXw774rQVQDSYpBCnWhQfecQefPCjc92MIyf0jDj0eOBcfan/?=
 =?us-ascii?Q?JdqJMYNv6/SSpcBMPQ11XHBvinycT58YaRoikAD6n5uh8sxv3VdlQ2DoFf9J?=
 =?us-ascii?Q?GIYsfFfz4EuRVWbVgy0j5gGVgnwU1xy9ADDkyuB8UtOWbxAlumQLBZoMjrRN?=
 =?us-ascii?Q?kGg4+qGA/3Jhz28a4y4F5Mm9jG4G/D7fecIaSoAa1AwXAvOvyLQLTCFsAwbX?=
 =?us-ascii?Q?+B7bOt7DmRO3qbc8Vj2HSYtCIZ0DTO0/0Q8z+fbiCrW4Lvnf9OZGNWC3gXHe?=
 =?us-ascii?Q?DI5sNz5bRapXc5tl62A2Z63RtXyANzd8GlSzkdP9YOE2ctHzYeGlUSuds9AD?=
 =?us-ascii?Q?H/i06U2dwDdVqI4uW8Q82wfv7xTxlzwQuINzgHYuOzGsWyNqpe/OGjlgLvgn?=
 =?us-ascii?Q?X8FeLH5cejBobGk4RBG0pPHdOD2VLgsBXZk7UzLwsF9/qsP13r3kxa0TQT4L?=
 =?us-ascii?Q?YYww8Om2k/hci9MeU0wM6KjV+h3dISBFHpYjBUuRoScjV3u/PiqHzGqmFJzj?=
 =?us-ascii?Q?s7NA92PdT2Ujdn3xLy33n6ZrwDxeR7ynKw+l9V9XXDs0vlH6dJIE5wYqOXVC?=
 =?us-ascii?Q?FBK4WBq13hIyBuqIN92sir8LTNPVPUhO1DeBagxMTLDVNR7VIa7UaRY5FdjO?=
 =?us-ascii?Q?bXdbcV1gRDhx6oDc7HiBnMFhsHwJn8RyW/LpCTbdoivIqIivYQF28Yvn7JOE?=
 =?us-ascii?Q?UX5nYjzz4eN6IH80WpHaK0Xri2DGwPsH0h21cdqYDoxEAJ3oPp4Rh/p/1Jfx?=
 =?us-ascii?Q?4yvD7btiiub0XQB2IzCTyMBCk/GUcvGG8+6tuoDji9nGEtflDE3/n63o1HRg?=
 =?us-ascii?Q?bbT62Dke8Edaqh4QFkdtraMG7egWw8iISDjv8dJ6chm4FSpE7z2pKTtqmXBW?=
 =?us-ascii?Q?o9r3VzaUoHb/LJBhNGU8PSVefe6RZ9FV9T/Nxstb5UVNO4ghk0idVXvyv+BS?=
 =?us-ascii?Q?fDkwAHKLpKMm37lVcCQ89R0V3CwCO67wKbWmJpZ3+SwtaXc4xt/sbEJh1Fnq?=
 =?us-ascii?Q?A5wTswE9b1taBi5K+/4m/HhHAbgEWa8Sgvl026JyxyF2V+Kq/sKUpT2uDcxL?=
 =?us-ascii?Q?UL3v6dsnosIOyAHA0etQ4F1NU30OZkzgu9iCR7DgnySCusAF3Gek+2YShoho?=
 =?us-ascii?Q?eAJvrpUDkYsAyRA+x314CkJwP96/nLj103vmYNgbgdBylW5VFDZGp3LzK976?=
 =?us-ascii?Q?bUrAG48WTvAMGDFPwu0rC33W7/wmOPxIV9FEeNbJX1+ULPnYwxnIYeusd1B3?=
 =?us-ascii?Q?TOkRUWqcvXhIWxzNBVGFeNcFf2RyKDrYh6SCWxdWTZoHWAsMJsjiUH4az1I0?=
 =?us-ascii?Q?W7FD0O9IjIY+ZGPydRa6OZry?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f46c4f6-f71f-40e4-1b3a-08d917a7fbdd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2021 13:47:30.3678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0oE6j2nMDdDFJIwXeRKxqgVeBYuVwe/ByfuMM4oJU0pYlYDE2e31OSZFg8kcq1ZLOctoHGBstOfjla/T9P0aw7/iRnKkaey51ta/5hRT8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5206
Received-SPF: pass client-ip=40.107.7.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
index 82185965ff..0796f75b49 100644
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
index d90b35f8f1..819e133dfa 100644
--- a/block.c
+++ b/block.c
@@ -4271,7 +4271,6 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
         return -EINVAL;
     }
 
-    reopen_state->replace_backing_bs = true;
     reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
     return bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran, errp);
 }
@@ -4526,17 +4525,16 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
     bs->read_only = !(reopen_state->flags & BDRV_O_RDWR);
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


