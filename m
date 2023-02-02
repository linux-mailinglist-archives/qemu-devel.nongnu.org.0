Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8086888CD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 22:13:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNgsI-0008N4-H6; Thu, 02 Feb 2023 16:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pNgsE-0008Lx-O8; Thu, 02 Feb 2023 16:12:02 -0500
Received: from mail-bn7nam10on2070e.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::70e]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pNgsC-00088y-Js; Thu, 02 Feb 2023 16:12:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koTgsjxAE/xwrB7dL4Sri4v9maL8dd39ZZt03u2vqW19kRCsZrMsn0fwnlGlPTrAbvFW8JkIHtyyY84yDmcf3mBw+obZSOFcuP9vqnz4lIqfXptrMnlXaQ9YifGO/9trJI9EGphChXHD5KLd06FbkLJhLxag9GW687tMhjxmJ9CxS4Hvzbwuxuz/n3tXuy83gde1w+cCpglOcjHSXVpoV3owLBZNc2xLe9t4ElANIZikt+WJ7f5gVwAD1L/foA7NuyybKLPPPEgM1/mYR9TNjce1I80H+W7Na/lotPBrq68AWRfMwCjDnaQ0tLkrLhxuFGxXe+lmmNqFXaCkvB6SZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8Jib0CT16EgJgspn4kyp8jbFpu5y6fJmeqI7MTZH9A=;
 b=gt7ukJEAVWG4TWSGyCyGd6stEFpLPbVEpoSRCpC7+2gz+A9go8U0Xp9u9pQ0lGVg0VxFrfhcqtuXnE+a0ylaxSF2jpCg+7Qgp1lJlV77mXEa0Z0Ww/KZ75ECPZfVXwXYWDd0/2AAWtFbL+QhBkQamk/ZaAvAlG+TueQxC4SS6ABxPGsZ843HIV3ImshbO8keNYWbajB+zbC2/LDT57XxPw1X2Ti3uupvjttK3n/6WzIpX3Fb3wONgRzD9Z29wXQjVyouR8iW+AFyYKPWTQRYHrUUk1KSXGueY4ek6XrC0RdLmkYy3S1rJx66yMsQnVc44gv2z2ASYpRCT2UaD9iziQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8Jib0CT16EgJgspn4kyp8jbFpu5y6fJmeqI7MTZH9A=;
 b=El7jEKFdSfIkeHw9QejHY+JCHp8T5glK2RQQwNMrlXjt9yZguyQKnuCsQY+smB88p62egDcpaR2+MmesoR4qkXU5iZxUPVVhvAWKDZDHqtJ/xjWChZADcaT0KHYk+lgmZilXpPzfQnWHNMYSxLRGOpcru0pHO1Kfq72u/zwnHL4=
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
Subject: [PATCH 6/7] target/arm: Implement v8.3 FPAC and FPACCOMBINE
Date: Thu,  2 Feb 2023 16:11:28 -0500
Message-Id: <20230202211129.984060-7-aaron@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4361dd67-294b-4e69-0512-08db056217ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hImQ7mphiN+pdqh/0MEeZdj5b7GjG+m70o0DdmL58WtSjY6L6YAVgvpd74rmm9eAWb9kl3yd2BuQ4p+H3AEwGq4cDDdP600eSDXIP6t9/J2y+XZPNb4TBzsb51HKvsjo/P8KATPYh0OsH9AaNHzROy8Qy6EL1MBJ0en2yDnrEscHD7dstZOyjWAbk10uU20jo2eyisD556GpcAn/247pT9Tp9Yc9pREM9lVWEaxWdBAjcH9DQ8Xc561eFvJPGk6ghtlaQTpr1zu04zjbtanTxena5VGXpzJQzyLlAvOw/bqZ0wYkGsKnRWlRvPDo7Ceysay0OocSm5jcPGkRlL+6TV0MOX0YrLF7anGPG6WQ3LBtcyflDz5SZS747gTLnh8T0Cp5YG0wYcNqyX0CzhpMYqRShFVO6WB3LsKzdZIo3qJ5za8BPq47A3VZ9AdiHg5cqLzql1WRQT7A7suRiR6y7am06XGK+bYfHv2V8JvNSnLzZwFYP8ijcKCRJ5cinSeTKyu/Y/JW5d4i+GzGTBBNfF4K2v6o16JSfOgy0CYcQ/7fYkaQJuEyxx4/z467Rug4UAhLmvIdPvjwpEzJ2g5+4/bjwZZmlswmjuHx616rUZ8NNRxLCqIKUxciOWJwXRa7M0Y+Ed5cFvWcFGtpAkTwpNtOA2Dskxg68Zd0ujIon2TTSHw0FKIFbimO5rBL2Kf8wd+30CRHCHsDgvjTGVLz/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(366004)(39850400004)(396003)(136003)(376002)(451199018)(186003)(4326008)(6512007)(26005)(1076003)(107886003)(6506007)(41300700001)(8936002)(5660300002)(110136005)(6666004)(316002)(52116002)(66946007)(86362001)(38100700002)(83380400001)(38350700002)(2616005)(2906002)(8676002)(66556008)(66476007)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ARvyoRyECC9yqwPEmNJ5pkOdWNsAawHltBV9tWa0yyWcINBAKB5pmHGBimHB?=
 =?us-ascii?Q?VA4j5zsIvumc3792o6R5X5sr4A1xQEyDnZb+4EZTNFYxxqkshUuG8Ycai4mY?=
 =?us-ascii?Q?EKetVwkHexWr2zKyJ5bdEeo9D8zfGreMK++hSGwrebcQH1kICH1VrtRkeBkX?=
 =?us-ascii?Q?FHbiPOND9IZAiReqIT/HUTcImuSdxhz/eTnNB/0rcTPLW+6iClmzjhvwVR6H?=
 =?us-ascii?Q?PHNnSwTE9sSFWbcVcWYJNcB4NSh/9M1BHu+8/i3/wEe/4MmHLSS5NagcxlAl?=
 =?us-ascii?Q?i8qhEOfgM7fssVi+4RQZAwvBAA1Acr86oR1MZQLOvCZNJfFYDobl9mZEDBcJ?=
 =?us-ascii?Q?z1uT8TZvboqa5QygcGogCsJFCNqMrSZkCn+CkaxfIrIr8p4HJCAvU4KFwe62?=
 =?us-ascii?Q?8w9lJd9hoPU3S/Zx9IcrkvSwbEuPoaT3ZJu+tRx80/o8sfw4SBqv/q75+mWD?=
 =?us-ascii?Q?EJLeY3N9HnjlH7M9LTZ0oY18QutiW0hj4dzVn+8X4bz2PZHFyEbjy9jHsoU4?=
 =?us-ascii?Q?/N7hdGwJaS2mtJz9nPewuPlVPKLQ7eTiQm5LNZnuTOSsLkj6saPOuPOYbbLF?=
 =?us-ascii?Q?NdE/EC5gUAjRh9VA32+98Q5B5Bw481JbMCHiq3+UjPXKAx0Hc+hPdqSS9sSc?=
 =?us-ascii?Q?zZa7yD7Ds1+c/b04mDZFLVWtLfbhk4RKdSKFHgwAeaMGOOW0hhVVQ/c7fmgl?=
 =?us-ascii?Q?GEHk5JZgx/Ce6EgFZA4yiWzr9j1TCQ+9WZoj1r0x3V8daq8LiMy1yhDM2Uy5?=
 =?us-ascii?Q?3++QqvqJ4YM+hEz7gd6fq00e7Rvm0J4hLnbgCt/OrU9ntfBvL9raiVgSz3w6?=
 =?us-ascii?Q?k4XuMN7L1k2dUADipnhY+AHB21YayDz8Tsj9t4Ww+uWKf9D1VAT34wIwSb8F?=
 =?us-ascii?Q?mUd74kQNkBVwciS1Luc4rpetab3nXTc0npq1xDXlsMx5SXyD1MeMY0/a3X2O?=
 =?us-ascii?Q?bXJq/VoqW0aobdGGY2Q3+uP6JMV9XLqfyaqNDDa8zW4bTqn1SlVtkFmgFsig?=
 =?us-ascii?Q?nDcjdBIJ7pbgDOoaccSIm6o5lvFylHWZEFm1s5vXDjRAL8wgPT5TdVu2+3Dy?=
 =?us-ascii?Q?HSqknNEgUDENaQEJfX28cifWjsmCdCjS9sRbihsVZQAdoM7Tqq8y1pDk3GPI?=
 =?us-ascii?Q?+Dd0yN9UTpTyO7NrdViR7dLceam0cH8zAegEVD0MxRMHYf7+ZRAYHLWdNS4/?=
 =?us-ascii?Q?8BWLtTX2QRoSOo5SQ59vl7zomXU+dtxAneTLAImkV0a55PVm8lYsMgR+eeHf?=
 =?us-ascii?Q?OqcLpS13BrqMj+7+6nZbdsDdzO7is1MxzDEcMladdiRwWMTHtRWv8V3Prvln?=
 =?us-ascii?Q?yD88cwlczDaNMgoyRsEGJnUjV7gpYbURuJSltnuW9pAcbWU49FoVdrSM3OgP?=
 =?us-ascii?Q?m+z3hkA8oS4zP5wMvzyWO/8F1/ZiUE0FgOjjkgxfH4qpKyP9twTxSqo37faB?=
 =?us-ascii?Q?l+i5e40oCUxZpUWm+27Z2KmxhGZ+8LyFrMt0kCOSz2kl3LAix6ymvx77Y7BD?=
 =?us-ascii?Q?PehKKxdNuY3YWAXrSab+rNTarpFm9zD3Wkydm3UPvGJsWe84tNUEs2OBB9M1?=
 =?us-ascii?Q?joUGbjwdfsOw/HT7eKvk08jzqhw4mu6nJBaxFZCjmxx6KMFIETwDsen3arOK?=
 =?us-ascii?Q?bRDfZAlqLFIAm93jI56DdaY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4361dd67-294b-4e69-0512-08db056217ce
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 21:11:46.8774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXNdUFPUPTKZioNDik4Ji7GUs+axQYa2IBgT3ihWrXqUv66XfzMori4VkL3LEa3pyhECdhNJt49FlD0Dw0+pbidtiyUQpzQ72IGibkUim84MZXnPxTB1TqZXMPTtNT9T
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
 target/arm/pauth_helper.c | 26 ++++++++++++++++++++++++++
 target/arm/syndrome.h     |  6 ++++++
 2 files changed, 32 insertions(+)

diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index 66dc90a289..3a2772de0e 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -385,6 +385,21 @@ static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
     return deposit64(ptr, bot_pac_bit, top_pac_bit - bot_pac_bit, extfield);
 }
 
+static G_NORETURN
+void pauth_fail_exception(CPUARMState *env, int error_code)
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
+    raise_exception_ra(env, EXCP_UDEF, syn_pacfail(error_code), target_el, GETPC());
+}
+
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                            ARMPACKey *key, bool data, int keynumber,
                            bool is_combined)
@@ -403,6 +418,17 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
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
+                int error_code = ((data ? 1 : 0) << 1) | (keynumber);
+                pauth_fail_exception(env, error_code);
+            }
+        }
     } else {
         test = (pac ^ ptr) & ~MAKE_64BIT_MASK(55, 1);
         if (unlikely(extract64(test, bot_bit, top_bit - bot_bit))) {
diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 73df5e3793..885a85735c 100644
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
@@ -221,6 +222,11 @@ static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
         | (is_16bit ? 0 : ARM_EL_IL) | etype;
 }
 
+static inline uint32_t syn_pacfail(int error_code)
+{
+    return (EC_PACFAIL << ARM_EL_EC_SHIFT) | error_code;
+}
+
 static inline uint32_t syn_pactrap(void)
 {
     return EC_PACTRAP << ARM_EL_EC_SHIFT;
-- 
2.25.1


