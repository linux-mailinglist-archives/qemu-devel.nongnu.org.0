Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC713824B9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:48:59 +0200 (CEST)
Received: from localhost ([::1]:37490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liX3i-0008UO-US
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liWzp-0003N2-Vq; Mon, 17 May 2021 02:44:58 -0400
Received: from mail-eopbgr30130.outbound.protection.outlook.com
 ([40.107.3.130]:60322 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liWzo-0001jR-Ba; Mon, 17 May 2021 02:44:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipQbn20e3ACbK0/0K1UDJoboksPDcuDTl9y52Hy6CTGQGFZxAyBdcE/YyC2/ITBEkmBUAXDumDc86d2aQy4Z/VJ//oKGMeyzeVM9XreAZ1QLHNgVNb2lHrF9euBSv7f1NZk1qQSh18rs+ZP43dgcmJw873tQ9OLXfJKyxF6s7NWV6Jh0PBmJP/tvlvK3LkXS5KsBXEyuVytBs5VpB/TaoyoVw9RQ+dzkVPmauJg8rnL0geM/9E36D+FBG6QnTYZUQHMS2dhA6lPF+FCWfsfl/eMwAWOqXwgJXAS+SYPjPpxzs+RBKcoFa23W/r1PLwprvLq+6uFCspTpvc9zXWsqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnT+zrPQ2v8EOgoxrgKVbfNcI3ysoPxNMOOeoTGbbcM=;
 b=I49FjaAqIzWuyG+ZbUAm4ko7AwH5ES4Wjo7Qr4tST1Sc5LqYHnOrAdX+eEj7aOW0lA8vPysw4Efltg+cC0Axhf8nnhyLIUgE8rCALzW9cEksw1ahwNh0ZCdk4cwSQkhN1x4/YsLnFDaZr4o/UBfcpEnPsS4NSdHzol94m6LCuznx9lLaeQ07u9E89U13WQ0c3qBBlWnJL4yIm2ItgdwVVj9xADCUICMdb1k7+90kIL3TPestHlNkMqxKHQatOIitVkyO+vd6b8TYVjP4PXZSA0an6Vio5dpKsIqz4J3SUs2iu74uJPPf2v2CvKYqESV6OVFoU4F8ra1AeUliOPHvPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnT+zrPQ2v8EOgoxrgKVbfNcI3ysoPxNMOOeoTGbbcM=;
 b=fT1Q+Hqf3PVkXyJIdr6ned7+ar/v60NFmnCdza/yO5kFLl9wcP0WX6H14ZG2J1o5e+8xQ+/PTPCagAQqbFhcNYHcDdcOPC9N3xG1y6F0crSpa/qZmOVcZewMY2aX9V26k+lVWN/Kcd8WwBvHps9UC+O1VqKDe7NpPqNxiZOeUlM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3382.eurprd08.prod.outlook.com (2603:10a6:20b:47::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 06:44:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:44:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 02/21] block: introduce blk_replace_bs
Date: Mon, 17 May 2021 09:44:09 +0300
Message-Id: <20210517064428.16223-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517064428.16223-1-vsementsov@virtuozzo.com>
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.231) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:44:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b74ab889-80a2-46a9-4e12-08d918ff4365
X-MS-TrafficTypeDiagnostic: AM6PR08MB3382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3382E6B3CE86963919ADC47EC12D9@AM6PR08MB3382.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P6/nkRazXHNJsBfNVXLiltOZEvL7QjNm+RvIRaOZTUiR2+hHcjXvK+81E5bkZWBzNoKcin4JxGU9Ju5FmVrNx4JJG3EwEZ50vrUf4vA4r0fuFTcGaelcxiS9GNUpru60aFo4WfmRRGWkqDm81WyaJRfiAzh0Su57p30Pk6Iy0mp7OIzIX6wZTBQL8tj9crOTfoB0NV8BQItrC2IQCM8QNC0M2yVqHTqwEO68Uei/YaMuzVkIM+MX+Y5dpM9PiZUAdQ1eAzRV3yCbtDJcxeOOkbVEgMjFvRez8mPx03UrA/O6mnHCjrSSoEHos8NrTH32UtID45ps6rNkiKVgAboHnAj69ygxYkV1X/hiyqA87a33FJLB0cZXZ+looeIfA8qrQp3HP92orzsU984PMP/f5BbBMZ12Coau0kz1P5MgvxeoS06jY4LZimpBx2wZ5ggPV9IW60K854AwnxYFUZ4cFuPwSVX5HF1yZm76YVi30dcoA6CyIagxKg5AkyYwtXmwwgTp0Qc1gzJxeKiaykCg4DzvmefFxJY66+L/VYAmXIOCUMtKP2lMw3GtwMaW2ufKYDPLU+UsiQMsRZsMuW3wHVavK+xUPkqZK6BL3LRDmlx4BlG7oHyFDASvTCfrTjcMGM31VvzKh4T43M8oMSHV8xnzlsHrhCTi8uTnaiXOHb6m9tHAd33bRx7syXO0V8LC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39840400004)(6486002)(26005)(2906002)(316002)(36756003)(66946007)(1076003)(107886003)(5660300002)(16526019)(186003)(478600001)(38350700002)(38100700002)(8676002)(6666004)(86362001)(2616005)(66556008)(52116002)(8936002)(66476007)(83380400001)(6916009)(6506007)(6512007)(956004)(7416002)(4326008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?50DcX3CiGw8Ccd8bx/gxeK876XXxMaSnZaLUrLvPzhdEuc8XjK6SjOGOV4rP?=
 =?us-ascii?Q?DhkMT8TOdE0utGvo+YslrpAIyg4CdhMvx2V+mpCq6sn4hz0Tg9INZqoulY8X?=
 =?us-ascii?Q?wAjEn8DOlYQs6DLVJtOte9Shwr3LnQlQ/fv7R/8pKyT22H0T2Br/dWNTqvNU?=
 =?us-ascii?Q?iDGX99bHNefgtiMGFLFYlQWtzchETKmcezU0v/PncqeE+fpTXOL/P7JZmUVN?=
 =?us-ascii?Q?s1UP1N0ekGMyAXB4V1g2b0ckjeRbEvuzQGdRO8gMHXsJRDoHTrFp+BRk8OQ9?=
 =?us-ascii?Q?4X9p8gG+KDcJ8bC8e/yvoPijtaYzOzA8CypMvaZD2p1lRHUC/w4fxKFIDpjT?=
 =?us-ascii?Q?ycJ96Aj0Jr5XgUvQNT1S5d2iQ0FMUVG4WMJGQOR8tt/pmztl5U1Q7JlBo25t?=
 =?us-ascii?Q?mYDmFR7WHxdKpL1lAHP+6Dx6RqcIL09thjNQpS3g/7taBuh7H75Ln/n0DsdH?=
 =?us-ascii?Q?QrxAc8INGNX6LALs5KVDUgUzzJMiBi/RTGafsQyTmqEvAbLi3tDqNgm4zgEw?=
 =?us-ascii?Q?xtOzdbzK3a0i6RzKLAwD+pyL0NTx/eYZLknPKVHGPNtZEHQqYUCaTV/xLgwu?=
 =?us-ascii?Q?Uqtj2ce9eOFvTmz7AYWilUrtmdRLyHQZX3fTNOBkCyQLDWw3xO373gi8ULpZ?=
 =?us-ascii?Q?cp122uCMLYzo+CbZHeDNjM25NdX58b2bU3vk8I90B0nVGCBEL07wN/BQjH9Q?=
 =?us-ascii?Q?ejzf7h895qomwzsMMQJ1mDKCI1NRJt62vRh+0Da9IpzG3YUtSnKvDdZruhmT?=
 =?us-ascii?Q?GIMCDT2Wg8g70VizPEHohdsozAqk/iO2XXTtPvbJGxPgwzAbtiMJTSpf4X7R?=
 =?us-ascii?Q?vK2oieZP1ceYnd/ujCJWSrjKHZdGMnwT4+bzYezucIdZ51b8t7R+wnR92+a2?=
 =?us-ascii?Q?9dDW3ITSNsybijpoo89ydzCKpk3bmD3ZlTyTp6D+N2z5ugyDYdVaCWEwMwZX?=
 =?us-ascii?Q?U5JX3OhE6YEdQRMiThOV6ZYlSFNXbXWeUzfFhkG7aHEBspfhqm+xtjlU25Ms?=
 =?us-ascii?Q?C39s4Bg2MO2qxXWGjumxHsbpWafWZTYsUo5qGD8fZ/H6t4O/2hPFQhbd9ob/?=
 =?us-ascii?Q?zSYgZciuEo9Gh4KWCFHMQORjxCNrrlD9WChxRw+CdBcVAu3OYIfkZujBY+kJ?=
 =?us-ascii?Q?3Pz2xgLrRaGA1g0Mv1TIp4wUapcWchITwFcdmoynUfhiVCuzCy+1qIQJgQbW?=
 =?us-ascii?Q?hTh7e64IAT8Q1O+kFQ4sKospgUGk7WprYpdCEebDceDZXG9W+IcTl3nUoJqn?=
 =?us-ascii?Q?pvrIvUlq4OHPYPUaMs2a6AljOGrhQA0rm4K10FIVzP1hCwKwdsdwn5Pj84gA?=
 =?us-ascii?Q?dHlfpmaQRk1jtc96fDJj7Mt2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b74ab889-80a2-46a9-4e12-08d918ff4365
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:44:47.7539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJTVSTVZqc9ZJ3twCIF69FV7G5tHGhaGzh5HjdpXjjaBCMQtCOip/WhX4Aifl0iIBWVCtichWLjkcL25umjT91yVllVVasjOU0kTb1X5eww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3382
Received-SPF: pass client-ip=40.107.3.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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
---
 include/sysemu/block-backend.h | 1 +
 block/block-backend.c          | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 880e903293..aec05ef0a0 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -98,6 +98,7 @@ BlockBackend *blk_by_public(BlockBackendPublic *public);
 BlockDriverState *blk_bs(BlockBackend *blk);
 void blk_remove_bs(BlockBackend *blk);
 int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp);
+int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp);
 bool bdrv_has_blk(BlockDriverState *bs);
 bool bdrv_is_root_node(BlockDriverState *bs);
 int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
diff --git a/block/block-backend.c b/block/block-backend.c
index de5496af66..b1abc6f3e6 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -870,6 +870,14 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
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


