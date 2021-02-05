Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F27D310E02
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:40:12 +0100 (CET)
Received: from localhost ([::1]:43028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l849T-00021Q-4S
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l847A-0008MT-5s; Fri, 05 Feb 2021 11:37:48 -0500
Received: from mail-eopbgr00136.outbound.protection.outlook.com
 ([40.107.0.136]:22969 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l8478-0002Zv-AQ; Fri, 05 Feb 2021 11:37:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5q4v3L+JDVlCFto8Ku/KVhDCihRv0b9OUR+a8Y5QboeKVtvyN4gOainlvEu9bU1rGaq9X0KZ27aKZ3aA9PhhVv0rOwBN1VHvZdvOaTRXlbmU364vJnjRZFMRlmwnrvQEfu2xefKG+fYOmn+k4cG1/dm5RT0LMlAfdcyLW1wL7bYAoMqNgFH7b7VJqvhvevDRIjsZDtmIKXLddbDXljF+iHc/Eay756QNFCI0eG6q2LzAiMYJPf5suZpFN/rCmNI7KQYjnYXtami213GDEsfpuuuLab1XUEJuYgf17wsTyR67npds4k8g2qZXWuWu1FHLFkTWn961HqANvSDQAW9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sptDySwbRElAsPZVDjm9TBSpNzlficrZC7BxfIFn6/8=;
 b=D38dL99bNaRl4retM+pHRiTbzUaURBLWIeoeuYI5VczjzyPHTgR4P9gExVqETgjJ9dwNK7J8cemACFQTK4gGcQgqQ42hyjOfP4iPxj/SxMRUIYWuASEb+5wwxwy42t/iTiZUiQERRaQ1kbWW/KU2TYJxsxG85WSMCMawB0Pba+dwJl5Wp4LmArxmiK5Q4vXyAFFyGpo/Yd3kS5fwtWIOpSKUVsIDro/t8J6BN2/6FIyPpx1/w9Ptp1sNtX688/VR3PQoCNsUP0L+r4F158zJCeQBwhAdwWYQCatQ1B7w4nvVgGJz128eBXYIypUtH+NI5SRWv3tyCmVs4UUPfHhysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sptDySwbRElAsPZVDjm9TBSpNzlficrZC7BxfIFn6/8=;
 b=Kq7JMTdH9jvi/PaVG1yci0zLsf6NEveemszkonnFQLBK2dZTZQvxp6ph2ZiBKmZ7dp76Ph4JOHtoDB0AowPWdBu8vlvbBVPJrzuHWOYVgpSBuiUHs4JrSMqs7Zh6hgAHQ9tJFNIwPKnz4vzG7fCySvlfEIlFjxHJDSKp5VsmeP0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 5 Feb
 2021 16:37:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 16:37:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, den@openvz.org
Subject: [PATCH v2 01/10] block: add new BlockDriver handler:
 bdrv_cancel_in_flight
Date: Fri,  5 Feb 2021 19:37:11 +0300
Message-Id: <20210205163720.887197-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205163720.887197-1-vsementsov@virtuozzo.com>
References: <20210205163720.887197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM9P193CA0029.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.213) by
 AM9P193CA0029.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Fri, 5 Feb 2021 16:37:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7538133d-d197-4e13-3ff7-08d8c9f456bb
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB447015B333CFFFBF181D6CA0C1B29@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nBkUSTOlpEWDmu7d0xR88oSznBBCCFI9TGI4OA4+d/b31ZQy9DDAbsKXJVje4w3CoTvwgLvto6frRz/4wcqn3Gu6LG8Np1fmDG42EG7XA2h4ifUPKsLCi8fuoFAl+7fr+Ct3mKvu+VBBglxuSb/XSs3lMq9Lfopaz1cXsePTUZu7/i4tmsA5MM/oV8KgCbDRHBsmBDct4shnhJhNI6UzOv0Ti1R1cBKnw6Yufjvh2A9Iydy9RtkCuzziM9qvRdGR8kxSCydNi5FPGquwPtbVTW68TQ02H/QVK2yeQOBwnL088x8lYNG4jlDOk+gb58IGfNxfEqC/oN4oBey8KCXNnnQcqAxxEjPQ+A+NuB9jlVEzApPSyUp8p+GF7Ql/tZjhWIua/UWQ4LM1GfW/jHMwvuXmqW84GIClUOOsr4YDVfT++0XrXmV8oMza1HZyVgguUy8xY9iQFyRWJ2t3rHA3haji4+Hz5fDO0KlaNsCpcLhDLqiLzH9hMfIdiH9R4ZQZTwYC46PTWCe7Sc4TngzvBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39840400004)(6916009)(4326008)(6506007)(478600001)(86362001)(66556008)(66476007)(8676002)(316002)(66946007)(107886003)(6486002)(83380400001)(36756003)(6512007)(956004)(2616005)(8936002)(26005)(5660300002)(52116002)(6666004)(186003)(2906002)(16526019)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?va+eYN3oLZClKlfR2wZH3ArL0sMOO8ZpsKDU1E+vmi+V7DsV8Pm8egWDSs6Q?=
 =?us-ascii?Q?MjTvcfn6JjriyAghzmIxmoZBZUul6zz3SlZROKYo34ihnD41CVT4n851kFkE?=
 =?us-ascii?Q?fWxGu1rr7mBsm/EUB4VeD120KPTUfhuD1mz0C/PPZUCCEXLVRehMZPdYfFOJ?=
 =?us-ascii?Q?duhUDQ5WWZXUdSx9xA1lvzAMYrgIIyBrK+CQyXjzLUPiBiFMBi2vb8WSDCYq?=
 =?us-ascii?Q?AWRFv4OAc4E4F1i2gCKBxZ/6OyKgInhl2NxLFdVSD8Nh4sFNf68QzTpmOUYa?=
 =?us-ascii?Q?DyG5AA3JkGhS5B10Jr8/53+xz975VfLV+bIfXiOt5vm7kvIGlec3aFnZ+dW4?=
 =?us-ascii?Q?QgX6lyr1gacnAMRMefsuDcWPmM+SevPD8DeTSzExhr3LL9hPXYPy+M8QOqMH?=
 =?us-ascii?Q?i428rWpEsAkRuhATK5ODxnGSDJIHcQRghZV15vi1hd/b+BDcPUSijxQZfeDd?=
 =?us-ascii?Q?TBK+zLtto8RODaLKuZaZK/loGtMCNnxLxAg7tr8S7nI9mZr8qzwAOqsrr1rz?=
 =?us-ascii?Q?7S4bBwxxaIIOm3EGrB9BI4UeztTf/P1gStq7M3KoIofp69XTeDmQISEC82Lf?=
 =?us-ascii?Q?6u36YuefDmRsZ8AzL3BgtXRDdEucMJLK6uj8BPAv+sXjkQjPFH2dP8ERwhWx?=
 =?us-ascii?Q?DNvJDwym6qmvc87WpklQdzpzd/RF+afoV66NTWGxsRAvOVVpX6MTriMWgYC0?=
 =?us-ascii?Q?wt4ob0dhZNCV83t3qY9MyfEREBuMXsjLge/pgi7EznxA1Ny6lDANcHwygbhX?=
 =?us-ascii?Q?yKwxvK3Ob5xvddVbQxnQHooE6qeylz2YRaxwE6hA51rnPmp4FXYce9z1FyEU?=
 =?us-ascii?Q?+KpeoWzWFeGSl/UVqHLR8MfMz/7OyjYefVFi8MJ2ocRvUopyc4/h8DrT6GLS?=
 =?us-ascii?Q?5rqCKY0cm5WgmsAsP9q7YuD/z4k2YRh1ReQjp8AQWYDiY4slJEkoqTIX3561?=
 =?us-ascii?Q?JvtB3NurgpSSpa528oV9+PpuNua/WH2/2PIj+ZMuSPvYvHPWIwAHec0w1cfJ?=
 =?us-ascii?Q?QWZ4rN+1vx/hG7+F/qmT8ZkIqp+NyjwHOSmVefKh549CwHjrPs1HyOv061RD?=
 =?us-ascii?Q?drJVb+rf16rqcOsaSLayeCCeozZwv1mZeQnlAUpOqK32AwOqDjzi/3yAZcwF?=
 =?us-ascii?Q?cXABymBWARhFolESF+KDbdcKqaIjBJKyr1BSNm61xIH0thiYEz9Oggh97J4B?=
 =?us-ascii?Q?OjH/HVxneTYaGR9zCDMvv+tQ5DDTir/Xg1GQ4DYMn864xNPqa0mKP7lgKrhZ?=
 =?us-ascii?Q?QGkXEVnLs2ryaZDwAU0Tr73URYjhIbBV9VPqeaelp39lCzwNaSSJuanpAy7k?=
 =?us-ascii?Q?JDUVJsAvEZenp5+SGqkwn9ut?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7538133d-d197-4e13-3ff7-08d8c9f456bb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:37:33.9122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cRCFYrNOx+bmkTHLqbq7A+beQAOAdrlGQvqmXOytTnd/x1//kX9kahCkQSBxNlaq/V8XJ5+6OBznXzYIoisCfJ6bGXttv+ynImPvIyeGHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.0.136;
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

It will be used to stop retrying NBD requests on mirror cancel.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/block/block.h     |  3 +++
 include/block/block_int.h |  9 +++++++++
 block/io.c                | 11 +++++++++++
 3 files changed, 23 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index 0a9f2c187c..2f2698074e 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -849,4 +849,7 @@ int coroutine_fn bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
                                     BdrvChild *dst, int64_t dst_offset,
                                     int64_t bytes, BdrvRequestFlags read_flags,
                                     BdrvRequestFlags write_flags);
+
+void bdrv_cancel_in_flight(BlockDriverState *bs);
+
 #endif
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 22a2789d35..88e4111939 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -352,6 +352,15 @@ struct BlockDriver {
         bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
         int64_t *map, BlockDriverState **file);
 
+    /*
+     * This informs the driver that we are no longer interested in the result
+     * of in-flight requests, so don't waste the time if possible.
+     *
+     * One example usage is to avoid waiting for an nbd target node reconnect
+     * timeout during job-cancel.
+     */
+    void (*bdrv_cancel_in_flight)(BlockDriverState *bs);
+
     /*
      * Invalidate any cached meta-data.
      */
diff --git a/block/io.c b/block/io.c
index b0435ed670..ca2dca3007 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3460,3 +3460,14 @@ out:
 
     return ret;
 }
+
+void bdrv_cancel_in_flight(BlockDriverState *bs)
+{
+    if (!bs || !bs->drv) {
+        return;
+    }
+
+    if (bs->drv->bdrv_cancel_in_flight) {
+        bs->drv->bdrv_cancel_in_flight(bs);
+    }
+}
-- 
2.29.2


