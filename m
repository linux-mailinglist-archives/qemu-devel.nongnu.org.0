Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E6C69FC52
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 20:37:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUuud-0007PY-G0; Wed, 22 Feb 2023 14:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pUuub-0007Oq-G3; Wed, 22 Feb 2023 14:36:21 -0500
Received: from mail-bn8nam04on20721.outbound.protection.outlook.com
 ([2a01:111:f400:7e8d::721]
 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pUuuZ-0005XO-LO; Wed, 22 Feb 2023 14:36:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDA+ZRiZbPfSAH5zsFoMhUqKQccapVIu1DXdszCn0Xs01Eixn9w7/Kj84K60lQtZRnUiZM23wmAOAWV2DZtddVjELPfguYxBrq4zrfpvOKB+KmqXtwmoEeQ65VkC8mzfl5v9aZLZPkxVa85sG18Fr1CNoUAJMWC6s3pUi9+8nv8wNabpCFV7WTm0W6TojxIg59ejMyjt10Nqn86D7abXoEsK7c82MjkMBB3qPKDkwcOzhqe5ZdpLMGd/o6W8MQbezZTwvz3xCAk74ANX5pfC6IQi0HEFD/RYntJYawfYYeqls3VsInv7kzlJofgauam/kOA1eMvqtbYy/qNvd4/Qsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwDe/e0V4VQ7659mZIwBnxZ/MuFgJYvSiJkZ8YgWnNk=;
 b=T4H6Cjy3krcGqOqwD7Jv8cGjuHSLLj3L1nFPhfhBaiDxvCiVnJS6ivNyAPxqHRgsg05zzmRb56cwpqFWEwfPWjPyl/FQA/ZMMn9tUi4+H0imlTjRJ7ND9nXZezW+5Nfzv3cHPAORuSbqzYgBeaksi8jrkONEZTpvpasXK2VBJ2a61vScepfvxEH9bwu/Xp+rhk7/B1k42uG8DSZIhj/i0gfK0LicOGPRvRHsosBytHbTi9UHPxaQuPZzFPH80g2h0+VrXM76TAxLC7l1r+o2ZnCF/yd8L4K2zMCFTlE1E6y5lEhI+Sh/BtinjgSRoF6N082UG6TlkoK/0kTccLUEZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwDe/e0V4VQ7659mZIwBnxZ/MuFgJYvSiJkZ8YgWnNk=;
 b=mR7AduYiLKpzkPmlm2l+24KDCj51o7/wQx7mYVIOOqPsSa5/powBZ/GYy0+pxwEMBI3NHPk6FiZFkEFKvZ+KkII/tC4YNiW7LVKB8GynYmU8RgrFbZR5hbEei+IoxkFZguxwvO0xc7MtxGaqyyZq/WIcnfEY5AnLFqGF5oLtn60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SJ0PR01MB6448.prod.exchangelabs.com (2603:10b6:a03:29a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.20; Wed, 22 Feb 2023 19:36:06 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8%9]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 19:36:06 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v2 2/7] target/arm: Implement v8.3 QARMA3 PAC cipher
Date: Wed, 22 Feb 2023 14:35:39 -0500
Message-Id: <20230222193544.3392713-3-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:610:5a::26) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|SJ0PR01MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: e0fd3f94-6466-4e1d-0012-08db150c0ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: msIe3WvS1ZuzDW2Aqw1bOkm5PKDKZusRvey5NrIhC9Z/Tn6cHSwjrn+RwnZ8gmkWM6eCteaRlmUIdFwNtvmhed8aFtFBb1GZcRX+DKJCvNejs/0WMMAJUcYw3wOg7bFU/+gxjbhU0BP5TohwpAX4hX3+hTlTC05alclmRu/0z14JVHT7CzgGkCxg0/+t0SYkJv1e1HNp5eu5mQzYgNnVr3FB7otilo43yx0viSAI3Eq09GZANOQG5Usn10/dnGrZBanLS1degoOOev6w3UFkif8Wmc17m+5HJ8TjRouAJ/GNqBhV9uQFceJM1UQtUigl1dbuNo3OUlnTYbMVF8ow4NvRiOrvVMHtFyhgRhUZomuQ/o7oAb4kwe5hk7ewQgHNMXQhIa/a4JMXL0IyKYQkr2BmjE3AA5knle2QpSuJRA71VC9Z/BSW1nQ41iCm3sRHQER1snokmZeT2t9B1X7Z5dC78h4GcacWfVIzA8AXdlU6PvVr+6tU2vC08JLOjX6hrFmHhZs0CFsmtJ6VCtChHP8c+UZxCg5hrOPzyQ5AxY29f1rTKtrZVnEDwFSastQ9sMPZVGpQ/uk1ra/A7oFb3W/2YbdB7/mbx+33iMnTZ8R+bhZKcnjs54N1q/9YIqPuuKeqX+RQX7ONzOxvPuT7qATflcpJE0QJnXiZuB/QAWAj4uRsCUwJXm+h/NGTwEvhCbZiZqsFGZWswbY4NJ2BOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39850400004)(396003)(366004)(346002)(451199018)(8676002)(66556008)(66946007)(66476007)(5660300002)(316002)(4326008)(41300700001)(86362001)(107886003)(2616005)(83380400001)(26005)(38350700002)(6506007)(6486002)(186003)(6512007)(1076003)(6666004)(52116002)(110136005)(2906002)(38100700002)(478600001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QV7GKT/aBNSS4ha9PcxLHBSmSNts6PvmLMxZOSzd/beZVmk+5Je6/vssCGvF?=
 =?us-ascii?Q?OtY+VayS4x3IpVNCsLfC9oSvogKL5lS7imwcQG1XoNBqhlqj87QG5S0Hy49R?=
 =?us-ascii?Q?HiyJgm2XYtuEEXDOnLvWcXIJNng6vtg83FP32+kUJLo0juHsmZ7YOV6lNZow?=
 =?us-ascii?Q?ZIM+mo9ZffbfJ2W/lE233ovnOwS3Px4luaDTplPGWTh3yf6HRxwby2WlnwmZ?=
 =?us-ascii?Q?308xIJzMKHIJaO2Z3vUUjeDZwWw+ESeOUcyoidlwjGfg6EOPRfSa3LfqP0qb?=
 =?us-ascii?Q?Ew+ph6PY/yh6hoGuQx8/iR7maMEhjsoslu2iVjSasXi1kCNx2xxuJoIrDJmb?=
 =?us-ascii?Q?nk9fZA4kE16RsiEpAuEVzJGtuJxIJ+gpbmmg4WD3jDNtNMhtyK7nvs3ZNdp8?=
 =?us-ascii?Q?wcCQ0La1V5W3QjmerzPWS1b0M/kIAqFIKJ7eNidGubwdpD9eMIBhSRWZFzvP?=
 =?us-ascii?Q?magLFNv01KzOQdtGtsSNuYYt6YOsBUsebadEWbMDCCJ+CfQ9TvnGbh0gekdi?=
 =?us-ascii?Q?k5QpZNDLEySNR1KroddMmSZcQ/1+RP9xcW1KLdGDFYYE6qfM18+f5VMUPXRz?=
 =?us-ascii?Q?wbUJW6RQoHt76FGVscvwTPi5Ixqillbv9ugSiblGKCNdaRaZdWrpXAk1CJAS?=
 =?us-ascii?Q?shJDKfzE41ByhA+uwtVl3VvwH2o6pKbe1vwZ4PnolADWXUskjg3cm8copaoF?=
 =?us-ascii?Q?LgLH4hIz5duxGwCe4rdEGWD1R6tnj8xw5obo7Cm21LBvJRn7h1Y6W2cn/0kE?=
 =?us-ascii?Q?pi/zu/6NJ0q/Ro3RzuXpT7oeQzXwiDSPnyM8rPadxSlvSpFs/6pfe5DuKdmo?=
 =?us-ascii?Q?CArUa90CW+SlqjZbnxCiJmkyWuNZNqBZxepu0OLw7SZMzmWkSep8o4+gkZW0?=
 =?us-ascii?Q?hxXNHn8Ny1mdwA3AAqD34irMQ3tLf2bmgouQgOzGKFd+pBlzzEAVMEL6N9/2?=
 =?us-ascii?Q?32GeiFYYdk2r45lq+lezptUU01RNwZ9CW3LFFQBb9HB2qkzJwog7+7MHxjTQ?=
 =?us-ascii?Q?ESq9b3EpDqViflsu1Po8ewj+aavOoi1FBuJvX1C94BgfGI2TkszF7Ub1dGOL?=
 =?us-ascii?Q?eUc77KDGpg/0gYW+cTrqiH4SjBqndetS2+tVxHmmKNgrwAd2D+1xudeboi72?=
 =?us-ascii?Q?MiCPurvqiJZoqv2/M+iz5KZrvnvSZzfI6Qx1zrE2UGoh45sjBScY1456aiGv?=
 =?us-ascii?Q?JF7T88L67pVwxw2vceBKhhY6I0Ncni7H6wrpwSMMhoqlU2xfvYPwY9+QvYof?=
 =?us-ascii?Q?uCjtV/8rLrPzK7arz7zt7s0ezDAoeJilU90Zv770iyxGNHaiG3oK7/A3GeNI?=
 =?us-ascii?Q?5y/RU2+bHh6wEFph1ItAuRtd0fP471k+F9dKtd1ZE2SrNgB3MCB5fHRYi2Rp?=
 =?us-ascii?Q?W+4jGSTI61fkLVffhl/YVllJGo0/tIlXK7LTY9glG2qUglREhCdvPIvW9xgc?=
 =?us-ascii?Q?Cg0JYGB/JxrK3GqSFga4Aam5MK5oIawCvqDIaZ5HFnw/cBf6UavNXgDYBtqM?=
 =?us-ascii?Q?90azNVfN1Ze2QoPtPLqU/swO4OsMpzgB+S225b9yj1tHVkU0QXCsH/bdOXt/?=
 =?us-ascii?Q?AZMaH9mAWOgbaa+Pp6pf7saD2gfx33nSE/wY2Af/XBU1Ssil9/XCikeCcgmi?=
 =?us-ascii?Q?5oegcSS9UnXAKqMCqUGHYVU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0fd3f94-6466-4e1d-0012-08db150c0ab5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 19:36:06.8200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLHujsw85GoYGwZcApt8Fr+7Nb1Gr/PeGczH3pvU4b2qwsbImfMatoExytekpCCIGCBB6hRHvLp2UTwk341T0f8hORfxt9xHYv/arlrMJ8ykoOAaiatKHpt9J0qlA41C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6448
Received-SPF: pass client-ip=2a01:111:f400:7e8d::721;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/pauth_helper.c | 50 +++++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index e5206453f6..f525ef7fad 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -96,6 +96,21 @@ static uint64_t pac_sub(uint64_t i)
     return o;
 }
 
+static uint64_t pac_sub1(uint64_t i)
+{
+    static const uint8_t sub1[16] = {
+        0xa, 0xd, 0xe, 0x6, 0xf, 0x7, 0x3, 0x5,
+        0x9, 0x8, 0x0, 0xc, 0xb, 0x1, 0x2, 0x4,
+    };
+    uint64_t o = 0;
+    int b;
+
+    for (b = 0; b < 64; b += 4) {
+        o |= (uint64_t)sub1[(i >> b) & 0xf] << b;
+    }
+    return o;
+}
+
 static uint64_t pac_inv_sub(uint64_t i)
 {
     static const uint8_t inv_sub[16] = {
@@ -209,7 +224,7 @@ static uint64_t tweak_inv_shuffle(uint64_t i)
 }
 
 static uint64_t pauth_computepac_architected(uint64_t data, uint64_t modifier,
-                                             ARMPACKey key)
+                                             ARMPACKey key, bool isqarma3)
 {
     static const uint64_t RC[5] = {
         0x0000000000000000ull,
@@ -219,6 +234,7 @@ static uint64_t pauth_computepac_architected(uint64_t data, uint64_t modifier,
         0x452821E638D01377ull,
     };
     const uint64_t alpha = 0xC0AC29B7C97C50DDull;
+    int iterations = isqarma3 ? 2 : 4;
     /*
      * Note that in the ARM pseudocode, key0 contains bits <127:64>
      * and key1 contains bits <63:0> of the 128-bit key.
@@ -231,7 +247,7 @@ static uint64_t pauth_computepac_architected(uint64_t data, uint64_t modifier,
     runningmod = modifier;
     workingval = data ^ key0;
 
-    for (i = 0; i <= 4; ++i) {
+    for (i = 0; i <= iterations; ++i) {
         roundkey = key1 ^ runningmod;
         workingval ^= roundkey;
         workingval ^= RC[i];
@@ -239,32 +255,44 @@ static uint64_t pauth_computepac_architected(uint64_t data, uint64_t modifier,
             workingval = pac_cell_shuffle(workingval);
             workingval = pac_mult(workingval);
         }
-        workingval = pac_sub(workingval);
+        if (isqarma3)
+            workingval = pac_sub1(workingval);
+        else
+            workingval = pac_sub(workingval);
         runningmod = tweak_shuffle(runningmod);
     }
     roundkey = modk0 ^ runningmod;
     workingval ^= roundkey;
     workingval = pac_cell_shuffle(workingval);
     workingval = pac_mult(workingval);
-    workingval = pac_sub(workingval);
+    if (isqarma3)
+        workingval = pac_sub1(workingval);
+    else
+        workingval = pac_sub(workingval);
     workingval = pac_cell_shuffle(workingval);
     workingval = pac_mult(workingval);
     workingval ^= key1;
     workingval = pac_cell_inv_shuffle(workingval);
-    workingval = pac_inv_sub(workingval);
+    if (isqarma3)
+        workingval = pac_sub1(workingval);
+    else
+        workingval = pac_inv_sub(workingval);
     workingval = pac_mult(workingval);
     workingval = pac_cell_inv_shuffle(workingval);
     workingval ^= key0;
     workingval ^= runningmod;
-    for (i = 0; i <= 4; ++i) {
-        workingval = pac_inv_sub(workingval);
-        if (i < 4) {
+    for (i = 0; i <= iterations; ++i) {
+        if (isqarma3)
+            workingval = pac_sub1(workingval);
+        else
+            workingval = pac_inv_sub(workingval);
+        if (i < iterations) {
             workingval = pac_mult(workingval);
             workingval = pac_cell_inv_shuffle(workingval);
         }
         runningmod = tweak_inv_shuffle(runningmod);
         roundkey = key1 ^ runningmod;
-        workingval ^= RC[4 - i];
+        workingval ^= RC[iterations - i];
         workingval ^= roundkey;
         workingval ^= alpha;
     }
@@ -283,7 +311,9 @@ static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
                                  uint64_t modifier, ARMPACKey key)
 {
     if (cpu_isar_feature(aa64_pauth_arch_qarma5, env_archcpu(env))) {
-        return pauth_computepac_architected(data, modifier, key);
+        return pauth_computepac_architected(data, modifier, key, false);
+    } else if (cpu_isar_feature(aa64_pauth_arch_qarma3, env_archcpu(env))) {
+        return pauth_computepac_architected(data, modifier, key, true);
     } else {
         return pauth_computepac_impdef(data, modifier, key);
     }
-- 
2.25.1


