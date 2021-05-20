Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9162538B1E8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:39:25 +0200 (CEST)
Received: from localhost ([::1]:35388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjpc-0007d0-Jo
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZu-0006Cy-1W; Thu, 20 May 2021 10:23:10 -0400
Received: from mail-eopbgr00128.outbound.protection.outlook.com
 ([40.107.0.128]:8320 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ljjZs-0005ij-7f; Thu, 20 May 2021 10:23:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQoM+YERDiBW3XeuU/F8pymFJ74wzK5HNN00hu3QbZZiQP23fSHf+JIxwDMt41gfpv8GypP082WI23G03hJLVA66WyV07LiFiwPHzRpr69echIC4J5O7QU99R9Z5r0nICpo14F/ponzHZ0Cqo5Q2/LUUP42gJVcbeyLx+IOwMSF460aZ2fGHbggS3ARq14UOtNlSybN6lTRZ9nRnaRh2YXv6iTKU8AJLzKXsCHqky6WuZMLvhylKrsEfajKxYmiIEOffRWgYGSQhUQWvG2pCHShDSUPrEyJNeHDNy7VISmnXDjdjmOyRyyS+PVGYdptYD8bl7mS4a97oCWMMS+ZOoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6nSqQ8glRSbCauI3uUt4rS18W8WqtO0o2GDIenmgro=;
 b=UUPxAsSjiNSwemoRilHrEoWmwSG7WruJN0bBOyZT2m86OlOpRsnZuuSbAxWlLRdR6Q4nDgrPDT53MpJKQ54lwbrIlP0N1ID238zo1FGfDeFjcpIc6HBiP8S46Y/Xv/zbdEFnOCjUM7A3ktzWqtxiysxkY6D4C/GDHoa4inzbD8FEvAPkLOUaQ/WXMlSNqRTbgyfD6jh22PnPtDLSE6SVJpnpWf4Ef6vmDdpz4rsnR0bmxdrn29mXWNmGsnBBxmkiozWPaLLixe9cBKiVUM+vvWcNHtL+0v7DosRUKjzqSdRW39O0iRlECrarOe8w6KcWy0sIeP0FZqiTIzOebjmGZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6nSqQ8glRSbCauI3uUt4rS18W8WqtO0o2GDIenmgro=;
 b=pq5AFcNViJ4WJqtI+MOIL0E+ZgfWtfnkydoS4pPaakhAmTrS3DuXdq6vsIXGBauiC9Baw6cEqpm2/DKa0uPu+H8sKy4d8CA/sZwCcU+UwO9K3fCFMQ/reujCnczcxGYuNUxWIvhPGYfmr/UwXOlVgwFFY02EnAarjINvWntO8/A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 14:22:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 14:22:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
Subject: [PATCH v2 16/33] block/copy-before-write: cbw_init(): rename variables
Date: Thu, 20 May 2021 17:21:48 +0300
Message-Id: <20210520142205.607501-17-vsementsov@virtuozzo.com>
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
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:22:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3eff4466-5d79-40dc-c899-08d91b9abc86
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544C82FB2C5A98325CDB2A3C12A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0WNW5xQWixMoeYIRtw6tjc+NhaIzqptqMjb3Q/w/NPXuC1u+WT96uGUuMTxOIkyihkaBRkAaXWoO87JwgSvYfuWhsiUdzo07F+ipx0sXrYOdJPcGna79l4URzT9uHX3I39E5uHwCS522zXE0Jn6jwyfnjAVpgPI59mu0Ga/b6t2SSlRYuYGnHj5HOgVoHsn3069TU9yh1AcGJ94ayUlRcvIHvFuPnp0uUjPHLjp/u12tiDDmgq7PecKR3p0JqpEdjLYlsMVlDSpXsUm5M1l5GEzc3SrzdFps/YL+NDiy6g7ALABuo6/IX6RrWw38C/9tEGj6cAXVopKFqrUnHnQKnpSe1D9ck7sEh9auwQhmLUdsXFzaqAwfAtIV9GkvZHIQ4ob2VuUff5PW5R7qL4dIP5LfPjKd8vOBNZfDMpLVKh+G4UaT0vXYOsXXQdAoqN/LqHgq2sLEnThT9pqeJ2GrHPTtlOs/wMeDGF8dL0KJx8x06jIZYubqiXDXdWmjhUfK3y5pBvWGzGGomJQs2OhYEeui6s5jvYsQ5B7Ut/20cHodxanCEkLyM2DtMeQrKL0l6/cZO422Ag39CoA9K9uibcS7pEYymk77MJUhulPGWKUHG9UHbLsY4aWJMNxy9l4ZLUSbcroOVwCh+iK9thv8qKd7h6TxTbku4yS1fH+i6iqgv68cdj/GNdbQbD2LHTm7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39830400003)(478600001)(1076003)(52116002)(86362001)(66946007)(66476007)(4326008)(6486002)(2616005)(66556008)(956004)(26005)(5660300002)(6506007)(107886003)(7416002)(38100700002)(2906002)(8936002)(36756003)(186003)(316002)(6916009)(6512007)(8676002)(16526019)(38350700002)(83380400001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?D+mXHNMJumJbaksjS/SIn9+dGQ5k2gz4PX+vSggCkjbSVSRRP9Z/hQcJiXi5?=
 =?us-ascii?Q?PMdECD5PoVFBMYVUOW1qIIIWVww20qslN8wgMwa5rruUK0gZFmG+eDyoKQg8?=
 =?us-ascii?Q?nEWXZPMv18BWx9io57hwccVwXDxwxzn4Omkz1G+a3nHdu6u6iTp4GMspEdCX?=
 =?us-ascii?Q?EcpB0nV/5iN0yRJL5icDpCSikQvUoTfvBT1k39SwlmWpAfdg4/J6u8UbDZRk?=
 =?us-ascii?Q?8A0NoZFWSsjKdZIjz0s9d4VVRW5LzR5fUpxalxOBYVPUpBtHjIphkz33g7Uw?=
 =?us-ascii?Q?gOihOMddBLTXdJrnsR9YOC7u4+PmDJcP3xXXCZ7JP6uAvPnKyjhAISjzM/so?=
 =?us-ascii?Q?3MiqdTOhbWA9Xs6nXUdccXGpgO7Cw6S1vyHgb56eCkRKpxw8V2ufvn7XjJWu?=
 =?us-ascii?Q?ffRY3kvd1AFIM4QIO7v4m+r1+cokJo3TYB0/hjV6K18t1gUe26nhWneWJNnK?=
 =?us-ascii?Q?IakEo7jAKlizirsP/p+EEy29NYLz/djOX0ho90Nke5HAaJ0arbe+8/ig2z/1?=
 =?us-ascii?Q?r+j+uAYlBU8GkP9sXx8kJB0QtiOmzSe0yOAw+sOEsrZq+k/KcT+IxqlzVssy?=
 =?us-ascii?Q?3D8f5GCarxoZ+KxFMfmP5Okq73GAv54VkT/EjmX9FGQNTw74L57qiqBeEYmx?=
 =?us-ascii?Q?VQLwbQckgMYPG6a85ccHIJaPM9bpMDdy1TET5bmX9C8efZNDtEdTzpyWBx44?=
 =?us-ascii?Q?DdBccinZKyAUYpqMi3Sf5XTZt1DFzMfMT62TryTsWYGwln705ExadQjuRN4r?=
 =?us-ascii?Q?JabFg4MK0csAQmDe6nU7e1eZur17VjBE0xZIgLtg9meWbkMRXm2GBq0AHs9M?=
 =?us-ascii?Q?Bf5Mj97Qfp8Bz8hN7EznNFD54GFh4Nvrn1IOMYZyariY2w8YsmocBEa/VBwl?=
 =?us-ascii?Q?v9O0Lxr9Zklo5Kc2Gm4Vi7tyryWXXS0fXuxNsjCzmphyHapP+fko/5kQUCr0?=
 =?us-ascii?Q?HuQv7d22HMu+2f1V1lLZOTAvaFlLBbbW0yPJffUgll29KsVwyNObBq/pg64A?=
 =?us-ascii?Q?LsJbsQIIumBeqeaHj98wtJT11mXu+ZUUA4MguOfVWFVGGbeKFd/p6E2imyky?=
 =?us-ascii?Q?Tj4j5GMsK+ZUUUsAYEyorAQ279SJFAKKMuW7SReOqS8i1sditr3l3dCluZBE?=
 =?us-ascii?Q?fEPkX+wOgFfsYpRzlbYF4t8QpwQQVy5g3WxYRctoXrhmt3BkKJ5Vbp3Fw1Li?=
 =?us-ascii?Q?Fo+GaHiWWYrDsJUl4hwDJF7TXFFROG4nNU7diURh/ZxbmzyY2DN9Kkv69NMF?=
 =?us-ascii?Q?erdchZt4CHBnbBUZ2JOHXZlFbm+bMz4CE0/E72FoqEagI9JotIvYAAAGBlH9?=
 =?us-ascii?Q?3gbdSoeAqDYJGHYXUHSfPSUH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eff4466-5d79-40dc-c899-08d91b9abc86
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:22:45.2972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIFl7MwXxjLpRqvfFl21bugHvB7w1P/ac3Tu2cGayf30eF/Z66ssqu5C4b6VDBtj+Ym+e3HPpNaYPFYUSkLie0BAk5CtfK9QHLP9BsE5WAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.0.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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


