Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE7B69FC56
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 20:38:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUuuW-0007J2-Qg; Wed, 22 Feb 2023 14:36:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pUuuU-0007HV-8T; Wed, 22 Feb 2023 14:36:14 -0500
Received: from mail-dm6nam11on2071e.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::71e]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pUuuS-0005XN-5S; Wed, 22 Feb 2023 14:36:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKXHCNSs1koRxOG1FAqiAAg9Kdan2XlQYE7LRl6VgplCy5JptAfQvvm08X1QQhymDLZpLBvRO5DukXhN6WuhWHZhcMC2PyhU15gk53Xdv8L+BYTayhfF+w02YVtYQFYWLjjBYFiULIpLfiLbY0oCuzpaSAeK0EVttPrOHhcsOdbPN8mqSV9OjvQaCm2ZaxvvqVeAHgel5wRiT7Y5g9ouL0ZaAkgoqaVQdDzRKTEHJy2/8GuPK4281e4dz6esuRRrIXgIqxkwBol8wMRKyAKvXJZ1T5DPstldcHyUSe1T9ZbO4GCUjmYZ+yV+0bzKESENKZcYDrS5wtsBfOau8BlT/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWBVNPCkegKSNV2fM0LBfJwOxfxCLzKu2b4eQ4z0jVs=;
 b=oRn/dYxjG9y5le0wQ9Zl9ut54TGQ+6tQlZM+O5E7O0iFAkPssdUraEA54mo6JD/MajaGU1bdm1PNGCN4JdtDsVNES4tSk75T2pkxFz+fp4Y9J4rbrBJphrf7GCxh//66byiURl7YzRaFe45apZARabRpBwcVVz/vn/kL1fCLwHrvCKrgfcclWBpqSKRXSY/GwtBrCA75QvJCf/xp9nDsyBYqIJ/ZEaSl+FyeQoGXrLOIBiWQ2e9pIq9LekwEUo/ifvDD8SrCVmd4qMkbIArZ/rf3xLUAe42gZQdrrgFVmFB1yhNbSIOJe1VC9O++5+TRdTPmUQmFa2g7/C0FdmCW+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWBVNPCkegKSNV2fM0LBfJwOxfxCLzKu2b4eQ4z0jVs=;
 b=CKq2/HymDWlKDUIuw3Wg8BY0kzW46fP7IqbaUAfUpBarkuj2y2Qady+Mmq5zKCZ/+RDloT2GMktY8+kqgfiOJYsajv1Q7EcRaOJB6L+8ef/kNM4MMZSx68AUSZLEyTJgCu5xlKUx92O4HGFqicWzFieWYYIy08zFl1QR6hZlXxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 DM6PR01MB3849.prod.exchangelabs.com (2603:10b6:5:91::26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.20; Wed, 22 Feb 2023 19:36:08 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8%9]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 19:36:08 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v2 4/7] target/arm: Implement v8.3 Pauth2
Date: Wed, 22 Feb 2023 14:35:41 -0500
Message-Id: <20230222193544.3392713-5-aaron@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 085f6f5b-2524-4c84-7c57-08db150c0b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AE84fRWQAhzmrdRruOMZSf6zIINMwv4kMgPUoM861Hw9yX83y91rq+Kfftc6l3Qx3+JBsgps+4gjPGBBWZtkCMenxqdFehgmN/3RhPn2wRKIhC4PBXMkLo9cpwXsvoH4xcS2fpnM1DdCKt6aPD6tbgswir7wLL9OV/W0kk04UFM7/Tjs0NW0gRgPXjhxg6G3CO5aUjFqHrc6/526PlMfx/39W/UW+ElJcQmei5KwxdtINfSKDGoGx0QC2y5jEZ1u0JdYIpRY5ztXjTWvL/3v+V7L0IJUs1U9x6aXk+/sUJQTvx5rNysk6vl7L0FEbeJu+v9GFDBqRLU7guhvfvlPdaI2sp+z1iSoc7ty+xDIpjl2TUPHsbYPi29R7D7VcJ0q6KmTXbFwghF5vjVbxgk8+Kt2c1bE1B92E1F7CUXRZLCZIX/SLxKYYzWg0AmQPu+eFdlZpZfWKPUF0PuF45Ulu2lCR2S4c4CZYIQH3AcWgbJoOTmlMtW+y3RBn7DYIYMZLLzLyOi6yDh55SWUaTFTGwxMPF3L7nP14+J4xJy0EQhcNo75pzC6iL6pw9OW8KE02k+E10r2TFLjtHjoe+sEzRXjkaE0eJnQl+YvNoGcAUHzw+SrXNfkMH8DKhXWCbl1cLExyEsnLIEqinthbaMk4YxQU+VcWX4bqB05+cKqSYd6yr1VoHe1jwKmTdATmQ/m18O7nfOVMwgYaBoTpaKzLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(346002)(39850400004)(396003)(376002)(451199018)(478600001)(26005)(6486002)(1076003)(107886003)(6512007)(6666004)(6506007)(110136005)(41300700001)(86362001)(66946007)(4326008)(66556008)(66476007)(8676002)(38350700002)(52116002)(316002)(2616005)(8936002)(38100700002)(5660300002)(2906002)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QT07olbXNkYTO++E/G1SfyrY7bQTJExMKpjoK5VlARRE8JRY2v5R7bjSr/Ux?=
 =?us-ascii?Q?ErCbTt/JvNAFhn4qq/CWde8sLaYlMUxvX5AYE9MN+wghTTw8k4SFe6hPXUb6?=
 =?us-ascii?Q?g7Vr7RuLWlj1u2rr9K5Gojro5dqlyLGOVIvu+dUFjf3S2oM1orVsNJhFqtPv?=
 =?us-ascii?Q?BOeEG60B6Cci3LZvReHEdNfu1Y19Dv3ojWoGlXkerXnmwWaCJCjNsDHegSpL?=
 =?us-ascii?Q?+th1VyKdOgUBw67+scPF44YzEQRjAHsz41JG6nv4pu3n6ORek8qWJSRR0xCX?=
 =?us-ascii?Q?wxRN6ZPR2lFHhZ6iBRqDpFuHCZKDrscW1QTXleOGFHa2MP63aLwWGDoifJSN?=
 =?us-ascii?Q?JAM2co6xO57EgXW3/GpRLdmmPhSO3NoGVSlKTdrlA/fe5rsPColdmEsAWfMa?=
 =?us-ascii?Q?+riAeoCuuUPb/M/Mzm8dUHYPW5IUdWOKuFD/Bkjhs6iSkgweOftd6GSg8WWc?=
 =?us-ascii?Q?PCsxlMrTpyJIgJTyYgBMzELiBkGEHtyKMOjkoUyFjSQnwiFxDF15s4gn9flq?=
 =?us-ascii?Q?45akv1dE+BQXx7UhZugMiSaEigJwgl541hyeWsOuX1HSMBbLFhDBxwTO9I6i?=
 =?us-ascii?Q?5iiCJsB0q4h5BAXNVDTr11xYfcBrNaT6Ex8YIjsZe3uEfB1Jb8lM6mA4Gxz7?=
 =?us-ascii?Q?GF7HvBPQ3nV6xvXe8oN9wJbAYj46fCCv80U4lZtZMxvjc8F2lR63k0rUfzwK?=
 =?us-ascii?Q?H4anRR0y+3hoP/UEongFutluoRo7jCPg4GAlWQVN51BNRzjwtzzgqqPbidA6?=
 =?us-ascii?Q?ZE0Kez6LlkbXfg2SoxNA2/dMotIZf0ax/1OLbJyG32acM9vURQWGC5o7g/r9?=
 =?us-ascii?Q?dDW4eJ52lNxbPgv1LjkFTuhj/ziIa/Mar5sv7KPO5k1XC0JvMboY1Cyxa0LU?=
 =?us-ascii?Q?fuy7dIvVonvqrIXEMGDFqVhlSbOYM04ENhpRMGCgAEmdQSTjn/mB4l3Gd1e9?=
 =?us-ascii?Q?pt9oGkbsfyMkJL6NkOdD4nQWt7J6exbr1PqAh7lKPCpo+vGmNXBZFORbMoP2?=
 =?us-ascii?Q?dm3ATEsXgxkUm9unuovYtAyt4Bsqnii/tgJj36NbBz8UBkYTXuojmq7usK2V?=
 =?us-ascii?Q?W0mciN5hAXSnRjg1ri0aXIfia7q5mvc/Lt0mDWdseGceuKfdRRGxCp1DZQE0?=
 =?us-ascii?Q?p5sEPKcu9XrRSAL1jNiZgBSCVUBm6gkpsY31+qWgVhVOchILWJBE6RcOOOyu?=
 =?us-ascii?Q?7zP6+YAwwB1on2VBcXYYTjQJkU/HucX1V4/47GdjSEAv9ncoRHtoe9RkDxOf?=
 =?us-ascii?Q?7mv8nSNF0xm8WVEWhiLwrN5xtPKLSlNYtPGIxFjcOHAQCfErhyQG/UcvXAZl?=
 =?us-ascii?Q?PTZuQmcvZjOUvQpnoOYE150qk4YQhMurMxS5tIs581L4b1xrpjHiWcb7q20E?=
 =?us-ascii?Q?Ne9ApB5Vc13rspznIb1u/Bg/oGlqkCSB7vj+5J9P6kNXAkmWftZMD1DZmwDc?=
 =?us-ascii?Q?IermvtpgZ8PTd5ehTvhq4RhC4wdz+vw/ZfCJdr256FuAfL/3npJ+dk7a6Wu5?=
 =?us-ascii?Q?t/D0ffo8wXcormt9QmK9km75Fm8DkwKyEfb6xZgMhWnuMScYzPvD5dJcKbnC?=
 =?us-ascii?Q?KfBODxUm4C1TNK9YZfOqaUPvuCkjo3ljxXtbP3Yy6NuA2Ij4AgGqDA3kVVtm?=
 =?us-ascii?Q?qCgsKpWHce3S5BJRJJIK+vo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 085f6f5b-2524-4c84-7c57-08db150c0b7f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 19:36:08.1314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijVVQvakhusVPeQ3I8+ZFK4/ZiTz55Qd71vcnxLWlcAIun+a9j7j+VyOmbZFVK+WccmMGIoHdEcYfn5Y/sHBmJ4WfpiuhuFvyDdb/JUlaLQaKv27yWsyBiJUNWJbcrY7
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

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/pauth_helper.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index a83956652f..c4ee040da7 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -347,7 +347,9 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
      */
     test = sextract64(ptr, bot_bit, top_bit - bot_bit);
     if (test != 0 && test != -1) {
-        if (cpu_isar_feature(aa64_pauth_epac, env_archcpu(env))) {
+        if (cpu_isar_feature(aa64_pauth2, env_archcpu(env))) {
+            /* No action required */
+        } else if (cpu_isar_feature(aa64_pauth_epac, env_archcpu(env))) {
             pac = 0;
         } else {
             /*
@@ -362,6 +364,9 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
      * Preserve the determination between upper and lower at bit 55,
      * and insert pointer authentication code.
      */
+    if (cpu_isar_feature(aa64_pauth2, env_archcpu(env))) {
+        pac ^= ptr;
+    }
     if (param.tbi) {
         ptr &= ~MAKE_64BIT_MASK(bot_bit, 55 - bot_bit + 1);
         pac &= MAKE_64BIT_MASK(bot_bit, 54 - bot_bit + 1);
@@ -389,23 +394,30 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
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


