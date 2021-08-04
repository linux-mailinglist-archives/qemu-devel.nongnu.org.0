Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DEA3DFE4D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:46:10 +0200 (CEST)
Received: from localhost ([::1]:57738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDTV-0002yP-0v
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMP-0004aS-Ol; Wed, 04 Aug 2021 05:38:51 -0400
Received: from mail-eopbgr70101.outbound.protection.outlook.com
 ([40.107.7.101]:22757 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMM-0005wf-TW; Wed, 04 Aug 2021 05:38:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNgh/NcwXI5oKyxBmHmUG+j+djQBMMCcIbYpZWtYMUq9lOcr4nSQRJmrbol4bcbXLsDIJj5Pm4CN4CbR8sPB2+AGxk+2YtDyrYHzKIOOippJlx7KmSIzsvFTyCqrTJGEAIbMjCL1WFPK4ZwONLJxe16Atol0Jo3aacyPgqbT/TgTqQl5hVq2nK+JiYWAwf99Y3aekwZUcFPAK7OVQ0pffQo53LJPAhLaqynFZor2wVf3P7d/imkHnHcC8loG0PEZJlvPOUIJ6lD+o3ZxzD6Aoz+/V+bxXjfDfawBmkh2WYtwybMfFRo3mrN2GTZtktMEwoCnhqneZVuFhUMAK86pcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GmJJP2me1hAQJQvNuKG3Yp1F2STkJylbpXCBY/QG70=;
 b=mqFWvFNLRZgPsuu3kPUHKV03oE5qgwdSVPFeisxHAWIeNHonb1reDS06WTwvFhCpYzd4zucZ4/bDbkhi4uu7MrchM3ZOrF8PP55i1nz/AqhbkQoaB/SHZW6BCFVJJxFUtJHXh4gWj8hWIAcEyrZE8Hg9Fvj8areoYEAMpyDXm8Uedc/cYlGYK3GGGdQy+YEev/I9xPOVF/EtpeWcVlSX6VVY9jWKEUuPoe3h3cZrrilctoXIZnBW6JG6/sA8GBtqJ2ptKmv2JIC/OQ6o/ZsAjmWhaJbVZ7XK+1P89rp/4OxE79mDL6f3PWQU7tm/qH0Q2q6dumAnmCHL7hjuXPdZng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GmJJP2me1hAQJQvNuKG3Yp1F2STkJylbpXCBY/QG70=;
 b=Ux9ySmPC5oOVCOSIepTo9s2ul/s1CABeKw3WdYUsKdu2GOGGyLc9V7d+xra4r0CdoUexyppYQKTWdCA+7k4ANN7Njl86CWjCRl93cr5ijE2wBZkpOqqy+GXHA2svDDQ/OMKk4LKfoZW1rwJyidoxZ+tInNkdjPMEphFmlHacobg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3622.eurprd08.prod.outlook.com (2603:10a6:20b:4c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Wed, 4 Aug
 2021 09:38:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:38:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 02/33] block: introduce blk_replace_bs
Date: Wed,  4 Aug 2021 12:37:42 +0300
Message-Id: <20210804093813.20688-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 984c9368-56bc-42d9-1dfc-08d9572ba2e0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3622:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB362278D6B9A68F28EF832FD4C1F19@AM6PR08MB3622.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MzOh/gtypD1F/r/H3QaFV9gkbT9zTeopnJspl5WLkshxSFcpJ7JEfFlm6Aq8ybxPKU1MIuCkTdT+XK+EsZISq7u/BzpS4B4wG2/q+lOtm+F1w5Ot5j46V1sXl2Vb8k1uRotc6BNBbp/IueN4BlAumL159JAmz/Xl2fNOsSxx8+DnB+Dh4w3uY/9BO0fWsshvOKxszLyGciaPrydtMJ/ZhhzKc7plBozCsiVlbKZdCZ0W0pEMkJMSx98W+Z3OHPg7y/WRlCc5t5M5xByXZcBh4Tl0/WX6Z1LRskPJ/SeD+uatcanICGBfEoXu5nJ+jDLh4Qy+i6KhLBYKjGBJKG2CgR5Yu0kA8ur5iwOFnFwjTJoPdcUp/49Btw+Rtk+uSNHURl2M7CCF3Nj0YvejyRCnCsawcj0AY7Zq+TcJ0Vxg/9VWWvGhfxvgMNoz/X08RpoGtyehxJmJSfSAE8Qo89sPE0FgBuCUPf1vM4eBA+gXRcO5HTaRi+NrNYF0tT4IeIXtH8WR3Tl+SAd/Ohx1RyALdYu90bvGJmLpdcpHxBrIn9Rm6Eb+aLT3F7nwhKP2xPuLioLQymbLVc2vvU1S14agmjumuz3t4s2XvwkO3QF5VJmokljScZvaBKJbn2aAJr1nuqy8G7nyFV/TRZMnJvrNC9l+yoNpM9Y+AfYVtvDfFODm+MJkL7bsY4UkAOenVt8sch7eVe81CXE4b4r/6rmNOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39840400004)(366004)(4326008)(1076003)(26005)(8936002)(8676002)(2906002)(316002)(66946007)(6666004)(66556008)(66476007)(6916009)(7416002)(2616005)(6506007)(956004)(86362001)(186003)(36756003)(38350700002)(6512007)(52116002)(478600001)(38100700002)(5660300002)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GfhAkfv58ihZJqMY6KLTj2mCCPp33VFEtv83wQLJjA8CQ+ZWyAZlPRS4ypOH?=
 =?us-ascii?Q?TfPyVyxnJwRPW2F7GNE/sLs6KGfNu8hZMNlcNW/rlT0slQg4vooGAT+2IxMa?=
 =?us-ascii?Q?78qO7fTalvRT7bTV6mHiLKEsg2T7u9w91OYXXPoO9NIyrmu4yfLaK0H6xHbL?=
 =?us-ascii?Q?G0ljPsmrSIDF/YuOCpxYs18WkOXfjFwZ1g/Ihgvyet+k+uerExx7YFAkqBAP?=
 =?us-ascii?Q?2O6yqUx/La4ZEhnuUdsSOH2pw7WZMHDqUSckGCTpEfcJl6PyWhwEYQl/ON1W?=
 =?us-ascii?Q?MDLUEltbS9z4Zd4hbrgWuVjCeGgfGWqpsazOS5npdICB8UkxoTijm/lS/Uqj?=
 =?us-ascii?Q?HKhsNa423gIa5bjB7+2gsGYD1oSUS52/bIiHjRwM4KxXlbHJ81Pb9aTy7L80?=
 =?us-ascii?Q?FicR3cIpY2F7NuMAosYMlksVhRzPez2p1VIvqPYsWe3d+oYSbICP7B4hZXNZ?=
 =?us-ascii?Q?bpPbVJfUeQbohfIXtkxLuJgSdd1Yl+2aVUGZft85Qz020IybK80Njmu7OjwT?=
 =?us-ascii?Q?Wg5agUP4nsuvBPHiSh2ZT/MWVirAeB8LRywBv7UTqRQS9E1J3HEnFgOHYp7B?=
 =?us-ascii?Q?M4tXPd3qqjcpvBUhJ2TCXJO7zA3IK1Akk8+6DIZUfzPt1fQfhEEo+YCheQod?=
 =?us-ascii?Q?mhgEsekcQhAkHBMUrrzfXRlNI0fVXLymXvtsVzFDM2ZwBaWQmEPzjPYbiG4f?=
 =?us-ascii?Q?qLTZAuNBIeT127wE0MZ7KVwzGqFHTZj5OI/cyXUPr+fNIqS9pz3+imnhhdAq?=
 =?us-ascii?Q?krfrIGz39Kb6rDzY9IQtmSRDqSATBwEYUqJzuoK8mWJiYQGsuKdQ5SHyG8Dw?=
 =?us-ascii?Q?o1K+IWzN08BB8H2/ArLywudf2geZN5cMD6lVkJJzkVeNgi2voCtT5Szj9trT?=
 =?us-ascii?Q?tIBcJ69v6Pb2uMCfM3WFwLIU0fPSFoW4iHhqzSMSNUteG1Gen38Q7uId8S2f?=
 =?us-ascii?Q?5CC4egPF3H40nVvpYAu0RJvjSSEJtuxGpDSOk2gELagpguc56K+Tzae8lue4?=
 =?us-ascii?Q?czy2YVGg9SSdfNwatHzBmokz7aGmUEAy21VvAoW+TZB6ysfdlBgZGhxauHkS?=
 =?us-ascii?Q?ke5kQO3KfO8EZZ/yn7v7z9cuXY3F+qf0E1ZrT5Vn6oaad0rXdh/UgS5qtFvB?=
 =?us-ascii?Q?NzEGOx7Exn+yQiEr3kpRMXnhOFA8yGIu6Hcfjyaz4TkuBoaM8q5hYdh8Y3dQ?=
 =?us-ascii?Q?K9Tu5VGfimFpjYwVFFCbpQsV+VdOyju4DGD67VQIea8qf5hAlP1/Cgyi5546?=
 =?us-ascii?Q?H+Dy+hOIxBloOIBu6tmETu06autL6U122sJgZihwp5z66xy1p3i1cOs8KU5+?=
 =?us-ascii?Q?l42JkqEbRkJyg13C7yv9cpC0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 984c9368-56bc-42d9-1dfc-08d9572ba2e0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:38:37.8995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqrSXkaGqx+1/GVjPvSz6epZtFM26ycVOos3cywL1F4iNsemFUmJGYScW+UIA78OzN32VsPnVOx8lqYNKhYGW2/iXkImC7bJmQjqMg18qmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3622
Received-SPF: pass client-ip=40.107.7.101;
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

Add function to change bs inside blk.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/sysemu/block-backend.h | 1 +
 block/block-backend.c          | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 9ac5f7bbd3..29d4fdbf63 100644
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
index deb55c272e..6140d133e2 100644
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


