Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C944AC6BE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:07:06 +0100 (CET)
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7Tk-0002CB-K6
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:07:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71g-0001zf-Qr; Mon, 07 Feb 2022 11:38:06 -0500
Received: from [2a01:111:f400:7e1b::708] (port=37729
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71d-0005HI-2l; Mon, 07 Feb 2022 11:38:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVqlVtQ5OF42sdmHE/XVWBeGXS74cBHjN/+gIH3l+ht/i4EmJL4Z7SOEzHWjrZFWHypw856/dvgZg95Cp8hy429wtt2d0MHPXeXbh1ticvSpelc7wKHdqlHz80wP39ygAtD+DNiKYg00DZOVcZfHmkRWFl3ywtHsW6na1U95HYu065lpq+iv/8Gr1458vCtUf+if5W/dpdwOJjL3lSiWBscVHdviK1z2oSGvikb+LtFNy/NtERuI+Uj+jzINrM8JMJ8PgKxNK2JhvWM9ktTmSzzPONlO7jEICc8e/j+yvyVpeuodLNTx13wFiWhoiBvc6eDW13yyYA4yaouV63OGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzqYMs72nxr/rvULzlYntudxsUVjUT8tEEdz91HA9NE=;
 b=NUEJcQJNHwzG9YLk4tOYM454l3RfQBajNNtgNb05yVIXx0WJ8rvaj26dGUjtgTJL4e64pNRNPw0PbnhLaPyART81gJNpvPz76VE43nyTp/RqwtPOvWTgMB87cTlwKK4unfjFjCocUQMqJxQHduTkeFAsSf+I968Z1Psg1+kTMGwJ0y1YA9w59QMx0o4L8EtI9kQLEcWBNyviUDfKFknU06yeOlagOcOF/LQ4q/U19euEYm/zMeKmAmSblGwVmSI9k3aQMiTb3EmHhfuCSQU+kGAtaOA9wui9oB4gWRkUxkta5rrxKH3N9699ZPH8wK4l2EWVOnXuNyVz5K37tlmHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzqYMs72nxr/rvULzlYntudxsUVjUT8tEEdz91HA9NE=;
 b=KTeQ5M1fD2f2YYtIfCnJ/z6vGHxdH6XMwC/DXRW1ybdVp7vApH0yb06qTFPqntHloEGYIBk29zUPvHcq4QqFDuyFkjzSSqBMinnpmhxc7zu3aPwdEPl4Syl8nAKZxGTSDhF7xrGx2z0B0qPB0RNfRABy9/fqBfAEXTJItm1Z4aw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2288.eurprd08.prod.outlook.com (2603:10a6:800:a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 16:37:42 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:37:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 09/14] qcow2: qcow2_inactivate(): use qcow2_flush_caches()
Date: Mon,  7 Feb 2022 17:37:23 +0100
Message-Id: <20220207163728.30362-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220207163728.30362-1-vsementsov@virtuozzo.com>
References: <20220207163728.30362-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0126.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78ec8d04-27b4-4b9a-15f1-08d9ea582943
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2288:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB228891BB616E57B315C82EA3C12C9@VI1PR0802MB2288.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:45;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YiHE7Q7MrJtgCldW6dg/1Bg0J36iHLV7oUFnGT4zuz8/URS9H3BtH8WPz6g9XwFicux8SsbC6UIoJJq3wPECvpVZhTvQmeUNdAg72hKhbeBUOPAOYFoEtvRFy8Z1q8Z3Siwr2h3i048/po81TgdB6ZAQxlXcyI5JqMTrSYjUKfQGJVLm3JshaL4pemmrWYT/OpqvNSBl8WPr6X1rEsMfopTrnqGe3CazqCUOZcw3s3sv/Km/Bz4jVAOjf0eyRBa5oH4vFADQSVQcb+XIVgfyrMK3oewNpNXlpOLhsQ2Pz1jcLmcY2AP6AwKlAb6+VuzEwYV7CI1nwdpSpDcbZ95pxK6I3FbEhVGLS8KihRfY6sKDZ4pRGd0dXOEy5dNzIsMT9JKpghehMmhnWxi6mzps0uiQr8F94vZ0YyJil1eYZwWCcIDytTKU47LR7GSP0W7TSj7tIkhy3sc2TKdxdTmqsZtK7I179z27LJ1UCSzTudghspStf+eetikYAgii7duklSNtaIqG7A398AgQADQZ07ZBgeFeIqU2Hj1+nkz7KaS6QGWIbMitq3VgOpnk1aSYIbvUUC8XKdLj6brUM2MYuQQlzMIZfIGUIA+daM6sh//oqVxIoF+rD+/N1B8UVQxgnNsNGlvKnWBQVOzNYsjsgpOzljmsVKCRHZDs7m12HQTBeNVAtrtgs034j2Fwkj6vBdc2yN4RPeeDAQJqFaGkQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(30864003)(66946007)(66556008)(8936002)(8676002)(38100700002)(83380400001)(66476007)(5660300002)(6916009)(4326008)(2906002)(508600001)(26005)(1076003)(186003)(86362001)(6486002)(38350700002)(2616005)(107886003)(6512007)(6506007)(6666004)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?50sCjicGNYAlENjCjaKDEk0z8cEPI5dDMAdJ2i2wk65z0rqDxLy8VGKFeo6n?=
 =?us-ascii?Q?TgUNohdpaX/ecnzMg/3MPTgNpYdsdRY8MNphibbhEvNPClx/SA5EgXXAo/OT?=
 =?us-ascii?Q?RHQEoz02TseNup7Hk8mj7A2gg84LylvBxQ2aTtg98rGooRXIXlCDrFiqcoaD?=
 =?us-ascii?Q?ChRhqMqiQ6QFVU13YZgmNJK64X2Of/ndpSgBmkuqbIjig8PYs+z/ofd3icqK?=
 =?us-ascii?Q?o6mm6uULZDWqnQGFq+0w4vj21XOEHuTp+MVOa4TAnVZfEqYUzjo7lUX2XThQ?=
 =?us-ascii?Q?1WyDrI/pjuV8JvvbSuCawbTyTANiTSlZAUymlSp5+/B3nY+dbspCWykFVp9D?=
 =?us-ascii?Q?s45PjDpaoQw6NCEQsFE6QL8D83dPQ/bUoOPLS/y4Zahjh8kvmvXRgLL5KjJE?=
 =?us-ascii?Q?Bgm+q3GV2WAW9+s0Qg/Co0A7/VUOrjTmLxrdik4X48a9YaqH0zAHRyVbgvXZ?=
 =?us-ascii?Q?vIdKglCUdS5qZiPPIkZQv7fn/g4V2AAxQN2i/XSdsbFiqLz4JAfsBHoF2GDy?=
 =?us-ascii?Q?RAcMWsiTlUHE8pKVgG9NetUYYyD3asyjS6s8utIgHARc1DEAM61q+n+569ww?=
 =?us-ascii?Q?Ih36esrkMjBNUyqeHfC2kixyT++d0TVH+rAEtchJjS3OMmb+jp4bIXE54UoG?=
 =?us-ascii?Q?zbbo53TqHTaHCH5YeZTeIu+64zmv2hKx+ohtOlKYGfk/NzWlKkFWK+IAW+VI?=
 =?us-ascii?Q?8Ylh7S/2HyhhFvrEfFB44cd/9O3UcJJQ5jw7Gl5TTASuoWDvdYbIYQzkxicS?=
 =?us-ascii?Q?PkNJGd8KCuty2S9VKj0YUqbRLzor/Od3Sx1J6i0couK3n0RSyqzpFzOD7/8T?=
 =?us-ascii?Q?VgVosNzdTN4vxlEPQoihNgvHI1YECDDEK+/xZqLxkkiY4of6AT/vzfYFEU50?=
 =?us-ascii?Q?Ffcsgg+YwTOjFTSJ3K78k3W4y/eMY5uwCgExroaYW2c4gXt1GIERp6+NPkCO?=
 =?us-ascii?Q?xPLp/Em4xS8l5xarRibj/JNxszL7utPIjVl7HsjrO9jMEQnqiLPQDfJUID1y?=
 =?us-ascii?Q?wBR+iRz/hrnxW2J4Q0rZ0xdFXFlPmK0lTrxcs+0kWd1xGzyGyrUUfxjqflZc?=
 =?us-ascii?Q?dJI6QlImwcmhAur7bMZ8iCQAr5BRRR3TsHfPgWlfB2Nta6w9/JdTASr4SC7/?=
 =?us-ascii?Q?Np9UJO4BHgxwkX7BNR+S65f/Mxwinz44dViwXV0WRzqKdrcEhbXtYqeYLh6I?=
 =?us-ascii?Q?9A/uv3UUYk+Z2ByMK5r2Ng4e7tboPjRg+2ym5AkJu724j0z1LDDHj8Svo0Qn?=
 =?us-ascii?Q?2oEgU3H15NRHRfxNL9VpwZWBUdVXb5vdb5qwwT8HF7z4GFWv8jefVBXKL5Jq?=
 =?us-ascii?Q?NIkKLnQYHz+bPGQnRHjRbUCqITncNmzUS9SN+EaDTY+r4JWucjzqnB/cioXG?=
 =?us-ascii?Q?fPQv+Yd0NJJYBx6Miu3vE6MFgOXxjiBZ8bdzHAr5JhKYoHXVGxNRvs6kqz7c?=
 =?us-ascii?Q?FGv2W+Xcq5bb8opeewldYCld3KphI4RUbKQ+SWDblrtA0OvotmVlDS/8tLFZ?=
 =?us-ascii?Q?9GAxBnllGUxJXvpOooS3P5vFwVA9kWTw/iXg1qStgNqlMzzfgMUji+P3eXl7?=
 =?us-ascii?Q?5MY4ibI6sQAtj1mYmr19UdwgbWnKJnwy+mmjZ23vYpROrQPVtQWRO25Dz3Zs?=
 =?us-ascii?Q?aqPXp3RpInqOj6RBD9o4tZTMt+MR0pacqsKGf2eUGxzfRsOe2PN0y1wx4dOT?=
 =?us-ascii?Q?ljUlwg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ec8d04-27b4-4b9a-15f1-08d9ea582943
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:37:42.1482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6gaeMQYVWOQpEwyWIRNwM47rZwkJ/XziGlXDysCzpknqeq0WVcisRXmEfAnXa+1oqWbV892vLBDnP2QTplWsB6uSQN7PvPAUOVtMx7KmVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::708
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::708;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Maintaining similar logic of flushing caches in both
qcow2_inactivate() and in qcow2_flush_caches() is not good.

Let's refactor things to use qcow2_flush_caches() directly from
qcow2_inactivate(). For this we need two things: textual error messages
(add Error **) and possibility to unconditionally flush refcounts (add
force_refcounts argument).

Iotests output updated correspondingly.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h              |   6 +-
 block/qcow2-bitmap.c       |   2 +-
 block/qcow2-refcount.c     |  22 +++++--
 block/qcow2.c              |  25 +++-----
 tests/qemu-iotests/026.out | 126 +++++++++++++------------------------
 tests/qemu-iotests/071.out |   3 +-
 tests/qemu-iotests/080.out |   4 +-
 7 files changed, 76 insertions(+), 112 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index fd48a89d45..a83183d533 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -874,8 +874,10 @@ void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
 int qcow2_update_snapshot_refcount(BlockDriverState *bs,
     int64_t l1_table_offset, int l1_size, int addend);
 
-int coroutine_fn qcow2_flush_caches(BlockDriverState *bs);
-int coroutine_fn qcow2_write_caches(BlockDriverState *bs);
+int coroutine_fn qcow2_flush_caches(BlockDriverState *bs, bool force_refcounts,
+                                    Error **errp);
+int coroutine_fn qcow2_write_caches(BlockDriverState *bs, bool force_refcounts,
+                                    Error **errp);
 int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                           BdrvCheckMode fix);
 
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 8fb4731551..0f463ced4e 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -899,7 +899,7 @@ static int update_ext_header_and_dir(BlockDriverState *bs,
             return ret;
         }
 
-        ret = qcow2_flush_caches(bs);
+        ret = qcow2_flush_caches(bs, false, NULL);
         if (ret < 0) {
             goto fail;
         }
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 4614572252..c8251412ce 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1203,19 +1203,23 @@ void qcow2_free_any_cluster(BlockDriverState *bs, uint64_t l2_entry,
     }
 }
 
-int coroutine_fn qcow2_write_caches(BlockDriverState *bs)
+int coroutine_fn qcow2_write_caches(BlockDriverState *bs, bool force_refcounts,
+                                    Error **errp)
 {
     BDRVQcow2State *s = bs->opaque;
     int ret;
 
     ret = qcow2_cache_write(bs, s->l2_table_cache);
     if (ret < 0) {
+        error_setg_errno(errp, -ret, "Failed to write the L2 table cache");
         return ret;
     }
 
-    if (qcow2_need_accurate_refcounts(s)) {
+    if (force_refcounts || qcow2_need_accurate_refcounts(s)) {
         ret = qcow2_cache_write(bs, s->refcount_block_cache);
         if (ret < 0) {
+            error_setg_errno(errp, -ret,
+                             "Failed to write the refcount block cache");
             return ret;
         }
     }
@@ -1223,14 +1227,22 @@ int coroutine_fn qcow2_write_caches(BlockDriverState *bs)
     return 0;
 }
 
-int coroutine_fn qcow2_flush_caches(BlockDriverState *bs)
+int coroutine_fn qcow2_flush_caches(BlockDriverState *bs, bool force_refcounts,
+                                    Error **errp)
 {
-    int ret = qcow2_write_caches(bs);
+    int ret = qcow2_write_caches(bs, force_refcounts, errp);
     if (ret < 0) {
         return ret;
     }
 
-    return bdrv_flush(bs->file->bs);
+    ret = bdrv_flush(bs->file->bs);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret,
+                         "Failed to flush after writing caches");
+        return ret;
+    }
+
+    return 0;
 }
 
 /*********************************************************/
diff --git a/block/qcow2.c b/block/qcow2.c
index 614df0307f..04994df240 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -544,7 +544,7 @@ static int qcow2_mark_clean(BlockDriverState *bs)
 
         s->incompatible_features &= ~QCOW2_INCOMPAT_DIRTY;
 
-        ret = qcow2_flush_caches(bs);
+        ret = qcow2_flush_caches(bs, false, NULL);
         if (ret < 0) {
             return ret;
         }
@@ -574,7 +574,7 @@ int qcow2_mark_consistent(BlockDriverState *bs)
     BDRVQcow2State *s = bs->opaque;
 
     if (s->incompatible_features & QCOW2_INCOMPAT_CORRUPT) {
-        int ret = qcow2_flush_caches(bs);
+        int ret = qcow2_flush_caches(bs, false, NULL);
         if (ret < 0) {
             return ret;
         }
@@ -2680,7 +2680,6 @@ fail_nometa:
 
 static int qcow2_inactivate(BlockDriverState *bs)
 {
-    BDRVQcow2State *s = bs->opaque;
     int ret, result = 0;
     Error *local_err = NULL;
 
@@ -2690,20 +2689,14 @@ static int qcow2_inactivate(BlockDriverState *bs)
         error_reportf_err(local_err, "Lost persistent bitmaps during "
                           "inactivation of node '%s': ",
                           bdrv_get_device_or_node_name(bs));
+        local_err = NULL;
     }
 
-    ret = qcow2_cache_flush(bs, s->l2_table_cache);
-    if (ret) {
+    ret = qcow2_flush_caches(bs, true, &local_err);
+    if (ret < 0) {
         result = ret;
-        error_report("Failed to flush the L2 table cache: %s",
-                     strerror(-ret));
-    }
-
-    ret = qcow2_cache_flush(bs, s->refcount_block_cache);
-    if (ret) {
-        result = ret;
-        error_report("Failed to flush the refcount block cache: %s",
-                     strerror(-ret));
+        error_report_err(local_err);
+        local_err = NULL;
     }
 
     if (result == 0) {
@@ -4517,7 +4510,7 @@ static int coroutine_fn qcow2_co_truncate(BlockDriverState *bs, int64_t offset,
 
     if (prealloc != PREALLOC_MODE_OFF) {
         /* Flush metadata before actually changing the image size */
-        ret = qcow2_write_caches(bs);
+        ret = qcow2_write_caches(bs, false, NULL);
         if (ret < 0) {
             error_setg_errno(errp, -ret,
                              "Failed to flush the preallocated area to disk");
@@ -4936,7 +4929,7 @@ static coroutine_fn int qcow2_co_flush_to_os(BlockDriverState *bs)
     int ret;
 
     qemu_co_mutex_lock(&s->lock);
-    ret = qcow2_write_caches(bs);
+    ret = qcow2_write_caches(bs, false, NULL);
     qemu_co_mutex_unlock(&s->lock);
 
     return ret;
diff --git a/tests/qemu-iotests/026.out b/tests/qemu-iotests/026.out
index 83989996ff..cdc1ed2748 100644
--- a/tests/qemu-iotests/026.out
+++ b/tests/qemu-iotests/026.out
@@ -14,15 +14,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: l1_update; errno: 5; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: Input/output error
-qemu-io: Failed to flush the refcount block cache: Input/output error
+qemu-io: Failed to write the refcount block cache: Input/output error
 write failed: Input/output error
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: l1_update; errno: 5; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: Input/output error
-qemu-io: Failed to flush the refcount block cache: Input/output error
+qemu-io: Failed to write the refcount block cache: Input/output error
 write failed: Input/output error
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -38,15 +36,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: l1_update; errno: 28; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the refcount block cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: l1_update; errno: 28; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the refcount block cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -126,15 +122,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: l2_update; errno: 5; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: Input/output error
-qemu-io: Failed to flush the refcount block cache: Input/output error
+qemu-io: Failed to write the L2 table cache: Input/output error
 write failed: Input/output error
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: l2_update; errno: 5; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: Input/output error
-qemu-io: Failed to flush the refcount block cache: Input/output error
+qemu-io: Failed to write the L2 table cache: Input/output error
 write failed: Input/output error
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -150,15 +144,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: l2_update; errno: 28; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the L2 table cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: l2_update; errno: 28; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the L2 table cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -174,15 +166,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: l2_alloc_write; errno: 5; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: Input/output error
-qemu-io: Failed to flush the refcount block cache: Input/output error
+qemu-io: Failed to write the refcount block cache: Input/output error
 write failed: Input/output error
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: l2_alloc_write; errno: 5; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: Input/output error
-qemu-io: Failed to flush the refcount block cache: Input/output error
+qemu-io: Failed to write the refcount block cache: Input/output error
 write failed: Input/output error
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -198,15 +188,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: l2_alloc_write; errno: 28; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the refcount block cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: l2_alloc_write; errno: 28; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the refcount block cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -222,15 +210,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: write_aio; errno: 5; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: Input/output error
-qemu-io: Failed to flush the refcount block cache: Input/output error
+qemu-io: Failed to write the refcount block cache: Input/output error
 write failed: Input/output error
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: write_aio; errno: 5; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: Input/output error
-qemu-io: Failed to flush the refcount block cache: Input/output error
+qemu-io: Failed to write the refcount block cache: Input/output error
 write failed: Input/output error
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -246,15 +232,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: write_aio; errno: 28; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the refcount block cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: write_aio; errno: 28; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the refcount block cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -270,15 +254,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_load; errno: 5; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: Input/output error
-qemu-io: Failed to flush the refcount block cache: Input/output error
+qemu-io: Failed to write the refcount block cache: Input/output error
 write failed: Input/output error
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_load; errno: 5; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: Input/output error
-qemu-io: Failed to flush the refcount block cache: Input/output error
+qemu-io: Failed to write the refcount block cache: Input/output error
 write failed: Input/output error
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -294,15 +276,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_load; errno: 28; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the refcount block cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_load; errno: 28; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the refcount block cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -318,15 +298,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_update_part; errno: 5; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: Input/output error
-qemu-io: Failed to flush the refcount block cache: Input/output error
+qemu-io: Failed to write the refcount block cache: Input/output error
 write failed: Input/output error
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_update_part; errno: 5; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: Input/output error
-qemu-io: Failed to flush the refcount block cache: Input/output error
+qemu-io: Failed to write the refcount block cache: Input/output error
 write failed: Input/output error
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -342,15 +320,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_update_part; errno: 28; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the refcount block cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_update_part; errno: 28; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the refcount block cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -366,15 +342,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_alloc; errno: 5; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: Input/output error
-qemu-io: Failed to flush the refcount block cache: Input/output error
+qemu-io: Failed to write the refcount block cache: Input/output error
 write failed: Input/output error
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_alloc; errno: 5; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: Input/output error
-qemu-io: Failed to flush the refcount block cache: Input/output error
+qemu-io: Failed to write the refcount block cache: Input/output error
 write failed: Input/output error
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -390,15 +364,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_alloc; errno: 28; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the refcount block cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_alloc; errno: 28; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the refcount block cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -457,15 +429,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_alloc_hookup; errno: 28; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the L2 table cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_alloc_hookup; errno: 28; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the refcount block cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -481,15 +451,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_alloc_write; errno: 28; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the L2 table cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_alloc_write; errno: 28; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the refcount block cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -505,15 +473,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_alloc_write_blocks; errno: 28; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the L2 table cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_alloc_write_blocks; errno: 28; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the L2 table cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -529,15 +495,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_alloc_write_table; errno: 28; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the L2 table cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_alloc_write_table; errno: 28; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the L2 table cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -553,15 +517,13 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_alloc_switch_table; errno: 28; imm: off; once: off; write
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the L2 table cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: refblock_alloc_switch_table; errno: 28; imm: off; once: off; write -b
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the L2 table cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 
@@ -595,8 +557,7 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: l1_grow_write_table; errno: 5; imm: off; once: off
-qemu-io: Failed to flush the L2 table cache: Input/output error
-qemu-io: Failed to flush the refcount block cache: Input/output error
+qemu-io: Failed to write the refcount block cache: Input/output error
 write failed: Input/output error
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -607,8 +568,7 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: l1_grow_write_table; errno: 28; imm: off; once: off
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the refcount block cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -619,8 +579,7 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: l1_grow_activate_table; errno: 5; imm: off; once: off
-qemu-io: Failed to flush the L2 table cache: Input/output error
-qemu-io: Failed to flush the refcount block cache: Input/output error
+qemu-io: Failed to write the refcount block cache: Input/output error
 write failed: Input/output error
 No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
@@ -631,8 +590,7 @@ No errors were found on the image.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 
 Event: l1_grow_activate_table; errno: 28; imm: off; once: off
-qemu-io: Failed to flush the L2 table cache: No space left on device
-qemu-io: Failed to flush the refcount block cache: No space left on device
+qemu-io: Failed to write the refcount block cache: No space left on device
 write failed: No space left on device
 No errors were found on the image.
 
diff --git a/tests/qemu-iotests/071.out b/tests/qemu-iotests/071.out
index bca0c02f5c..de1c59154d 100644
--- a/tests/qemu-iotests/071.out
+++ b/tests/qemu-iotests/071.out
@@ -86,7 +86,6 @@ read failed: Input/output error
 {"return": ""}
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
-QEMU_PROG: Failed to flush the L2 table cache: Input/output error
-QEMU_PROG: Failed to flush the refcount block cache: Input/output error
+QEMU_PROG: Failed to flush after writing caches: Input/output error
 
 *** done
diff --git a/tests/qemu-iotests/080.out b/tests/qemu-iotests/080.out
index 45ab01db8e..860228f93b 100644
--- a/tests/qemu-iotests/080.out
+++ b/tests/qemu-iotests/080.out
@@ -66,7 +66,7 @@ wrote 512/512 bytes at offset 0
 qemu-img: Failed to load snapshot: Snapshot L1 table offset invalid
 qemu-img: Snapshot L1 table offset invalid
 qemu-img: Failed to turn zero into data clusters: Invalid argument
-qemu-io: Failed to flush the refcount block cache: Invalid argument
+qemu-io: Failed to write the refcount block cache: Invalid argument
 write failed: Invalid argument
 qemu-img: Snapshot L1 table offset invalid
 qemu-img: Could not apply snapshot 'test': Failed to load snapshot: Invalid argument
@@ -89,7 +89,7 @@ wrote 512/512 bytes at offset 0
 qemu-img: Failed to load snapshot: Snapshot L1 table too large
 qemu-img: Snapshot L1 table too large
 qemu-img: Failed to turn zero into data clusters: File too large
-qemu-io: Failed to flush the refcount block cache: File too large
+qemu-io: Failed to write the refcount block cache: File too large
 write failed: File too large
 qemu-img: Snapshot L1 table too large
 qemu-img: Could not apply snapshot 'test': Failed to load snapshot: File too large
-- 
2.31.1


