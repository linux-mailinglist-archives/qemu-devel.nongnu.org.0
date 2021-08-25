Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED9E3F75FA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:38:18 +0200 (CEST)
Received: from localhost ([::1]:48522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIt6g-0006ZV-0e
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIt2g-0007t6-Jk
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:34:10 -0400
Received: from mail-dm6nam10on2122.outbound.protection.outlook.com
 ([40.107.93.122]:65035 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mIt2b-0005W2-AZ
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:34:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJbbtI8OsSCjAXJl+NxqkMpGZMX3easK56nyt2EInueLnn4+lXBTYLo2gXyOs/0gaDWE93cwCAlXyZvklrXPVoSeYbYrWJCoUCuAZ/49aOg+3G5e/aoASNBgb3InGaZe0Cljj9DlpRiwtmEq8Mp/QapwxrUoWQg1341FXA9c6YeQ0A1eCEImTfJy4vgCsR/aLPGUpM/dqqKjJcCj3pE0p3AZBTccngFZ3GhYLaS4ZSWmAX6SvgKxUBPaeW7yF/+vl8EENlyuLwHZZg9yLC+u6xhn/g1Bqgjd/80/ZkA8A2OxxIazUqqbxfu5gBB7NzCB3YG4Cwpc2SOZFclTyaUynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/WDogIKRTf9tAty5g7PKeEQpl5M+V98YbsyCPWHLy8=;
 b=LWi02poYAIW/40hy9THRAbjYIRQRniTvss/h+uv3iJ+H6Izm6k5w+Lw2xCKxRplTEpep9Ys9ZTmXatEMgpfZceY7UCadShzosOZIE4Jex7DOM17JVqS8kkJLFojXAFt8hQScuGz/WUWeptRVDC/OU6Vy/i9GmuLOmYHRxD8hKfv/6rB10JluIHTk55bn3Zkr4j9Tht2fsm2Hi48v424JXIevgPVPw8kLbjQZY1O84whDPrk99mRi09u2Wa6RnE7MCrV4bYbqaynYXm2rngX72W87q6HU8/X1XBY6RW0ly0yp77k28GfF1HF6vyJW+oK2L5b4xr4nfxBa9KRZIRSTOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/WDogIKRTf9tAty5g7PKeEQpl5M+V98YbsyCPWHLy8=;
 b=fvBYpvtTLOL2lJ8ncwxQHKGmgJgaOCJQrpNnr4HYMjLc0yGYyNgpwM7sCG/1AeWhTjkJJw2busqqqh9pS25BQFyD4gxNvMv1m3Q+hl4Ia9HQOCymwha4xXHeoDHcArpJrLQCInPtUryedaYvKjyxyFlKpij6N6rsbhhR30yTYbQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4447.namprd03.prod.outlook.com (2603:10b6:805:ff::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 13:33:50 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4436.025; Wed, 25 Aug 2021
 13:33:50 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 4/8] fuzz: add an instrumentation filter
Date: Wed, 25 Aug 2021 09:33:28 -0400
Message-Id: <20210825133332.44378-5-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825133332.44378-1-alxndr@bu.edu>
References: <20210825133332.44378-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:208:329::30) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BLAPR03CA0085.namprd03.prod.outlook.com (2603:10b6:208:329::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 13:33:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 928bfb1f-8485-418a-8c3a-08d967ccf91a
X-MS-TrafficTypeDiagnostic: SN6PR03MB4447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB44471272F5C0750CF0DC8DB8BAC69@SN6PR03MB4447.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nArMR1iFEoNmluwB9z5B+FI2ny3siJVnJWA85OJ6wGQV5tCtKwozAywb2WMZEw5LZkS4eUOGLxPGVhd/YS5qma2up+ttsw+tx8w0bCjxggfn0It6Sq2OO1s/WwBs1DpAExQx+eT/RX1qNFR5jOvCypbr8Okl3420PjVPpEyKP7dwtPwFyWjIQYFWua6ANAV6334ChiMqnxJB1VIYKwFwXFe8GgNkwiX1m5crrYu5YVbA8XoD4JQPxB2/NX6Gq4IaVBito5v+sVjgvDNR5CJLupeNKMYwI+l/Y1bkGZByg0eS5aXWgRTEmK4tpLcPByn+nvT5eStN7et3gc00e/BI9gQ/wRnxfxFks3hRFjzTBR8q/hkDMiTY9t8U/f1X1qrzH3uwcnGOkaJWsK/qeGueyBstw+vsTz48E3ZFGZCizRfO7VXRfDJO693nlwdborwNqH6IpP1RIVE9p7ryg9U1XkwtCCUAnjXB3ZVI10XvPKyxaUyhJzaNta+bn1g00KP173Q7sBL8zrAq/kSIMfQsxQbH0kkNv21SAuSyaaHSpryv0mX7agS24SiMOAgdCkuvIexYuV9CszUjexP0RDUN3SfS9a2A5yXIoQfOrnxQqQ3wykllO62e385dmOlbbkmWmveCTi3j69aHyPMgIvNOineXZkfelXcGjFgwqu75WtXkuOvsly/dPpBrzRwHrD1+BYKC2R+vEoLgKc1CA/S8IgjIHFbV4xfNBVwz07kteNvEPGgKSN9R/jLr8Lv3lMcoNw3nzvO9/NWH1X0J12HiFp53kRHQVBfCNiVuV5z7Jr+iXa47LoYsZ/Enx52Y7b1+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(83380400001)(75432002)(186003)(1076003)(86362001)(478600001)(8936002)(36756003)(6916009)(52116002)(4326008)(6512007)(6666004)(26005)(6486002)(38100700002)(54906003)(66556008)(38350700002)(5660300002)(2906002)(66476007)(316002)(786003)(2616005)(956004)(8676002)(6506007)(66946007)(966005)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?faL7OnVfyHZWNSeh/WuHO+nIBVbCfGgvWx0zESKZIBSe6k2IWguGxPhIvfae?=
 =?us-ascii?Q?Qr/wv+raFy0Rqzv17iUK3qcUeJTNl3Ihic6PDblv5u+eVYFZcwaSZj6CwCWV?=
 =?us-ascii?Q?31IH3I8VnZOKiBo6gPswcyxa3zUmDoaKhaRLNqB/tSO2qoLGvg8IwbaV4enY?=
 =?us-ascii?Q?armud3hyvEx7YaduF+g9mp9vPCjupkVDI4B0P3OSmkzWDoDfeklcYzguA258?=
 =?us-ascii?Q?CHphfoH+QOw5CjfuCxQ6lwtvKY+6S2ccSTQso96ZsW7lZb9ikFgMe22t6ilB?=
 =?us-ascii?Q?BTE0HdqXiqHtokm2AEomYFTB+rW6/rzYeV3/+2mVJkUxKxnIChc5T/4ej28X?=
 =?us-ascii?Q?hFGaNCSCrd8kjQ6KBGDEsAcI4phYWXpwHuLR8lT4LJHhgxNBlbcASl5SZJZi?=
 =?us-ascii?Q?DxmqxqRgC/noyPD5i4VnRcqPv1j8KfiumTiVuHoX2QsckPgc8ydTnjHRNdZS?=
 =?us-ascii?Q?3knoQU4qJUjRdJd/SBII3T7C/0ifYPlfe6hqYwvfgjiV57HspijUrI70Kz+Z?=
 =?us-ascii?Q?YgHQjvFH4R3jL/sxgMZFIZqL3FNlQ/mjBDCJowCMx02/MVXM8IfmvUO0okC8?=
 =?us-ascii?Q?tP199yv56e9nOtfnbvk3yvtgVbnblvlY6/s2vLLu3zTHoCbtDNr9FZp8roKs?=
 =?us-ascii?Q?kmKQKA4O4kDyAPvzSRiTn/G+9hnqnwjruZsKhQW5od45Dn0Uh8gHTvjq+lNv?=
 =?us-ascii?Q?WWtOfHym0n18jKQolaS6E1Q6QpC7We8/mVzu5fxI5HbTWYgKBbnMFUbebzI5?=
 =?us-ascii?Q?SPSQ+so2Q0wpcnfw5OLMgigrXxBL5sJxizagUzf1OiA8VokAom83mgnTcvk4?=
 =?us-ascii?Q?w+E0SLvQqEyAYO1j5qCEGMNd61BKNPd6/rYxNNeCVmr1yRZMt3HdWSt1+3Nd?=
 =?us-ascii?Q?cxeTAD9oJKd1a136saWSLqc3q28PXf2o2D3qJ0pAuBrpRZSW7zMz7m+C0Iso?=
 =?us-ascii?Q?8zXrOsxppJ5VhUwgBwShhBdHG7nWvkI2HZHp9MObqWKN0eZUfXWcDwl//YXl?=
 =?us-ascii?Q?OC+l4BT4N8lHev1D8qcAI70X9p+5/jQFI0alqN6lgk9j5i1gOJkPQeaxNL17?=
 =?us-ascii?Q?4PXADmZVmQjoa7rd0b8+AYu0bu4kD9LzXdn5zzoEo/f3XowvLSlwmiBVYOeU?=
 =?us-ascii?Q?qhOKotf3rYvM1fuzcdp6dNJBdz/Sg91oT6eJ41K3JDLD3RJWQ2tAQ18s1kLx?=
 =?us-ascii?Q?Z5FAka6MQyeM/LchfZP3N9Ls8i0dIGXdYxFeJafqVPSzX7beEF69CtO2hBX7?=
 =?us-ascii?Q?BhgWHMWJArApLvNs4PmRBtHO1ovvggb6YoaFjSSz9Aw2hHF0f1vN3GHZp3D0?=
 =?us-ascii?Q?6jsiP5Ac6Jvphh/VxosDge1u?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 928bfb1f-8485-418a-8c3a-08d967ccf91a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:33:50.1081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJX3aR4K0YAHGU41c6GJRl16ajjcP6y3eELzfB6VIuxkq98Z7j8n/5LUV5KmFBpf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4447
Received-SPF: pass client-ip=40.107.93.122; envelope-from=alxndr@bu.edu;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
Cc: Thomas Huth <thuth@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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


