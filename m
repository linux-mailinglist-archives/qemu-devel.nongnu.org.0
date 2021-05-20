Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0B238B1B1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:27:42 +0200 (CEST)
Received: from localhost ([::1]:53424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjeH-0005wu-SZ
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZO-0005LT-2I; Thu, 20 May 2021 10:22:38 -0400
Received: from mail-vi1eur05on2115.outbound.protection.outlook.com
 ([40.107.21.115]:23648 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZM-0005Yx-86; Thu, 20 May 2021 10:22:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B98EIt6bZUBeK7pZIOYjXpDoV4RP+Htey+9Ap7h5/l6LJ6QudJjFys0yj78wwzOSDU2W0qAL4zmt2x43lpkK4ZwmFK5+yImvYsso+lpIKmW60ZAq9IICTieoszdbsMeTaJ51tHBTeERapcWn7oKJd01SMR+yf3vHSRe0jCyDHShd/Vla+lQCp7QR1ytvY5m3gmOmz2UNY802dEtgbPZj/zM6gnVAkYl6Wnfk9BfAmA1IbDCbJ9qMFwKps68koaQ6nSIvw1DNjaPCYbdXewM6rFHdPLZpKZi8cJU6HsqRHL6KHYuWzgZlug0oM8WoSm1S1SjsfBC7NwtxzlE4p5O9qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJLrl4iLJwsuLJOxBMYIOcq3jd9yXVy9xI6DwmKRPj8=;
 b=HFr5Rq7uwj9BU74EXBIwnMwmJ06qAE+os1iQvQs4SKDBLCGjut3Zic9nzqNBn07yF9T4/pu/BNw8YL8QBm3KfV6jIJDscq5X4yUvCtnMeYeFsct+jHh/2NT0qAmecGqsfk6dUr/Q9B07UTAwVY575RGA7+S1VshaW1WgbjYuceUNJRHGpAfg/Ga1k6daSBA64/JwYl0staQmvqnKi7Jk744ODxB/pxCbDZ00+yjLWC+tiTXL5S1jj2zf1Q7MUvjrkGi1zTQaoxS83C3txA+Gi5JNxRoozNqGwrIK1W9cCEbI4GB4kS51XOcMFyBs1xOKNpd1vs+h/fHKTy7JQjrCsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJLrl4iLJwsuLJOxBMYIOcq3jd9yXVy9xI6DwmKRPj8=;
 b=YsR0OSqsx8X8R0bxUcsby1TBdyLpsONMBY4pCNy+ptBbKLmJDayTUHRnVevSlHq3ts4/2IvRw6xv4QrqTl3gsthSELsoYogNfYe9OsTJFlgG0CoJcL6fsjZIF8ZhwGoRaIcAnKYfExC77zV0UZivPXDrIUOXDAjMOuifICqpgTg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7009.eurprd08.prod.outlook.com (2603:10a6:20b:34c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 14:22:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 03/33] block: introduce bdrv_replace_child_bs()
Date: Thu, 20 May 2021 17:21:35 +0300
Message-Id: <20210520142205.607501-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210520142205.607501-1-vsementsov@virtuozzo.com>
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.197) by
 HE1P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af0dc043-96ac-40d4-8883-08d91b9ab17b
X-MS-TrafficTypeDiagnostic: AS8PR08MB7009:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB7009A77CA17431504F7026D9C12A9@AS8PR08MB7009.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sBDqnwG6i7177qL5xrx7su3YL7/4FOOYe1bi4OJa7wibqX8szIT+w0GdIfn0KhKHYfdf4t9VJFJdSSIqI9MqhbljpNf6xYC34CvgL4MtX9mIJbuMoqHgMktlnkDFnGInkdpb3NrfzMAkyp9zDm1SyzaJBJptSWzQARYHb0FHW0b3YqqDm726fen1uSohOoKPJWFnFve7ACjWoKpLYUJ8niZwNiqTj9SMX8Oz/n/pTRtknLlS60M7S7QcMx8JCcSIb2veZzHGjudgGetdgwkDKyotU3sHC+/vk5Yq9WCAI1bxEjnp4zvbITtd/bwaNZQxhvjv09UtN7WhY/rjSkv0hVug2QdZY3xHaYIlW2VDBjaB9NYypSBE+M0cbBdqBT4ourF2WDhwlTCGrwQNVayyY4+iAsJ0ekzPz2zAAUkI+Y4Eks6pge3ombywrTosd82qIIuvvDKvZCXo7CrqtKEwCQHETkEZzGdIfqeZKp813/o8EKuZJEWwfNQOO572T1GgcvxpmjncXXVZiYGRYCNvFEfzg+ec1fzoRCAOsrgx672yardSzfOI+lW164uuOQFIsu+ek9ptvIm5XVMYGwXbVOCo1BYKXbNke9knrxE1ODhz7x3hs6//hQL2Dfz/DVT/YGbQLF9SkTcPwiEvM40B7m7Xw5lNT5GwesS0gooMIEXVUxY4mTNbJUPue09GS6nx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39840400004)(376002)(346002)(366004)(38100700002)(38350700002)(478600001)(86362001)(6916009)(6486002)(36756003)(83380400001)(107886003)(8676002)(186003)(6666004)(4326008)(16526019)(316002)(1076003)(5660300002)(8936002)(26005)(6506007)(7416002)(66556008)(66476007)(66946007)(2906002)(956004)(2616005)(6512007)(52116002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rUyeoHnaF9aanKUjBfipLDTbe7RqrtBUPFlp5/kgtyIL+NA+94g8hIioKAV/?=
 =?us-ascii?Q?qGBCt0ySquStgrJv5JyHumZXFv2Wq9jG99ngZm+PQcElJTIiQ5HZ2LV6s3zM?=
 =?us-ascii?Q?zoT2O7KLgvK8AP6cQ9+T63IzgIrPHYaJLE5aJhpuhHhLKvB4Ba1Nq3ELpstB?=
 =?us-ascii?Q?f7GZxlaI6dcygTq7zb95E4Y+nSkJuYOl5stSXakVx0RDEywYzAhG4A4znt+l?=
 =?us-ascii?Q?JjmtydKNvnn2TlZYbnfvqehpz/QLAivyw4YhLFKani3QrDcw30rS1aup63i8?=
 =?us-ascii?Q?thK6LxAqGpKTdG8zxcS/Ns/vKoLyZuVxhtOhet0wGHuV8933+aH2mjxtUb8b?=
 =?us-ascii?Q?ttS8i+4Isj+g0vRLLZokn2UuXjsmOs8W9O7maDygO/0EDNljfnMnxhBFSwph?=
 =?us-ascii?Q?k9fiBd1ccNiY2MiYMGHW196p4mrryYaTkJvIe9j691jvpT755kx3A9evqYTH?=
 =?us-ascii?Q?R+sFCcRZNbnx5Qy2wnlMK42vuF4DRekBN4IxncTqmE8e5L027C+OvF3OYGXB?=
 =?us-ascii?Q?zuL6jIa9CaBiCRJnoj98IVmkRPeviuAt1+q9YAJia4qOjkEqqunW0gfXrivP?=
 =?us-ascii?Q?tD8g9j0QFTFqJf1OMZtjero7OHtHqQGhOChChYvEwkL41j1GAjCWr0Vf56rf?=
 =?us-ascii?Q?F14JkNwnwycfKPb4GpdzQbj2UN+AnTFjl3qYfuGqpNUqR/rOnHQ20hvbg2oA?=
 =?us-ascii?Q?p7NXM8zyrt5iFOSGvgL3OfyjqymSB6eZ47YDjf6p9Ev6PBSNdzObwsJap5ON?=
 =?us-ascii?Q?I9VBUpdEd16rjitR21YjQCquM1M6JPXN8EpRiz87WBkyVvrTdiD4MI9fTv3S?=
 =?us-ascii?Q?PM2VmEFl4zl1U42771qMvD/Yjq8eFdEd0e3qi3WJlYgq83OrGTXkJ8stasI3?=
 =?us-ascii?Q?lE6sGQKo5OQC2X8RvNWH+AaqviRlF70Ill6ehLkshc3FjXdNo1JdUa5BOl2M?=
 =?us-ascii?Q?RM1EJVUEPsARJXC5xA9ut1h3N5aWAN01MqZfFOto5D51OGtJ5zkvPqW9x9gz?=
 =?us-ascii?Q?a2GBrmlhDSPUC2kyQnhv6xVgcxDvgboooSjCnXYDzAcN7POmZNQyelR51Fza?=
 =?us-ascii?Q?mRcqZkgeimzK67k+eCwG21qGXzWl9FdbzmRaVqrru51He4d5l4yZ3kb82r8v?=
 =?us-ascii?Q?YJsiWHvVMuU6d5tCBsOh4Ux03CZSygLiQFIOB5EFnQZWYa6RWPcdbIEk7DeV?=
 =?us-ascii?Q?qo8Z1GDG60hHzi9VvDvj5uSGgr6TgM1l/j6VHaGCk0iUVIQU4AI0LF+Zb8Hx?=
 =?us-ascii?Q?B4YafyC8OqiT8AnR3A/cqHIDYRw+WdgPgH3CZ4ZZJQrtNrSxJBZmrEjPeQ0o?=
 =?us-ascii?Q?uiQe6WPWYQTmEqMPPBR0oFtI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af0dc043-96ac-40d4-8883-08d91b9ab17b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:26.7437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DuceCfqHCQxuw+X2BkhOuWelfOvZI/a90SZSwt7z6vRdPXxUBHF4h6dkpAqFxwQD3RoHwcIg2FmVhtjvQWnyEAWGK+AHdjzHyTzIre2NQCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7009
Received-SPF: pass client-ip=40.107.21.115;
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

Add function to transactionally replace bs inside BdrvChild.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |  2 ++
 block.c               | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index 82185965ff..f9d5fcb108 100644
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
index 8aabfb03ec..39a5d4be90 100644
--- a/block.c
+++ b/block.c
@@ -4969,6 +4969,37 @@ out:
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


