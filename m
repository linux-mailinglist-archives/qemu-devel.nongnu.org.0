Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54788375152
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:13:24 +0200 (CEST)
Received: from localhost ([::1]:37798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lea4R-0000NY-DA
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZyH-0002PJ-D4; Thu, 06 May 2021 05:07:01 -0400
Received: from mail-vi1eur05on2112.outbound.protection.outlook.com
 ([40.107.21.112]:60128 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZyB-0002uf-AE; Thu, 06 May 2021 05:07:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEf2U44Dy+ur4XG1hsAGsZtrj7A6znPP3QG/NNRscPMdorRY5x1bdv29IU0dGaeYAmCYCZ85aT+yd/i7X+2dZIdGcqPqC1L6apoW4zHS+D4pKYiJWRqdJjB7a/zX71Phx8CvZMllK0m8bcpym+qGA6+TU6SqoEHl0Y78vkeRUs79nUY+b93IxBP/Y90s7QvDAKCr3dGghGa9w55gdRgJsj3X9WI+RgJ7yVMwOAC4ZO0OTzVByrCqDySSMgOlehLsaar7byIizLYjFmQBTHOzzpqKxg7f1Q6m/++uKZ2Nv4kturbLAEp4qxsHwio5zKwAK8jOX168jF186ZvT8Zov9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biuXqDpX15+zqyxYFY9GfS58FYanYAu+Vu0XVtkx/oA=;
 b=UrT6iLqB7+QDWeMX+ZU6EEPvsVyGVluSt3eyeWPaPBzMx9uiHl753z2wQ9vuS9p4EbYPiW0IbBHwCBHuGNpBFwOTY6LMwQLvojAZAkDvtcDW/6Gt3Ou2orwqHOj1lyX1AclwJmZth0aSD42L/0ptfMjf2u4aGEBT9dZURi3PXcotv0j+888UohwdVSWlNzYmqIeUyfgdb6dTyYylvxMH3yeO23b4HRp4gndCoFK5rL3kxKYBoIteytKg5EzsPkWqKTEqPk6cUUd+ViFyzaYZSwfkGQDm35hKz36C9jeClqXhOsbOtt/ay7aE8EleywfY0OVoiIQ4iHGZoSPhCi887A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biuXqDpX15+zqyxYFY9GfS58FYanYAu+Vu0XVtkx/oA=;
 b=IrOZpP57jg1xBwn/5X32cw7juytuf7J8TeExkLwYnlkyB4sWSTV9Aq7a66C0zIPOaF0cyluQnFyXZR6ObrAlfJHJc7Kb9vR3lCDfSeKT8tXMUaOLzMRORZGz7SYpalm2/knm7m9Hd5I3n+jKI6TAs6mkcN540ZoSA+jtDdUX6bc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1715.eurprd08.prod.outlook.com (2603:10a6:203:3c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 09:06:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 09:06:48 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v3 8/8] write-threshold: deal with includes
Date: Thu,  6 May 2021 12:06:21 +0300
Message-Id: <20210506090621.11848-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210506090621.11848-1-vsementsov@virtuozzo.com>
References: <20210506090621.11848-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 09:06:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42214a01-4e35-4599-b2ae-08d9106e474e
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1715:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB171597C0200BC9CE2F25E17BC1589@AM5PR0801MB1715.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NYc4hQAT7b2sT23Ru8+TU6ZOleqdJbDEBe6DIP+jylMDvZjPD6HHRHpUIuJAzoXCPfcEPGIuEYMc8DgBFcJ0Cb0fQoNEy8GgYxD/lwjDqZGmwOdOp4B5xkW9HzTw1VyQghLZXn6KyRX8I9Wt4Eohmtiom5+efPmduA/8Zu/9hXRfnKY593tLjFb2nM2SusgzPQ51P4LUOseOFsRXHzDaiVDOW1O5mG9gkNJDujRgt2hs+m9+Hx796xy4khEUP4Xg5dTVaJgpQGyOUE2K7JKkCcq8F2d95F46t0Hhn1SgJ9fly+h8YtGx5FNkfDyYGnSRO+054C+LuQ90DVJvMZQGboYpWBTGi5UsZT3vY92+GFwWDvnFZGwbDjO/TX5Qv0Di3fBhLrIwsial9g1QBrWXO1Iqmp9+Q2vaMhsXfqnjmjt9lpvtul2t9iDH6LsG8cf9q5fMjXVL1En+FQXRUWOoVylLqw660z+YaXgLSeVrMZLagp8bAXeBmwL6INegk9OJzeh9wSHySl7uoR+JZY4zU2p89G+malTmiG/ryA4wbJTGUhbOMKYk167D+lpgRu1TTfq2V9p+Qm+urX/KRIEYJ2m5kmfyy6EmuTpmAPnKvHhWL5kC9vywQnyoOgvWssCq+RD8JUbjXAkZGHp+Pry+1CJPEeHx+2X0Tcv2zCrHzHitnz1mYRj5T6Qx1bqzh56g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39840400004)(136003)(366004)(376002)(36756003)(8676002)(6916009)(52116002)(6506007)(6486002)(6512007)(1076003)(2906002)(66476007)(66556008)(66946007)(5660300002)(4326008)(38350700002)(186003)(478600001)(86362001)(16526019)(38100700002)(6666004)(26005)(8936002)(2616005)(956004)(83380400001)(316002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gNkbCs2oeeiFuf5XsQeVofd1bJ96pFgHw+I2pWndoMF6GXPdf9MyuB2Hi0L6?=
 =?us-ascii?Q?2/aVl5EoGUHEJyCvKu7UyrvJAiKunjut22slMR7hgKNQ3wTbqH6tXdfXUJDU?=
 =?us-ascii?Q?gUr7lJ8MgdPFZVMhkJtVK8p5RRuw60aIv7bjCHPYI/e2wlEBxVK4TNoRcUhJ?=
 =?us-ascii?Q?IydhWdt/9pNiA3iNKeXBrTvXXpTfHEPp5o2oSMb+eecH49BbY6M3CkDtz7Gi?=
 =?us-ascii?Q?AIXwKqzOPR9bkCMy9ctaOd5CB8u+4fCdA7r7ij3Go7SWX00Rvxkuji8uUYZG?=
 =?us-ascii?Q?Ac26+Cp447WfKXf8uBJQZ6pPjHcFVajoRFhEswHmswnX9OvCoT/DqkXAoEBw?=
 =?us-ascii?Q?0E/4d23IOQMlpjZfEjfHDNCsGkIrR9ZSt8yZOx4+cDXG++oGm+dQPmtY5zVb?=
 =?us-ascii?Q?YlJcOYzscJjphbC2kgYjrRDKe9/LLP1wlq3yE0n1Muf2mIk5sRisFstgxEdF?=
 =?us-ascii?Q?bmWYjAO6gJ7H88DgbiGMJStxXvKeqkQCPnONQ7krtgOiW+lb1K4TKKXVnqcA?=
 =?us-ascii?Q?VqzEGET9b2/EssnJYqY7R8Gpk1h+xV+4RahyEVtxR9k+1Vdf8UOxL78GXjwP?=
 =?us-ascii?Q?EcpWDAQ8E8sNQqz3RweDmUobxYixqLB7u/ijVlUBTmAk5JU0BUoUhE6JQvn+?=
 =?us-ascii?Q?JBjU/jAkVbqvonzYhS+5PyHomKDgcDfGxHNuMBxXi2xZhRMobcvM+/nJw8UM?=
 =?us-ascii?Q?Oh3NBU8aqMMLUUhGXTEFZKtih2y/lUXIk8jr5XIIPOxr2Cl0nb2HuL1pxfkN?=
 =?us-ascii?Q?41XCdNh1sXzrwOBz9YkxiPHJIV319SP0vIKQQB1F5u3Dnwb7YCXRfE1cEr75?=
 =?us-ascii?Q?9iPG7GBJxXWj85/Tmrla8x+Olag80xu2STC3xgByujylbi/iRqVkAAB1gTUI?=
 =?us-ascii?Q?VW8nMbiMTPq+VcrSTMqzdet5cMM8zhihXTFfA1r+RXQA4Dwi3oVc/k7QkW0l?=
 =?us-ascii?Q?2EGT51r6sl8OSGMbPfUZ2vMHAP12QG/2ltu8lNfszAyhmF9ACF6DM+mtjMf5?=
 =?us-ascii?Q?HeVrH5a4KwZRupatyCBCO0lfwkpCDP0p2lxVD/2w6LFVoK7/m3TWonGXPY+e?=
 =?us-ascii?Q?qtJsb8+mmUX4E2avpvgSoOX/TejEUIByOx+HhXn3kJuIWeyG/kcYP0sZ5l9I?=
 =?us-ascii?Q?SqycXaxKqR1Q08J7bO+JQr85RzVCluy32hwNFBYYiTascuU0Y/vsOzvRa9FV?=
 =?us-ascii?Q?33sdEzSvbKYf2GrEalSbTJ9XGu1JjLEmANHovj/NSUIwc7Ufsivwg7LiKCJ5?=
 =?us-ascii?Q?IV8lZyS6TPhv8czToLzB3d7QLLTRKZgoo32vhto6oRxBKMJOj/51nI/iCTKV?=
 =?us-ascii?Q?h4e8CyGLuvSzYBio5+BZNh/q?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42214a01-4e35-4599-b2ae-08d9106e474e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 09:06:47.9717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zw1TlgNk13EQzNa5O3qGEWv7JYL0NAudGm0gHnukbza+BvA4tccBt8BnSYLtz7iTdDGp6SOiNK1P2/b35UlLOQmUSg5ID4jePvnnSCijFkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1715
Received-SPF: pass client-ip=40.107.21.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

"qemu/typedefs.h" is enough for include/block/write-threshold.h header
with forward declaration of BlockDriverState. Also drop extra includes
from block/write-threshold.c and tests/unit/test-write-threshold.c

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/write-threshold.h   | 2 +-
 block/write-threshold.c           | 2 --
 tests/unit/test-write-threshold.c | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/block/write-threshold.h b/include/block/write-threshold.h
index 28c35a1c05..e3acbc249d 100644
--- a/include/block/write-threshold.h
+++ b/include/block/write-threshold.h
@@ -13,7 +13,7 @@
 #ifndef BLOCK_WRITE_THRESHOLD_H
 #define BLOCK_WRITE_THRESHOLD_H
 
-#include "block/block_int.h"
+#include "qemu/typedefs.h"
 
 /*
  * bdrv_write_threshold_set:
diff --git a/block/write-threshold.c b/block/write-threshold.c
index 8b46bb9a75..7578c0599a 100644
--- a/block/write-threshold.c
+++ b/block/write-threshold.c
@@ -13,10 +13,8 @@
 
 #include "qemu/osdep.h"
 #include "block/block_int.h"
-#include "qemu/coroutine.h"
 #include "block/write-threshold.h"
 #include "qemu/atomic.h"
-#include "qemu/notify.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-block-core.h"
 #include "qapi/qapi-events-block-core.h"
diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
index 49b1ef7a20..0158e4637a 100644
--- a/tests/unit/test-write-threshold.c
+++ b/tests/unit/test-write-threshold.c
@@ -7,7 +7,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/error.h"
 #include "block/block_int.h"
 #include "block/write-threshold.h"
 
-- 
2.29.2


