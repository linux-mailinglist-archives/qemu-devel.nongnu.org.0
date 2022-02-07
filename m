Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D04E4AC669
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:52:33 +0100 (CET)
Received: from localhost ([::1]:34080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7Fg-0006FS-AY
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:52:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71X-0001vV-Gw; Mon, 07 Feb 2022 11:37:55 -0500
Received: from mail-db8eur05on2129.outbound.protection.outlook.com
 ([40.107.20.129]:2208 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71S-0005Ix-F4; Mon, 07 Feb 2022 11:37:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wi+xvJy7VR36YukFCkevHEehmhYKEp0Avn0ziBotL0KY1DMg06O6WMuGT4U6rH/MQd/fGn8vKFMPEj0Ck2GSZeKdEA9zOP4YSjUdpl+9vXQtrD4fmrBO61JDtxaGCtW60yI7eH7LSTmf12zF1n7BuUPZbWKevzL6vO3p1K7LdiFh4AtTj5aHuuJQ/QTZHVdxQobq8SimN2aJ6d9OEFXcBaa+8W1bd2z1HvEdRpL+6i5lAS9ku0zP9KCXGnVRHoann+fniCIUv0EAMIDVSwgaRImH0QHqrapc0SN1yrfkGKrvLrWc5yTIerB1HvdnIyEB2N9oBVT0WE5ySVUnL97a2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2lcUxEp6by0XL8MDp2pEofILUfI9zC3aZyHKMkrhHM=;
 b=ALa3okq9vF0J1w0bcEzPNVA/zqYEmXrdvdRMdCaH4Dt9kJQ2iabypgGcr0fDtSW1ZioSRPHkfEqAI9R6YIuRcreh18ckhWfpsF/SX090Ilfmo5m1Uvu72nNd5vqGA1Do2k87PK+q4hZRBVjcUKVoPcIfRpp71nQlzw6geldVSWyL3Rj1LJ6ye1T3SRp7riDtsZEJBuC/o25T4c5RdjB8Hi9D/WhCcGAsW2PDPRaOc8k31C5IzJ0yPefumRAuYqb7eWosw77O2PzvFt6Vz9uApsC83XykT8WNqRAyGtTNd6crpLeEvy/LFxEfp7vZOPKBGBeFx+odg6h3vLRheRR3Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2lcUxEp6by0XL8MDp2pEofILUfI9zC3aZyHKMkrhHM=;
 b=lj7UfGFvonIbdXXH1Z7l65/qblXQm1VVZT1QS3KxfmK5nEbKXsPGOZD3Ef54hpp/X1PIoL/qE01HYtRwaE7z5OjzqrcpgEuAyJrZwmabmOCdVhimg7r96J2Q8jIildNl81WjLubLt3n9DpbZuNFeTjWd/GXixsf9dtt+h7dHN5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB5085.eurprd08.prod.outlook.com (2603:10a6:803:106::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.16; Mon, 7 Feb
 2022 16:37:45 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:37:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 13/14] block/file-posix: implement .bdrv_close_safe
Date: Mon,  7 Feb 2022 17:37:27 +0100
Message-Id: <20220207163728.30362-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220207163728.30362-1-vsementsov@virtuozzo.com>
References: <20220207163728.30362-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0126.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df1fb12b-0b45-4e11-023f-08d9ea582a58
X-MS-TrafficTypeDiagnostic: VE1PR08MB5085:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB50854E4A4894DD2B265AF839C12C9@VE1PR08MB5085.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:103;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /fzcsa4mokcZHCLO5oKi9gDh5DZlrLTqK/pstvxIHgRNoeMMZFQgQXzpWCMAuqe8JvpuzJKMv6inaxZnBwvm7EoGrOSU+HtH2MAuaBtuIFxrMTGhn4OH0hY+MF6sJi3/y1i1dkYB96WMawelRKgh8soGTbObxJWv1DkwOrVfuiafR5uT/F/5bQDVFFPFJAktU8I6LM3EyfW7MU4Q1vVftpvj6dTBiPdAzzjQfEbjD9vcuTLkF2Tziu6Yaa26SknBA13XYK6Wl0MvIoU4s0sXeWN0f1v7iH8IdgHPTsm58IXifv6V25nVMq1QSMjw++J7Hy8uO93XOoj0BCVv7bX8jTzlQp8ILxgOakhQqQLImPw5WoCofUGoWhO4n3h92DRPZO7a4bZnL2oEw1N0Ju+Jdrjka3VrGbC6OaSc+bWN/YiIPu/XkboVEHNde8oCpBQkZjp3NxQvuS7CItyxiV6ca/Nx93w5xT7TW7cN1QiLHdxbx1VEd9+cEgj6TXi55eh4y3NiIepG1QPfExpoALVor6oHMwM0fe0vuHPGoSxllvXumsie2k6nOyX1Q3no5zmY8pGwnxdsB2BgmxBdK5Ee474vkLKouS6T++iV88/OidNBkyaKvSdSVl6lqT3WpFDgbC87l9p6blF40l+BZUWjNFQt4wZqMqo5IiMqIkjqi3w7rVwpphzdBX1HeeWs8hB/MP8REQkEPz2BxD6Wn7ajpwpW840wUdO0T3SRvUyfXNzdxW2+t70Gy5Qa1ht6cPCM4xjPDmr1Eizvzl1ZTgQ0Ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(38100700002)(316002)(8676002)(5660300002)(38350700002)(86362001)(2906002)(4326008)(1076003)(66476007)(66946007)(66556008)(107886003)(6486002)(52116002)(508600001)(2616005)(83380400001)(36756003)(8936002)(186003)(26005)(6512007)(6506007)(6666004)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ixcOhuqtezyXRB96vHWYH6r7v/C788s833ilR7Y7qqFqsCS+oPgnNN20kpz+?=
 =?us-ascii?Q?Es3YIFiVa7SrpPH9hWDyICfrpvyRHu+sPMz+8ST9u+WGd9EANB3M/z5KpelC?=
 =?us-ascii?Q?srQ2lNulRhFLxwze+VanDlRJP3Xra+XiNinJDGasInf+AN/5iVfAgD2n4oSP?=
 =?us-ascii?Q?Pi0AklBKfgDphSA640+dn3nlJvvdpi0YfFvwROZwMCpiJo7+1s24T8uOZIGV?=
 =?us-ascii?Q?9K9xXGTX/Z3YapxlOWMYYBR7TVj/W9+FkvG09EbfIwWdKmVczPjU93Cwa+Ho?=
 =?us-ascii?Q?9xGl7fdfKNCWcRFqzzmgy8EXP5AiP2WSMuD+5LagMcPV94+XRWZ0nFgJ+/8n?=
 =?us-ascii?Q?zOMbJT1zIzYUm9/iuMQptfOGP8nhCRCChWpZClIQHYvKMPfWCjDIi7hmWKcG?=
 =?us-ascii?Q?8B7Q6o0o/wLKgdYUhUcAynImcMfz0VBE9r6ZV9TgNVBghp2QkPw2YVDBqQHb?=
 =?us-ascii?Q?4sdmhWdc8gvO9H0MFDIR50iHwUtS0V19ts1pfytHq20/PVsb7cruUQI9r4D0?=
 =?us-ascii?Q?IU9MfuMXKz5/w6z+hUJNsJLLRzm8b0e4DD0vmLvWyf6TUs2wijTZflxlfpgI?=
 =?us-ascii?Q?8spSoY6P/LAVtKGD3uDRqjMBFuLwcshOELjFGBg5sxA8wUybSEseFziyu48M?=
 =?us-ascii?Q?o8yuERgykLHXjVHmtmBjYDU77fIqJqiw5b4i6QDAWsirkIyvAF0ZtqEuF0JB?=
 =?us-ascii?Q?bwydthbjVPDje2cb/yMj5UAsDyzxEwmp3CX5HQqBxypQxZmM7TtUvipyFmIL?=
 =?us-ascii?Q?e6l7cTKKn7QzhRaY4CR9gSyNcuazs1odwnWRp4Q57efX1/znsQmYMyWqRB8A?=
 =?us-ascii?Q?CZ2Jf4cK10vAgDx9cqCARuYSDMaYNrfxqvo7oMrVkB6nlFJGmq5mAz9VAKEc?=
 =?us-ascii?Q?OPM7vrHduJsic99plbTTQryE58Fi8ToV+9IOVLpi/CLfBDSbSr4AnTzx8WTQ?=
 =?us-ascii?Q?hWs4gpjedB+HNZewUC382g3RKPuzpOMBBxZAKKK8YvptArO4komATcTOI6z1?=
 =?us-ascii?Q?H/VdbCrbsEDAtR2/QS9EEJVUbTM6I2FNLLhRhFtzKNIgYvIOkKovW8F7ALmo?=
 =?us-ascii?Q?vas20IrLoKu5DEsDaycluoS0AbV8pSMA3k4COehEZ+p27uEQWfLsCSAaGaut?=
 =?us-ascii?Q?COe6H58QWNLuH/Am7K45/dBJzlwwyUmpPieVvDqaCumRNigJB7wxlBdOFuTo?=
 =?us-ascii?Q?Ti0JwWvARqC1j8cnTyZUgQQ+e61JYDwjC7/ha+n3bMlvdw76REaH7CTUoO53?=
 =?us-ascii?Q?JzBiBZRg5yxf968ns7L90zcRdIVe3D7K5QUPOezzL2wM9XFGuqoa3AWgM9UO?=
 =?us-ascii?Q?AQSaOqe5N33QZtZx4rX+Yp4LIz1FIGmxYHH0Gb2KjsekjY2FKIUoNXVycMVz?=
 =?us-ascii?Q?yw9Kuo9xk8kTLvSTRefb3qUtHf2hZTvniiR0VMpMoMPwDfFP3Y2XCbs3q87s?=
 =?us-ascii?Q?Ra8zx9NggS55GMw9OkwptyReo2cZEfHxbt6eFl7bYvGapV5cH7njdgj94Tmv?=
 =?us-ascii?Q?qf6kp8ymWN+jo4UsBbTOH057yhYPRKBiyVnPuLYXReTLlADppf5Fxu287yXT?=
 =?us-ascii?Q?U11DnFafg1Gr2rNp3/FRowG3Po9URnYG6UhHknRx5bWHVmvUWJ0tEsh/y7HS?=
 =?us-ascii?Q?MkkIu7XLQV3qOsEkYDzmiJUWddjBkMxiAGnfSKaWlsrMh0NjCrym2ROawvMm?=
 =?us-ascii?Q?wKGxTg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df1fb12b-0b45-4e11-023f-08d9ea582a58
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:37:43.8849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnbA7TsucSjXTTryUkRDonwjuOqXpZT+Cyu2lQ2cP9dowYq2kGSWBAlcLeApZgc+MnPVsvr/UafKep/WusIsqj6nQKxzxtNQKaEQgnQ7qlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5085
Received-SPF: pass client-ip=40.107.20.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Implement new close API for 'file' driver, so that we now have the
minimal set working: qcow2 + file.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/file-posix.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 1f1756e192..90642d8185 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2195,14 +2195,38 @@ static void raw_aio_attach_aio_context(BlockDriverState *bs,
 #endif
 }
 
-static void raw_close(BlockDriverState *bs)
+static void raw_close_commit(void *opaque)
+{
+    BDRVRawState *s = opaque;
+
+    if (s->fd >= 0) {
+        /*
+         * Closing fd is unrecoverable action, that's why it is in .commit.
+         * So, yes, it may fail, but we ignore the failure.
+         */
+        qemu_close(s->fd);
+        s->fd = -1;
+    }
+}
+
+TransactionActionDrv raw_close_drv = {
+    .commit = raw_close_commit,
+};
+
+static int raw_close_safe(BlockDriverState *bs, Transaction *tran,
+                          Error **errp)
 {
     BDRVRawState *s = bs->opaque;
 
     if (s->fd >= 0) {
-        qemu_close(s->fd);
-        s->fd = -1;
+        if (tran) {
+            tran_add(tran, &raw_close_drv, s);
+        } else {
+            raw_close_commit(s);
+        }
     }
+
+    return 0;
 }
 
 /**
@@ -3278,7 +3302,7 @@ BlockDriver bdrv_file = {
     .bdrv_reopen_prepare = raw_reopen_prepare,
     .bdrv_reopen_commit = raw_reopen_commit,
     .bdrv_reopen_abort = raw_reopen_abort,
-    .bdrv_close = raw_close,
+    .bdrv_close_safe = raw_close_safe,
     .bdrv_co_create = raw_co_create,
     .bdrv_co_create_opts = raw_co_create_opts,
     .bdrv_has_zero_init = bdrv_has_zero_init_1,
@@ -3643,7 +3667,7 @@ static BlockDriver bdrv_host_device = {
     .bdrv_probe_device  = hdev_probe_device,
     .bdrv_parse_filename = hdev_parse_filename,
     .bdrv_file_open     = hdev_open,
-    .bdrv_close         = raw_close,
+    .bdrv_close_safe    = raw_close_safe,
     .bdrv_reopen_prepare = raw_reopen_prepare,
     .bdrv_reopen_commit  = raw_reopen_commit,
     .bdrv_reopen_abort   = raw_reopen_abort,
@@ -3771,7 +3795,7 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_probe_device	= cdrom_probe_device,
     .bdrv_parse_filename = cdrom_parse_filename,
     .bdrv_file_open     = cdrom_open,
-    .bdrv_close         = raw_close,
+    .bdrv_close_safe    = raw_close_safe,
     .bdrv_reopen_prepare = raw_reopen_prepare,
     .bdrv_reopen_commit  = raw_reopen_commit,
     .bdrv_reopen_abort   = raw_reopen_abort,
@@ -3902,7 +3926,7 @@ static BlockDriver bdrv_host_cdrom = {
     .bdrv_probe_device	= cdrom_probe_device,
     .bdrv_parse_filename = cdrom_parse_filename,
     .bdrv_file_open     = cdrom_open,
-    .bdrv_close         = raw_close,
+    .bdrv_close_safe    = raw_close_safe,
     .bdrv_reopen_prepare = raw_reopen_prepare,
     .bdrv_reopen_commit  = raw_reopen_commit,
     .bdrv_reopen_abort   = raw_reopen_abort,
-- 
2.31.1


