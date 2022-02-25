Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F8D4C5241
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 00:47:33 +0100 (CET)
Received: from localhost ([::1]:56462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNkJA-00014j-8g
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 18:47:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFU-0006hi-Aq; Fri, 25 Feb 2022 18:43:45 -0500
Received: from [2a01:111:f400:fe0e::72e] (port=3086
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFS-0005gS-Dv; Fri, 25 Feb 2022 18:43:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gixuE5UjgXTLddCa3ppIhtRDIz5CfeOwslGByLnO9C9+j/rlqBhy0H47fTz0iwIXt6eZts/4/CxUUef6nH2NXPXVrZtP/aDHZRiDRWWSWmZezmkxye4N470dyg3K1J07hfnQzUFZ9LHbJFDO3dFa8geuG017gDJqBT1T88Uvj6qmc7sGF/dwq6JgtZeM+QEkrEpzBHSINweaJYLrLT8dmvPJEPM5cOI2JteC3IaRTVoK71QqVUPzpqJoa8DYGkfddurMP3sAh7vbFVEt96aqsnTUXEnRs6LQUfah8rWpnCJkdS6ha5+nO1TPnPAx7CbNVG+9jCVAxHc3Ep7eH9khxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2PicV2bizgw98dzDmL/lwhMa04dpnVpqMr8kAJZsOY=;
 b=eaVl0x4wUv0nMgW0DvzK2JobQMks1dDlrq6Gfu7rMEehsMGALUftiwHPd5cx3nUENGBGdCnDK5E0U28XlA1zOLo1nrZzNGeyea7vSKVgWcjrewFvlfdsBO4a8Ab89O61D9QZnInbDUNQyGCGfKADIUhiuM11eb2MAI5xIT5t+K+01YDzC35ja//qDUAkB51z19eepLVF71oMyDYqavob9tJwG0PsuO/BPKFEcm5qjlS1SRaBHAC+oSnjyJZ5fRGbwdooNnKtNb2M94jj6mR0unSSQZdCTBrPPnCcibhP2zVo04WqZL1nrh1rI4u4HvCJOaoc1QdjqVc/HXHj/x/vhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2PicV2bizgw98dzDmL/lwhMa04dpnVpqMr8kAJZsOY=;
 b=ZGlu5gM8lHUf2RsWjyouKasLAXBePQH2bPhKO8xyuzh7WJXEYp4NPeUD/1oDZApYSUAhEJ1oCi/lupiyZ0WP/HH88egXTjEHWAH9/RRTfjRSb8iTugdBDUILwrsGOPS0OVGKI0phwaPhlC+Cx/k2vq37muPXDiKg7SitH4FXm0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB4172.eurprd08.prod.outlook.com (2603:10a6:10:af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 23:43:37 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Fri, 25 Feb 2022
 23:43:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nshirokovskiy@virtuozzo.com,
 yur@virtuozzo.com, dim@virtuozzo.com, igor@virtuozzo.com,
 pkrempa@redhat.com, libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH v3 03/11] block: make bdrv_find_child() function public
Date: Sat, 26 Feb 2022 00:43:00 +0100
Message-Id: <20220225234308.1754763-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
References: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::18) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4f47ab1-c2b1-4fdb-c878-08d9f8b8a4a5
X-MS-TrafficTypeDiagnostic: DB8PR08MB4172:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB4172DFC3BB9DEDFD72BF8CAEC13E9@DB8PR08MB4172.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vH8+llE34uG+DW/1kDUXd8oP7a8jB+WeA6d8WL5PKIQJzKzVvSbzLJtcM/71GYD7Vk9Cofa114JX3+p+aOSsbr2HliAFB/tXdz0Sgao7ml7GCUfVNFlPtEdUlDJhr4NeJ8mhLlhbmoZj9OKuPDEE26LT1qwLtfU5tvb5eENXtGg0ahsY7IEWkBoW5WevbbYQygxMbJB0Vy7tkif7R5yVdw4Vn/dPT4ppsKDuvbQ5LkaEQeahEihPHaUIPjzRP+1Zz4RCUZr3i/wYJqV0dyiP0ihePpUBXohjjEYNLzXQkzfNMcIE1DMuGNn3HkmY+cDO91261PbxxLzd+t+iLeHUJHJdKS9Fv7tPowo3B2j1/ckKMFGOCsf3adLBsBDZbs7ba7tRuZfxn/NIOVNaDygFopUHAwz1ioVWMGn1Sn+AvDdkYKMf2GcUl7vrdJhqVygXDlaiQ5wIJejiUipZ5tV5C3TvxmUx4nb4143Ya22ulMDKF4aFdAx4/W3S3fxmsiaOB1F2Bg6IVWPma+CwPi+fj0+xlTOCbMa3gCw2kG4s4mU8HFLHqX3IYuGg4GrAe+qWtNkXyEbUmY+xXLb07uAnBg0Nn30W/G/ppXsST1B6XBzoGwl8mFlEkSfbbq268Nb748PY7Y/QyPuZkppwuX2zPG6HAgHiq4eQWorKA2xW+11aQj18O/61qG9HwCWM8b3ucFkZYxOX2wXYYWhN8XzC4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(6506007)(8676002)(66556008)(5660300002)(83380400001)(6666004)(7416002)(8936002)(52116002)(508600001)(6486002)(6512007)(2616005)(26005)(316002)(36756003)(38350700002)(1076003)(38100700002)(2906002)(86362001)(4326008)(186003)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W1TaHpwM0MDw6mG6SsuqLDlnPd0rNWtHRw9FZno5p2rycsiwtXuBzNx6zfSa?=
 =?us-ascii?Q?ojA0gbKq/b8NmfjvUgrifsvwj7gR2dFOq/H5ngs6IcQxWbsSlP0WYe7pThvf?=
 =?us-ascii?Q?Zb6EnDTGSAFxT0RELMSjWrzbTkYY0nI/cckoP+8/H7IEzAHrxE3q8F5k2Tdx?=
 =?us-ascii?Q?y3epENHpnqr/pYB5ibItIN8GgzfYJuBHl0veUfbSrE30fGwUKth9zppF5lnm?=
 =?us-ascii?Q?Pwinlex9Gn85zC7Tv7TZk9d+VJjyU92AoqPLomSBX3EqhjO9pjxqqbDpJUG9?=
 =?us-ascii?Q?MnJOcEinBB2TbySS9Z9wd8J6VbkCBKANTG2yIKdQcE31J3qUj+4UQmzSzjPY?=
 =?us-ascii?Q?J5SEv7u1NYaiyEySP6DKtthdwWXREYBq0UQHovSZJ+ZIFsn0dAayrvStsuag?=
 =?us-ascii?Q?Qb7jnQ4rFCg0Ty9cP4PKnOZsjALe+L7viTETpnbOVZWH4Xi9aXsu4EUTnl6J?=
 =?us-ascii?Q?5Bk4Wcmsbs7+Co6+Rx0NzmXdrelcr5Xqs0Lhjk9sJldwSlbpET/OC8VVT6iN?=
 =?us-ascii?Q?2+TZZDenN5/5T5qsr6zAz8D/we2HDgy2jUf3MJ7+48stdOkfrIBEELrSjexA?=
 =?us-ascii?Q?JPH2f4HO5sM5rtVu25sDxI/MZyj9uvCW7+7BQ3H9OWSVEUWfBEu411OnVqfl?=
 =?us-ascii?Q?ZuDhlnj2rGRTIBJscSsML90q/FX2E5yxW0pPnJFx3SpWCuSbaIiinPIZc+Ih?=
 =?us-ascii?Q?K2fQiZlPUu+Ty5Za2tM4RhiZRq9C+N5feTTgjwbpC1RvERgwMQrJoZyt8aUD?=
 =?us-ascii?Q?88DSuJGFWzl15x3OIDbueLfY1qph2K/8YNTjo7ORfczVX+8SeK5/NoKvMY4L?=
 =?us-ascii?Q?WOvmx5h1PKlDK9hYjoFkI4QTviTLfKSyJwbmkZfwYuvRyNz0UQbtQcH65kQe?=
 =?us-ascii?Q?sNIQXrdjX9gr5mxB35B7Jy7Qqt3AMOtCUstv0Z6GgSluqQH+bDzubhTx6wmd?=
 =?us-ascii?Q?HhkVDWbOlxRS3V1X0A0o5RS87d25elYm6M3aW7u4P+CJaHcZxW53Ym+SS6/Z?=
 =?us-ascii?Q?8RA3T1h+aiYCh9Cc7/CXkzY7FRHpeLpek8WAxeOnJZB1FcM1xoIKN+Gw5mH0?=
 =?us-ascii?Q?+nivj0pGieG+/HjAz8TV4eqrVSA0xwxLDvA3BohwUvHtivfh219NtlXgCSlT?=
 =?us-ascii?Q?gInRy6emWDdlMjrFxlkoZiffIqSlF+/pQiZs10hkHipeO9aaKO/FnHeWE/7X?=
 =?us-ascii?Q?VMSIRWexXZueqprP8PI/pu0JVE9XCa+1NFR7SMUB3sy84yeKUJiDAZ6A6YFg?=
 =?us-ascii?Q?5o1VzNeFOpQpttDAuKUlw95F5bZiiBT4dq70KAgpSQfQwY/3jmvj8s7tf0lU?=
 =?us-ascii?Q?bJ3kdbG5aPcX3GgAy5MtvXq8N8PM3szlWf2beq5QaDvEwpuP1ABzgTZUwgNM?=
 =?us-ascii?Q?LoTUlp2tIvF5alEYUfluzFV+2AUaSs9q6Y3dE+Ed3sR0MA2IZOl5d3VuHVgf?=
 =?us-ascii?Q?ztl052sYcjQzw29FPGLZXjbocIUKe80/iYHNxY8pOmdSHyIN8dRRKtYy3SwJ?=
 =?us-ascii?Q?ezRaCk9UbzWONrGE+2QF6ef7ZZBYMTpw2ptieECR1+8B1Wvbo7TCTtxSEi96?=
 =?us-ascii?Q?eKW1TqKfzG2EzsqHgDR8ZA2FrMgUCvmpxh15ipRHbkUoE0/JHL9He48fwW/u?=
 =?us-ascii?Q?6wBcceSHUTI2Pns1YYStDKzG8RG1CtLQKvARMpWD0j75Z1cNcUbt5AZ9g0Tl?=
 =?us-ascii?Q?xA1haz0nAEtKU09yhcC86XSBz08=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f47ab1-c2b1-4fdb-c878-08d9f8b8a4a5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 23:43:37.0884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVqb0fzLqsNPQAb3nWABFmG9NGbelaAGJ94E9eiYb1c0CPGNPHQvjEb4D0VAB5fJH3jwSNkEDFPfuON7ucjIkVI4FTC2U7NQ7mgxukicz3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4172
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::72e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::72e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

To be reused soon.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h |  1 +
 block.c                   | 13 +++++++++++++
 blockdev.c                | 14 --------------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 27008cfb22..e44348e851 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1430,6 +1430,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_remove(const char *node, const char *name,
                                            BlockDriverState **bitmap_bs,
                                            Error **errp);
 
+BdrvChild *bdrv_find_child(BlockDriverState *parent_bs, const char *child_name);
 BdrvChild *bdrv_cow_child(BlockDriverState *bs);
 BdrvChild *bdrv_filter_child(BlockDriverState *bs);
 BdrvChild *bdrv_filter_or_cow_child(BlockDriverState *bs);
diff --git a/block.c b/block.c
index b54d59d1fa..601fee163b 100644
--- a/block.c
+++ b/block.c
@@ -7728,6 +7728,19 @@ int bdrv_make_empty(BdrvChild *c, Error **errp)
     return 0;
 }
 
+BdrvChild *bdrv_find_child(BlockDriverState *parent_bs, const char *child_name)
+{
+    BdrvChild *child;
+
+    QLIST_FOREACH(child, &parent_bs->children, next) {
+        if (strcmp(child->name, child_name) == 0) {
+            return child;
+        }
+    }
+
+    return NULL;
+}
+
 /*
  * Return the child that @bs acts as an overlay for, and from which data may be
  * copied in COW or COR operations.  Usually this is the backing file.
diff --git a/blockdev.c b/blockdev.c
index eb9ad9cb89..d20963be2a 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3661,20 +3661,6 @@ out:
     aio_context_release(aio_context);
 }
 
-static BdrvChild *bdrv_find_child(BlockDriverState *parent_bs,
-                                  const char *child_name)
-{
-    BdrvChild *child;
-
-    QLIST_FOREACH(child, &parent_bs->children, next) {
-        if (strcmp(child->name, child_name) == 0) {
-            return child;
-        }
-    }
-
-    return NULL;
-}
-
 void qmp_x_blockdev_change(const char *parent, bool has_child,
                            const char *child, bool has_node,
                            const char *node, Error **errp)
-- 
2.31.1


