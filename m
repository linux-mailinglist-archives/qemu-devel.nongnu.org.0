Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873FC3F5A13
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:47:11 +0200 (CEST)
Received: from localhost ([::1]:44960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIS5O-00024E-BE
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyJ-0002jN-0u; Tue, 24 Aug 2021 04:39:52 -0400
Received: from mail-db8eur05on2134.outbound.protection.outlook.com
 ([40.107.20.134]:13121 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyG-0007US-Ly; Tue, 24 Aug 2021 04:39:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFK7SX+SlLQe+k8EObuUOSt2XUdwnuMBPNun1Fc3qvNeni1eOaev4NlItr7TrXd7lGyDmBB505KvlhCcBKW7oVroDBjOEdH4kLTAZuXBpS6o2u8KiMVjVAuwrkeEEa2X1vUtfrDT62wp0btai1crFiairBM0kmcC67jTRfc92MxsCCp1sR/TmSUhjVu9JsT2AHa85JHmJpVKeGuVSlBbOJrSoOKcoR3Ydjk6njMHf8neJlpylJbrdG5RwnqYZDa28R9hkKSTHyfNiQs9g4sUgiGtzGaTqz23xVkNdp9tMnpWNpPSQwq+sRXw02rjE0NU2JRKj5UgGjCfg0WlRUL4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6nSqQ8glRSbCauI3uUt4rS18W8WqtO0o2GDIenmgro=;
 b=U4Jzz8ObaoCWURnEKGZS0VgD+lgIXjHMFqlK628mISnsycgWuglt6Eqa6qjWKlXRSMIRntGPbrBNidnXBc6iSBIn1d3MhS+wuVx0cOvgFsOXhdy9/eGqPHOUR6id3eeg7vQ13MHS9egD0Rqzqx62Gjd7WVABlRIuWwgub1l/5TY0/l6w66ldnLPoNJHNA1j74Dqa06tIjyICzEvzBqnbtlgqcWTiQs4yXURLRtrgoogCjTzO8PsHaNriVvIGm6LoiZgK+9PVI/RS483Alb3ZWMhmYqoW0v8mi+gzPRRUoRvOiKQ7mS6IAeX31eqYI62MJ5Gj08V/nqSq0bZw8toeng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6nSqQ8glRSbCauI3uUt4rS18W8WqtO0o2GDIenmgro=;
 b=YzJ4FLpxo4yw2XaNuqdvdaRlX9ZPs3JEsRj1ZNrmWVLdPdy2GoPzuq7+LSsVESqt2Duk2+v+SJ1V1RktAmEog4zut+WNG9j2eFkKQI53DmjMZ4iWEwXcXsJB0aLZg+mq9ALlrhzI0ZocxLHOGMI1Cpec33GRT0jc2GPa7q9R9Kc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 15/34] block/copy-before-write: cbw_init(): rename variables
Date: Tue, 24 Aug 2021 11:38:37 +0300
Message-Id: <20210824083856.17408-16-vsementsov@virtuozzo.com>
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
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95c5e15c-973e-44dd-fcb3-08d966dab562
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5333E868A70B417489B15BE5C1C59@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JL+/KSaX5LQRqBkTAXIO2CoS7fe6yCTf0cv5wi10VPMF0xcge6dnhIKi/eZsg1BVcqjqe6XB/szV1/sl2IkeC2aryAr5tXaPCzRkwVs9v8M76lVOJq/sQ/2I3m3j45/fo/d9qdcnNrra1miOLpwh/jCB8H/wM2dyAI2mJRoJLsKbNrKrgUOV4bYaIL4/O6BTGfN6w/rPYiHXs57bCq3s9bPudbkcdYsO98faDDQNnh9CDjQ06apDWuZUSUavGh5PFuZLox/VgFCOKW6y7N69+vhxN0p6bRjFAK9ujykLL4mfoTEBGeL5q8GpqNGst7cd+u7GryCvrFH8iPewLZfaDRJYNZlEIVjl8KA5B60hhDrdOr/beSgzce4PWbzWMeFDtNoIaL6iyp8lGJB+hto21OI+uwmvZOw4th8OgtBIAIzx+6AJj2CQmlcLa0zGfsGtbdDGS2oTRsbZeDDP3QMxEmH4USqAs+iUpb2Ihut6+EL0iOBodIh8J4U9QwgYNCZVe5cy8S98E9t/lbiQ7mAw0WVWfv3EKNT8+O/hJrJWitjJJqPvGmzHgDVP7yM+2TVtpjh1z6p3yUaqtq6/8kNWicIMg/CEEakJi6iK/1NHBpyv+yRWvitVTeMlNAjLNiV/hhEobybLostxpFs6I36u577mWtX0xdgHRNTcwUaFlQbYroQphROjeqwuGA9SXWSOUJnxhU3jO0CpLEPfY23O1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(38100700002)(8676002)(4326008)(86362001)(52116002)(38350700002)(83380400001)(7416002)(8936002)(6916009)(5660300002)(478600001)(26005)(1076003)(6506007)(6512007)(186003)(2616005)(66556008)(36756003)(66476007)(66946007)(956004)(316002)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YuCBZAH3fEoH22kd4FHjLP5ig2q4iN21zYYJam0JZxHI+DipiH8pAoBNVTYJ?=
 =?us-ascii?Q?OW6J7UzZDs35FyrbTYG+Q2RERH2chm1PKBvtAj1kCPF7eLKt/2tnOTTI0mu7?=
 =?us-ascii?Q?ZcaXe6UKWuRIPhBHZTq/Ut97V4DOjpT1jcLzwPWCRSAuDgYOlzUJNzvUMbxC?=
 =?us-ascii?Q?WBSgHta2aHJ6rqoXEh7w8WGvmygik9qpRWqBGMHi995SosT8d91e0DgjXC3j?=
 =?us-ascii?Q?UGoUrc/8fTzyyIXkVZXmANQdnfA52wgf68AkIInIqg/sWQl/bqZsZQ4TxEzv?=
 =?us-ascii?Q?aPiY0/w7VVAGpA/q6VFxYNtOHf4hTSozYJMoEQJY6DYDZdAYn8+aq3D8acyF?=
 =?us-ascii?Q?b7j8K0f2tyDo+NH6V8NDYeBLtYpsxKglhKdfeTNAe91ywSujR5HKPMC86g1z?=
 =?us-ascii?Q?Du8NCirFaE4o1THu6f1i1x+exc30qMpQPlCu6mSBqlOWnb1qkngpm3hbl7KD?=
 =?us-ascii?Q?dX8o6QqL4ODNHk4cBbUEJdlxTSPfarjqgDT+E+PnQhpVD9bYGSsF1h4H6MW8?=
 =?us-ascii?Q?OIfZQFCwZX46hQ22ConHz7qeOJ6gCgNSMaxvLjoKvDARrXzSitMloBFYiLIr?=
 =?us-ascii?Q?mYLCUkpmt68ZaL5pbzb35wIMmHCo14PlCV25veCmA8ovfwwwTr9+s/uc5xhn?=
 =?us-ascii?Q?+SIlirishAmuaGJHJmlHxvq1y602mL/VGkYNvbOXmairMFY2kyeRPR41gN6L?=
 =?us-ascii?Q?2OqUIkYPMe8PAEQCGyMpvLWJh8Bo00Xeucdiwl3ANCkzK/O06+6fFiI1bbzA?=
 =?us-ascii?Q?1IdflqgUWjsBMvPu0tKSd/CAs4p04xaNuWtvoWPK3HJxoWSL0CoheYBK8jU5?=
 =?us-ascii?Q?kXztPGiQAAi0dHV4U2lajnDJUKJp0v0lM4NKlJEwUpLJNEEV9e8e5tNxPkFn?=
 =?us-ascii?Q?ZTwniNBKzanMrgIo17Eo5KKBvE1HfpIktRtwKJEd5FHuyV/DvSZXcYFb3YFR?=
 =?us-ascii?Q?3yYgKY67tdvwSSZxWwmxbV/lYx/hqS8RFqlR8qy3qkjodv6W2bTP4OcTj6Y7?=
 =?us-ascii?Q?ZdyrfE2c6kD17Uj26JabxN1IdA3F0DUlfsrHMuf8eKnJWyNJtXNk+y+MCLP8?=
 =?us-ascii?Q?9z1hDK8gmFPfRbWy953qhlmx77nTBMQKar9pgKf6V+xj3M7e/Mfpn9OsBIVj?=
 =?us-ascii?Q?jhkpkXSwgFRlCOjzannr1kS0HttExAZUr9kJhDZ1EN2JYzBtItgbZEOhiNng?=
 =?us-ascii?Q?zwxrabkY392AiXWkG0Vmwko5JGqkIzN/fRrnsOnXlMarjq/rv7tjPYWAiLfR?=
 =?us-ascii?Q?7BylfbMxqPJ8a3HzdS13PQIMxQc/gs9LqPwBGMoQuLIg/zShIjnT/WqeA32T?=
 =?us-ascii?Q?ALl0fwXarr1hcrcTwJsu/ZRC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c5e15c-973e-44dd-fcb3-08d966dab562
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:38.2987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msHvr9dC0a8XMbJACgJKVNFXm3ZniJfb9mvfxpbnddiRvbGBBeRH/EKCkLOp29n4J4q6xB+zj5oAcvMzHzjmXfzhR5skHvcdccMaQXP/jnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.20.134;
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

One more step closer to real .bdrv_open() handler: use more usual names
for bs being initialized and its state.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index a4fee645fd..d7f1833efa 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,38 +144,37 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *top, BlockDriverState *source,
+static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
                     BlockDriverState *target, bool compress, Error **errp)
 {
-    BDRVCopyBeforeWriteState *state = top->opaque;
+    BDRVCopyBeforeWriteState *s = bs->opaque;
 
-    top->total_sectors = source->total_sectors;
-    top->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
+    bs->total_sectors = source->total_sectors;
+    bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
             (BDRV_REQ_FUA & source->supported_write_flags);
-    top->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
+    bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              source->supported_zero_flags);
 
     bdrv_ref(target);
-    state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
-                                      BDRV_CHILD_DATA, errp);
-    if (!state->target) {
+    s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
+                                  BDRV_CHILD_DATA, errp);
+    if (!s->target) {
         error_prepend(errp, "Cannot attach target child: ");
         return -EINVAL;
     }
 
     bdrv_ref(source);
-    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
-                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                  errp);
-    if (!top->file) {
+    bs->file = bdrv_attach_child(bs, source, "file", &child_of_bds,
+                                 BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                 errp);
+    if (!bs->file) {
         error_prepend(errp, "Cannot attach file child: ");
         return -EINVAL;
     }
 
-    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
-                                      errp);
-    if (!state->bcs) {
+    s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
+    if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
     }
-- 
2.29.2


