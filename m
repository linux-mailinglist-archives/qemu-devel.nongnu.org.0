Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8439633F3D8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:10:09 +0100 (CET)
Received: from localhost ([::1]:34406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXoG-00076A-H0
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIG-0005H7-KD; Wed, 17 Mar 2021 10:37:04 -0400
Received: from mail-db8eur05on2106.outbound.protection.outlook.com
 ([40.107.20.106]:39072 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIE-0007Ew-PX; Wed, 17 Mar 2021 10:37:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YN+bBc1zDPpov2l2EnllMkqgy2siOgsx7KbR02/4w6Qaca49+brnxT1Pz7E6P7Eq5uMHdisUCIeTqjHTOd1lXm0bbvITK1M5M2+cesAZFuYI4qZpuTTfR3p6kNnS58CbKvCGhrgJNigOaqYo8X6+Q9o2RYRyOzqjgCdI6Pie8A1zkvuuDrRUEoeU6uN7rdTf1QRofN1hdxBIy3nsTxxkZ3k5wd3e92/g2EQEIKL5jN95SWG+pRSZfMOfXesk5awccAiEnbEyQzkEcsAjsXPoMseB6dseDYRdu/P+ueafno2db2th+rNggYRpQJk0ZKV1wmGxDOFWaYTguWDWKnLXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIe9Xr+z696ADIyXME/Vjp0kA7jxWxzAJGy5IvgK+v4=;
 b=FMMOPfONfYcXMwB3D4ve3vWETWJW6eO9bP5GDo/ay+RQ2X7WQKlWisngJ3Z3WdGwP56xWisU4RdKjZyyw4Ne7bmdrY1qFqCjaOAWUvRXnNtasTityT7mQnl0f3z8e5ihgUYOFEP96S0JfcRVDrND4tzFgM4sR7IG4j8DylCxm4c43sfUumNBz/N/zh3yHEPj+5/T0QggWcwbPGlnK0+o+3jl17os9aAki/8ImLlVveBn+GUvqL81NYnf80N597aOu+fALID4JduNOhJeNYPdIf//DzgkEx8sYq/0NDsDm46sCcM/c6ePqzlsF5BKbvyZeJr72nDpwI+5Oo2/WV+Stw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIe9Xr+z696ADIyXME/Vjp0kA7jxWxzAJGy5IvgK+v4=;
 b=cx50mAzcibyIv6q93WQ1ZDAVllgGz4xq7ljeOXId5YyvI/+7Ew8HC8qeIbIt3xIE3niu7LaEKFu0mLUe3+DKU8Wh2m0D+XPA4KGWd9CgZr86i2wCNhLsENhuHa/dYfYtw4uZOfjnZ43ZmSn0OugVvWspsHyRmxQFSe5VPPjVTsw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 29/36] block: bdrv_reopen_multiple(): move bdrv_flush to
 separate pre-prepare
Date: Wed, 17 Mar 2021 17:35:22 +0300
Message-Id: <20210317143529.615584-30-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6af7607-4bd1-4c2c-2c26-08d8e9521689
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6216BAE91CD76EC63972DB78C16A9@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Kt6UNPBnEJqHQ9xGJENYcelNFls+JLNPcPLn26goxy8fwo5kg7M8fCHx5oidmAvONy+8XXDI5FOyNZ8C7QrpP2lD1c3PWt3pfFFOs7GD4dPfeyrlrRuKLlz18eIrvkz4Kx7Itg+gr0SNfLv0Um4uEhgN29t1K/Ei5q8GhsTEY1VerrslrHx6uHQC9hwqZy9O+6upikTGXyc28V7r2dKlOZ1abNskse75n8atahOO4x/VNXwY3swRX16yFMvbOGnPtQ2wMURuLGznpC9YAIl873l7ZCIhxHQFz6XktwmAOa7B4Qz4aBuA0L1mGv6qatRuwUyySXWgzl6E2dHY9GfkI3+AUWHx0AfARQV3NCX+D/uWnS3/fVqBbS+TBwx9E/pwxH5uhNj08nofxLJoYswB1llhRRgeyYpAHVomSplgQ1OgvrvdqfHFXu9/adtGxsa8GnADsk4WiG01unVTuNbqiqmMTgr0yaI7AhYODatEOSM7+5wPfQUPastgN4rrgJK0IQSDOKeVk7soI7XYvfBRdQTlu2XbKxvE7+/HWN5Zwh9dY4fpkuoWP6EPk/8w1nwsU7r6zaAwtctZ7hEdntYMcQ2Dg0jO0Z0kuiULxXySwqQEdfSpMjAany/yzCAlCWs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39840400004)(136003)(6916009)(83380400001)(316002)(2616005)(66946007)(6512007)(66556008)(8676002)(956004)(26005)(1076003)(16526019)(6486002)(186003)(4326008)(36756003)(8936002)(2906002)(6666004)(5660300002)(478600001)(86362001)(66476007)(6506007)(52116002)(69590400012);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wEq1nkNasH+2V2rIRq0RR/zDHATjrp92zeTmA7Ax6uV5JaM9s02aBWOMYfFM?=
 =?us-ascii?Q?Fl1oXhUaqBDd3uG7F6ldm7biGHm+5MO5sDPb4hYWpdx2Dk/kJCr7fdLYTVp+?=
 =?us-ascii?Q?i0111ue5WoxP97nq/0rVaz3eFPNh46tpniEKmD3e+o1ci/VDB+LgXxguaICy?=
 =?us-ascii?Q?7UJvU3N8m7PRv1xu+DNcoHSepOFEKIFYGl2UCZzwfZalOieJsB3dGyC/6qbx?=
 =?us-ascii?Q?hw0xYfg1TQvnDIiXKU1+Hr9iqSWFkfm4aVdmB++lZz6JIqO/Bilkpq9qU5YI?=
 =?us-ascii?Q?MMCxO9bfjiV+dM2kF14p0GvKSDa/wyvi8KoIY5zt+7yNWN/zkv0h0VBZuYsX?=
 =?us-ascii?Q?r2Ky15p6dMxyLrtZN6yweqSEDhwIGQ57k1nhNdkis1QFNiXegC2OUN2VsUWA?=
 =?us-ascii?Q?tUdxIPpl+gstF2K3KiAoy57hyKVAiPjswZtIrG2oKI2UlmDrYWfEuDUpULnj?=
 =?us-ascii?Q?HTLsA8bKU6AKrIdEhBmujiZyeo1IxscRQYp26tg5YJxO29hNYtRVHu10S62z?=
 =?us-ascii?Q?DqNKsKWD8P2bs/q/ps59ozuPgLSnb1oodZS+1NJiLvSluUJ5jYKelaVSWEn4?=
 =?us-ascii?Q?Bb/I6i4eYEOqm/E2cCpaeImwvsZhTV1EYPFhh++ixoeBYLjchUq73uI3Xysz?=
 =?us-ascii?Q?1/5b3vovTqcTV9CfoSxcUJXURl4iIx7NgpRoAUxs0b2kntSD9DyxoqEwuimx?=
 =?us-ascii?Q?5/luwH6bjV8zjePrGYMOuZxyOWSbT1WcX7ooTt5F6DX29r6GShm8oED0pCkR?=
 =?us-ascii?Q?glI77K1JANxe/fhtivW4CCgiAzRoA1oL+Mvb4d4LnOS26PSImLzzXc3Ar6Tt?=
 =?us-ascii?Q?cJREW0YzTUwMCW0Jd39GPj024TNtwiDqJvb1pFGbsk/6iJhwAkSVBvdQdpJC?=
 =?us-ascii?Q?JgkaTlX80FUUh4ZBtu/m+xLpwZdCd7stV69IXUcMmjzKHCh2yP/JY9oRmJEk?=
 =?us-ascii?Q?+K9gGJNJRMZjNOgnyTTrMV7OuNG5T8xgJEQTY9R4cdHeb7U2c7x2hJYEHyXa?=
 =?us-ascii?Q?c4T651o9qcjEjeeklx5oHxn32vVDUh2vT1pBXRAezarGk2mrixovxBosUaI4?=
 =?us-ascii?Q?uoFy9GT6QS0YYCcJuSzE22tPVZsGZ7ODMPeQfJqxq6hmqVuT6cL8swn9qiLZ?=
 =?us-ascii?Q?shPErWGJoLi7IRKqSto0L36kY9iJ1S1ZI5IXj3RUv35S9xdLweijXCqv7Siy?=
 =?us-ascii?Q?naD7V97CXjAozV+bX7wos3yWHaYT3U88wiyjb33VMUvRKhWecDZcTLql5FDI?=
 =?us-ascii?Q?W/yj6Zzg11encnOPWlqQafUOLwypQeFkqx4C0MrFjMtpmvyIm70uVFpPt5+y?=
 =?us-ascii?Q?cfPU/STWTThe4+WIEefMv4ob?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6af7607-4bd1-4c2c-2c26-08d8e9521689
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:44.9366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oKTNJwzM9d+LQgMACFoCGkdGjVozazUSfET5SzTTyIQScORftP2dUNEiWKTBing2lUa9w+NC2YruIUrgrps6DphNLIkHHmerjF5/AuGCWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.20.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

During reopen we may add backing bs from other aio context, which may
lead to changing original context of top bs.

We are going to move graph modification to prepare stage. So, it will
be possible that bdrv_flush() in bdrv_reopen_prepare called on bs in
non-original aio context, which we didn't aquire which leads to crash.

To avoid this problem move bdrv_flush() to be a separate reopen stage
before bdrv_reopen_prepare().

This doesn't seem correct to acquire only one aio context and not all
contexts participating in reopen. But it's not obvious how to do it
correctly, keeping in mind:

 1. rules of bdrv_set_aio_context_ignore() that requires new_context
    lock not being held

 2. possible deadlocks because of holding all (or several?) AioContext
    locks

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index b58c8d3e10..fde4bb219d 100644
--- a/block.c
+++ b/block.c
@@ -4239,6 +4239,14 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 
     assert(bs_queue != NULL);
 
+    QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
+        ret = bdrv_flush(bs_entry->state.bs);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "Error flushing drive");
+            goto cleanup;
+        }
+    }
+
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         assert(bs_entry->state.bs->quiesce_counter > 0);
         if (bdrv_reopen_prepare(&bs_entry->state, bs_queue, errp)) {
@@ -4634,12 +4642,6 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
     bdrv_reopen_perm(queue, reopen_state->bs,
                      &reopen_state->perm, &reopen_state->shared_perm);
 
-    ret = bdrv_flush(reopen_state->bs);
-    if (ret) {
-        error_setg_errno(errp, -ret, "Error flushing drive");
-        goto error;
-    }
-
     if (drv->bdrv_reopen_prepare) {
         /*
          * If a driver-specific option is missing, it means that we
-- 
2.29.2


