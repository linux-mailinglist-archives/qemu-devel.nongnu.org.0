Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ABF2C168B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:30:27 +0100 (CET)
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khITi-0003oA-27
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:30:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID5-0004NM-5t; Mon, 23 Nov 2020 15:13:15 -0500
Received: from mail-am6eur05on2111.outbound.protection.outlook.com
 ([40.107.22.111]:23809 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID3-0007Ry-92; Mon, 23 Nov 2020 15:13:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmF6liD+PYJPkcUaMJffxvBpR+t5TPyU/h/GSbBd9fbK9D5IZBfOpGcXcFpbOhTtO75Ljij00o8q7AQBpyYnc7nFqVG5ygbK18iDW1ZlwFoDIUbCRe6NTn0UsZk43tPOCSXIVh+7wJLcqu0bZqKs03n3ZLR+cv0Dw+Hg0tQt/uOOU9sOYM59oDQYGnBUf8lb8VAysYV5N4qkhSs3DtNguKJu+esAad41QnXzQcpd+vZHeIZoKOGtre3W44uKX4zzv88KBUfb/sM5RQrqxSE/3U5mKQJARa/j54qs0DYxHz8dcK6bff/OfcBo/hQ6D9x1VBA+6BIeMHU4UDGY8mHRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WvSpmrgm2lxnns+bF8wGlC/aFTUS5p2RYKVz4J67Po=;
 b=PjhmeMSPEdL0bnhr5X2cr6+jUz0xjHvS/ueaCPfhf0DiGWagBOoDdL8ZFPGM6fKI8IfDFSC9ZUaAfAT8V2m8D8XDCfG3fEMxP7cf2Spy3aAdIKKe0o3DdCstsMz+UjVOCGzlWerouaLoCsSgrDeg1VPT4MxrGveQEmP7Vh05Jet9hbP9odsUmE8p0rbxLvekuZuNXt10sejYbCPz1sxWHakTBB+jc1WPppPGii4YMCcU6MpMgPkWJ8opCzfds1XLMX3V4p70h1j7fGEro6vBmOwJ04o4K5TP89nmSdxPgfIms6C8WtiudRN8UGnyqmCNfElzLEnZqu3rO9l4q3Z72A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WvSpmrgm2lxnns+bF8wGlC/aFTUS5p2RYKVz4J67Po=;
 b=CXJwi+qBrhe6lnMv9XMPgL3LA+C5KxSQxCDxyESO6X3joC6NZKLiw087064/gKl8E+OgxhmhdPx8nL6SU+Yjn/yvf6odXceV9G/aH+HAXj6o0GUQB4m36J0vkhRbTNljWZyCgFuA8tSONSKWP/Up6NEkh+N6ci5Mdg1cExnUbmg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:13:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:13:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 12/21] block: return value from bdrv_replace_node()
Date: Mon, 23 Nov 2020 23:12:24 +0300
Message-Id: <20201123201233.9534-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201123201233.9534-1-vsementsov@virtuozzo.com>
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:13:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 568518ab-658b-4781-3200-08d88fec2db3
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB469053A68DDA00895D7AF24CC1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PTVBiBt6EmtfQyOFL1Q2v0cfeoblu9G27ig3ZvmfY+o91Z5O+lEGy1pE3cC1v5rdQ6F6iV4rB7RVWfe3yx5kbBG0bqIE+roPJqC825kWgGcoyCddStyVsZ54ZU2jSwJeEmebyjpt8gXJYyHb4PHKTWgNRJgXp44gC5Ug+to+NlUSTNKY0BqL0+OQIpmwdsWGBJns7OYniP08B4fGaCYAEKltwnQ27ck4A3WqdQEEmvYZMR/qwiSvgwOV2oQWMmVbUcGFVPOTyDBh32eh8MzTsJryln5fVOAjSJJB26ckTqeV5UaC1MTzSklSR1Enbx4TFVqqhkj5glCwEcIkJDpUBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: gTLbxZiXjlWh8aWx7R3PPr2MlduCWngreS3DbnisFmiB9r+80aJinWmVv33oAbyQvbLPa8SR7XF8VbFBOg4+H7prD5PbgXNDPTd2jxHmPhUBmxKgs8q6kmOnYIzQkt4hW9rDLGdmwHwoUn1uvWw1TpzMR+Qyg4bMsYzQk9se7kj+J6AQ2n8V94SHtmsIAKg8/sX0DBqRKbWg4j0nAlEavX0RqNvRjVr/lHA76SSQm1+UWMoQyDcyKm3ANJBC1o/IlDIrNPZtJa+GF2Aslf4MLcd6W8b7PA39b1Kqgct7w402d2s89m1iRcpXpoXVRMRwK8BJD6AKPhWylO6EHxHoVwtpIWeIpToIgl3mTXUaIkqj6eCiTqTJNPOYA2nArahplQSCgUT5TpWpXNgubsNP540e9wnSej/EYQNPhem0drKTRd+48lrCiJeP0H0NJ+Pw1US2zt2o/PKLV/oDlhcGn7nSVI2enC2OziIvLSy8uxn1dPh29H0mrVHoP8NzWN+IQpscO861faF6G07lQT/P7SpW2fukNdvKU/id/SJuYlWPo5mUhWwc4ev3Ahni1amkD0LMnuXjEsx8rmjOr2+2HNjaZy0ujBPOeOiTZybEdVx+QTAhoG8rtJ1DSEl2g2Gtho8rebBwgmdCfaN2oxwkzo3sXgKx7eekuet1r+TENltSNbNBP0lsCZskPFsTqNO63++1E3IzoudbQkIcTDATk3ZJi5DY2v+iACCej9BJtTbJViwziUSIm+7tWDx4bZS8o1CcC8AJiTDDIe728e7jtbdmCqOh4jWcdHGvth2Rp/EfJWIAjU5OBnsf+6qj844gVDvWQgeL+VuLdW1QMLCxGtDrnDbHO4gxQH+uJYTKWVdamMGuzkaW7n1+Fb/ko2bX1WTUO9+IaWTQ6zw3vnYDSg==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 568518ab-658b-4781-3200-08d88fec2db3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:13:01.8640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7H6SHOMdIzodgXC7coeCvlWuP8l9DBq4DgzOUo/9tk8vVMd0ej/JjUAjATGiNkHyZpJwKIFsF+ilpBxJy20Bnx8LxOL7y3IdQelJyDyH7EU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.111;
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

Functions with errp argument are not recommened to be void-functions.
Improve bdrv_replace_node().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |  4 ++--
 block.c               | 14 ++++++++------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index db37a35cee..ab812e14d8 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -346,8 +346,8 @@ int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp);
 BlockDriverState *bdrv_new(void);
 void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                  Error **errp);
-void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
-                       Error **errp);
+int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
+                      Error **errp);
 
 int bdrv_parse_aio(const char *mode, int *flags);
 int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough);
diff --git a/block.c b/block.c
index 1b10b6fb5e..5c94f5a428 100644
--- a/block.c
+++ b/block.c
@@ -4781,14 +4781,14 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
  * With auto_skip=false the error is returned if from has a parent which should
  * not be updated.
  */
-static void bdrv_replace_node_common(BlockDriverState *from,
-                                     BlockDriverState *to,
-                                     bool auto_skip, Error **errp)
+static int bdrv_replace_node_common(BlockDriverState *from,
+                                    BlockDriverState *to,
+                                    bool auto_skip, Error **errp)
 {
+    int ret = -EPERM;
     BdrvChild *c, *next;
     GSList *list = NULL, *p;
     uint64_t perm = 0, shared = BLK_PERM_ALL;
-    int ret;
 
     /* Make sure that @from doesn't go away until we have successfully attached
      * all of its parents to @to. */
@@ -4844,10 +4844,12 @@ out:
     g_slist_free(list);
     bdrv_drained_end(from);
     bdrv_unref(from);
+
+    return ret;
 }
 
-void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
-                       Error **errp)
+int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
+                      Error **errp)
 {
     return bdrv_replace_node_common(from, to, true, errp);
 }
-- 
2.21.3


