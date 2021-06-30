Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3883B7C2D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 05:43:38 +0200 (CEST)
Received: from localhost ([::1]:33054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyR8T-0004HG-Ez
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 23:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lyR7A-0002Fv-Ub
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 23:42:16 -0400
Received: from mail-mw2nam10on2132.outbound.protection.outlook.com
 ([40.107.94.132]:5024 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lyR79-0007HD-6T
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 23:42:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkEi15fOonyKb4z4d20R9D4iNDsy2VvqzQjV3d8ct0+hUnT94y767q9XaQL++fIXMh/JBmBmUAqMHZEeuj6Xb0Xm227+Os1BLr5T+BdEt6oRahdPOVUV0gkzbrv/VFwcAQT1JyzbIbHYuFv+0qEvayvOb0O1akEphzpnanBwugw5jA9Y9EV77OPZ5SsvkNC+2rLBiEnYmWnCBQ6Y604OyhvqAhRBIjWeVDav4/F2mPTkC36cBboDl5yhLFh93YozVR/thHQtrkkuI3wTAY0rf/Y+2eVBcMpEHWVid76qVeJdOGQxmihMNmoDpRh/8BQXxjaTuokp41/va2PdFg1CxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZ3lXN4UUz6DzR0OZYz1o2vxjTy3eBTIvXf0Rmu48JQ=;
 b=GZoFFr7zkhypSynYO30bp4YU5S3AS2kGz0N/u7tMfgS6QN+VKCKDWE2O4kX1FaPNvJzRNtdhw8bS1zSSCW44Kmz/7sMMpsouWC7ozsReLk+/pM1GZIu71nh6QGUcH1fWv3esb5yQDY3xWMTy6TmHDfjVuJVFkCMc2ZqgTQm8NkLMdilCp1+fmGz6ty5Iy0yyww5L/mjCuCSXNlDRA4VYcmw3Wpv6+zo9mraUyTEXErZPaFUitvehzDwMekSQaY/YFV11JrVwFNACjxpWhuipJno1NpfBuP/muAShqGdUKUAdC0jBYOgSEK9XsB3nt7MFJ3UYuGdY/ZrwFCNbi/ysQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZ3lXN4UUz6DzR0OZYz1o2vxjTy3eBTIvXf0Rmu48JQ=;
 b=aNvZv5DKk4DHu6CooooF3uj95WzorBWcvOPk/iugODgzIZQ5zfuaS2dfrIyrdMXnXzIKQwMbi4bQLWrRV9atTkXUlGfCj/gVwZS+/m66V5oOVzYpEmK6rP68rFq743nfHLVNQCh/Ycqa05dXreXZfa4HF2lZdMDzR/atEypdyCc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5817.namprd03.prod.outlook.com (2603:10b6:806:11d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21; Wed, 30 Jun
 2021 03:41:37 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4264.027; Wed, 30 Jun 2021
 03:41:37 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/3] fuzz: add an instrumentation filter
Date: Tue, 29 Jun 2021 23:41:23 -0400
Message-Id: <20210630034124.222689-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210630034124.222689-1-alxndr@bu.edu>
References: <20210630034124.222689-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR16CA0063.namprd16.prod.outlook.com
 (2603:10b6:208:234::32) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR16CA0063.namprd16.prod.outlook.com (2603:10b6:208:234::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend
 Transport; Wed, 30 Jun 2021 03:41:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a36c30f5-cdb5-4c07-8bc6-08d93b78f6f5
X-MS-TrafficTypeDiagnostic: SA2PR03MB5817:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB58178FAC985E342E1FFBEB74BA019@SA2PR03MB5817.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zLQSNtxCx/tAlRMxWnllAvEDgmF3h0IcprPFzM8FQIpMDRJAJxv/1fxzXCY142CHxJKdp5dOqX5uvtQWn9Xe8ZGXouAUP+7Sr0KRxAhTAjKwL9TyyqHf6qW5F8XDfeN3d4ITvUzZ9UgnAk1BD7wI4lxNzywCb+5sSbYQYWHrLUf5KFSt2C4T1Jfpf6QtUuMXxiO2U52LycPd5wjh2rDybnK0BCgOR4O5M9K6UM2sS4EOGwgA04ZCaXMLs0Vwlcee1jzn2jdLhQq/lHOvjKD0u7T0jTzeabVeXZdxijLevPG8Nogo2zGQpzM0x06w+uQeV9gLriIW27P7+KUjB+BDlh/LbGDm0N7hvcDvnFvhnbzMxevdvtDk6b4elKIPVrTV/Zfq1JR1NVKbMP4+MxkNlxWT8Cv9AVsrPs6PKl0ESqCoHEauifKjUst0agX/2FiZqs6yLHv5BpDHzjR1TQH8bLcD4fuX+LSUwwhZA0ahoguIRewF+0/ksHtBtxvoDs1U7yUhmBR6vrgw//ogf7OMxByQ45r7k1xMBoxmqObQ026JRU9memTiutj81bhCZPlYESvXAbMj/na0wcvxuWreGSp/0FeoNu1G/9J2OgsUnvEuuq+yzwTEqeZO0kFlmR0dlkF+m9QO6E5pYKSVXfvjG1Jh26dxv0++aQmjN7Gc2ioqK+juftOi7e1Tdp33hHfRmuo1CwGPSQWVizKym7qmr1OQkw2k1GJPv5bgNe+IdgWzX43Z9++pTwXiE20InadbGgtKwxvsMPeBYmm0mKpK/b8z0ofFtktSVcynYAUy29PUT4CEdszFPnD2xUAEuXHCAgwQ41I3EBBMaIsZbs/iFHF55/LEDE6TXsSoyIhAFck=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(956004)(2616005)(66946007)(66476007)(1076003)(66556008)(26005)(478600001)(16526019)(38100700002)(6916009)(38350700002)(6486002)(8936002)(8676002)(6666004)(186003)(6506007)(36756003)(52116002)(4326008)(6512007)(786003)(316002)(54906003)(2906002)(966005)(86362001)(5660300002)(75432002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wuiKN7yMBiKkgHH8YbcQc7bbMBQZwFJ5B77mHX29eTO50uVqQnoBls5rCXnV?=
 =?us-ascii?Q?/rmriMWI3Vvfi81pRCNsGFhA8G/1UMtL0VKPYDr7LEXWA8YX1po855JheXv1?=
 =?us-ascii?Q?e38x5bHfXbF1FX/juGCwnPpZ84fDrhl9LMh1QZRw5ht/tgxCAxnw4Z9Gjnqj?=
 =?us-ascii?Q?/xUpFGzg3tjBDNmPCIeGkb4MwZcWgBZ6AJRmCtNIyDYpV0pjN64TYMdNSugf?=
 =?us-ascii?Q?57i2BGesbhFt912pyL/TRu+H8UtL/B1eH9Ygt2Qz/+rGPT1LEzFkOEKx5EfB?=
 =?us-ascii?Q?VRYQ70/8KlK/wMo27AsZdY0qoufHcZY8X9KprBH5hfh6cFeLZ+CrUJ8d3p5V?=
 =?us-ascii?Q?Pf34xuZhmEk3l7RGDGBCfz6mWzlUamSm3+Ew9WJYVuz7sxKSZsds5ZaKpDD0?=
 =?us-ascii?Q?0zujPY3FOzu/EZNBnHi6d8bjTEBvEPbpdn6IBd0PB4lntuBIWIMyS5lU1VdW?=
 =?us-ascii?Q?72kfA+6sq2R7m6y2vyeIPgw58besR3Jy0EfC9GL7lxUi0xbQJBhzMZ7oTFm9?=
 =?us-ascii?Q?pSeTKpqzZjC/oj28mKbThPjkE7+oaHeJ3GN5huvUrLG425/dL4RsrVLEiSFM?=
 =?us-ascii?Q?qAfVZ3PJTnO2GxI2p8trLf6iApUHUyps+eHrHdCoHHIOzlOWEcae11FKtWPe?=
 =?us-ascii?Q?y7fLEnYZF12doxWPhKmhX4jFbycHIFTLQbk6/dvHiGlg1fHjcHyUjcSekU7k?=
 =?us-ascii?Q?HYS7PHReeKbMBtxFVV0eHrboekRyrEY4pHfa+yoWSYCIgegV3k1P64FkZ3ZE?=
 =?us-ascii?Q?XCRSRxXZxkJWf3NKBq3xQYhnjtePcLllhwOppfcfUc8HbmKAWBQ9sOUEt2s2?=
 =?us-ascii?Q?vA7zWyhgHqpMoKmK6znRII34mMv5rMwQNHAAnOoYvJ+qlnCErFpkm98L/Rgd?=
 =?us-ascii?Q?UKswI3VEUnnzqY6tp98H1VBt2mt/ORzan1cV70eBD1mMcOjAcx/dJNYLVlCk?=
 =?us-ascii?Q?gLWYO8mKwWCgGf5QTBePL23YKq5mhN7Vl2RdmPS/9eLiFlLvkvDtnAxqp1Vi?=
 =?us-ascii?Q?i9LPI9lrV4U8MO9NIma/6jK4kSg3ELG82lytkN1SOfJ3hemwiEMiNYKiSdEJ?=
 =?us-ascii?Q?ybODnH7YrQ8rptHR7gdM6y2B9vu2ibYQsH8dO3Ax9g863p+wnUKui698sL4P?=
 =?us-ascii?Q?myPJh7DRAx8RV/bpOUV2fxvXptCt3DlHE3NpfA2ZScsCUVbeSji+Jmv6n/ne?=
 =?us-ascii?Q?yL9GHixah0Bi08jQX0wBVYhk5tLxgXVUnyUpM/9jwtHjp0FnwCdif/nWESsx?=
 =?us-ascii?Q?6NfyxipLacMlRfujcma3Q7KkBp0hAHO9CGbnajSvOELKvcTIiSprSOPRfW5e?=
 =?us-ascii?Q?3TAu7WVL8TYJciHS6B1nwNAB?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: a36c30f5-cdb5-4c07-8bc6-08d93b78f6f5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 03:41:37.6866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fM0zqcQf9xANUBPz2NW1sZg5vslGuhWBr3B5iiLXUYFlPgKaqv07N7HBc7V3B6cj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5817
Received-SPF: pass client-ip=40.107.94.132; envelope-from=alxndr@bu.edu;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
 configure                                        | 13 +++++++++++++
 scripts/oss-fuzz/instrumentation-filter-template | 14 ++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 scripts/oss-fuzz/instrumentation-filter-template

diff --git a/configure b/configure
index 38704b4e11..3b6ca054b9 100755
--- a/configure
+++ b/configure
@@ -5189,6 +5189,11 @@ if test "$fuzzing" = "yes" && test -z "${LIB_FUZZING_ENGINE+xxx}"; then
     error_exit "Your compiler doesn't support -fsanitize=fuzzer"
     exit 1
   fi
+  have_clang_coverage_filter=no
+  echo > $TMPTXT
+  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=fuzzer -fsanitize-coverage-allowlist=$TMPTXT" ""; then
+      have_clang_coverage_filter=yes
+  fi
 fi
 
 # Thread sanitizer is, for now, much noisier than the other sanitizers;
@@ -6120,6 +6125,14 @@ if test "$fuzzing" = "yes" ; then
     # rule for the fuzzer adds these to the link_args. They need to be
     # configurable, to support OSS-Fuzz
     FUZZ_EXE_LDFLAGS="-fsanitize=fuzzer"
+
+    # Specify a filter to only instrument code that is directly related to
+    # virtual-devices.
+    if test "$have_clang_coverage_filter" = "yes" ; then
+        cp "$source_path/scripts/oss-fuzz/instrumentation-filter-template" \
+            instrumentation-filter
+        QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize-coverage-allowlist=instrumentation-filter"
+    fi
   else
     FUZZ_EXE_LDFLAGS="$LIB_FUZZING_ENGINE"
   fi
diff --git a/scripts/oss-fuzz/instrumentation-filter-template b/scripts/oss-fuzz/instrumentation-filter-template
new file mode 100644
index 0000000000..44e853159c
--- /dev/null
+++ b/scripts/oss-fuzz/instrumentation-filter-template
@@ -0,0 +1,14 @@
+# Code that we actually want the fuzzer to target
+# See: https://clang.llvm.org/docs/SanitizerCoverage.html#disabling-instrumentation-without-source-modification
+#
+src:*/hw/*
+src:*/include/hw/*
+src:*/slirp/*
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


