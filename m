Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D33381932
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 15:54:03 +0200 (CEST)
Received: from localhost ([::1]:50014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhujy-0003HF-JE
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 09:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhudx-0006kG-Mo; Sat, 15 May 2021 09:47:49 -0400
Received: from mail-eopbgr70118.outbound.protection.outlook.com
 ([40.107.7.118]:8323 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhudp-0003EQ-08; Sat, 15 May 2021 09:47:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkSYbivnir163JUpq/xjiqbQJuDuZUiYomdx1umWU2CWJOkuuOZK5GUng8oXTLUky12vHtiAeZaCDeOrcDv27rXqvzeLJNC+7uC/OF6gDXQsxpcQlJwv8B9jsyibpNVpSuXbRasfrjkx4BPVZMoHIKVptDxZhUcNyxLLebVz/y6bLckhozGj3p8xftfQD1neb9YPRfgTRPJKAweZZIq5O/DvoorOsSv672qcLRd8W5nGZEARoLmjLKJfjeGrESGNZK46x4Cbn0/C76PYb/ujLlkxM7mTtgyt0QUG4SfY5NBIDPmUncq5oRG57FdukXZIkYO6nfCK4IpD8+TgEm2lGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2chjFSEtRErW6WAUBKhnMJgxnPmAuOyvObNhrz8gcs=;
 b=DNrIaP1J517eHLEVZ2jVW3fpnELuoBSvUD2iwRf5LQFsxAi2nTU3tHimrDTCDEPp+scINl7acKZYFBB0DYUjzZdyh5RrADBqwYTI25uV1MF+3V5aQHpk6HCVNwr0JdNKGpzd7v/jTJpfXq44YGczVhQDfQJLkHmGLLWj6xlPwEGtDWanvfFN6oWCnibx677JStwOC6PO9o1o8g9/pOaDA8/DGAiymXDTYkoq6Mb9oo/leBAUY1iRdU30UQ42hNOjUIE6TZb/bqHP481nQx0l5EhhS/quZoGcuiMeCes0qgTfia0hVlZfrdCzYQZDkuWjavRHJwUbvFAPSgOeop/M7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2chjFSEtRErW6WAUBKhnMJgxnPmAuOyvObNhrz8gcs=;
 b=tNqK7v/xFE3FY6xfsKS3X+L59tLlfh185DLfHpZ2H7rdIX2dTa32nZQSQS4pglcjUOI4UM9ysDeuLvQHz2cmD3JObdwvulfHiw3Uz4g8zd9bX8U7sbYt6GVBt6mP6RhiYZps73B89t5MPAV3nweduAh+n0uWzBY48+8Uo+i2wJU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5206.eurprd08.prod.outlook.com (2603:10a6:20b:e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Sat, 15 May
 2021 13:47:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.029; Sat, 15 May 2021
 13:47:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v5 3/9] block: bdrv_reopen_parse_backing(): don't check aio
 context
Date: Sat, 15 May 2021 16:46:59 +0300
Message-Id: <20210515134705.433604-4-vsementsov@virtuozzo.com>
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
 Transport; Sat, 15 May 2021 13:47:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10d5e2cc-025f-4b9a-374a-08d917a7f9b8
X-MS-TrafficTypeDiagnostic: AM6PR08MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5206B77B0154AC4C51E5DEE0C12F9@AM6PR08MB5206.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iswXzE3lykNpLr5zbE2FNXEvjKihXUaYoUxnb89B/WGEc+L5lwoZsjhV4792GlM6+TSO5+Fszing4IRyy0DsMmvR82cxWJwpoqHKalxXLiuFsy8DgXXO2CWu72eLdOvU+Qu4xozrZTfqWxWYI3RvTP7hbe1P/TA2I/mKo44xBC0KarYNJIXW0Ku6GxdRpPqj809Kw+AYEDfE4ueDpQkW8SUAPFwnymjJaIp2KnU6DtPszCHJGlT5tj10zKHYWvzKTQPlsSdWYvj9hhL9UjJvPAShbKJCSt0bubZNTibBmumrMHNDNXa5pbsVZpX9OLkHwJ7sEHSz813d0AHASVMAIKpfNtzRu/OF2oHIxqLFAMB6db4073Lra4RgVQXM/t6Y90U7yynUVs6tffPfKSjKZZWp+64tCOgzwJHw46PkkU+h+6iOp/h9Vm1/F9dCgcSJdq222LxC/n09Qdewqg0saspKWgDiO7GAzqF413E9BojB49+WuvRxXpVCPVotUTIcNF+qDsBm0BQmyTvPr96919PBye3hzbjSTyUxzHcAeNsp6GSmOcy7P4X8Z5IVH318LOxazynXdQ/LfYLr+oDg/ApJL8ii0yVI7xJjDaXZX6PxaQXoqSfOpakVdMGSJVW5+k0afD1xuWDEsnxhmacd+IVk0TodDjGGsgeo44f/MQPsFMFbDzyOZIaYhNuLY2rT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(396003)(136003)(376002)(366004)(6666004)(316002)(6512007)(26005)(66476007)(66556008)(66946007)(6916009)(2906002)(38100700002)(186003)(16526019)(478600001)(107886003)(38350700002)(956004)(52116002)(36756003)(83380400001)(2616005)(86362001)(8936002)(6506007)(1076003)(8676002)(6486002)(4326008)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DfI8S3hnQu/tVjtENwjzS8SQn4Dz34DcqLeNuRqlbyXnsDQn89PpA7+xer0V?=
 =?us-ascii?Q?CvFQdCBR+jTsMGlTEeRF+4r8Y6KsBGKOFEXYi0Wg0Bd/wXSlOiwI2vFPfexd?=
 =?us-ascii?Q?jp9VtEYSZ9oExNGRgUarb03CnfgCVElu+NzIpXoE9UVnNHncqNrEMlimsZXl?=
 =?us-ascii?Q?uQs9MuoWt9GPVFWV1n93R0OqN3vDItaEEllGbX2w0SyImRZbXZOBTrvTvsTF?=
 =?us-ascii?Q?kF0oJihn3TksdzOati1kUOQu8qEoahwRHMQe/l7In8SsxgLALHMw+DDHx4Pe?=
 =?us-ascii?Q?Vcsjn/PQjyp1TqhEzQERheZjf4yzWWZdDt0JvWceuQZ19gnVq2RwLZHWyrmp?=
 =?us-ascii?Q?RoDHl/bA/26tUjo1nzmGz9Cc3VHzap+toxzWyK8LuxLAnSrEgtFLdB6hCWEm?=
 =?us-ascii?Q?IiuboITuIE+DJDepxoDTIiaOMYMGx0N3vnKGM7sMtFXsvYc+OFHJf/ofCp02?=
 =?us-ascii?Q?QMULXoSY4li4RvP8ee0s4s4vRMOBDtonUYNvrnNZOwgeBvjcyd1xklZsyVSp?=
 =?us-ascii?Q?4CHZ84IU2dc9uENB1nmtZ0UYP7ALi/VOx6gr+31fPtHzMIZ4d8Tgt0SxbAAH?=
 =?us-ascii?Q?0TindeTtetWB+rS9LkPH8gcZjeBL6ea3yrY7rpdvVE0vi+/qUUoN3gYfYByu?=
 =?us-ascii?Q?BOYBkpMkvQg2DopGoVYrxdsyOkPz72Ju/Tb1nnbR5g3KuA1fys6SC/ZOzXMm?=
 =?us-ascii?Q?TngYWhtnfCAgeJaGcA0Tyo6/oJA+8IN/gjHdpHLTBLnnj5kfR6aYoMJ4whW3?=
 =?us-ascii?Q?XmCXD2HnA3077k0+UYmckXYKMRTbVhNeWY7Ef7Mh7tpZ1Hf/mpv+H5FNEh5z?=
 =?us-ascii?Q?DjOkFcSZAk3pHcED4THyy3g0fp2h6dOPWrTpdGu9D9zvCcvDIfyF8P1CJyUc?=
 =?us-ascii?Q?NlSdWG3Fx/Mku67rMESUMJ2gI1TF24VvPb2eBUsBP+75ltWz+mrwQZWAdPDP?=
 =?us-ascii?Q?SagM/RZ2LNTwEbW8Go7JqKv86xhjft6s/PXoCKpPWbWa4INWrbpRfUt4mHRQ?=
 =?us-ascii?Q?BsqGxUK1Ktq7WnOmCJe9gbMNvhRtsBnfSTWNgKDAnlzGlpYAGjgGYh06jvb4?=
 =?us-ascii?Q?S0E64K4YcEIoy7TdU0uEhEi3Ve9VbG0P+clltn+jUmAgEeibhS3gP1ixbn1F?=
 =?us-ascii?Q?VJcbOHrBVdMaOSZqVaENTOzPAxOh9uQdtsrXPlT0RgJ1Pvp+2mw7ORs521+Y?=
 =?us-ascii?Q?vfx3ARW6OEw8gVZn45593Br+sC8krXcmvswvUTeDMeOXTyayj0bjOdnYVeOg?=
 =?us-ascii?Q?RTsDw83XkYlHXUNw8iR3Ff19KoYRs/v8x20ImcRvjRYDf33po2lEL7UoKZEU?=
 =?us-ascii?Q?EsbQOHDY7xtlmZyW2OMsgBpI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d5e2cc-025f-4b9a-374a-08d917a7f9b8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2021 13:47:26.7427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dScPFQVKyHk662puHAMG+hgW5gp3xCR3s5HTC7N3R9HQ99lFIgQ2dPTw4K93b7BneIqdm6I34E+mmQL89mHfgA8iTaVzrHycz5jIsUhlBgE=
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

We don't need this check: bdrv_set_backing_noperm() will do it anyway
(actually in bdrv_attach_child_common()).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/block.c b/block.c
index 5141c04815..4e18bc3177 100644
--- a/block.c
+++ b/block.c
@@ -4190,29 +4190,6 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
     return ret;
 }
 
-static bool bdrv_reopen_can_attach(BlockDriverState *parent,
-                                   BdrvChild *child,
-                                   BlockDriverState *new_child,
-                                   Error **errp)
-{
-    AioContext *parent_ctx = bdrv_get_aio_context(parent);
-    AioContext *child_ctx = bdrv_get_aio_context(new_child);
-    GSList *ignore;
-    bool ret;
-
-    ignore = g_slist_prepend(NULL, child);
-    ret = bdrv_can_set_aio_context(new_child, parent_ctx, &ignore, NULL);
-    g_slist_free(ignore);
-    if (ret) {
-        return ret;
-    }
-
-    ignore = g_slist_prepend(NULL, child);
-    ret = bdrv_can_set_aio_context(parent, child_ctx, &ignore, errp);
-    g_slist_free(ignore);
-    return ret;
-}
-
 /*
  * Take a BDRVReopenState and check if the value of 'backing' in the
  * reopen_state->options QDict is valid or not.
@@ -4264,16 +4241,6 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
         g_assert_not_reached();
     }
 
-    /*
-     * Check AioContext compatibility so that the bdrv_set_backing_hd() call in
-     * bdrv_reopen_commit() won't fail.
-     */
-    if (new_backing_bs) {
-        if (!bdrv_reopen_can_attach(bs, bs->backing, new_backing_bs, errp)) {
-            return -EINVAL;
-        }
-    }
-
     /*
      * Ensure that @bs can really handle backing files, because we are
      * about to give it one (or swap the existing one)
-- 
2.29.2


