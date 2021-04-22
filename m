Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B1936853F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:51:34 +0200 (CEST)
Received: from localhost ([::1]:40072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZcY9-0007db-RE
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEW-0007NX-Oc; Thu, 22 Apr 2021 12:31:19 -0400
Received: from mail-eopbgr00116.outbound.protection.outlook.com
 ([40.107.0.116]:34309 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcET-0003vI-I6; Thu, 22 Apr 2021 12:31:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLd5a01cgi+9IYePnq9ZcLix6m30F8Tk72EZ1XVNEzUf/9WlE/dD6c7+SZeMgDPCza+migfMuCekmC+5EqJw6PUImrfspaN3GnJoetX3NV+shdRJpycb/VkmfvqZN45krKdg4Jo77YloaPpPdTY6zAMTjglYh6VdH59iaOODPv3S5hloapMsxAedOSrygM2ir05QbuagxaLv/3JcqzLqGlhBwOukrRVmqskyPbZo3vxQvhH/QTfJ5Ctan8ooqTFRk3Kc7W0jFtRf7izkQHLiVNsasXHDf3JeP1iFqFFWam7RwxaXaQdME+YrtNpzk992fogTe9YEylULCt+8KI8/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYgVMg7h+2BhVYYndWY5FAhLpal7BhUCSUt/dLZqOCw=;
 b=OfMSO3AXH0tM75vMmI+8VVG3YguZdhnD0SHVHFQVDYY43tXJVQeV43PL8FqHLYiwN+Okv/zxwLP923Gk+MORUoVitDCgNlLi2/fiTusUo77UD8YkEh5qKpvBu862Cr/+R95KEZf4kw2AVOaIm9JnZzizItwJ5eRwxoXUy2frL/j6ru8DzLc08sPYWsiVlsohyrnfb2ZJJ+Q+koxE8jxG5Me5eszEAL28ugo0xqi+Qz7+T6mda2SQzU3kFR5ldnNng1VrJDRmwMnlfgwYSxBBQlI0/C5OGcKGStNWM0zgRFF1dAspol5Bj+ppu81mYujq5HqcyjHmUIF5sKschSaNpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYgVMg7h+2BhVYYndWY5FAhLpal7BhUCSUt/dLZqOCw=;
 b=CfXCiocEE/Z2wUpDLEhnO54vZ0ZQe6K0dLi0av73dzEzgYnLuL3FWykQiVgAU/BJEaI/o3kPqycGsjBnU+vLWYgP+b32NlbN1h3XOPOqhB+D5m/8e7jSMc9hLAgsahA6GVyYCaV4XWEzRzRdzMq4nshH1o/+kuBUQOvx9oYlFgg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3861.eurprd08.prod.outlook.com (2603:10a6:20b:80::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 16:31:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 16:31:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v6 05/12] block/qcow2: introduce
 qcow2_parse_compressed_cluster_descriptor()
Date: Thu, 22 Apr 2021 19:30:39 +0300
Message-Id: <20210422163046.442932-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210422163046.442932-1-vsementsov@virtuozzo.com>
References: <20210422163046.442932-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR0501CA0006.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR0501CA0006.eurprd05.prod.outlook.com (2603:10a6:3:1a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 22 Apr 2021 16:31:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68c5ab0f-cec8-4d37-8730-08d905ac072b
X-MS-TrafficTypeDiagnostic: AM6PR08MB3861:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3861394B229D458E427221A9C1469@AM6PR08MB3861.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k/67qYlukPkQqSzQTr7PtNOU9i2/G61z9fiE9fhkkibrpwz9tt2ItRzekRcUBYLVJESvRRh6weiLqFjTOTpBgcaM3ST652Lj1oPt/shU1QOkuaLRs3m9A5Fi/RecquIwzpOL5ggulq+ut8txiZjHZkYBI3ngRdLS0DkDqGzAPpUJADJcQo3BSrfAsJE5/cfRx2Rbez39uYugb7zYfnKbZB5D6s05LwoSQart+mpfVJDRiXlc7dKT7YyW+Muc1tKrb/NuXcXaZ7gx/Yrc8qdS3MVwk+0YfrUy1qVMY4/AaVdANcqIvT8S8J7MCzS+ukTYvXPJFZD/Oj2VGl20nOcc1OgmKBBfSI2bdolcQjyweAeE+S9ikLNIJIwk+Lfz+3zwt0NSHOPzcZuwZDlAALqs/ckagQ4i1TCPBtr5QRZ5CZG0DVEe0Bt526I+olhHC0TCms0gsk+FAf5SkhkzecUO11NbOc85cG1R93xkgWwkKUn13OPGQ4yv+Y09jtm35NcnNc0vEK3a/q4kFadH7UV1J2lS9FrzDaebD6JJGCc2NNKQtxTWY7de29pd7BwzlP3aYpjbcTQ8ZlC0AQ7IbrHD8RSSlEspzXXen8fA+PEExoOxXpP/MNaUoxntdnVj4cihLpeiYRmlnmNstSgpwqtKHx7B82p9JpFVZj0rVdmCcVwJoIOtxeStAyUly/HkkQXo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39840400004)(396003)(6666004)(4326008)(107886003)(26005)(6486002)(956004)(2906002)(83380400001)(2616005)(52116002)(316002)(478600001)(8936002)(66476007)(6916009)(66556008)(66946007)(38100700002)(1076003)(38350700002)(5660300002)(6506007)(8676002)(186003)(6512007)(16526019)(36756003)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PW5nZpzNAGKazizFqaG7yI6JRV4bNBL/o/SFJtpD6vdh/1IbF4f6k3qjhD0O?=
 =?us-ascii?Q?4kZADbwfeDLP6RgvS/pWmSkWcVeFDmQw97oL2HbzC4bjZcgvriZl8vaxUEJz?=
 =?us-ascii?Q?gkJaLmyUwZjvy591Zo4dtw9z02TyDoyDS1SR7JJlps6zavUcmvFbQKoEQ13h?=
 =?us-ascii?Q?RGXmOJIZo77yAa5Riud29zHLK4zQfXRoIzrHKjyIrEnhp2tNq4I2282impAj?=
 =?us-ascii?Q?3XxdRnMZf3A6UUUIBqv/b1GRsIzDekvlvsgt8DMqwg6W9kDNdLgMtPoI/2hM?=
 =?us-ascii?Q?N6fquzNOUoYNAHONhXmlYSqF2S35GwFl+Zj0G0WcFVdN2CyEKGrRsS0DPsWD?=
 =?us-ascii?Q?VSyWr5/cwAyQlkFZAixAIq6KhqNmrrvJy7siUalFIu5YhkTBtNUED60wJf2j?=
 =?us-ascii?Q?glzoq7UjRGQNN9hjhCf76YVyHMnsa0BmPCyyt9sYQCpP5EbYUNr1gIRhzsN8?=
 =?us-ascii?Q?ugzZ3EniIN6k4z4CtOA3E5TdMds48U631WIC9ntcxOuv3WM1sAvZjtjI/7lQ?=
 =?us-ascii?Q?C9N/QXcfJL6Jv+JKqJ/ds+2QuNWQVnqfkcLWccWek7T+x5Iv+ngdTkgIJyWl?=
 =?us-ascii?Q?ikhY2rMGV7tOFqKWoG+Rt+f7UlogyQm3nYk1+CZ269upX8ErefRc1bHY+F+L?=
 =?us-ascii?Q?4nGrcXpC0xlqYDPvxDMBNj4EFk28jW8H7KK77OJrrP+lKA08vaHB/iqDQYb1?=
 =?us-ascii?Q?J91cJYzGoeR0f5BEu7RH8JckL8shkDw5wQ8q9m7i8L+qNLbC2wF2b7mP+KFM?=
 =?us-ascii?Q?2e2ZLQyJyeUaRCFafytyXwKjkkUXkn4cqfEzRCugMR0Y8KXdKrXpDS5H3/uJ?=
 =?us-ascii?Q?y3emZEBznCSBn+SCRHiSxDPyEIUJgKjhBbUXr8Mw8VTh7wYHsJJg480sKk9R?=
 =?us-ascii?Q?jre6BHvUGtAylxjqm9sK6d7TEI9uTZtxTlKQwaXNPLoKbotJkyWEWWLl7+VO?=
 =?us-ascii?Q?EscB771SPXSubNN+dV7rhwnpwyD+zSZVI2QSsHIuPn21nnorAig8XmarykxH?=
 =?us-ascii?Q?3ms4MLGbfDQp1uZqDrf45pbIN5U4MAb4wxw3deuW1332mWptyvzKst10lspp?=
 =?us-ascii?Q?Ok7Han1tEoMl3Hilgle8HiuFa/eMNsVgJB5ZFoJqTEX+PyTCGAaFwPjj2Wdy?=
 =?us-ascii?Q?s/vFY08iJSetbX2ypWIW+4nKTjRD8ufj9/EmfR26HIiP7AvmxNPf2uLg3jh6?=
 =?us-ascii?Q?klAgBN30yqMVbokqLhmYM52Std5RKnqNLX/SurJxB4Jlbor0HFt35BfoAo6g?=
 =?us-ascii?Q?lrhOORDszE+LgmRiQi0SaBAFe+IgccODYEmnoErX5He7zYdSReVeWHaejIOr?=
 =?us-ascii?Q?OsNwr8CIoW6OXoQWPV1KY0F/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c5ab0f-cec8-4d37-8730-08d905ac072b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:31:06.3886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewh0bq8wCN8fk0usx14z1oCZvM2ljZeveOwF7vVf+0ywvfYgdIVkgbqLwm67m38adUUQRFz3Qdtcz6fbGEWCaWIZLSgsjpOGicb2WPrrDw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3861
Received-SPF: pass client-ip=40.107.0.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This functionality will be reused later. Let's make a separate function
now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h |  4 ++++
 block/qcow2.c | 21 ++++++++++++++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 95119876e1..511db948ec 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -917,6 +917,10 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
                                           uint64_t offset,
                                           int compressed_size,
                                           uint64_t *host_offset);
+void qcow2_parse_compressed_cluster_descriptor(BDRVQcow2State *s,
+                                               uint64_t cluster_descriptor,
+                                               uint64_t *coffset,
+                                               int *csize);
 
 int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m);
 void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m);
diff --git a/block/qcow2.c b/block/qcow2.c
index 9727ae8fe3..7049f7fc3e 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -4663,6 +4663,19 @@ qcow2_co_pwritev_compressed_part(BlockDriverState *bs,
     return ret;
 }
 
+void qcow2_parse_compressed_cluster_descriptor(BDRVQcow2State *s,
+                                               uint64_t cluster_descriptor,
+                                               uint64_t *coffset,
+                                               int *csize)
+{
+    int nb_csectors;
+
+    *coffset = cluster_descriptor & s->cluster_offset_mask;
+    nb_csectors = ((cluster_descriptor >> s->csize_shift) & s->csize_mask) + 1;
+    *csize = nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE -
+        (*coffset & ~QCOW2_COMPRESSED_SECTOR_MASK);
+}
+
 static int coroutine_fn
 qcow2_co_preadv_compressed(BlockDriverState *bs,
                            uint64_t cluster_descriptor,
@@ -4672,15 +4685,13 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
                            size_t qiov_offset)
 {
     BDRVQcow2State *s = bs->opaque;
-    int ret = 0, csize, nb_csectors;
+    int ret = 0, csize;
     uint64_t coffset;
     uint8_t *buf, *out_buf;
     int offset_in_cluster = offset_into_cluster(s, offset);
 
-    coffset = cluster_descriptor & s->cluster_offset_mask;
-    nb_csectors = ((cluster_descriptor >> s->csize_shift) & s->csize_mask) + 1;
-    csize = nb_csectors * QCOW2_COMPRESSED_SECTOR_SIZE -
-        (coffset & ~QCOW2_COMPRESSED_SECTOR_MASK);
+    qcow2_parse_compressed_cluster_descriptor(s, cluster_descriptor, &coffset,
+                                              &csize);
 
     buf = g_try_malloc(csize);
     if (!buf) {
-- 
2.29.2


