Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC9F38E8B5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:27:06 +0200 (CEST)
Received: from localhost ([::1]:36290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBXt-0002BI-Sz
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBS5-0006ur-Fa; Mon, 24 May 2021 10:21:05 -0400
Received: from mail-eopbgr50103.outbound.protection.outlook.com
 ([40.107.5.103]:9605 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llBS3-0006u5-IX; Mon, 24 May 2021 10:21:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzlsOiRzYNFDtqeKMcvnmGbaDXIbV3aLZU2TIFudiu8pOUaftGpz11t7j3lt/SvK0bJqAjuZK5VzLN1QdvBOmcgHc0FbF1jLMwvH7HuvsPVzfZ0msSxfexEcHDdYcn8sC5mX3dnyqVVm38cEekRsJ/0rqJUjOE0C0qyD8qnum9MLhYE467lGswiBWMM16FtJH8mXOgkJjgfZZboa4Rltwulzw0k/9NCohz0YdXUWd9pZRExwVU3BKYu1HIt+N1gBGtx+qwipzko25EALxrDwCWGLVGD5xvMR9diDnYcCWlSH15PrUzOQNZnDW7acL37B8zi7dyXquq4UMjM9XrYxmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJSAqSMQChtTeR2gMDl2jR+cz13jXFGwW7pDat7i1tE=;
 b=eCHcnP/8N8ymMwIrxd+GwtBb7+DSzl5oEl+m3VTGIgG9RGF78ZnCtwkbGFGbK6wKINkhSrB+LzY4BasJ/UYKVgv4ts9zzkvd+7b7BNFCDHxXxfYGV2nbcd96izuSDNbcYZWzHr+C/pjlZQ0wzjQcrokB0SnZx8il43YETrSASxyTKPjsu6dh5VDpT5+L0I3WJIzrVKkgwf9mcJ5J30opdqwAA8ouPdPSPC61ryfP4jNA44XY69YA+9whS+HHsLMR6ktuoDKLoBCmB5fi/Ce6rKMEmQNJUczcfVNZsKUmMfMF0uQGefaQr7LEoLjD8gA+ZS6Mu282s7N8zeg8sgLr0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJSAqSMQChtTeR2gMDl2jR+cz13jXFGwW7pDat7i1tE=;
 b=hnDGE+1pqqVIfPOUBGLUacjl+tvTow7L7f8sBKRw/c7GOVLB7sRWjcoVg3ktKeG1EJ8myKVzgIjTsfwlrUiZoenzKb7GLwjmcI/nXnURuiGZlmmWUDsqaogFRqmRrEI5JbhQL8ZD9P3IZMAjd/p3iSuMxg4mj2BZnMeTv8as9mw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4165.eurprd08.prod.outlook.com (2603:10a6:20b:a2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 14:20:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 14:20:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com, ktkhai@virtuozzo.com, eblake@redhat.com,
 berto@igalia.com
Subject: [PATCH v3 05/10] qcow2-refcount: fix_l2_entry_by_zero(): also zero L2
 entry bitmap
Date: Mon, 24 May 2021 17:20:26 +0300
Message-Id: <20210524142031.142109-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210524142031.142109-1-vsementsov@virtuozzo.com>
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: HE1PR09CA0063.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.195) by
 HE1PR09CA0063.eurprd09.prod.outlook.com (2603:10a6:7:3c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 14:20:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c1419b7-6adf-4d78-4fef-08d91ebf2224
X-MS-TrafficTypeDiagnostic: AM6PR08MB4165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4165DBD09C3E8493D49F6CA0C1269@AM6PR08MB4165.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:136;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LgKOLtNdS+vIklbQErQid2shG87fytFurz4wsawchap/LdrqW3xAAkkwJRkinfO1/4ODygPdya344nr6SJtu1VeBFZJrxgso8XM/YPkmXUU2TGFBxggBiI4UTv/3qFzIqQwrTYR4DY6CdSmszRyOYqCfE/GMrTfzlo+wsK0wEDfHpqZH40scCUCcENL+87/AfK7jxVv/Gz6EgX7ysz9fiEBTerk01vppAJoxx0H9Pr71kH33+e74scCuOww5gyb9liQ7DQvgKzVRiYDvG8AsSn3iVmy9mKR1X+B6cFe+75ZA4l5ZBhJ37zUontBrXnRaPCAOomworXej4MbI1+1mgoUKpAvOTvisUUhk9D7juHzr3A+NIv4O1/evjOTYNPaq/F80/jbUY41++88J9GYTZdMngQPM7eYoHFenTjRH3og+flsblbqoOsYnOU36/bH3pZEQQIVPU6ahAigxXxpqOUubdFzTu8nDsRH22JzlmAklpal6rVxP5S2wGq8Ry5IOqRrpgNJvSpFbth3jSwuMQMrXDl46IgbPsuXarwcPEaQ1VIKGHIEXs+Mbud+iyr8TnAFGC4xlY1G7IJrkQnEx2K1W6XSg16PFGLJG9EvC0GT0vXCOHNTxyPiTvjB4lKGEBsNh0HhcWPN71bjAO6LS7vnF4KR9gDDRcG1JEfeqwAMto08RK6ULnHsS04/Tu1YS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39840400004)(366004)(396003)(6486002)(52116002)(186003)(36756003)(478600001)(2616005)(956004)(26005)(8936002)(316002)(83380400001)(2906002)(6512007)(16526019)(8676002)(6916009)(66556008)(66476007)(4326008)(66946007)(38100700002)(38350700002)(5660300002)(86362001)(1076003)(6666004)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4nurqiv+WZCm9RH6osSjDZMGbdLn9gZABeURWpq9HUg17yh1VBu/tzPRhF9Z?=
 =?us-ascii?Q?fzUJs4Um04JvelNPmlnfefRFebL3SmMhJ6MoeX/QZPagB54MXmhOkSKaZZBL?=
 =?us-ascii?Q?usoONCVMwpPozgXvIy3hd32IAdZQ2IFcbddW9ZyrqohkAobNHoZaMu5u2wQW?=
 =?us-ascii?Q?2wBvUIEItFPLHh0ssg0NxQUNmpbZHD+mRivUqD8+zV9+H8eG8cLcUc39KDJd?=
 =?us-ascii?Q?2CmiZoO9xqu2WDMiGx+b7IZ4IOlGYx1bPj99AM1pgRruPCAo1+0VSwVCcayL?=
 =?us-ascii?Q?SIx0YOFmEhEeB+5Kk2XFcTO6vLMxV5wAfBZmNdZ+8F9x/IaKKV8fDAX8xLF8?=
 =?us-ascii?Q?aI59WwC350YagblAjGBQbHJCJ35DU6s0wMqUxMqTKkJ7vj1wPDIdEjWg/+QO?=
 =?us-ascii?Q?2CJUgwAHVRiiZfRIJYMOUXrQvh7VH5GPLCeT5klhshDimKwocP/nAKZ7c0X2?=
 =?us-ascii?Q?OaBOTrL44fI6WHfDG88V4mqV7mSwpMotLTMl0adrB2Ua2XKL0kiub61EKyjl?=
 =?us-ascii?Q?h7MLbhPhPywpYk0ZqfqSYwQnYlXkx5cQ23XZJxksUcQQjUHE3/SXGn/PQEPZ?=
 =?us-ascii?Q?F1o9Ms9QpRmRdVn82/vjO9+DlpZPmeHsk0Ss7/mMANZPZMxdr4iV3YDYCI7J?=
 =?us-ascii?Q?NgCK+47HQyYh8sm+EPrEI1PGgzSU+/nQg5AikqgSKlyE4JDoMnWwQlxHDRtr?=
 =?us-ascii?Q?wVwQzSuwg3evoXcLgLMTga1ilcE/H5bg0G9ywF2MTMD0ZBWJIn9QG7eQjI/U?=
 =?us-ascii?Q?RS4WNN9e+9r3IKvViHz5t8STaTWFst4Krmixk9X5M7/mP4tUmTBJ9yMYe4LU?=
 =?us-ascii?Q?F4jTDxSZekM1IKRhQoTZyFoCtUkmcXUN+h3MgVPHAvKlVbHsGlGjGuUGJ9lH?=
 =?us-ascii?Q?anPQQnVoK6KQxkgk69AisZhKObiPsiyvFDGb3ezkPCdZMtay1FGmaa62g64I?=
 =?us-ascii?Q?jYkkOOF6hIh7YOUpapSVxQc8npDB6R2Q+n53csqvXHXfwW6csx2k8wrbUaQ7?=
 =?us-ascii?Q?gLmNtnBZUT9DBmveJrN7OYgIir4zV+2At/Wod1UKL2uGvy3Chu2hlDCPJh2b?=
 =?us-ascii?Q?T7YbwCzZbe9sBe8kVYiPw4M/McECsArYpU9yQG+TdO6yyhzz0t4pN4lYNkCp?=
 =?us-ascii?Q?Nch/LIp+g3cfKvi8Wdux86h0R6fR8nj3AwddKyZdePzvT6GI2bi8azRHhDqy?=
 =?us-ascii?Q?rYsuhPS+GWeVkc1mNYiIi8OWZn9Wuy/NpfRRALq2mlaWzlSb0AXRrcCkgYK2?=
 =?us-ascii?Q?wuBCFiNnw3iaC0hpLxK2TsfLxGCuSgHZ8pkl9F8eA2bfJSOCWjLAmSyvrV1/?=
 =?us-ascii?Q?8mw+vSD9d3TKyd828o87esur?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1419b7-6adf-4d78-4fef-08d91ebf2224
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 14:20:51.1262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OviRoblf6S+ys2uMjIfaZaB/ixChuCPp4R4Z/RRk83LIfi+E64Nn6PgWKiaeseqG2x44zYmw3S7pevZhIicbxoTijRWixBN3xx/jsbZLE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4165
Received-SPF: pass client-ip=40.107.5.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

We'll reuse the function to fix wrong L2 entry bitmap. Support it now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2-refcount.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 184b96ad63..f48c5e1b5d 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1588,7 +1588,8 @@ enum {
 };
 
 /*
- * Fix L2 entry by making it QCOW2_CLUSTER_ZERO_PLAIN.
+ * Fix L2 entry by making it QCOW2_CLUSTER_ZERO_PLAIN (or making all its present
+ * subclusters QCOW2_SUBCLUSTER_ZERO_PLAIN).
  *
  * This function decrements res->corruptions on success, so the caller is
  * responsible to increment res->corruptions prior to the call.
@@ -1605,9 +1606,20 @@ static int fix_l2_entry_by_zero(BlockDriverState *bs, BdrvCheckResult *res,
     int idx = l2_index * (l2_entry_size(s) / sizeof(uint64_t));
     uint64_t l2e_offset = l2_offset + (uint64_t)l2_index * l2_entry_size(s);
     int ign = active ? QCOW2_OL_ACTIVE_L2 : QCOW2_OL_INACTIVE_L2;
-    uint64_t l2_entry = has_subclusters(s) ? 0 : QCOW_OFLAG_ZERO;
 
-    set_l2_entry(s, l2_table, l2_index, l2_entry);
+    if (has_subclusters(s)) {
+        uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, l2_index);
+
+        /* Allocated subclusters become zero */
+        l2_bitmap |= l2_bitmap << 32;
+        l2_bitmap &= QCOW_L2_BITMAP_ALL_ZEROES;
+
+        set_l2_bitmap(s, l2_table, l2_index, l2_bitmap);
+        set_l2_entry(s, l2_table, l2_index, 0);
+    } else {
+        set_l2_entry(s, l2_table, l2_index, QCOW_OFLAG_ZERO);
+    }
+
     ret = qcow2_pre_write_overlap_check(bs, ign, l2e_offset, l2_entry_size(s),
                                         false);
     if (metadata_overlap) {
-- 
2.29.2


