Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744E13B25B2
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 05:47:10 +0200 (CEST)
Received: from localhost ([::1]:54484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwGKb-0004v6-Gn
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 23:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lwGIs-0002pb-0q
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 23:45:22 -0400
Received: from mail-bn7nam10on2106.outbound.protection.outlook.com
 ([40.107.92.106]:38420 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lwGIp-0004TK-5Y
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 23:45:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5zXvSHOQKLC3wxyn4xfR6x7q4n7y8CTHNaFSh/XRnsTxLWkb8OIEApwY/jRrDYXg4WlbNH9xJvZPUmSo4/IiBkel/GM2nVee3Pa5RqXgRsCnAzfP8eG9O4gmqUl78e7c73n2a7mCmZm9JyiYwxVTzHstOTmpUh6C8dGvk/8tTa5PXNxZfzlDnp1MjJU1IhVZOm6Qc4Wu2UpYRHLu/yY6umht+RwwQLKjRi7zuOKlLVmFGYbVVv0MedrV3M7CGCjNdQCa3bBq4wikZsrwy3EW3FRBuvE8fYzbaXfydb6sEtG6xwd08pMfRW1S1lVs/BMyxvyzf7R4Qn16xkLgbzfQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49EqwBtWvln03UolXsQXBPMgc8diobkwUO+hdLud488=;
 b=MXSSqD9/HPNIOZwpg+NpYh1S4R1fiPDEltJtdGEU5t5v8SOq9vdOODIMWD2NCmYdA0iBSsGzD4cwNBGXUsQ64GvCbl4iiF8QPco9w4cZTZhS2X6H0CGjx3aghFfxkBFmeBgmEy72qx05nftYfuyjsYthdezkURsZUvPWoQ8yOvyUVUb9VdTRQEclM98cUUokDX0NNmbj6rLm0EezWIbknBO4J4MqesKepJS8si8HYmP2u8H7eQ3aPouXXozUWxn0bHS5xnecA+Zjb8OlUX9AzNaPsw7QgCqYZ27CCGDHanzz4n+RZ1PVvV1VjnZdLmyUVS7G80VA6y38pjx0uKRZig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49EqwBtWvln03UolXsQXBPMgc8diobkwUO+hdLud488=;
 b=RdfIs2UFWhrDrVRXyiSOAqFeXXLrrXrzMrlYRzm9xiV6LEogrpqthPjQO0agjhprB8KC1/VGEVkI2fsCXl5BFYyBlRmFdTV2h484yzkhlpLn50ttrILzIw3H0darSSS47kyYQxJsVv0uhrfuVZNxfsVF2M5ub8Dh5BJm0sF+7iY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5468.namprd03.prod.outlook.com (2603:10b6:806:b1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 24 Jun
 2021 03:45:16 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4242.023; Thu, 24 Jun 2021
 03:45:16 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] fuzz: add an instrumentation filter
Date: Wed, 23 Jun 2021 23:45:01 -0400
Message-Id: <20210624034503.86256-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624034503.86256-1-alxndr@bu.edu>
References: <20210624034503.86256-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR15CA0016.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::29) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR15CA0016.namprd15.prod.outlook.com (2603:10b6:208:1b4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Thu, 24 Jun 2021 03:45:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5c5f8bb-f090-4080-2064-08d936c27abf
X-MS-TrafficTypeDiagnostic: SA0PR03MB5468:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB546827960BA81522B0D5EFA9BA079@SA0PR03MB5468.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bj1gTcIQLLt1J8wibjdn/19E8KJ9als5Ei1xWhScLtPhlEoQK2kvw68YWjj5vwfz0XtQZo/BvLF5STkH50VweFFHYziPNd2BIhaHvn+SUuuMmDdUN4Mm2oF4ywjvspY4zouAVTPcg9AIMvaZ6wCYxPXcWlv1smljg8RVSjdJnU07tDT/tJjDoyoxwe4RKj0PU9BKy24ddIvt44RfTCW1qonET7RcI5cgQDl7ixSLco2aJJ0UrQuCudikVQ95Oaa0eNxgIvRmgasmbTTioeB+lSaT1+M3x+2Qqc/PBG0EKSB0RbpbSk5ufOB59BuJyY+OhSP6KEGDK3BP1NfbYvIF8KfGO/QbJvi+eMKI71g0kPRp/ed0qCCzDBah6J1BQdKphZhh/bgIsTfBSrQR5STjTNUFdY3sxOYTbZ0/BSrkq9CZnc4Vz6tk2R75It/A7TiRiXyNjLmLJU3PiD1qqrJC/KSh/dZGZmKXmmaRECTaFUWo3rPvkbpanhrYHEBB3aY15v7C05JYv2lPU6MGfxozqPv9jicYDl5FqQK3dpHYpbfG5nD3TUACpWpwnE5DF4+PMHy+vFmyrQbsGtR+NABNLQCi6T882nCmUtmVLw3JQEkmIqG/wLNqGQeUXn5MwWvxCJFYgClzUlhbMlcnnRs9Q9yKEZ65Ysz/msCoVsyxs02T+mVxxChbsHitrdNNa0Jwlhykxe/CUw8iSA9Lw1X6FyhfWfjfMjWlcbRafEJp7noKM93LfdmPOSq75WqsP5Z0KN2cly6Z1FRm9aArhlH6/8MqUiCWZZubR9EygYQrg9IxKBt69i+iNJ/zq0WmVH/3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(36756003)(75432002)(52116002)(66556008)(786003)(6486002)(4326008)(6666004)(6512007)(316002)(8676002)(6916009)(66946007)(66476007)(26005)(38350700002)(966005)(2906002)(86362001)(956004)(8936002)(38100700002)(54906003)(186003)(16526019)(5660300002)(2616005)(1076003)(6506007)(478600001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5isTZuhlILAuUl4gfcEqaPa9d4gcHPsv5xw/Juhnb8upLtaR3ajCUwui0MND?=
 =?us-ascii?Q?PcCq/FqX9ClqG4kv8ubsyocXRuekiX4ArJUvTovqC8+7e6KB1R5Fl0ckn2Nu?=
 =?us-ascii?Q?UaRdlD2/2vF6FhvDhr2shLAl0Qn3xHzECP1BgvmQlhdIg3gLov+sdfmxfq8/?=
 =?us-ascii?Q?qPpTwfo1y9BAsgdhhh1/rn+lXjcdf0sLqcGWnDVLv5GcR7TZ+UkAVT5dQTTU?=
 =?us-ascii?Q?n/z1EHb6XkSAV+Z3d06LoA4KISUpSIxk24Rwo50pngtY5NC+eiJKfbbbP6SO?=
 =?us-ascii?Q?vShXPdfSC93wMxrC9F/VPC85y/sB+nCnaQ+War7WAZoRfMeHI9NzabWKLp6a?=
 =?us-ascii?Q?YygQ2Gi4o9+c7jzZawMIbVpIcZxnBjJANEhFeFlMpS7GAo3Sq6Ds3HtgQu3J?=
 =?us-ascii?Q?Qdoy6RWsQiB0hYF4lxJOqn6a4jJqSSL3/uVprQSDqlnyRUcO+y9BwwuRdSTY?=
 =?us-ascii?Q?yaZig/hJWWIn7vm8DfZ3m3IPPJRcAx/VQ7oT1kCXa/KyYnRrvkgss9sNwXD8?=
 =?us-ascii?Q?pMqXvtHAFTyT1bALBuN6xJN5LsKVyo1angUfhwXy/D6hsugC0ky2aOMcHpaL?=
 =?us-ascii?Q?mHG94Lmxuh1+K1vlNS3+5c1h+KuR0P992YcVbYrn7uYF38R8fa2ABYMjERO/?=
 =?us-ascii?Q?jj0bOkdZfCgWcz9npKYRzNkcCHeb/zacF+8SavXRWgkyi7vsnnj5ejqmfxls?=
 =?us-ascii?Q?tz9uwS18NYoL1jBuGOkSHrOqxwjA8zC66L/7MaxZpfvPVDw89eexDRVbF6hC?=
 =?us-ascii?Q?rcbfncIOatzOGz9x4Q9krpRTm7I+Q7R3dxrVjRHymjaHFkgZHCjp4NOm7dq4?=
 =?us-ascii?Q?lCMHaCXNxIUMouluWDHh3mQP2ifzWfLsAplYuwFWOyeDkZiNB5aOneXukirP?=
 =?us-ascii?Q?I8L1zTpm7LrsQZ3dzJcOi9XcGAPsngP+kseN8/uSqfNoQFVs8i8IH06ZqzJJ?=
 =?us-ascii?Q?GJjAmYBR/Z4DOqJsqcvmEXhbk4vto4qSLtHh/90vV6zX9kxBrwc8VmZhUwL/?=
 =?us-ascii?Q?KiLfUABO2YdCIR/nYsBV/PrX34qrXf30CwMTfF9upOJdfMjTv/rkv/WejdPq?=
 =?us-ascii?Q?v2E+XZ4dkRN/nc+lh6lhMz1hIvLJgpR360KJ+mBP6kzYmtliBGG7dkpMFyVY?=
 =?us-ascii?Q?n2qpZjnuxQwaLVj1oJnltPjJ/Hpd7jBGccVuXPAUAHRDpvIsAAbzUtI04XHu?=
 =?us-ascii?Q?/ceIkknx4oD1jRWxes0PjfMohLhClTM1YRQ8jht4yxWo/VXrflJgKXvdX33o?=
 =?us-ascii?Q?zat05qP2C7f1/ItbH2GP/gVXbfKSY30O47g/nPNWSIVzFxlyVSunr4WYV/ev?=
 =?us-ascii?Q?sBUNIvgWXBPDmFlO1N1J92m9?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c5f8bb-f090-4080-2064-08d936c27abf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 03:45:16.2036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCkOT+bVX0PIzG6ZX4+kF4JdeKRcfxZHfBERcbsnXefd2yhfMNH4KBSrfeh+mCqu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5468
Received-SPF: pass client-ip=40.107.92.106; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
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
 configure                               | 11 +++++++++++
 scripts/oss-fuzz/instrumentation-filter | 14 ++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 scripts/oss-fuzz/instrumentation-filter

diff --git a/configure b/configure
index debd50c085..db8bee939a 100755
--- a/configure
+++ b/configure
@@ -5176,6 +5176,11 @@ if test "$fuzzing" = "yes" && test -z "${LIB_FUZZING_ENGINE+xxx}"; then
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
@@ -6101,6 +6106,12 @@ if test "$fuzzing" = "yes" ; then
     # rule for the fuzzer adds these to the link_args. They need to be
     # configurable, to support OSS-Fuzz
     FUZZ_EXE_LDFLAGS="-fsanitize=fuzzer"
+
+    # Specify a filter to only instrument code that is directly related to
+    # virtual-devices.
+    if test "$have_clang_coverage_filter" = "yes" ; then
+        QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize-coverage-allowlist=$source_path/scripts/oss-fuzz/instrumentation-filter"
+    fi
   else
     FUZZ_EXE_LDFLAGS="$LIB_FUZZING_ENGINE"
   fi
diff --git a/scripts/oss-fuzz/instrumentation-filter b/scripts/oss-fuzz/instrumentation-filter
new file mode 100644
index 0000000000..44e853159c
--- /dev/null
+++ b/scripts/oss-fuzz/instrumentation-filter
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


