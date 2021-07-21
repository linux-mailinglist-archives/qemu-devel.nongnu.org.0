Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DFB3D0C5B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:19:45 +0200 (CEST)
Received: from localhost ([::1]:50152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69KK-00009Z-Ti
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697O-0006sm-Tc; Wed, 21 Jul 2021 06:06:22 -0400
Received: from mail-db8eur05on2124.outbound.protection.outlook.com
 ([40.107.20.124]:45473 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697N-0001sc-5K; Wed, 21 Jul 2021 06:06:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQKZX3KQbtQGZU1xgONLJx7pgI6IuGu30UrzRR6Gb5U53xqCxD4bpkPikpUWfb4vpDE2lmDE2iVXhn2H4Uy5ufmqUsFYhMZmUsXs15nTdTulyLQZcG2KAlAgCTstUba+xIqPzf022IMwJldiU3AACvWdwsKgegqGqovQJQDKfgXZpNkG9rhHGWl+RYIgwzCMP3qx0r+oeZeeknhb/Tot+3SBPpyAAFqu7Yz0xl4cErmqG1inrX5siKVu/pr+bursfUONEYjj1AbCUdJjvM+SwhwmmibR2haAWzvCmO27qmNbjfbacrOPXyXaBW+P6zWljWdSmhE6kmBqzFDb5eyeQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GmJJP2me1hAQJQvNuKG3Yp1F2STkJylbpXCBY/QG70=;
 b=m++0lCs1Oav35gasdj4WB6A4UD7By7Y7oSDYxpN40WuuL49w63memZ7psLXZ49oFwv7aPwBRW1bkj4ss0IlcO7giNx9ydxGRDhcDWaO8hCrVIihFKdCnET3X7pbafWNxf2L70ophhOD3UvaVG2kgTCdFMpphTpodEuGlN8EJZoUqjlIW+915savxxZbXmE8H6K1y3e+0hbZR9wce1LWwAKNSkc7+67sxsvSFsFwzmIoEMQFCXCtNhED/KqxTrK5qCe9W6KMCJmynzGRkPVVaTPTABGlaz2HsZ98bf7WyKRAxEKeTgZYAEzgImJDzvDD1c4GATB0ess0ruXXcOjKFpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GmJJP2me1hAQJQvNuKG3Yp1F2STkJylbpXCBY/QG70=;
 b=eRx6wHni+Cacc2C9eK/kbL4aHwdi635xWdVLMqcQilG+cLlVIBX+RNMz94BDCtdlW2wgh3LtepIym63dCKr8ivyLW+KtNd5Ons4YM2JUCExD/JCQmseq2pbD2VdRFPXD8RtJVb47vMCjrte9OyBMF89Usvo6HYSYH0Cgn/d1GOw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4168.eurprd08.prod.outlook.com (2603:10a6:20b:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.28; Wed, 21 Jul
 2021 10:06:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 02/33] block: introduce blk_replace_bs
Date: Wed, 21 Jul 2021 13:05:24 +0300
Message-Id: <20210721100555.45594-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3925385-9907-4547-5318-08d94c2f2b75
X-MS-TrafficTypeDiagnostic: AM6PR08MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4168941351BFAFD3FD8E3375C1E39@AM6PR08MB4168.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m7QQXuJsPqgIjGYVZ47RNqtaz0Lq/1lm1SHQ84XTH87cAISbuAa5izgHAGFNzJFrTqq+gUEd/45fTkhtnxIEdHnpqB8dc5TmxWI/IOek1J4KIcLRGms99yIR9+TgmfCHz3k9bPx62ty4dfFltTlEFo6QVSZz2MthMDGtxdr32axU+NQ9PL5RHO7EXlJpYSwN9tz4RWtaLwmXbWU9fzYDiPEOpm6L9mpNcuEtYNiXpXb8hktpqcB7ITDZe7bMviGxZpnC/iXqaTDvAU2g5OT8fCr6rPk15LKonEn1qe8BACgnbSCJS/1dulapMl1vJ/pVDaoA6uILc7Fr6sprvPnZqmEbANnnn+kFntUMdYy2KGCY96tiHWbz95I1Innh4BTTmKg000pjPCYJ0CBQm0rOhhAmQDqhdM5zNhQQJFoqHrCVbrugyV+51jqiJRGsaFdCznlUMIo7mkfbyUhDrQTHmt9ws4aBozGNABg/9kvn5EdLnaoTvq98nkpqpn6xwD2cOgijBzgv4yQP+tbjezfpZdntrGV6YHnJIPBtW9t5pJ7kT2oOPzlwa4EEu4pvEOTNr/7jhUxJhJqjW5H52Xm4RI6tzb09CdefKtOsnfmwlgTOZgmisV8h40K0eqNi5nQd25wfvixgKMXWvLMYUnyJT8V/K4eVRa3UTjLNMEnAxvpE3r4Y9ZDEBq+VcKpBMKbdiNDkk9rBHTOOER+zJFqT+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(136003)(366004)(346002)(376002)(6916009)(83380400001)(86362001)(26005)(186003)(36756003)(2906002)(8676002)(6512007)(956004)(2616005)(6666004)(4326008)(66476007)(316002)(38350700002)(66556008)(38100700002)(6486002)(5660300002)(6506007)(66946007)(7416002)(1076003)(478600001)(8936002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7xmEgjptoJQZeqjwgGCtB9L4aVFIKipoq2VKZdrbYXm3dC6lHtfSL1k7YNXo?=
 =?us-ascii?Q?diy3WtFQB0d+nVluFW/NpF/nz2IKFHiIFnX5XuuTTU4/KRSLALHONp3gdu9k?=
 =?us-ascii?Q?3BddMQCA3Y7LRdy5ORbnMNXuat2RnqYy+8nW29XCS14/+De/uddWuYt2CrV5?=
 =?us-ascii?Q?ejtyJ6LUBXdFB0FtVI4lvwvGjCJNV/smqL6E+Y87E7jmm6VSyV8IAm5XDzhc?=
 =?us-ascii?Q?RXcuQh4B95wx+40sNrXTZHkL8Q813s974Y0AuVOILN6oYNH75mmv3MI9Wc7C?=
 =?us-ascii?Q?cZTwp179iDP76EWneO6pdC1edoTSMQAaxolHBzLLkjT3eR5WRhFsFOjbbpUX?=
 =?us-ascii?Q?thOXOz7pbe2vJpgDzC44qaPSPJbeusnkkvhG73XhCNj0WeAU2NQMIFUw0j62?=
 =?us-ascii?Q?06Oz3h33ZaYRz+izyjdROKgdbcxwF4c/J0g16XSj3HFBxfcuUewCiAwOVLim?=
 =?us-ascii?Q?ZdP2Ba95mOMBQfaVk2H90Wuaj/GFrPIJXK2FPepSo/tiYvXv5OQKKjoowcC3?=
 =?us-ascii?Q?r2H7uoeKINcnTW4mWLySznUsVNbX8FxwN9kNLYU2Bte+QSokBysUJrIVDf6d?=
 =?us-ascii?Q?Ceg0ssD8oxwBhifeuXqHHJYFis+kbSQaCmT/vhNkd2p4t3NMOo6ViavHoVBi?=
 =?us-ascii?Q?pKPy0vC0U52dFpI7PJC5ssOz/jcohvOYxg2IU38EgzuKvF9YBWPZs1acDNIn?=
 =?us-ascii?Q?e14aiPpO7D2D4iRovSLpibiL1a6Krew91wkeoRJaLq3eS+q3QpkvV5F4RlXc?=
 =?us-ascii?Q?8ha9vge+qQ31nQPzkE4+690TWiny5JJVah36c8LPL5jxkl6BH7RxbKFKECqA?=
 =?us-ascii?Q?Hiqsi1ScgLWqwLj2pdamcoVJJv04j77DbBMndk7o8o0DeBr7LSBE2xAmYSoY?=
 =?us-ascii?Q?w+6zK4rQqweOnBZcyj9OB4IerSfnfxAOpg3eZsk8tBsBfEpqtcPA9Ovtjf0M?=
 =?us-ascii?Q?5K7FRmjDOrUGenT4bXXmznMrM1e/B0P/Z6yCtXROZJNXnAf9uJ/FxsM7QFCB?=
 =?us-ascii?Q?zQmmKaHdeAxvAlImaKb0iFK/0cw/rBYsAmwvd0U9f4+QiZyU9A1O8kPlhKt+?=
 =?us-ascii?Q?r0Bvgo2q8WpJXVcJM04euRmhjiTqRMbwqQ3aF8uEUibrmPFELRDeWNOShmV5?=
 =?us-ascii?Q?1ncje4ceo5Xd+iEyogyX8JFkVFV9aKdGCoVVWvPAoZB0rs4A/nUpxKFeAy4U?=
 =?us-ascii?Q?OlXbdxcEd6CHdefYEBt2bDOrlVzbMiJKDFFrxUQX7os0Se58t7Pc/XSvqIec?=
 =?us-ascii?Q?Fgf/8NxjIvc4vitWCD/ihm67HTGLcx9vEBZRt/ZNeYh4Pyc88o1EwaD9YUmm?=
 =?us-ascii?Q?UjlPueGb65UpdxYM2tncLknX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3925385-9907-4547-5318-08d94c2f2b75
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:12.7004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdOrGvP3KCH6tp29+CJvXz9RnQRtGJqVPF1WaOCow0AW+AIO4biFbY3rS9wBdRitF3/VnYL6xoTNH1vo6GQBXNT0xED1YPAwKMozJY73Jms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4168
Received-SPF: pass client-ip=40.107.20.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Add function to change bs inside blk.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/sysemu/block-backend.h | 1 +
 block/block-backend.c          | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 9ac5f7bbd3..29d4fdbf63 100644
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
index deb55c272e..6140d133e2 100644
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


