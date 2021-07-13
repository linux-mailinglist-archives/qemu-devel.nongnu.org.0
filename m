Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148A43C72C6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:05:50 +0200 (CEST)
Received: from localhost ([::1]:60288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Jyn-0004dV-4v
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3Ju3-0005Xq-LJ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:00:56 -0400
Received: from mail-dm6nam10on2119.outbound.protection.outlook.com
 ([40.107.93.119]:62877 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3Ju1-0002nJ-RM
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:00:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gk//zLFIroQwSkeEbq4YMWHSzz2bL3aMSPNMVViwtyLhtdd7odHOGqnEVTjbMRAWgTuviJPHmnCK4Omqy5QZbScPa8idAzSnFMn+jQooRTbqjiIvR9//v1y5KznB94x6jZuMWVaqn/1sRTnCxsHVon+snhzvS+1UG/fS6qxQ/xW/H7HWCSBnyVNmfxII0ZyqFhURaNCCc6Y1arii1BX72lnlJIZvOiqorastrOKYWBA09xkEHaNrwKn7+zvrF5FThOokmF9TT2Gr2R8AKr1P8lbcyNQ3VHiTpm8lIpOBX01lZO0ETEJMa+XweHwNG7uc1bmBRwPg9LO4s2hgC3sEFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFxHskgv/DDhlRtMs0bUtJKw4NKSMc85hmoXTLn2nII=;
 b=P0K+RmCP8H06qNtUUl1MF8w1iRoKnlVJB8CbSrBOxby/vp4w7xpV2vmKYFHVliifjpk44fiNX/NLOVeUKB1InPje9flVvIleIfpVNXUAVfYXHkmx3P4SHZd8BBupAWngQ8ofPr1ZB8HrQhh7ideIa1/Uy5uKUJzNWmLOwFKI/1ERkQRFjjvSTOP1gKD0VH7i4lkreWZrN7STbHQIUD9cs10WYbEzolTI/3B9q3NHfPpm72TkKWPe+D8valHwC30VS0re2+R9c11dkFeusvFiRE5gagaPeOY/PBKhaK2GpA7ixHPsCm4pHI6gZX8DlzjMoYlR1Bi6R/QjXKFawPb8ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFxHskgv/DDhlRtMs0bUtJKw4NKSMc85hmoXTLn2nII=;
 b=3S/DhnVoO8wF44oyhrBqoYImJsPYcyLanCwsCeyS7x0oqU8YXikiW9Yn8aX26+DMn+czv7uBViHKRfihGGVlIgKArMFhzMuts20RsX42K2/oEn09VLfHi4kf5AfqZTWbEb3C7NPxZQnIfrfw7MATNUmS/OHqN2+sxMmz5OvAupU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5481.namprd03.prod.outlook.com (2603:10b6:806:b4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 13 Jul
 2021 15:00:51 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 15:00:51 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL v2 4/4] fuzz: add an instrumentation filter
Date: Tue, 13 Jul 2021 11:00:37 -0400
Message-Id: <20210713150037.9297-5-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210713150037.9297-1-alxndr@bu.edu>
References: <20210713150037.9297-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0002.namprd11.prod.outlook.com
 (2603:10b6:208:23b::7) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR11CA0002.namprd11.prod.outlook.com (2603:10b6:208:23b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 15:00:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 664dd5a0-9db9-4a26-1644-08d9460f0150
X-MS-TrafficTypeDiagnostic: SA0PR03MB5481:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB54815B63B0E7819EB74838EABA149@SA0PR03MB5481.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UO0vO+rEuu9SdwG309HCDh/tJxGgiYi+rNAPsa/WUcj1JFyamIIe1qZuqVBubN/Q7BblyHry8L6NPLvEGJtTDLYN/HUBBF2XZZluNoCIyuKsp0Wl8z5uBEX7Y1nbNF6i7OD5uQ4pO9nobC/xyUWi3W7kkTjKS1YiLNkOhUcs3lZPFLWnGT5lEAPlIoYb75JywidrbrTLG4DsRcffVjwlGHkpluU5t2NglrPfGjUICejyy+f3LDviZ+yzrTE/vBSViTComDbOW/sOeO8V9rPRsoQgte9ZWPVLfy5bv6dviBkcWNBu1s5spTSyl48X1Dj6jdO0lnZ6P1Ns2xeOK/lvYxPGIK5XgAs0ElOrdgQPErAgXPGW9fACf6k8D3zuDyH15lYkf5e+gw9+YlBp7nSA+WTA8SyLP8hrM201GecbwAHBgRHmvWkAsrtLHqhsIE6ZUcSfMFPHHUVtot/6wi+aXoaoy6TMmtTSZd9llINTW/Oz86yuQPgDyZD7lm5blTVkn7vsVx7E19rzWmo4P5pEuBaKg3ZoxVTQHt110pMLQvc8owQ2CKKjNCa5OQ3nr9S88PjvIBe52iIO3sOKtO95NT3micJSIEDVnlC0CvLUlZkp2TU3lFqG3ZuXJPjG052FE1Ie6BZlaZTPBBfsDANJCzbgWky7z2/wrglVL+BD605gZWUJJY2HYQWAw61/LLodScr8AF4O/EFUD95XZ7FgA3tfRi1bC/GTCW+ohZhLY0deRLHwR6WaPpTV1gpQSustwyv+L8IGaa4iuKLtm1GgwQ5rdIkWsmtrDzLbOVvtZtmCIc4M/XcmjHjzmZqBFpJ6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(75432002)(6506007)(478600001)(66946007)(52116002)(8676002)(2906002)(86362001)(6486002)(36756003)(66556008)(316002)(26005)(5660300002)(8936002)(66476007)(83380400001)(956004)(54906003)(786003)(4326008)(2616005)(6666004)(38350700002)(38100700002)(1076003)(186003)(6512007)(6916009)(966005)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eSpdKO0fVXDV/4oNz9tp4Sx0XUKTUU/IbT7r1El8rxPUY/WKzgvg6q7pHxB3?=
 =?us-ascii?Q?IZOEA/R8pULZyHdXGuXZ5nZE7RTHK+sc+dJq4IqfvNLIRW4avoaMRznEtR47?=
 =?us-ascii?Q?s2A2/HZpiqWg8VQmFM4XhREwXRusikC5cYPGkqBPFZY6UWUYQoUbR/z+1LXR?=
 =?us-ascii?Q?n1t9GLMw32YBm3yqCw/uHkjCZzJEODJ1vvRyq8CmKNSdjXsGWzweU1Fm07Ou?=
 =?us-ascii?Q?v+GMlVmUl/L02U7Z7FSGDKmA9TkfWjGj+4lGf7/frUKTSGfHpLTOEA8n/zHy?=
 =?us-ascii?Q?xFh2LeOub2YM/hGChMhJFBrDLqOFy/ymDoL7qROFY2Wz2f6Ug93I58koH37G?=
 =?us-ascii?Q?HNudUtWCrICLDh5w90sNj1SrYRo+ii4Asaque2qSB/DgPAK8EJ00jycJ1mfN?=
 =?us-ascii?Q?t7L9DxCrePvlusFMSIgUwpPF0VaLTIiU+VKVj4HrNvvgBufgyaEv3v9v2TD3?=
 =?us-ascii?Q?GfF2ny2SlCG9bdNxBE0yli8hHp8VEK//tLAA3YuupCS70gdlbC1C5tEeOxO5?=
 =?us-ascii?Q?nR/mYe+IlK99BHqTUirbxk3X/DHQ4mRey38bdOL7PTWsL42HWsYjdvI3tPEq?=
 =?us-ascii?Q?0zKyibCQj7wJ0KMdmXrqaE2jROXzW3BeDLufyFz93UdSCslRtmXJiaCEIJUy?=
 =?us-ascii?Q?KdrdlKoh39DTG0Kgvg2oCAFkzcK/Vj2efvRFPdt4yAYpMntmbP0N2vIZ+1qD?=
 =?us-ascii?Q?jKwmBp85I5qQAwQjoye9mjUnuvF07/MVfnN+P1cIifJ7cq9VWr2hdXKgVPAE?=
 =?us-ascii?Q?FVHnFyVbjE6ma+MleEEus9iClufs32CpIRbflpwW+BI88pUJ0ainZ2BL8Wr4?=
 =?us-ascii?Q?jPHbPybHfi/TtJB2DDXs8x1Lm2h0Q5udWOqIn3J4eJLEA7tM5ciq/sYku7ep?=
 =?us-ascii?Q?m8122H+x4o6GZv4ajqsu83VrZujK36hl35H5rc/RFWCRgc6229aVr3VuS6/c?=
 =?us-ascii?Q?oqs8mH//n00Egp8sVvTsIFV1JHaxoLUjfCYgOvliUfECBE4DehGYHbMqqSLL?=
 =?us-ascii?Q?f1Dr+VwGgFdu9fqyH6lTkCPFF9cIjWbNH8tx60y/yb+N0Qv+UZI0uUvepHib?=
 =?us-ascii?Q?6AAxxzC4P2CFCEoR6TYmMy6We/hek48+z6yfFQeAZlngHR2LMMWlEyI/IBJD?=
 =?us-ascii?Q?LdsFTq+qoyFXE9MPG2zaQYdkV8fmaChiF9y8c6LhjMRbyhwOcl6HLl6sxbfl?=
 =?us-ascii?Q?+gMsCXRFDGCr6AxWXKbBqnw63ERTX0mFduvDECWFujJySh4Ho8htos3SKMyX?=
 =?us-ascii?Q?JmOrmSYJchRAP7irPKMuAuIDkMElvDgsb9WyqWSjG0cz/hsPuhZqZzeB1Oax?=
 =?us-ascii?Q?ovz4oCkH97jo2geVzDQgwiOV?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 664dd5a0-9db9-4a26-1644-08d9460f0150
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 15:00:51.1894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3CtGkOwO29X9bUX60NJzrrsXzQ/KSANLxElxd0YhzPTpqjpluXkbrVPzXtI21qY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5481
Received-SPF: pass client-ip=40.107.93.119; envelope-from=alxndr@bu.edu;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By default, -fsanitize=fuzzer instruments all code with coverage
information. However, this means that libfuzzer will track coverage over
hundreds of source files that are unrelated to virtual-devices. This
means that libfuzzer will optimize inputs for coverage observed in timer
code, memory APIs etc. This slows down the fuzzer and stores many inputs
that are not relevant to the actual virtual-devices.

With this change, clang versions that support the
"-fsanitize-coverage-allowlist" will only instrument a subset of the
compiled code, that is directly related to virtual-devices.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 configure                                     | 28 +++++++++++++++----
 .../oss-fuzz/instrumentation-filter-template  | 15 ++++++++++
 2 files changed, 37 insertions(+), 6 deletions(-)
 create mode 100644 scripts/oss-fuzz/instrumentation-filter-template

diff --git a/configure b/configure
index e799d908a3..99d6182af9 100755
--- a/configure
+++ b/configure
@@ -4943,13 +4943,21 @@ fi
 
 ##########################################
 # checks for fuzzer
-if test "$fuzzing" = "yes" && test -z "${LIB_FUZZING_ENGINE+xxx}"; then
+if test "$fuzzing" = "yes" ; then
   write_c_fuzzer_skeleton
-  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=fuzzer" ""; then
-    have_fuzzer=yes
-  else
-    error_exit "Your compiler doesn't support -fsanitize=fuzzer"
-    exit 1
+  if test -z "${LIB_FUZZING_ENGINE+xxx}"; then
+    if compile_prog "$CPU_CFLAGS -Werror -fsanitize=fuzzer" ""; then
+      have_fuzzer=yes
+    else
+      error_exit "Your compiler doesn't support -fsanitize=fuzzer"
+      exit 1
+    fi
+  fi
+
+  have_clang_coverage_filter=no
+  echo > $TMPTXT
+  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=fuzzer -fsanitize-coverage-allowlist=$TMPTXT" ""; then
+    have_clang_coverage_filter=yes
   fi
 fi
 
@@ -5843,6 +5851,14 @@ if test "$fuzzing" = "yes" ; then
   else
     FUZZ_EXE_LDFLAGS="$LIB_FUZZING_ENGINE"
   fi
+
+  # Specify a filter to only instrument code that is directly related to
+  # virtual-devices.
+  if test "$have_clang_coverage_filter" = "yes" ; then
+    cp "$source_path/scripts/oss-fuzz/instrumentation-filter-template" \
+       instrumentation-filter
+    QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize-coverage-allowlist=instrumentation-filter"
+  fi
 fi
 
 if test "$plugins" = "yes" ; then
diff --git a/scripts/oss-fuzz/instrumentation-filter-template b/scripts/oss-fuzz/instrumentation-filter-template
new file mode 100644
index 0000000000..76d2b6139a
--- /dev/null
+++ b/scripts/oss-fuzz/instrumentation-filter-template
@@ -0,0 +1,15 @@
+# Code that we actually want the fuzzer to target
+# See: https://clang.llvm.org/docs/SanitizerCoverage.html#disabling-instrumentation-without-source-modification
+#
+src:*/hw/*
+src:*/include/hw/*
+src:*/slirp/*
+src:*/net/*
+
+# We don't care about coverage over fuzzer-specific code, however we should
+# instrument the fuzzer entry-point so libFuzzer always sees at least some
+# coverage - otherwise it will exit after the first input
+src:*/tests/qtest/fuzz/fuzz.c
+
+# Enable instrumentation for all functions in those files
+fun:*
-- 
2.28.0


