Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8DB2BB01F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:21:30 +0100 (CET)
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9A9-0001Lg-8i
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:21:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg95h-0003zn-HQ; Fri, 20 Nov 2020 11:16:53 -0500
Received: from mail-am6eur05on2104.outbound.protection.outlook.com
 ([40.107.22.104]:54753 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kg95f-0004qy-DR; Fri, 20 Nov 2020 11:16:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Npqx6xJJYUlnRTtIqg8QfDrvtI31z5b6nb3xz1YfT2CS4+5JT/Lnnr7iqeOpyhfdojCzoMubCJWZILhchpe2MmjbvLKADBOgc+SQq5w4n2QFN+xE7esK/GjDA5OTEoT1ofUu4GiF71KuILcF4Dk920hxoQ2X/IBoGk+pABz9yIjq1a4LBajtY3vGsEDEbWNAM1dPZtf8Hr6PisQos7Td+GdAfnVMjfLXTSdLhVeMHEZYsGeFYnSY6g4592wnvGlSzpHHDtTFEpglfTnmEn+mvrq/IkdPPC3hmFXIZtGezHCXpuqFLILVQdO726ekTh/ifVJ0I4lehbFvUJQ0O1x2sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+Hn7GM9GmyDmZOUGd+/VwlV/H7JIh6yI6QoehPwoxk=;
 b=KmCKLkweHeVF2NVJVp7FJN6wssMOrlsvPD8q6Ec7jKOjQNNX9quYhBsM20PJpZlnQr1WyVcQ9bK72h1WY1sdch1tJlOlyHyl04Nj76zVdsQmUtyUDWKTYUmReZKwUoQzFfZDqmzFB+F6G7s9oLt6JCGi1FTk+de9ImnDepnj/hhMI1Xp1Kho3Nn3kpmPJ4UwN+YBcJQAr9W14eNzhJ9Gf33HTEfltaFSh0dGk05sp/x0dtCQk1yScHG8d6v0xNcQt4ECzSAeVWOPlnBu9blNVql21ZddbY+c0BUevwLN3OYJ+T6fDoLix1oGQuequCfHkl1+uIft7oqFqkQqGuQEbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+Hn7GM9GmyDmZOUGd+/VwlV/H7JIh6yI6QoehPwoxk=;
 b=MtNrwD2HICnHO1pQFjg1IHS9hPCCk8E9PhOf8f97ZvUyRFotudHaPxrXY78bg+k8KaSKD8rfgoWLWolvbrFTCUHE0MqWb7fQsPNzuVCgFPIJFMVpHY87GJ7iG95g4GfeLeaJ6ykxbBO7kNHCZra+lHLj/T1fgPAM9cVIaM4gixE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.26; Fri, 20 Nov
 2020 16:16:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Fri, 20 Nov 2020
 16:16:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 berto@igalia.com, stefanha@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, eblake@redhat.com
Subject: [PATCH 4/5] block: move some mirror and stream handlers to coroutine
Date: Fri, 20 Nov 2020 19:16:21 +0300
Message-Id: <20201120161622.1537-5-vsementsov@virtuozzo.com>
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
 15.20.3611.13 via Frontend Transport; Fri, 20 Nov 2020 16:16:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 682a94dc-a2b3-480c-d553-08d88d6fa9d4
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB533336BE23D719C4DC0B581CC1FF0@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AoBY1Mpsu+A4H20BHKkZm8HKAuL7qpWHwEMJxdzbfw08r4bS4tmLetMs8d1t6vdVrOnZSP4DtR7h8sWT1E5GlyTbZvm2fJlEk35pKaKkXDhCB3BY03PUKApGCGtip8tEvlSdtRoHWPIqQDteNbMZDp0W51PJglj0R+vqG1nlnWCI0wiois5Mr7NeWjkj2I0BuNR5xtsZilimw7HF5kwLe+RevX7QztCTNVStVCLEjj7OOQYZafZo8vkqWpujWGmRsmBrqbG6ddS9AoWNI0HsYM1R78+R5ODeQ/Ds873aiytFv2jnvBHyHSSgtLMwqpij7hSAl8UFAtIIvY+nDoc9gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(39840400004)(396003)(6512007)(1076003)(2616005)(7416002)(6916009)(66556008)(2906002)(478600001)(83380400001)(52116002)(66476007)(66946007)(86362001)(26005)(5660300002)(316002)(6666004)(956004)(6506007)(36756003)(16526019)(6486002)(8936002)(186003)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: INwFMzvsmfoXJ5IT9zqeHedVG0fxUucxmHCN9EdHrypS9jH62+HTZ9ftCsmiAhCqb6CfGZWRXyWOvIHpbj989cAnvQYMG3S0kNa49mBGX4eOpl0kuOf+JX/FJgKGvFxYrLS8de5TlHB7yXov9VjEyeTKQL324YTA0lSfD13VPdA2SYflJod+UgLQpE8SrWS1uvD9oASkX8PNmrxmSdJFfNaKlzWQHEmRPEfoYxQvfpCg0cvVG4DAhPLqHsfW1yNjGgxJAPKe57tzKJIJZNwKybyQDaUc+/QaBgABOq+N1uTzo9zDlpWnm6MVBeifmIrTntN6HA/gQbxnC2LfbuJ+h9FMLmK0WuVZdyrnSXMLT46K9LFt6paDOJizuh0H4rxVz/sfMuA6QdGa1OnEcZ2GU532KrHQHm1lt4v0f8Q7xitL9LkT07EsphQzImabr9LqrwEpcjWzMWo/v25QQC9wgeFg/WRB2Cn0MENx28vE1fKg4jsHMBcK3lpVXFuAMX1AQbrbEdHuowAUxuCnopByGK9kRr4PUVvioju1TqySEl/kuD0dK90Ia9GfUI5zyZujCK2Q5aV3NoKPp9G0bMGt/DZNY4Uo+03gS1ODXELYAHRFKgu6MdvP1HjXBR1R3j1cYhBXoC/B8KmN0WOmaRWjOA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682a94dc-a2b3-480c-d553-08d88d6fa9d4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 16:16:40.4901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fV4DbRO6KUAkvY3n17tVLP0tiLa56js53TU+wLrV3rebVfZnx+ouiHV1aHfesCztq0ro5CPv0uJAf+k7fuXWIWrfdIAtYBGlBGtflOXP0MQ=
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

We are going to use coroutine mutex to protect intersection of these
graph modifying things. Move them to coroutine now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/coroutines.h | 11 +++++++++++
 block/mirror.c     |  5 +++--
 block/stream.c     |  5 +++--
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 4cfb4946e6..aa60747b2f 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -26,6 +26,7 @@
 #define BLOCK_COROUTINES_INT_H
 
 #include "block/block_int.h"
+#include "sysemu/block-backend.h"
 
 int coroutine_fn bdrv_co_check(BlockDriverState *bs,
                                BdrvCheckResult *res, BdrvCheckMode fix);
@@ -66,4 +67,14 @@ int coroutine_fn bdrv_co_readv_vmstate(BlockDriverState *bs,
 int coroutine_fn bdrv_co_writev_vmstate(BlockDriverState *bs,
                                         QEMUIOVector *qiov, int64_t pos);
 
+void generated_co_wrapper stream_clean(Job *job);
+void coroutine_fn stream_co_clean(Job *job);
+int generated_co_wrapper stream_prepare(Job *job);
+int coroutine_fn stream_co_prepare(Job *job);
+
+void generated_co_wrapper mirror_complete(Job *job, Error **errp);
+void coroutine_fn mirror_co_complete(Job *job, Error **errp);
+int generated_co_wrapper mirror_exit_common(Job *job);
+int coroutine_fn mirror_co_exit_common(Job *job);
+
 #endif /* BLOCK_COROUTINES_INT_H */
diff --git a/block/mirror.c b/block/mirror.c
index 8e1ad6eceb..91e98b2349 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -18,6 +18,7 @@
 #include "trace.h"
 #include "block/blockjob_int.h"
 #include "block/block_int.h"
+#include "block/coroutines.h"
 #include "sysemu/block-backend.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
@@ -625,7 +626,7 @@ static void coroutine_fn mirror_wait_for_all_io(MirrorBlockJob *s)
  * for .prepare, returns 0 on success and -errno on failure.
  * for .abort cases, denoted by abort = true, MUST return 0.
  */
-static int mirror_exit_common(Job *job)
+int coroutine_fn mirror_co_exit_common(Job *job)
 {
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
     BlockJob *bjob = &s->common;
@@ -1103,7 +1104,7 @@ immediate_exit:
     return ret;
 }
 
-static void mirror_complete(Job *job, Error **errp)
+void coroutine_fn mirror_co_complete(Job *job, Error **errp)
 {
     MirrorBlockJob *s = container_of(job, MirrorBlockJob, common.job);
     BlockDriverState *target;
diff --git a/block/stream.c b/block/stream.c
index 236384f2f7..8a4b88b223 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -15,6 +15,7 @@
 #include "trace.h"
 #include "block/block_int.h"
 #include "block/blockjob_int.h"
+#include "block/coroutines.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/ratelimit.h"
@@ -58,7 +59,7 @@ static void stream_abort(Job *job)
     }
 }
 
-static int stream_prepare(Job *job)
+int coroutine_fn stream_co_prepare(Job *job)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockJob *bjob = &s->common;
@@ -90,7 +91,7 @@ static int stream_prepare(Job *job)
     return ret;
 }
 
-static void stream_clean(Job *job)
+void coroutine_fn stream_co_clean(Job *job)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockJob *bjob = &s->common;
-- 
2.21.3


