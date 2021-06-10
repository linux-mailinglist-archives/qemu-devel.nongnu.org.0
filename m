Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A90C3A2A48
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:34:36 +0200 (CEST)
Received: from localhost ([::1]:42220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrIxH-000863-KL
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpm-0003Cg-Qx; Thu, 10 Jun 2021 07:26:50 -0400
Received: from mail-am6eur05on2118.outbound.protection.outlook.com
 ([40.107.22.118]:26592 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIpj-0004Ko-Vm; Thu, 10 Jun 2021 07:26:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AywUiTVIKq4CiWWCMGrg30Kep67pPWuvbMCiI3b6hOk1u0cl487kCG+rmndDhBIZgFCAHSrr+c6fA4AOEk0ZKfhodQGGrZ6x9c/zRiz/WB5t3oQkYVkP+zeqLnzFdV5TLOkh7mWvywNhQpU3Pdv/bAEfJta77N/ZdcEymDveimBra6s/0Z/G0SchNuv+MDSuEmh60ycQKI2hS5K5fTnP8Q41EVj82yC3WcDjOyyD+9A1I3YOssfYQJslLGsTQLbTurg4QanCyYsDGPDVLVp4S9U86qndhkfdBgI/qj1QliR9TUp+GyG1EmxdjBweYnWaKaeZo2Xxagc2iVex4a3pig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4U4w/GZqtNTKo+LGu837g+7dHPDJy6BxGloVPkf1KM=;
 b=nQ2d1e/uyMJO1I1rkzZcuESsK+rezIzG8/Ql2ek+pSzEqM8HfvwcokflCS8y/7w5E3GQT+6FpnZGdaAiZl5A3DnxDiGTwSLlcc48+mAzyFmntzYHrhhTGDgu9z7lM+EE4sLbdUzVM9zwW9dmyXafYYUL0WSVr41+0susaKfgQsseqKgns1AlgJ+R5rl2LOmdykyhAtelXJoXrZ5AL9MBI5DtUpF+duU5uyhOneeCKxAE2nMhtn1c9HHJ5m8dlYIzADUeBBJ9UYBoXzuaTk825DgL2D+jf2aHknSKWMmtfNYAt0BUw7yX1zWC2Ylq1MjItzSHpNvu5a4kQwMgpRrCHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4U4w/GZqtNTKo+LGu837g+7dHPDJy6BxGloVPkf1KM=;
 b=vhM/gkmsraCJGIi1Tvk5r9UbWgw9Qyev0WAKZfjvD6xow6a15iRjwkPIqAOAbCVkF3JgMDaVKWP0KAw++gJHNtuQSAVIh+roKVIGj635x67eBiDUUf9gK8wTJF4HD+roumaYO76g/aqPhGpNOU085OhRZcZMgoPkb+MHO5EWo28=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3960.eurprd08.prod.outlook.com (2603:10a6:20b:ad::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Thu, 10 Jun
 2021 11:26:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 04/35] block: introduce blk_replace_bs
Date: Thu, 10 Jun 2021 14:25:47 +0300
Message-Id: <20210610112618.127378-5-vsementsov@virtuozzo.com>
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
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f00a111-7793-430c-4c05-08d92c029c98
X-MS-TrafficTypeDiagnostic: AM6PR08MB3960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3960E09C8140A00738B74D1FC1359@AM6PR08MB3960.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZnWW2uVootTLHQYBE/j2t7zOtg9glg6UBDlEEWaRYcpEOgglFDw3//5X+5zF7IHl+jqk1/rrzw1ykTun9JhPrKg6H2najmjKCycaaFJPr5YhfkR1quJhdEEzDhSUQzAh7BaLUxI4Y9mypOFtqq4MCnqjPygGVz8JDrO188o6BetDak4P2mSSA5Oez73JhRO/Gn0UTjyQsaxWhP+04rydOlBlUOIvrGBybopc1660wGg/AsyzO9iipnXEZ6xR4TKQqv9kvH5frWzt9iBH0Xp0XWFMf70VYogQLUScbaNQw54XLeTcAMZ5eZAD0Y2L7OsTkDRGfsHk+8Di+BFmsdRHiQDIzvefU4rc14jkVAm5e2bEKWIIRJcSLcEz8K7a3qBXfnMqqgh9vc59NdwSF9kzbHyB/hoe5ZGtytoPc0GKdlqJsPDjGXE5w6rE8YeqFe78Gqf5BH0H1/W2f/xAef7H2YWk/uY0WK7xZ4xS+63KRsHTNUeFk+fZpnwMpW7Vs0SMaUlwKDHQ5k84xYuBS/RxLDU5GmNKCB9yN03s6SA9HuIfJRwTHprDNx9BxbuEifj2zlSIMzlBHDIM9BNaDg9aMus2s1/7SRRCejJxpnZD5UTeoAEcIyFMrOEulpx4V4ZePuGKuC/yrWj8g5DIwqLkMkoKdWqR9WtPKnZoAL64Cgxni9nNrFFlHUqrBcuMGWV1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(136003)(346002)(366004)(396003)(2906002)(8936002)(2616005)(86362001)(316002)(478600001)(6486002)(16526019)(4326008)(36756003)(8676002)(66556008)(66946007)(66476007)(83380400001)(38100700002)(52116002)(38350700002)(6666004)(26005)(1076003)(956004)(6916009)(6512007)(186003)(6506007)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?odNaQFYVfVCFSicfw9LY9/lzFt3HfdskgOE+fZdagDq/9sI+qrM96/albyRf?=
 =?us-ascii?Q?0DmB3hXZHYCE56EypfVd6lKl3MbpXJRMcvM1CicIPq0XbPaEsUwnAzh/cR6j?=
 =?us-ascii?Q?vdgIRkZyjknnS6jog2AHiGjDpd0ho00Yu18OBzS8raBmxdq//lMuk6DnfaUk?=
 =?us-ascii?Q?rx+svoOAXjhJr22bHuALNQ5ljPkZZX1UQ15qJCeU5nlXKYBaNraURj79k5ml?=
 =?us-ascii?Q?SPkO+LZRTc/qzejI87Oj2H75sIk00uJa163bFPJan4mKXJrfFXLLkJlQXjoS?=
 =?us-ascii?Q?ySWzV/uRLYCzHaaJmuLACXXnDS3CRheOM7YBH4fe1zCYkd69XzWZOJcdXiH3?=
 =?us-ascii?Q?zC2DzUVtoTkXSxG4lBn5UfxgjE1e+i++PxSEEQL0OIwSt1TRTmA5EJCcxxLf?=
 =?us-ascii?Q?juBgWoqulr6RL4Fq/GhDISiyxcoAS3MSqArCSRGmVghMksIf3t9QJnwfiT5h?=
 =?us-ascii?Q?VnH1D5476mcS3p51gN//hhhh+pDWC2kFoDjgFPEyHBVrP8XU/PlYbHpAVcs1?=
 =?us-ascii?Q?narBYibmQaLBw4nuZpo794Y/B+2ZvmwXXXIkhyH+jFtVzc1Pc7uA+CDyZ3cr?=
 =?us-ascii?Q?3CG+3ieduOOJ5BNMrZyQ2HADEmK3S5yfmeogZGbHbIIi4ysYrVEU0tQkLW+o?=
 =?us-ascii?Q?PGd/hDAA9cXEp0u2VM3FRi9IJqlwcEamDctA6Uhnt3rOdbj6/HYbU/DKEyoG?=
 =?us-ascii?Q?4g7CO1zLFV+zlAs652cVfZo1hG+apeXlY0u2x+3VZ8t7S/lFVBQ2zQVhBQ1I?=
 =?us-ascii?Q?C4rJoF2TeTETUGpEV0+LiIEsz7KcUx2YT2aa//48HwlmAeWhNkauSFBHvgcW?=
 =?us-ascii?Q?iQm1MVmYvxrCe7cqzqDVqUfs20LnCsGT1P3X/xngeFLnwL6wo8cnTcCqiHQA?=
 =?us-ascii?Q?jw6vL/UuMYRViSpCUzFZWwmtrZBU9NVf8ZR4x6XiIcXnxv8TKshaOCToUWGR?=
 =?us-ascii?Q?7FDfRGAUTJo6qXKLb5nKCd0WK7Zn+RD4XP13puXKf/FSSS8XVBaeOcHCl+6Y?=
 =?us-ascii?Q?5Oyw9KS4GWDIYURDIqDKtr8hDWj0rtCi3WG5Ld3YMGB1eZODQGKDw+9/adRc?=
 =?us-ascii?Q?EVIflpyXbHBKTkYyckOGL15Bg5pn297gt4gtLXXfjxb6MiJmW5TbDygP6AF6?=
 =?us-ascii?Q?yqGvHjIj82n2sCxYISgCX1kXgQF/zl/VZ+DA4tlL+gh3N6tdnxAHi/10bVdU?=
 =?us-ascii?Q?zqPam1RXA8yjpHbwJfvhq9YVtTdQuvtIAL3yZUHhBxBHXxeeVCA+pzLJgLMo?=
 =?us-ascii?Q?nwbSg8Oz5gfZdQvywhwIv/1cfjedQztEeeyu84Y7aV3jmX57kyKpQ1rFYHba?=
 =?us-ascii?Q?sof4ecroU8K1Wu6k3QVhhxPE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f00a111-7793-430c-4c05-08d92c029c98
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:37.9643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pM3X5ioyRM2+UVyS1VAz4706A6ujoeTnaV9mUxjHClGgxHimEyGWE3vhCjepM8k2nQEnDpPZE6+sENSxx/GDnoTj3ZoOU+9KB5xtUGyDVSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3960
Received-SPF: pass client-ip=40.107.22.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Add function to change bs inside blk.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/sysemu/block-backend.h | 1 +
 block/block-backend.c          | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 5423e3d9c6..05b0ceb746 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -102,6 +102,7 @@ BlockBackend *blk_by_public(BlockBackendPublic *public);
 BlockDriverState *blk_bs(BlockBackend *blk);
 void blk_remove_bs(BlockBackend *blk);
 int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp);
+int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp);
 bool bdrv_has_blk(BlockDriverState *bs);
 bool bdrv_is_root_node(BlockDriverState *bs);
 int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
diff --git a/block/block-backend.c b/block/block-backend.c
index 15f1ea4288..8fabc1c835 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -869,6 +869,14 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
     return 0;
 }
 
+/*
+ * Change BlockDriverState associated with @blk.
+ */
+int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp)
+{
+    return bdrv_replace_child_bs(blk->root, new_bs, errp);
+}
+
 /*
  * Sets the permission bitmasks that the user of the BlockBackend needs.
  */
-- 
2.29.2


