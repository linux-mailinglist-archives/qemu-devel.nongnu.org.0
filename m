Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5660E31F1C1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 22:34:31 +0100 (CET)
Received: from localhost ([::1]:51484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCqwQ-0007Rw-Dp
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 16:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lCqpu-0003SI-21
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 16:27:46 -0500
Received: from mail-dm6nam12on2112.outbound.protection.outlook.com
 ([40.107.243.112]:20673 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lCqpr-0002Ai-02
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 16:27:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCKxjofOSYD0Vha9RHDqWME2a+JqygtYB9mW3YTxDTLHeL2+6gFpRtn3g8MeZnIDtmG07FIvvq2GGeWfE7UuQERxkf+O9n7yJH7ia6EzN5q4z4s2YA6pwYoyv05Rsh11NFINY0b9hXf7MnJv6w8VPFkW4mEkktwUERZZWALdvIuLD/aG8dfYKpK5RM3oxzR73dehB0aeeur7tmGCYzmWdOfzBXVSA7/9tDlsEPldlfyoAJuMImP97jOO9j8CqnVKd0YJyBTc611031BQ90eJW9uCkPeT/fVAis0n8vCczjtvpxbhexIXqlFqSkN/3znXbJ5anE01DrkzZo7vFI4qUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKAKaVzYiN0SaACDVk8cOC220taFFF8+YEtQCfyXTgM=;
 b=Zgp6k0f3qxXAxxxyJM7fDySpBekxua5CpEh48mOosea1p7XtusHoYXFKWrsbLaf0fbAyNqjK00SS0rWJRwfPlSs3UvV8y4uyNYnqjpav8Vqzz/PsBBmtUuWH69mB4wEzjWJ6xNHJCHxuPnZyz1qq8m3Up47A1y+Tna8GlCc1Z9ib02Lhxz9c2xJChfE3DuDej7r9ResP3zYjWHCkzxnWJB5H2kRS3k3zJ3u5sbS1peFWzz7oE7ivY5lHEH0m9UOMIyHCG6lJaO+cKhsYv++Z5E2/3gt9D2yszloHDK9uClJRQfR6sIkKU1H7ek+C2jmIWcJouhcW6pgy8sLbLPGWqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKAKaVzYiN0SaACDVk8cOC220taFFF8+YEtQCfyXTgM=;
 b=fUYEjPNNIIdXHhswqu1CAEkUuVHaOnHvehKv0iiyfGaR4CE/HMAUgYVBlugIRADtMtnj7Xl5W3OYL5VG5KTAZPw8yLeGxx4OnTLIft4/unJhHnvM1n5vWbQzSAR4dOdFZsSdnBeyNWbna62NpiHq9c0ufu7lXCMlxVR8dsDndSo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5724.namprd03.prod.outlook.com (2603:10b6:806:113::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 18 Feb
 2021 21:12:39 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3846.041; Thu, 18 Feb 2021
 21:12:39 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/5] fuzz: add instructions for building reproducers
Date: Thu, 18 Feb 2021 16:12:20 -0500
Message-Id: <20210218211224.2513413-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210218211224.2513413-1-alxndr@bu.edu>
References: <20210218211224.2513413-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL0PR02CA0066.namprd02.prod.outlook.com
 (2603:10b6:207:3d::43) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL0PR02CA0066.namprd02.prod.outlook.com (2603:10b6:207:3d::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.28 via Frontend Transport; Thu, 18 Feb 2021 21:12:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 314f5af7-f559-4e35-77c5-08d8d451ebea
X-MS-TrafficTypeDiagnostic: SA2PR03MB5724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB57248E5D7F600FD7C47723D0BA859@SA2PR03MB5724.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mr2SEx1nLAni+7V7L76rfIn/Sa+6M1g0MrIfuwg5XYpz79hPmFlFY9uW2GZTjqfDWyY5LYSZdRD4lxxBs75ebYxD1NkfPJla6UV42sSMmf437KwXfMW6yALKD/odbFHwl6zWzEUm+xclXc9tsYMHdVAWXPaQRbwwfJA/Fy2nnzNsjB28RRQK4tS6+1YaPxhxCCJHFfsV9lOq2JyJv1qZe3+mmGOAX/7kR6l8+TK0eWTEXoAlf85dnflhq2kKaD0enG1zIcqSEV4Jlxb/cLGsPtU6SPuv4MvVIK61fu5eYXVnxKtoYEVIGni2C+6GlS0J8ONv2+Blj/QsGdXCOtbgtVBDz4GQt5+RSq+h3J/cFTEhGAnvydY5iTiHBta756Qsbcgi1VqluMEmz9tc9QrjOtMVcAvAbtjqEGzGL+S1EYhRqDvd7SdOwSKxx2QcQ7MYZXgsQtBneucmznF5WYtuglShaj4h93fUkuzDfbxooRwIaruu8WQjfg8O07f9Jp70j7DyvFXmrLWkJCdOdgFMFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(6916009)(54906003)(2906002)(316002)(66476007)(52116002)(86362001)(16526019)(83380400001)(6486002)(1076003)(956004)(6506007)(186003)(66946007)(478600001)(786003)(75432002)(6512007)(2616005)(6666004)(8676002)(8936002)(5660300002)(66556008)(4326008)(26005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SRZERcUKtWr6khkrXIbg96bG3YoQeB3TDx0DW3qFFENDa6tZjFE5JRRvZ4lu?=
 =?us-ascii?Q?6jTUeTHJiPQwq9RfyT1whcATtxyRpeEjH1S2EdjFIpxHVBrgrV2Iw26JwXUL?=
 =?us-ascii?Q?T/wuan9WCwWgajMfMXuoCDDkC4kMKxhL1ETe1g439iFD3m6Ni7Jgi1bFC20q?=
 =?us-ascii?Q?TKuouZc5FPQp4N5KNmVtfjR8RyX0kkKZ7zRAh+pG8bmaaMrk/fsMuD5X7mYF?=
 =?us-ascii?Q?p6qPXvDqDO0/6NZQb964mYQWJvOGUyOXoDJBFVQCjlgHzCrMq09t09/z+sfg?=
 =?us-ascii?Q?ZBlfa5BGVFeDNuy5a2I8wyDU10xyWDlx1LwvhQaFsY7lhQhZrLhPdsPKQs2W?=
 =?us-ascii?Q?sKE2l7iRFWweEfnWoRnQuOFnM8da/SZI2Ysql3zDuKnMpjjADN070POi1pQR?=
 =?us-ascii?Q?VuF/N5uDxePStBQyF50uPdlAKUv+23uAWeThpWX1eTjo+N5Z5/FWlAD4mVhV?=
 =?us-ascii?Q?w7Rp2B6R+qf9DJ+CuXUnc8PUQbKblE8R2Nxyc2THGzZ/qZe2PhcelQImTL6r?=
 =?us-ascii?Q?KPYHAKeYXmpsNcaOdBFgDErJqZYDu/9ZC7mJgIst5ajKKhHVySFYLiTz2Hjk?=
 =?us-ascii?Q?XD3ecS9QI9Y2ndKEf06wcB36cLqW9xKdocQ56wDSGKNDn9tP2MHcPs/wft+C?=
 =?us-ascii?Q?1qE2/9e2ouVGFKaQKvKVYX0xKSc0FS5ug5kS8lW8m2WVwWcZ/xp/+UArFz9j?=
 =?us-ascii?Q?U42SGuQkP25+pqgygTRFtYUr/MBul1oL16l5fQ11DSXMk655OzP2k0P1QPlO?=
 =?us-ascii?Q?Aj+yQZvj3lUqEWm0JaukgtwZ9HwnOtY4dAow74LZylfbkUYxg1OVqQvV8g2J?=
 =?us-ascii?Q?v2B7XgyYeKQodZoGQcS8sexjcai/Qtr9C3R2MOpe6Pb7nvgnonPM0xuwEaNB?=
 =?us-ascii?Q?tU0EVAB+TRengu5xc2BWWSGLChDmkBPmnnK6F5KIhVckMacXBcg3l8Jy+Mnm?=
 =?us-ascii?Q?Khggh2rOuak8VYHAy+VaHc0dq1SlUNetRdXxSTXYffBMc43zfdaA/g/jbDpC?=
 =?us-ascii?Q?c4xO64mFSFiwW2zcgu/2QyU0dlS44e3M2X4fa+t5fRsN6sc9MZDUuZRy/12T?=
 =?us-ascii?Q?fXvQMCd/5vwKINcdAuCJoy9mvbHZR+3u1KvXRibzaBUknlRXuuMdjj8rCyQz?=
 =?us-ascii?Q?+x1UI31+kGl5iv9sxHDWueyCTwsFs0MrbEAPrP0FkLoTgaYr+nN2mTgLGYzs?=
 =?us-ascii?Q?E5Kqyvtx9RDMcbkZzFDgkRAnpEl2zHQu2roqjkeaKRm847PFJHCLpd6fQLH0?=
 =?us-ascii?Q?ZtY2lERnZOh6eYRfG38BPIKOhY1HrCpLVuNYoQF+GePhk2HCw1lQ6zcvQhrD?=
 =?us-ascii?Q?ZODTHvSuQUkg4MPGaBb38KV1?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 314f5af7-f559-4e35-77c5-08d8d451ebea
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 21:12:39.0155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHJ0cXzr7WL9QebY12Mf4qDGbN/YGRHJelTYr9GeIBcUMTsXbt3DMJ7HVLIbIb7v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5724
Received-SPF: pass client-ip=40.107.243.112; envelope-from=alxndr@bu.edu;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have several scripts that help build reproducers, but no
documentation for how they should be used. Add some documentation

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 docs/devel/fuzzing.rst | 45 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
index 97797c4f8c..025fb0c19b 100644
--- a/docs/devel/fuzzing.rst
+++ b/docs/devel/fuzzing.rst
@@ -210,6 +210,51 @@ Build details:
 - The script responsible for building the fuzzers can be found in the
   QEMU source tree at ``scripts/oss-fuzz/build.sh``
 
+Building Crash Reproducers
+-----------------------------------------
+When we find a crash, we should try to create an independent reproducer, that
+can be used on a non-fuzzer build of QEMU. This filters out any potential
+false-positives, and improves the debugging experience for developers.
+Here are the steps for building a reproducer for a crash found by the
+generic-fuzz target.
+ - Ensure the crash reproduces::
+   qemu-fuzz-i386 --fuzz-target... ./crash-...
+
+ - Gather the QTest output for the crash::
+   QEMU_FUZZ_TIMEOUT=0 QTEST_LOG=1 FUZZ_SERIALIZE_QTEST=1 \
+   qemu-fuzz-i386 --fuzz-target... ./crash-... &> /tmp/trace
+
+ - Reorder and clean-up the resulting trace::
+   scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py /tmp/trace > /tmp/reproducer
+
+ - Get the arguments needed to start qemu, and provide a path to qemu::
+   less /tmp/trace # The args should be logged at the top of this file
+   export QEMU_ARGS="-machine ..."
+   export QEMU_PATH="path/to/qemu-system"
+
+ - Ensure the crash reproduces in qemu-system::
+   $QEMU_PATH $QEMU_ARGS -qtest stdio < /tmp/reproducer
+
+ - From the crash output, obtain some string that identifies the crash. This
+   can be a line in the stack-trace, for example::
+   export CRASH_TOKEN="hw/usb/hcd-xhci.c:1865"
+
+ - Minimize the reproducer::
+   scripts/oss-fuzz/minimize_qtest_trace.py -M1 -M2 \
+   /tmp/reproducer /tmp/reproducer-minimized
+
+ - Confirm that the minimized reproducer still crashes::
+   $QEMU_PATH $QEMU_ARGS -qtest stdio < /tmp/reproducer-minimized
+
+ - Create a one-liner reproducer that can be sent over email::
+   ./scripts/oss-fuzz/output_reproducer.py -bash /tmp/reproducer-minimized
+
+ - Output the C source code for a test case that will reproduce the bug ::
+   ./scripts/oss-fuzz/output_reproducer.py -owner "John Smith <john@smith.com>"\
+    -name "test_function_name" /tmp/reproducer-minimized
+
+ - Report the bug and send a patch with the C reproducer upstream
+
 Implementation Details / Fuzzer Lifecycle
 -----------------------------------------
 
-- 
2.28.0


