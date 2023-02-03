Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C29689374
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:21:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsEA-0007EB-OJ; Fri, 03 Feb 2023 04:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsE3-0007C8-5f; Fri, 03 Feb 2023 04:19:19 -0500
Received: from mail-dbaeur03on2070d.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::70d]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsE1-0000oK-9M; Fri, 03 Feb 2023 04:19:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIbNpCUhH7oAgXZP+7soLKLa8bBxDG/psM/iTFxM1UZUX2ZStSYOOLaRYy4Ka2AJ3v8NuiK5vY+UHjfbFlXqwalNAGecgb9GL6USNyF3+ZIAlq8m+Z0NmyE1iE9zCBMBgxCTR3D4+fefmxUkf8G1FQ/wzykRq9OdbqNZuVsjgD3O7HUKqQOWIspxVPcgB5bfJF0bd7OaFZrs6DnI2azbcR3P3DLFTdK8RgrRWKCY8CRe1PATkMtBxLCdnkqlN/qxb6cyu+V35gKGufQHKbS3JeNTzNZH0Hswca8PB3zsjzo6F9NcdvHGBsCJclYveUVjYJHriqahsuGGKWUlQ7JwaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHHhH6GkEPcmWeaMwexhl+42aBznDOcUp1XNu338ZX4=;
 b=nZahZ88YSukzTK9Q/LoUZaHnSW174fl/lKqCEz4TCSzWb8r11ZyG1oj4O4dpNVwgZ+r+9en2kPy9e96y8ZsUehktSZKW2axOf2WeXrM64efnJT/pzwDsWHIIfexTPQSs+LRXcKiP3nyX+5TsApEqVPfVXQydxWSEKL+FuMivu+4OfyokY29veAl0RNlnkXKCtboFEFSX5LKzxU/bJLc2wRab/bZGvgHpMV5wKqhNAQNcAy+il2hhUunagruvN5N0u7RkrIDBlt3zytb5kEPgaJnP83jmiJinj0SVejorfc9Da1o12X9pFkioUYPtsDy+04COnqPunEXvseu54jb7FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHHhH6GkEPcmWeaMwexhl+42aBznDOcUp1XNu338ZX4=;
 b=Vwpo+M+w0GlJ136mxX2dnPydI0+ycugqlVFBDN8iXA38kc924t+ic4fX+nxoc8mAFFgYDWxaO6XFXmYvLbzq19xon3PKR6XEpQ3Qm7AEjLQCQRT+HRD8M8tOLG9hv5TgsqcQXKnWg4Z/qBZCCeaH6H3wTAmqyHKC4XjMhDKsUhYSmckRq1tjysv0oq+5Hylw7tIXh8wLyVCJKKjLp4oNmW1wksiOwXJdZzjUrzPOi4H4HGO9/IyQyKRzoOgnauH0WjXjSgavUIn1YVAOB+S04+XeX4Gb1By9oVaokK9diU96IoLPEuNFf7PmUX1eJIaaN9my+4chncncDOY6WDyGVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB7721.eurprd08.prod.outlook.com (2603:10a6:10:390::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 09:19:06 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:19:05 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v10 06/12] parallels: Move check of unclean image to a
 separate function
Date: Fri,  3 Feb 2023 10:18:48 +0100
Message-Id: <20230203091854.2221397-7-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::33) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB9PR08MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c4a908-19ae-4efe-d961-08db05c7b2b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +7d+wQzBgLFEZ18PsGJIXymcqM7gdFuf3CEZ4xoAXwQN6mVhheeMbUHkKSUANR/fQ+HqgBrlbQytcKisMpfWXlvN6VM3l3TPvqX4wy0b7cOm40Qr1C+LXmwXWZmP/ur+neCNWvdOB3/UwkqXWAKxUnTNy3FIEzL8FUF2tXECikQcdPAggeoyn6/a24B6X4B+wPBrr5Od1s1iVyMX/TRo+nSglYMimIwK9NTlOp7oZZVdsyhs/sgOkAo4gJosFxvtOIkLMW174W/AJrm7oxqVfSeefaSTAoOKpqQlEUpDhBUPcT0Z3sA/WuDeFwJbyMpvtvu/6t6QXma90ReVnoOPv60LgatWyTfmI+ZPv5rhCSPeoZuQmhaInQmH/j25fXbmGe6Virt1Sei61I84rDVNogeKEt4K4qpgwXxUD/SdPMZ/RzrGG+iGxy+JayGle+gARbLD2WnqwUci2f4uItDKstpYeI3K2hdHTOFuDvHoGMGQUD/5xbGcUZwa8mmTSjm97gtBo2EmNz+bkIvPtRuVogojtuEJCPxo1wYtYFGMRDzcl+hc+jXv9Pu4C09uwVd7xS7/BCzeZ4fL9pyva8E9LpZendGXcvbkmB5DGvVsrB+ZPldzIeDZ3/H4jSP3exVU1XqNNZUHBhv+eNZrsYv/gB2nEq7LEs6NZxtiJq80bNb1qG14OYjxFCLW75IT9XRn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39850400004)(366004)(396003)(346002)(451199018)(316002)(478600001)(44832011)(186003)(6512007)(38100700002)(38350700002)(2616005)(36756003)(86362001)(8676002)(6916009)(66946007)(4326008)(66556008)(66476007)(83380400001)(2906002)(6486002)(6666004)(41300700001)(52116002)(6506007)(8936002)(26005)(5660300002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Eyzdiuho9GCcJ26WJE0QFLrg8RjBP3rrfmRedEJjE2u8OSQhixJp9jCrbBOl?=
 =?us-ascii?Q?xvwF3bgku9bJXwvBNQu3Lwl4JH2vIpz61Yh9MRbBvaYWA3IIK+lfC8wV0opp?=
 =?us-ascii?Q?yXY0ocoDPvLigXhNKb8QV+UM6a96CvUrS3qfeyBlejp7cqmoAfQ6U3RjicFy?=
 =?us-ascii?Q?VNv/yl3ervna2T41kWfP0cPf78Zg5As6q+xeoZy66sCrPCrITCGegcwioiQR?=
 =?us-ascii?Q?dq5Ob9qer+CqNC1iUmZyQoDbdPVixw2I9fL5c63vnVX+YvNfcXatYt4KwWBa?=
 =?us-ascii?Q?Cf9goVmhnedmkLnmVW7zK1EmTKF2TyF2K+XBMIaYV42fhdUtl1qAG+y+5Iwn?=
 =?us-ascii?Q?ejMcsYPgOsj2Br597YAh6R4w89GWVbpmCX0df9z0CKw7h5v7KbtEVu8k2BZa?=
 =?us-ascii?Q?beByncCURrwOjdpsDStZSRTD21xTSnQIPFcUvmjPpEF1DNS4lD5LAo14FI1z?=
 =?us-ascii?Q?SKmSXc1AOd71lBz4L1EeV/5ZmjMeEPLF+f1jVbcFRW0hdN8/N//WirqC9g5h?=
 =?us-ascii?Q?M2ZVgVySbcIKRzxtTcekKjdtgLN+r59Ywax0lLNyHArEb1acsMSc2aVlQ1u4?=
 =?us-ascii?Q?CFe3iWlhPPg7xvHnTS5xLd9nk/GorYZDl5gcmio8hoCkKNCXoLxevdxPupHq?=
 =?us-ascii?Q?V3+eEKRuxtP+x2jRy+nRMPVb8CL39x3OyfsNa78VnT2cYTGyXxwY+LLm8vKC?=
 =?us-ascii?Q?CsPaCmMqb+N/Vlqnsrml1Qw99skFX5SQjFeC5cy3seEHapFzGBfiAIbuoz90?=
 =?us-ascii?Q?Lt5a3reaqZNiXT+jhKlDnPLFuKg9aB8hZ1TttcFnT2FS+Ejcm0TdPfvGUqT/?=
 =?us-ascii?Q?4PnCqMi7ZOfjI9jDdoIumYf1lwoYqLvt1deyhLw4QuqLthDSfJv1355Q9RGf?=
 =?us-ascii?Q?aNDPwCMmvFLJ7HZj8zfTpVou1dlGb0IBPbK/JP62zt3kFlBWb6EtKmG7GKgN?=
 =?us-ascii?Q?XWNhAH80jLhZpLMZn+nfVXU0oYZvN8WwkSjFl0ymjWCpZ63M3zRMWS2ORqJR?=
 =?us-ascii?Q?oqF61Tn2WehxwoW7fppNUt2uUjjWfy75M+oLT/qZfRVEmXpXclov8RNwJ6Ka?=
 =?us-ascii?Q?nOhWCANZgz9BkUejqHWb0mBADzIPmYxUg6Z0tG+TEngj6dM841/xCaAslPMD?=
 =?us-ascii?Q?LqUY9tcgctioeMIwk9vh3DI23HjXvCr1HpNB27tKQNhXWxuxP428BnouPX6Q?=
 =?us-ascii?Q?zxEfKicGEYzBdTcQqihsJJqrUlaVTUO7iBXcHO6O6bKTB1hgK15ijoC4dhmz?=
 =?us-ascii?Q?hGc1BdufXrMxNhbEWIQU48quC/U014A5+r/7i2YBBg5u5Ufv/OOkpVncXkdg?=
 =?us-ascii?Q?WvXx4A+UavP1iNul03/3hU57+LzaP3fIJ+2UnbZz3ALlK16WEPRg3KYze9+o?=
 =?us-ascii?Q?/SOIm/Y0zfKhdXK0pXOq18vun+OlI+kqqj+Ml6Ejgc3W0bSo6BIeTXncqXMg?=
 =?us-ascii?Q?0mEja4vPNBFSo9wtSNArEOwbxLJkwGkUgkOz2wsGLiDHpwDdr4OJygUHAPrp?=
 =?us-ascii?Q?omq2FO/w621JyKbXBNliflhOcNjQ05V2kan1xgTF9+3/q0aI73YXCyhmskAw?=
 =?us-ascii?Q?auBqDRjA5AQ57EyPEVTvl61zn00OOuHEasMmFxBmk68bZvPJhm8Wd4//vAns?=
 =?us-ascii?Q?TZGZ75GThDWpWIBg7AtEPig=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c4a908-19ae-4efe-d961-08db05c7b2b3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:19:05.9224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RePV7u3ap16WWbWiKYpgLjsOHtuP5LSQrroBdx7tW6N20PpZDeOb4LMEzbwUC8vhIDK4T2hKU+wieqZO/ywT1mLttttRkLsjJtIg121t0Kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7721
Received-SPF: pass client-ip=2a01:111:f400:fe1a::70d;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 63bfd7074c..02fbaee1f2 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -418,6 +418,25 @@ static coroutine_fn int parallels_co_readv(BlockDriverState *bs,
     return ret;
 }
 
+static void parallels_check_unclean(BlockDriverState *bs,
+                                    BdrvCheckResult *res,
+                                    BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+
+    if (!s->header_unclean) {
+        return;
+    }
+
+    fprintf(stderr, "%s image was not closed correctly\n",
+            fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
+    res->corruptions++;
+    if (fix & BDRV_FIX_ERRORS) {
+        /* parallels_close will do the job right */
+        res->corruptions_fixed++;
+        s->header_unclean = false;
+    }
+}
 
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
@@ -435,16 +454,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     }
 
     qemu_co_mutex_lock(&s->lock);
-    if (s->header_unclean) {
-        fprintf(stderr, "%s image was not closed correctly\n",
-                fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
-        res->corruptions++;
-        if (fix & BDRV_FIX_ERRORS) {
-            /* parallels_close will do the job right */
-            res->corruptions_fixed++;
-            s->header_unclean = false;
-        }
-    }
+
+    parallels_check_unclean(bs, res, fix);
 
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
-- 
2.34.1


