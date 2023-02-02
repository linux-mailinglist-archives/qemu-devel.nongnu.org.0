Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5316888CC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 22:13:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNgsE-0008LP-M5; Thu, 02 Feb 2023 16:12:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pNgsC-0008KG-41; Thu, 02 Feb 2023 16:12:00 -0500
Received: from mail-bn7nam10on2070e.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::70e]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pNgs7-00088y-HE; Thu, 02 Feb 2023 16:11:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbwozvH5xwWfmJJzru3fSC9437geBkfp4vQ41kjjIcgylAY8YjJlYw4sBQnKc9fQ5wsgmOAvw/LjfL0HHnog9RPAgbpUk4+BFUoHEgsy80fUWJ3wGt2vPYgsDhGfms1vi/SC1ee0la1TTueXdiBJ834tKmHgD1o0Bh7z6p53nuu4+UZdFjRnVYE36eHCpQOiZIKdUQLf8bwuckg/lw6KelA7akzm3OidoYlmi2kglMMGHt8h9ImcA4OdiplrDvDUGnvv1q0j1y8qnnLoqaFaZOisr8fZVpUVA2aYG1UZX5EE74hye48rQ9l1ZrmFB3AliD1H6oN819R+w2FnJHxQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuuPrACkW/zAW9ecEcQCjhaI5IhAKFH6ymGl93xiiuE=;
 b=FCZuifmurjvRHxrbzN5N0BwdkCmXiWnILI4BiwzjxQhMo560o3iE0F28sMigh8gnEbHbmXcTZ+EXJGwUpmYR4GWKjk7dlgQA+HcxL1bS3BSO5ktUJg8ZOfZuwcUKYnhGjTL1W+8fQGoVPMSOPUEHaEAvQwYpEAaCfTGUwi7SbBs4umEiG8Mo4ptPVnzOCaNovJjLuPfGxIJmA/AsYfG31peZvywKXl3Sx17Oa2axkLnR891+RnIXTcVThYv0K8T9QLTS0Z9UiN5qCAGjn9gyuqLwyhHyT+cxlWBXCf5jIqVWJbfQnDSyIAAR5p5bGmdHO+3qNSCD4bvcCoA7/4e3zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuuPrACkW/zAW9ecEcQCjhaI5IhAKFH6ymGl93xiiuE=;
 b=GuCbJePZDTv+8yuYqLgtEA5DosLu50QheTvYwbS1GHNIVn8mVZ+Rr3rv/d7lK7s9AWu+xpFfFFxv8yZ1RiOJ8u36kPodxdO+jLp4DvvDesXHDJW0RFflQ0d0C2+SjO5JWEfDRy0YzswvTI4MBx4ihTX/3FAuYcjOp2i9ayEQqOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 BL0PR01MB4801.prod.exchangelabs.com (2603:10b6:208:7c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.38; Thu, 2 Feb 2023 21:11:46 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8%5]) with mapi id 15.20.6064.027; Thu, 2 Feb 2023
 21:11:46 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH 4/7] target/arm: Implement v8.3 Pauth2
Date: Thu,  2 Feb 2023 16:11:26 -0500
Message-Id: <20230202211129.984060-5-aaron@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: edf4e859-101f-4da2-b44b-08db05621711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PiYJGsA2G738x61F1SEhXNbBFSQh0/3ubI8EUkGKzOnlwNOBNROpv+fyUwdmwcJ+vv1RLMtttNSkHyIwstA1AcwMb7bxpo6WEl+K4ETwuX2YiKKdmDCLI4lxij+FAnGec5OtFrXG23oZeQ0xvtcWuHLeUwS/cZvczuzd5ptyw26buUNhJ7IlyUU9HhKkkAy86QDO4atweM88qdWjICQLbN+ifC6xJo0XkDLrYbtcPiU36EqidIh0yNV7gSEStyU+nMhoglBca751e6QIC8us516Eb42LsJKwhwaEJxvCrkOpK05cVEUlU1TvcMO0fZJQbgg9Svi5SHyUbKagxRzJjmxOLEuQvKmiH4Fhcgt1V5jxV9YCXQKTu2mrKdWQepBPcKArbAZNMqchFQzh5BH8Q8haXhrobRJaCOD8NZs3lB8VN1tTDUsS26O1I+3iiTejmpt8aiHoPqk95r+BBY4YMs5k5B2UcOEiDDd3rWHb1zAPPkKfEtKQL1KBLRlEtNo6h9wwI+ISYpVTRa4oRTuniWE/tLMfQlztVSLjWTELNLYHjpK/wYkgB/oUxCJL4CYP5tnBMMecW4NH7ibSLWsPo0aFBbp12xydR2CW89oCNuZEdeWgNuju88UljhHD2yKGJ+Z2SlRcO1Mk0MCCNZurhBkuddIwEie2msDnRje+jxlF37bk+dYNM8SOAal2qZqD4AbmI49/6/yimBLi5X0UWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(39850400004)(396003)(136003)(376002)(451199018)(186003)(4326008)(6512007)(26005)(1076003)(107886003)(6506007)(41300700001)(8936002)(5660300002)(110136005)(6666004)(316002)(52116002)(66946007)(86362001)(38100700002)(83380400001)(38350700002)(2616005)(2906002)(8676002)(66556008)(66476007)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pLlT3/Tz4WJqsCJoWqscH4kYJmSjhjkZizLV3V0PjbMmdCm24zSAOgqctNLp?=
 =?us-ascii?Q?wMmTFOO8JnDDjEaktouf9fxUOlvNhZobPmROxGRGz7YndDRS97t9HpYvXkx6?=
 =?us-ascii?Q?1l2r5EZptWSd6YnEUqXY8HdQFMGObKiR1k+vo/LDYNdDFojlG+TwE33TJ4a0?=
 =?us-ascii?Q?eha6wL/Cmx7zuqcpj44OcumaeRRyGIH84fPglO3aRQDO3BOExSb5bbjWDsdT?=
 =?us-ascii?Q?SwIjKQFjUlrdD403IexJ4ofyVpJMv9vrCVtqfx28fOHe+Qww16hYXTp+dXI0?=
 =?us-ascii?Q?9zeLAqpK7nh+5mURiq3htyocfxpBVoHHxT7YLdvHaEKZ8cMvFTFJ7P53/J9Q?=
 =?us-ascii?Q?w3ILIDMBT9c4D3BDpwj1mt/+qyHR2rkayF0A5oYMmIp5h5xwdAkWxoic4DvO?=
 =?us-ascii?Q?mSeBrVsBrlMfPZSJqiB+ElVjEeedHHtYzuHfxbZ5CqMnfe9rPzbd+66EbkVg?=
 =?us-ascii?Q?QJ0q9BONFPKCY5rkg2IKifKgGs8eltoNpkutyZdaI/1dQOB45CZMgZcANfj+?=
 =?us-ascii?Q?gc6ydg4IS7kN3IdOFHw5W+PeouNalSowYCEcxwMcrzbLo6oNOLaBqGQ2+hQC?=
 =?us-ascii?Q?nWdeKkTf9uUab7kkSJMvHCRpsVZM5ASW/yeFjzLWwLQnMl4omH1A/MK2Sw9e?=
 =?us-ascii?Q?K6coiu4cC089+X4uBBC6xmckRrPVIxTSkUPOWMnB5Tmd9oxytW7xRaGlLpun?=
 =?us-ascii?Q?kULbyZ2vaZr+YZUV6qcozap93oNu9UNADo8cx/PffwaO1mc4JQESXIBIgLzb?=
 =?us-ascii?Q?Fpe45HbbBbGxUEeGxsWxPZOzunPqudsMG7Pxq0I4rCP5FayVzrWntC5NBpE1?=
 =?us-ascii?Q?mh/QjrXMdohAu1kHSMq3ArlnCS4d0xsTJqcYgG7D4r8XExUrMUXL/mQUnnrj?=
 =?us-ascii?Q?g+UL+0twsWkgJuvLxF4w024/t7Kjzd77eaKEpgMl3rj/1NjPbpJ0EnZD0fOM?=
 =?us-ascii?Q?MHbP6iJ1zJq8ouf28QqIFM4KlAhI0TSn3+zxhT7kOd+ff+ZZOheMSAW5JG+Q?=
 =?us-ascii?Q?dylshNAGkkCs4PM13+ctP+m7nMmCd3zO2Jc5VSwfZm/vDBhfkw9R9e7ZPhPh?=
 =?us-ascii?Q?PXzjpYYI+lf9to8vef2EpqYdhP8YQjtT54AsJhj2Wtam5MQFpH9KeOQ5o6jG?=
 =?us-ascii?Q?HP6NVj3mUF6nA3hoZQhg9IK+oIFCl5bmd9HfjuOFiFQu5oTowDE5G/NRf51A?=
 =?us-ascii?Q?FuImnuLnNw+IzTCa/dLPcV317cqKcWyjDyzQb0rQoAg8wXbbaNwdqgW9x66d?=
 =?us-ascii?Q?gkdjxfG+ertHcYIOtgKNmHllt/Wh3vrU3jPG6YmBW/KEz5OdBqQXySTjGqD6?=
 =?us-ascii?Q?/z80BecvZKnazqeot7oqij6hSE8XVSNYhsQzP86AegmoqbgLVbl4A5bWsctR?=
 =?us-ascii?Q?QrTLLugxFuVCurF6AdagPP2diKj0LRfMj3ztpvrF0fQ+LWCNsEE4pE3bYICv?=
 =?us-ascii?Q?5/eJvdEyhrB+S6gUFRmwPSTFQoZPzv+O0Ox0nTp6haPuQCOHJXAu1DRLy1X5?=
 =?us-ascii?Q?w7bywV0kSNtumUqAuVKaau0pWkC/62pC/O/iVKmj51+M6BkIkXLqAVLTWBh9?=
 =?us-ascii?Q?jvH4FfoKHbPJfeVhEtuerNq0zj/4NfxR7w+oyCaSxRLp4mSiQveQ6yNIbanS?=
 =?us-ascii?Q?M8/oYwzW4fj/erjNsBKK3Yw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf4e859-101f-4da2-b44b-08db05621711
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 21:11:45.6277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/H0z7aIBPnx0fU6fBPL3ya9tyvN7777E81aohQjhLYnBazUnZpkbyrRH5bmJQ+iCcinJuibk3OyY91OfgSA1A1yfxXlLinusuGHB9Z9zSn9QTwCotvU0zqzGuIz/RBX
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
 target/arm/pauth_helper.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index a83956652f..6ebf6df75c 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -349,7 +349,7 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     if (test != 0 && test != -1) {
         if (cpu_isar_feature(aa64_pauth_epac, env_archcpu(env))) {
             pac = 0;
-        } else {
+        } else if (! cpu_isar_feature(aa64_pauth2, env_archcpu(env))) {
             /*
              * Note that our top_bit is one greater than the pseudocode's
              * version, hence "- 2" here.
@@ -362,6 +362,8 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
      * Preserve the determination between upper and lower at bit 55,
      * and insert pointer authentication code.
      */
+    if (cpu_isar_feature(aa64_pauth2, env_archcpu(env)))
+        pac ^= ptr;
     if (param.tbi) {
         ptr &= ~MAKE_64BIT_MASK(bot_bit, 55 - bot_bit + 1);
         pac &= MAKE_64BIT_MASK(bot_bit, 54 - bot_bit + 1);
@@ -389,23 +391,30 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
     ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
     int bot_bit, top_bit;
-    uint64_t pac, orig_ptr, test;
+    uint64_t pac, orig_ptr, test, result;
 
     orig_ptr = pauth_original_ptr(ptr, param);
     pac = pauth_computepac(env, orig_ptr, modifier, *key);
     bot_bit = 64 - param.tsz;
     top_bit = 64 - 8 * param.tbi;
 
-    test = (pac ^ ptr) & ~MAKE_64BIT_MASK(55, 1);
-    if (unlikely(extract64(test, bot_bit, top_bit - bot_bit))) {
-        int error_code = (keynumber << 1) | (keynumber ^ 1);
-        if (param.tbi) {
-            return deposit64(orig_ptr, 53, 2, error_code);
-        } else {
-            return deposit64(orig_ptr, 61, 2, error_code);
+    if (cpu_isar_feature(aa64_pauth2, env_archcpu(env))) {
+        uint64_t xor_mask = MAKE_64BIT_MASK(bot_bit, top_bit - bot_bit + 1) &
+            ~MAKE_64BIT_MASK(55, 1);
+        result = ((ptr ^ pac) & xor_mask) | (ptr & ~xor_mask);
+    } else {
+        test = (pac ^ ptr) & ~MAKE_64BIT_MASK(55, 1);
+        if (unlikely(extract64(test, bot_bit, top_bit - bot_bit))) {
+            int error_code = (keynumber << 1) | (keynumber ^ 1);
+            if (param.tbi) {
+                return deposit64(orig_ptr, 53, 2, error_code);
+            } else {
+                return deposit64(orig_ptr, 61, 2, error_code);
+            }
         }
+        result = orig_ptr;
     }
-    return orig_ptr;
+    return result;
 }
 
 static uint64_t pauth_strip(CPUARMState *env, uint64_t ptr, bool data)
-- 
2.25.1


