Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A406F369C29
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:45:00 +0200 (CEST)
Received: from localhost ([::1]:57484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3bf-0008Pl-EP
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Y4-0005PJ-6Y; Fri, 23 Apr 2021 17:41:16 -0400
Received: from mail-db8eur05on2117.outbound.protection.outlook.com
 ([40.107.20.117]:24032 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Y1-0002zb-9V; Fri, 23 Apr 2021 17:41:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rp5iKayCgK6WprJnDKhQwY0E5PWDlFgfe7yI59lq7Yw/QZVpt7d5P087E+hblDOgCxPm1L3KrWvlC8EmzCVT/biUhqOHI12KzcduSzujfu9abkPb1C1C7fnpQERT1rIEwazN3kaT3sic1SbQZgmyh45JK3w9HkHla4WYHQc0GRQob6l/gwFtyxjchYpDGbd6mMqyn4ZABmPRCZ01ETN6rYMX2ylKZ36IhcMeYt5WrAih6ehpnYRapUQ8A7sQ5wNtpkNTkujBoDXAMRBCH4Sy6dzdE2WJvynwYj9iMAYCh6yXsOnC+Q8oAXkV8xSWsfv5EoDrNaplPsH+uSyg3ataZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCEqDlvTBQuq9v/8SnyGp6Fw9RvKpSnEZq5+/YBNFtk=;
 b=aHDISUZV+72suT43bRCKfy9iVMlWVCB2DJdGLuJdYKIhYj3YqRTP6YRwOt+w3WAZSWpNorbTv9dd/2FRKRzDpgU1BdMsiE3xWhN0cafvAluJZj0GVk96T0r3FgPXjZorR9+VOE6KOc+ZzxDKWh0DLw9p/MfAyZiAJmgszt1EVhjBI8uL87Y5QVsFeUh2RX3jivTT52SeH/xNpswyZ5yax28d875Ge9WKEb+byQZsbbUN0midFN1HwLWJJxbHxZ6UfCEk2u0TVUqzyVrzl6LU9Ovgl9izRS8GRW9Y8FuHtkC3j3tMD5vQBXvZbyIKKXj8Gjw6mDn2dgP1C892AjTEPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCEqDlvTBQuq9v/8SnyGp6Fw9RvKpSnEZq5+/YBNFtk=;
 b=qG/XfsVKobIitytkGPz/vlIVnBqwXONWMnmcP1uc+EGCHb187y+g8U8FgQ8q+TO4hx0ui9hNv5cu/98w3NnB0N3s7IU5SPjvpR/KdkRUpu7xXni7VEw8XAzazr0cYV0JCjDVTKoZaXmdnXBnlHHdLvDxWaNOqhaSVkicXZjq9/M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 21:41:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 21:41:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 philmd@redhat.com
Subject: [PATCH 07/11] block-backend: add _co_ versions of blk_save_vmstate /
 blk_load_vmstate
Date: Sat, 24 Apr 2021 00:40:29 +0300
Message-Id: <20210423214033.474034-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210423214033.474034-1-vsementsov@virtuozzo.com>
References: <20210423214033.474034-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 21:40:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f54b5879-31b9-43dd-ff0a-08d906a07af4
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63745CDE95C28253DE056E57C1459@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:176;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xdfW5o4CfD3ZGffvNkqHgnWj3DxEuUw2yl9fR+dvo1xdQkXevnSy+me4GZfkE9H6b6q9bBOIF5XjtXtSKpam9feMmwVzDVFuiMle4kggfFkzzyJXgaBWqKxEseKlMs/KWQhh7AzgEDmPSqNz0g2RuY9qjsWflpDYNIoxbbdk/lqxRuMyL6sJYzC2VGXKvC71P+U4+chhxBLEWBbuJaMQ99LI9yAscUc2/2f0hG30MT6i6iKK/nVkmXjj393Rn/VbaRCGc34aNazWFTu3TbTgdlx6EYmbPF6kHOZJ5xW2r91JjMCJCgg0B+LkLTXac1mDOc4CnBJEdjB+eDEKEuucRT/B3qtzYoGg5cOd/SFsgGqygGq6Yly1Bv07vUlUSjVTKBOn/b25Qra4Zo2ZLoSJBU+mWDWHdpgLuokAunMteVPZrSg9Ek1fkHlmVZFR0JWB9m5fk/8UPkyJfv1C7HejxpvfYytTrV4ful6Gcd7Escy9a+XCWuAbI8fQaGVotnEbSw0gWrx+CR3ydwJn/KFrStnjXFlxO+Na7QWeWs27U4FMQpCZMqPJesQVbMUiAVItlI5N6KZFBjoU/EyUZXovYwEsw+hdAufHgV102sPy9UrExA1RWKe9ARkpkqzCwEtjq73ixXzJ3tInm7hII3JfqL+mOpfH+YIDuVmKGBzu5UnhkMviTeQFqzUsjvC3yAo4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39840400004)(346002)(376002)(316002)(2616005)(26005)(956004)(83380400001)(8676002)(4326008)(38100700002)(38350700002)(478600001)(6666004)(5660300002)(86362001)(186003)(6506007)(66476007)(66556008)(1076003)(16526019)(6512007)(6916009)(6486002)(2906002)(52116002)(36756003)(66946007)(8936002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NILAc5NqzL4ZZKAl8/yxqfGmWavPDglqqhAbDaZPjb8aZZUblJbfsEsg0HT0?=
 =?us-ascii?Q?ay3dEwmH/7JxgOBNkvUWVh9gzDk3iR4/FV+MSAC9v0JXr+06WuhljZ1jxleS?=
 =?us-ascii?Q?RzJyhrkf3D5n2tqKhl4ROpMtz5WQhY0LhBNJi4yQmwd19z+ivXe88V1deNde?=
 =?us-ascii?Q?sICVwRYbv7rCs/cuHDRnK8ybm61GNq7gTXtWFJhenPCv1eiSYUv92aR4fpqG?=
 =?us-ascii?Q?Y0UJDgUz+vje/zwsKbNjhzknKEP+gwYr3WMYeGfpq0atY40MFgJQHH+eLGTG?=
 =?us-ascii?Q?4Ys8IfC73A3wOr0pNrUhWvmGmF00Q8EJc0IbI1RUKtrVNbbKNLajg0HSXcpw?=
 =?us-ascii?Q?hSxZuu0i3FmzalbOshx9O6XIdyAEKHmuTs9yJRFXL1GQF5pCgODHkAoL1986?=
 =?us-ascii?Q?6ZATFoS0gSg+hZeBKLAuvYc2ldKq1ISboj81llK9GVhcZ4mn0fQ10p0dGzoK?=
 =?us-ascii?Q?uHqNHmHb+BeUYeOTsyAwktg7kkd9eiaiSQOeXKY/0BEucRPQ9cPX7K1zrApt?=
 =?us-ascii?Q?wYZp6kBzn/rfmEsH0bkNsIgR2MbmPnHNy20SVt5bE73R5s2fh348f+Az5rJw?=
 =?us-ascii?Q?vxFDUzAInDC+3bZGLSBStUFszLVq9IMN04dBlWDBLJ0UGSJqFJaPRiq0PR4Z?=
 =?us-ascii?Q?1j/F0qMyaMuBEKh3WswpBTLF/0I5TLafBz6gytEwYlFrrY8+v+QD8fvF8nrI?=
 =?us-ascii?Q?lTCNpYbIxn49kYVH+i6OvuCf75iGw5U9E1SkOxLyfT8j2x6vgzjqV9hOF9uV?=
 =?us-ascii?Q?F2rAb5tBfs1MuFQh+LcytRVC9+TAcmT4WF1QJDayyMGzdvSHOoVH0F2n4k4C?=
 =?us-ascii?Q?zaTcs3oGl3rNTftKxf6FYyYk66tYQVoijSHL2R0WJGCMOBoxVmsaFTkYUilb?=
 =?us-ascii?Q?nDNbsJk+wDQfpCa/FTUJKuFgL8FWRKGIpV9usCVVHr+ypmhPf5AQ+lSh25uo?=
 =?us-ascii?Q?oql6oUgc1Tl5Wmp6zhYnlp06QSmv3eBrXu07v8gvXa6GTJ4XkqCyPHOf4QiF?=
 =?us-ascii?Q?hHp2TVywgaAEwz7iLzmkxWPSKuyW4iDC3vXYwDfb2YeT284mak4b46bpoA29?=
 =?us-ascii?Q?euwoMcnjzJQIL9m2jhKY1J1Fii222P3Lr4xk+Cua619ye3yvDcTSkSHKfJCA?=
 =?us-ascii?Q?8yBhkY4peo6xIJycCcRdyh94/EV8DVWHML2WYN5SdI5EoUha31WktQB/825c?=
 =?us-ascii?Q?O/KWBcrIXzG452cJ6ISszOXFUtr2biGOw73jF+VnXJGBTTOAXqivLlWMplzw?=
 =?us-ascii?Q?0xrycfGJ5EfPOLt1LsTelAJXMZIZV6uh9aPs/gs0ZrosUz0LB7tKFyhGPi4l?=
 =?us-ascii?Q?2MAH1IMi10+2+3tWRdufP+jY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f54b5879-31b9-43dd-ff0a-08d906a07af4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 21:40:59.9149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: USogeLixi/pWqq/J+9rOelVkcNs/7MT9V4aVDrIn3WWTbvRye9FLwkHvB1IkrXWf4CN6o9ASdPf315aQK7JjzS/UfjJNV8709FPvrYjeFF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.20.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

To be used in further commit. Don't worry about some duplication with
existing blk_save_vmstate() and blk_load_vmstate(): they will be
removed soon.

Note the difference: new functions returns 0 on success.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h |  3 +++
 block/block-backend.c          | 37 ++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 880e903293..8676bbde5a 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -245,6 +245,9 @@ int blk_pdiscard(BlockBackend *blk, int64_t offset, int bytes);
 int blk_save_vmstate(BlockBackend *blk, const uint8_t *buf,
                      int64_t pos, int size);
 int blk_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size);
+int blk_co_save_vmstate(BlockBackend *blk, const uint8_t *buf,
+                        int64_t pos, int size);
+int blk_co_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size);
 int blk_probe_blocksizes(BlockBackend *blk, BlockSizes *bsz);
 int blk_probe_geometry(BlockBackend *blk, HDGeometry *geo);
 BlockAIOCB *blk_abort_aio_request(BlockBackend *blk,
diff --git a/block/block-backend.c b/block/block-backend.c
index 413af51f3b..d7f91ce7ad 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -14,6 +14,7 @@
 #include "sysemu/block-backend.h"
 #include "block/block_int.h"
 #include "block/blockjob.h"
+#include "block/coroutines.h"
 #include "block/throttle-groups.h"
 #include "hw/qdev-core.h"
 #include "sysemu/blockdev.h"
@@ -2227,6 +2228,42 @@ int blk_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size)
     return bdrv_load_vmstate(blk_bs(blk), buf, pos, size);
 }
 
+int blk_co_save_vmstate(BlockBackend *blk, const uint8_t *buf,
+                        int64_t pos, int size)
+{
+    int ret;
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, size);
+
+    if (!blk_is_available(blk)) {
+        return -ENOMEDIUM;
+    }
+
+    ret = bdrv_co_writev_vmstate(blk_bs(blk), &qiov, pos);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (!blk->enable_write_cache) {
+        ret = bdrv_flush(blk_bs(blk));
+    }
+
+    return ret < 0 ? ret : 0;
+}
+
+int blk_co_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos, int size)
+{
+    int ret;
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, size);
+
+    if (!blk_is_available(blk)) {
+        return -ENOMEDIUM;
+    }
+
+    ret = bdrv_co_readv_vmstate(blk_bs(blk), &qiov, pos);
+
+    return ret < 0 ? ret : 0;
+}
+
 int blk_probe_blocksizes(BlockBackend *blk, BlockSizes *bsz)
 {
     if (!blk_is_available(blk)) {
-- 
2.29.2


