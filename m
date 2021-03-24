Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C57348334
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:54:49 +0100 (CET)
Received: from localhost ([::1]:41664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAWd-0000K0-VX
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPATx-0006L3-Rv; Wed, 24 Mar 2021 16:52:01 -0400
Received: from mail-vi1eur05on2116.outbound.protection.outlook.com
 ([40.107.21.116]:40416 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPATu-0005Ie-Do; Wed, 24 Mar 2021 16:52:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8+ASj5LisjuXVOUutCLjl0ElTdeXRTphWsjmk2rfN2j7tpGn8JkiOWSwdRBQ3zZZRlo8vdbLCAt71QK9vkI15gEmTqfFPMdYDtWZTg0a0EfTvbiuKzaX+IU/e2qh1wIGnBmm30L6f5DP+TvFIe20QTEJIFwXt3PvhXGI1lfViVEaMKG9wxRXC0XehyWTfUzOzC3W0uQFBnSfDMlqNXeq7RdTwvLNOEdXbwFLHsliZo6FLaLylHIplshoBI68Iz0vzy63b4ODE7WkJSVbnLyblZI3nFeNAEVz/l7CXxt9/qqe3qfsObLC/Q+IAoudYq23oF83aOXmoqGiEbGQUh++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kf5uaxmxNNSZu5jfBNaBtf9iEXVGXhAqkOq91nIXARA=;
 b=V2V10c5xebNmHo27XxRGabuZ3yxAz11+89eqt3Y0tlBnZVScfv3XkesN/4groWdrfs8npGZvmYLv+rpLNhoHGihDrS0x/dVwkxI5t9CD61efog98ljZkbmGDvPMvji9G2Kh//UHJNkMd4MfqacfdzlNkvw7pLR205bN4xJRj3ZWTYdjBZ4N83i3HYdEvbJFBF9tAnlGLDDXdidJrStxBej1U49DyNa8ooDCb6uCMDlCDjX1vbQ0DlOQHPic8OIGMRfmZNZm2YTAC5SDGQCPqVEge0lW1IX4bV9H3UBdBC/EbCMDso7588p3GnSdi9kAT4AiuaCtXc4WQo3YQAltZgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kf5uaxmxNNSZu5jfBNaBtf9iEXVGXhAqkOq91nIXARA=;
 b=gNzxTZAZA8gwCARhnB8z7pjfH6AIGWYc0gcn8WGPNuhQLP4thYbuxSzGVBxsNVmmhec7DVi8XJkID0mKD9dDPsfH6ncEzEdyI5o4tkijp9RAvB/fbPPEYAZn+/QFxDVSleoasFTj03EE4/jlBPs0yGkpXxxLu650iOdbeLqgE1o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5447.eurprd08.prod.outlook.com (2603:10a6:20b:10b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 20:51:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 20:51:49 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, namei.unix@gmail.com,
 dillaman@redhat.com, berto@igalia.com, eblake@redhat.com, pl@kamp.de,
 ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 stefanha@redhat.com, pbonzini@redhat.com, pavel.dovgaluk@ispras.ru,
 ari@tuxera.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 02/11] qcow2: check request on vmstate save/load path
Date: Wed, 24 Mar 2021 23:51:23 +0300
Message-Id: <20210324205132.464899-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210324205132.464899-1-vsementsov@virtuozzo.com>
References: <20210324205132.464899-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR07CA0022.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 AM0PR07CA0022.eurprd07.prod.outlook.com (2603:10a6:208:ac::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Wed, 24 Mar 2021 20:51:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c474daa-2ce3-4ec5-38d8-08d8ef06a561
X-MS-TrafficTypeDiagnostic: AM7PR08MB5447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB54476C9B955B9D80729F5EEFC1639@AM7PR08MB5447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bNxcASoHwlwJnQC2nLK4L+t9+kMTLggdbst1WVmlj+pQwjyy6996XutK2PODTce/2jmMMdv9UPoe10Ep3gp94GjOvjJ5CymaqnZsRHRpjXKz2736O8xa/lNvCmZ6Yvb1yPjR1UK959tgzlFIgE+yzde35m+kdE0GSFGn84JIEY/SOJSyna4J4oX8suoHc5WdfSD4EE4ZgEwNUmnUhovw1EmaKiZu1HmijFc+QQqzsc2KEps21369B/UWVaNz4QU2dXAASaGwH0c/GhnvzB1YdMMf1PdfeF54jx//u/1gIm627GcD1Rsl45pKZGcNoaoqGKdcwXlKJ2EsNDoGo6jEsmEunZTbrXUrtDTkd9aeltTP+2XIdBsJQNbwbJVGbqPX7QTy3WH+FrobC4mZMkOzYjlHD6uJH++7wsOyH1BEAMioFJtzwoqIf2YbdAXTwII8psemofiEk4o+clhtJkynGeI22UOU2QepuCqmqVJezrX+PncROKDh7gfMQiMqZGDCWufSXBz7l2AIXVpgR5d4HeJiSebbbwaDfw8uEul5p4LWBnbPogx9z49fbhUInrhKq6P2pf7T21D6unEL+pjj9InNZH79s/9A0uZZsaGMGDbAsVH9vrPsZUSgJZNDrLGCo7eVPqxFkX08jAItx4Z6weAAU0UiXvT2Qo1Z+UoVJBeLXEDxkFH1q4u3GV/UKpEw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(136003)(376002)(396003)(366004)(2616005)(6916009)(478600001)(8936002)(66946007)(38100700001)(956004)(66556008)(6512007)(66476007)(6506007)(6486002)(52116002)(186003)(5660300002)(26005)(69590400012)(83380400001)(7416002)(6666004)(86362001)(2906002)(16526019)(316002)(1076003)(36756003)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nQcyEKSJcrIwAyvN+HMjGrBa1jhVGqLWV30ek7l0e4OSVhcYQotJ2AGffoFx?=
 =?us-ascii?Q?+0/wxCLT5FHkyZWwHYawo7WZLoZ0vzYj7KLdsSSnSe3F+Lv6wop5jaEbNsPW?=
 =?us-ascii?Q?+BK3Gt4m2vec4MV1/DkRFVmlxtRvIdlqmJ7eUQWX+mS7MGeBhgFZ5B7y7dcj?=
 =?us-ascii?Q?te3S1iNVq6n9L7iomz8NtyFVTShFftZhSQX8jIH7uUHsk2HzblU2wVanxbzs?=
 =?us-ascii?Q?iyCQ9UlxNE9PSMQzx89jM680z+JG9K6RLmoueKCiw2ebgYxX3y+H7V2yVBSg?=
 =?us-ascii?Q?YZ00lhVshonWokXBtPnWuc7lma4GV4brtTXMD1XMIwgzSCjgMDm5tR5qtWYn?=
 =?us-ascii?Q?zlws3jn4XURLvoYojQja/W6s6cohG0CNQR6NuoDYqMs6/pqliNMrpyqpRwBg?=
 =?us-ascii?Q?8WIbPvZlqpwdsRUt3salXpVDe770ZLg+Di3k+Mhv2NnJ3cF7+pJ7l200E34h?=
 =?us-ascii?Q?TWOA4gH2qhV2laLGD+WHd9mqKyg+M4x7PAqYnJQ55t5tzcLMN3IPtHMIgWtm?=
 =?us-ascii?Q?jWhYnCfcAv+a72iUZMJoJBZ/qN2hk2WBKXtuTyp0Qd0pu1KG05+65c0zH2Di?=
 =?us-ascii?Q?QrEtytUgVsuVpf0hnCfRgv1i7wp7PhllexOVT/QEss7RlivE8db5cCJ0wiqM?=
 =?us-ascii?Q?r1oJbtC9YIPL2jzVt0jxgJXc1/jepbnZtsjLaaSWZy5aqD5PxcL2CK57IXc6?=
 =?us-ascii?Q?wFVijpSFG1A1hf5+9T/Liw1aITmhPgpdRGSQfbdG6OMD3lzJKF5wvZby+jXA?=
 =?us-ascii?Q?cu/5sbDoLktND8lVA6ctsfgrfTSnY8c4G0vT1gqB5KFOFBOI1q18liXfqM6n?=
 =?us-ascii?Q?QzSv49MW9eq0rwqfAZy5lzn4qbItwSW/oWCbvJYVAVO2vdUOXfA2SbuSbya8?=
 =?us-ascii?Q?W+BZ/FGE6Z60nLk/6to/M0XsiQTDAFTm32MCPPZIMPlj/7lH12Zh9ukd2I7e?=
 =?us-ascii?Q?qWsFkcG4NoQQxgdjZavkeEJszK/etJTf9gpe0azPDPMLkde9UFzBnrqjHM7B?=
 =?us-ascii?Q?wkEekyV+t/OHPtCvukbM10lCtGAeyQT8vkazqk+HvY9SXF2qyAN+48E3P7+Y?=
 =?us-ascii?Q?SiGy8m7YTyKSiwB0KVTtNmz8XnyySr76g8ZnVYD26asMuYEshtGu26oKxHIz?=
 =?us-ascii?Q?wz4unf1VL+Ua+UiA535oseUSEuMMpmVfK8RMVCNp+WhiU4ARX1oH+3GTm6wo?=
 =?us-ascii?Q?++zsQuBBAykMEi6hsZPVyHf3upp3VjO/uev57Z0g5l20T8n4BEl/J/8XLvRH?=
 =?us-ascii?Q?uDyTTHTJwh6T00nMy4meAnh9Ql3fb8TwUi5gWTM992DHZ6rgul1p/x4g2cMs?=
 =?us-ascii?Q?m2E9ZAb19JbqXntk7hyzaJj4?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c474daa-2ce3-4ec5-38d8-08d8ef06a561
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 20:51:49.7474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dee+VW+TySaGr2bjb3aCfjX5gG0M/wUHF3UoIhQPFvG8rwJQGKlKdplyh6XNoL9c10OASx8ZjbEHRpq4sWtTRfm1cEzG81IPDo52peZ9Axo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5447
Received-SPF: pass client-ip=40.107.21.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

We modify the request by adding an offset to vmstate. Let's check the
modified request. It will help us to safely move .bdrv_co_preadv_part
and .bdrv_co_pwritev_part to int64_t type of offset and bytes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h |  3 +++
 block/io.c                |  6 +++---
 block/qcow2.c             | 43 +++++++++++++++++++++++++++++++++------
 3 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 88e4111939..db7a909ea9 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -93,6 +93,9 @@ typedef struct BdrvTrackedRequest {
     struct BdrvTrackedRequest *waiting_for;
 } BdrvTrackedRequest;
 
+int bdrv_check_qiov_request(int64_t offset, int64_t bytes,
+                            QEMUIOVector *qiov, size_t qiov_offset,
+                            Error **errp);
 int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);
 
 struct BlockDriver {
diff --git a/block/io.c b/block/io.c
index 3bbb852da6..59924867c5 100644
--- a/block/io.c
+++ b/block/io.c
@@ -924,9 +924,9 @@ bool coroutine_fn bdrv_make_request_serialising(BdrvTrackedRequest *req,
     return waited;
 }
 
-static int bdrv_check_qiov_request(int64_t offset, int64_t bytes,
-                                   QEMUIOVector *qiov, size_t qiov_offset,
-                                   Error **errp)
+int bdrv_check_qiov_request(int64_t offset, int64_t bytes,
+                            QEMUIOVector *qiov, size_t qiov_offset,
+                            Error **errp)
 {
     /*
      * Check generic offset/bytes correctness
diff --git a/block/qcow2.c b/block/qcow2.c
index 0db1227ac9..b57acda010 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5166,24 +5166,55 @@ static int qcow2_has_zero_init(BlockDriverState *bs)
     }
 }
 
+/*
+ * Check the request to vmstate. On success return
+ *      qcow2_vm_state_offset(bs) + @pos
+ */
+static int64_t qcow2_check_vmstate_request(BlockDriverState *bs,
+                                           QEMUIOVector *qiov, int64_t pos)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int64_t vmstate_offset = qcow2_vm_state_offset(s);
+    int ret;
+
+    /* Incoming requests must be OK */
+    bdrv_check_qiov_request(pos, qiov->size, qiov, 0, &error_abort);
+
+    if (INT64_MAX - pos < vmstate_offset) {
+        return -EIO;
+    }
+
+    pos += vmstate_offset;
+    ret = bdrv_check_qiov_request(pos, qiov->size, qiov, 0, NULL);
+    if (ret < 0) {
+        return ret;
+    }
+
+    return pos;
+}
+
 static int qcow2_save_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
                               int64_t pos)
 {
-    BDRVQcow2State *s = bs->opaque;
+    int64_t offset = qcow2_check_vmstate_request(bs, qiov, pos);
+    if (offset < 0) {
+        return offset;
+    }
 
     BLKDBG_EVENT(bs->file, BLKDBG_VMSTATE_SAVE);
-    return bs->drv->bdrv_co_pwritev_part(bs, qcow2_vm_state_offset(s) + pos,
-                                         qiov->size, qiov, 0, 0);
+    return bs->drv->bdrv_co_pwritev_part(bs, offset, qiov->size, qiov, 0, 0);
 }
 
 static int qcow2_load_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
                               int64_t pos)
 {
-    BDRVQcow2State *s = bs->opaque;
+    int64_t offset = qcow2_check_vmstate_request(bs, qiov, pos);
+    if (offset < 0) {
+        return offset;
+    }
 
     BLKDBG_EVENT(bs->file, BLKDBG_VMSTATE_LOAD);
-    return bs->drv->bdrv_co_preadv_part(bs, qcow2_vm_state_offset(s) + pos,
-                                        qiov->size, qiov, 0, 0);
+    return bs->drv->bdrv_co_preadv_part(bs, offset, qiov->size, qiov, 0, 0);
 }
 
 /*
-- 
2.29.2


