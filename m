Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D288A2BB026
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:22:58 +0100 (CET)
Received: from localhost ([::1]:45956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9BZ-00034n-TW
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:22:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg95k-000462-1c; Fri, 20 Nov 2020 11:16:56 -0500
Received: from mail-am6eur05on2104.outbound.protection.outlook.com
 ([40.107.22.104]:54753 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg95i-0004qy-6P; Fri, 20 Nov 2020 11:16:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XF29OQ0X/NE3h3+AE6ZaMDR+nGYx2TPZYMLZEOkJQ0ErPE2ae1FnEIFX6XSq8ShprBcfmFsfdD6/+khdt/sX7zVLSzOY7UKwZ6I1q3/HTL5hQMt4WwZvjhYDIqghGluSFSCbxaW1jX3kSJasgejYgZzmpNTftf1440Km1aRIGuMjx94mBF6jnU4/sVSIKwplWJ3pr0FkTuuXy8ce6XDBEq6GQfZj2ofkyf4mfkPDuKwymDy7NRiglwINONeQ4LOj/Hu9bT8E1Js3DQAkLa8s2D5D2NC3L/h6Tg96SZidehXyy72YNOxlw5aWdbFtkDjmaorNUL2goUlXYmOQGDyILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHmKSjGAlqfoiovHYXgS1epKt6vfDUsEUSffQHyAwAM=;
 b=nqsKKg9dlMwIxIixfh25O6nPOcTy6P9iLm+LhyRCwWu7EoDFpbfAfI9PrP7paFHaflxWoHEX5DnUcfctWEUcmy5XmUTc+eumI79S9P5y2F8CE5vs9bahwd0yPfKKm/pJ/D/FMHD9ZeH3+5pWmMqbO5wlYi9oSmoyogiBOpinCddTIJCE03C4ZMm8JQg5zBl+5vPOgY4yNK8ynOM+cIdMLZDevP+8Wn2Boxy2vP2sMjziuDW4/SPQh7rbc9KAbc12M5BnGxsR9IlLvJ22ORyP2tEqCSKhfLM1ZJ/sq+FGYInflK7BEeq6H3O7IeT2xtyC3GMOq5WD+Y9kphy2a4gh5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHmKSjGAlqfoiovHYXgS1epKt6vfDUsEUSffQHyAwAM=;
 b=Is5/QYViYPZ5vhVcZpvK/dzFOJcFfA2SZJb59IkL71WWNaQOxPngrwXFI9wq5qezWB7SVLopV9+LEYH+MvxO2nxGCizpz6f6bmMwwhJVaFDimG+3pymA/NmgE7D4ihIH+Zy2M+v5RA+/1YBO933dFyGKgJpJhYoG3udccp5DzWU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.26; Fri, 20 Nov
 2020 16:16:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Fri, 20 Nov 2020
 16:16:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 berto@igalia.com, stefanha@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, eblake@redhat.com
Subject: [PATCH 5/5] block: protect some graph-modifyng things by mutex
Date: Fri, 20 Nov 2020 19:16:22 +0300
Message-Id: <20201120161622.1537-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201120161622.1537-1-vsementsov@virtuozzo.com>
References: <20201120161622.1537-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.108]
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.108) by
 FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.13 via Frontend Transport; Fri, 20 Nov 2020 16:16:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9691a7e6-6616-4794-65c0-08d88d6faa70
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53333C8AAB5D83BE7A91738AC1FF0@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:197;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b10ZlUuJuem1/KSuv1T0SQ7CgtYrB0DHe/v4+kzgmaAkIsaZMou0hUCXz+Q2kIg35v1tOo4KjPOTh8rYNwTSem0soW9x5Cb37toeJj1yvVUjxHBtVsj00MY/MUguMgwtfG4Lsysns12RGIkS9t5VwwJij0GU9HyjOkEDhTXlRD0r7GRrbUaYxODC5asl3OSVpJ1ghnId12SaaJpSrFxLkPjqZQMiVIA/W4UUKPBQUP2bvImKpgw+1593I4QcHJ6fWDFzUALx3uBPoWbW1vUV2al6/Wpr1e1hA7esJeIQVfdz29hZ/lnmzwy/buoEyZ65
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(39840400004)(396003)(6512007)(1076003)(2616005)(7416002)(6916009)(66556008)(2906002)(478600001)(83380400001)(52116002)(66476007)(66946007)(86362001)(26005)(5660300002)(316002)(6666004)(956004)(6506007)(36756003)(16526019)(6486002)(8936002)(186003)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: ny9MJUac8+xmpC7QcI1LxSWCbEj/0XD0Blq8gAViUZBa8Yz58YDRRm2DAFRq4FkCm/6dy5ih/nOQep+tII8bawcN7PvPVZloOfR+55CIteRd0yy/PiUzg8/2dLqSHnU9I9XS1a/cI6M0U38dMmPR+LEgp9KW8YLuHXdMDrAgq9gGTHJPbMAzt5IejFcie1DqaI+i/Lu70RE5lFht2MT+OeIBO2b7bRAESKqKOlZzPt6If2C3+qGjbmiqHghuef5ZAuv8Scj0LDzg8VOMHAkPSRIwZu9pzGtTjPV3tdenU2BTelF4t0sPUC0uAjj2Qx9c+YrA8smlSTQCxiZizCyGzWHlhM8st0z4C7NU/AaDyJ0Wucw09ysaSOnYi86D/W2aUIivR4OZXv0ITZlWqbWy9MUGSCle9OKDOdVrsTdfaCu6M/Y4Wmt0I7ZyBgDjiiC/S01ccS8fl2YIiW9bJF4euSkCCNEYk9ptO/KFlFSGyRIohRMMCRbfOJnLn9iGGn7A/s2o/3rORbAPp3RHem/B6QSgKarQl7r0OO4jUNhUVzeXiHl51xsSYS86BS5Q43eEcaYurAjw/vDsoWESVMoUjMhzwuFBGOHF3EVeym7IbivUXI9/crw68W9dn1D7daoPAVDoc0VRpL6MwMcgoLu8Zw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9691a7e6-6616-4794-65c0-08d88d6faa70
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 16:16:41.4518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lU4KCeQFQ2M6wpDJTQCZL7Zczq5O/UlPopcuKTAE0nm49Ex0Ck13tGBy/OVE9DODEF50SQcRYvtNS8I0TXV+kfH8eIRVnJf68YePlLsMNk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.22.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Iotest 30 accidentally fails due to interleaving of mirror and stream
graph-modifying procedures. Protect these things by global co-mutex.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h | 2 ++
 block.c               | 2 ++
 block/mirror.c        | 4 ++++
 block/stream.c        | 4 ++++
 4 files changed, 12 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index c9d7c58765..a92756cbfc 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -20,6 +20,8 @@
  */
 #define generated_co_wrapper
 
+extern CoMutex graph_modify_mutex;
+
 /* block.c */
 typedef struct BlockDriver BlockDriver;
 typedef struct BdrvChild BdrvChild;
diff --git a/block.c b/block.c
index 5e8dd98cec..eb82b1ca1e 100644
--- a/block.c
+++ b/block.c
@@ -86,6 +86,8 @@ static int use_bdrv_whitelist;
 
 bool abort_on_set_to_true = false;
 
+CoMutex graph_modify_mutex;
+
 #ifdef _WIN32
 static int is_windows_drive_prefix(const char *filename)
 {
diff --git a/block/mirror.c b/block/mirror.c
index 91e98b2349..16c3e0b0cb 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -628,6 +628,8 @@ static void coroutine_fn mirror_wait_for_all_io(MirrorBlockJob *s)
  */
 int coroutine_fn mirror_co_exit_common(Job *job)
 {
+    QEMU_LOCK_GUARD(&graph_modify_mutex);
+
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
     BlockJob *bjob = &s->common;
     MirrorBDSOpaque *bs_opaque;
@@ -1106,6 +1108,8 @@ immediate_exit:
 
 void coroutine_fn mirror_co_complete(Job *job, Error **errp)
 {
+    QEMU_LOCK_GUARD(&graph_modify_mutex);
+
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
     BlockDriverState *target;
 
diff --git a/block/stream.c b/block/stream.c
index 8a4b88b223..13eba00ce8 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -61,6 +61,8 @@ static void stream_abort(Job *job)
 
 int coroutine_fn stream_co_prepare(Job *job)
 {
+    QEMU_LOCK_GUARD(&graph_modify_mutex);
+
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockJob *bjob = &s->common;
     BlockDriverState *bs = blk_bs(bjob->blk);
@@ -93,6 +95,8 @@ int coroutine_fn stream_co_prepare(Job *job)
 
 void coroutine_fn stream_co_clean(Job *job)
 {
+    QEMU_LOCK_GUARD(&graph_modify_mutex);
+
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockJob *bjob = &s->common;
     BlockDriverState *bs = blk_bs(bjob->blk);
-- 
2.21.3


