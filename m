Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D893F59F5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:41:49 +0200 (CEST)
Received: from localhost ([::1]:53898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIS0C-00066F-7M
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRy0-0002Q6-Dy; Tue, 24 Aug 2021 04:39:33 -0400
Received: from mail-eopbgr130120.outbound.protection.outlook.com
 ([40.107.13.120]:56386 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRxx-0007HX-C3; Tue, 24 Aug 2021 04:39:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxEzpFnfR0ptVX3/SFf0eqI0qoQvG6p7i5TtNc5ORNdRakP58nOty6Mt76ChoMOwX5HO/1g3A3oHgOJ+EACeE8w4y9vEhH9jgNGfPNM+kt7bTkFz3rTZYZ9kdeaU5SM/MAyw42sohk3gpXjEns7DT+41RK4UXuW1K11FbWPTBtaXiXSURk/CLxsGgF4uMqLiMCRqJk79UIGxqxquNAHsNPps5vc/wRfeJGV8PFw8ewlx9An5x7jvCgx96ZPnSC9NQiMdx6q0SA6BBU/m9LAc7iwdbeSjPQt/++wA78FrrEY8aVh+sMRc8KRhCN+l3ZI8lujUcNFtB6agRzRgbHBWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86yxeNMvCmwRKQqxnvVlBp2jN3bg7Kd0X2SNe01MIcM=;
 b=kVYO03Zu6cZj9GBRqDuOktf1b6Wz+VEzmY9p0W1+I2LXaDyp6Bh9Vr0gFsryYYxpG8hZIdI2ITKaO4en094pR6pbPcPMLaY/DXAG/7vJEmCkbXD7+DYMeLsrEX46kLwBX3LfGzVlZDSN9eWsk3P5tLu+/1n0ZAMlwTyprCZYvU3FRdYZAsDEwJ5PS3YHavYJ9ZvdYkYdM/ncWz8NVjNoSW+ZWQJUjwdPALCVJvTv98lucOkbHK1TVp1VCCSYQ6SJtck0Ikumxk+qTGf5+m5L+H5+Tsm/XRQz7nBUiZC6BVUmKEZkdXleVzZ6242bGAfjnnHwgnNJMhoJYk7SiPBVtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86yxeNMvCmwRKQqxnvVlBp2jN3bg7Kd0X2SNe01MIcM=;
 b=wo/IBjJgPkuwV6N4H2928LfRzWIwM2JejKsUO8lbd0NRSVArpS/5J/mn8tf8B6ZHPj5abS38VSuB4AHnnA4Folbuzx5DZPM3Tbn7/PpbbS8MQLSS0lnLjh1VyO6rshFofDgFeaRlSmXieOwGG3GSG6eHyuGhXdj+3cPutYA3gB8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6533.eurprd08.prod.outlook.com (2603:10a6:20b:33e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 01/34] block: introduce bdrv_replace_child_bs()
Date: Tue, 24 Aug 2021 11:38:23 +0300
Message-Id: <20210824083856.17408-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a8f8cd5-138e-43a1-4c33-08d966daa97b
X-MS-TrafficTypeDiagnostic: AS8PR08MB6533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB65330220C458DEB41C815408C1C59@AS8PR08MB6533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kMwdDSmB58wfJ/dhQkMYsw9SPN+uABEcDH6oQ4QgSGDSrrkeQWUaZ+rE+WtA1PC+1jjbMN5fjwNwX+WPsWBQbvpBa+/8eeFmxTRa7c5JVBpAs0+l3zCdC5KJcFBBT+PGIXsKTwzD46JADx91vHtHCZV7dW4XF47xt2fz49G5vg+RcDfKJxKl5ZU2OYEFP00joBy5w8ILtySEGVMCU04Go5T2623dq3nrq8QZX5Q+bfzoHPDHqRY1B2ZJ8HW35gvFRPUrFW6dnP60nTXDsW0/73SXzhtzc2arf3E1ydQkq1cN50BWUoKE9ejrd2hvckMBGCzKIYbui1bSRPwJoADMuF5usr7SQ3L4PVxdHiFF1E5uJ9038444ejBNS0ct0sHb1aMgfn8HIf9szrKcsQLW1pKMHrV+7YVAtVZ/UoVR3Ls8Ih4sItcixij0gai039b5CHk8Ava23h/LEF9N2Iog2ivVUx50emLeAQ79fdDvQtczuubiUUN5z0GgOVQ6WhyU4wjMcrrP2inWc8ZzoIVApFfRp/p2OmSE0OOZ7MsXko0CP4QjYGtZOzio4NwBZ91QsQX2ex6kX+vvvMItL16jq4RDXOjZbQWGIajNk6xE2XkPFY+ITlfhOuomkyOSpWeufDwcQ3IruOsSIt1dm/DLEy/YmvZwISnRqzk4bU9y3ScBClhku2YPl+P1UZOfabyeCC/MHlVXytuCOt3DalsIeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(39830400003)(346002)(316002)(83380400001)(86362001)(36756003)(4326008)(6512007)(186003)(6486002)(478600001)(1076003)(6666004)(6506007)(26005)(38100700002)(38350700002)(7416002)(52116002)(6916009)(2616005)(8676002)(66476007)(2906002)(5660300002)(66556008)(956004)(8936002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QYm7wvra/I7XUiN77k5tnTfsJMGbJIR7QSVQHe4qYtrdRo1eC5x92vxY65Fk?=
 =?us-ascii?Q?Xmrwu2eD2wsTAODDWhX5nIBIM12ftbKBcZUVfxHtPRUbFMEaIHhjEkGaheX3?=
 =?us-ascii?Q?QCI8VxNoMjuzAU4L8XeiZYK2XfvUAeN+fM5HmoKbAJDBFBQUdAAz6PgfScvk?=
 =?us-ascii?Q?lMVfvv/avrtVfEf3Mr0+5/IiSKoalEMTOi5npJmSFD8uEV4tVy7w0pwCpMHh?=
 =?us-ascii?Q?Q+nPTGQUGALVc54KkXtF91akh2rHG5hD60ETKqD3hSzWxMy455g/gJ+JL2RZ?=
 =?us-ascii?Q?fUm97WSoF7p4eaZoUqBZFJ85ii0CjUsw+q+/URWtQnQLsCeNMbsJoXgYJaVC?=
 =?us-ascii?Q?LhU6PAhK0sui5PaggHljZN/6MchMb7Qh/6pGunv5syN6Ywr7hBNw6fICstAX?=
 =?us-ascii?Q?pQKkDeDT9KXmaMuvCQoiQ9LttcRNfSB0oMsXS/yRXTUv9SR1rAtS14fm4+e+?=
 =?us-ascii?Q?Jap2QgiUH8h5Xhk1hSFvHHbCH1uXyYclGCibi5w4qRcb9lbugbCq2RlvB1Et?=
 =?us-ascii?Q?dtT9jXaA4rIop74tMR0OnsyPeEpP+16gYB1yXqXprYfYCpYf9iubqvWtWt0k?=
 =?us-ascii?Q?oN8j9K1LE4pnhHBtvVkaNrOPzisBJjhGqAN9vtg7O5FUFcdcfMC7qQ5KhXEY?=
 =?us-ascii?Q?+sHJKjt+0d+CS/n4beB1g0j68duW+aeMTotmlzMNrnS8yoov4W31R4caoAxO?=
 =?us-ascii?Q?VD/DUubiMhxiB7XNl8Gbigeanr+EoDXvKdgwbya6CBa/acTCkyGWy7IBOCzD?=
 =?us-ascii?Q?qsfATw0Bn5lYMivnz6xCr7/r/2HRLKxxs7R08STnZIUHfYePLhzEMtKggRU8?=
 =?us-ascii?Q?ERMoKoyp/Jc3Xdd1KtyjT54UGW1LywKqJXcGdFANu55DMGjzxcb1TNpP1TPS?=
 =?us-ascii?Q?zlaFxa+yGN6nPkM8iU8V0n1YvmEWfRU2yuTbCm809HQk9fD0CO0zGXPbUW8p?=
 =?us-ascii?Q?0zOBdmdWGiNYgNZSTfMLDOqUGPO6VSXrfjiyUE/escq/gnOSKIG+vPs9uWnZ?=
 =?us-ascii?Q?rP/qF/bsG/ezJaCvx0153IS4LS5TyIQdmSy0HYTVUarJDXLhqnxZUYIp5z/y?=
 =?us-ascii?Q?MZGdJ9xpcMsgTW8PGVtwURlSbZbDm8VEw3/tm5R8NFUR30bi62Zghwz8izqm?=
 =?us-ascii?Q?V7sCp021cF8T/b/vRPoiYThF54dhYbmjB4nL/aM7ZNzoEmBzeO6p///Nc7/S?=
 =?us-ascii?Q?/SPEOWS0j5RgfDyNKwOjDlG6tQzhyx8wWINUdKZTC5FsUkELalgRuuqN7SDN?=
 =?us-ascii?Q?3TsEsk72qmhz+PD43YK8Us1p8eaMnpDeZqIg2r/Y3M9D8VzdJy4QC1eht+41?=
 =?us-ascii?Q?tG8VET2+hAGoQrxMlC5cO6TD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8f8cd5-138e-43a1-4c33-08d966daa97b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:18.3174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9epYD94Bt7Lb56JVqEUp80FVNj1Y7h54OxKfFWh8g9m7h8RFKEr1JklTKMJOFD0lMhItKDR+muVeMQm2C2c/yhHIDhTbND2EjXnGwjd3jnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6533
Received-SPF: pass client-ip=40.107.13.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
index e97ce0b1c8..b2b66263f9 100644
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


