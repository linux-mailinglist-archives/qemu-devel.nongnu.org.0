Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55AF36853E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:51:33 +0200 (CEST)
Received: from localhost ([::1]:39934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZcY8-0007Zk-Jx
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEe-0007Rc-B2; Thu, 22 Apr 2021 12:31:24 -0400
Received: from mail-eopbgr40129.outbound.protection.outlook.com
 ([40.107.4.129]:3204 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEc-0003yB-GI; Thu, 22 Apr 2021 12:31:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBbBR3KDnQPnHraagRXonaEl5lPlIRcwwIfAtHPnmQdSPoQ5yjza8dMtVCPiU+Xa1NQyszJx5sQSNLJVe30DBM95CcwiM1mZdbRgXrECIqKY6XdDeXqfPr6ntWOU9KzsL1PL/GwTlGJzk270oETuZUd5YvpUO1iUyTzgTMmM7KmxJiQcRpVyCbI2L5Sz8to0x5b8HSc9Mu0fJuoU7US0SfIoEjAJsrjvz7EqcEu8JmHxC57D8A2qboHIX5YiBMglRiIfsxNsfrykBQtn7RAwVqW45InGG8ezCfaCbS53Q0nh3nAFCMRDPZhY0kJ8F3DFqRVvKf5n0yu7Yf/QBki2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVPrbCXOLoGPkLQN1znGuGj0mBCvZjATpgjDjqHUy+I=;
 b=h1/4XYs+eWfgsFE4jjYS/8WZVCzemgyXV53Iz5tVWvo6zY1CWzx7BsVVijPGEo2h9bkLa5BTG061wap3DaFhGcd1ViIpKxIjMkskVJB2bI7/xQCqNE0oFfP0iWwP/b4kVtHSRKoTCDtsuQOBN+n/ED2eXqKAhO4z7Ynf3TrZJlHZYx1n1FYLeqZXzYl6PqceHwm6xxv+NqXVmL/mzcb7bbMKbTY3dUBnHJfp2tYrOR+TZmkE5Z1RdFsc9jZLmqPZnLnZdczMvUIYzSKDtQH/CsQWTBS25YhymD/0UQqGpQ3syaJbpSj99afJFWcm1+65eOQL3FUJzH5ex28gvTujqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVPrbCXOLoGPkLQN1znGuGj0mBCvZjATpgjDjqHUy+I=;
 b=bhq1psvbMLDNBszJ43MTg+JLS5vhfcMkOzz0TLpVH5GKsWjCAIVq/AgmN4YlE8j6zPvh3Uo0phKEDjjf9hsGj5pYYBx4qB7+daAhzEFYzqIcIT9UtiQgUlnKa/3WNIWVOcWwb1h0aBHLHkyKodFyyP2mZokxTgNeaa56naqhtWI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3861.eurprd08.prod.outlook.com (2603:10a6:20b:80::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 16:31:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 16:31:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v6 08/12] qcow2: introduce is_cluster_free() helper
Date: Thu, 22 Apr 2021 19:30:42 +0300
Message-Id: <20210422163046.442932-9-vsementsov@virtuozzo.com>
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
 15.20.4042.16 via Frontend Transport; Thu, 22 Apr 2021 16:31:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31add05a-d114-4c52-1b7d-08d905ac08cb
X-MS-TrafficTypeDiagnostic: AM6PR08MB3861:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38619FB4BD493169EB40FA0CC1469@AM6PR08MB3861.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ZG3pDIbdFwGloimivqAD+Wzc2PW6EAJq4LjVZRWKYX5nJkh87WZq6tNqkj4WPv9bZkSjo/mOBMDPBFeOtuL/7pjESV7FAnFCfrgj8gQvWsVfGXjUlPT9SHQd+2NEwKCQo8ryl4Ly0gBVqJcH035OCfKn4WshSTcobkN0yComgqJuEtWoZoY74ShBPfK1CchHdkgYvMrtMkibM/i+lb8N+P7qZj3gSaEFFA+Li7QnVgB1LgvMzdWpeFzjFSpHPAHzLfDAOixjZRqvlE4WswzT4Gos9fdvRThTTh9e015HFusUmn/myILIHd5Th5zCXvmMuetzUmFi9OOmQdzbRN6TkkAGei4OsrRJRwOlvkyu9+MrHQ0fG9vP26Pwt8e67Q9Dz1UVchnVq/MSv2eE+QCDrBtFHQOpSAE1KnceNf7IhfDKeD2ldhby6DHGAB7SztZ0rmwZxAloUB3et2cqWU1h45TtrvfvLjbvhnTGnASC3BWnb+CJ/zgew2rhnriGF87S/FmatRxdgh5qaeQsjtu/PfufLZ9307Aj97f8KKpSN4ffM+R1bk+IlTJVmphzNOnAY5LTtqPTSsGifEW7EcDHXPWTvpo8lBXzcPF3ENHDHkz6vbfLn1IPLPW0mnJgKh8hGXAABfBN/EK6wtkBYqASiJLbNLTUjIzTavrQMj965QMudYuOsTO3dsUbbhvXVIm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39840400004)(396003)(6666004)(4326008)(107886003)(26005)(6486002)(956004)(2906002)(83380400001)(2616005)(52116002)(316002)(478600001)(8936002)(66476007)(6916009)(66556008)(66946007)(38100700002)(1076003)(38350700002)(5660300002)(6506007)(8676002)(186003)(6512007)(16526019)(36756003)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aKs4qWuFZ+CInrms6+kRI9PKL3oYm9nIrktAI32JZf+Puv1uBM+FdyIpk6Qf?=
 =?us-ascii?Q?15Vku7UBUPMKvwtx7cx2kVuJPHRvwne9Eu3AhXqKJcBVeKI+3lCEN0BtMqm9?=
 =?us-ascii?Q?EGGuwHd9cWoRAjNJlPO2TsHvwBv1Qfqhh8WsL38Q+SvBg3I3scckfbInFhBx?=
 =?us-ascii?Q?ohxIduyIj4fGgmD1c4emD1YBTbO+qWdVUkxcIQiTxQwiL2v+BEgTBL+dRTkr?=
 =?us-ascii?Q?EGQKfJhaHMhJAwiD3ywAqV+QCqg/cad6Tz4Qvu+NJtJWJBw0sNeVM71ZooQ1?=
 =?us-ascii?Q?FTDZN/2q08lOxLseS/WCUjytRTnNDMNF2d2Fy8zn6se8HnPTUq2jwQaMPKz6?=
 =?us-ascii?Q?dHqRPUZeqL+DC8dxjR749Ij8ZWdf86Q4yF26o8B2XhZSev4dLnbk1FKqp+rh?=
 =?us-ascii?Q?zIflMaHltjjvluF8aevONQfl7fVhQO6+o5dWnFqodPhrChnYkJtq6BGUom1j?=
 =?us-ascii?Q?bBtuiHE7TVtyTIp71yYxe6+ZJZs0/wT/8yCPtwi44f12wQd2hnnoi9UhcX5P?=
 =?us-ascii?Q?O41rMfMFl3/a9K1vAytYyiPENF//Tq9bIJep2K1pobmJj7Et/zEuFm+2TCkP?=
 =?us-ascii?Q?Rkwb1oYRqVQmgxHqtaeEBY2rV2SakDZXA2dKMEO2S5RDuM5kPnsUsuLtnwWt?=
 =?us-ascii?Q?6XnVi9cGmDO4SwMW3IfSoBl+u5ox3YCyivE+xwfuLa+5oqqRDW+PBxW40tt3?=
 =?us-ascii?Q?1ZitQz1pVltNr7lBeqwVs7R4EQbdYVizFfbK/Z7Xz5N829qPtg6ZxwfJo+yq?=
 =?us-ascii?Q?116Av9Z63GGYceETIIQcG8ZyN5asiu/qpJpFEjm50OFKRw72Kw6zEL1k/kw7?=
 =?us-ascii?Q?43BZSp4KqU4MK+L+WX9woC7+I94aLFIi1onN0+3d1u2rYIFYGAdR64mBsvdD?=
 =?us-ascii?Q?nUH25SpDZ+iKw4cDHdHxAagqwVRLUOs8022QnU6Mi4jF0OE4Qj2QGfD6mFMG?=
 =?us-ascii?Q?nujIUBk1b2VilhpYszYGHqrnam656OwXrPTw2lbJYOsH7cB7K801NTSIcpdz?=
 =?us-ascii?Q?zsTFUPaZ8mKlZRAI8CrOoFh4iJmvJQHEcj7eLdRD9O1v71F0x7n85MHBorr9?=
 =?us-ascii?Q?RWpDdHXDWQMuRDTlIsNL1t/kRMvTE0mS1QkbJbSDXDCYFCycRW54gZ4lApOw?=
 =?us-ascii?Q?ux04GAaA4YXZdqMbZHPtO/lkSfo0Lj+AI1dsRspcIM7JkaXvmofKZoKsGK1h?=
 =?us-ascii?Q?t7G5cKMuEnnLyuDZss7T6we0KvHJxOUx25pG4i4hrmMoItKm5D+ygR0MKywC?=
 =?us-ascii?Q?USeEm5oYSZUQMU7VBSHIvzlUFA5oKfTtIWAUfpzyiCfkcWwCtSbNuicX0WQQ?=
 =?us-ascii?Q?Jvuodb/viSxvUdLc39DGBKu3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31add05a-d114-4c52-1b7d-08d905ac08cb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:31:09.1072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DExefTgXcySTH4Dw4r9sr1xF97rK3EWUw52WBWUj6SUy862vivGDs4rgYRL82KV17jfTIydMWS+r6Q5BkbvIe9pAa1wN7wfrUloz54b7tK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3861
Received-SPF: pass client-ip=40.107.4.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

We are going to change the concept of "free host cluster", so let's
clarify it now and add a helper, which we will modify later.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2-refcount.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index ad021aab7a..72e6d1efd7 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -962,13 +962,32 @@ int qcow2_update_cluster_refcount(BlockDriverState *bs,
 /* cluster allocation functions */
 
 
+/*
+ * Cluster is free when its refcount is 0
+ *
+ * Return < 0 if failed to get refcount
+ *          0 if cluster is not free
+ *          1 if cluster is free
+ */
+static int is_cluster_free(BlockDriverState *bs, int64_t cluster_index)
+{
+    int ret;
+    uint64_t refcount;
+
+    ret = qcow2_get_refcount(bs, cluster_index, &refcount);
+    if (ret < 0) {
+        return ret;
+    }
+
+    return refcount == 0;
+}
 
 /* return < 0 if error */
 static int64_t alloc_clusters_noref(BlockDriverState *bs, uint64_t size,
                                     uint64_t max)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t i, nb_clusters, refcount;
+    uint64_t i, nb_clusters;
     int ret;
 
     /* We can't allocate clusters if they may still be queued for discard. */
@@ -980,11 +999,11 @@ static int64_t alloc_clusters_noref(BlockDriverState *bs, uint64_t size,
 retry:
     for(i = 0; i < nb_clusters; i++) {
         uint64_t next_cluster_index = s->free_cluster_index++;
-        ret = qcow2_get_refcount(bs, next_cluster_index, &refcount);
 
+        ret = is_cluster_free(bs, next_cluster_index);
         if (ret < 0) {
             return ret;
-        } else if (refcount != 0) {
+        } else if (!ret) {
             goto retry;
         }
     }
@@ -1031,7 +1050,7 @@ int64_t qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
                                 int64_t nb_clusters)
 {
     BDRVQcow2State *s = bs->opaque;
-    uint64_t cluster_index, refcount;
+    uint64_t cluster_index;
     uint64_t i;
     int ret;
 
@@ -1044,10 +1063,10 @@ int64_t qcow2_alloc_clusters_at(BlockDriverState *bs, uint64_t offset,
         /* Check how many clusters there are free */
         cluster_index = offset >> s->cluster_bits;
         for(i = 0; i < nb_clusters; i++) {
-            ret = qcow2_get_refcount(bs, cluster_index++, &refcount);
+            ret = is_cluster_free(bs, cluster_index++);
             if (ret < 0) {
                 return ret;
-            } else if (refcount != 0) {
+            } else if (!ret) {
                 break;
             }
         }
-- 
2.29.2


