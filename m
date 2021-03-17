Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4447A33F3C6
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:00:48 +0100 (CET)
Received: from localhost ([::1]:40894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXfC-0005Mg-UM
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXID-00058p-DY; Wed, 17 Mar 2021 10:37:01 -0400
Received: from mail-eopbgr40135.outbound.protection.outlook.com
 ([40.107.4.135]:23235 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXI4-0007ET-NQ; Wed, 17 Mar 2021 10:37:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQ9tNVE41+8TyxglDkldf+u619kPcgyRwzw59ZzMUNx0EvT+dDK6t+QDgCGQFQ8GBiaNJVp7dqP09Vfd2zWgY4o8jYwF3W7MbKY3zEU/fLqgcVHUnU8FncdXr1lLYFC9GZuaAc2zv6ysayt7MKo9xhENaxA8JDOdwkQuQW4jyyqHv2BzV0RkZlnsQ41Yrxy9kk+9FLJsttaNdEPWbRvVVLro8xzduxsECxO4yV2gziDTAWtFuSqbztnVRvCIax1D4ISjvoi63KREsR6QkfiIkMnIS5Cluvtnp7Mu/EvkFI/9HL9kI+kAh99eWpCx5DqofPBXRFbL1Xb7UaxcmAjXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0H1OEIjGowssb46MmjHizuqPSgU1eUkmvN8f1KzC48=;
 b=UZL6BfAVP5ZLUpkF+2QaVm8QNEu/9RdyksdyF3fsfO659iXZddKFQ5Y70oEotw+yghLJGrs/zIMferTniNllmVHlwxe+sHJnbRhlFoSvu0NPp/eVWvpi+t62u30shPYZz7DOCucThtcvzaHsyOT5MU5gnVz+zF5vK5x+HW8kVNK1+x7BeWXoVACsaeQ/DdIX+XHzzSn9ZcAKc4wJeTmjF6VbffZNoqn0mgA2SEF1bc7DhJVJrH/AERmHNm0eQvGeHPmWd6Wp6yj3cpNEYSFxNZDb/lUIuKUwZgfHKv/vZCbZ5H+J8PrlPCVwofal12ilA42zPKXnzWZfDWSd/oz+fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0H1OEIjGowssb46MmjHizuqPSgU1eUkmvN8f1KzC48=;
 b=Fa7RlvAZu9JTMXZIy4fcrYPvfmHA1AUjcUHOy1DqCogajXF27g42cWiRw0se5W9cQltrPmc5UHFq0xwGU3BsrgsT+nlneJulq+N2PXFfT0lUIRLNK48s/w1ksdFgfZf/56giQs3nPETgUjYX+ZcW/TwVBRJCty9Kb38Dph1oQKI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3573.eurprd08.prod.outlook.com (2603:10a6:20b:4b::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 32/36] block: inline bdrv_check_perm_common()
Date: Wed, 17 Mar 2021 17:35:25 +0300
Message-Id: <20210317143529.615584-33-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79bbaec7-58f1-4b3c-8b49-08d8e9521907
X-MS-TrafficTypeDiagnostic: AM6PR08MB3573:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3573211E27AF330E85C226F3C16A9@AM6PR08MB3573.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzQAXz2H1XBYSVDm4dpJZ4dPw2/YG8MjK5agTlbV5wpDUYTGyu1lZECk0GpOFX29HUYj4isKXXz3HoexQiDuSJk5vpK3Gz1y2AF1KpeMCMS6Dci4PFuxRErHYezloipYJSoALITrHqvaEYl1ApClBnlpoSmTyn9pS5g39nLRIAsQd9Ou546xTe3T90H9W0lS9N+9SqHeYMaMrFtxvQIb/R7kcbHNiLzCIFdsHRQYkzhSoHn/oVgZ1Uqe2r6DzkPvjCg2fP2oc8Y/RXi2ZWlYZK/YlZuE0n5rsea27i7jTznEVbhrUZb+RVIYjEWwaIGcmClSTmBBMofd830zIf9PI2xbSNhdsn9XaSYRcvcrNdh09PP9kr5wxVWRpjxQKReITeCfPFuF8GVBzOCF8LI/Or5AmkB+m5QmYvAQ2i/+EkbM9XBxkUJtKYFYCSBVkuOiUdIKJYPWqSNjyoj9IA9sSOQYZF/g0j1kJXvXofvZBCvqpdfOdp0sABPBqnXNaJ+Em5+t2XBI0xBNTY4IJtkRKtmY7rvBhhEsSc+W7ZLyXp9I0Tyhb3wMX6DrHa22CgAfyknRlZS+jzH1Y2QWXy+RAM/UvwQv1B47Od4t5cKIQFA69nR1OdenVWseaZhEZ3n9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39840400004)(4326008)(66556008)(26005)(6666004)(66946007)(5660300002)(8936002)(478600001)(83380400001)(8676002)(186003)(52116002)(86362001)(16526019)(6916009)(2616005)(66476007)(6506007)(2906002)(69590400012)(1076003)(6512007)(36756003)(6486002)(316002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?grLdC8JeLZYKglgXHRsiHpTiqOMh7AJVIKkBhtphyV5HQ586YxbqYFB+0x4U?=
 =?us-ascii?Q?w0h6IgYf7X7VqGWMvgY7JACocrlsVWlFJAOuEy8wfUmRZLx0D7Z/q6gKju8j?=
 =?us-ascii?Q?c3VL4gl9koTKwgBp1j0fpQYp0+/WatF1/x0xOJ5VnpToBwVNgXOVBJf/JKUB?=
 =?us-ascii?Q?iYb/2wIIaKti1UluR9sPepguUrI+9HbrFg+VNazMX92/YIXMuPP8ewfqQ44Z?=
 =?us-ascii?Q?Vd7b4DTQ4Upugp2sNl1hAC9EELI4GHc6+Ss84iW2dLO1FgKOcIeR4Ixzss5o?=
 =?us-ascii?Q?p0Qt5wMh8035tnRtImH4T5dM03FpjRknclEnwsvAs1xkv1dLlhH3s/8bwZxo?=
 =?us-ascii?Q?HHf8PLxDfrbYtq967NpKgRAjWFQaHF6wX92sExyPwfDIvDCxLJFrfbzqSeF2?=
 =?us-ascii?Q?z5n2XnrFXPdv302B/b+3pcvXEfH+ZhXrWAgpKy1INW01t1//oXvdeSoeu/fY?=
 =?us-ascii?Q?S/W9F4a031AFPoxj1EkZ0Cjd9k4p/X9317JwfwDv9J2qxv6/25UIHUnrhLzR?=
 =?us-ascii?Q?1N7CfLnF/5Z/Wg2zqjGTBSnEJQNmOYpCz+Zq8FdmLfgP0h4UyPtsZdCCvQ1u?=
 =?us-ascii?Q?ZaMTvfhbTgloJtUaEJo91s1fQVBDgfb1kBk7csxB7umTIe6rNoYvhy1jKJUy?=
 =?us-ascii?Q?bO8DWc3J9b703rvzgx4xkflk6UrMsrai5aOjWUjxspOLeMakSh3WWQ5Nhnzi?=
 =?us-ascii?Q?M0X5ODCHGUGhtW3ODcOjS6kO7fgG7my699F57Cr4K2Fea+Vyrd1OrE/ZWQt/?=
 =?us-ascii?Q?BOVqkPu2znqHVTc//uE4zc4KhLCVnxu+78PZk/MC6r+27hETJ32Qz8GRQFL1?=
 =?us-ascii?Q?U9fFOd87M8zaAkiWhxK94gj3J/oQ8pAAIBf2zXTVtf9OXbQuqBI9CfFQil5i?=
 =?us-ascii?Q?2lyv8rsbbNaz1EaN8OEf6xzkEewg1vvl+RKHQQstMX24Fwso6w3eZ+Z83VMW?=
 =?us-ascii?Q?NobKFhMBa7ZCpMbh86xvPTXT0m3twQ9HtxcrB4+v5rYN1zazQ8yw0bN/27ep?=
 =?us-ascii?Q?NVPvGDDk71W6KD6omBSWvDf12AO9JEln6YlR2sLbPN6dj3WB/AJHLlLxK+rV?=
 =?us-ascii?Q?CKlcNseTv7NQxpIIEUc2MopC1KNN6ocEam/3lMdRGzz5Y8FaoSfmWjdr2V4v?=
 =?us-ascii?Q?7dbu3ohligGm37EOi/mnftZ4B9ks0pXVn8lyp2zi2rwQO4uWtFw6UKsDRqCC?=
 =?us-ascii?Q?fwAiZlGoFej9Z2P4lDoHW3dF4R5kicLn/0KbFOe7+EH6Ngdpd/1ncpbvI5OD?=
 =?us-ascii?Q?1FzUWBlYe3RGo6wOe+c5+CH8pLw56qjr9XTUksgrJT/DGB8RiJjD+/rBE1Z4?=
 =?us-ascii?Q?PaLsytgjXw5uabJuzqJF4Jke?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bbaec7-58f1-4b3c-8b49-08d8e9521907
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:49.1043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmtT7tLnZXD6DhG+jhtf1XC0fh+1xPWNODZSloy8s4+dVGTqdVS9dncSuSlXq3vRePSI5aL91Gdf6cPmUjVheYOZC3ndN6to7WzsB8XZx+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3573
Received-SPF: pass client-ip=40.107.4.135;
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

bdrv_check_perm_common() has only one caller, so no more sense in
"common".

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 32 +++-----------------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

diff --git a/block.c b/block.c
index b39e6455b2..29e00c4708 100644
--- a/block.c
+++ b/block.c
@@ -2339,33 +2339,13 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
     return 0;
 }
 
-/*
- * If use_cumulative_perms is true, use cumulative_perms and
- * cumulative_shared_perms for first element of the list. Otherwise just refresh
- * all permissions.
- */
-static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
-                                  bool use_cumulative_perms,
-                                  uint64_t cumulative_perms,
-                                  uint64_t cumulative_shared_perms,
-                                  Transaction *tran, Error **errp)
+static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
+                                   Transaction *tran, Error **errp)
 {
     int ret;
+    uint64_t cumulative_perms, cumulative_shared_perms;
     BlockDriverState *bs;
 
-    if (use_cumulative_perms) {
-        bs = list->data;
-
-        ret = bdrv_node_check_perm(bs, q, cumulative_perms,
-                                   cumulative_shared_perms,
-                                   tran, errp);
-        if (ret < 0) {
-            return ret;
-        }
-
-        list = list->next;
-    }
-
     for ( ; list; list = list->next) {
         bs = list->data;
 
@@ -2387,12 +2367,6 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
     return 0;
 }
 
-static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
-                                   Transaction *tran, Error **errp)
-{
-    return bdrv_check_perm_common(list, q, false, 0, 0, tran, errp);
-}
-
 static void bdrv_node_set_perm(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
-- 
2.29.2


