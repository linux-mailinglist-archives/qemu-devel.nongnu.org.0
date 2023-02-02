Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09B36888D0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 22:13:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNgsH-0008MK-SX; Thu, 02 Feb 2023 16:12:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pNgsE-0008Lw-Nz; Thu, 02 Feb 2023 16:12:02 -0500
Received: from mail-bn7nam10on2072b.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::72b]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pNgsC-00089d-Js; Thu, 02 Feb 2023 16:12:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcWiJnLfnH/zRjxFGMW1Nk8D2N3FUyF5S0v9K4eQj5vjWmyYAQ50S/joegtNKNtlk+G7ACW4BmrZ/N+Y+h0bNsD9Yi4c8ItMctRG1uoooGrsm9QlE9mn0hHfQDCyso0xJLNjbEiyQMMyhUOooXBbeTXXoU6FysBfDJx4nj/nw88pMiCawghY9uskVRbFI2PWCMSTbM6E4uLYfBEmQGiCABU3ZAplFeUunFrxbG7Tf1f/mJeP5tbowHUP2vo4pMqTn2Qb3WWCbxlxsrCIfyGudz6GQfKMiQICYa8UICs/WOaqZ+ts6GOsgNoNETiKJ9H4B1XQc8IjOvmF4pNjMkxV/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6B86tQD3qVQQPFg/8XUpVsvrGJOptPopLAp9dyUwUHc=;
 b=Tnv5U2DcEwFxlGNEEuO/CtBovCoBes53SHSiDD/CzkW2ry0gQmxRVOr2+u71l7RxfqOGmccRnQliaKNYgfg4HRRQJQL2a6j+rZ625EQtA4LnsbQtdPbNEt8TF/JnAH+GXiyq3GAAAf9epGVXYbcF9L53EF0wkUEf/kLRvznlpQqPOClTuTOJHUTESu8EVYrjj+OO9VgC4bTomCNWzHd5lcS/+rp3CCX/V18DlwWLe8sP+y/HAJPwABlDQ/iSyCQqjW08rFBrA6yaCa0TLgSpqXky5X+y+/gufJOXl8s/0J5hCwoKcSc8cy8GIut+bbq8iUVNMl1i6y4Ql/ZTM3I5Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6B86tQD3qVQQPFg/8XUpVsvrGJOptPopLAp9dyUwUHc=;
 b=gUGSCsBhbcQMYmQzEaumM6cEUobBsTHbtXLNQIKixFxv4M/rNGG/vOnQka/vY2B0YCYh67s+wXge5YbyBgboiN+5bTrXfP/bTcf/eVrrTvE1h0vCsJwaSymDaqqIF/0JHYxBRBV8YDSe9Yo0xawp8hSyJuCwQxMIv4QLM39w87A=
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
Subject: [PATCH 5/7] targer/arm: Inform helpers whether a PAC instruction is
 'combined'
Date: Thu,  2 Feb 2023 16:11:27 -0500
Message-Id: <20230202211129.984060-6-aaron@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4e577bf7-cee5-47d2-84d6-08db05621767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QiktIAZR2rrgPATbWnB7UAetruOsIoIwmz6mmMT+LmGa2TKggjpLqWqfXTkapfgiEGzSKH+Rqy1zkCWs7o9fG3no3DZ9RmFw54Y2C7Pb0iU79AdFbRi42OD3qBLyoSJwxZRCAT5eN9BBU8537N4AR1UKBCLXKuNb8MD/pgtyHpBM3QoBHmkZQyb05KCRfG2bYZGgFUFxOWUpVxpI0UfZdOXviECFl4PCeSOdHjgUSAE9ce9qqU5Ij+eC9x++3okl5KzdXrj7y6QdO2/q76uZlZBm/U9Q++33o480stSvfm7CZTUmgis1i/aE6ugk0LRUSUSgFnpnssPKTy/cMu49mGZDsbNuju3SqKC9dp4zhp2EH6Y2eptwABmCWlSJr690IA2AKgUGpFgHfWDczloP6ks0mG6ETu/b/88wjFEIdHj3CK5uN2OmncDqrWfNi/MCUPkiNO07VM1hzSPXYMYASfarFexZViuUnAJgHkPFce4Pk0JsBuYjdn8ASyNZ6mvdRF1Z+YCjmPj/NrcxCONgQ/xjj/2MC//0GdH8qz8W2ezn+/lWWWaLWOXzPdvQKAKCY4QOnW5PppWQip94u0F02/aQcpVDACmrF6xwi1dfZ+jipZEEo60bKmCOTDngtA98/ZDdAJ7htT9r17HttLZnlbxXP3cb4rwqfNBbyewCuaXgSZYvYmMyrlYbUVDPhW5odLbyd0PlDV1XamP3ffpXZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(39850400004)(396003)(136003)(376002)(451199018)(186003)(4326008)(6512007)(26005)(1076003)(107886003)(6506007)(41300700001)(8936002)(5660300002)(110136005)(6666004)(316002)(52116002)(66946007)(86362001)(38100700002)(83380400001)(38350700002)(2616005)(2906002)(8676002)(66556008)(66476007)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A/hWqnjo1GZfT/JcnjFxjDyCvkU5lbrX4wQgL3GnAw1t7J9s7Mueg13xCHck?=
 =?us-ascii?Q?IhoAw7SfKO0d55SFnpCDKXNhRl/5Dk1K8p1bFfCo4YJ83fzR/xOMqE5FMVTn?=
 =?us-ascii?Q?rU6w+ozxVTie+AGLEbevJrYv4YHjwAK3kEpclRZOCX23hssmF1Soxzqdjw4v?=
 =?us-ascii?Q?wCoXZA0d9kb57PZC/rWMG+4qM+pK52o0QfD8Ql02jPJVAlOu5leHAjjeLuFi?=
 =?us-ascii?Q?LAAtCcBJ2ikvLC9PqOt/553upaufPHsvlgWmvNtjRZfooU4H9uwPmetDnyDV?=
 =?us-ascii?Q?sBiyX3CL9VZRrOYtTcZuOU4CbfLpThq2Mc/OWn+0WiqT6HNiK4BxuhlWhKGd?=
 =?us-ascii?Q?dBTauw0YRlmau5hGIcPg4uiZgn7hcmg4Z9kUeNNBLVYWHrztNu5wMSE97Jwt?=
 =?us-ascii?Q?H3QPteYJuU8KBYhOiHhr/6yDvnF5wTii4PkkeerpU3kA+QICoa47o+9os3DX?=
 =?us-ascii?Q?0ruxMSmR9KLngoN7FpInFTwkh0+FXrG/MxoLx5DL2stTWshLa3fudapQPJWs?=
 =?us-ascii?Q?ahsOYv9cMGpsGJS6WK2boKZiL4JvetUiicta39uOtvhINfx3H+IBz/yUlz3o?=
 =?us-ascii?Q?M4poZT0rQLgIA9hh3DjEqjLbw+hhKYotiMIzm/jcjcjJ6F819+fMW81/vzmO?=
 =?us-ascii?Q?P2fE0KZWsttg0Zr8E019N4zcDf+vcgMnun/fD8qVYpAZ0kGxazNLMcGjOik5?=
 =?us-ascii?Q?eM6WqeSCOoNX7eTJ7WMBrDD68NQ0wl3ML2oCeSJ1dVGbzGgRe9ILryQzMDxv?=
 =?us-ascii?Q?d/xyh9HA+ktTzadJpfXCdaKioS6PJ7OiQ7HC1/UdNc2W02cJDr71OJwzr3Ju?=
 =?us-ascii?Q?LghozIrsJ6LcI0XhMTdY2HDgQZ/7Q8L1l3xgWMnipOysjNWsjgFdCdId6qyB?=
 =?us-ascii?Q?bmHj4r/SekqiNl9UHLaegXFryF0zlCqDIbZZeC9efNHWsKThgXSeq4WA+/fc?=
 =?us-ascii?Q?muXn4IgRStEdSm7zSEmwtYzZHifeIaZ0G7VdBfZtzkcRQVdj8kh+btXQdLMA?=
 =?us-ascii?Q?kiTvmjgPvilRARlG0VysCiEuV8HjUm8HbPqfJj24nIad57MLfM5TFD4UQ+lD?=
 =?us-ascii?Q?pKAQTcwm/RDLLGx4Srcy83s4fCU7TNLd6A28ge0Li3NHslAYcSZ0CBUW3zae?=
 =?us-ascii?Q?ggEhfpVbLd3P+m1uZoqE2cNXFW8mcrauvC63qjnEX4QJs92rUOTEiVrpwyXY?=
 =?us-ascii?Q?jsX1oxnYh+jMyakS2GxeiuLCkkplzax9mc+MiH2bE+6mfecxfWjQ/6FG4M1D?=
 =?us-ascii?Q?3X3kub87ImywACRFLgR0H76/LWGxTZKdE9EOZqwELbaT4m1X/10p5uuUj6d0?=
 =?us-ascii?Q?Tlg3PjPWD5h6KhjshFg6YfYYIHnhzcUgLE9cW9wOy+73ZwJ8ZJkyWPCQqn6P?=
 =?us-ascii?Q?OSZfyoSjEPpcQb+YTtBpx3R5QZJL/aDfu2KClK+uAXWkESJwLo6jWHiExQSJ?=
 =?us-ascii?Q?q/26KwNEVdIyaCp0o2RaC8j3kNlHOCR224GR79p8B8KAYyktBRGUcIznpk5n?=
 =?us-ascii?Q?5/KyMJrSSFRBbxiM4blbt8CnCQjQH8WmvgapOTcoMTfdLNcPEFg1Doz/cy3R?=
 =?us-ascii?Q?yk/OKr0mpMMOUkcctKTN/zkh7cSTqFQ1Fo67OJy2GxqPDjCBeS6cOAT9AdQD?=
 =?us-ascii?Q?FSY1B5aOjLaHo1Ud4zGsTS0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e577bf7-cee5-47d2-84d6-08db05621767
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 21:11:46.2369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FjdxPfGo9Q1s/ltny7PfURgvDBU8UDfJE9TXJEy9Bhi3Co2lOQfd2SlL/tGAPoSyRYVStw5vtKIi/zD9o/UEbme/FCzuapxeTIRQNtoeTV/idPcYd6eZt3x9ZPtrBqnM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4801
Received-SPF: pass client-ip=2a01:111:f400:7e8a::72b;
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

An instruction is a 'combined' Pointer Authentication instruction if it
does something in addition to PAC - for instance, branching to or
loading an address from the authenticated pointer. Knowing whether a PAC
operation is 'combined' is needed to implement the FPACCOMBINE feature
for ARMv8.3.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 target/arm/helper-a64.h    |  4 +++
 target/arm/pauth_helper.c  | 63 ++++++++++++++++++++++++++++++++------
 target/arm/translate-a64.c | 20 ++++++------
 3 files changed, 68 insertions(+), 19 deletions(-)

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
index 6ebf6df75c..66dc90a289 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -386,7 +386,8 @@ static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
 }
 
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
-                           ARMPACKey *key, bool data, int keynumber)
+                           ARMPACKey *key, bool data, int keynumber,
+                           bool is_combined)
 {
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
     ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
@@ -507,44 +508,88 @@ uint64_t HELPER(pacga)(CPUARMState *env, uint64_t x, uint64_t y)
     return pac & 0xffffffff00000000ull;
 }
 
-uint64_t HELPER(autia)(CPUARMState *env, uint64_t x, uint64_t y)
+static uint64_t pauth_autia(CPUARMState *env, uint64_t x, uint64_t y,
+                            bool is_combined)
 {
     int el = arm_current_el(env);
     if (!pauth_key_enabled(env, el, SCTLR_EnIA)) {
         return x;
     }
     pauth_check_trap(env, el, GETPC());
-    return pauth_auth(env, x, y, &env->keys.apia, false, 0);
+    return pauth_auth(env, x, y, &env->keys.apia, false, 0, is_combined);
 }
 
-uint64_t HELPER(autib)(CPUARMState *env, uint64_t x, uint64_t y)
+uint64_t HELPER(autia)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autia(env, x, y, false);
+}
+
+uint64_t HELPER(autia_combined)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autia(env, x, y, true);
+}
+
+static uint64_t pauth_autib(CPUARMState *env, uint64_t x, uint64_t y,
+                            bool is_combined)
 {
     int el = arm_current_el(env);
     if (!pauth_key_enabled(env, el, SCTLR_EnIB)) {
         return x;
     }
     pauth_check_trap(env, el, GETPC());
-    return pauth_auth(env, x, y, &env->keys.apib, false, 1);
+    return pauth_auth(env, x, y, &env->keys.apib, false, 1, is_combined);
 }
 
-uint64_t HELPER(autda)(CPUARMState *env, uint64_t x, uint64_t y)
+uint64_t HELPER(autib)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autib(env, x, y, false);
+}
+
+uint64_t HELPER(autib_combined)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autib(env, x, y, true);
+}
+
+static uint64_t pauth_autda(CPUARMState *env, uint64_t x, uint64_t y,
+                            bool is_combined)
 {
     int el = arm_current_el(env);
     if (!pauth_key_enabled(env, el, SCTLR_EnDA)) {
         return x;
     }
     pauth_check_trap(env, el, GETPC());
-    return pauth_auth(env, x, y, &env->keys.apda, true, 0);
+    return pauth_auth(env, x, y, &env->keys.apda, true, 0, is_combined);
 }
 
-uint64_t HELPER(autdb)(CPUARMState *env, uint64_t x, uint64_t y)
+uint64_t HELPER(autda)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autda(env, x, y, false);
+}
+
+uint64_t HELPER(autda_combined)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autda(env, x, y, true);
+}
+
+static uint64_t pauth_autdb(CPUARMState *env, uint64_t x, uint64_t y,
+                            bool is_combined)
 {
     int el = arm_current_el(env);
     if (!pauth_key_enabled(env, el, SCTLR_EnDB)) {
         return x;
     }
     pauth_check_trap(env, el, GETPC());
-    return pauth_auth(env, x, y, &env->keys.apdb, true, 1);
+    return pauth_auth(env, x, y, &env->keys.apdb, true, 1, is_combined);
+}
+
+uint64_t HELPER(autdb)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autdb(env, x, y, false);
+}
+
+uint64_t HELPER(autdb_combined)(CPUARMState *env, uint64_t x, uint64_t y)
+{
+    return pauth_autdb(env, x, y, true);
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


