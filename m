Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7443A2B2A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:12:06 +0200 (CEST)
Received: from localhost ([::1]:60182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJXZ-0006TR-Hb
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRp-00028r-5I; Thu, 10 Jun 2021 08:06:09 -0400
Received: from mail-eopbgr80125.outbound.protection.outlook.com
 ([40.107.8.125]:56129 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrJRm-0004D6-G9; Thu, 10 Jun 2021 08:06:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgiWAP/JCEgAGqcA95Lfk9gsBYNxRD9QbFu+fDRWmwK0T0r28WInal8Fo31rz2jyrmxAGMhESW5VVgeXqwd0xv1W2ik+7TUC7xnIxSsmOpVKKsVjnQWAK0+BYGbZpKBe2lCrivC3HErnhHQReMFmrH6dZ5lQ8rABEuwIXMsV1EIhiPoD6wQRaG42lCGsAYUgA/7/gxOD7Bex0qt7ROj/PTAUTaLqSwC0EmwlB7n6lcPZ1WwtLwGDAbeX6vam687YDZbwuhUEjy2G78CZSy9fkG7q4ckuJ48PQBByAiT8fMDcKGQGlApNrdbdU2ASH1AJOpgplQGPj88MRsQDUbfpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0h2qZiQe70wxQbc8p/7oGmG3rv1djzbseL5Xp5NChVs=;
 b=ILgN45Z7NSbTs1L0bL+x231zJdsJsgvdnDnJkZQR56YO8Gpb0NvOxwxSb0IWqHAYCXCvqMwd/n8lc2m/LRB5VrEhhKL8CRZkmpBoWjGr9ezvZOrIdcEwkqzck8hECiZqzLy6+xRKljbK45PNdlk38Q/KDynmvgMjl6nWvZQ7UypgUKpCHNP4sVMTH+/bCJ6HKb5uwrgIwJlpBbw+O4bL+HwsRADpb1g17LSQ9/t9ZKzNnRKSuRNwvbugFtHr9HCF3J6lNm6eCNK6x8G6vBAAOLdwqEXr9iLZVmOBqdE4NiWGGyQt1cRpbCEku9Ja6yg0Ixby1ZODut5n67L369hkVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0h2qZiQe70wxQbc8p/7oGmG3rv1djzbseL5Xp5NChVs=;
 b=mmA4FfsMZSNbhG8gMUxwrVMwFvF8IQXGjt3G6LGG/MgCmvCB0a/hOfzT5kH16gvodyT4gPXUngpwKB0P3vsC7/iXvhHv7pSjfPQTvp82lJ5K4RdXqgFOM5GYbEfHVBz1zbSepZTWgUMPRqS4IW9Wuj0kdbE+EhzSnr0en5/nhsU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4277.eurprd08.prod.outlook.com (2603:10a6:20b:bd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Thu, 10 Jun
 2021 12:05:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 12:05:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v6 3/9] block: bdrv_reopen_parse_backing(): don't check aio
 context
Date: Thu, 10 Jun 2021 15:05:31 +0300
Message-Id: <20210610120537.196183-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610120537.196183-1-vsementsov@virtuozzo.com>
References: <20210610120537.196183-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0802CA0005.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0802CA0005.eurprd08.prod.outlook.com (2603:10a6:3:bd::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 12:05:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ef95f59-5bcb-41a3-afdc-08d92c081a00
X-MS-TrafficTypeDiagnostic: AM6PR08MB4277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4277A1151B626F64837C970BC1359@AM6PR08MB4277.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4KW01GpHPVLdyMXSA4W5y8Cx2W1sDE08sQWILXzpY4TE/OidwfZrXxLwtZs6kLMuybx4/frMLgHslyVHAEtvd2J2SfXBZBkCAox7JWaOxu6EfBIDBDAdsj55jphaKQf5AwpWphdMKMNRmM71uYf1tdSwyEBqu14nKUTM4Curo+SSwnxlR7FE5LK6MAALmwaEiNVPmCdoELDDgLS9WJlRpkrK2gBCbNuq+DOqzxa8gE0S4Jkvb7Q2HefGrjYBF7C9ZgVU5btPM2pVveyEEvq8FntCgeXvT2Z9V3SuiW4tSsEiGRBTaZmYV36vQpUdhJtyURxmu2zdj04KjzNyzgpNWBgHmhtloHiMTwZMSSWYAoMsgXaWCpwvKP2nSM3hZeHHN67OuwNZcRBlmv2ScPbN/g9IUeotD5jBh+JcI+W/CLegPIa5Xd+KC1xeOeoSKoUF5xz554uaondtrt121k0v0UWvfboUeoljmYqaqofAw5lNDirvPTDEsqYizLtQ0MMdWBkds898botwyt3Pt88gx+O5QpStRHNSXoFKWOvLTSlvPRBWXZOBLJNThwVGr4A9WFSjIv3yDkyo+hMhcpRRtibs+tkKlSL98woKI6aS9IuZ4d571+TGs3XNwmQSYSAd8V2KxA6Ieiowlj32YSTzrov8EbHphuSYdzmIr86d5qexyxMFsqo+ARA1upeUhPNE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(396003)(136003)(956004)(6486002)(2616005)(6916009)(6666004)(186003)(478600001)(2906002)(5660300002)(38100700002)(36756003)(107886003)(8936002)(26005)(16526019)(6512007)(38350700002)(86362001)(1076003)(6506007)(66556008)(66476007)(66946007)(316002)(8676002)(52116002)(4326008)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DjawqiLWe/xH6M7VAw9UWKbigHHX3l1SJJJk2uVCpzyt1xJ4BSM2iu/2YtG3?=
 =?us-ascii?Q?VXBqseYlKtW/GSWdSRE8YLYhrPWnrg+dD80eDzrG6iJvCRYAZCCI8V/Tz9EI?=
 =?us-ascii?Q?x466VXDNUY2gLpNQK0MH9DqrWs9CVCBJZEGmco7EnTRCgcK4D640FiJ9VrZQ?=
 =?us-ascii?Q?4MD5XOiXBL317OdJa57INp9WS6UWQ1ow7iIBUHK+IeKuX+AVZmhxhPxjb/Kp?=
 =?us-ascii?Q?m9fMe9qnylXgIB6TiDKv9JTNwVm8IvVbQs9TuDxoqOX6H9gunL4otHzB2CQi?=
 =?us-ascii?Q?gCbbiMmHOIROuYvUoqRd28wElK+3shl9BddmRMto2aR2+l6AASC4Ob0BhTTX?=
 =?us-ascii?Q?46zQOjnHzPMSeDEncWK9npe+Js6aSUPMBCV/iWjxC/t7QNZbY1Op3PK2qh3G?=
 =?us-ascii?Q?HTAZ4tLbicM6Vl3LenL+YCcXCmDQYSKItVjdosp2rGBwY5XtFZQzLMo/B6MO?=
 =?us-ascii?Q?grb9ypbdn2gB+VsVGD0cbRHfMuTLLV3x0WrhEP/MspY5oH+V9EQaD6u0ep4O?=
 =?us-ascii?Q?LPfANrheG4ZKqOycNId9FvWj2Rci3uBgVrwevHpGyFj9gri05oOHR2mBouJ+?=
 =?us-ascii?Q?6s/wb++YJfwIlY9v2aq5vaLiVxd5+5ckq+gyleAs6sguJdn9kqFSxPqUvqay?=
 =?us-ascii?Q?wVTIcJDvEUKck8h2mKkXdmFJxGflUG/n/5O842EOhsR263gpEVa4/G9+ExE7?=
 =?us-ascii?Q?rNHZmto/+o4w50WW0+aHl8OoZ3Oe+0iXY/uXD1YHKAWlr6LbBt14O8/5KwJY?=
 =?us-ascii?Q?PHlUOfbLPLxkhyGtvc1HR6yBHpoes6ChmGisVHOMWU+4IIgeXM2l6ztlgYj2?=
 =?us-ascii?Q?e85781zk8kwTc2RuKqBHG4sP67cXllRL3//s4Myd11lsvNq5Mh7UV+yc6DGk?=
 =?us-ascii?Q?KGVxq/JicA91qyg3hMQ+Nc6j/ZFA0p7rlHVJMjuXIpN+J8fcaQOEMZ1gjqs4?=
 =?us-ascii?Q?SLBl0mlaUE2gWqZdDWLKs9zazbw+oUMMveaKlG0iNGHO1W4vH/I7rgfZh/4N?=
 =?us-ascii?Q?yhfzLFroo7NvMODFEzwJdRaRAd2ROucc52wJ5NNJlppYlsMlzcvRApk8IXGq?=
 =?us-ascii?Q?jkOV5cizRCWCmqzud+CmgT9X9J9V5fYeAM4IRJJQ1ujeX8vQwVqbcSFz8Q1D?=
 =?us-ascii?Q?/2UVGeyJ/cz/DAEzj1OhfuWRJJiD8SD5YkMqCNdgbYGpMzRMHL88olqHm4aw?=
 =?us-ascii?Q?uK0MvdMrTfvjW93x4YPA3D96etGWMh/j6wN09O6aTS/8u/nlQtKqk3k9Y9MN?=
 =?us-ascii?Q?YEOHvVUz2iNZ5zDn6Ekd3I2ODp0sDsnxETjdVSfAA/eiLcRP4FFxy0yrfaHK?=
 =?us-ascii?Q?8v5luvT1AOQmC+aJc9Pn14G1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef95f59-5bcb-41a3-afdc-08d92c081a00
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:05:55.8603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3sC+7NvO5QJ8spNAVNoNOq5nIBHGvCK1GHW2shV/laXjvu4B5y+8PKB/0CerSAxgJsVt/h96sFP7NYuYWxhivLX2pnGkKWcRbCZqi0Y2vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4277
Received-SPF: pass client-ip=40.107.8.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
index 89c61fe93d..68ac99f2bd 100644
--- a/block.c
+++ b/block.c
@@ -4215,29 +4215,6 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
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
@@ -4289,16 +4266,6 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
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


