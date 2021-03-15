Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02D433C60E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:49:04 +0100 (CET)
Received: from localhost ([::1]:36566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsH1-0001M0-Pg
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs72-00045W-2z
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:44 -0400
Received: from mail-eopbgr680136.outbound.protection.outlook.com
 ([40.107.68.136]:62341 helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs6x-0006K9-O0
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWI6ozYKoKbFnmm9PJfTASkOa6KJHY2mT/x/TmfgbLax6BKhVgZmYlvj4njk4sgT4buZRd8j+B7pMlw6ZxxTVcGf2GbPloJCohphrbonziio1nb7oUFod1lE68R4DCHxmhcryahzCfHwgB7UFbItleScJ2cpwMQrCmwZYl+7CFSxTvLn2xgMXNgVk0Mfd9iN+IgQEaSXdGGFb9okIk3xTpc4gj1RfN7PZTrDMwOAzy2azCxXHzY6lTdF09BySB3X9LNMvlmhS94h7SRsKPJf9iXfa8KrRUY8YjzKUxd68O6u1gZSGhvyt4D/NRxQYpQygpTLjm18sOpvpkee4gtiAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkGe5NMIUMjifo0tN7NhbdqrwQb3GPoxoyg5IddlJLk=;
 b=AHYiCjDV+usww7suX2soXnEdb5acsl2fztJihYG2YQrkFfTMwh5WJbQr+0g+aLPGyCky24z7rFzUHaNXBRwiQEPAqKgOyv07WjlRmJ+yHgKTuPDZWPm5WdvBUbcVcMF/zkGcu8XVp2gJYP26Wd4mCfB+hpXpx1z+pL/VA3vvWy8VzRcG/LfPlz41oyGJd7ts4Vx4pIWDIq6Nh8HoFBVXy1msXXP19HohfheuasYKBjGpU7ephWuJoe0ZBUUxkY1Fx6RLo4ne8R/yzUjSiAkKoEukEAbUBSyl01nlNy3tLN9+i7O3veeWXy/F/QZSXGqHl0xrEsu5zm/D+9ZiarMzDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkGe5NMIUMjifo0tN7NhbdqrwQb3GPoxoyg5IddlJLk=;
 b=oDYmKJ6NseFJc+ht9cvFMobsla8rvAhLJ48/y4M7V9RxBMdwQunSk9MBmFMOKTW1hED3O4Vu2dh1JstxDUhrsHiBOgXJebjQ6uzJg1Q0tw4iCqtkpqNEu2z3+GzaLtRB5RCb0IsByVdHTygzO8xFrbsg9B+M7gyuf/ODWcdDW6Y=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5724.namprd03.prod.outlook.com (2603:10b6:806:113::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 18:38:29 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 18:38:29 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/11] fuzz: add instructions for building reproducers
Date: Mon, 15 Mar 2021 14:38:08 -0400
Message-Id: <20210315183812.27760-8-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315183812.27760-1-alxndr@bu.edu>
References: <20210315183812.27760-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: BL1PR13CA0323.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::28) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 BL1PR13CA0323.namprd13.prod.outlook.com (2603:10b6:208:2c1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Mon, 15 Mar 2021 18:38:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b2d3c2f-8c9d-4647-d6bc-08d8e7e186d2
X-MS-TrafficTypeDiagnostic: SA2PR03MB5724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB57246CF04E688C95E14E8FA6BA6C9@SA2PR03MB5724.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N/LNgO1GuBzIGQ1DwEgZ7GV7AjdVvT2yhOjteu3+t4pAg40Z9ZZ44/NWrv7VF/F9wRQlyEfQgFA4scmRpo8gK5Yu6Sw8CW8/OfKgqryvtVyVq1MI1WBQrymADwrbxsf51KOqvn5wUU28qKPPI7YNLqMJH7UyVevrLsH98W0OLd/1MC2zswSDndBORVLLgYD5cuaMQ4S2HjmgN9JQEFUmoUJUjZNy5g2vFpn4wF2XDiWpdVBMlSCBPt3Y5K7YqcMqr9KVsqGMP/3NnmmbZsgoQFD+IO4q3a9gIjLE6GnX8/UlyvpLS2N4k4R6OVbJFYGbjjJJHY6t2hWN+/eGzm8w4E0vL6e87mRZQBeEO4mHJjTVJgDIBBWWBOxb8In+/wajXaNsBiKnJ+78kNHJATzOKHG7RbN5HcdlEVR7AEgc8z7HVmpnqEISaGaf3tIEIgNHxkvGDMr0Az6g1UWrPF1w3A/cwhYKDMU/i3g54PYuTdRgcYb6+dQXRJm7uthU5NpyM80JGGW2cHJQvfjTl2kRCH+qGMKDDz2tf1NNUThn7YmHX/21Nr9YiGwsXf44T3Vd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(4326008)(7696005)(36756003)(52116002)(83380400001)(6916009)(6666004)(6486002)(86362001)(8936002)(66556008)(956004)(2616005)(54906003)(786003)(2906002)(16526019)(186003)(5660300002)(8676002)(75432002)(26005)(66476007)(478600001)(316002)(1076003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?m1jvNyg3DDs0q/aEmuxFoEb4whHwQYsN7osLrHvAdpyjnZPm1CIP45VuMtpi?=
 =?us-ascii?Q?cRkDOW2ImibWrN+dhpxfBdCxFx8v840feuKwSEzZq1eijBk6RuYydLUpEKcA?=
 =?us-ascii?Q?7I0ezkksPU9GLnRS492MFb1o9cTqKOnWHpZBEKF6Wwl1iiV9ia1gFVEl/fGK?=
 =?us-ascii?Q?phaY6p99+/tBvgY733w88We3wGU3OBTbWDvQss3CoTGaUmqEXqi4m41g2WWm?=
 =?us-ascii?Q?DvZP/g1LXpCUrHBhlEhvVnylHSyHeWxcY010euHvxZvjMPDLm5oF3lJwTbvJ?=
 =?us-ascii?Q?Id0hkOcyi454YW2xyRkw0JxO95pu0HtjEZgLHFJPWRmWODet1eCAawuWuflu?=
 =?us-ascii?Q?Xgdx1KqNEV+zaqVMHXUMl/uvM7ZpKdIq61H/dGhB4LUMX3c4s/n9igOiipTq?=
 =?us-ascii?Q?TJ/hbQbnVctW8PmkHfWJXnoBPvJ6s7JdRTGdlrd0nLWrCWpbixli3vawlC1j?=
 =?us-ascii?Q?vcEumaSMIGITFHAqiMf7NqiUI0ATrdJrmgveHSU3UkIFWNQfAVKUz2DqMguy?=
 =?us-ascii?Q?bcilx4jvUF0GDvItweeCgsggDuRLm+tr0t7Ck3ID74GgeaagJM/IMWpgDt5+?=
 =?us-ascii?Q?dL7IvGbcaDjMVZxYBMNleyIdcGr0qE5d1qjFbLplk4ByFlduYxWksgtoaRpQ?=
 =?us-ascii?Q?U1F+Ziq/6CUR8HO4eBkJzvQZVEVNb3T8TOwk3Hk/SAv7I+AUOEre+2amiWy2?=
 =?us-ascii?Q?zou5Sa1PWGMfxOYOHYYbCOMkT/TTDmAGxnPjAFAmxbo3Vs5ZJJaTKdE0Fkko?=
 =?us-ascii?Q?UvZo2mNCOZMkqDQt2aNAckdNhmpKz2/bbCDmWKGfK1pMceuBWS889rFfpxmo?=
 =?us-ascii?Q?xyEoREZuyrTU5XzW/dmQEEQHxrZVDr40aTa8sto0O7mv1lIT4Z9/P3+/p10i?=
 =?us-ascii?Q?FoEksZDO7r1VxwpF3JMGZDNR+rwtrRQH0ihBiQSl85Sv30MX6CfA5PfpXdfy?=
 =?us-ascii?Q?ViTQcV7CacoIHz1rANZpbsyWgtuCVfm7Fiz8n5E8lHQeCRMUHh+ICdRMBi4u?=
 =?us-ascii?Q?micn8yds1y50Ug/wXBeGyjEYoqINQGX67NLHm7fyEYQzXEQzIaozC+0TsmQ5?=
 =?us-ascii?Q?zx48yGL4SXPSEtXoed7vD3jAttdfww2z89yqQSJWOPeCxzCm11N2U/bRu/cf?=
 =?us-ascii?Q?3N0o/S4NIQ16I0ftLxzxGaFp3bDvUaZeldLA4Q30jtOaehMxQLHLh7LebCDY?=
 =?us-ascii?Q?9OIqLg2tCEjhp2/fzVRP25LsOKMOQ8Kk5ak6LwBB0J9Nav7wGjsaIIIVg77f?=
 =?us-ascii?Q?h0mpbBdXQHJp/sVX564HIE5LZX6YEJaas2kJY/jxXtPonNu1xi2sA5qX7WXA?=
 =?us-ascii?Q?KER+LlnQWGUsKjAPqP0TFy7V?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2d3c2f-8c9d-4647-d6bc-08d8e7e186d2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 18:38:29.0916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fh7435DWxPmrjsefsxTD51NvAtcsDM1R3R5v9EjiGyygvZryQDti5sO3dBX6nmKu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5724
Received-SPF: pass client-ip=40.107.68.136; envelope-from=alxndr@bu.edu;
 helo=NAM04-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
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

We have several scripts that help build reproducers, but no
documentation for how they should be used. Add some documentation

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
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
2.27.0


