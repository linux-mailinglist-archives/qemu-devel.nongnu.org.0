Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E4A2C6826
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:49:01 +0100 (CET)
Received: from localhost ([::1]:42876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kif3U-00034N-Ip
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0n-00015v-G3; Fri, 27 Nov 2020 09:46:13 -0500
Received: from mail-am6eur05on2133.outbound.protection.outlook.com
 ([40.107.22.133]:13377 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0l-0003DS-P2; Fri, 27 Nov 2020 09:46:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlXIFgTmCW7N+F7tHdSltBfFsJYFGlVkUE7mwYAl5ybyWhnwfgS+Plqm7aJ9hFy/H1n+Nh7WLirluJFZKYjITlAYS2acZvnWXgi4QHZzaCuAUwiYaU3Lcta2HKs3nSgmAdZ50L6qDhKoR9cG5JpGsYQgsOfQ6YJX/xYrjwkYsgl/Yz2R2vFqv7itVeFjMl6peSHiBhFRmLSl/c4F70I6Z+/jLZVjY5Flu3TlG2hAfpZzSefqZVXxOj1rGe37k+zpvYtPn8mneJrI2iJwlcKFinL2R5gG7oVZi+lSsduoPgPBeOokSbYuOVM6bIgU2TlkS1AO2CQNp0IV+k6igPMPzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iZFLPgPECZF7CknnqRNvI34ZzJuGut/W1YkyLmtq/k=;
 b=nJC/r+lSdQOxVcVfhmQQMjNlwJ8sPx1LbrJ1fyfPI5zgJUKDD45yZ8Jkyatp80DCen2zlvyZs/BbpUZ5NHbNHi5qeQW4tS2sg8ASvGOg74friZ+xHv2b067xE+5HOiCdNbRsUdDUUhmSL4b5AZMTll0j75V4MNxXTzdiz9A5yj17S04ObLxv2GFl+KJrn6pwbyLvydQLE2o9xug0VLJ+zqbk+5oCpToXtXWTP4WkGR+J01xcC1/vcRU9GRt/ehn55QmGN5OebkGazh5nrcioYZTZifu6X/0n1Me9X9bovxpWufPs9sOgDS68RCnsKfWIyO1oUp9Kr9XIhYnWmST67Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iZFLPgPECZF7CknnqRNvI34ZzJuGut/W1YkyLmtq/k=;
 b=MkjUZrE5z7Tap4zQJ+QsyTgsgA5HMpacJw7LFQSa4usGAAmFWc2QPRsOAThcUlsQ/A6ycvw9JbBnozEyQe11TI1aQ3DyWEv/USHIQccwslKGT+eFyGPg6wIrNrCNVox7PZF8T4ifFPX8hpoHcOK1jTz3zGLK+bqW0lic+HKJh7Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:04 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 09/36] block: return value from bdrv_replace_node()
Date: Fri, 27 Nov 2020 17:44:55 +0300
Message-Id: <20201127144522.29991-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201127144522.29991-1-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.91) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Fri, 27 Nov 2020 14:45:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97263696-f158-4c10-ce2e-08d892e31e42
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5078F631AA259D9530BD1CF5C1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S6oiKRoi2m9SPElZ9A0I2TaVzzd4zA5E25po0kj7DcB2iHvAl4MSzzIXs1iD8RxRPhR1kV9QXVmLv5IP7aI0ZA1DrBIReXJmXno7UqGis9PE2gn3TQDQVEunugyC3ksvdqirkmVhGsKzpk5jeib0wq1gs+gAkG8p8SQ17wmIf6nqOECnElcgDPMAuz0UgSTKCqPltf8zBHej5JkCwGD9ZxYIg+arOyJQzONoXwWEPVvR42UIcePEA5uMgG8nRj/yo3vAMPjNtCdY/EcTxFcXKZtQV98vBJIvjpSDZ+n4TMjDsEqTWHZGre6XelhtFGdi1Lu1lalRo1WE1P+NjrXLC1qX/W8zf/yewX0KTl8r52g8eJGb8E1sj3+nslld1D8S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QSCAAyT/kOvNN1oIaJmMl5uchUwVHwUHnNsCWqQmqkOfH37cTdNWSGGvB9VX?=
 =?us-ascii?Q?IlyNvsfoLE/Hhj96F4FiGFgn8bdb2xxrqzSUlkdpXg2N1NJGD35PSEkZ5v4k?=
 =?us-ascii?Q?4C+NlVFxLCCPSRHmyKj/5YzPWxowxxygj/6YwWBDsTpUcfGsxWDQ1GINyKDg?=
 =?us-ascii?Q?78SmFPfbFVwk1lJ4geVE31gh0oKxuuJoCQzgBFaWA1o9dC/KbYsT9XyOayHi?=
 =?us-ascii?Q?ysxpRyDLpxWNPs8JLu9OS3rSz49cR3PWCpEG42yvKAhbpU3Nwtn1swzY/Vaw?=
 =?us-ascii?Q?9+6kDqfgL1muNexz93qnObJ2AAqxsZOst9iEznZLQ+wsq4RuSMCakkzkJKxc?=
 =?us-ascii?Q?CAH/hBPVNgUAsv7HjIH1QuhMldoiFtCPhkq1vc3iAQVBDKJebcNEXcZpgweY?=
 =?us-ascii?Q?EhPoXhvFZS+B0FOHCaNhqluS58/Th39db3mhNaIlbNIgUojtDvS48r0ICOzR?=
 =?us-ascii?Q?kITaI7zq7FUN8PBJyVeHA7+TangOR08M1LAebT4+AlhJuWLRox1JAzoT0JGo?=
 =?us-ascii?Q?jtrw0ySj49wGUrb+Z5+0Qg6q2Ik3bpSppialNy3YaK1mJlVdZKdifmbr+Ixk?=
 =?us-ascii?Q?1PIMPqre8hLksZ/6fW6hGGl6faOzTLr2zBmULIPyJRJ/ggp/86q/XNxfBS9o?=
 =?us-ascii?Q?dJ4Qb/No6IlnKzvABq/o8UxttKp51ppqQq6HlFnZvHL6Qyvn4yjMdgPNQV1E?=
 =?us-ascii?Q?K9nAHYbmVglSzQJZNHd5sEnDS7sZCYE4xjSqpIijaJ2idOht5k15Ri2iLG9V?=
 =?us-ascii?Q?BkVWR7ZAObCndcoRc/GEl/ar+pYb4RVHsQyUwFqPEF1m1c0pSW+lnWfNpfci?=
 =?us-ascii?Q?UV+ugIXxdNb04PU7+1Cr0k6LJKkk3xyqQ+GNWcSEVN7ZhRnp2f7NBJB6RGVJ?=
 =?us-ascii?Q?oEO8BOxmE0oxpZ687goM/26WYBUc3CGiGZb0clLY2JX/I9XdaGb2G7DNDtdY?=
 =?us-ascii?Q?i1b4nJareLNaZcUYsQBEkk3nKebQfF97aO6iHwxGFAayooAneG12cC4rrtrn?=
 =?us-ascii?Q?rbwG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97263696-f158-4c10-ce2e-08d892e31e42
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:43.7364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbULHv9xRmoL+C0UtIZeqlhJwLZbGWiNTY+3QjR+VeqBdVxZ+TSnk2x2TD2aEdAWkichNPQmKTkNjUkstz72J2Eovi6dBT+/ujZZM64uZOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.22.133;
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

Functions with errp argument are not recommened to be void-functions.
Improve bdrv_replace_node().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |  4 ++--
 block.c               | 14 ++++++++------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 5d59984ad4..8f6100dad7 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -346,8 +346,8 @@ int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp);
 BlockDriverState *bdrv_new(void);
 int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp);
-void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
-                       Error **errp);
+int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
+                      Error **errp);
 
 int bdrv_parse_aio(const char *mode, int *flags);
 int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough);
diff --git a/block.c b/block.c
index 3765c7caed..29082c6d47 100644
--- a/block.c
+++ b/block.c
@@ -4537,14 +4537,14 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
  * With auto_skip=false the error is returned if from has a parent which should
  * not be updated.
  */
-static void bdrv_replace_node_common(BlockDriverState *from,
-                                     BlockDriverState *to,
-                                     bool auto_skip, Error **errp)
+static int bdrv_replace_node_common(BlockDriverState *from,
+                                    BlockDriverState *to,
+                                    bool auto_skip, Error **errp)
 {
+    int ret = -EPERM;
     BdrvChild *c, *next;
     GSList *list = NULL, *p;
     uint64_t perm = 0, shared = BLK_PERM_ALL;
-    int ret;
 
     /* Make sure that @from doesn't go away until we have successfully attached
      * all of its parents to @to. */
@@ -4600,10 +4600,12 @@ out:
     g_slist_free(list);
     bdrv_drained_end(from);
     bdrv_unref(from);
+
+    return ret;
 }
 
-void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
-                       Error **errp)
+int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
+                      Error **errp)
 {
     return bdrv_replace_node_common(from, to, true, errp);
 }
-- 
2.21.3


