Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0B568653D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 12:19:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNB7R-0003hv-IT; Wed, 01 Feb 2023 06:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNB7M-0003e4-0Y
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:17:32 -0500
Received: from mail-vi1eur05on2072a.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::72a]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNB7K-00059n-AL
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:17:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T47N2r4PKyHjTC4rkLKTKTXonJtCgSA7iksyR9yCsSYAP4uiIFj5ht2ZfWxlzi9ycvdK3+h/P7e7pdtx0yk9BiisgyFYwyUfv3HGyPrCCQltmaTvvhXDL19xDpYBYHXtDUE6soTf0uuFE7UFm3poT1hxzhD6vSbViHm5IIeSz1Y94oGQN73wZL9HMS5srk6Ulln6q/g+nkyMjCnPj06ZaXPCC499Y7SAgrp/rgaFVDiyVpCxEYRCeXwpoe/9zLC6WgBXVoCuk0fsG5Gwk7y6JKzcRZGhs+LVJeR4+X4Vbg7vNIlvfC473Y/UFpub+UtT+571mGwAC+h4xMrHRO3DvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7zZf+KFg2lkjJS2Kk5CBQvfCNoMX7WhBjqVs6+/MjE=;
 b=Lhg5qv0C5oEm2I9zS454+It51O+XrN2vyrvEYoWqxDOKxET8faZ4PLnMChhL/ZeNvduOIZuUboMJq2/cE0Nfa5GSEXPgmGOvxLkXzubp9PjmGIGJ8sbqVwBlR7KZIYfm2zpAmZRq7d3Wu/5xqOVHbLcRHEXmjxijQN06dK/u1WbVmWaTYsWwu+PAeeRCra78Z+LkrydETZdBTE19gWJzvWeLFPS6zVQ7K9VDDGu0cfHomq+3GMjv9xg+NCzINP+Zjx7NvUjPCCcM069wQS60f4J/PjryYyvuX/kRhWS+xIE5pEgc5MZ3zrIznCpBX+wYkvxXCeDwOPqXlFsMQzXdlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7zZf+KFg2lkjJS2Kk5CBQvfCNoMX7WhBjqVs6+/MjE=;
 b=k3W2Dy/vGkDOKUx+SEmURkWy8RO3Dp3hBG3j2Vw7sr4iiF2Q9/YGtpqW+ZYvCgHEi5CzF50J1LaPwhswVORR5p9Zrz/SMZbOsCyGHeElo0EizDnpZ/z95k44PAVs/VArpCF7xuuGgzvM5UajYMxTSNqNaT+3dV+bv+3ipz89r3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AM0P189MB0642.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:19d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 11:17:26 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 11:17:26 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v4 6/9] igb: respect E1000_VMOLR_RSSE
Date: Wed,  1 Feb 2023 12:17:19 +0100
Message-Id: <20230201111722.28748-7-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
References: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0017.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::15) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AM0P189MB0642:EE_
X-MS-Office365-Filtering-Correlation-Id: 3214cd3e-63b3-4892-cfff-08db0445e58f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FjuH0KZav1s0PzNHRq04w6b+egKxr6mO6WhDA1i67osfVxtvnkxpWaS5pJJRO6yjpJt/HDSMOvznfYerml1weA2FmaXQ0lxrr6o/zGSHrlXbbkoRqvNXG24MtX3lkFZBr2JEBpHESyarop8sjNMUdClL9ryLdtmal25Lriu1TqDLDMVleQI9sf/RWONW2us88/mpbQIhfaMErNUOb5psw/5P/c8gLRb98GeD8HDVyH596cwSHjdPW36qc2lEfONu/9o7KqO4+7FG/eEkZaJ+fGvdFuJUX2Nq6YptI8rcfb+RDqoJ/Ebt2g+P4a0Zi5188PRB8CaoroSPpWvlzjZof/YaFlc4zNzFrAW/Z2kyCdyLwF2+YwDYru3fZGAgxArGUa0v98KAdIqAZWrJnWctHHydvu0u/QE0DhJ9mCfk5GDyYtAD/igBa1OoCpwfpcE2On/iLd2T1J3dA2590gomVLmk4hyanJZiXUAT/899UA0P7zs35nFlBlFlBIkEFm2j4cpbkqhkgHKgOHAiLck9oz+ieJuHmm88EE0qWZTNK70X01WXkYMywz9tQRnEod+fjZUJb3hAJlgxhW6n87vMXWcRMyGRNcSfzSOW9FFP2BRaVAarTR3qWQFMdcHnG2QXosW+ZGxvGQbXjWcQL9sZwsk0EFg0BNTkPQRLvT4Tp4VoW+H3uNEFr5bJhRJtEre9WnnYhPk19i9X28c2yYVyNLuaBQ6wd2Sel8MnMNMZHeA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(39840400004)(136003)(376002)(109986016)(451199018)(5660300002)(478600001)(2906002)(4744005)(41300700001)(44832011)(66556008)(4326008)(8676002)(316002)(70586007)(54906003)(66946007)(6486002)(66476007)(6512007)(6506007)(26005)(186003)(1076003)(83380400001)(6666004)(8936002)(38100700002)(2616005)(36756003)(86362001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kFeX54dlp1OGmOw86lgz+NebKw3Qd8EJk66LqFWrIMI9A6X2vfOhK44UQLHt?=
 =?us-ascii?Q?rXMrvAdkjHFhsBEnW1YRkXU5VywD2+kV5ldGFiEPI5FMCCFnVxMqlu9PDqch?=
 =?us-ascii?Q?y/TnGLh/zVC2sMyj0xMWV6cDoplqeDMnkrmOfStUd7/u0Ztd55snMXhJo3EB?=
 =?us-ascii?Q?+35atCAcyeygGmCscE7iUEA1xHODfkHKlYZ2R8QqVMNfFTXHjH15PY15QV1G?=
 =?us-ascii?Q?5KccSXj107x857z6ZR6qKXuv7pQ2VDVKtoomvo3N6c5sAKsBeR5cOgtwIYMA?=
 =?us-ascii?Q?JITYmHD9hUGbdwjv9k8rNtrM9jrf2TQi4zlo7WrncQyMZHbEZViLgrzQzWF2?=
 =?us-ascii?Q?4QD0emwje7rnGhCBOPin3L2gZC2f2eZuf5ITNaD2kQRGWLPsYP7PuR25BUE7?=
 =?us-ascii?Q?eRCnxqMGMyRGVTNyzrLaieJKnCawLDSECorj5mhQvNJqny/yD4MTLLAkn14r?=
 =?us-ascii?Q?EB7K/L3xJAOIDefeWkJmIqLS/NNyx4iyVfvxrKzrNnOwrzh/pbS7+aQgaXbI?=
 =?us-ascii?Q?xixZfBSdHFdHRgG/MjmKzrXQ77Cj28mUgcXqFuzAImpuvTvoMM0pkVyHz2Zz?=
 =?us-ascii?Q?S0y9DatMKwEoAg7595A2+CH8jG2Up5qjsdhjppb3gS4o0vhNJ7bkboBKEcNb?=
 =?us-ascii?Q?x85YW+JdY80OIauNM5Oj25DXmVwc2MrTGGC+FAFp5a4hY1MZa90HZKkYxovc?=
 =?us-ascii?Q?5mmP/zx123MHIgRVEIlCOUjV0dfZGx0khbsSXZJDCBEP9ZlH+iLcVF8L+MdG?=
 =?us-ascii?Q?exbRiv709vqnXFj1D2LbBJnotc4M7ne61ZCqpWnvswQLri3GBA8ahk5QytOM?=
 =?us-ascii?Q?jrRu0vUZzeVOOpbl8bkFBc9M+YxGBIjaGMOPHYkphod+hZGhEqI9mqL1ob20?=
 =?us-ascii?Q?cE/iz8LoqMZq26nX1K2mRHf2St9oK1/U8OPC/X1qYM8Q5v2PrzGjUnyGLxq4?=
 =?us-ascii?Q?xU9A8DWPSeKna2VoZxi44nZEEJt7D2uvFCLTK1rvZiVaVkV0m0X6fBt6FWiC?=
 =?us-ascii?Q?VHXcknCYTHpIY4rhch2NGkcFFYIpnlhRBKLEj/FhU/wfcZyI9ObdKMJzgljh?=
 =?us-ascii?Q?vNlS8FSKMyS0wch9HKQ5tGAoDqdRar9/NTbricgrnAgkD8WKtPi++acNHwHs?=
 =?us-ascii?Q?cW58K+DR9VOoR2gifJJDLjphOJ9THBEaPibm5nlKQw6CmeQtAc5dKYnwbQQW?=
 =?us-ascii?Q?nkI282KZ97TvaOVVOTfUJn8EArj1F0HhpLoV8CfAoLQsIAWbQwLQFQrk/s3M?=
 =?us-ascii?Q?QDB0BLb2T2nPk0Vy2oW4p9ooeoh547FWa/1+KkITsUCijsyEybpDcVh8FSW0?=
 =?us-ascii?Q?Kqm49D8SfqmdTnY0m/bgivHE3S6vXcnIOh9FAerMD8UuZEGOyDA6xV49qcA9?=
 =?us-ascii?Q?ZoMDkFO070dS98ILbq4qFWok4VzpVr671J6X0aImbakPL7YkQpbGa5mzUs26?=
 =?us-ascii?Q?N+3Tv5uKxPgJPN/ivdwpiNsZqSbhSvPfhOnr9jE9Rv8x1M+agqxQLnt0o+dE?=
 =?us-ascii?Q?0xrc2j/CodQHSFJ/GEnBA97iv/C37j8fEWO2a83riXfj/1sy+5csabaKRdpV?=
 =?us-ascii?Q?awq00JALqLvjZ2J1gFJhyiXWO2AYlxwG/NI9YDSVKXsuJlM/v5EusQXB4qL+?=
 =?us-ascii?Q?9A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3214cd3e-63b3-4892-cfff-08db0445e58f
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 11:17:25.4656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqCAN8Q1NFrd9fBYmjvb3r7xSJ/jmhNwyvEuQHVE2O+TzZKO1bSiY7xwEkJwiFHnzb/lgmavxP5+i363u2T8PXhu/jDPvNaivoD6wWCAjic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0642
Received-SPF: pass client-ip=2a01:111:f400:7d00::72a;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

RSS for VFs is only enabled if VMOLR[n].RSSE is set.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index cda81a54bf..c0b20287f2 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1048,8 +1048,15 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
         if (queues) {
             igb_rss_parse_packet(core, core->rx_pkt,
                                  external_tx != NULL, rss_info);
+            /* Sec 8.26.1: PQn = VFn + VQn*8 */
             if (rss_info->queue & 1) {
-                queues <<= 8;
+                for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
+                    if ((queues & BIT(i)) &&
+                        (core->mac[VMOLR0 + i] & E1000_VMOLR_RSSE)) {
+                        queues |= BIT(i + IGB_NUM_VM_POOLS);
+                        queues &= ~BIT(i);
+                    }
+                }
             }
         }
     } else {
-- 
2.34.1


