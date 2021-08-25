Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F073F7644
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:47:10 +0200 (CEST)
Received: from localhost ([::1]:45060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mItFC-0006Nn-7j
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItBA-0005mQ-8e
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:42:56 -0400
Received: from mail-dm6nam12on2127.outbound.protection.outlook.com
 ([40.107.243.127]:2657 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItB8-0000OG-7q
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:42:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cplGWzzDxXnOaqjKq5xsD1Ch2VWKVx/Q30Y4J+EWdw1HDS8mWNalaTHulIgkAwJGdUMDrMEXsrameUIhwHGm+S3vq7hLSEhAAqQOK8+uVM9R+yyKZDlEtH+sU8NRK8S+YV9iaGQXWKaJkzFsrM0R/7icCBoDsXBD/fouZdR2bGD9SZ7sPs6BBSx3CTw1Uq/nhmsTJuvBr1nb9wR/zr6OrhcGbLUk++zGaOpA728oJwlKOTOSbNQKF++nGkN4MCzb3En0/5OHEU1C/x92lvtXfkhfsPZRFhqOgGJjT5W4IUOE9F5BvDrdAW4U5BPgcE82T0LFRgXA09wEqRcuFZENeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/WDogIKRTf9tAty5g7PKeEQpl5M+V98YbsyCPWHLy8=;
 b=BFd1MZN5uflhPJUhHwMU16x+DhNFP+5JqJuiKh5yDXRfvY8kUTrQSSu2ggolaeHz9d5cGj++n33jfGZ2dGrSAnn0VIyOWQnouyx3rqp7tGaeWMQGfiYcopaqM7i08IXi6DuvDLmdLIbwNfJpWrdLGn3k6Cz70NE1CJ28XkPnfnrfNp7otC/47p9IHoeDAa82eez7JQLPxq256NxDiO2OrhFIQ/Xc5N6sPS8tzhQkqcoK51PygaGsns7bOsJ1TDFeutry33zing+Dcjz+UcHV/wm8EeFmnLHEFNIUES3iEgNsqAFX0vvziDwUrty1LFupOvIWeheg6ot4aXL4+p9/vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/WDogIKRTf9tAty5g7PKeEQpl5M+V98YbsyCPWHLy8=;
 b=lnLT1viokKCAHPnT+5sdfdmstpJdWBP+ozghu+jeZOSKWLGOk3e4+5h0hBVV7JSouIZxdd5bneXgMo5fwVksTBUo1qVhD31MSru3QSGFlvZaS22gr1ojDiphaN2H6dB7Z7/GH/MSzBKO7G9Xc2lQ0YfFlVc+OP+cKy6VNMtIUhQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4399.namprd03.prod.outlook.com (2603:10b6:805:fe::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 13:42:50 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 13:42:50 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL v2 4/8] fuzz: add an instrumentation filter
Date: Wed, 25 Aug 2021 09:42:28 -0400
Message-Id: <20210825134232.45074-5-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825134232.45074-1-alxndr@bu.edu>
References: <20210825134232.45074-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::29) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR15CA0016.namprd15.prod.outlook.com (2603:10b6:208:1b4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 13:42:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fce5045c-66b1-426c-4e94-08d967ce3b19
X-MS-TrafficTypeDiagnostic: SN6PR03MB4399:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB43996240F999842D768555F2BAC69@SN6PR03MB4399.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E/XEqZUpmQjbzkA5iC0gXfC0JvNAB82izzg0cappc50IAuqAlfrHYYBwp86SOLpM5ZAs5cexTcVWQbvoOtyhbwhfThAv1TMZRPX/Mq9wkRMTUURcwhKTS9CBBtyBoWz/+naZSAWMknlIv9aIj2yhXECB7kvgIGdoMQUJskdBlJ/V+sGWSVo21n0oaGDkaMsDXF/xhzHp08jGQOAWsNlSvP2KXbYdq0WPJggBWh057uliYQAjHRsKPvlfT1HsSULF8Bzj0tGuWOf1WyodO6OroevsZeIIkD1ljYrnNwU48v/wkuTZIIEZHSnzlj2EAeoFqsQI+MR7tPpiU3oUgfBEtcplw4izBDaKbIHftBz6kVYIKwbp2EcOPNaiUovL0xNWSaOV/4hnN9jsb3WiTcjxOdC1pA8bUT37qvOxO9Y+bbZv4DDxZJ151XdJKblYayIy8sJYXqyAuYVH/n9gHarK6l4bj+1n8nOCQW1+5qKFbY7ptFjhdVCtpP8Mm/7/nTC0v/lOiFD+lKMetXmqsPspua0IyLXfFwdkONRiwwIyY0B9ayYR8SFRvMoElHubHZl6aSoCboU932tOGazYzC5eY3fzh+0hDsMVbxORMouN0ZtxqROZvy8qzrhV2b+ku6TW6PSbNFhBRyZvefvFgQikfFRiES3uy3aBPOGrhcW9YPeJS1NnXxGLe/bWKJkh40kGDq4jHXHkQg0NfRhUThw99q+Q6UHXrIeN35s4JalTnrXf3/G8ssDUp/YGIh5N1G8lRNLZ72A4UZTvUKWDm4QKbuCXkgEYcW2AsOh6jNJAHWNsMuoDvWyXjpDlU89UeQfw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(66946007)(52116002)(66476007)(75432002)(86362001)(6486002)(2616005)(1076003)(956004)(8676002)(66556008)(8936002)(6512007)(36756003)(6666004)(83380400001)(4326008)(26005)(316002)(786003)(6506007)(966005)(54906003)(5660300002)(186003)(2906002)(38100700002)(38350700002)(478600001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NB78zUD68l8RAoQ8nl8wjwLfCQl+oIj4Fe5RZM8TmbCRM0TU3g8yySKDiwkT?=
 =?us-ascii?Q?3+4I8iZsHAs+PCgEfjqj/fXdOb/337qIue8JLRAeD4nP9Kw7Sg0af0nmevBs?=
 =?us-ascii?Q?UKhHrN2UMHGPeBoH49gGUXXLdsCck6XRBRcijdpASin1acc7vH2q5Y5bJ+x4?=
 =?us-ascii?Q?1HBdmh7U8wgya5PaKP2O/3ZDFBNZJIlFjX+e/RlznBfVtW5xNd2vfPo3LNlE?=
 =?us-ascii?Q?5BMg5fd0AFvRnK8apN6sIaQVqSKt3QDD2JyDp56qcZ4DzCaJjFF1M/UdnpNm?=
 =?us-ascii?Q?jO1BIJ+/q6ki5EhdFKOdMN/C/6hKrtTjmfwXOxXXgAZE7UH9z9Jt7oby9LaO?=
 =?us-ascii?Q?EJg4q10NQShnXJiqYjDOZnTXPGBdnyBi3fuPFgU1gBXCnH9abrGuzoYs+sZ0?=
 =?us-ascii?Q?iQ4x9rIpknAnGrLpV1z/Ec/g9H4hGPlvTo09i0pRopsf7+HaEpSoNvSd39tG?=
 =?us-ascii?Q?P2nXjVM50DVb7doQLuw8Tic9zDeROGGLj+g/OCzm2PsKGgJ1YMTwG6UFuwpG?=
 =?us-ascii?Q?6nD9+XDjAcvaVoB0RH6bSXDDbHiAjenfehqP6f6ybqtfsSsPJgVRTjZnGuL9?=
 =?us-ascii?Q?fAOkryTpHZdLHdACEEuvB+jLwoJZ+FMm6x65Pkm158RgafNu9wlxHLUXyk4U?=
 =?us-ascii?Q?l6G+d+caQaFQqcwUedtoGMhXVHU2XoGZ8G37zimgA2ciyLLRc/Ytlz4BGnrn?=
 =?us-ascii?Q?DjpFatrnX0avSNytPVqd4B/5dyoexZ6W87xrueB20dm6RttelfEZNX/CuJnz?=
 =?us-ascii?Q?iZEG6zdq4D6512aU41p+uvfHPuOGqplVu2v6lAddZOYLCdPNE6bA/vDf5iMH?=
 =?us-ascii?Q?i7zxWSK27MBppkpxzXbhxSD7gCKdc769TRorZc9egg8wa0EVwiXZTDIwdZKE?=
 =?us-ascii?Q?umKABz8qsbxFzwImpaajnk0K4au7fIsrgzR69cqRv8X4wbBKFE4syfhjkghO?=
 =?us-ascii?Q?0Ej5xO+fMTHZCbOqDQOe1t4EkGNH+4G41diJpk8Hywy+vnPim5L+sGay+KbB?=
 =?us-ascii?Q?A/fnoWSEWtJ76LsunoIfHAPXDZ3MB05TJIoBmstW9cwSNYDNUfV16uj6N+k9?=
 =?us-ascii?Q?nmvaW3JUu6dYAuWz2Kh1XT4wAqg0O3O283+hMZDfa5WpOrim9MmJUTn8+XWG?=
 =?us-ascii?Q?hQ3jX/J7VMvFgxlH8HgrkpnJGSSDSDFt1/Y6LC00bpCWe/8HK1hHBg/ag+I7?=
 =?us-ascii?Q?LAVN2xhz4lHYgXohcAVV1xNQBhmqQKyY3c5D/614H4+i7uCZXawFEE+xBRJe?=
 =?us-ascii?Q?DroLz/oF5STEC0DTX0MmNjoxnK/KMd96F2vuNDuDAJVsLvvVI86RUSLO/E7X?=
 =?us-ascii?Q?CWjs6tqNJ49LIEERCkdtqd5X?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: fce5045c-66b1-426c-4e94-08d967ce3b19
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:42:50.4152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SG3Zgxdd0GhCjmcQcP9HF2qcIg3kEfU9Ud77vtg7v6RJ4eSuSJOmH/k53nSSxWOq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4399
Received-SPF: pass client-ip=40.107.243.127; envelope-from=alxndr@bu.edu;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.89, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
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
index 9a79a004d7..dcdbe3f068 100755
--- a/configure
+++ b/configure
@@ -4198,13 +4198,21 @@ fi
 
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
 
@@ -4884,6 +4892,14 @@ if test "$fuzzing" = "yes" ; then
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
2.30.2


