Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EDA3C2A39
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 22:15:41 +0200 (CEST)
Received: from localhost ([::1]:38960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1wuR-0005eq-Up
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 16:15:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m1wsv-00050T-8C
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 16:14:05 -0400
Received: from mail-bn8nam08on20712.outbound.protection.outlook.com
 ([2a01:111:f400:7e8d::712]:8929
 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m1wsr-0000xt-Kc
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 16:14:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIlg0hVtLqqce1iQsH6KuTBe6PE6jAoba+6AWPy/z+ROMYl89R1fNtBTLauSa5K5SZjZzO1ICQ74m7XsBgCZ6KszHR2hr4tnQS2Bgpu2Gu/ANvGJaYUZ2FpjARcgAy1YDBeO0J4TvV7FCPyWsvso14igPTMczPmRxTa5yvyLyscHAKZS674lZZNaUe2rO+SFrPQHze3iYgj2DYkrFv88eja71DEJ/frcqLBM5QFCwHONo1e10j56yFSiBDcKuYSvwubq2MffuAvqrshHYd4CjkKicKYgKgQo+daqCeaJl9unHz1x7ITLQAA4X1YQdhH567nOcd1AwRzO+93bWfdkkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNJd4zVsKBJEvSpvlPBz91cCUSPhGqxgGs7dwp2uB38=;
 b=SY152Mt7YQfQXdbrap929f7VKmuOdct1F7s4ah0qfrVpR2vtd7HCf7mgp2v2Wm7OEjvVQtaMA4CsQWbQ30wKpzYN1gEKDV8Dbz8AEzz2W6hbLtETliZ/PT7cE+dOy/uLKWLCupCda+vJ5UFUlvUdt5Y64EpAGfr3va/5E9VsWhfst+c+ZpBCtAd+LSPCqgk/Y2O5nPNLY6pbClAlTgci/Y/ql6YWKHWIUC8LbQT9AaIqLsXzWxLUCMPIvRuxxWD3TsaqcW+HDz3l6bXCeqX7t5ersJbMntGfAXDGcAm/L247Z6+VrNPU9HSD77nD5e56NiVzWHU52BwiekB0oYa9WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNJd4zVsKBJEvSpvlPBz91cCUSPhGqxgGs7dwp2uB38=;
 b=6AFypNRRgxHXsIwishP7ud47godFL/5SI5r1ArTdv0eRjd67ly9okdXqS9nEbItS8VnZkidEcJ0y7LQsw3JdyPMVmXECuMC6/UPXc7vz9GzKsLVyafk6QXGODqkADqIdVv1eYwy1iK4QY/s0fftYiLT6bgTPTLOYV1wqYHys1M8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3854.namprd03.prod.outlook.com (2603:10b6:805:6e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Fri, 9 Jul
 2021 20:08:56 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4308.023; Fri, 9 Jul 2021
 20:08:56 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v6] fuzz: add an instrumentation filter
Date: Fri,  9 Jul 2021 16:08:44 -0400
Message-Id: <20210709200845.22610-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR12CA0034.namprd12.prod.outlook.com
 (2603:10b6:208:a8::47) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR12CA0034.namprd12.prod.outlook.com (2603:10b6:208:a8::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Fri, 9 Jul 2021 20:08:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42a1f6e7-7cbd-4807-3063-08d94315618b
X-MS-TrafficTypeDiagnostic: SN6PR03MB3854:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3854B24F032DDED4159BA72EBA189@SN6PR03MB3854.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qJqrBF7H19m+VX1+NGI8VPQ0xv9Rootp/aWEu4vcP1yDeeJ5O9ZZXIUIWORNUarTBjPOrv9U44yam0SNMvaqwlkGj0qz/HOpAgHj0gcLiJYNjUMqec0GlSuFMQCvEdg+tRI2PZ9ncjQeh5g72MqLnjESvR7W6ipUW1DTbBhfHi0hlHS/u/Cz7Huyb2h5UQ1tLVdqvwKnyQanZfj+/0Hk57/EJC4Fr2jXFPW03HsN46BbhoKMBCtXvGhKUMUrn6BAsiHaQdirnaaIt+XFjvSlY9zHgmdNvnFOs51hvJ4BRfAFzSEC4QPiPr2ElE/fDBoupGNurx4ry3fhurXEAf/9ltYLsm1aZbvq2B/53mLFd8h42jW6WVls7khKWvMRluFvojVEuNUCKhRYMrGVW+13WGG0sWTIW5xXrhgPLzxf5KOjNk+LDqK89mp1IBjIw7TkrH5FZ00dUNFtrCnhNHhpUErhTf4FxkGvMg2TXmRS2FN6KNYmQlgmHE97b7KYlCmF3sEZ0GkQg6d6sLHvJj1WzXZwbHMtUEvkGGAuyW/Q6JqzukB3xdBckX/BiSHe8yP7T/EJlb+hwMbGDW8bEqnjlvrUdDIryrhsNKE8o0XU3WJ0lu2a5I0mUyrattSaTwGKCt2qVDnAL8U04CWsynzEirRvnF7jsZYTMCl4kr99mQs0hvXYYC+8zxxJ8oMeAFss7FiIKi9EjX7aQczNx6DN4Nwhg12L3C5F/6j5+ZJil9oG2k+RO7O8ja06IWIGBGZn5nksiEQ9ngYJJ+EM3X10NJfWVZHqKxlGjk3OdJl0JKW/ERM7Loo2ImTMh8KNeztp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(66556008)(6506007)(54906003)(1076003)(4326008)(38100700002)(86362001)(83380400001)(478600001)(6916009)(8936002)(6486002)(2906002)(66946007)(6666004)(8676002)(38350700002)(66476007)(966005)(75432002)(26005)(316002)(36756003)(786003)(52116002)(186003)(2616005)(6512007)(956004)(5660300002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m6JXPOyd+QfVeJy//8B4L+oRRA/9uT5y/WEULMKoqmvZTfC+koVq42qADuSj?=
 =?us-ascii?Q?YRHXsvEMq6N8GMxvrPtV62/hynLP+HrdE2ubhvXg3ZDEuUZiqSbrfz77ikSI?=
 =?us-ascii?Q?GTyociSBECy0G55iJJDahpmHZwWpwC3bMb7exmNm2zZ8wYbOAdP1Oz1BX5hM?=
 =?us-ascii?Q?IDHyEeurvv8xvNPNtb76pFv9Pb9/DFD9DkYHjeb4ExoxB4a+Y1PlzwVnZ7JA?=
 =?us-ascii?Q?RXLY1/e/TmDabkwcgzgKdoJq8emO821ND8H0SaMEZaNYGtBJXxZJiw/LfzQK?=
 =?us-ascii?Q?+hi/TJcWxxyuIrHCjTiH831HCULCY/5ZE0xrgCPdZQURkWSj0YHAScgLLHRQ?=
 =?us-ascii?Q?YqPaQynl1pcdoJ7aKLzZE53NbjuBxujWxxPCasj2fnl+zJ4cI9g3sUxm74Hr?=
 =?us-ascii?Q?OuEJE4iHVQPR7Uli5dNLk5ktVuOEwkk0ijmjh2nxDkpVHmH9nRCA2Gm5uJ+v?=
 =?us-ascii?Q?vWgkEzAk8GcIFrrYv0bBSkDTSTTgSj+hOApoU1fM6MlFcfmLY217JvYH0tex?=
 =?us-ascii?Q?8bQcG+kwnvxCrZuIRB8wt2thToXyUo2DLKW4N2vqnFoXF3cNF/FY0xRoM/qE?=
 =?us-ascii?Q?RHwCrf7JXQfY4d90qqqJyWSgb7gS4TyL8qWSMgPClefZ2YdqS1ZFP+z30t2M?=
 =?us-ascii?Q?sY3tOzFfE0bWxdpire0zWw6zkAbi+oAq0P4LpQfNqff08YCuPVf0rLPQMdes?=
 =?us-ascii?Q?BBH/H50ntNI7hg0QWETNG3FGLipB3TtHb58OGwKDI8F7g8jX4kYxqvZACOlL?=
 =?us-ascii?Q?3rTlRurv15QEpCtdK3bTV1kt83WTs4lKxaLciN3ROuUipmPvgsutMFhFOA+H?=
 =?us-ascii?Q?BJukGACTjeSLw4Pl1wFXkUmyg+/bINbnWtVEwGyactP7ywdUCb3+OAhGd+kL?=
 =?us-ascii?Q?fxwk4nXUhuVPiSjKxuu599nWXnO2rInzLw8Ez51RU3Br2YFeTKCuUeIX3Zx+?=
 =?us-ascii?Q?He3IdHBE+MjhUN2r//Tfny9HcK/2xv7nMV8pfbmOfL5JK+/Kt4Ax9o4kCkc2?=
 =?us-ascii?Q?wanzdNaMzbHcAkowDsA6gF1mbdGg8aJS1Ae/o7tfDdZPY66nH1LS/pfCi8lX?=
 =?us-ascii?Q?fo17u2CfqfyPlppiabhLgWFnx6cDHuQyd6uQaYBGrAB6wIx2LbqOcAJ58UBN?=
 =?us-ascii?Q?FV/roY7zTioEcLUfVv9rHqm0buZZda2+NjKK+bmcm2OdR7FJXMgqKyXT5n43?=
 =?us-ascii?Q?ZdA58bQsyJ5WFkyiyKHlAjltgMtMeLrTFqrvlvVtQy9kdqQJKAOkrDo9zY8C?=
 =?us-ascii?Q?PUSFqNIDR1CCPpiY7aUg4K8UnfHyb1EuMRZyZOYFGh6tt/O28te6JX26WTdM?=
 =?us-ascii?Q?xpX0aVrh4YN+KJBaaSrBaae3?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a1f6e7-7cbd-4807-3063-08d94315618b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 20:08:56.2200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWOOm0kh9VlEnft0tpPtupwxVirUEGnx9ASydwfYkbrUN3Ao0DBOv9j66eaV/Sfi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3854
Received-SPF: pass client-ip=2a01:111:f400:7e8d::712;
 envelope-from=alxndr@bu.edu;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 darren.kenny@oracle.com, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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
---

Hi,
Resending this one, as this did not work with the OSS-Fuzz containers.
(The instrumentation filter support was only checked/applied when
LIB_FUZZING_ENGINE was not set). I had to shift a couple things around
in the configure script, since this was last reviewed.
Thank you

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


