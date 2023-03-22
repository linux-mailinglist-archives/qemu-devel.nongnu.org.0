Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CAC6C578C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 21:28:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf52L-0001cU-Ic; Wed, 22 Mar 2023 16:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pf52J-0001c6-CS; Wed, 22 Mar 2023 16:26:19 -0400
Received: from mail-bn7nam10on20707.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::707]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pf52H-0004xk-Or; Wed, 22 Mar 2023 16:26:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAoO976hiQnI9lRhlm9rYdbD9PE5n/LiJuPfmfHSiccwS1x29jRksfK3900w5JHAM97oBk4dgi5TpcKkc21ImEeP2f+ne8mcdVmEdFFGWdxNrwaa3VsTe5HuMgybBxVg/T40ba/iFD1cGj0jPUdSKhiC0ZCpq/9hYw3rpRevFOwHNIA5NVoOHrvmIIpf5T5CheQrWxqXZ9N3lx5Uz31lGKrZ9Fdv6WTE/0SZg/kl5MwyQRtw6f0Ij82WzCj761ncLtrhAfe1aCApgKGJg5kQHEaJj9u0vcAVN24xYlKgvELBq4NZI7L13SJ6fKBeuN+zrh4Q+kDQC5wsBhfAr3rwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KpQDBbV4ZoaZNGpwMYw5mYnydjnhod82UGpd8bY4XU=;
 b=iYaYkainbuJuce+iBE8GdY0o9hoMXQkEvylJrcazb8Bmrt6ul4xN9L7qQDv9i/R9IJ9KKQCtTXWy9nMBEYOF5Y1K1w/JVs/Rh3iK/Ji/FtpeqPZKm3sdqDCGkYguIlPO4FAX8RPHI3qFQPqef6b8xiOQulHsXhUOwraKkE+X4k/WBMRfrl9AXM67dQh49h6Rq3QvTSdToyvCZ6dTzc26dA0IjNUoEuaMC37sDjBfhRZgEAuxD8ZonQBCK5YN++tMbVUACjd4tCdasegxk1TSi4BB6GHyqPeXfp8VspYf1+hUQRxxeRrcsgMeQGi4e8VgjpXkGMBzZExK+L1M+4HFCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KpQDBbV4ZoaZNGpwMYw5mYnydjnhod82UGpd8bY4XU=;
 b=cyw7LkHUMhd+qh6NJQjGSheEXJ96Qh0hKvnkytYrxL/Vv9pblqivDXcmIICBSLwwFPqxjgKiohLz6/G0nQNBbdv3cdmwtYP3xmH+EG53UD/uMU9wE5zwiRU6UqiNRcqQGSzUONHXXCSNSu19N/dCWncNdATmYVny8whG782fKBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SA1PR01MB7342.prod.exchangelabs.com (2603:10b6:806:1f5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.8; Wed, 22 Mar 2023 20:26:14 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c%8]) with mapi id 15.20.6222.010; Wed, 22 Mar 2023
 20:26:14 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v3 3/8] target/arm: Implement v8.3 QARMA3 PAC cipher
Date: Wed, 22 Mar 2023 16:25:36 -0400
Message-Id: <20230322202541.1404058-4-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230322202541.1404058-1-aaron@os.amperecomputing.com>
References: <20230322202541.1404058-1-aaron@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:610:59::18) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|SA1PR01MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eff3615-ecc9-4f33-4dd6-08db2b13aeed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EXjbuQRu06oXUCgeUHyxj2O+QQtmstBj8KzBVGVvUAnkWqWw9XMxOLhL3HkI3tFbQ5+Me9jtlW22w6gshG/b/93r7I0sFrxoSiEBQITLVfYz7xqUP2stt7cdBiU+gqrzkh9TiOoLgOUtbSARYIONiPEVirxdm5SMwn2AzrdhFVgWHm1iAcmZVcrJCRJ0Py5HDcsmMIgLdyhFM18qm5w1cIgaWInbNCpF1cnQwTJw7axvCqI7lCVF1NOp0zXTUQxQ9TIpIYb6dv0FySUO0WsWbRTXiI96pshkmU0X8BgWpHwMA/ri7AssmxT4J2nOkNSBn2RWylMYnc6tqWrVMNcGqSVlaBxOq6rBMyfv7PYR6wrsHJakPqWIhTqj+Fg36JR1T+pvh98q0OWudmU9srYVNbwP/BFQCOFxmUnxPNxgGoNTCA/4m0nJaJhS8ohBwbNumy0uiGz6/YUBCU73csRZTj5Iq0f0dyPpVKWiC+fEWz0P4jhIstPE60c6eO10lEIsahsVzSMDjmabPKDF9ySSfvxsF6pFExHy/Z8IV9c8VKOjgZO6oxklh23YJpIPJgcdwv4nkwtOL/JRCsuIm2RQniXRLA+HphXiMEPh2bnoB5JNxo06coRwfIT38p6yL1JCNk8yMMGrqZtnVWBg0F27uF+rA+zFJKjchGSjvnD9+1gVaUvcKU+iIaNcV8mrekha5wVmZMrPCd9fsvMBd0BQFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(366004)(396003)(376002)(39850400004)(451199018)(83380400001)(38350700002)(6486002)(186003)(6506007)(86362001)(26005)(6512007)(2616005)(1076003)(38100700002)(6666004)(107886003)(5660300002)(4326008)(52116002)(66476007)(41300700001)(110136005)(66946007)(478600001)(8936002)(2906002)(8676002)(316002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SxYa/DCdzT8XkQhWBEKRdbItpbiPL7VTROY0vTWATLJ+LJCNGSOfvk6SO+2Y?=
 =?us-ascii?Q?g1zETb/17juzhi5VuiiCAgLktgj6B7Il85c80hUG0TtRfdDBt+ZtLLYLIln4?=
 =?us-ascii?Q?jSc510jv9p5iRjs0+Efrq/mg5OdcqK7HtdoB8r7uurABB4+wwGbhdO9yp7fn?=
 =?us-ascii?Q?i7dl/tyUpyNkOt7+qgcMENBPICJcCTvwFF2gZ3clQhhHIl2/bDAWjmTmKGjI?=
 =?us-ascii?Q?e57/ItaZUYbovnEg6caeDZ7rJgETVv+A1eafABB86qW5Rz3I5sRJsP/4Zv0t?=
 =?us-ascii?Q?VAvaqJCOdnPCW0CHqFhYltCng9A0rhaRrQcttAUnNV77nHGkRx9Xw4sD5Tbr?=
 =?us-ascii?Q?0q/tSQvQfk49LWi73teD/r+3J9kQxsPM7/7eMJg++sBJkHqcYnwI7ECaMWrq?=
 =?us-ascii?Q?Fz0vPkm+9/VpeQPpFQW6U8Uai/Wrr6vrM6qsX9DEo71cYvxOJHawClpsdzZl?=
 =?us-ascii?Q?jL2NeBmEUbZwus7Y9CASzzrlFF1lKzhqiZ3OKWe+iODJG2LFz8hHDqnX1HQs?=
 =?us-ascii?Q?hLY+svyoBaLHNHydh6f2U6xwrf3I7Xi8BpuNApzIwq0pJDDjG3LQGhwP95Wu?=
 =?us-ascii?Q?aPmwAr73SXa14PL4N0X3NsQ9cCpYEXSXRH4lCXrppmbEfq2aS1UmQ38omIhk?=
 =?us-ascii?Q?wT5VjL+jfbmIfnF6DWK1ZlDzGQ4cw7f4jKG4Qm8j5HCzpvQZ+jzjiD7XdDgJ?=
 =?us-ascii?Q?feMS04kyEGWi65FEg9Y+7eu+i4SkR3fLGaITLqPGoxHjQSNJYB92MtYEI6Hx?=
 =?us-ascii?Q?on0OA6IUEVOR7p1wweY2aPmRX44zIIRH0VvGwYl6T6Mc3XQv/zkSRG38kg/y?=
 =?us-ascii?Q?gpPan2nPfqtIqZb6rW6o/en3GSzOfgZ37MidzVhGFhWD+oMxfemDDIQmmg6h?=
 =?us-ascii?Q?tRMEeW4JDd4mWJZXxdcgWnK3bkflbF5xIgZSh9MwRmUwocX9qYxElMyfvx8x?=
 =?us-ascii?Q?gehYqxHnhPB0LG5mX+yXpOIH2RlM3wAPSVwCcSLJoT4b//KkiYAy8yO/fAQN?=
 =?us-ascii?Q?zhw7JZowDwR3WO3IamZXOHFXQW5K2WDpOk4kA00bCHs2DaxvvUAeRfB2vLc2?=
 =?us-ascii?Q?kJv86ox1TlJNWUdyrrStXFjFIZTnmedctM1oWvvsIiCAzcxdhjYgj2Y7vema?=
 =?us-ascii?Q?vbmsXZpqXNByc3yxV9mAXHpcqrQlXU85GHaWmOClsWnOCHQFmHExps1RWPQZ?=
 =?us-ascii?Q?WcphfahqI/rgEnhtQ7Y7eONihcwK53CQiwvQXAv5V1awyG21YBrDiq/Pu/8g?=
 =?us-ascii?Q?OT8X/3a5bHIsiaV9/qBndwvYEh1KM/ERq8gQmUSijKEIOSZgDfW6mz+jn158?=
 =?us-ascii?Q?NWfSQP+rjV7h0r5kEU5ly8k8pWQYRN/bFbEayvYKDEexdUN6eejsaLyXobsc?=
 =?us-ascii?Q?IV7IUY1V1eO+i8Q2x/nfyooIfL1fHbrNEaUwQkMBrK7yVUauqYL5I19SOROU?=
 =?us-ascii?Q?Ry6r9SIu5YPXmc5qpawfIMXD9H3+rkhjUz6VE8Ev3CrKq/e5l+YL+T32wEdh?=
 =?us-ascii?Q?uFK4yL/OthX1pZsyCgxFlF/zs9MyL8bvoTM8IVGUuH6EbCO4F30dXK/Cn0ul?=
 =?us-ascii?Q?25l1XoZMUIY5uQJ4VR7ywGiJRpZcxO+07BesSkk5ArIl8YELxNpSBHbt1bZ0?=
 =?us-ascii?Q?ld2G8oeWC+AaAUwWPN3FgsE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eff3615-ecc9-4f33-4dd6-08db2b13aeed
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 20:26:14.4559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YadIwk+3zjVLQEZ/jcIQYUYViDKHg3xTduzT6o9+Kdia3A4DONmFHQwMSR22XjSYuhiKeIkoNIcMQjR/Vv/Z9eyFWTInZjrlEyIU6+e1pFoEEgeW74YIOWmsODvVWM1J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB7342
Received-SPF: pass client-ip=2a01:111:f400:7e8a::707;
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/pauth_helper.c | 54 ++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index 6bb3b5b9e5..122c208de2 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
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
@@ -239,32 +255,48 @@ static uint64_t pauth_computepac_architected(uint64_t data, uint64_t modifier,
             workingval = pac_cell_shuffle(workingval);
             workingval = pac_mult(workingval);
         }
-        workingval = pac_sub(workingval);
+        if (isqarma3) {
+            workingval = pac_sub1(workingval);
+        } else {
+            workingval = pac_sub(workingval);
+        }
         runningmod = tweak_shuffle(runningmod);
     }
     roundkey = modk0 ^ runningmod;
     workingval ^= roundkey;
     workingval = pac_cell_shuffle(workingval);
     workingval = pac_mult(workingval);
-    workingval = pac_sub(workingval);
+    if (isqarma3) {
+        workingval = pac_sub1(workingval);
+    } else {
+        workingval = pac_sub(workingval);
+    }
     workingval = pac_cell_shuffle(workingval);
     workingval = pac_mult(workingval);
     workingval ^= key1;
     workingval = pac_cell_inv_shuffle(workingval);
-    workingval = pac_inv_sub(workingval);
+    if (isqarma3) {
+        workingval = pac_sub1(workingval);
+    } else {
+        workingval = pac_inv_sub(workingval);
+    }
     workingval = pac_mult(workingval);
     workingval = pac_cell_inv_shuffle(workingval);
     workingval ^= key0;
     workingval ^= runningmod;
-    for (i = 0; i <= 4; ++i) {
-        workingval = pac_inv_sub(workingval);
-        if (i < 4) {
+    for (i = 0; i <= iterations; ++i) {
+        if (isqarma3) {
+            workingval = pac_sub1(workingval);
+        } else {
+            workingval = pac_inv_sub(workingval);
+        }
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
@@ -283,7 +315,9 @@ static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
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


