Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCEA3A2A8D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:45:29 +0200 (CEST)
Received: from localhost ([::1]:47168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJ7o-0005aT-Bb
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIq3-0003xK-NA; Thu, 10 Jun 2021 07:27:08 -0400
Received: from mail-eopbgr40097.outbound.protection.outlook.com
 ([40.107.4.97]:58455 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpy-0004QC-M6; Thu, 10 Jun 2021 07:27:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+4+LS4AwPfnWLq1BP4MzqaygcOhj0G+Vc3lx7GCvZ1+0Yc43sDEOUdBxjhKV3RswHWTvAcyTPRs4IrlCFqKbGjbjCtYvNxBKCVLDv5kEh71TgPYLYyzAz6Leogc5sQkbPAxxTGHr7VsWykDGe2qK4tAGDrIaIdfBxSvy5ivTeO4v6DrvYJsalU75iunp6mlrjywq9A/ReTmEf1tlhQacEsNohrgStRE6LAgpvdTCn+hHlvfQ+R1+s9SpB4n/NyJgNLu1bqkjlKpgSx//y/coO/2nAba9oaAmczVxHsAQqjutOYqY1UBxOb0uMzNmgtPb9ZdAMMOGklIAKDStLoYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6nSqQ8glRSbCauI3uUt4rS18W8WqtO0o2GDIenmgro=;
 b=A/EwXl71HPbzMB27CgFBWHt1O+T77lku5KN12n/ODTWKsT07uoRuQR/P/Mq8QfZIV3JATBuMrEN8R01xvrQjO9qgLxhUuF7EJvxLhxJOIGFdfI2z6bpVX3PkUj18khLdf2ymYM5y9ytHJHNUhKnJ+fTj74YtZM/Tx12WATY7lFwb1BO2uRZiOBtMusrC83+GXt6KiOzlRvUk8rv7hOBY1SyvEkifqDIMc4VSCXODnO6KuCgOcv4tEDjvIxDCkCWrC6CI5P48cn+Fc+agwZ9M4F1H2Nvyv0pabqRpTCFLu5NZzwJH6z3LcGPoei88dTjCw7Urkge/hjo5jVn38kuziQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6nSqQ8glRSbCauI3uUt4rS18W8WqtO0o2GDIenmgro=;
 b=v2CWF/UVHPMh4WToh1kHjpQfSj/ShJufXVjSdmQ0NJLwyIW3vKyvxPcWDOPxBGDNlBNwpCLbG8pVONV5MSqFQBlprdExKD325Shlym65wCGjG9yEGQ2/tEj2ZBnZfJE4tXaLHFBRNOYZbhvYjCZMV7jC35/cQA5sFhwXUpRr450=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:26:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 17/35] block/copy-before-write: cbw_init(): rename variables
Date: Thu, 10 Jun 2021 14:26:00 +0300
Message-Id: <20210610112618.127378-18-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0a5817f-af60-422e-79a3-08d92c02a4d6
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3381724A3B5A1AD5E7BF3433C1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yb7JmzHcv8EAMYsoh/1dYG+QhN10t+CGyW48+6zK6GMyyxsG34pZU7uXWaq1PwY5k4Tce+SIcdXnoTeRh5+bHHUhrpXjP6j0LcCdvMMkqLUGLFv8CMc/hC2UbZOakm7uxEOq6E3IG67N6th8F+ii6GOXMdLUbZi5PjLBwsretR47kudSCMuL4GAfv24Hr+FD6vx569HqpvdekSNnqGTLbzVoXH60o6GJsDXpduIOhqvbrm9fNjoogLfhOHjQzKe+rRvR2rWETRkdZN5S1pW6iyIDTGu0TZxHPqrRyVIVP95XqnjIEuTXVy2nomJCjIWqWkoqSMpYIpDnL1g117oBJGDHrfgSBxtgk53m211RT/rJ7VtYbJf340vGzS21ULRr8qHEFrQww/J2lVZcCmyF3o1KslwTY35YbpCYJwSGUBhjiGZdnLw/cfakujhg1cz+tvh7sMKV4S1/OkuIZ8qi9BW0CEPKe2OPguYw4BBwRUysELwtCCh4rRliHGOdDqWUXzyrXxAGwSRHYuTeNLH9JhhVWivNRq5id1O9F7lNnGRN0NRTmfMDdPHPnpE0nCDVNvmztRG2qVvbRXXDEqGLVHoY9kZGXyUerq8lF8Apla09Llg1fjPPVNHfsIdZmxoy2utv9QRcPSe2+3PXBj+bt1ZADf+rv5wcX7qLrSu8GKmFWzKoPQGJj9N9SUO9zvK+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(6666004)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HmqA+bqGGzcAbD3v6/iM50VbPbCGU6VzHsXTUDKqz+GScX0lM5sKQUZ7J+IA?=
 =?us-ascii?Q?26tOM3A6LJi9OgUbc9vqE6qHi7zWlKY5YlsG3ycSZBwsg9/2ro5ehqSuGndz?=
 =?us-ascii?Q?84NVVBlmWUfzYs/a65vEvoogKgRXQR8LOXP6Mk/fmxf9hKJM2cBAhVCCyC0h?=
 =?us-ascii?Q?KiiSHNXdBbJLOJ3U9HcyhX2h5tAhnFdSf+LtIDgnZwlq+btj0KlsrpyzaOPx?=
 =?us-ascii?Q?z2a2+NUXs1yx+r8icp99rJNPQG+IDd+9pR3TDkLQygwdZvT/LlmyWrsZ0X3h?=
 =?us-ascii?Q?OgzYspLDb+pdDqv/6tI3hpcgRyFIhTw43RIHc0sCm8SerCBJybvFYJXLZwJU?=
 =?us-ascii?Q?Ie9w5uDByZejUM+ME/k8iujdeoqFOH+C/+cTmjiTmLHPTb4CWkcLJ3KJg8Wp?=
 =?us-ascii?Q?SUySaNJjSUBPRwYuv1WvLMZio+0LGYAcXkZ0g8bVP94NIcI2IYXt9PdKFRBa?=
 =?us-ascii?Q?P3WOSkJCvJjrbnJL/rjXk3jJFRxYt/HcOSEzbJqzvPVF30UmNvXg8IyJqHLx?=
 =?us-ascii?Q?qWFERPVM1A/XZrHrl2telcD0DSy3HRfFo+UH+ULMq0Jzj/fp/dbGm8IbSYPk?=
 =?us-ascii?Q?9khsDRwSyub1GkqvRM9lMKWokYU1xbUZZanHgbpCTq7dif45sAfGonFfmip/?=
 =?us-ascii?Q?BdRfe9Q5bNZswQ+tROkbuN6ntRISwe4qhtbnV7goBaCJvjVLLrEH0fH+ym0U?=
 =?us-ascii?Q?lapZpb9CPReXr5A0J1UxZ2NDbUEjkWMrGSEwpnoymSYyyel4VBBJP72feZXI?=
 =?us-ascii?Q?RwawlvOrIROrrVP80hKl6AOwcWswbQkxR8p8plJcr8WH99N59x5OYZrLJV8K?=
 =?us-ascii?Q?K9KXT5zZVKzit7Bhoe9aQx8OBNizrNeabj7O44Ty3XzNpSjnMHdy1cq2gIrl?=
 =?us-ascii?Q?uoQSj0vlQShH9DAtUIKU2fw3DjaHnoH2fMqHcU0GU1dKsldM2w8WR039F8On?=
 =?us-ascii?Q?ltKmMXKtE5os3AX6oZh4UKJMO9Vw5LMW7zUXTDESrdVOJ7gnADW/CmGNqI1f?=
 =?us-ascii?Q?b5KBnYIBNdtsyGmU2g2aCEOl9kMX2sh3cGjpLzLTvTZO3quVVeuIcJ5RZqzs?=
 =?us-ascii?Q?PWanR2hXSNagHZUIC7HVqQemcAJJ7ypA1QeEclQkFLuEupCgtRdViRZSzL7m?=
 =?us-ascii?Q?rmzL+PylCtna0/CXcDjl/oEHvd1zvgV3XHFNOI6fnhV3xpm7uf/7VbvNKcKL?=
 =?us-ascii?Q?+uKi+sAE10U1I6IFvUNkVz/gvmJzpL+f0o/FmuBN4wi5kcYKrCLbB0Hu+vBy?=
 =?us-ascii?Q?poqclIhfGXRE8aWynXOz369lIdbnIK5c9y6fzJ05+tvrbu9NfXdt7Ir5Vbpb?=
 =?us-ascii?Q?hM6AyippMleJmOMeoL+XLsTo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a5817f-af60-422e-79a3-08d92c02a4d6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:51.8693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7akVJV4b1yzpnjKnqycXRhYH4JITPJf3ozLUGrKR5X364jamiWbEQDuHnsOrzqAjg7Vr0CAlemB0oB9OH7q2WkM0GuiDzyNuXHThlaVr07w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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


