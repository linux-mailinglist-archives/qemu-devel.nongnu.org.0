Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B02A3824D2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:54:58 +0200 (CEST)
Received: from localhost ([::1]:51422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liX9V-00012L-5T
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0W-0004EN-Ji; Mon, 17 May 2021 02:45:40 -0400
Received: from mail-vi1eur05on2135.outbound.protection.outlook.com
 ([40.107.21.135]:63681 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX0O-0001xR-CS; Mon, 17 May 2021 02:45:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xk3HlxECBa7HtKo5Re7dnAR3yPVa0N7NStHCCN0GcdcoknyabpTS8aonfo3m/7UXtOZgbJV/yQWCHUIu32FQcrHuLUwUwiERV0WxCEhcq3jLvakxOTI5c5Yz2fHhCSu9ZvNjwzVqDbKbWbbwYo5WXUELNv5Fyx7FIQ1NVYjbreSSpJRiPm6zXgCy+15rcRxJAaPw8Euo3EvfriKICl6hzHe1C59uNkybmB8NqugKFTe/lgnWx+NddzPNBjTo9jrmVXLpkH1kDQt1XmXJt1M7OfVhShbCamxd6iCbFcyHnlEDXaVcULZrWtfAmwA6ORfHI3BHyZkVvRAYkxz4ZI1Lpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSG4v5OUYaty7Z3oOi8knnlpDSoJWEhCNphNT7OTOco=;
 b=eEgHGI6qOL/8dwYM3lR2Np+FLLGaVbiClq7QEwW0nBjFEBrpf0oFNMnFpETdbfjhXBUqrdcQ4mMzUL5JMbB9oOE/C1lKL58g4xB+8Te8+woGOt0MfmXoJnDEjgnfb+Yej5szCHb6G3pJW00IKTN2TDjq0ri6EnHhhmR1H3t6a471giXmlqWF7aS4DMxb4weJL3VOe5wT01EXVWEj+jrleaVqjP/uQETLyVOYdHOO4zwwCjW6L7w/GnkSTj0VeUBLv9Z1eCo0IqpbitIomhp0+d/9v0m32GZarPLvraYGuRvSpOy/dtK4+YbImVrEtvdom43xnEPr/4B2rmDMrdidOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSG4v5OUYaty7Z3oOi8knnlpDSoJWEhCNphNT7OTOco=;
 b=q1yrn0gEEQj01+zKHzi8YnJXvvYXVlW111FEK8gqJuozwP5X5X/jByg3jFH4GvhYzjae+6sz259tuWl3kfQJEWMukiRY1QxTsmE/2NVTBvEMOSPZH7wv7TczPdMhYfj2W+ciPYUvL8ljCKS5JAB2BTMeJp7xtWM/NoYOVGwehV8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4341.eurprd08.prod.outlook.com (2603:10a6:20b:b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 06:45:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:45:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 16/21] block/copy-before-write: cbw_init(): use options
Date: Mon, 17 May 2021 09:44:23 +0300
Message-Id: <20210517064428.16223-18-vsementsov@virtuozzo.com>
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
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:45:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 566e26cf-1466-40e9-22b7-08d918ff4f11
X-MS-TrafficTypeDiagnostic: AM6PR08MB4341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4341B32E5C7D666105B10884C12D9@AM6PR08MB4341.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:210;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UBLqseh+YFlaaDIM7RqcUpMjo1sXkUPhr5SS01SKI4j0to27wPSBwTnaDSdDcbfZhyIp6xvrWYgdhxQZVfnzvklnZZ/YPpNNBKLYOVwD4gcsFYqDU9RIzVuXzkW31LVwMRpNdQmBfBvsr6agD5gC48y3c6w57WOpyuDwNJ8UFablxtDGOhzFixWPRrHPMRaHN2EkLScsv54Dq4WTigClO2wtq5xBa7iMSAYnTZu9bSafTQUwNr8o2S6/SrWNj9O//m+O+Y6gp2D2qV0b6YY+aNnm1AoS3TNcABW0tt/1Y+zcuZt9X8OHb/aQ+gOcj9jjehzOj90+k+jpDe6kW8oyNeMBvXZGmn/24pNmva05VsWA/5wscPqAijzq5EU9XO7QI5ahTYIv54bypW11I1patUJBnzj4uSsBbRX6DjOLIMmaRmKc3ZKf0dYrkNUpTE1CL6uI1rp6YwFlZ5GlOSVbnY0gGsVq0XjBT6PKgWNfL4g6BFpUptGjqGE7KEzvP4VrdlrLUX/1ooPmg01cuXonsvREFR6Xek1xq9YcDs8Pm+nwcMmleYjpCyy8GbTkoK/V4uX8ViwV7qY7Y8iuwUzJYVsS2FLpoLMN8bPtB0WPu5nmBYVhLgD63k0TgE70DfZ0r2iBB60GS4I85n8Rmp40q9KFZFT/6mvBFaEDZ6zteg0SeNt1gFgX0qa4/+g86FdI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(1076003)(8936002)(316002)(107886003)(4326008)(6916009)(6506007)(38100700002)(26005)(8676002)(5660300002)(86362001)(38350700002)(186003)(7416002)(2616005)(6666004)(16526019)(66476007)(66556008)(2906002)(36756003)(6512007)(6486002)(956004)(66946007)(52116002)(83380400001)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?95MfyD3YfXrRkR7ymWgn3Xw39ojg+WIFficY7ibxHBW1W57D4UNE85BZw3DC?=
 =?us-ascii?Q?rwgj3qKppo9qfiYZxYnRoR4yZSyKybOBYOV6LFmlu2J/i262RPWbXw0BWcdF?=
 =?us-ascii?Q?lLoIOiH/srp2H3X2AiedYlGZyTcftkOZZgc6IVx83nJHEMVDUKg3dPbKIt26?=
 =?us-ascii?Q?PcYInW6/NvXcsVjjsOxutG98V+uxFooMY/XoSOdvUDp3opENHkZ5WDK3kY8z?=
 =?us-ascii?Q?Lx71lnc9A6tAbHi12Jf9JIp+mgkpaglO8aXhKZjq1aQqqsN593MbNAhbBYyH?=
 =?us-ascii?Q?Vl1BlcVXYKmOdNH3aqmw7nDLV0LHa8hDO4lcohOw868VYZgmVk5Pmoa3Eys1?=
 =?us-ascii?Q?7/q/srDFTxiK2Xc2zwIta6/sbILufaJG4kV+7oEbTByiWfUyzTVij8MiSj8u?=
 =?us-ascii?Q?5v9nJC5bYXaG1c6eOmyVn3Gxz6e96VTp8z9/BKhDNn64TPglqtgSAlg0zVSd?=
 =?us-ascii?Q?cE7T8Fx3iEhefxw1xKmlr1TpGfahJ1pMK3piTn47uVSwKS94G5uOZJdf12l5?=
 =?us-ascii?Q?nlSzur3h70mNRhVC4XAFSYPZXAlE0P2x7CF0bIMNX7nny0LGkCq+izQXUHuk?=
 =?us-ascii?Q?POjE3qGlldK06ylu8zGHVyyD/fkK4CEEBHZq4ue5hPVH/CzAY0oic+b5kjyx?=
 =?us-ascii?Q?RjyUoEwp7GbfmTEIXKKw+YDqM1O8AsQ3lS1zfa24dhUEZMqTN9P1WuZvi4dS?=
 =?us-ascii?Q?oK/ebbqBZxvprgAidm1usLzhlHmBnuejwsCedyIr5t2/ArWu1n2dlYJypFTe?=
 =?us-ascii?Q?guzPkYg0ibVXRGUHyB7ZBCJ6qSkPfTFbS3G/lLz4ZgeJ0bB+O0gxyEld2sIl?=
 =?us-ascii?Q?XMjogOprXks4Yu3v49AizKMfgBVrDFzd4eF8B8XNKKEV5UR+xbn4+labJFsS?=
 =?us-ascii?Q?GDYXZygaHU+wxh9BBJm0HcbAGppdEy74bvGnLBuANnS8LZQT55k1uZ8QxNlW?=
 =?us-ascii?Q?jRqgE7dk+iX/DcARjjmOEdWig5dmPPuCk+zCoMtykrzDwX1gcCFS54snmCVs?=
 =?us-ascii?Q?Rd4NQOtEb0KhjaFY8fyv5tCPS69U/r4QRBJkcIkzqV5JoLZXJGiDEss5deZe?=
 =?us-ascii?Q?Hrcm6YhxAhtSj3RDS61/3JORHwpHGBLrY7jlW3A8KN+skOcuwB8JosHQfv3x?=
 =?us-ascii?Q?Y37H+hnTYTPljQ0cY4DBX+DfHrsaNmnERrhCWoqtJfghmAUjr3BrhrMz603p?=
 =?us-ascii?Q?I0rEYkKndHTH7KiMLqfJ8JoztbLbXBPTFE9dMbiYH81d+wEaDQg7Aur2KA5N?=
 =?us-ascii?Q?r2RWfHB6DA0EYLJgV5cy1v+pwzuLfVNDo5mvdluh8sHCbMurn+x0uWd0jMRV?=
 =?us-ascii?Q?hW75wpkME6uQgC4o7mtCE7pd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566e26cf-1466-40e9-22b7-08d918ff4f11
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:45:07.3927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrHYga5LGsvYHXhyfyLWzrWgOwcnEiRth0dEHymZQ6zgs4e9Laohq7awtVfp5twm7PNSYFiLOgHDnxlji3QzouSqtwTTy61NmCQ1/0pOPpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4341
Received-SPF: pass client-ip=40.107.21.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

One more step closer to .bdrv_open(): use options instead of plain
arguments. Move to bdrv_open_child() calls, native for drive open
handlers.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index ddd79b3686..9ff1bf676c 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,27 +144,20 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
-                    BlockDriverState *target, bool compress, Error **errp)
+static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
-    bdrv_ref(target);
-    s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
-                                  BDRV_CHILD_DATA, errp);
-    if (!s->target) {
-        error_prepend(errp, "Cannot attach target child: ");
-        bdrv_unref(target);
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, errp);
+    if (!bs->file) {
         return -EINVAL;
     }
 
-    bdrv_ref(source);
-    bs->file = bdrv_attach_child(bs, source, "file", &child_of_bds,
-                                 BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                 errp);
-    if (!bs->file) {
-        error_prepend(errp, "Cannot attach file child: ");
-        bdrv_unref(source);
+    s->target = bdrv_open_child(NULL, options, "target", bs, &child_of_bds,
+                                BDRV_CHILD_DATA, false, errp);
+    if (!s->target) {
         return -EINVAL;
     }
 
@@ -175,7 +168,10 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
+    qdict_del(options, "cluster-size");
+    s->bcs = block_copy_state_new(bs->file, s->target, false,
+            qdict_get_try_bool(options, "x-deprecated-compress", false), errp);
+    qdict_del(options, "x-deprecated-compress");
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
@@ -212,6 +208,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
+    QDict *opts;
 
     assert(source->total_sectors == target->total_sectors);
 
@@ -223,7 +220,13 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     }
     state = top->opaque;
 
-    ret = cbw_init(top, source, target, compress, errp);
+    opts = qdict_new();
+    qdict_put_str(opts, "file", bdrv_get_node_name(source));
+    qdict_put_str(opts, "target", bdrv_get_node_name(target));
+    qdict_put_bool(opts, "x-deprecated-compress", compress);
+
+    ret = cbw_init(top, opts, errp);
+    qobject_unref(opts);
     if (ret < 0) {
         goto fail;
     }
-- 
2.29.2


