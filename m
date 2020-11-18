Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD66B2B83AB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:16:59 +0100 (CET)
Received: from localhost ([::1]:52188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfS0p-0004h7-05
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:16:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpE-0004YS-3d; Wed, 18 Nov 2020 13:05:00 -0500
Received: from mail-eopbgr140135.outbound.protection.outlook.com
 ([40.107.14.135]:60229 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfRpB-0008Rp-HN; Wed, 18 Nov 2020 13:04:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAEdInkelPZrNdWV+YU6YXibaZTCOhouLKgk2TsNRBCCoUZYz/EvBugYw9wUBf5TcOl7a6QlUxYecDOCoY910GyofJQmdIPeQAHLebQ49J1qQWb2ZoDalQFYE0yLUx+bxWL/mxGyarZ8m4XqnWFpx+4soe4R6wSqXPh9Cm9K1mUS2OmWuxvNMurPQBN5uhbnMostfhiD/XZ+Cj0jj9W2bOLidDUdZrU+w/aXojkXZ8yxh33/Q/FdbaI4dNcGZLCC5Wr2t4Y2sEOlWPsYbuWijYdOV2+ODc+ZeCvnGTiFMYeGCzYJrhXp64pSsEoXBDdABFzkl6fUfeSTCwKEa56tTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJektPw8U8MOfpXPgjoBEMYFx4fcpHFsnjhMzWoAlGU=;
 b=eBKhQxnz3EVtmhrXd+R3uFa8z3ypofn13AYHG7/MNlaJBVBt2peag/GHr/9oArWKbEWYdLXXwTRiCtFQvfqcNztZ0R5Ya1a/QWJbprWdvBo++6PS0mvWJ5SVno3oewcKmGXjmBGzF7T1ei76b7hFzxTbyYFc9TLNPUn544ckAfo60MZ6+LzfY6rHiMoCLgJNz9As4MYFbAj58PQcBjxvyBzHLu4LTg+/7vugOlZOJ/CDSc9OqVH90QgMvqKqL1NDa9tCFVgPNwj2Gurpd5Z8YMPKytn0WK+rj9U4Ruf8qMsjGG9bOh+kLiSZuYsJpVXAEqnRQjaC10wjLC8QS7VWig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJektPw8U8MOfpXPgjoBEMYFx4fcpHFsnjhMzWoAlGU=;
 b=NRZuLy73cFa/IFqPaPsm4cY6164SwE0NqdLpCbwCsLyS+XTyrnkdgz7BoDzzDJvWDCSa2Tji/o/Y2DgKshi05ZpEyfitXYSE1adk4DxsHxLgxmX07ogIIemiWEvGaHt48BpvtzDwqcrSnndssyz/RPU6J569CUPI32MiLa3UCO8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 18:04:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 18:04:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 01/11] block: add new BlockDriver handler:
 bdrv_cancel_in_flight
Date: Wed, 18 Nov 2020 21:04:23 +0300
Message-Id: <20201118180433.11931-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201118180433.11931-1-vsementsov@virtuozzo.com>
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.112]
X-ClientProxiedBy: AM0PR04CA0123.eurprd04.prod.outlook.com
 (2603:10a6:208:55::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.112) by
 AM0PR04CA0123.eurprd04.prod.outlook.com (2603:10a6:208:55::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 18:04:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16c61875-0f7e-4c07-f10a-08d88bec6f5d
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB591236FE97AB6C3C756D9B27C1E10@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KkqlINrsT5vp/hXCKH3va9atMvFvORG/fZkGwdZLDzD72DaRzBc7bp8jnWUlAaos9d+nRU6O+VmYokY/9j9zX+Jl9QzRJYZJ16Y2IStoKll+XHZXnsFyLUrE7DurcjBX9v3wk325jr4GAQkuTh+brm7va8BTGt1SIJ0A0guvCgSds/ZBdnTzIoTTKBhMLZO3GwigrXeWYBJbR2EE34jW/LFX5Ej0UwRrqhfn6hFbveQrKbfaJzSqprsfs5Y9/DY1985w3EJRg61mUaJCPnoEk6sAxxSdV5tXY7E11gY0HHzl7ZjmIVoMj4SvXNkLxquMNhQny6RdKEutKmZFwlTQ3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39840400004)(1076003)(6512007)(26005)(36756003)(478600001)(6506007)(6486002)(83380400001)(16526019)(2906002)(186003)(66556008)(66476007)(66946007)(5660300002)(86362001)(316002)(2616005)(8676002)(956004)(6666004)(4326008)(52116002)(6916009)(8936002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: Ud96tC6BYxvUxlEsJ0WlCK/ltkBlTBQnH5mpa54tJjB3Zku+54R6pRdB1tpEbdxVyHibSzQOKsCSmvCe9Yp7YrCl2Cf1VHU9uz5JVcwaesxyrbcSN/sShJS30QtpMXfA4ZdC9hqcxARMIPkEyy/7i0H2PZ5qyBAQJOPDY40HCCgbJ3elhKTB6qP3FC3VVxy0DxaqatlkQ5pAIjZ2s2mfuVJwihAVqE7n4Il5YKJ5loGt20idEqxu/o+8uO7eETe5O1Bz/x41NlUFg7Xoox1jDahjquh8tZiMpH+zRjxR27l42oCByF5+BJU9+WJOA9AU6TPBzkOttMdbK3oDdzGAVRv0A9WAFDoVymlTYtziHGLodmNEjv1ONf1tdOXfiZsz0zKAH5aZXD3Cb8qDu8qLkixP2ai0BfrFcCGb9Z4s4l9D4trM+y2e/Xza9ZPeFNtTzljHTMc2eqTeGRYI0YBejITBXcwAuLBwHSWWIVoE+31S7T7ZmorEflRmnc3hxz+hjBZPaWYoaVxdIu8S+DI87a+JE/7vWIrsFu57xnMWxCTHOrIvcciEm1EBMqwJ6Cyy/nlbxEq/VJBr7hqn/RNKhyMQ2bC9dG+OWH5cADNF7xnK11da8CHitKRW9rjzH7FUgfymjzqRRDazo6YySpNPHA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c61875-0f7e-4c07-f10a-08d88bec6f5d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 18:04:47.1030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmDegBfz9DA2BtrifDKi5d73GrNyitXoqsaF/5kZZKNLC5FEBItpD9row/dMzK4rlNUQZt817HuXW2+R0ExELtTNxcT1TsnAxOuVPxw38Tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.14.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 13:04:54
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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
---
 include/block/block.h     |  3 +++
 include/block/block_int.h |  9 +++++++++
 block/io.c                | 11 +++++++++++
 3 files changed, 23 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index c9d7c58765..3990ee3677 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -836,4 +836,7 @@ int coroutine_fn bdrv_co_copy_range(BdrvChild *src, uint64_t src_offset,
                                     BdrvChild *dst, uint64_t dst_offset,
                                     uint64_t bytes, BdrvRequestFlags read_flags,
                                     BdrvRequestFlags write_flags);
+
+void bdrv_cancel_in_flight(BlockDriverState *bs);
+
 #endif
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 95d9333be1..07a87ce5e7 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -344,6 +344,15 @@ struct BlockDriver {
         bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
         int64_t *map, BlockDriverState **file);
 
+    /*
+     * This informs the driver that we are not more interested in in-flight
+     * requests results, so don't waste the time if possible.
+     *
+     * The example usage is to not wait for nbd target nodedreconnect timeout on
+     * job-cancel.
+     */
+    void (*bdrv_cancel_in_flight)(BlockDriverState *bs);
+
     /*
      * Invalidate any cached meta-data.
      */
diff --git a/block/io.c b/block/io.c
index ec5e152bb7..5dcb6433f9 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3288,3 +3288,14 @@ out:
 
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
2.21.3


