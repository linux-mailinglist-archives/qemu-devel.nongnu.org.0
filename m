Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9C66C5783
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 21:27:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf52P-0001eW-OU; Wed, 22 Mar 2023 16:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pf52N-0001e9-LK; Wed, 22 Mar 2023 16:26:23 -0400
Received: from mail-bn7nam10on20707.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::707]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pf52L-0004xk-Su; Wed, 22 Mar 2023 16:26:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UV6YNmlVnSZTYQzAxpIZmcIxip1C/tv1qbIv6cQ3vJ0JwMmMySaAFSaybUVleNx7ygPTQe/goh69ioraXqS//LCSmTSVjIVmgi5d/RLdItW2S19MjCn7lVAirjb5TJpSPoBcD0C9FEtUq9CCV/+4HaAUGdQ9OYxnLTzvHPSHvhWseoEu83rezTF5OMrhMSK1lzag754v9Mg0F+xlu4qY7rhJr5AJfljQ+lkh2OY4dxqZg/WicDu3HSH1yiouTdSDLVNMzkWoi+eZZWi4tmmfYWTDoOa7+dtr8Caz5rJe/zXvXNEz9rPSi7XA4eE7waYetQKB4DMo12sI7g6la0VR5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+VGBZAF/st+ysD7A6pDdoonFVJM2RxzmwLO71SPFcg=;
 b=JZkvaxR2GJxMMxEd+T7WkWz4l0ZLOEAiG9Et+CmW44SILcZFYMZZrLhQwDakLCHx8P/fmDAnY4mw2BqmrXg8buU9xMmLtVOVfyfwQ2nwYwjQFgD3nF1KSWXxySl4IKXWttT2yKnk+rTHoMuEXxuBccvIQ9qWYCgnS+c3Z5i+vc9tdRxkNaLRGO3wazuBsGjo65mCIPzWn17CLG3M7f78cg74tN+XUlCk69vYsra76J/hu4e828juIve33ShjqorCzDVnzRcRsEnaWjvrNJ9F39rswtYOguudLTpB6UifUi0dcR9HB2eRBI7AIdghk/7hMrdyhvTzU5iN5lHDU97Ryg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+VGBZAF/st+ysD7A6pDdoonFVJM2RxzmwLO71SPFcg=;
 b=hbCMTMBOFPbOugDeah/a587q2NENcYmkBPepXHcay1Qyfo/2oH8tJaz+OrSPPmVcZnU0a8EmNAhTrGww0ygMrTeU5k0teKVHjuhlg3z5sUVIYsoaNWa+gDw3Ow7SN73vWm4ihrTX0NgBjMLC1Bo21whOr+c5sDrNAgY2oPr3QXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SA1PR01MB7342.prod.exchangelabs.com (2603:10b6:806:1f5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.8; Wed, 22 Mar 2023 20:26:18 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c%8]) with mapi id 15.20.6222.010; Wed, 22 Mar 2023
 20:26:18 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v3 5/8] target/arm: Implement v8.3 Pauth2
Date: Wed, 22 Mar 2023 16:25:38 -0400
Message-Id: <20230322202541.1404058-6-aaron@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: fe1eeee7-dd28-4942-4ad8-08db2b13b127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IW5BuifnD8dSu1WzJPYWhrli7MsybAEsNPHRGZ/QR70pAgQIKOfha2eq3u9Xy74Er8K3SWToALHon6AZDR62EIQbPVCHmT3/dv+k+dydk7ax5IJEPhUhw+45KAgD0Gr+guInnYx1CcOF1oU7MrNZfz0coD8JsPBT7vI3QkgRhB3BrYmiKLyNS7P5+ZeSMQreqBi01vzDrGRToK/7wKDb70VF1wQy0WFBSq93otzC+1KbcLEZToAO2y9Od+5r11KUnrJ5gH9jM+rShqXpRhwK3FN3FJrAxNnoqXVqSMzVDazhqkLofHoFecBFUrghLedq8zozSfp9QYKwVn0OEg5fyLrqk85dwP57IeceFcnB3kQOdnh+PJYbMGgsIHueQVuUTetwxd78uOxYJ0pnpXVIjDC3mdpshdTy2YlZzKAkS/hiYYCavZeynkDwfBd2/uTLmf+qYdelGs9XCINK0KPbrDKnMYLz/IKkWwqj4HPYlOb4hsJWzQeYEAcycW4C6WlftCgLJNh5U7rtS4gxRrgjrUXdf0hPZfQZotGGKZJflBBfTacSinvEsinN4f4SsJpmeRZF4aq8KKqztfEbzNwC9mmwQNWxgDRuOvj4h73rX4SPbjO6BRaXPg2SO4yVs/C7iJTiJBl7tCJRNVAHJLSKIQvB9OTUXv1V/2BLbwQqjbGlRDhcyPS2tYRi8wlQgvqze9eIbu/YNF4WOdSDBe8hKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(366004)(396003)(376002)(39850400004)(451199018)(83380400001)(38350700002)(6486002)(186003)(6506007)(86362001)(26005)(6512007)(2616005)(1076003)(38100700002)(6666004)(107886003)(5660300002)(4326008)(52116002)(66476007)(41300700001)(110136005)(66946007)(478600001)(8936002)(2906002)(8676002)(316002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wAVK6ztMuMJnJnsOyls2H8jSdTIl2onp2KPR9yuAm/eAIGIYI3BnOS+pPGlz?=
 =?us-ascii?Q?rQtTt2xtgviVi2r5yrR6efYfzZ2MoNPqqRa9VP+uxorewEcaRQwdjxKpS4mB?=
 =?us-ascii?Q?gNeZ2/zr7F8nfZD5g/ZT+nmkiM3L7y424V+kxoX4GH0D/aakky+z0aBJTVH1?=
 =?us-ascii?Q?QKnKnYkXkIzuEoHPJzIvV+PGxFopEqJMFxA+E80mx5kRsKH+RPMjbXusZjYr?=
 =?us-ascii?Q?d6xn6zH+1bL0wcEYYleOE87IQ0Vn5kimL5Zaa44/umplqUwCdPGa9gkcxy53?=
 =?us-ascii?Q?PxP1Rqne+iFsfWvF/WASrXcHdZHCkCcWvIcI9U28d3ZhT8XpCJM0+2+9HkTE?=
 =?us-ascii?Q?QlOCKhqq35qFqKSGyq/Uv2J73J/PJfm655zi1wgiBc3ZlC/t0T/OM/Z7if/5?=
 =?us-ascii?Q?LUM/LnaREYn3y+xuXUc3gOgE5w/5mIrJj97G0Kz0AFABy85HAOECJUvzXKb8?=
 =?us-ascii?Q?4NbzoUqpH3E5X+e5idij3BvPrJFpGyqEsaoTZA8fV1Vp8d5gYSkhpIgyk3Sp?=
 =?us-ascii?Q?MDumEUySg+ZhbDSX1BX8GvcV9nEN7PLgxAUbq0n95cYJfu8vHP+JYpG8ZlUH?=
 =?us-ascii?Q?MuufD7oWKeVqu8XWLiKhlXMuyOklesIjEThvex1iodPpqJlN1Jty++kBZV4F?=
 =?us-ascii?Q?jiHqoAvgX9eAEcGXEzjXPXivtQ6CqCB9qpxsT6j3eNxF4ya5l+aSGKFBn8Mr?=
 =?us-ascii?Q?4RkJN7OW1//w3ZCc4be6mLPVjieFyDdUDE5Ho9hpDaYEQDkOIp4dbfkaSJvv?=
 =?us-ascii?Q?q2T+ux5qaa9E3jLXAcESt9a7RcIV4GXU0GaOS1pbrjL/3XjOrmT4cfmDHPe0?=
 =?us-ascii?Q?HRxFrITqvvo267aBXlmshYfIuHibo+ebFQbuMUWEt2v6VH1xRaCMK4xE1Kna?=
 =?us-ascii?Q?AM1cQy6eIHi4ivia8IMkcER2aVTRu6Jl6XeZ6vLskA6DFgCfjw/u4yhY8EFm?=
 =?us-ascii?Q?iX/d7nHnLrcZyxej0revmMwJ/OmaiBnr1K936KssBtYOHh7mAHFx3IJPFnV5?=
 =?us-ascii?Q?FPybFxe/bqsaVM1ah4R6MEDfDEH0Y89IBZvjGgTv7OqLxjnbnkveuIKxWe5A?=
 =?us-ascii?Q?3Mg/3Uhrd7TC3JwH52y/J/yPyZIbNTG6ikg7Y6qpPS1EA1syG/HbNu+SNzZh?=
 =?us-ascii?Q?29psfpx/C00fhOq0/DmrqKz5twpCnMO8Tyt5AhOsqtv2nZxSDr9zEG3l8Kls?=
 =?us-ascii?Q?f25pjFciKaykzwXggCeNCcZFrb8TsTzb4ip4Y+kHU8kx5yqI6VSBV/NBGK2d?=
 =?us-ascii?Q?jC9/n5aXu1Xg7GwVz9IwiJhDfSeL5ph6b5pDJtyO0LlnN/498BDo2/MfbXi7?=
 =?us-ascii?Q?GcatkUq5MBVuqLkvJpVxNPb/EELhA6AEwn1Tw+ro978BuxPF0QEI4EuvJJFG?=
 =?us-ascii?Q?4RLHKwolLvtFJPYsaY5kq/aui8YA9Gxfmudp6q67n7gYOEsttLLbF2dKIwZm?=
 =?us-ascii?Q?J7GfNmpxEACnWIFAUmpFo1dpnqvJOiQfBeebScaaU3utBeqjxmX42fbtARES?=
 =?us-ascii?Q?t2h587o4lgnL48bT+nL8QE7mc9pxpWwwtMlq6m4CX4Jv3l3f4sNk5vyWjB2U?=
 =?us-ascii?Q?xJaTzbwWceY7Pxa7LWSJ/hvmHK7lMSSemlN58LQ2r3jmY93zCnn9UT8hgydI?=
 =?us-ascii?Q?gHC0FA7l2JbSd+ZeM6tZqoc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1eeee7-dd28-4942-4ad8-08db2b13b127
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 20:26:18.1253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKwAykNz216kzicW40a882szWyLoDRsmcNoJAidGClP+6xoHQc6wAzDrvw7ABhXB4zGepipLYfhHvr9nPO8CTgqxQUlDyfufmnEnNJ1hC7Uc/CcX/sXhvSLdDWojXMvG
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
 target/arm/tcg/pauth_helper.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index 7682f139ef..1148a21ce6 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -352,7 +352,9 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
      */
     test = sextract64(ptr, bot_bit, top_bit - bot_bit);
     if (test != 0 && test != -1) {
-        if (cpu_isar_feature(aa64_pauth_epac, cpu)) {
+        if (cpu_isar_feature(aa64_pauth2, cpu)) {
+            /* No action required */
+        } else if (cpu_isar_feature(aa64_pauth_epac, cpu)) {
             pac = 0;
         } else {
             /*
@@ -367,6 +369,9 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
      * Preserve the determination between upper and lower at bit 55,
      * and insert pointer authentication code.
      */
+    if (cpu_isar_feature(aa64_pauth2, cpu)) {
+        pac ^= ptr;
+    }
     if (param.tbi) {
         ptr &= ~MAKE_64BIT_MASK(bot_bit, 55 - bot_bit + 1);
         pac &= MAKE_64BIT_MASK(bot_bit, 54 - bot_bit + 1);
@@ -409,26 +414,34 @@ uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data)
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                            ARMPACKey *key, bool data, int keynumber)
 {
+    ARMCPU *cpu = env_archcpu(env);
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
+    if (cpu_isar_feature(aa64_pauth2, cpu)) {
+        uint64_t xor_mask = MAKE_64BIT_MASK(bot_bit, top_bit - bot_bit + 1) &
+            ~MAKE_64BIT_MASK(55, 1);
+        result = ptr ^ (pac & xor_mask);
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


