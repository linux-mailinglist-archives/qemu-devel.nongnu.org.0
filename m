Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15C8689377
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 10:21:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNsE5-0007Ci-7L; Fri, 03 Feb 2023 04:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsE0-0007BG-G2; Fri, 03 Feb 2023 04:19:16 -0500
Received: from mail-dbaeur03on2071d.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::71d]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pNsDw-0000ne-MT; Fri, 03 Feb 2023 04:19:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqPrDK8187Y+Uy2u0m2ZkFOlcmA6627TaFHcM+j2vKjrud261npKhmATfpd6wNjpmwksq28LpdTM3LiHIWXlDMdrH8XC/QreDzpjgMgA6C/AgWSyXM9rANZI3GQ4vPZTt1fU2+t2JBDLBEx6IJcgr18YSXJBNy/FP8eqiQPLQ6fAdbVWJzq8Z3gyxxpAeY5fVJ5mRk+oN6a2Th2kaRYs53HqF9ypgJlF4wZNuCVLmAaF7j5AqTUKKZ86ak2sTlQmK17REilCIWfofFaTpGkwCA5G1MpIdK8WNvCI7O1/YbRDdKXyJdl0ulep2HVL6frWfyKjpuNalziEOFYXR7eJmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWHA8EJjOhuvT0aJtGXbHtecNQioXt+iEQlas045jas=;
 b=JdZOIxvSUQ5O8gSlRYtdDCzwP3qHt3GfH/r5ghv8SbRSWOVXAp/xZzMhJaOU1Kp4XUySFlrNUhuBPcOGEnWSMhMJBPtH78g9OinO+wLRhTzB2EPE/te8qyrr0Lernj3RLcF3sFNjkDHIg8OD703/DGEV8R+wZgtRFkcJEkvPObmyqXd/F32EOgJJn2kqmTGMnnApD5Ey88yoMDlO4FmNIc/BJl2FrBaOQSG5T3oEMBeUThpHlal75u2jz5QL/mOStMsDfiJ46VP5vTNzOdOUzhZvBi0W4hB062PlD2sbE7d+jp8F9e+vLVhsOKSd3ncFXJ/NW42j+mpXjSmSNERp7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWHA8EJjOhuvT0aJtGXbHtecNQioXt+iEQlas045jas=;
 b=AaHBnrRbEpdhTnx+J5Uq1kC62SFhOxDNyrPor/8PnR3rJRsiRx/Mqnk89Z3P3uGV6+5/yLL4UqgP7aoBhDIVEtQ8Pl49M5iOw04bo32EUROM8+hQ2dEmXjidIksbnfEhGvkISkLi+l2y/ZyHiDGnmHUUdE7NlFxz/FxHOabW4WNRJnswzZbYOdl3n6JQKxnBaubwxsaW2Y2SGNKLn8XogM5UGj4oeVfAmNsCsK2eHjoiDJcMMGsbAzv+kSL1wIfyCKFI0OI7aIcVI8b/zogQAR1CVK59+S2p3L+q90p4PqlVro1iE7b5/o+Iwlbuq59Ur7U+DAszbp3tEq1rQQtFUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB7721.eurprd08.prod.outlook.com (2603:10a6:10:390::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 09:19:05 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6064.027; Fri, 3 Feb 2023
 09:19:05 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v10 05/12] parallels: Use generic infrastructure for BAT
 writing in parallels_co_check()
Date: Fri,  3 Feb 2023 10:18:47 +0100
Message-Id: <20230203091854.2221397-6-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: e03af629-e9b1-4432-024d-08db05c7b246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 82vxFBrXzax/lxITquxjccPH4eo3IsR5GMbRrzL4iuB97t5o303sV1wNlfFNYv/AKfbmB9q9Ba+GIPsf89EIfs6fB/H7NO88IwtzehELPd7nL98e3Jmp0z+C+F4YFsCGEH9j11Jp1/yY+qxOXprbn+h8RuVsP0oVIpFIq9WP9aVBoQXLYBYzKMINXC81i3HJ7K+EsJr0JLa1GBAybZ78xpuQL7ih3JyWU+sqU4YxRfaN058/AOMyvcYEV4aMs8CxhqunUuc4s3SLEFEYUuEtbypSe5EY5YsM7hCYCR4Dl+t6PqV8ZQWRtxfIlOVPw4VTDK29SSdFOjX/MLjFUO93ON2DR7O0PBB63czbaBJSdwmekJ7evoTVVawVbsa6KuRRa8tTbVctEBbNsk4wrZ8ZoT2P75rvWsQhgeRLHXDE2/zd5Qy0b1CjZvmXfDESkYiux+A4Yr/KL7EGk5ExYBpTXg1g2l9H/N7JWEWmCyRCg1a1r1zuqQH1PFa4wa09RpYfe11323jTkFMycBNHqEUL7x9SMOKiBSF9BnmLPduJuYGkRsepxhzbvAHXxV2+0ra4Bvy9357ERXgbQfR+M/wjmMoo951oOk932gRPq7ajXK8iPyW/MrbIw0UHtYCvCF7T/3bInJMkq0wN8N0+/Nok5snjzEdsyIz64bfmi3t8SECrOjKDrt96h5ZxMFfw1Yob8KkFIgMf3duGliByU5pA4V2Vv2BYCGIDlmpHuFAGjYA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39850400004)(366004)(396003)(346002)(451199018)(316002)(478600001)(44832011)(186003)(6512007)(38100700002)(38350700002)(2616005)(36756003)(86362001)(8676002)(6916009)(66946007)(4326008)(66556008)(66476007)(83380400001)(2906002)(6486002)(6666004)(41300700001)(52116002)(6506007)(8936002)(26005)(5660300002)(1076003)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LFYslHmNKzUSI72fx/s1zpP6gTUKlRAHME1Y1PdHwtaZQxzWmTVf83crwGJL?=
 =?us-ascii?Q?qtOzlZKxJ3QXXpnpm1h3HXVxNY/yT/Nof/15F8aMLg1Wj0amEnbvTnu6vY3g?=
 =?us-ascii?Q?gGgyCZJvk3TAVcVpKPQnDgug69MVYuqFVfHVls7+SCyBrWN2nXlabsL7LuVd?=
 =?us-ascii?Q?ILbViyOJYs0gI1rRJJhpsKPMB83s3VxXWb/0Ft7xE3DnY9HdJt1V2ZJPsDJM?=
 =?us-ascii?Q?698in/yxKsLOcsrSqBw/9TjmT9hGLKnryYtTHup06DmzEMh0t5jW8RQtBkkw?=
 =?us-ascii?Q?oZPC4tmzQoaAKKt9TtjH2q472GiLvqfd354pVZqIXnHR8j9Kbi4k8hHNbEcy?=
 =?us-ascii?Q?HUmC0QAUDqxqL1Mi6FVMiNAhkkuKJjzE5HJsvxqk7zpGZtg4mQWdMaOTC0J6?=
 =?us-ascii?Q?L3MW2PxXX1IlpAr4L4nw1/iA0CT1y15B0QKUfdrtapPZc25H/SCTUAnla+h2?=
 =?us-ascii?Q?EVhLQSy2Y6zBOVz41Q1nmIiBozz/BlTfYuciMJKIZa3g0Zdc7sgzV+8bNlNN?=
 =?us-ascii?Q?jIhJwYRNiwSnVfs2VQyKgkEgIO8fSkR5KNRrI1jB86Q7soOfQrYEEfTG/eFB?=
 =?us-ascii?Q?RaTc9SHwGtVOdH/33Cq3QiHDXbyXpKa1q3UZX8iUmJWEmwE65X3EqI6NZ/ye?=
 =?us-ascii?Q?0RJVxyOD9x5wzQ7RTQVhDnsdjpL9UnvS68BXFtsu4FxbNmHVai1kYHtgmBn0?=
 =?us-ascii?Q?bfnoT44c4P56wBMp8DrRUWX2AIlJiS3V0rHRrPNqSEYVkYCnPECJRW2aZN7T?=
 =?us-ascii?Q?QRpNKkiDJDBcoXGgZ+T3iWjcIEp3kcphu1Eh/eAG2zR89NNRnB/Z0yKmt5Yo?=
 =?us-ascii?Q?GhsUOVIoUdoX50NcYiYIAsw+JNrKGDiZZ22rTB99mas5O/z9ddndbNUqMuvT?=
 =?us-ascii?Q?/rugM861NCkjIREJtMDG9JtHnxGe3pKmKeGtd7B6NWbHxhWPLPILUXTQohti?=
 =?us-ascii?Q?dsAFYL5PdjOX9Y3xRbfeJqG1w8RX7yrJdluxp9LjUul+sRvRXMLT3vUXmYuN?=
 =?us-ascii?Q?7HLBLZX60JR3spIV38fRz1mfyyyq1f+GJQYclhD0ih5b49j3vbQHm52xmdV3?=
 =?us-ascii?Q?gLa+l9drtKxy2L0PavPdjJlj7tg1wrD205J2cPfg6BXhnlDSYMZvN0gyo6ag?=
 =?us-ascii?Q?X26r17T/y7AiSID2LEyhOLsxezlujlrbLXfSHa8ThH1G7ajEbBAba1lKOPHX?=
 =?us-ascii?Q?hDpRBecDzMsBbhAk3b9rrQpwFOCTcCYFf8yLElL/NVLc33WA0omutMR673I2?=
 =?us-ascii?Q?f//ev3t1gUSbjSmxjXzTqjsS4/559mdC+qt9uYwFvggbtYK4RcETu5J2mPlA?=
 =?us-ascii?Q?MQMrKTJ2MsJDFlunqGMAPo+5slFHeFkQgkKd4ZmXHrTS/9WiBlSziZxxdpB6?=
 =?us-ascii?Q?30Sxyp9vHwn+gzvgWkMRJFJGy5rjWOoy7/plKZYEqtAGw7lO5cjdvokkaQSn?=
 =?us-ascii?Q?7Weap2LI4umhu0gNILfgMe6HUOMAULua8Wsy9SpmAlmJTVNvLkNp6TQMC4GG?=
 =?us-ascii?Q?W24XCMyT1rnDRzAFoM/UUPbxqw0G6xxBr3TrBpc6i3VsJnTtHkFg23nte4Ek?=
 =?us-ascii?Q?kxiXONMpKyw/+aJ6lFMoz6v9fK6K6pCNtlLZfq86Z4XNArTu3tutLqN3pt0P?=
 =?us-ascii?Q?5x1+ttryG3OFWBPku6LBaiw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03af629-e9b1-4432-024d-08db05c7b246
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:19:05.1714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qr6tCcNKw8vNArMmukL6ZPn8xBJkpWWNqJSFEaqy+7Go7vb+wjbRVzpYC2TAnE/jk7BG+NGR+W3hexEHzHLd8Xbv/L/wgspPCB/3zX46jr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7721
Received-SPF: pass client-ip=2a01:111:f400:fe1a::71d;
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

BAT is written in the context of conventional operations over the image
inside bdrv_co_flush() when it calls parallels_co_flush_to_os() callback.
Thus we should not modify BAT array directly, but call
parallels_set_bat_entry() helper and bdrv_co_flush() further on. After
that there is no need to manually write BAT and track its modification.

This makes code more generic and allows to split parallels_set_bat_entry()
for independent pieces.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index b2e3f5f98f..63bfd7074c 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -425,9 +425,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 {
     BDRVParallelsState *s = bs->opaque;
     int64_t size, prev_off, high_off;
-    int ret;
+    int ret = 0;
     uint32_t i;
-    bool flush_bat = false;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -465,9 +464,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
-                s->bat_bitmap[i] = 0;
+                parallels_set_bat_entry(s, i, 0);
                 res->corruptions_fixed++;
-                flush_bat = true;
             }
             prev_off = 0;
             continue;
@@ -484,15 +482,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         prev_off = off;
     }
 
-    ret = 0;
-    if (flush_bat) {
-        ret = bdrv_co_pwrite_sync(bs->file, 0, s->header_size, s->header, 0);
-        if (ret < 0) {
-            res->check_errors++;
-            goto out;
-        }
-    }
-
     if (high_off == 0) {
         res->image_end_offset = s->data_end << BDRV_SECTOR_BITS;
     } else {
@@ -527,6 +516,14 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
 out:
     qemu_co_mutex_unlock(&s->lock);
+
+    if (ret == 0) {
+        ret = bdrv_co_flush(bs);
+        if (ret < 0) {
+            res->check_errors++;
+        }
+    }
+
     return ret;
 }
 
-- 
2.34.1


