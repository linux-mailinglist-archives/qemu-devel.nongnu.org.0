Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D72D3B589A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 07:26:52 +0200 (CEST)
Received: from localhost ([::1]:46526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxjnH-0002Mp-6o
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 01:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lxjlC-0007By-MK
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 01:24:42 -0400
Received: from mail-bn8nam11on2137.outbound.protection.outlook.com
 ([40.107.236.137]:14944 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lxjlA-0004bu-W9
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 01:24:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guZBDRmu7h7Xg3nb875BLg8jeqTNzeg5+6YVV18uzm80JQ7V+TsFzmt7x2mIzU9BeRnGsrA0MifX8Olu2h9L/nV9igvQOr6FpJEc5E0iAVN31iMkczwo6faJS8Cc+m2ryHMlqXUr0wgtQYZSFARmbq9ZTVyiutwq6/E7w84tXvXuVAHW4XDsx+gxxLzHB0+m51SjzBKMvHi18alkIeC1tTocdn90NOJ0L7DrBHuB+fCrv2usrYJGI5CahfdF1gk90BcCta8bwCWVA/vTSr0sH+1dL05TmP5YtVNSwVeYwI1dBkRl8b1yFO4Q6gQcDYC7fVzl+2NwMUfVpNRdclyaDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jvUid/wftaT46wmRZr7h9STkApK602QqaQbXcz0fFM=;
 b=UuLl1WTGNBza1XiflZAY4YcYaT/X6qjWKbgTNmrelBp0DP6CEbWMCjI4lW3TGZ0vUNDl0Nd27B51SVI6WXC6EComWmtPzB7Gc2KnpYl0z5IDkwHvcgx2jeyGngXEy14tLwpwAkA8RlXzecae1SqHCPrljZzzMO7VIyA71t7PCKh+ZgujicLE4oBVDoJUzX3YcAfBJ3bc9XkH+Sm4lmbdSN8d2bFFzjNOOHsOX+I5suDXLFKXSnRGjve0DUS2iYeiNh2+EIGHXxHGZfSxNZmAODfKsryOu+joq/itPl0GNYfAe8zzQnkUfwHUfiqx5QhmGXVTEb7n2XWUvqYJTYyNdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jvUid/wftaT46wmRZr7h9STkApK602QqaQbXcz0fFM=;
 b=GvSFV01wuQ57DwjQ39ZlImPH2cdlSIoMViRXJotmR5xdnQkH/QGBXblmOAGtGBRQoeRgMYVCws+PCP5nvQ0JIwzZZ6GJpHvg183UUqRQPtHumOzPfDNqBwoYk7mFjVLfhK6IS68hBfkOH0Z6VRueTqWwZeTBjqlnXuY+QmqGW8s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4446.namprd03.prod.outlook.com (2603:10b6:805:f6::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 05:24:06 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 05:24:06 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] fuzz: add an instrumentation filter
Date: Mon, 28 Jun 2021 01:23:48 -0400
Message-Id: <20210628052349.113262-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210628052349.113262-1-alxndr@bu.edu>
References: <20210628052349.113262-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL0PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:91::23) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL0PR05CA0013.namprd05.prod.outlook.com (2603:10b6:208:91::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Mon, 28 Jun 2021 05:24:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 986f67f6-bfe3-46ec-31b0-08d939f4f30d
X-MS-TrafficTypeDiagnostic: SN6PR03MB4446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB44466E291526E7BD34E233D0BA039@SN6PR03MB4446.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JHpMRp6wy2V6+rXtm73/blaQkeXB2lf2aw9i1uShVKnc8HNE0tDyXlvlVy7e9Vm/vN2qmyKnixI2dVu9QZCU/5oMPRCPPJORnObraegF/plsMR/KfsEqvD7hubSmVBlxB+ukAg3C5zFXl7Gkzo6PSBZENRJH6jwBZb+8v3x9pbQ8/Iv9Jz4c4ITOVTpDtPmHiRVAk90MHvc+V6evtOLPEdfAFa2PJOyYF/E7Wh2n8HwI6GxCMkq0eWQ14ylWRxhKIW0t5Z2VmU0Cb0WrlLmTvYTUEJzseTYAkkr7j7lwUAf+b9vMMeyBUNWd4fvDU4PmBBHKVB0nP+jqmnLwolISX6uAqM1rvIscYaI8Rzt+cUfLGdSP+k7HDpX15uEb0e8r7IUqMD+aCqMVrhKDP9NhOOGyfBXVqG886fyYbxnxtyKEWzsVctjoTBebTK5NUAPmafARjjSDVw3J734/ahZ+3unBW6ynz44hh4r8kQ31kZKRbQ5S7E+BtRFgrk+zcv/nQTL0mxBjsJHwaLlVj1RUc8hizTLpljAiY/691Asov6RVbInPg/8od3mmWZX3OtnkqH8gtg2RUnR/F80hItRVXCf5X/nuOAEfmzMQErGrAMyBZbXfXgQolAU0WPj+t/DfH9LpAaOWFZoIOLRdoWQWQYOgn+vLI5Oxh1SfcipKQ8h/SpIvrlC01Utrh37q0Ecgcrkd0YOBDY+NlnrLIRGHnYebAjVGpRAH21Sm7aGAacJUFsd1MQALRlqkeINg+ZDG6/1BFCalGCtl+uKp4nusmLsv+MviVZY1lqFSwWQrm4c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(86362001)(16526019)(26005)(6916009)(52116002)(8676002)(786003)(2906002)(186003)(6512007)(4326008)(2616005)(36756003)(966005)(38100700002)(1076003)(956004)(316002)(6666004)(478600001)(8936002)(6506007)(38350700002)(6486002)(66556008)(66476007)(5660300002)(75432002)(66946007)(54906003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H9AsJrcoKp1I4PGiICXm+vVeIpW0Oq4GeggOEGF2ryGtTVd4deehY9lTR9B2?=
 =?us-ascii?Q?3+nJaUU0oOWnOS5FMbH/lyGwKAdnd0sMlMFt/U9Y9GFdA5pZB8ssDWkAC+xf?=
 =?us-ascii?Q?3jjgldxTQxMPn1bkGX/4wPiCAb8m2WXodPOneW3BdL1+c0WpXhicOzGPmt+w?=
 =?us-ascii?Q?981ELwvTC0csbjXAZ6pa/VjFcZVJ5hB+sOoPU0K8YWYCuwcJvTtNuSMLNeKk?=
 =?us-ascii?Q?5AjjsvmVEqsUcOZZn7wyhNqNK5sX2oDbKgo8She8FnkHPrQegBg4smWNCrh8?=
 =?us-ascii?Q?5EU2qAhbSPj/is5RHKgU/juPsDQ5UzUbM1LE9YrT4kLwcrifcXgkTMpM6Jcr?=
 =?us-ascii?Q?f4195qgbEGYHZ1dwjKjqdAxhrFZhq+llhCPOQNcIIFr7L7ZDRdiWYL3BlgOK?=
 =?us-ascii?Q?+ve1RlehXSbDtObgctmw4S1mu94vjKkEgO4O+L6C5197RIYSCbo8GEqPzYcE?=
 =?us-ascii?Q?I0boxcWTzVHjpg4CTU3gwrdbQEEvWbSGkTxyUE5kFMh9hDEA/+VdyO5bttop?=
 =?us-ascii?Q?tj+mEkO2ETGBM6aXqZUp6l2ShMJFObWtqHPCfKPpVv3j2GqEvwPcdbJ+dWq6?=
 =?us-ascii?Q?ifqaJurVpG0fpwHH0yTgW3PF/DDvoRTolW7XoKJBYtMF5ilkLexdhXhCV94d?=
 =?us-ascii?Q?B7U9i9QSxh4jYo1kqjI5c4ZLmAa6kCT/1fQpzthUg94rROIqCB/AZv1W8b5/?=
 =?us-ascii?Q?qRKo3sHO77QffxXW+iB4WcU9Cj2B5a34b07pNVXWdAgacaehIXktvHhXcUf3?=
 =?us-ascii?Q?z0Y88mWc1UYhSn2IvAQfomBbl7eEm8cnWJZvYn2n3PYx+tdoO4hpjFWKdjLB?=
 =?us-ascii?Q?Ops2BWU6xXJK2jorE8HbKYleEeZ7DZQS6baJ5SUcwjeZrK+UUR6tLV4z1Env?=
 =?us-ascii?Q?GwzILcvG+9eAKw4eIWqRhaW6obGRsx9rkjPbxStQE/2RTeENbf76vVjPnsdH?=
 =?us-ascii?Q?FSFybUUWNBDgva+FzLEWnFJSuKbqDmwSZbwCKDR2OsYjWrUWYlv5y697u6Fh?=
 =?us-ascii?Q?M43OhsQughuUk0BO5amnh2hMIOxXCJEOn8ROq06SbsP+JltCTFJKSDXYLrGT?=
 =?us-ascii?Q?YTt18U9HhqOqowdOvPI5lmwbgUD9BOSxJMGgc+XX1lhMPbsc5V4ygWJDqpWC?=
 =?us-ascii?Q?cwIY3Cxh7PwudlxygSFbnQchNgrO5pGDC4FpcoxZzOBUFGsrBuXz/SMqVAg0?=
 =?us-ascii?Q?f/vRrpmFv041rX7V7w4WtGVrmdGjTv4gvCCctdZeM0Qo5yHSM9VzFXN2EBAI?=
 =?us-ascii?Q?iV5OC+gyM1ptHR/5YCR/JpCgxQQCn5boW2c7nxxNPYtlnt4zdv1o6RbFCDtJ?=
 =?us-ascii?Q?F9Z0XaJJ8gJLHF9RdoVV/ily?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 986f67f6-bfe3-46ec-31b0-08d939f4f30d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 05:24:06.3626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vY+WMcW6/AnGteGaeWh5iPTS6cUZJapedc+0BJ5pgq+N5OwHK5tuMl/lcX2mMkGA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4446
Received-SPF: pass client-ip=40.107.236.137; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
index debd50c085..c755f8f29e 100755
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
@@ -6101,6 +6106,14 @@ if test "$fuzzing" = "yes" ; then
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


