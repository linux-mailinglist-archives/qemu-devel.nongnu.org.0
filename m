Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19CF69FC57
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 20:38:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUuua-0007N2-HF; Wed, 22 Feb 2023 14:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pUuuY-0007LE-Qk; Wed, 22 Feb 2023 14:36:18 -0500
Received: from mail-dm6nam11on2071e.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::71e]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pUuuX-0005XN-3b; Wed, 22 Feb 2023 14:36:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbuIQqXuamP5rCP4zXwAebLGEIsgZqD2G2xEYmFMHiisTlmABxHcM2Gt/LRFbEYHvPQTSU4LJf2/Fhj8cYM08z7ftL9WtWxqma3FNtxsFC8T8aI4U2r8BLDWg6XLhZtzjDSqY8DrTPFAm/N0HyzmJuvKcIggCA7mEWqypgjDqOulLIZNndXkSn+MQECvuYNwkIeGLZLFi/vrrFYKnpZRkIVehcdPDfS86ih0XJf+/05lMIgXT5989GxHxLQz3mxoa63IqeKLv40jcCEPn5YFTkXTeUwxZo9Nhs0dUbteE3k8VYpAkZxnW9B9zs/3cViKXFP0AL1PjPrTsUajd0BrpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAOk9vmIjZ83UBazKFcEE/mWCqaD1NH0VPSwJErQwR0=;
 b=cAQ6f2Uwx7mKBUXZbSrwdoqlTC39nmsaXuHzTE1AYb33aYtY6cl4mciXHVwJDuFqT9HJ+T5/5HKaDn3fVOnt2UdOssXozswrIkqSrhB90yVLsyfKsrx7qIlalM38BF7I2I/arH7s/NPfOJZzJWUJ/wmYmfV5A8Zsyx4yE/2XdEDlbkPsP7Sb1wh/pNeyLpBiTo18Q1UP96pIUH3IIW+IPkNOGybmk+M/0ck+eK536+ifjrdFJYP3+uC5L93zHeVZvecsx15Zy12p5NVJ3fdnPzzh0SI1npIymE53jXWHD0XHoTvIaotjBU91gOURw+27cvvB7lAg6zaSlnXE1XlTvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAOk9vmIjZ83UBazKFcEE/mWCqaD1NH0VPSwJErQwR0=;
 b=s9ZEe3qGTHvF5g7mw/KI/Tkgg+BMIlr6cGsjNAIOs6mz2MOEc8Xee6Yqb1HFgQh4ogxb3tDCpvRWlw4Dy9j95OXUgJGpAG7KdqoQieDXA8tltOE/9qZiPxEjMjKwJ02vJhClVlusXkdDVsru79LgQEAOYUHnAuhJJrLv2P7o+vY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 DM6PR01MB3849.prod.exchangelabs.com (2603:10b6:5:91::26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.20; Wed, 22 Feb 2023 19:36:10 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::c6ce:a93c:6bfa:2ec8%9]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 19:36:10 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v2 7/7] target/arm: Add CPU properties for most v8.3 PAC
 features
Date: Wed, 22 Feb 2023 14:35:44 -0500
Message-Id: <20230222193544.3392713-8-aaron@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: c69a887e-80a4-4fef-ae68-08db150c0cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YfV43tqgiwtYkMwK/JxjyEGfnIBEAZlmMxEhOEWXB172YClSGe78pwxPj0Mf9o8gci3jbKonzTl29SA4rwy2lvk3FI7O3OfuvYwdtOKkSgimEtJ2M/kbHgiR4XGqFpkAVaiStUUKCJlSgzh0XsSvs0UFvNZBxTso4uJuKlo799k0G3z3qO3Gfs7p1919ohT+dNspyDboP6VQ0QPsqjDBAnEAT5Am+NaQogp5Y3P4Fy2CF9Bwd5QVOiALYPtUgzeoAh+R6cx22AOFZZyIVdki/z8cvf+9s9rJpS0tBjyL52jjmlnj5Px+lNEEPoqUrPIjvDeqVycIREjBTBXSM3hmXM6WR19qJZ3ScVgcvbK/fdy5FDb/lq3j/amVTACDmHBPaNp57+rp8Lz1TXR0IrD8qqiHn3Ti95XU6XXWECz+wqs17a77GKkmDHioNAaAs2rwtU5g1TSnd1ITibx6LZhV4I5iW/mSvOGA2E5S+1GC9NeHzjFc/4WGs1UNjZqo2gSUMZ2+RLHvMCP6mZxb4Y8ImLGLsOuOLFx10nutokx802tQoo8LLuj/6/VIpUdPO8BuQWhtfusfqTduJsxPqY/wgh3Ofce7jxXLkmEWANL+opF74DCR36h3btOC6VrpGzuqoa2x1IbwYTsf9S6LuMrztK7M6XRdStUgIc1ibwZddOTWl4/XkVfNaRuKtGfqb5foKc6mkfJyzsyWxsnT6G/86Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(346002)(39850400004)(396003)(376002)(451199018)(478600001)(26005)(6486002)(1076003)(107886003)(6512007)(6666004)(6506007)(110136005)(41300700001)(86362001)(66946007)(4326008)(66556008)(66476007)(8676002)(38350700002)(52116002)(316002)(2616005)(8936002)(38100700002)(5660300002)(2906002)(83380400001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r9mqetenoY0tV7+tA8MDDtvm9a0zDwkDn3NBPO0tF54vYNnkSOF/GPobfVQI?=
 =?us-ascii?Q?ac2FWnTcwIuvauhDcsEuMKkQDfuPbPliyNkv4khX10lyma2DUhpXxNI9T1un?=
 =?us-ascii?Q?NEl9fPSVKbJ0PI1WsRdh1GLzp3YYJiBZJUsQInzzdCDInog6k5keIYhgsNtd?=
 =?us-ascii?Q?56nzaHpUJVQa5GRTTZ4cQByXEbaldskM/dEYQS7rbPTKuwIr1KA+CKx8L3gS?=
 =?us-ascii?Q?NcWttSct/1RmN2S/JcB3eIQxYjMGkkd15WOXs0N//O7DkPxOLuPGrC8VrRvp?=
 =?us-ascii?Q?JiV/eRfUw5UQyXeHBbkry55lZo8zfcl5BbvZK6Dm50htgDKQicgACAVtQMu/?=
 =?us-ascii?Q?w2b26bAWC5IY8YH3NINdqSgiOV8EQ2pCycY1EngO/RcNnoh610UCSnZLeral?=
 =?us-ascii?Q?CKQXBAPwJ00Pw7trOmSKx63Zj0gBOPEZd6Vg7LTiV48+pN+E9XDrwKOKdTEI?=
 =?us-ascii?Q?efcXDJi5xaZQDfctSIu8P6K/8A7QtL0q+IwUcsOYPbz4r+Vi27EFb3gs/2iJ?=
 =?us-ascii?Q?qV3Ztrqhlt6OnmhfxV8GDTrgbZEu6biAGXPqFb5XZSp8k6tz2gLte0I/piHm?=
 =?us-ascii?Q?VFDKRjyeaul7VMRhUl+RPvpMqhPMZSb43AEc4NLCbWMpHhGgLoGnHNUYiiEK?=
 =?us-ascii?Q?n1uB3bTiH8N46e5xdlVF9uvbUgDghOqla4G9rnKll0Sslr3QNFZzGkXUL2Vy?=
 =?us-ascii?Q?iOZIrR7AI9YrhjxnMxRKxNsuu7mfn3VrbRFd93UbsskRQrh0ffxUkyMxmWd7?=
 =?us-ascii?Q?IT4uyXFmkDC1rCWgGxvakmw6YTLT50lnO/M3Sou3x21pUGlHSIa8ki2C0vEE?=
 =?us-ascii?Q?R6AvK8lyzjTjJLXhLDl8xlom7OsA/k3WI1+R9dK5wwxHXqH7GIY060UvjBGY?=
 =?us-ascii?Q?4pkCamE/Nkt29fge7cfL0P4mERtOMLuXJr9eZZEv8jYcJtA6MoN0ocO7yYE0?=
 =?us-ascii?Q?Ew6lFBw77jeQkVVh4Rmb7MV1VINpxt+kJ+9NzIdql+TtlJvQCFYHRwNpaEJA?=
 =?us-ascii?Q?JnTvOTIjzeesfn22xl68MdMJWDVhCfH6wl73haZfEFFMs5bsliirIk2wlpQ+?=
 =?us-ascii?Q?BRu+/MKxrPZRDuDvi9aGX+B25OzcTkLldfklo8a6LHE8FGsGU95uf+qhbyt/?=
 =?us-ascii?Q?lcCcMvtXeokTL1QnYter2I/nLM1m2txeJrZAUFUiwiAZ1D4IojMrYcegENgE?=
 =?us-ascii?Q?b0sOb7MhbDn+yWSeS2njVdEMYuwk5FxmaXPVQ4RlRToT/GTrgz5nOPR/o5cy?=
 =?us-ascii?Q?2xIcVjQx7CVhvJtiJZiM9qhTB1eFGWUHaeMvnJh2erIDuBpqvbbsx6LacRwO?=
 =?us-ascii?Q?rkSZDwsSGfBofk8jYch/fQDibOSXDJLZbWZEo78PUIul+oLmDmfYQXsBKG7X?=
 =?us-ascii?Q?JQVXmsCEOuNs9Drzsa78m9o2nkns4pyGlwsNqRPbtiui/2Tf87ucWZwDUT0J?=
 =?us-ascii?Q?F8vUOV/SKUJwhlwLX1dVAxdcL+fHNRY4pgHesIYd60MkOM9VMryp5GItdQW3?=
 =?us-ascii?Q?qeLTCIY2HLXxI7Jhp3jH91LLnattWOVZzJRl3OPC51lS8Yq307j8tKmhQ/vO?=
 =?us-ascii?Q?6UI5rDJ+61IJTaANc0OdVk/JW41J3OYOdH4x5CYUBkNfqYtQUbUS1EjeJNoU?=
 =?us-ascii?Q?Q/iPIj5XrLjTLNG3SOlWM58=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c69a887e-80a4-4fef-ae68-08db150c0cc8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 19:36:10.3201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /isZvKBXPWaUKfab6GheyqF1j+nUtVyWxw7Cq9wTD5cGTixKJ0hcRdTcHfK85K3jdvM1nGuI+aWew0+ythLirwTWphduo7JImDuMh4NUnlmGydMBIUcQ8ue28TMu91r/
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
---
 target/arm/cpu.h   |  5 +++
 target/arm/cpu64.c | 81 ++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 72 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9c3cbc9a29..40b4631f11 100644
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


