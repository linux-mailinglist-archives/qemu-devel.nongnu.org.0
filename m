Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68603824E1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:58:23 +0200 (CEST)
Received: from localhost ([::1]:32906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXCo-0007ZP-Ez
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX05-0003jQ-U9; Mon, 17 May 2021 02:45:14 -0400
Received: from mail-eopbgr30130.outbound.protection.outlook.com
 ([40.107.3.130]:60322 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liWzu-0001jR-L5; Mon, 17 May 2021 02:45:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGLHoRNzBO0U2qLG84fCMEICa7NSUlL84E/+Kdb1wKaY8SMNMtbfN5aiuQFZO+bZ18g06nb917qj71Pk4M7piSs4aHbkrzM6tazX/qY9VfdtcpiZFmkbOUkPuUO4CwdIQA03cB9579WaoRhcsVwnqk+06KSmAo+Zs+xlo8yKM1lYUxaIDY3yO9jsOQeUMw+ZZ55rVVsJnZMQx31gH8srnwycxygKw4A4cu2Ltoi8XdVpUsHI9JnTRZnpQtdb4fbsTcPh+jTCvcEc5xMGuChC5cO9SPGFf7fVp9VnV5QnuOuuJOgL6+Td/q+HHykgT4QU6cBSPykQ5NyJjz8c3GTDqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJFHJ2LoQ9J+j9cZGvpG4uMgiGxrP2lLDYlBOru754E=;
 b=Pi5lA4UXSH2KJc4VNUJACXad6FP6YOSZU/ZKJMNyfPElJF9n2lpJ63ml0wsJ8aoGuGXK2s9uKMvt+WUidrec1qtwqc4qrvArW3AA08JsX50LFnZHhX3uXzsvanEhNyXdkb7nrIa79Wca1sv4AabNgu/8o37zvTKDRXEgWvcmtGTWNpuR9AiAfT93nZkdLrtf2Xf+HpPKxwRRGjmTmRVdGPVrqGsL4bFOYm6dSTdQsKIvjTXdYGr4qMFxBCy7aDRAPaFlqC2ZL3pDgjUhHwp1ZPNKX3oAe4CeHiii1xM7woJyOVvcjnsSV/elOpVaXhCvj8DR6RhNgF5i+vD/8PJaqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJFHJ2LoQ9J+j9cZGvpG4uMgiGxrP2lLDYlBOru754E=;
 b=dLt3BHMAl/pzRd0LoTTLdj08eh758LUGJIPKde5Prn5BWKrFPNSBT5yr30ZpX+ozXq0+SE/QisA/qI0vG7EHhJZMHO3QNibC5Sr70WRlnRB2kUqtXaUPSH379A+K7lRKz3SbBzAEnPyKyHJZL8vcBa+bRNX6sytZO7iE+mD8ZWI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 06:44:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:44:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 06/21] block/backup: drop support for copy_range
Date: Mon, 17 May 2021 09:44:13 +0300
Message-Id: <20210517064428.16223-8-vsementsov@virtuozzo.com>
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
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:44:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a62eb10c-0ad0-4423-4a22-08d918ff46b2
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3382CBD422C439FAD1E9980AC12D9@AM6PR08MB3382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZgqL1rX7tByAXtJgxJKVe5n/vVfE3Zz4noVbSvdtMA+gZA2Dj8fHbv6OLR6e2CXEpoclC4eoEdt21zTpvtHYRY8w6L8x3xyRzd+a7xnfQ2lrB4Pbv2LeYiUvMV/hpZNckeIwEK5HwVI/vJlmg7VbL3iQNPqtOIwM5t58ozdsKi4fylo/+H/Nude52AeOyvo/2PRM+9tojcslCW/UxVK9Mylb9GKlclH3pM3kibs7scFC65Lfp0imzy5zLqYS7DnL8hj2fgH0H+R4JAtCU3Z81uhTWHtkPBu3uqIT6xnwBWcEUjQepaOAvIZ2yBAxL7mwi+RKSc4qDiIsVuvmiAEl0IqO2RCs+8WPiPEajhLdL6X7Ku4NPE4ttf63RN0gM4sTXTyjACSuIBbHOuuGK7xihTSI21Kk8BsD99B6UOtPUnlE1UYolWeePFzRV0xzk19prAvkieuZ6VquIW7CQX9BVoobV1RtPS5c3CKk5U9RW8VQ/6Pb/Scf6jJ8LrlitooyLm6+DS88DaR6+Drno1sQQrM+6cAbJV6XKPHTBoqx6yPK/Td8A+KkBtLtbY83sreoiVnNMHRRiM79eUMDga5D60XN9wohDNRqg8dm8qb3pR1IueDyUZFzY54iQU/tpY6IHv/ilf+efsu97ZvS/N8swSN1B79EhfV0aBRas6UTAd2VHwAZA4WILVQv00oBlvjm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39840400004)(6486002)(26005)(2906002)(316002)(36756003)(66946007)(1076003)(107886003)(5660300002)(16526019)(186003)(478600001)(38350700002)(38100700002)(8676002)(6666004)(86362001)(2616005)(66556008)(52116002)(8936002)(66476007)(83380400001)(6916009)(6506007)(6512007)(956004)(7416002)(4326008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ruiMrYoENrBcSOGp2HcJIXZJjJEFKAIomvp9j7pdds8fJAbUV92uwP3Dg7I/?=
 =?us-ascii?Q?WMPY0XmgkG2Aoo++3PCobBhdpslc080a3IWkQ4tlG41bEBg+WF8i2knMgYG5?=
 =?us-ascii?Q?wUVOjS5v2532VrDesvmJhW9zau5fs54l5pGpQB4pXWPH1Np9WP5xVNj0Eevp?=
 =?us-ascii?Q?KASgB5RggYMkJ6j0AlSUwM7LhfwEwGv9/Lb5Cv2yIjNJe9VGJHENkn8aAtST?=
 =?us-ascii?Q?VkP2q5G3y5UJ+boxbi1i+WWeCyYsOkrg1IZ+m4uio4ppI4mYACIJQdxOoJK0?=
 =?us-ascii?Q?62V0Jp01/jt82ayHD4TUtvv0l6W6l82OAJxHcreUVddbdunpa+8Mmsb5cxfC?=
 =?us-ascii?Q?TwRAVeKiPtaMTGiM1QM9NzHBnFK4Ap5AzLkXhqOm+fSuE9gxtsW9qXVE+X2R?=
 =?us-ascii?Q?ivdSp89aJbyc/+Kk7Q08dz3N1l0HV6Cs8hNg2410rzIW+4vD7yH3zknjrJnI?=
 =?us-ascii?Q?IBK3E0usYj34OlV+OpIWeekmVg0MDWdOtk69Ir99M7nLJBp27o+tYStwTjY4?=
 =?us-ascii?Q?A+5GsJ+plSRCZ9BItH2b9FJz73oUxehOVzww1X1dHQytp21q0A4WUzap4VWN?=
 =?us-ascii?Q?1D1Sb5uO1vcC5eRi7av/oEV0PQ8DseWhYLFFi0SkRgFw69NSaGl1Xm/wwtQd?=
 =?us-ascii?Q?I1DplIoceK7B5zi7LMtW9GCGeuN9S0OsyE3DUfabcHooDKcF/kb8P/nK+208?=
 =?us-ascii?Q?y1y1CPDYzLXasEIJHMsodDt9oAZ9QzgS3B8Xv9ajeuNEIaKK60MjvJPiAGtg?=
 =?us-ascii?Q?Mz+JyNjGMI1ArH/8pY3LwDpKimbTFxiU2ft4xP7fpAxPhYFcek5YZHXAmVng?=
 =?us-ascii?Q?ggHDQlOuQt4GMQNm2dKcklTipAgNSEJkjUrGM/021dP9v5fUOrJ2Gbqa6Xx4?=
 =?us-ascii?Q?IwZqRPHDK1KC02VRIQNQ1gMFxOBEJtAOWh53bsAYeA4goVbR7ZpCB3y7n10m?=
 =?us-ascii?Q?p3zYX1KC9kiS4JgaSpQipzq7Tqh6wGAkeAmnq3hR3pr+o4yF71o0I3Yh1xvR?=
 =?us-ascii?Q?Q7GwR5cb/ENRv2RCp+s0bmcwDq8+5PbnR9vw8nXzLtXKDodXBMp6yW8l2tKb?=
 =?us-ascii?Q?S6D2yxQdTfRNoSIo/f0oAPCQlzBp1iU2kYg3eJLVeaMjeOcby7Pg8GOmvTrN?=
 =?us-ascii?Q?ntfxPaeLIEi3Itzhpq3ZLmsESoXQLAa3ypYzcp63GIYp2Qmvzzz1vQEFqfkh?=
 =?us-ascii?Q?Tsj/VGLNcsVSJOmZDh7wYe6Ekr0taiPTJ5mPh9D05nS+n3GkxpIk22UZ5Jw0?=
 =?us-ascii?Q?co8X9wrLMjMAYBPNjN816p6M8JozHM65f3fS5mh42qQYDQe98BYQrJrZRf8r?=
 =?us-ascii?Q?/NPaN1RJqz3iBF5VqBg9TOnU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a62eb10c-0ad0-4423-4a22-08d918ff46b2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:44:53.3135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9xg0DFE6ny+ScTVyK2fn+MhOk49Q29Fmgh3d4igDEQQdABsRlZBqFNV4vNeiejmAqpQIF33vObys9yU+jcpO0Coke1EGQU5FFtEd3HDckQ=
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

copy_range is not a default behavior since 6a30f663d4c0b3c, and it's
now available only though x-perf experimantal argument, so it's OK to
drop it.

Even when backup is used to copy disk to same filesystem, and
filesystem supports zero-copy copy_range, copy_range is probably not
what we want for backup: backup has good property of making a copy of
active disk, with no impact to active disk itself (unlike creating a
snapshot). And if copy_range instead of copying data adds fs-level
references, and on next guest write COW operation occurs, it's seems
most possible, that new block will be allocated for original vm disk,
not for backup disk. Thus, fragmentation of original disk will
increase.

We can simply add support back on demand. Now we want to publish
copy-before-write filter, and instead of thinking how to pass
use-copy-range argument to block-copy (create x-block-copy parameter
for new public filter driver, or may be set it by hand after filter
node creation?), instead of this let's just drop copy-range support in
backup for now.

After this patch copy-range support in block-copy becomes unused. Let's
keep it for a while, it won't hurt:

1. If there would be request for supporting copy_range in backup
   (and/or in a new public copy-before-write filter), it will be easy
   to satisfy it.

2. Probably, qemu-img convert will reuse block-copy, and qemu-img has
   option to enable copy-range. qemu-img convert is not a backup, and
   copy_range may be more reasonable for some cases in context of
   qemu-img convert.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.h | 1 -
 block/backup.c            | 3 +--
 block/copy-before-write.c | 4 +---
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index 5977b7aa31..e284dfb6a7 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -33,7 +33,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
-                                  BackupPerf *perf,
                                   BdrvRequestFlags write_flags,
                                   BlockCopyState **bcs,
                                   Error **errp);
diff --git a/block/backup.c b/block/backup.c
index 0b5887269c..7c7a88a0f7 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -522,8 +522,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                   (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
 
     cbw = bdrv_cbw_append(bs, target, filter_node_name,
-                                        cluster_size, perf,
-                                        write_flags, &bcs, errp);
+                          cluster_size, write_flags, &bcs, errp);
     if (!cbw) {
         goto error;
     }
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 40e91832d7..fe087a7347 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -170,7 +170,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
                                   uint64_t cluster_size,
-                                  BackupPerf *perf,
                                   BdrvRequestFlags write_flags,
                                   BlockCopyState **bcs,
                                   Error **errp)
@@ -217,8 +216,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
 
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
-                                      cluster_size, perf->use_copy_range,
-                                      write_flags, errp);
+                                      cluster_size, false, write_flags, errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2


