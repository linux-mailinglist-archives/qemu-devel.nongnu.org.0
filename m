Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5326C5789
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 21:28:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf52W-0001hE-Oi; Wed, 22 Mar 2023 16:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pf52U-0001gU-GH; Wed, 22 Mar 2023 16:26:30 -0400
Received: from mail-bn7nam10on20707.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::707]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pf52S-0004xk-V2; Wed, 22 Mar 2023 16:26:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjtfB96b4rNcNBAZlxD4LtcdDJ1ej0q2BsHw8s/nNQPKaBK8EurtfONVLTPg2RosqN0282c43HSK2OBbCkE2cQ3DxC+J7ZCr5MjeXiwA3ksALqU/a/GBKr2RQeAzInGw63SaIniHhFrgJNO881fzbnQHIh3PzGuezOTmf4DuaQr2kBlxiEWfCtXEy8X81vl5qWFGoxwxl1VCecjCxy76VD57QmyCO6wyUlQW3ait6ADZLU/2pAD/VuPevopNwQxHrmm9by6bFumqCtzGmnsmlr9AnJt3YgmST9GPPu2Kyr3ZDKf5QFHVwJSEkU15f1i7LTSUKJBz0nnGr4jsx3j1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQg4ICfwAhtvzfCWmDWPTHMw0PD4ZTDTP9tnV0MQv3I=;
 b=SoC0iEZPJ9Y4fOoK5aACQfwGJ1od52IzQ+6ysl/ybonS07SUT5X70Fo5tlIwpQyYy1QMDeJooctLNb7FlKbLuZAt1Sp3CM+8my++uc8EMuIv+/r7jld/mIvYIpOemcDeMPEpPQ9+J4WVhLydX2PVol8iRq1QXMMdjb6ptnq3EaNr5A8rW4b8M7JdmNeQo+2vSc/ng0M/+QTysWq/Vc7PpLSK2JpiobM667RJFYSOnlx6VaUVEerb8BPsmCvKD/+P/A//LXhu9XZ64+eGBl++oNUQ1DLvn14NcT/buLPWUdcudj3g3D8dXcPWQ0o9bnlMH3+oOInxSgiaPvuasCFcuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQg4ICfwAhtvzfCWmDWPTHMw0PD4ZTDTP9tnV0MQv3I=;
 b=TkzZqSCulyLeTr11eDZKB5JCEf/yvnw7Pm785Ab2vyKj7qXh7/0UVra1knMS1y5fm+1vLlFR4UI2bNUdfjOl7vvXbx70+6Yy4a/lJLnLPfeL3wug/fbxId7MwQo5Rmv9lcFlAfXrOXPBg7TvX6wU7fx0nbTxLbBHnEv3B1AriqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SA1PR01MB7342.prod.exchangelabs.com (2603:10b6:806:1f5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.8; Wed, 22 Mar 2023 20:26:21 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c%8]) with mapi id 15.20.6222.010; Wed, 22 Mar 2023
 20:26:21 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v3 8/8] target/arm: Add CPU property for QARMA3,
 enable FPACCombined by default
Date: Wed, 22 Mar 2023 16:25:41 -0400
Message-Id: <20230322202541.1404058-9-aaron@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: c6abfe1c-4d02-45b5-f5b7-08db2b13b35e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IjIo1nsitJUNUim3lWmf1sys44kqYh+A1V6V776xbuyqzJ8R7Zug0dNmuYj/DDrDxMyIpjbghVlclBn9I0roEp3EDiHbZ6gHRFg1WXB2UEyH/BZ7pblyhjc/+47oBd1aDK1IWRFRbXrEXhYvqJ4EkOnkM9VN7cMoT7GbCF2wfY13zq/Av4vkvS3KXHWPkMn1pGxpgXDnSHUuj3WTUvrF2h3YtVuAx0oNCPyhrpldqSJterLidkJhys/a3Rk+F72do2VqD0X67vXyi3K5zaAiAG3r4ZSNvzJ/6BZIxag7d02Af5TENEc9tU4jxJC6tpwBUhcb2qVqqmsgUYeKyRkQCJGK2c6M4QB2jp1AFlUzLFDNHPyNY0K/ReQUh0OHyRWb8VWBPgKev3TgcjgwdyWUBHMR7x0KjR54lgXtc1lOf3qHLe6HbNhAXP+NDwde1eq3gruPSoL5/GeS25i47CI4w33jjyk8PezB0lZwwzZtRUe/sHu1if4nOe9kHUoeHF9OZCNzTMpa7GrHCUtzMAEB9vefX0a/9zJtKweK0k/tUTVcbhTFKmMh07fGTGGTKMFOfkV3ITuTAvsGFtpZCLkm58isTBOwJSZJYQ1L19/EdVGjAKktk2RQo0VtIb+LDVEiktM97c8VGJs7oG6XI7j8i2N78IxLo/HRyA9FwZI9UjcpniTxe+1wyPV2+QJ69RKHIkrDnZKNTGwummR7U1SyeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(366004)(396003)(376002)(39850400004)(451199018)(83380400001)(38350700002)(6486002)(186003)(6506007)(86362001)(26005)(6512007)(2616005)(1076003)(38100700002)(6666004)(107886003)(5660300002)(4326008)(52116002)(66476007)(41300700001)(110136005)(66946007)(478600001)(8936002)(2906002)(8676002)(316002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jPH5uu6lG1FU51SNr9pkhP/xvVcDGhBnlteApXiE9F/Po8y8Y6SGVhYHHMTQ?=
 =?us-ascii?Q?Cr8wQ6xknQd6fMRHu0ecOPVspE/uRC9LoTbcwFNCjqSaH2k/727gfh0+3wuu?=
 =?us-ascii?Q?kgZ/qUyrnM6nCj10aig1iNTH6bk9hMeq8Rh9l93LznucsVL1BeLb4mqp0iJQ?=
 =?us-ascii?Q?x93mRrOAK7bT0QlmUlEdjWVziISBi9FvnZUrI01Pxa/aXJ9uB7WwevVFqlha?=
 =?us-ascii?Q?70DW4X4ZFqNCZcXIoJ+GyM7n/PXCMAZtVdH3BsKgE4WPaCUmMuV7ZCt01qn3?=
 =?us-ascii?Q?X3363JSfMKaXaOVA9Sex4bVYakc0tUOQx/VB0zFiToiwHtMh/SyUHW+i62U0?=
 =?us-ascii?Q?ofkKvrNFgNMg0Uy5RnO97G0lswK8ifRFKSC4fGbfIP6a0/twrJVfU4gPkl7D?=
 =?us-ascii?Q?PJdDCi6sBFS9GDp8yhYvGzOSxKRwwc+AQvqkV+ntY0xk25hDcwPhI3TwaZUf?=
 =?us-ascii?Q?ozt6EWr2vS9VC03du5xttnGEqivsb7Vs2oP7E7l1Sq3WqNYO2lRC6MtTU/px?=
 =?us-ascii?Q?wBKijuXKWkzC60b3c3n+1xd/hkQnH1YDq7B7Tt41jXfzxfV/bZHdVkCscMg1?=
 =?us-ascii?Q?StJQKUm7cKOatFUdk5hc5XNMhfJi60FJ2yBo2lvCxFVQbkHWvJHqmPSQu/ZI?=
 =?us-ascii?Q?ePBAd+ICbGlFiwNhRbsbnpRKIcuo1Qm2RzWGsAogXe5IW6mK1NXunxCDiIL9?=
 =?us-ascii?Q?nx7xiAZE9xxYQRJ+bIATKijJCz1mlkkNOroW7ZmUQuObxS6nnTKPpLoBZ3ij?=
 =?us-ascii?Q?50b68SOSZS5x5QaO/8DTNKgodu6vlrnpy/IZMRC9iDwjs0dPYyI1fn9R0L3n?=
 =?us-ascii?Q?CVJ7ZumZO0KeliKVPhW2ajFLCtmYfQALzv/XG7TMYAwrTmBUvTysLCY73cnt?=
 =?us-ascii?Q?n7Kls5SVzexocgrF9RbQSsfA1314lX4C9qJ85vUPznlLrB4tUazS+3oJPij/?=
 =?us-ascii?Q?O3D+BdAKkTjX8tR5Epk8KEN/tQlXPRz1s/QmRIoRyc1GUa5MTAJUnp0i374Z?=
 =?us-ascii?Q?DRNi8npKtTBgIeGqTcTY0KEoZFReX2FKndezciWiju9VfeWoSRHquKZdF7S0?=
 =?us-ascii?Q?3NSbUfESRv0cjcR5Y2jLg/Q3uHO3KphlBYFgvz//uOy+O3FTUv4V5dhEQplL?=
 =?us-ascii?Q?SGmTOojI3tDWmM9T2t8b8Q/p2MlG7z00b3ACmpAzHS5Z5ESSDu2+73e6OsTL?=
 =?us-ascii?Q?wqD7p+NA+1lxHy2FJsxtUadhNkygt2TYA7O6Xtr/RS/lGVzNU+yxZRvhc4Az?=
 =?us-ascii?Q?4c+6cnS1uMPbc4MDporCwIN6zhZEFCufTiWCHDH6FO6mnO6bx8Zy5uptFR0s?=
 =?us-ascii?Q?ojqaGK3rfiMV10IX4R2xOTjiUN+hpobCacdn4tKf8QxS/m3ZEy/Ou0/XODjQ?=
 =?us-ascii?Q?RsWZiF7I0Oc3efeL1Tborbh10u/sS8/qSBZyCXFzN7flgHxCm1XUYuEqavks?=
 =?us-ascii?Q?SZ+G+LuaJsDOeYmdTGcoxqLkDSkltc0LkoxMMt1hP+IiDHMNM2b+l7iC7mcd?=
 =?us-ascii?Q?NUiLsLqKVzjc0jM8v1UBhiIp3Lg3QGlxPp+9ZpjNtXt/fNvHaakGkK7YG3JM?=
 =?us-ascii?Q?BRI/sw7XmyB02QUJxtFhWrXxNCu3IurOFx8qPChvUTxr2gjfnVOMTRlQhMI3?=
 =?us-ascii?Q?7WAj8CzegUMRgL5j6ygabKY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6abfe1c-4d02-45b5-f5b7-08db2b13b35e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 20:26:21.8217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcMZ4thfUNB8noEB6zsmvFoLk/8VEUEcw8LY/1xuF31gSlO+tzbkTJxOg8Hne3fZ5T5AnMcy4Hu7zmSkX6CgMgbvtTJ5UN70cMAa3j5/U/kOFhFS8fo4v6jyVqeTNgvf
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
---
 target/arm/cpu.h   |  1 +
 target/arm/cpu64.c | 48 +++++++++++++++++++++++++++++++---------------
 2 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 868d844d5a..80683c428f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1053,6 +1053,7 @@ struct ArchCPU {
      */
     bool prop_pauth;
     bool prop_pauth_impdef;
+    bool prop_pauth_qarma3;
     bool prop_lpa2;
 
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0fb07cc7b6..a5f4540c73 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -591,9 +591,6 @@ static void aarch64_add_sme_properties(Object *obj)
 
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
 {
-    int arch_val = 0, impdef_val = 0;
-    uint64_t t;
-
     /* Exit early if PAuth is enabled, and fall through to disable it */
     if ((kvm_enabled() || hvf_enabled()) && cpu->prop_pauth) {
         if (!cpu_isar_feature(aa64_pauth, cpu)) {
@@ -604,30 +601,50 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
         return;
     }
 
-    /* TODO: Handle HaveEnhancedPAC, HaveEnhancedPAC2, HaveFPAC. */
+    /* Write the features into the correct field for the algorithm in use */
     if (cpu->prop_pauth) {
+        uint64_t t;
+
+        if (cpu->prop_pauth_impdef && cpu->prop_pauth_qarma3) {
+            error_setg(errp, "Cannot set both qarma3 ('pauth-qarma3') and "
+                    "impdef ('pauth-impdef') pointer authentication ciphers");
+            return;
+        }
+
+        /* Implement FEAT_FPACCOMBINE for address authentication and enable
+         * generic authentication for the chosen cipher.
+         */
+        int address_auth = 0b0101;
+        int generic_auth = 0b0001;
+
         if (cpu->prop_pauth_impdef) {
-            impdef_val = 1;
+            t = cpu->isar.id_aa64isar1;
+            t = FIELD_DP64(t, ID_AA64ISAR1, API, address_auth);
+            t = FIELD_DP64(t, ID_AA64ISAR1, GPI, generic_auth);
+            cpu->isar.id_aa64isar1 = t;
+        } else if (cpu->prop_pauth_qarma3) {
+            t = cpu->isar.id_aa64isar2;
+            t = FIELD_DP64(t, ID_AA64ISAR2, APA3, address_auth);
+            t = FIELD_DP64(t, ID_AA64ISAR2, GPA3, generic_auth);
+            cpu->isar.id_aa64isar2 = t;
         } else {
-            arch_val = 1;
+            t = cpu->isar.id_aa64isar1;
+            t = FIELD_DP64(t, ID_AA64ISAR1, APA, address_auth);
+            t = FIELD_DP64(t, ID_AA64ISAR1, GPA, generic_auth);
+            cpu->isar.id_aa64isar1 = t;
         }
-    } else if (cpu->prop_pauth_impdef) {
-        error_setg(errp, "cannot enable pauth-impdef without pauth");
+    } else if (cpu->prop_pauth_impdef || cpu->prop_pauth_qarma3) {
+        error_setg(errp, "cannot enable pauth-impdef or pauth-qarma3 without pauth");
         error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
     }
-
-    t = cpu->isar.id_aa64isar1;
-    t = FIELD_DP64(t, ID_AA64ISAR1, APA, arch_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, GPA, arch_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, API, impdef_val);
-    t = FIELD_DP64(t, ID_AA64ISAR1, GPI, impdef_val);
-    cpu->isar.id_aa64isar1 = t;
 }
 
 static Property arm_cpu_pauth_property =
     DEFINE_PROP_BOOL("pauth", ARMCPU, prop_pauth, true);
 static Property arm_cpu_pauth_impdef_property =
     DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
+static Property arm_cpu_pauth_qarma3_property =
+    DEFINE_PROP_BOOL("pauth-qarma3", ARMCPU, prop_pauth_qarma3, false);
 
 static void aarch64_add_pauth_properties(Object *obj)
 {
@@ -647,6 +664,7 @@ static void aarch64_add_pauth_properties(Object *obj)
         cpu->prop_pauth = cpu_isar_feature(aa64_pauth, cpu);
     } else {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_qarma3_property);
     }
 }
 
-- 
2.25.1


