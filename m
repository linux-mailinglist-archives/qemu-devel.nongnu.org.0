Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2906888CF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 22:13:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNgs8-0008Hy-TX; Thu, 02 Feb 2023 16:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pNgs7-0008HK-0E; Thu, 02 Feb 2023 16:11:55 -0500
Received: from mail-bn7nam10on2070e.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::70e]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pNgs5-00088y-Eh; Thu, 02 Feb 2023 16:11:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSHi/8Ae7mNuqyjLVO9F/aD4EssUSr22aoq370SnxQ44ecGhh2t+mLIvYeomRWtBqnVL5nNezCNJ1lWsR6qJAefxJKQ1WZdsVWdWhf7N+Tk9Hsig4PYYr1x52WbXphL6YdER2wv8S4AzxcHdLe1dI4VBZIbB58dswEtA1OYjkInRcN80Q2iOXFeU5ywk7ywlD0gFvygJST53K8DeOq5oX6Yz8rbA42o1QgfsLs0kl2wEfPaa7jPkQlyffoPo6mASHNhxzRZc0HrewDuiOShfUpVPgLlMXuiBZsQAentwQj824s+6S84pI3azWEMPtPy+rahsJ1f+/6eydqSWHcNi3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbUbO5AHMuk24EecXxY2t28R3f0zDqCkEQ8AmX/pscA=;
 b=afH5zJd/FJBsEWBiS4LmaPnQDR8uRK8RGGdUzjhyDTqoP1BE0TtLKh1B1X7tHS0tKQN3hs2bMnVIBFYITLndo+NAcFCn6kPCR0Rjk9jyqU4E2mGGLQPZgpGJ5m0kLxS8ud3hUu0xGVKnTZfFYxeqn91eAXoS4Z9heFnhoP1zpzj18bRDwxjvXNFJuVkRht7zta3kOUal+aOG8TAohNcdL4h+d+WghcZqHVKFltUtrKsAp3YaWjHu95jqtCaM9cfZ6wqT0nAZSsplNCW1ho6wTiXNpIuzkvVjphz5oH/hBhKre3Z86nE8zapeVOo5fdesA9f6xzIDlo227SrN38PhFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbUbO5AHMuk24EecXxY2t28R3f0zDqCkEQ8AmX/pscA=;
 b=MkppCwJvegwP4j03+2+axWzG27hRfWnRsKoLyZ6/OZAYHYMvUGSn1cZrfLdZMlu2MQRu2i5JTUk7xRWjr9WEtr56pos0P2r8/cYHXThW0a51EZEsniIiRFzg8vra8bcHSLpMxcZ0t5bEFEHiXens+xDLaeFgbQ/eRr4doU4oEc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 BL0PR01MB4801.prod.exchangelabs.com (2603:10b6:208:7c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.38; Thu, 2 Feb 2023 21:11:45 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8%5]) with mapi id 15.20.6064.027; Thu, 2 Feb 2023
 21:11:45 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH 3/7] target/arm: Implement v8.3 EnhancedPAC
Date: Thu,  2 Feb 2023 16:11:25 -0500
Message-Id: <20230202211129.984060-4-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202211129.984060-1-aaron@os.amperecomputing.com>
References: <20230202211129.984060-1-aaron@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR20CA0027.namprd20.prod.outlook.com
 (2603:10b6:610:58::37) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|BL0PR01MB4801:EE_
X-MS-Office365-Filtering-Correlation-Id: c25a5c46-9366-465d-1c96-08db0562169f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZMA2wPZFF/ZbHGT6ktFbAXeJlZ/hQ7kn4aJCpwur7DXAvyOYUPBUNT5se6nAbS3B9bBAQolnoPJFSMXd/NGxxMQ7AuTFYli6dnmJbln/huT87sfMMgxMKdaP0UmcOVFWyXO47ZkKvZZMnba49VAcBTvUvOWNqVh8kFBCOR1w5XBW8CE4yXBG4YC31L/xYkBpm0p+pVYezvbwA3FDHh3QppCZa5qrh4HFyjRBHGvpmRWXNJK3pvoyqUZ+OuSRroW7bUe7Byxn7c8fS6P6X0kNUTP76TplhVu2PQmpYWDD3+5lJpmq8bUo0kqYTkZicKdxmJJX+oGsQdvsdiO8Wa2t0lKRaPXDr8Vvfg/ECKpchNQ8glWCvLEYralmRWrTKFRk+4RqXeMxy63CMrWhJGq2t3eiD0REuFGh+hCuSAZv8E+hMFp4UEOvD57pA+VmDKtuSgDG4ncmgGPFjGhXrvHkCgLXMT8Mq/z00luJZVzOTssG4gQcnq4mFjkgfPSQX4wOwY0scaT6sFuORg8QaYQFu0CQdYwN1oi2nhKYxScpmeWAiYRVrr3LATwfR8batw0+3LhqeFblVcmkb50ouPEAwuCGziJnwzAD1B2A4BP6BSN5xpmpgSPYvK4K3nuVNssVF+v6Yj17H4p5ung5459NIKGM7pUoJCe+PwFt8Kqwf+yM3dZBGvoO8Zw5c7PPXKFZHo2isClX7DYdy8Jhqq/htQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(39850400004)(396003)(136003)(376002)(451199018)(186003)(4326008)(6512007)(26005)(1076003)(107886003)(6506007)(41300700001)(4744005)(8936002)(5660300002)(110136005)(6666004)(316002)(52116002)(66946007)(86362001)(38100700002)(83380400001)(38350700002)(2616005)(2906002)(8676002)(66556008)(66476007)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xjkXRaUTjVF4Sroqjg8aR0VpSMt+2Z6ybog0LiPHXRDuyD9yXATvqd4beBWq?=
 =?us-ascii?Q?apptV9dSsjm0kjnQWS5OQUQoigK+BkBe8OIHPMxeLhOs2uRzU8Zk56tPns3G?=
 =?us-ascii?Q?vdoNDd+JGlFw6ORCekI9e/SavTjOm5QNKZ0PvELYJEM5vFwpz7GxXPorgY7S?=
 =?us-ascii?Q?vz3EXzsHAuHELOTM0dk9n6gMIVZxmDpk9ZkWSHyuj4tuChGaL6s26A0WFEac?=
 =?us-ascii?Q?tGv6Z4NgvuImvwb5slXBGaFtuOC6PM7UUIQhGEc3MsnpwUNyRwlvR9OP8J+V?=
 =?us-ascii?Q?XzItePYlttCRzh+HuzMHvDi8cyKToDisxwFICRzE7YAx4Zbf2Rx3afMf/B+k?=
 =?us-ascii?Q?KyuloFCWz2cTOCgC46qo1bjozJG/GTysUuYvjj56DqpJEpYVhushzEItu9Kc?=
 =?us-ascii?Q?z00fax1xWyJwq3x5F21JYyljXCqwy2bG2PiuCCxbS4byFRYrJJwHJKf/DJ+4?=
 =?us-ascii?Q?tkOhN5+aFbhhlMTrvV1UWmwMxiJFQnOS73YIGM0KePMe587dCVUPRjIPVozo?=
 =?us-ascii?Q?2Ek7cofl9x6HhwgXWamb78b8TiqlH2knw7vHmIRMax53MwOYxv7Z0bPdDdhn?=
 =?us-ascii?Q?9nFPlBaEy2O0GMUsq60WjAAjPS0G0LAr9K4vAkqdIQCZWfVdtiSMdYc1bJPJ?=
 =?us-ascii?Q?iqIx61364v5BOmS4z76OZ3SRa3UAFOd9NVMThPb9JFeSfZ+GzjbS5QfDVOoj?=
 =?us-ascii?Q?sFTZRlvtixj1kFxqoxHeUZo1VvIZlUH+36zOp9OPWfm/ShOFL0YG+HjOJ691?=
 =?us-ascii?Q?CHdpJdC28o0ygysHwchsVnT/4mrFFwJ79r1eJWpZblGvRGLmQ+/t/j9kCYKA?=
 =?us-ascii?Q?ybo3dBOteFctBQxWLvWJBRzuwJ6MUVs3O9goWw057EEEv+C9g6X64kZWQCPu?=
 =?us-ascii?Q?7x06XU8er3qrXrRd7ZOkY/ldE6yeC2vGyi0belphUtRQLGKe8nl0XD1oPiN1?=
 =?us-ascii?Q?pAYZ/KsECkNv/R+Zg8zuZFDhAQp9MlTCtyX9krrfePYB+XSKd8wOvocl6W1D?=
 =?us-ascii?Q?myOBJY+Vu1F4nkFuAHOj39T0lVq2/nxKGq71Y9pmEJssaD/cihx9N+SwyXR+?=
 =?us-ascii?Q?V1/DQD7F4c5FIqHoMmkerHPza/vvFVNpRcrb0y8thpw4NzW+eyPn1zOMfiUz?=
 =?us-ascii?Q?hvygpZDeUtM0aWm4AbeI5Vj75wws1i7hwX8PwGUwtaaKiwe+Qfekjm57Ujcy?=
 =?us-ascii?Q?26qjok9xEpWgRxw0dlaYIYzUyo/3AbG6hhVEWjOdpdN3X1FfKkPJb2hYM2uf?=
 =?us-ascii?Q?J2djI4v7vW9yy/Cakz4cH8q6r7tFLrNx5fG5Xh/VPLHOOCwNzgsO3nPraa66?=
 =?us-ascii?Q?pieDuhETpqTSHEkNJ5caXOyBdcQ+CjUpovs0DAvqTyDd8ldagLTw4CtewcqY?=
 =?us-ascii?Q?AeOtSPPkHtiQIjzAQb58U1b5eHrJv6fZi5jYIhdvlCo54j+ekiQ2rh4XXGKI?=
 =?us-ascii?Q?tPWwrWO6+qSo3QAAmQ0HzV6H6VPngkjjBQsdAgt8lKOW9EdMmyVabA7vQAqd?=
 =?us-ascii?Q?GNGmEEdabemvVbZwjoCvkSdC3xvyfgBTuxJAEXl8P2V8yqUpcUUWyATN2heC?=
 =?us-ascii?Q?HqNj2HY9MRzvG0SZ+rC1Z7XwJTkrT6hKgkx7ve43mclMxp0aDCFpoQDbFSML?=
 =?us-ascii?Q?zXXMxsJjzovyYfyuQV0RK3Q=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c25a5c46-9366-465d-1c96-08db0562169f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 21:11:44.9704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpjtMPxetquxs1xEOck9mxJXU0swvwq2uG6bTc/jborfXmHXAyO4cUGCUCsjNKrnyNLhrK2RI9yNXssgDeM5ffBm8jZvpQc3m6MXZL3ukpeVp1/6nsyLWaDC6geEP+Ts
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4801
Received-SPF: pass client-ip=2a01:111:f400:7e8a::70e;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_PASS=-0.001,
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

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 target/arm/pauth_helper.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index f525ef7fad..a83956652f 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -347,11 +347,15 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
      */
     test = sextract64(ptr, bot_bit, top_bit - bot_bit);
     if (test != 0 && test != -1) {
-        /*
-         * Note that our top_bit is one greater than the pseudocode's
-         * version, hence "- 2" here.
-         */
-        pac ^= MAKE_64BIT_MASK(top_bit - 2, 1);
+        if (cpu_isar_feature(aa64_pauth_epac, env_archcpu(env))) {
+            pac = 0;
+        } else {
+            /*
+             * Note that our top_bit is one greater than the pseudocode's
+             * version, hence "- 2" here.
+             */
+            pac ^= MAKE_64BIT_MASK(top_bit - 2, 1);
+        }
     }
 
     /*
-- 
2.25.1


