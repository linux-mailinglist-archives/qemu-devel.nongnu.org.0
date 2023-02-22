Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5E769FC50
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 20:37:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUuuY-0007KV-SA; Wed, 22 Feb 2023 14:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pUuuW-0007JF-MA; Wed, 22 Feb 2023 14:36:16 -0500
Received: from mail-dm6nam11on2071e.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::71e]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pUuuU-0005XN-Q8; Wed, 22 Feb 2023 14:36:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjGM/8mrXuhjdvxQ1v2nWnTswJsHVhEx4hsEGNSv0KIL3uVKTxWdE6RVq+zXiRJfcCBkDJ26PZ1nX2oAfoN9Uc+9Kf4Ho5gVBe83BJK7SbqKQTxIguE3+3GZ1xxoklvlmK1GtKoJbMw+vFDOAmShnEnj8YsU4N/2S6pFgzclTF0Jmfdn1R8gs/TLymwiP5IukAV5l2G+do/eyNIhSPK+aUeeE5P1bL6vbTdtA79WHKukUVCTVPHynEsGI0DIxq3nANSvRlM8NRo/VFo3b5f1S2r/Kh8GalHj+BdXOrNl96jaBdlTCLP7rRlExn9Rhxx/ipHCN2jDaS8oz95VoKu5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pjmb5fEjzlI6lM4BE4tVMiXhgYmDukyGzS79tyk9r4k=;
 b=jv6+ik2FQSZ7+lz03yHy4ACzdrTtWZUZWEFRTRTrnZDTgtrXZHv1bQETRfVyic3mQ15kkKuEhGpjQ0qkf707ABYbFkkkhoq6hWUn47QvRPCjeNWVwPsjkAwjHxzEnOh9SybsFTy4kRUT1QxTNcY3+O1YYmR8Kn+HuJISRTZk9+x5TnIGYKhUbbz8UJ+mib1xIWvUaciTIIMW42wqxFJB3YFGL2rbi1Vq7Tbd1k+Bfv3X+zYPjBIzQLrilrjluexeNxkl+AJp0dPnzqeUzkh5FV/foRsbn8Vm3ilRIjJOfAfpeN88YG50N3wBzHgFehzevTMnXVzZ4rMFnF0bKILvIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pjmb5fEjzlI6lM4BE4tVMiXhgYmDukyGzS79tyk9r4k=;
 b=n5lwrHCbZqf/5vDghZCb0yUR2kvXlgYcscQydgk3p1sLruCKN+JivWs5ZUH+jl692oiQoaPEta3wHKEJ+w8076QJjEWqEBzzX8mRzBbFn6mBlPtCLptJP4Ep2+Mea3Bte+706aA6Cp9FGIsVrR94lcLtiURplBWevQg/QQBF8N4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 DM6PR01MB3849.prod.exchangelabs.com (2603:10b6:5:91::26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
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
Subject: [PATCH v2 5/7] targer/arm: Inform helpers whether a PAC instruction
 is 'combined'
Date: Wed, 22 Feb 2023 14:35:42 -0500
Message-Id: <20230222193544.3392713-6-aaron@os.amperecomputing.com>
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
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|DM6PR01MB3849:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e635e40-d600-4280-9756-08db150c0c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r5FywRgJKJXCDqma0EelD8OWzoWNNKLxGkgyQ8T4jHcpjRBXvy8MaZ0bD4JIT4+ygslUT24YiooRwlE+W8JGuQUhyQL3FYQrvYOnUknBxe+iCrkIFB08NJ5PlCK4Md+RMI0o6S5UDCAzKFR5XjYRUabHaUYnoPKJbMg+1xQ/9nqXXX5eBCNtJUQ74YO0G0Eugfhg36HooklVC5dut4kw5hQT1jlClsX6GeWsnS8KqQJAo+X5kZH0+q7TvJ1iLiW68FImXW6PAhcmLyucFQ7d7Dm5PqiRrDIDHispFiLpyPdMes/YbNzqGFffkYoA4LlxieP28uWO1Ig3ViD9fqlEd1GJZ+hplM35P5lMRTv0sTSNZHFBGOVA3qDjT8toMbzm25x28aNFWLcwpkOpib5o5Dn22NxNFUk00AfqKs6sec464UUnt5xgra5hb1IEvQwFD+aXa2ItOQ62b1ALl6APisdJDXHD609cPe47CPCPWMILmYQKPs/83CN2qRO+Yl6FE8Gvf3U9sCrWCdp4AoIoP57YuAj2Sb5FM9VkUB45kxkYWxNP5omg6VUbY6R94w+uornrdIQ0+BzseQeQmLnNscdYACS5pOwOX2pEEl6DLfMKZRcyRJXMF46n2BfQ6UOCXHgq5YuDX32kV1ypsGecm4u8Y8QYO15gXy12oi4Mk4Y3jXwFseVNuBH+f1aRiqYFIOohBwQgzZeMqD5R5ty1Wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(346002)(39850400004)(396003)(376002)(451199018)(478600001)(26005)(6486002)(1076003)(107886003)(6512007)(6666004)(6506007)(110136005)(41300700001)(86362001)(66946007)(4326008)(66556008)(66476007)(8676002)(38350700002)(52116002)(316002)(2616005)(8936002)(38100700002)(5660300002)(2906002)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gE0Kvz5xkJztOdtHAwDN/FkQrMZHbc39uuwHoapgWP9oON9hpNJhpoUigZNM?=
 =?us-ascii?Q?7pJrEaNQ5a093zwXK2rpRO8/oVYq3rDrCmjtwEds991BAM1AxcFcJprsFIXy?=
 =?us-ascii?Q?kvYWCdEAZGvLN+kybLT99inydv7PuUrwLDLyuWaP80A9sPEtNJNOcPkP+vDs?=
 =?us-ascii?Q?vF3nT61tjpdWs3Eh2+NINYYq70Smogkvm9TLBgcPNTzqGVkP2O9w1ZQV1kaA?=
 =?us-ascii?Q?rGYOGx+QgV5xCTrKt4ZgdDSh+w/dH6WK1OL96+e/rHYcVHa0V0y1Bmnk2tGh?=
 =?us-ascii?Q?S+rrmHkuiKMG+lp4u7HQSfg0EMkzIzkHsaG25PyM5suBRDqfbLx7fmeho5iF?=
 =?us-ascii?Q?vGoosznTOuhW7l7IRLQ6FdavUYcic+BWvTJE4GS5P7auMVACzrq9cWOj4HoG?=
 =?us-ascii?Q?/fUSTtF7nE0iaYBqYbexgn64jWG66giGUbEPnJYuUd8prcgPlqedQe7MYrqL?=
 =?us-ascii?Q?6Fu364oVvsROQ+14+ybx2B+xJSK0VsdGr/HN3mrYNSvuUFJ7nxWvi8r6B2xa?=
 =?us-ascii?Q?J5WreR43jICqAwaK/Z5degF/WEd+1v0GBOGhOfpnNBbAW9Pxz+MP19CXR2dQ?=
 =?us-ascii?Q?3EEmgxJU/T4vmSe63GDwkjiQ1deeHg7WgxyLHmwY5wXILuyD6ctvEsbELSD7?=
 =?us-ascii?Q?Ul2LPM3x9JQSiw/cbBQaopZX6cuJrbRiUABTT2IWZaSCV82KmMAKs8CXPFfp?=
 =?us-ascii?Q?PdHTIY3PY0t+5ExR8Grl03ZDpxDxQtE7vxLmL53Ax/TkTl+zX8tbOZ9CbDLk?=
 =?us-ascii?Q?BDh6rIiKIh8z/TjFb4zClepUF88II6M7nP6ehd37VECKtAC8RB8hUk6EoDSx?=
 =?us-ascii?Q?gKNOkoUgGQAMZGx7A5dkvso0XQBC6gRbwvhQ1pFKfAGpA0epaJ7O52kwFjA7?=
 =?us-ascii?Q?4WeqviJSWZ8ZxvIXnZ2V0hROQegOm1Gme9ggyjcomLgX9kck6rvnU0Pzeh0N?=
 =?us-ascii?Q?OsYnhwW7VqF+DZYllRnuxwlRJ4YBjcvBpvV/DEVUNLUoHzZlFHy8gHttoi+/?=
 =?us-ascii?Q?tT6HUipN2HfPQM4C1i1T8B95baeXiY6m7QMk92lOkbdz9aR8zIP82XVD1qi5?=
 =?us-ascii?Q?JX2lV4NlOV8okXlSur1COXbUvkqaiC9iMaT0TngR3W1KRI38NX0VwdP4UfhL?=
 =?us-ascii?Q?uzqLfnTbDZ8FY/dsSifMantmmZ7cdh+bKr6ExUQDTWzOoIIFwc/j+K2vWK/d?=
 =?us-ascii?Q?+POOJakG3jRbPQisKHHLPLxQBBhL8jhLGPcyzYNNEsGOHPXQ/DaelupJZk9C?=
 =?us-ascii?Q?c8VYMd95k5ODI1sAVPINORoP0EVZrmvyfNS6AAniwKWeBuMMlAySrLjli8c1?=
 =?us-ascii?Q?VoKNnx/f9uixyv++XM8O3VpTvVX2rZU6Y8G5sXPg1qONLcex7YDt2kGVM6cp?=
 =?us-ascii?Q?OqVIc4Y8oUBGeOlBN2YPpKwE55jYqf/g/Z5UFHjijXYPbCuAu79RxPHj0rKa?=
 =?us-ascii?Q?PtpjbhUH8ZIDq1WGjdpFWIALVDoypUHjSPRb6ILoPj/PzmW12yHlkyy2FQkk?=
 =?us-ascii?Q?pgoospnQDMZ2H8nCrG3e35Jtf0qpEJeM4Px99euNkU1WsQR9ij5uKRvCDKQ8?=
 =?us-ascii?Q?ALbQ2t1k9FCAZHMB8jEJoOK6ncoA+wVWChkB4yt1aTrozfg+Fj5YHDDZ1G99?=
 =?us-ascii?Q?8nkbMA0Ceg6L885VhjxpoDI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e635e40-d600-4280-9756-08db150c0c02
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 19:36:08.9906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWd7KykfnSaSv3mJocPZaZGf1di53l0+PHegvrfn03UhA2nI1LONiSzb3fIn5pwxO/dn9I9K+CjMuP8B40piP9i0IpOntYCCGB6Nvub2Is6P6MS9lCG/+aGg4CxnjDMs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3849
Received-SPF: pass client-ip=2a01:111:f400:7eaa::71e;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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

An instruction is a 'combined' Pointer Authentication instruction if it
does something in addition to PAC - for instance, branching to or
loading an address from the authenticated pointer. Knowing whether a PAC
operation is 'combined' is needed to implement the FPACCOMBINE feature
for ARMv8.3.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 target/arm/helper-a64.h    |  4 +++
 target/arm/pauth_helper.c  | 71 +++++++++++++++++++++++++++++++-------
 target/arm/translate-a64.c | 20 +++++------
 3 files changed, 72 insertions(+), 23 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 7b706571bb..829aaf4919 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -98,9 +98,13 @@ DEF_HELPER_FLAGS_3(pacda, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(pacdb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(pacga, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(autia, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(autia_combined, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(autib, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(autib_combined, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(autda, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(autda_combined, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(autdb, TCG_CALL_NO_WG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(autdb_combined, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index c4ee040da7..96770d7860 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -389,7 +389,8 @@ static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
 }
 
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
-                           ARMPACKey *key, bool data, int keynumber)
+                           ARMPACKey *key, bool data, int keynumber,
+                           bool is_combined)
 {
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
     ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
@@ -510,44 +511,88 @@ uint64_t HELPER(pacga)(CPUARMState *env, uint64_t x, uint64_t y)
     return pac & 0xffffffff00000000ull;
 }
 
-uint64_t HELPER(autia)(CPUARMState *env, uint64_t x, uint64_t y)
+static uint64_t pauth_autia(CPUARMState *env, uint64_t x, uint64_t y,
+                            uintptr_t ra, bool is_combined)
 {
     int el = arm_current_el(env);
     if (!pauth_key_enabled(env, el, SCTLR_EnIA)) {
         return x;
     }
-    pauth_check_trap(env, el, GETPC());
-    return pauth_auth(env, x, y, &env->keys.apia, false, 0);
+    pauth_check_trap(env, el, ra);
+    return pauth_auth(env, x, y, &env->keys.apia, false, 0, is_combined);
 }
 
-uint64_t HELPER(autib)(CPUARMState *env, uint64_t x, uint64_t y)
+uint64_t HELPER(autia)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autia(env, x, y, GETPC(), false);
+}
+
+uint64_t HELPER(autia_combined)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autia(env, x, y, GETPC(), true);
+}
+
+static uint64_t pauth_autib(CPUARMState *env, uint64_t x, uint64_t y,
+                            uintptr_t ra, bool is_combined)
 {
     int el = arm_current_el(env);
     if (!pauth_key_enabled(env, el, SCTLR_EnIB)) {
         return x;
     }
-    pauth_check_trap(env, el, GETPC());
-    return pauth_auth(env, x, y, &env->keys.apib, false, 1);
+    pauth_check_trap(env, el, ra);
+    return pauth_auth(env, x, y, &env->keys.apib, false, 1, is_combined);
 }
 
-uint64_t HELPER(autda)(CPUARMState *env, uint64_t x, uint64_t y)
+uint64_t HELPER(autib)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autib(env, x, y, GETPC(), false);
+}
+
+uint64_t HELPER(autib_combined)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autib(env, x, y, GETPC(), true);
+}
+
+static uint64_t pauth_autda(CPUARMState *env, uint64_t x, uint64_t y,
+                            uintptr_t ra, bool is_combined)
 {
     int el = arm_current_el(env);
     if (!pauth_key_enabled(env, el, SCTLR_EnDA)) {
         return x;
     }
-    pauth_check_trap(env, el, GETPC());
-    return pauth_auth(env, x, y, &env->keys.apda, true, 0);
+    pauth_check_trap(env, el, ra);
+    return pauth_auth(env, x, y, &env->keys.apda, true, 0, is_combined);
 }
 
-uint64_t HELPER(autdb)(CPUARMState *env, uint64_t x, uint64_t y)
+uint64_t HELPER(autda)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autda(env, x, y, GETPC(), false);
+}
+
+uint64_t HELPER(autda_combined)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autda(env, x, y, GETPC(), true);
+}
+
+static uint64_t pauth_autdb(CPUARMState *env, uint64_t x, uint64_t y,
+                            uintptr_t ra, bool is_combined)
 {
     int el = arm_current_el(env);
     if (!pauth_key_enabled(env, el, SCTLR_EnDB)) {
         return x;
     }
-    pauth_check_trap(env, el, GETPC());
-    return pauth_auth(env, x, y, &env->keys.apdb, true, 1);
+    pauth_check_trap(env, el, ra);
+    return pauth_auth(env, x, y, &env->keys.apdb, true, 1, is_combined);
+}
+
+uint64_t HELPER(autdb)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autdb(env, x, y, GETPC(), false);
+}
+
+uint64_t HELPER(autdb_combined)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autdb(env, x, y, GETPC(), true);
 }
 
 uint64_t HELPER(xpaci)(CPUARMState *env, uint64_t a)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 52b1b8a1f0..37cccfda8a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2318,9 +2318,9 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
             if (s->pauth_active) {
                 dst = new_tmp_a64(s);
                 if (op3 == 2) {
-                    gen_helper_autia(dst, cpu_env, cpu_reg(s, rn), modifier);
+                    gen_helper_autia_combined(dst, cpu_env, cpu_reg(s, rn), modifier);
                 } else {
-                    gen_helper_autib(dst, cpu_env, cpu_reg(s, rn), modifier);
+                    gen_helper_autib_combined(dst, cpu_env, cpu_reg(s, rn), modifier);
                 }
             } else {
                 dst = cpu_reg(s, rn);
@@ -2356,9 +2356,9 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
             dst = new_tmp_a64(s);
             modifier = cpu_reg_sp(s, op4);
             if (op3 == 2) {
-                gen_helper_autia(dst, cpu_env, cpu_reg(s, rn), modifier);
+                gen_helper_autia_combined(dst, cpu_env, cpu_reg(s, rn), modifier);
             } else {
-                gen_helper_autib(dst, cpu_env, cpu_reg(s, rn), modifier);
+                gen_helper_autib_combined(dst, cpu_env, cpu_reg(s, rn), modifier);
             }
         } else {
             dst = cpu_reg(s, rn);
@@ -2404,9 +2404,9 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
             if (s->pauth_active) {
                 modifier = cpu_X[31];
                 if (op3 == 2) {
-                    gen_helper_autia(dst, cpu_env, dst, modifier);
+                    gen_helper_autia_combined(dst, cpu_env, dst, modifier);
                 } else {
-                    gen_helper_autib(dst, cpu_env, dst, modifier);
+                    gen_helper_autib_combined(dst, cpu_env, dst, modifier);
                 }
             }
             break;
@@ -3583,11 +3583,11 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
 
     if (s->pauth_active) {
         if (use_key_a) {
-            gen_helper_autda(dirty_addr, cpu_env, dirty_addr,
-                             new_tmp_a64_zero(s));
+            gen_helper_autda_combined(dirty_addr, cpu_env, dirty_addr,
+                                      new_tmp_a64_zero(s));
         } else {
-            gen_helper_autdb(dirty_addr, cpu_env, dirty_addr,
-                             new_tmp_a64_zero(s));
+            gen_helper_autdb_combined(dirty_addr, cpu_env, dirty_addr,
+                                      new_tmp_a64_zero(s));
         }
     }
 
-- 
2.25.1


