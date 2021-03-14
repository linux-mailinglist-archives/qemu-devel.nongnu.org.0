Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8287F33A2A0
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 05:27:47 +0100 (CET)
Received: from localhost ([::1]:38808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLILy-0006TZ-Iq
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 23:27:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLIIh-0003qY-3z
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 23:24:23 -0500
Received: from mail-dm6nam10on2128.outbound.protection.outlook.com
 ([40.107.93.128]:27905 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLIIb-0007Pg-Kh
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 23:24:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0ETCcko1OLwuoqT6AsE1lgPzmj5KMXrufGqdCm7Jvrdwov82j6YUzr2B1ZehkMhWI0TMB8GyUq7XoXzMXU9Qk8wFEqx2M8IlPtTO6gm2ASxSfrHq7nHCMMGMH8+gxy0YdcZSdcnd8gZKiYoe7BeEmHhybjxA9ItoSikXMv8BMUPouoLIDR3yBBl3mvZ6lqVJ2elb0uUMacBnOnGxxRGJYoePvD7CT0i/Pbrf4RA7zeJHap3Zotduc+hyWdtIVCwaCIKensL3R65qgmxX/bRtpfFPGrCpqEp5iVyLg22UcvZaMAoGHwM4cluX9AQi+aMH44mm+JLzJHBpagUrDzXcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKAKaVzYiN0SaACDVk8cOC220taFFF8+YEtQCfyXTgM=;
 b=dT921ToOgZPNLruBWFLKsudjxOKs6FOtx5H0zon6dhZaGOJY15J8V6ZySmv3a6qJD/3m/PXu/dBTdkrPtwb/GHvddX6wyxJZl3eTHVxlZofhU/4cheBV2tlJcvPVhnObS5OUKl0MQbinlRVlbf60xbu63QbN1avt7tp/Aelb78c1NZhKzxe7fUueHnXmwCqpO4Yjy9MinL6rIixhNKyjBQW5mdT25uu4Pga5JtIX/UjjjwsnF81PxHeEyQOwKEQlPmtztszlBlVIVmcNZTKsM7K266Vg0Klu4bgYdBpbNtFbpVSz6qAEFm/hR3v/QwBzf+OBRRN+pcngP3gVTh9C+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKAKaVzYiN0SaACDVk8cOC220taFFF8+YEtQCfyXTgM=;
 b=gKvfPgMFthFXUUoUqZPEu4LgWr26VhMoLCiDw55+YNYbgAoS+X3u/T1Yq/GtdGB1IEy/AJQJpzrLKxPjMDT59w2jKBlQ0TZtc2gzQQqGNikaDGL6dkfFNttENA9V4nFTL4C/C8qGuedgTELWtUse5s1CDOylPNvz9DaXFXJUHXQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3854.namprd03.prod.outlook.com (2603:10b6:805:6e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sun, 14 Mar
 2021 04:24:11 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Sun, 14 Mar 2021
 04:24:11 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] fuzz: add instructions for building reproducers
Date: Sat, 13 Mar 2021 23:23:57 -0500
Message-Id: <20210314042358.682136-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210314042358.682136-1-alxndr@bu.edu>
References: <20210314042358.682136-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR22CA0019.namprd22.prod.outlook.com
 (2603:10b6:208:238::24) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR22CA0019.namprd22.prod.outlook.com (2603:10b6:208:238::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Sun, 14 Mar 2021 04:24:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a801711-9b93-47de-8f7b-08d8e6a10482
X-MS-TrafficTypeDiagnostic: SN6PR03MB3854:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB38545826401C92CCFA2C3CF7BA6D9@SN6PR03MB3854.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XNu2tsNekCI5xB8SDkbZ7PIm7NwyxbKdaFvcmzrXeVwNpIB2oeBtC+tU0EWGnGI/CIqLesk18uZFr0mtxKolji1JKLFSd49nF9Fxs05SyAWRXkSv0GiGjFxAWA59Beg4JhJcd76u9Mkij1p7pPU3pf0mh+4kUL12bpXrz7ZusySyRNSazdH7KLLlHd2WLS4YGbaSU+SeDvezbFvfHnDtcCUYdKB52LAHN/Wh3gKPc6f6GBvWspvWH7spRmPh7hSqX1E35xm/Gy27IJy0DBB4+gqBRAktu3in5pavi4UqkX7Yq2p6qhAdVfz7WH8NNK+w1ZBhmrLl6iJF5ei8Cf0nH77FzSDVDDQ19dufHZb82vMZw8zcdRSxHno1EKL7IpbY9dX1Js6fp+bwaIbBvqf0F4zHejSmsuxJ/3t/KljeRmerkFL6nTGhy2agYyIZGAlhD7u0fSDwtY2PHDZjxuaEE4/zNjBAUC7GQAgwNknImJR0zZa4mvEKfOAYERFGbfxvdmFFlT337mv3aq9Mm1d5kYOvfQ7FCpzbHQvuYVgE3lbDpDhEkosmCcA++jZqHcR8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(66946007)(52116002)(66556008)(66476007)(54906003)(2906002)(186003)(16526019)(86362001)(2616005)(956004)(6506007)(4326008)(8936002)(8676002)(478600001)(6916009)(75432002)(316002)(1076003)(786003)(26005)(5660300002)(6666004)(6486002)(83380400001)(36756003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WulxG+w4kR+cQC/fA6eaPNWP9KohS80Vf7f/fYHAyG1GtR8MSizHgto6rCbw?=
 =?us-ascii?Q?xplaBSuiMs1POCB01OTAsgXqDhmEmZBQZ8F2j4S3dl0c5fMKgkHF8++RUJb2?=
 =?us-ascii?Q?LpL67fiZxDY08gwXF0a6GlgPxYymwL8QRg7BBtzddeTVVaDxD+aDnKsw+D8I?=
 =?us-ascii?Q?nK2eGyiFgZ8Td5HNpw3nXx259INAx0jSsiLhB2ki2GD+Bk3c41O5N0lnW6yr?=
 =?us-ascii?Q?HiXH9qcVdglcQRh1uneDOKaDQbWNO6Xj/r76jtMv5ziqoUu8ifg2R7Lngk4a?=
 =?us-ascii?Q?RL1Ra6XFNlY3TU8I7QgR50bcwxbwGcruyF1pmRxgDvJDYTu0AjzPmOiTNV4H?=
 =?us-ascii?Q?S2AkYdaKoqpUbPmNzijaVvW/X4vJUKU4Hw26fIijkFFor76G7cs7hTl3JmaB?=
 =?us-ascii?Q?vp/yiNDAbE/ZrDDQAZtG+CgwzcWzm1FWBntvc5HeIijM+unG1dtkRsSzmWT0?=
 =?us-ascii?Q?E/c6w8h7GCjzoSip/RKvgpfc+JrJVfpmrfWq9IowKjJOjPXuDtZXb9T998cl?=
 =?us-ascii?Q?JBxMj7G/NfwaMmWhWBZbGISUk1dOzFusw5UW8QTuYcb2OmbHQSNJSc30Xi8k?=
 =?us-ascii?Q?SFl5y5chiizbdsvE9Gk1uCe8FSREy1nrJTbqoitkaLiw9wMjxuhxj2Vaxyqb?=
 =?us-ascii?Q?2Qxvvndrt3NKUguIJAoELMjQMceuo361vlpQChEQMP3wt0aV+SG0y2S4DjjU?=
 =?us-ascii?Q?9Nk0lo7vLz0kyK2rMmdE/co38BlLfjwKUoxoGsB0I+5LCCA6xYCKVfTGQmD9?=
 =?us-ascii?Q?CJKFbfixD7qYQQv2w/9ywD9rso4QKIbYSRpBPgYs81E0A7BhSIDHX3yhjJld?=
 =?us-ascii?Q?0rQWHvtyvfu5rI6rV5K8cRY6I9EEsauH91FxOmEMVJJmDVqh/psmuEN2d8gO?=
 =?us-ascii?Q?JRGnpQKDgia2uQIVfKwY+q+/Vxpw9W48sf07KIqyVu8Yjr5JoDMeztKJTiLS?=
 =?us-ascii?Q?o3KQi5wFdU2D2jm/RycHzZzaQF3wTJaoj/TtdVXiib5jt4HqUMxCpeFn0gTW?=
 =?us-ascii?Q?I0Q7M+U5rQGE1f2gzYxkAwEyaRXqVgAP9i69jPHESiu/MIVzmN9olWeAq8zT?=
 =?us-ascii?Q?H6PHBwo+zXkXgojafQEub9pF0LlAXXIukC1h5TAOltX0rp1FxcSX+y1D4rUb?=
 =?us-ascii?Q?5zZjcnyrtUYFlwRkmGDySEtJyAJvrN65MyRFp4ViJmNpUQ/RAgRwAW347Ejb?=
 =?us-ascii?Q?lgxGaTp1A1KYoEY7q/QLWKuedC/xaPbOw56+ESYvE+2dGNfRvWELS4DDkBQ7?=
 =?us-ascii?Q?6/ewShIGnAahyJJCvfj4DgJIQF004EfeTR9DJZtJSD/m+xvC3grzpw89Bigt?=
 =?us-ascii?Q?vAYTV4CVBxIfUqS8OLtnE1hW?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a801711-9b93-47de-8f7b-08d8e6a10482
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2021 04:24:11.4952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /iC0lSm8dqZzO4v/i/73YK3MCGBMFu0n66TaUy3xTLiN7Io3LJ4N4iiUsmuGaPs6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3854
Received-SPF: pass client-ip=40.107.93.128; envelope-from=alxndr@bu.edu;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
 f4bug@amsat.org, darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
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


