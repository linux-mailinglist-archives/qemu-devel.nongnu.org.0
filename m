Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 914CF69FC53
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 20:37:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUuug-0007R5-1s; Wed, 22 Feb 2023 14:36:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pUuud-0007Q6-QW; Wed, 22 Feb 2023 14:36:23 -0500
Received: from mail-bn8nam04on20721.outbound.protection.outlook.com
 ([2a01:111:f400:7e8d::721]
 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pUuuc-0005XO-6c; Wed, 22 Feb 2023 14:36:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMW1dK6uDoqVpKvsvFpLCvkVku3vxiQWo3RzkBUnkbKlRGln5DLSbvYL/MJEx6xG9AACAFh1syTp6jtx0wOhATG1SDR7WCBra2HGAuxEOGuqFlXOCvHQJmJu17doTeBySB0MorOh16OYBlH+RwfLv/OHcDDbHTC93pHngec41Q1myDx6IXTWHn1skhN8qdKDUoXJ1Jtvuh2mtN9CbAYplZyR8Rm5kICOl+giZO3PJ6RTMIs7xsXLEkfXqNAQXV5sExrHcGar3JvzYRjogzXtHnwjE59uyZ0VR1LnZP+gSgH8SajXf+Q2X+x0+5aSsDGXJOvBYZXP16nIMAuDow92Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AI2C+02B7L9lyjRGa3KRtuInRWFeItdSqTpS87SbqS8=;
 b=AEFR6ru6iUleFBjkxE/HwInDnGOScA6sSIRJeDPi4H6hF4llJcm+rtzQ/mqJjogGyrAwJH2iH9UpUbMc5RFIZxOWDrR1iD+rqsFE6kYlV5u/PPyW+vo+VUyrs0OufVyteG5sMNsA+TRl6cE/TwPzqbGhQ7Xox/2bMhGpYrdJRg/D5Yh55qJ7WcKlDlml+dLnD4SV2ylrT3xPi08RPlimQrzM55w4UjqAdPxH7r/qtkqy3I5ZL48jdM8Zw5Dp6GGg0ZTPOZNbbOmOHl6Qq10qhnA2NaXGPFxiIaGs38e6eVang8g/5jYdcEnMvTKgLCiTcm5pYLkweWo7eTzWBEVFVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AI2C+02B7L9lyjRGa3KRtuInRWFeItdSqTpS87SbqS8=;
 b=Xhhm0V5iv49vdk7cOz3ng+6uPF1s/kNbE1bVZWp5tVg6Cn+neONugomCnK/7fHyy4Ww24+2VndsQOyW1l+wJ29EWHN593dthDdsAJ/Y6N1v1Tx13t/UpcxlWizrv0lycMKTmItouz+jQa6/mlKyfSEKD2Lt//EuFTnb64eExeYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SJ0PR01MB6448.prod.exchangelabs.com (2603:10b6:a03:29a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.20; Wed, 22 Feb 2023 19:36:09 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8%9]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 19:36:09 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v2 6/7] target/arm: Implement v8.3 FPAC and FPACCOMBINE
Date: Wed, 22 Feb 2023 14:35:43 -0500
Message-Id: <20230222193544.3392713-7-aaron@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9b4b548f-5035-42d0-1788-08db150c0c69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZwjOwBsCU7X8HWQe+tri/M8mOSuR7gu90LeLGlHxKEzPWmaWPGVrlEzhR9gLS+UA3vgTMtbwh0p3cAhNE1LVCJwoA8H7GZaYXrhZUTKZOAFlVl4ZLNdbaU+N+A2XG8gOYixO99VZdpPIJ9johH+XKRnklJlqzyqlUFGV+r6WU2p6Ai+ZSMhFxJDk9tAphB0oZ8wKzC067a/CQY4DtcTnbZvpHSaHAftqZwVOXF0VjsYIIxhogcl2zzfTfEAOipEa6TVUbIhOMMWbqvPNXN+Hved4+fDBhHbNNdhlkyEEiA0x5xvsJyNWKM2E5etBnuMuOFcaHennUM8AlPBASqbuAwooBP9zCeW6OqheEl7hGlJaJzu4hg/ufd/LJmm3Szm9bhhCLhTxJjf0hwvvgOxsZ2JFyjiN6Zi4wTBsz16u/KM8duRmGkTLzdQYbLouT0kgz0DiZj/urMEAJWopAhsM+ht8JeF/Pf1ZzaZwdYXz49frPnfndJfBTpJhfWK2QQL6s67f5gIKQfO14rgAQfP2Rz0bTH8n8Zc6nmgcRx6Ot95O6k9/lfnuJ1Kes2ETkmjPCTHsIXrqgssGHmq0uFOaEIuV90KHMFYjT/R6ExKIqM56jY9fzaV9CLTFzerJ7FdJ5FTOrejUdit+Bv6FzYIJ/FRdlKPCS1+IlJSoUatCV0zEPH4NADYeHk2tAf2EcskRpM4GLvco7MgMGdlJRqaVMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39850400004)(396003)(366004)(346002)(451199018)(8676002)(66556008)(66946007)(66476007)(5660300002)(316002)(4326008)(41300700001)(86362001)(107886003)(2616005)(83380400001)(26005)(38350700002)(6506007)(6486002)(186003)(6512007)(1076003)(6666004)(52116002)(110136005)(2906002)(38100700002)(478600001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3Brh0UFQVcOgMEZIXpn/D1jPE5VYauO9+Vdh6ll4f0D7cSUc3Ie1OEaQuFsV?=
 =?us-ascii?Q?W3LhfF1ROvatDoP2NyUrrDBPGWaiOMlxZNcnrL51nTXjl9ml2Ww9t2EloEpk?=
 =?us-ascii?Q?1sm7IYcyfMUYEquIGCFkXFWi6D/0tFcR7nsgSsEAfbIITI4c3uV5oCpoPTxR?=
 =?us-ascii?Q?1YIySBfEWXtZZQ5dSDnx4Dg04JTUSgBY1zQnsTX2ePw3vAOeJHd05SpFBvYF?=
 =?us-ascii?Q?6ASvc8QsHjW91sgkucn9eB1gAvQMx2Cy56bJ0y6HVgGQ/JC6waZT8VzNOLcI?=
 =?us-ascii?Q?kCLttqNAWgLyrtznS+TE94+YbmheJ+waGopRq9FoPnuntKrK1ZL6rNnxa3LK?=
 =?us-ascii?Q?KCZlUArxxH7Nts6Fj89KDbGpjwKncXLtAT5W/lQvauv3YyOf7rNvL1Fj4AXN?=
 =?us-ascii?Q?LjLMB4z7OVWxeTtKweV+hiRm/oAZNki0RCIf8p2BLv7F9/2U1QsdN7GM3By7?=
 =?us-ascii?Q?oglcA74d3W+odCvjlczawwihI5WaN6ojD+F8seQnaEmSwmY3dgFinuGALbmL?=
 =?us-ascii?Q?gaN7b+I0ZJi2GGlSM+tSqOkckcqdC5BdCn2Y4ernXCM+Bwv0H2czlkzoQur/?=
 =?us-ascii?Q?fjUHLrfoywkOxpQdfMvXuPSEp2mv5nao8hklFNpEkWsb7YgJiAYHmzG3XVSc?=
 =?us-ascii?Q?kRvU6dOcuMn/b2O7cbYoZEEjnM0XjUtLJoTcA61VmZuGuYQo9nH7gk+ScNxb?=
 =?us-ascii?Q?ShI5qhGiDELnMchVnkRpF4sDaBq/uNVlYEt/erdXGOfnNYPM0D+YqDtN/Not?=
 =?us-ascii?Q?xiLmcLiiASMr5Jo80zzF5+qbFoXkOTG9FldAzluUnKagU0u8IeV3EV0V2jg3?=
 =?us-ascii?Q?i/zf4YWrFbgmwegf2KHxPbbvVnfvfVUKAeP+xIGd0bP3sF7G2Dgg0Scd+l/Z?=
 =?us-ascii?Q?nFwfJPU1+MhntjC3tFts+bm65c9qH1i+fP5yqglbWyCIR5ahCmho+TuMD7Qr?=
 =?us-ascii?Q?Tfk/2+75Kto3tR2KOd4GByUPk8xLyZI5uw1o8OK/WCJXj0iA7aiXKiCSjpDR?=
 =?us-ascii?Q?h3JNcDAm3f2ioit8F7n9pmpIywkHE1g4NV/yw8rUQYPvRShWaVGzVgwC1w5y?=
 =?us-ascii?Q?y5sqDCBUKYpgkRwOpH/pZgCZkfILbtSh1vrZXiozTeFwbWJawLuNIiPvFv7b?=
 =?us-ascii?Q?DbUojX9PtL/HU/4KcqSGbHG7LHsTieXdIw0cLkLRAkY94BEUBZcZgg1aokBK?=
 =?us-ascii?Q?C9K7A1+hfTQ4ZwMStnEAT6TrFETpFFRtsyLjLmm6irk/NkEy3ORSUeoQYXNg?=
 =?us-ascii?Q?w8apnR2kcM88quAblyHFnQO7oY+4uIQp09pFGixg21FHTFpHoFUG2HAJ6iUk?=
 =?us-ascii?Q?VVGyrvPlzlgK7FhlClPvFCPL+/ZqQ9Sf/q4TwR9DjCOaV328eZEnIfMCYHPW?=
 =?us-ascii?Q?4TKylNpNjvAM8BqsGS2IYLarkKGDw9FDkZgMCHbPhst2NfaaO4aRlQIWkdlt?=
 =?us-ascii?Q?r8g70/dU6/XgrPA8LEUS4eBQaAzwIxcXr01rfBfbqaAtxf11+/S5YHpUZrwY?=
 =?us-ascii?Q?GIcIt1QguztF6Bwc5Y7arcjoedrLnsnCqHyJWplWi7YkT0SclVld6CiQsXzB?=
 =?us-ascii?Q?QzZoEiRTOXuw7bpcAfZjVVCHflDuEvxysljljlSwie4QOWY+en9WpboN64kh?=
 =?us-ascii?Q?RXf9Vw4cmQIsza7iFRRV1tk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4b548f-5035-42d0-1788-08db150c0c69
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 19:36:09.6780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j82LnVcuJtNjNf2QxWsjFY/OIAkTJzbCY/jJDfzhGXgqhQY1mw7RL454xB5QR4WLrmoby3QiWagP2qYo2lOPAQS4BSXWNxgGIH5/3aSfCoyrkX1vlG8fDJN71MQZXvh3
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
---
 target/arm/pauth_helper.c | 35 ++++++++++++++++++++++++++++++-----
 target/arm/syndrome.h     |  7 +++++++
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index 96770d7860..db6cf9b5bc 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -388,9 +388,24 @@ static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
     return deposit64(ptr, bot_pac_bit, top_pac_bit - bot_pac_bit, extfield);
 }
 
+static G_NORETURN
+void pauth_fail_exception(CPUARMState *env, bool data, int keynumber, uintptr_t ra)
+{
+    int target_el = arm_current_el(env);
+    if (target_el == 0) {
+        uint64_t hcr = arm_hcr_el2_eff(env);
+        if (arm_is_el2_enabled(env) && (hcr & HCR_TGE))
+            target_el = 2;
+        else
+            target_el = 1;
+    }
+
+    raise_exception_ra(env, EXCP_UDEF, syn_pacfail(data, keynumber), target_el, ra);
+}
+
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                            ARMPACKey *key, bool data, int keynumber,
-                           bool is_combined)
+                           uintptr_t ra, bool is_combined)
 {
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
     ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
@@ -406,6 +421,16 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
         uint64_t xor_mask = MAKE_64BIT_MASK(bot_bit, top_bit - bot_bit + 1) &
             ~MAKE_64BIT_MASK(55, 1);
         result = ((ptr ^ pac) & xor_mask) | (ptr & ~xor_mask);
+        if (cpu_isar_feature(aa64_fpac_combine, env_archcpu(env)) ||
+                (cpu_isar_feature(aa64_fpac, env_archcpu(env)) &&
+                 !is_combined)) {
+            int fpac_top = param.tbi ? 55 : 64;
+            uint64_t fpac_mask = MAKE_64BIT_MASK(bot_bit, fpac_top - bot_bit);
+            test = (result ^ sextract64(result, 55, 1)) & fpac_mask;
+            if (unlikely(test)) {
+                pauth_fail_exception(env, data, keynumber, ra);
+            }
+        }
     } else {
         test = (pac ^ ptr) & ~MAKE_64BIT_MASK(55, 1);
         if (unlikely(extract64(test, bot_bit, top_bit - bot_bit))) {
@@ -519,7 +544,7 @@ static uint64_t pauth_autia(CPUARMState *env, uint64_t x, uint64_t y,
         return x;
     }
     pauth_check_trap(env, el, ra);
-    return pauth_auth(env, x, y, &env->keys.apia, false, 0, is_combined);
+    return pauth_auth(env, x, y, &env->keys.apia, false, 0, ra, is_combined);
 }
 
 uint64_t HELPER(autia)(CPUARMState *env, uint64_t x, uint64_t y)
@@ -540,7 +565,7 @@ static uint64_t pauth_autib(CPUARMState *env, uint64_t x, uint64_t y,
         return x;
     }
     pauth_check_trap(env, el, ra);
-    return pauth_auth(env, x, y, &env->keys.apib, false, 1, is_combined);
+    return pauth_auth(env, x, y, &env->keys.apib, false, 1, ra, is_combined);
 }
 
 uint64_t HELPER(autib)(CPUARMState *env, uint64_t x, uint64_t y)
@@ -561,7 +586,7 @@ static uint64_t pauth_autda(CPUARMState *env, uint64_t x, uint64_t y,
         return x;
     }
     pauth_check_trap(env, el, ra);
-    return pauth_auth(env, x, y, &env->keys.apda, true, 0, is_combined);
+    return pauth_auth(env, x, y, &env->keys.apda, true, 0, ra, is_combined);
 }
 
 uint64_t HELPER(autda)(CPUARMState *env, uint64_t x, uint64_t y)
@@ -582,7 +607,7 @@ static uint64_t pauth_autdb(CPUARMState *env, uint64_t x, uint64_t y,
         return x;
     }
     pauth_check_trap(env, el, ra);
-    return pauth_auth(env, x, y, &env->keys.apdb, true, 1, is_combined);
+    return pauth_auth(env, x, y, &env->keys.apdb, true, 1, ra, is_combined);
 }
 
 uint64_t HELPER(autdb)(CPUARMState *env, uint64_t x, uint64_t y)
diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 73df5e3793..99ed4c7d3d 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -48,6 +48,7 @@ enum arm_exception_class {
     EC_AA64_SMC               = 0x17,
     EC_SYSTEMREGISTERTRAP     = 0x18,
     EC_SVEACCESSTRAP          = 0x19,
+    EC_PACFAIL                = 0x1c,
     EC_SMETRAP                = 0x1d,
     EC_INSNABORT              = 0x20,
     EC_INSNABORT_SAME_EL      = 0x21,
@@ -221,6 +222,12 @@ static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
         | (is_16bit ? 0 : ARM_EL_IL) | etype;
 }
 
+static inline uint32_t syn_pacfail(bool data, int keynumber)
+{
+    int error_code = ((data ? 1 : 0) << 1) | (keynumber);
+    return (EC_PACFAIL << ARM_EL_EC_SHIFT) | ARM_EL_IL | error_code;
+}
+
 static inline uint32_t syn_pactrap(void)
 {
     return EC_PACTRAP << ARM_EL_EC_SHIFT;
-- 
2.25.1


