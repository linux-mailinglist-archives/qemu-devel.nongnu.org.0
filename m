Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1946888D2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 22:13:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNgsK-0008Pl-M5; Thu, 02 Feb 2023 16:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pNgsI-0008N8-Ek; Thu, 02 Feb 2023 16:12:06 -0500
Received: from mail-bn7nam10on2070e.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::70e]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pNgsF-00088y-Ur; Thu, 02 Feb 2023 16:12:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5M3h2eVFthlDEy2UcGPqk/E9xN8emmz46Jjf8xb0XUowPahwM588CdmR42GF5FUBsiidzcbwA9nuhV7+wBBzcWBoqMgLnGEhX/2n952gzgZGQewNKCCLAs6GrzhWVfVkCdWauLe8hH+e7kUFdYjRhmwrNKRu20H56ttGdL0KjECSiDnfMBOz+r6eCg7s0bKK+5aH+6AQ92AfJ6iMuNbGIrlDRvbOJ74C3WQfrYvG+2mszeE48HFFiuj84tVX/E8GrWOkP6fsDhQQQPz927aXmgFBV4bXE/B7hHTGY6cBZF2XC9C2iMBgekWz6axfw5ifkjlDwIVqL/bpBjPxsAGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38m9nYlQ+DAi8DkbGdDAwPqVFQp4+eGNP1ABUGvoewM=;
 b=WiD8t4lcOtk066N1j7dpm/yu3p1YEdrscVFvU9tongdEDZAS3mPl1bsq7jQ296BvKGjot0hBwMWs2aZyU7uTJWS/CwhiDluMt27SEX4wGUot3Aa+PCHsFhHJdJVJF64hRiP3ftHPsXtpl0wPd9YKm6k1rtVxZQVpNVifDrrDo1PG3mX6nTk6Qf12YLLjUcYv7syN5bjKI+Km4lzzSiVlY/qQxYM3Fknplso81NAenh8GPcUQGDjBjS06rYt0yVOtRVT75v0+FEqFC2ddsu37yKurQWBs1kbNK0GJD3bWqu5WQhiWKo5oE7Me6f+z1sTzcrFJUsDvfEdiW9eK4OKW2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38m9nYlQ+DAi8DkbGdDAwPqVFQp4+eGNP1ABUGvoewM=;
 b=mXpIIRwYikmREz2hU+0rKRTC8MTKm6pha0qGye67d2M8sEHI7Gm8DKQ4uZ+iCKpK8xiegGGOcNR8GvUw+pSYWLXLQkAfW7qjT7bvfQKjxP7VqsbGiTb1k4eU0L7ui4JjVJKqA38i0VXQZZcOunrF/87oP0GXYk8MZk/RmPNHDa8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 BL0PR01MB4801.prod.exchangelabs.com (2603:10b6:208:7c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.38; Thu, 2 Feb 2023 21:11:47 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8%5]) with mapi id 15.20.6064.027; Thu, 2 Feb 2023
 21:11:47 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH 7/7] target/arm: Add CPU properties for most v8.3 PAC features
Date: Thu,  2 Feb 2023 16:11:29 -0500
Message-Id: <20230202211129.984060-8-aaron@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7b4aa971-32e1-4ca9-f128-08db0562184e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xyOEJz7mWCtz2U400drlep3YZihfmmn3ERkkHPFz5Tob80uSEi2qcS+EX6hbyzPyNdUWQRiRs513TDinciNTztCOTEw36xfrhP+jhokMyNxWmDMn5ji2CS9kvMuN4V2QLJmZGvcZvFRkQLMG/TewocnYOQdMzk0j0rPVh6aQC1qApuD4HEAnHbeddd9skWo+Ma6APfS3Z5RnR3KjEi8XuIS2wk3B6u/v3xni12GnVDpe2EeN/umIugNuoeW/gQIRzE1VLb6JVG8rpzPBfAyoPunXwC4N5BVWr/qr0ccSepNKQFBS82SrIM1xTRuwiYEJWKl67/79XX1BvYIrT9PX9XukcY3CaKJAEnHsBROfAKA69PY6guG5fNeJRXFVty1UzfJufhPJbqeBvZJFw7iTlj/I7bu2+fp5oB9PVD+a4WcZ81E4k4RW10qYobDyk4/rDpDicngit0125A1wsoKUVreOxT1nh2JYrVWxDRgjBXC+YVWfL3AqhYdHO7IcUJmd9zhX2+S6/ZjqoBzkNbHAg+ms1W8eCw89uHZZRQk7QJT3ahs0FwqlPEGCqFj4prixsKTd6gFwHZtZYQzo+MmjjtpeeQMVCpWb9bh6LUH0h+rWS84kSvSDUzzHlLrCqA3OOYTW3L+2PF/bgUJmIthMFzzwTqLfrJWxivl3j/TJ79BCJO3NxenNHReMjSDsOO0zFRli4xUa0IAvLS6lCm2sWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(39850400004)(396003)(136003)(376002)(451199018)(186003)(4326008)(6512007)(26005)(1076003)(107886003)(6506007)(41300700001)(8936002)(5660300002)(110136005)(6666004)(316002)(52116002)(66946007)(86362001)(38100700002)(83380400001)(38350700002)(2616005)(2906002)(8676002)(66556008)(66476007)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MrPnDXp1x1o/T+Pdq3kLftzjIfRfWVdUwjhvR07Xi11tarHJvMHDv1O7La9a?=
 =?us-ascii?Q?BufIZHuWVkRLrOKvL0CikdAjTsOuhDfMNHn9EqgK0sxQgp2UnHqTTNS8pmW8?=
 =?us-ascii?Q?K9TOPbJDWiGEwPd8RucjDCvAYrxntFUmSzBPQLx+LOExPRMcnwudo5oN6EYd?=
 =?us-ascii?Q?OQsOUyw4UtEAvFe3LquXkr+LA+WLfwGe567vLvp8j9hSlnLVPJHw4xGM3b7h?=
 =?us-ascii?Q?j1npVfzSS/qV5U9hB2IkTVkIpAeDlWOIdS/yFBo5WQLy8BWwHQAjoxDlunX2?=
 =?us-ascii?Q?qMHJAAFN74e99+XHhLfgEngyOnAwewjUY4+qiOCriyi3RhcwwDD7GHsTVcPT?=
 =?us-ascii?Q?JI5yuZ4VnajYL5juOGbgKEW2RPV6+8g8dGCoo+Cc/Y6ofYSkB1C0JuFF3Z3t?=
 =?us-ascii?Q?dYAOF3gzpYwgkGJAJh3gF86v+AwXhnF7cuMdW0WPDs8xUWY/0pXaFcsiCRS5?=
 =?us-ascii?Q?W9oP8jkI9BAoMotUd5J1LCZo9h6xUouDccfuF6VaHRJmOltD5flZ9TKgY27A?=
 =?us-ascii?Q?mmHhljYlRpPnVPWNujPk8A9eRJXgdxo+g1Ap9UpATaKyF0wCx6tW/Vo2jkVT?=
 =?us-ascii?Q?cM055QIrxgjaLZJSg0l6w8yGBs3ili+iZEOYVminoY8I1ykN1dK5iCN9rx9b?=
 =?us-ascii?Q?aE2n3XF42KSx3gkdT0NS2kHP3AoG12paTdzOY7rQnyCMZYWEc3CePqIGKo8t?=
 =?us-ascii?Q?FpKfTR4QemVlRGyzBkTaoEeiNmjYzfGKiOhtuzm7ooPZ1VAXbDAsLwVipuUP?=
 =?us-ascii?Q?AumVdJQ096RTytXJ3b4ws1MUl/0j4IyG7z8PxSGPbRerFAELVtZ4QkAKgj7h?=
 =?us-ascii?Q?adMcGJHYZxKTI0RZlQ/tzPqBqmw/kw+uBn3mQo/lyXv6lWknuFkjY8gEVYNR?=
 =?us-ascii?Q?ag/K/q6RdVVVPT+pgCQ2E7OPKK4KhcbfhFHCUyI1IFQdxBKiF8CUTNBW0gfo?=
 =?us-ascii?Q?eNM9BgzqJMArEI/9muZbEwVVi/yyNOgVyKdpL3z4L2tFJEFk6lHDJQi3qRjn?=
 =?us-ascii?Q?zc8xYtdM3onbjEm3xX1pfeMPVVkadTceh6ff4GxnRnIvBCYVKtuFxmj6OQni?=
 =?us-ascii?Q?td9Dlt97uZfIrdD46vwf3lUO0d2Kes4dulQjYKCmAx4sGV6fU3znTJuSGscS?=
 =?us-ascii?Q?eZq2C8YK6UhPG8XlLmiZ5magjn04AFBMl6oX2o4Bxjz5oVhc4gwTWD7mLYxE?=
 =?us-ascii?Q?gwj7JZdMdzW/Lntz3AnIBCyOtRamLMaJ9jqbeYNwAU7PvHM9IYAlRi0jNOFG?=
 =?us-ascii?Q?T/Fv5F+mF0HkNQQvX6oFjEw/IRQfZarApm4rTHQ8dms8kGknNhajod8NbHV1?=
 =?us-ascii?Q?uvypM/NItEJ3Pbqn9Hg0amW9pmvaMdEx0OH9uBpBowcLpTKazBsm17zlNe/y?=
 =?us-ascii?Q?rfQ/KUfHDNGaO0hE+uhDln/otzGbXxKKfUKchXYihJ9Rp4TvF8JrZMpXHQch?=
 =?us-ascii?Q?BA313wOiowQLZSeshMTUOmPLz7VDtmKDRfznC6Ey4gR6TlI55F/D6rVVVKpl?=
 =?us-ascii?Q?vTeFn33oBYWLog1DzJsoIJBagmLqm3auI5HIPKNxVrd18PArJa1IHb9HaFyi?=
 =?us-ascii?Q?bwI8xggLXEusdc33c757G5+8xWvmaoFYcqsW00Mb1G3xL3Y93uaPqDuNk/8V?=
 =?us-ascii?Q?yDH+ESyY0M+rapGl7VhvydA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4aa971-32e1-4ca9-f128-08db0562184e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 21:11:47.6911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mtItzXDnx1AjQPVcwoMGf00bzH9zsYFHjkiIdPw1CGXlGhFK0L1Ml1qp+yERQ6iCTsvAqp+uCjk+L+3hKzYShN5VxN6BEtqm1iB1+HC3jfA/CoKMK/tNey1yzWVqQjI
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
 target/arm/cpu.h   |  5 +++
 target/arm/cpu64.c | 81 ++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 72 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9be59163ff..a9420bae67 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1039,6 +1039,11 @@ struct ArchCPU {
      */
     bool prop_pauth;
     bool prop_pauth_impdef;
+    bool prop_pauth_qarma3;
+    bool prop_pauth_epac;
+    bool prop_pauth2; // also known as EnhancedPAC2/EPAC2
+    bool prop_pauth_fpac;
+    bool prop_pauth_fpac_combine;
     bool prop_lpa2;
 
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0e021960fb..315acabbe2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -590,8 +590,7 @@ static void aarch64_add_sme_properties(Object *obj)
 
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
 {
-    int arch_val = 0, impdef_val = 0;
-    uint64_t t;
+    int address_auth = 0, generic_auth = 0;
 
     /* Exit early if PAuth is enabled, and fall through to disable it */
     if ((kvm_enabled() || hvf_enabled()) && cpu->prop_pauth) {
@@ -603,30 +602,79 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
         return;
     }
 
-    /* TODO: Handle HaveEnhancedPAC, HaveEnhancedPAC2, HaveFPAC. */
+    if (cpu->prop_pauth_epac &&
+            (cpu->prop_pauth2 ||
+             cpu->prop_pauth_fpac ||
+             cpu->prop_pauth_fpac_combine)) {
+        error_setg(errp, "'pauth-epac' feature not compatible with any of "
+                   "'pauth-2', 'pauth-fpac', or 'pauth-fpac-combine'");
+        return;
+    }
+
+    /* Determine the PAC features independently of the algorithm */
+    if (cpu->prop_pauth_fpac_combine) {
+        address_auth = 0b0101;
+    } else if (cpu->prop_pauth_fpac) {
+        address_auth = 0b0100;
+    } else if (cpu->prop_pauth2) {
+        address_auth = 0b0011;
+    } else if (cpu->prop_pauth_epac) {
+        address_auth = 0b0010;
+    }
+
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
+        if (address_auth == 0)
+            address_auth = 0b0001;
+        generic_auth = 1;
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
+        error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
+    } else if (address_auth != 0) {
+        error_setg(errp, "cannot enable any pauth* features without pauth");
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
+static Property arm_cpu_pauth_epac_property =
+    DEFINE_PROP_BOOL("pauth-epac", ARMCPU, prop_pauth_epac, false);
+static Property arm_cpu_pauth2_property =
+    DEFINE_PROP_BOOL("pauth2", ARMCPU, prop_pauth2, false);
+static Property arm_cpu_pauth_fpac_property =
+    DEFINE_PROP_BOOL("pauth-fpac", ARMCPU, prop_pauth_fpac, false);
+static Property arm_cpu_pauth_fpac_combine_property =
+    DEFINE_PROP_BOOL("pauth-fpac-combine", ARMCPU, prop_pauth_fpac_combine, false);
 
 static void aarch64_add_pauth_properties(Object *obj)
 {
@@ -646,6 +694,11 @@ static void aarch64_add_pauth_properties(Object *obj)
         cpu->prop_pauth = cpu_isar_feature(aa64_pauth, cpu);
     } else {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_qarma3_property);
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_epac_property);
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth2_property);
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_fpac_property);
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_fpac_combine_property);
     }
 }
 
-- 
2.25.1


