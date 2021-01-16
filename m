Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714F12F8F95
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:03:19 +0100 (CET)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tfC-0000hP-FF
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:03:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVF-0004RF-6B; Sat, 16 Jan 2021 16:53:01 -0500
Received: from mail-vi1eur05on2126.outbound.protection.outlook.com
 ([40.107.21.126]:26209 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVD-0000WU-Jq; Sat, 16 Jan 2021 16:53:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGpRaBlr2cTW9JxMnMJrX5oZllo3fCaH364YskstpbgqTBNlpWGz97kQhGdcRjH6437z/f2ICczwud5IytR4788i/QpYEW2nYuZiLlaR0NvGsJl8JgGaSF7UQntTHnlvrv0/wymOcemUUNGtTVkuDFJyXapGl13szWkz4I9ozKC1dHNKfI0e2T8HWIHv3F/5AnJfm0Ko+vkWe9px+3kAjAyDxBgDaA7hsKL1D3WuNlxOtHJowcz4ecekzH8RY0zIzv9ENd3uHz0NwhFN/I9WoW9XKXapTP4lSKa25w8vxZwgHvJbBXO6SUoacNy2iC6iTixOepiw6dEWnKlXE4o9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhBniiJDE5/SxNOQd6EuMIeYcEALNZuGlUwHI2NEdBw=;
 b=AIp0juukI6eIqopVw1+LxIz00vewPTLpXfWFTgYHcZgl84LtXdNuqn99+pWhQoLel63H6EF56YfhbGT8XSaL0OLlydJMHrxIrA1WXU0Zvwk0UUIsRKjdv/3+2pmxwy9pwKJlYwKxKQbMmSvNKXPY2dYIUAP3rLi1yhqi/aahILLiiGoLsvj/mYdrbdJeaul7nLrHfcl9XwQPrK/mr+OJTvCyHKNjotwlrQ78LUcv/sku05vV0kQ0JEeE7x8+u+y+PC/VXNj9ErK/BgoYh6i+g5QIB61pTJtEZ/QF6GeWgQVko9xhB2AgvaFaV1zpMlgLs34piNcEmquC01oeQKj0QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhBniiJDE5/SxNOQd6EuMIeYcEALNZuGlUwHI2NEdBw=;
 b=svtwmOnQANRIxBuv1eS1DC24S2++Up9GN5C9Bruc3qqiK1Vf3EVtmNjxIVvJNY1aP2Q5JZWJhsnx3MwkOQFxeV317gZit449D8wH13JVs4x0PizrUpmW21SmZjMXqw3erOhC4aPHcbmVC7wZ6JpS2S6JEngxHkoEJk4MLYSg5VE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:52:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:52:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 05/14] block: drop extra error propagation for
 bdrv_set_backing_hd
Date: Sun, 17 Jan 2021 00:52:00 +0300
Message-Id: <20210116215209.823266-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116215209.823266-1-vsementsov@virtuozzo.com>
References: <20210116215209.823266-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM9P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM9P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 21:52:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f955c9a7-afde-4538-4bb1-08d8ba6911a3
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3542031CC1680EA21F9543F3C1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4rL28S7aVI4+enakvshLo1olNXH0pvEyZ0HQuelO1/tvwzATgLo2XBFscPSHoQwSx8yIXP1Bj0c6Bs434z00IXV3QODvEXA3B85ZGf4Z5MppxN3n1u5roshbqXGB98J+5iCzcI7G69IyEetHVv+J3HiPE4czWQTvQAJem7x1l3f7+jLzu5cpIPH1uPwUGiwR9nQxLL5QwS5wkXr3AHd1cmlL5coBDAkln8r5jd5r76oJbmJkASYVvRu4KKsFZ+y01W1Ij2mkhIt9G6WkltFcdtFbwMX65eoagqEdgT6fl/HRkfQYuT/FQ/jx6awE5PLamWuKrYGzh2Ok5WQ62xEzHBAY0mB+3/oVQ2blYtkQEhzKPX3CItEEnppO2dKpkIQshCS9oOHeETTVlKRJnY1FYa9fW7F4rI4GcDH2Shn2/OtSFazLWaqog0SOcJuDzrFZmvLoAt0pOsrDF6mMsLPVwNgO4FKmO5zUvRnPvd4rdcrW+I+ZmPuyQk4b5C3A3Xozt8LVgxZvg+3u62mU4v2UOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(6666004)(4326008)(6916009)(6512007)(2616005)(5660300002)(4744005)(1076003)(7416002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?k0G9TrwEtZ9aie+5j93TdyBDygZ47VXglCSyuSj3EUqGDMCTrHenin5DnCMU?=
 =?us-ascii?Q?1NmX9cvbAK8eKaiD51gQ5ODxxXQRhaTrOX1a3DFYb5AaX9VfBmIshjxvULQs?=
 =?us-ascii?Q?gI/ydB8L6TpMhcymhhXg0E6bRW2AEoICu/rQ0S8urb6WypcTnI09jE+Kl+b9?=
 =?us-ascii?Q?ReUtRPyEEJecpi4NOztgUq+Vg1uS/MK7JZjFrcVf1LYpYVixXfj76R2RkWqv?=
 =?us-ascii?Q?4NmyKjthw5HMLEh50O1R5RF3D2tT/x3P8ASgtKn75J7ALwVMUm/E5xhjAENM?=
 =?us-ascii?Q?TiolfsYaqXuBkdVANMkhMjEB6nvJwN2N6l22qtFADR4jznAXl+JFq0BcElUk?=
 =?us-ascii?Q?czevm9JFRw2seJm/C9099hEEzOEpZNLHmTRuUFpwGRLFtWE+SkyXtZuitUVi?=
 =?us-ascii?Q?5QhIjmhwTHmyPdE6RR6RCDZRR4iH3LYOo37migwc/obQ72zXQaUok2a3DU2N?=
 =?us-ascii?Q?io9OcHbPkT2ZawafSb5WoZRc+wDNfGHU6Rn8i0KFOY4kPGtpDmKR9QHxd7jM?=
 =?us-ascii?Q?RMda8LVriPYar13rlLJPLJ9Nz21+CQsHA+snuUCMGR+jXQYBSg5xH7syL8Cs?=
 =?us-ascii?Q?44FACZSYzIL66E9u1y8xNCn7+5DHeNIOqSbXXxQMCq6buBtGhLMuKwdHIT4F?=
 =?us-ascii?Q?OkiNKcsEIarHGlYQv9N1Gj6qlirvvmwCf5tIt1U2Kl44MfEqQs4yPMEXfL9r?=
 =?us-ascii?Q?oneoMtqGRLVKNRG4fKZYSteMn7BTDC4QFC34gj3luFeeY21hXJ4Vt5REKuuy?=
 =?us-ascii?Q?Rv7HPB84e0957bmnEogisVSlb2yt7loUomALwtNLwcwNBiXgEgLhJ5HoyOpj?=
 =?us-ascii?Q?vus8UIuIzTFq822Oz7HGON6OQ+dYR3nDir+TOd6f7jSfQFHvm0ugg7R8rk7G?=
 =?us-ascii?Q?UYf9uIQtlWAetmhwgGeywnUuOsqEVTAfM5SU0L6qXKh9tSXZ09TeSJvt/Vqs?=
 =?us-ascii?Q?cm+zcEKCt0AAN4vQYmy7FDzL3wQRfXr5Z9QhFYEj/JF98OaqhWzRhdxeKoti?=
 =?us-ascii?Q?WCgD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f955c9a7-afde-4538-4bb1-08d8ba6911a3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:52:50.4635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ts+cNWLrYSYaTO4bbTJsBxrp9fw40xir61VORPhJss+raC5ui9K5SZAY8iumJW2YjzZ0vw3Yif/6XQZYJ9PLU0iwzvVFbIL2lfn5D5bO3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.126;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_set_backing_hd now returns status, let's use it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 0951d3b2c1..9483edb500 100644
--- a/block.c
+++ b/block.c
@@ -2973,11 +2973,9 @@ int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
 
     /* Hook up the backing file link; drop our reference, bs owns the
      * backing_hd reference now */
-    bdrv_set_backing_hd(bs, backing_hd, &local_err);
+    ret = bdrv_set_backing_hd(bs, backing_hd, errp);
     bdrv_unref(backing_hd);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        ret = -EINVAL;
+    if (ret < 0) {
         goto free_exit;
     }
 
-- 
2.29.2


