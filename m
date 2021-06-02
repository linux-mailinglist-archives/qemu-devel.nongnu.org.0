Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F92398A47
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:17:59 +0200 (CEST)
Received: from localhost ([::1]:54458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQkw-0001J1-Oa
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQes-0000B4-O9; Wed, 02 Jun 2021 09:11:44 -0400
Received: from mail-eopbgr70104.outbound.protection.outlook.com
 ([40.107.7.104]:36580 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQeq-00035G-FB; Wed, 02 Jun 2021 09:11:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMR1yP6lVYL2KpZKhkdKgYyEapAS/JYZC7ISJkpuZ0M4iXf3SBdw7Tfap5anmjx1AbMGFaelQzlrQNrCYJulnmUzXu6h6HrGRIHPBg4XjvG/hdmijxV8aB13ekAubH5yDVKC0qHKhnSMEtjZDW9Xsa//DaTOPSUQjmp6mMG8f5wdSPLr4dv6+ZNbHY2tU3onUAHDnh8IBzzyMzEHP4z2U4qCxF3hqAALRH765KdyTopMc7QLGxfwTG+6XuObwJdxIToVJPOzBMBZVfRYNVA2UGwHcv81EiaCjiU/+jmMI4HXJlQiBnw69xw4xkZ6H281oTh5PokeYQn3UNR8IKVnYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4U4w/GZqtNTKo+LGu837g+7dHPDJy6BxGloVPkf1KM=;
 b=TmNWGRMtoT7Jdy/hzgqNr9DWgmFuP7F1VpyWub+VMxZAZtt6EM+picI7UUu6HLw+WesihZUQjHvnS6kUpljJlpRfYxa5eK6EIWTcK5O32eTw/LS+Lxyc5uVsxryzHVRwu2nSNiHcwNrpO0AhACutK1OIAwYuiSANzI2m+oDshwq02vqFODqAnKhZEKSD3HFrdjA1vqKpx+fJaTe/4MSYp91PLJ/bA9U2+s5nco0IBkX2PyPgFlLK+++lfPjL9fK2Aj/LxNNbGXtt6sBCeCi9QrHEqARpp4rWkgcB6X/4bXyFwCaqGBvYInP3jvnno49QmvC2AkTo9xfgPM801clA3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4U4w/GZqtNTKo+LGu837g+7dHPDJy6BxGloVPkf1KM=;
 b=MHkV/QSJ3FjYFOg0jiqVLsBftn4eUuhH1sw/+tNFBqSLVtE16IlES9l7BQFKtxOJ59rd1r17Fx2OLg6cyMpdI3rVdtQlNT+oI4VsGY/I5hsBVfM3Qm7qWOpyEmPoCpuXJGMl17SPMU9r/dYugEcInx/HzRCue4NLHL89Wqzu/+s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 13:11:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 04/35] block: introduce blk_replace_bs
Date: Wed,  2 Jun 2021 16:10:37 +0300
Message-Id: <20210602131108.74979-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7170968-f49b-4b79-356b-08d925c7f074
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63767131801ED0339C39C125C13D9@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rfoClAoJg/4g3DJFhGl1GgeP7T+Y3IIggA56nm+ylqC1jYm6pO6eNRrn8yxrtHRVZv+ZkZ0moz63/2Wf2HGPr+vR/9kfryG+UgXUtOyTw47ILX7kwCqhUtnVI4RCwxK5bV9y5tjvyWb086VQ+R8Pch5MNYjlFGk3H4V1j2o0GirNfDTpzwP3lDVesJlK41X70wEAUFgKaaVHzpL+MahgoSr+0PfMo/Ck0A8i8TnccFuAEFADd8Eok0GmR/2jW4gaEp+6/JWNjYdwZRRSLotlXTLDSNc2NT372MmCylTpLJQ/2+ExIAa4IyHRhgTyt5FXkzQC1F6wGO5WvYyI6QJZQz5JtAzA1FUPsdrT1yVLTsXkM31SR89bF8lHhBoXWq6l6UCqL3gzGDRtEQirobh+avK3WfOJeeRNTm3jZuzrPXcDSGEyk/cbU6Kx1nhXJE5jql6OygS+LJiq8tEy9CVcZiAxugXWN82n4FIoA2QSNZRkXQtxRy1wB2uSyuhD8szZci/PQaKDXXjoC1xnFO7yIfKuHx5WdAW61Ey9rbDUXywp9hqtsj1pIiruz2hVK5OFAj5KPMPVI581n8gSuUQD/Xd3xUz1oHjejiymplEXedAt6nNPXe/yNR5uLlJae1WIoQh7Vaa2FTlOSplhyDQfqfnVWDGhDJ4nkTpBcrwIzDX0MPShvFQXxvYgWzGev674
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39840400004)(396003)(346002)(8936002)(66476007)(66946007)(6512007)(86362001)(1076003)(36756003)(6486002)(7416002)(956004)(2616005)(83380400001)(52116002)(38350700002)(6506007)(8676002)(5660300002)(26005)(6916009)(2906002)(16526019)(316002)(186003)(38100700002)(478600001)(4326008)(66556008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2wmfbbiTqozlciDvD71MxK7ZXJPDPTEbX93l4dc8gxpRKaWcaiwysdH+NzhX?=
 =?us-ascii?Q?/+liXR1MjWSd6g+TStQYSx7iOnYN69hc6oydV3luR20tsJGCKEDhFHn3QiTc?=
 =?us-ascii?Q?/WaYc91NBFXl7GZHZrYutcwv3aOorNRK70UnUba4RQ6Qah4KgCooRbIRR/st?=
 =?us-ascii?Q?LwLhEj22whCyYF/qKhNLd9NjcC1hwVnfVyWQVL4nRQ+DX56n2AqqQUOGhM7F?=
 =?us-ascii?Q?vDUYPX68OhwxWAXXGQd3r88pnglEAHa2OBxRnWykVPGYl8uqMA0ANMQzH+Ic?=
 =?us-ascii?Q?o32keYRcl0ke5q0Iliklpv/ngCZW7uRJs3k8epXVHEyZdXkfref0J9UgdhFJ?=
 =?us-ascii?Q?BO7feT1oudAJDaI9mOXkzlxKg3DwIpiZZOA9sisUIGXmIUCMAnFHlGfZijJY?=
 =?us-ascii?Q?BNmxWlVvSxBSdwmQysOW00xB2qM3jyOKFA5SmeXoLqMu3tQNEDFgYvNa6ldE?=
 =?us-ascii?Q?DaDE9yd6cUR8filNNe0cnSCIB4cI+KLxKv9AfLGKpj/vphDu2Sa/tnuSFon+?=
 =?us-ascii?Q?eg5Lwjqx+UKTOe6s42LvsMVauoPwkImijl/KBpE1XsPqyycwi8gGkW01KkgV?=
 =?us-ascii?Q?z+9qqWtxRY3aSsR9TKLweU1d3edhoUSpSBeNi93Q7XJ0jEmTgV+evb2lPLk8?=
 =?us-ascii?Q?m4O86MHzsFv5+chqWdCbTFZ7Utc2z/B7O6PjiQB1v2BgY12KAKug3Xl+6iza?=
 =?us-ascii?Q?//8pqiEBLY3jubYlzHSkBOngLXpcZvsiMudRaqeGF8qLu3A7TWRr4/zRlKI0?=
 =?us-ascii?Q?JUwc34TC7lT/bG/uh4OvcTYrTWX9kxKXTGvYe3aqhIYxr4kkxJ1ixFQuVL0w?=
 =?us-ascii?Q?8+TYA+RFu8MI5wROiKvDHEbeTD+E1lt4vyTrT2Pfsqc41svOTYKdvYgVGuHb?=
 =?us-ascii?Q?1XPTEi8n29eSpmCofCl3JBn9NE+ybmYooTOuo4O9S5UE8QHbjnuH3nWC2rd2?=
 =?us-ascii?Q?YqC/zKj3geArFVarp0f72y1MN+gENpS/RbwyrkxS91NFytHXfTtnoVKUpau4?=
 =?us-ascii?Q?8siLIU9hTzcKiZkmjygB+rL3rm1qKkNqi17ZcMEo7nYQtHs/NqZctP+Yjf9N?=
 =?us-ascii?Q?s/hth9get3vGJmxGZBYxEuGUJ1L+mOlEvf/HTF8JIGOoCgPCmXL3+xfo6M7U?=
 =?us-ascii?Q?GUyccvk+/3yhjlc/ICY2PQG6G1wAqCSaPMfTmx/1GMF+FkwLfHXlHEvK/8IE?=
 =?us-ascii?Q?ro+Z8kSEl8LHeatEf1aWg42erw83eV4Uiommak8UdPJZkSzX16X8olm9C6aj?=
 =?us-ascii?Q?sg0KJrIYKAMhFerqzuFfS2nULC9tuFCZ39qxrOagiP3jYClUCXX48azKmW5Y?=
 =?us-ascii?Q?LhGri5zqsjto/gSFsVhhdyZx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7170968-f49b-4b79-356b-08d925c7f074
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:31.4026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MxwMpvVBb/Jr5gI01Tb5mCkYqlTeQZuay8E3JnswIsBJPADToHH2E2etkmZwrxu5x9b3Fy2U4GBp8LAanw0pTm8sbiaDU/ojFGFxPbsuA7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.7.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Add function to change bs inside blk.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/sysemu/block-backend.h | 1 +
 block/block-backend.c          | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 5423e3d9c6..05b0ceb746 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -102,6 +102,7 @@ BlockBackend *blk_by_public(BlockBackendPublic *public);
 BlockDriverState *blk_bs(BlockBackend *blk);
 void blk_remove_bs(BlockBackend *blk);
 int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp);
+int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp);
 bool bdrv_has_blk(BlockDriverState *bs);
 bool bdrv_is_root_node(BlockDriverState *bs);
 int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
diff --git a/block/block-backend.c b/block/block-backend.c
index 15f1ea4288..8fabc1c835 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -869,6 +869,14 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
     return 0;
 }
 
+/*
+ * Change BlockDriverState associated with @blk.
+ */
+int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp)
+{
+    return bdrv_replace_child_bs(blk->root, new_bs, errp);
+}
+
 /*
  * Sets the permission bitmasks that the user of the BlockBackend needs.
  */
-- 
2.29.2


