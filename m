Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E58233F3C8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:02:38 +0100 (CET)
Received: from localhost ([::1]:43638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXgz-0006fg-C4
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIE-0005Bt-GO; Wed, 17 Mar 2021 10:37:02 -0400
Received: from mail-vi1eur05on2119.outbound.protection.outlook.com
 ([40.107.21.119]:8481 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXI6-00075m-Mp; Wed, 17 Mar 2021 10:37:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKnHQNQVRv1DW9kNrP/xMKxlGMGFVXMwqxMH1crPE9M9RJIxNi6lRvpG05PgWk+fl9MRv7pU2M/YrD+naXBHxxld2FcIPqpbSnrO10k/KIqrzRlovYMjtM1KX61JTYEf4zV7x3Jrvo5DUmdkOKyr7x/w2zCSBvxYo+0iVzJztCnHnmeR4Hy/v9T9lWR1y2Zeu/BUKRW4ISEibc9dw5ZVzrGNnpOU6TYLZ37GfQ1iUDuV7EtWnxu6pjnoBQv/jW9P2SWJQot8SRnWjXPlc6qm8Exdfux4upq2GbE9xmDczuFqIrA+o9XhF5Yo3ZV1EYnYXNkQyZ0j2FWsFQesTgikPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1BwOq6cWGxjnaFMpFq0UrrKHm291AB1dwLPVSC2OgA=;
 b=TcqgQQMoNK3NbNPgRnpgjHhOcencbRKHDhE8JRUAYIlS9Hu1IfIbN1AVz7sE+mcbM53jVFYNl4Hyh8GK2TjzJpFMMtUPR2L8ctJ1UT1dxmDLz8ucPFyQBnvJJGSvWfS616EgeKJdNEG1aXfej5T95W2ASIUCmGbneQX0Cdlmvm7P1v8jyWQfGXyylPoz5Jv6EzFyMmfEp/5g5Dh4x8dCSHN62ltTaNxi2jjhzcek4B6BE67HUv78SjCb1SIkkX6iquZAL6e68x3/qhwAD2eSIMAeOEEBoqu6fd8cRNyhgmLLuHr/F+kOYQO3lRQnBty4/AVoZM4P/1cAxxpImGFVFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1BwOq6cWGxjnaFMpFq0UrrKHm291AB1dwLPVSC2OgA=;
 b=gYs73aiN2nPtaVDZiNqUydHDpru+ltIa9EWNVAsScPrRUO2eHVudC9V4ERFitgqFbxqnAOsosvClh86syqGkTrVn//9RHg2XRjg9YXf0fCQHD3cZkc8be/VwtSFtFVyabK3s3U2dBbVQ0eETzPinCp3p9qYvA6Ytrh9Lesa9QvY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6038.eurprd08.prod.outlook.com (2603:10a6:20b:23f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 24/36] block/backup-top: drop .active
Date: Wed, 17 Mar 2021 17:35:17 +0300
Message-Id: <20210317143529.615584-25-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eab1c0e-3517-4309-6c83-08d8e952126d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6038:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB60387E05299B5495E4FE1779C16A9@AS8PR08MB6038.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:94;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0eLaqIiikfmyaSxpPCCnp5HAy+/opf2qGQ4n8JgwJdjzkmg4DWT0NrdDToGBmq+mbwCH1Jk9P2gLE7WKwwJTzgwCiWe9jQkM1OpOd3CyckAvV+1RNHD12xdW7wa2HoW87d6TbSMqd7HN7jlprIQkBjMXACrqOPuM5RCW9bZjNMrcEwDpDVJ+ORFHhsS9fXut6O6YboiWuLOquoiGsNsVbO89yIXlPKYYK0/4uzgo9IG3GnW+I89Ck4Rl198vctb/0Z6w7InJF9dXFnr6u2qf7+gxMsmcfK0r4X2igw+c1yqdO1OVJTF4cROed3b3WSKCu8y6thgsVeekxNnORlcLsro+VYvCAVTSQnBCGv8vFeWPwehvGWgsNvTvxWlJes3qP2Ob4anjpccGaENAzTXQiH8AkorrtIqLCifMsQmAWfFqYjWJxSQlhvgSQhklERnSnvduzHTJ9wJLbMprJhCTma2M9ee7E+O0CApd4nyz2C07+ubibfQ9c/eVTcXAOqanCCRkHxxNxhvYJkWvwdvSMle7GiuYK1obt2kNvSlzBctuYVZMXik7aoSlLMM1XUy2Di86Bnto092cOkbH9k4ZS7dH9GqyMe6pN2h7zroRv89J/lY5AEkEkDmRms45frXWiJgbB/1HSqsNXMmxXA4sDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(136003)(376002)(346002)(366004)(2616005)(4326008)(6916009)(478600001)(6506007)(36756003)(8676002)(8936002)(66476007)(83380400001)(316002)(66556008)(5660300002)(66946007)(6486002)(26005)(2906002)(186003)(1076003)(6512007)(956004)(16526019)(52116002)(69590400012)(86362001)(6666004)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?38HRluiq/ffQKGBoUfeEjq1VLRe/+gSuk9BFqITr36yAqltjrobqrkd2lvd+?=
 =?us-ascii?Q?SfZ0KJTFWCpwpWa0+gNowIyU3N4iyez/zahcTptD/hOV+ouKgFz/v+1eDY7j?=
 =?us-ascii?Q?ODsEYuyFm7kcQOwfrf8Fw52Z42Q+cPzAS7FfJYp3u7s3+KFB1AdglotnlhP4?=
 =?us-ascii?Q?c6fApZstsFyOKbUbc9dxuizXc3FoLkSM65N7/T6aeXNj+/S2+jZcZ/sB9o1O?=
 =?us-ascii?Q?cBqc75m9b25dMQSxjmM0aOrvTa4vM9HuqjgD1EAv0LD1FTnLdUqI0tG0+Qxb?=
 =?us-ascii?Q?9bpDoI6R1h5f5boopizYr0KkmDK79jMBF1HA4RG60NplYxC0xdnR7UICLect?=
 =?us-ascii?Q?LX5Wr8km4jZ4wSPSZOURtWY0Raj08Ya+UU6h0FFKojJsv3wHUSZcSOuAksEU?=
 =?us-ascii?Q?b05cP9skUBsylI+dSAASYTKxuAOpjD8Zo6OYT+BC4y4VbugHR95NKgBz04Fu?=
 =?us-ascii?Q?EiLHlLxWsAiyLndpKLFoshj5WNoy6f3S0+iSbpB/NyDtsPWx3Hban2TOjmYH?=
 =?us-ascii?Q?8e3W4bIMm0JYQiitd22gIoNtRDQLcCJDLsjcmh28VKK+4e+p7+bnE5lYPn+6?=
 =?us-ascii?Q?Jz/iXXT0MNUBdxRcsQlOs/GL0oizTgAcYb86LEuhf5pt84lwwkV5CIa8CTWW?=
 =?us-ascii?Q?MuSHSvOcaG7l8VUJMz741UPu7rHr8WvgBjo7nyp5MBwXEGow/bAmmOpk3wKB?=
 =?us-ascii?Q?qRadW91mom/8n7ieH6rk7KF7gIEW//12wp2G8ge6RNVTtMb6BQHcKYsDBryy?=
 =?us-ascii?Q?5/1iygMIri4Kt5R6BzKjYazidg4BBULfnSyev2F2vm4Q2FJ1/wd8NwfL3nfO?=
 =?us-ascii?Q?A35KIhCc0LEeIB9oSd0b7cn5lV1BcuUaLOFb2Xu2OumBTwGP2Igebf/Ugkcn?=
 =?us-ascii?Q?/rG8iociqakUeked8R25mmil5hsEET2lu+EDH7JWLNaEi5GfS0DxZkl1tHA5?=
 =?us-ascii?Q?IuVG8HRUZiYb3oMva3yRiPxlXo3p/ptv2qXVe16CFqB0IsTadMeGPIqudMA1?=
 =?us-ascii?Q?rankZbbbZ3N4duhEll01M8iXLrxX3dz7Sk7MKOET600X9mZiTx+cvlZgC57T?=
 =?us-ascii?Q?ZKZ7p19IO3Bg0x+WvGkitXjUpSWKKQuyY3uSZOqP24Rz3l1nO8MfbcBTLmef?=
 =?us-ascii?Q?pis97OER7rKej3x5OOVRc+NNUwWXCKsjOVZb3JHMv7Uk5xUrvpCPk/Luy3Hx?=
 =?us-ascii?Q?Rk074k3SOGoQ52aF2NTAvPfCeA0/EMYmibVF+fGm6UAIUupC3oH7Jf8zrv0g?=
 =?us-ascii?Q?hzXqKvdEaLuBaa6t8RiiUfnw25VkMs49yA+pA2OZIz3qRUh8gpM+mh50o9b6?=
 =?us-ascii?Q?CKew8q0xW0TegkgwINz7HohD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eab1c0e-3517-4309-6c83-08d8e952126d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:38.0767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1v94O/FTT+nfoWrm7wkt0Zd7m+Ii0OuOohsm6d+KqOUzoDMCHvP/+OFfHKnPkN054+O1ATUHYhzCwDmp58OFtkCCiCjzCLmM++SRWyrYDpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6038
Received-SPF: pass client-ip=40.107.21.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

We don't need this workaround anymore: bdrv_append is already smart
enough and we can use new bdrv_drop_filter().

This commit efficiently reverts also recent 705dde27c6c53b73, which
checked .active on io path. Still it said that the problem should be
theoretical. And the logic of filter removement is changed anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/backup-top.c         | 47 +-------------------------------------
 tests/qemu-iotests/283.out |  2 +-
 2 files changed, 2 insertions(+), 47 deletions(-)

diff --git a/block/backup-top.c b/block/backup-top.c
index 62d09f213e..425e3778be 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -37,7 +37,6 @@
 typedef struct BDRVBackupTopState {
     BlockCopyState *bcs;
     BdrvChild *target;
-    bool active;
     int64_t cluster_size;
 } BDRVBackupTopState;
 
@@ -45,12 +44,6 @@ static coroutine_fn int backup_top_co_preadv(
         BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         QEMUIOVector *qiov, int flags)
 {
-    BDRVBackupTopState *s = bs->opaque;
-
-    if (!s->active) {
-        return -EIO;
-    }
-
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
 
@@ -60,10 +53,6 @@ static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
     BDRVBackupTopState *s = bs->opaque;
     uint64_t off, end;
 
-    if (!s->active) {
-        return -EIO;
-    }
-
     if (flags & BDRV_REQ_WRITE_UNCHANGED) {
         return 0;
     }
@@ -137,21 +126,6 @@ static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
                                   uint64_t perm, uint64_t shared,
                                   uint64_t *nperm, uint64_t *nshared)
 {
-    BDRVBackupTopState *s = bs->opaque;
-
-    if (!s->active) {
-        /*
-         * The filter node may be in process of bdrv_append(), which firstly do
-         * bdrv_set_backing_hd() and then bdrv_replace_node(). This means that
-         * we can't unshare BLK_PERM_WRITE during bdrv_append() operation. So,
-         * let's require nothing during bdrv_append() and refresh permissions
-         * after it (see bdrv_backup_top_append()).
-         */
-        *nperm = 0;
-        *nshared = BLK_PERM_ALL;
-        return;
-    }
-
     if (!(role & BDRV_CHILD_FILTERED)) {
         /*
          * Target child
@@ -241,17 +215,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
     }
     appended = true;
 
-    /*
-     * bdrv_append() finished successfully, now we can require permissions
-     * we want.
-     */
-    state->active = true;
-    ret = bdrv_child_refresh_perms(top, top->backing, errp);
-    if (ret < 0) {
-        error_prepend(errp, "Cannot set permissions for backup-top filter: ");
-        goto fail;
-    }
-
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
                                       cluster_size, perf->use_copy_range,
@@ -268,7 +231,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
 fail:
     if (appended) {
-        state->active = false;
         bdrv_backup_top_drop(top);
     } else {
         bdrv_unref(top);
@@ -283,16 +245,9 @@ void bdrv_backup_top_drop(BlockDriverState *bs)
 {
     BDRVBackupTopState *s = bs->opaque;
 
-    bdrv_drained_begin(bs);
+    bdrv_drop_filter(bs, &error_abort);
 
     block_copy_state_free(s->bcs);
 
-    s->active = false;
-    bdrv_child_refresh_perms(bs, bs->backing, &error_abort);
-    bdrv_replace_node(bs, bs->backing->bs, &error_abort);
-    bdrv_set_backing_hd(bs, NULL, &error_abort);
-
-    bdrv_drained_end(bs);
-
     bdrv_unref(bs);
 }
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index 73eb75102f..97e62a4c94 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot set permissions for backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
 
 === backup-top should be gone after job-finalize ===
 
-- 
2.29.2


