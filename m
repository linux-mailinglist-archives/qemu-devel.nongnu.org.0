Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFEA3335D2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 07:29:02 +0100 (CET)
Received: from localhost ([::1]:59774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJsL7-0000mX-G8
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 01:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lJsK6-0000M6-33
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 01:27:58 -0500
Received: from mail-bn7nam10on2109.outbound.protection.outlook.com
 ([40.107.92.109]:39681 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lJsK4-0005l8-3L
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 01:27:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K78b5fKKxoCzShjtcGrpPDnRh7muHTHf/BH+mlnBlyLDY18gCulpok0a7qQOzs0hmWRx09mrs03QgfOXurwdmtdaPIQIUIt/VUKVirwggtaL8WTfwYV1fVayljbA568GuSkTOw9CmRsrLigauOvSRtCgT6tMVECC1BGj1u7+ZSgAGGGk1V1RlnE8LDBmei9dqOks6kqIBE2uVuMLUiXNuO3y/Bd5RLKbkOfXeOXjvvK0tVlA84bbWfSB2iE+iYFqSct6yMpaBetmie5rNR+BTzY0BCgHwXBiMBhobQ92drAGwfhyJbU27TJQ5cbut6aZdSvNxbpt03SAaah8fDiGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqfKHf3Aca5I0IreZ+JJMfsluD/grJTnDJpi0pDdfbQ=;
 b=JJs3bv5FSwCBwsYZgMeucoZLYO2UzKQptaZpd4bOPXfmmMs2Vua+4zA5qu8TDlU2vJStMURFJgGJgFuGHdZTLRnj18FnNji2OsyHqrsEuYC2OBm28XPtnkwhqH0kFaBLkn32qgWmJkWSz3yfJZBfrZDMaHDfbIaIV50mmuGYg7y/MiGDrF8dFecUz15LlraH4RoHl6ZbzpFUWzxNf7SVLzVWj5NogQ5YMJT7rVrp9mBSsqM/2sLgzwmAlksQdWTr7iv+zEI89h5rfmJBTgsMZV35eVUmb6v9vf4pbZ1pRDlE/vYQB5U4NAU7RJKtnIHpERLKjewGUqq2Wqj6sbVwcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqfKHf3Aca5I0IreZ+JJMfsluD/grJTnDJpi0pDdfbQ=;
 b=grBAilKgr4SiehiNPG3Mm7hk8hzF2JxHRE047qKvZqY+jtjsFF6MkRB84EQF2aeO6ZUNdFXEkYrQmeWSiiA/0GBN0MUxDv7j2D6KxnjwCXeip6eMJgGVKci4Q0ICqef2s6jV71KzfTpRJsujw2+pJD1WUIo8MX/kEIv7aQL++t0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4223.namprd03.prod.outlook.com (2603:10b6:805:c8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Wed, 10 Mar
 2021 06:12:49 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3912.030; Wed, 10 Mar 2021
 06:12:49 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz: don't leave orphan llvm-symbolizers around
Date: Wed, 10 Mar 2021 01:12:36 -0500
Message-Id: <20210310061236.947182-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: BL1PR13CA0164.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::19) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0164.namprd13.prod.outlook.com (2603:10b6:208:2bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.16 via Frontend
 Transport; Wed, 10 Mar 2021 06:12:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9458c65-a796-4d0d-f6d8-08d8e38b87cf
X-MS-TrafficTypeDiagnostic: SN6PR03MB4223:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB42239E8BE4273B4701F6A266BA919@SN6PR03MB4223.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /NUNReza7c5yT9LQYDplPFeUz7ppyT06+ltTyiYg6MTdO1W+0PgCpXGdW212HIsN0Sztzhd6a6Wmmm1x+iVnjCS0hFiVM5yHyX8DZV9ccvZlmG8ZIViZZfqXqvd/kMMNQNmpEBvT0RmK+CRe+pSK8+kFOqzSD7fJ9vLVttKxB0P66ABydivdbJSF0n2PvlfE5EyHgsg0TAlR7IgF99vHf27nhf2OKMTjlDIo4P7NR/itAvnar8p3v4XMtZMzbsmTDeVGYuXKY0e9nDltXCzuwF/K6B3LBLkaSq3FVhqBU9F+/aTC54xF52Cv2LU4WnP0hhNeb2pV7pS+IythXgHgIwbMZ24dnG40qQ0Z3Jn3NxHV1DeSkE1r9o0z7Xsxbl1/Q5Q4BwKzaB5WuaAQhvyYsY4iLHT7IsR+FyxAiSiaP05GFx/fG0gj6sqO3wsuzCwBnjwUFiYcOPxdvQBOC+rsxnKpV8o3jj/0Gp6CP4xXrp9t1nKUahqAD9Ocue7d0nRzOINpEqArfjfIPyTXZ1qg0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(366004)(396003)(136003)(346002)(83380400001)(5660300002)(52116002)(2906002)(66946007)(26005)(66476007)(6666004)(6916009)(6486002)(186003)(36756003)(16526019)(2616005)(6506007)(6512007)(66556008)(8936002)(786003)(1076003)(86362001)(4326008)(54906003)(8676002)(75432002)(478600001)(956004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rgsaoRTa1G6iZkiE/IMzlA9choyMrr1xJIPpTLerRAeRlHGA7a6rlx8YHhbb?=
 =?us-ascii?Q?rylUb+dn8zzfTgpefEBQrJKEtC/hAIetjLA1KahUjd3YD2xDFJ+Kgu3gnKUm?=
 =?us-ascii?Q?6u2+oEh2yUC0x8H2FmTcX2LS3SMJn0uR7cTh38yuXGdwRHmEdWkTTOeiyo2B?=
 =?us-ascii?Q?BGv3hbXoJgF5V1Xg4BOayFG1jYFbSdzUvUGBW0YedgdfaBYfT7EW9Q6FTYiX?=
 =?us-ascii?Q?AcLxZsfKim4+UtzUXGf8DKJgsdQVYtBtPv8qCUQl+bdGf90GyZCenchT9lOB?=
 =?us-ascii?Q?sUTWqnfXpc6AgrRn9t/vlk7CFEoFL4bZbFR2F65pjJ3lqSE3PuvKGkJnVomJ?=
 =?us-ascii?Q?BTtE+VtZf8qBFZNNYorcJsriBOUT5puqDmrZGs85Bg+pCJtoclHeaeMjUyLs?=
 =?us-ascii?Q?Yv/ZdvLCmKF7v8fbPXD9W35zK5kLsTWtifp2fMxQ+k30PkGWctaXzoU2DExP?=
 =?us-ascii?Q?hoyDIThGqHauLEIjAp30HSAsuB92WAHhBnRDhQQm5acLKUXCH1hzVUBTBmB+?=
 =?us-ascii?Q?2TMiZOLwelhkMWg8ktT7Xu282SAg8CkrwIxdhGrsmBNxGb7Fpn1A0iLI+Elb?=
 =?us-ascii?Q?blBtok6zMiPkNbNMLHEVdfXISnK3etWCQThCQReShyRJHwBoGAT2ueSVTiFH?=
 =?us-ascii?Q?rbKRrw3j4nq7jivA2TQmC5wat3qsbGqp59C3U3Wg2zjkcmD39hWe2hG7HRfO?=
 =?us-ascii?Q?oSol9kjHlEMHeNhc6ewu5g0SIV37QIf0sAVfsa8RS9czWt9Qi9yNEuMX4JyQ?=
 =?us-ascii?Q?VzJgooCas8HSqhOlP0zjXYpqPEzAJ8NFNI5nN35Jjoqn2KRh56BgT/umcJtb?=
 =?us-ascii?Q?y4sIV99Pj8IHXqwyRF7Fwafdkmq48bGCuz7gVtK1JUq4QoKxWkNzCoIAQm/l?=
 =?us-ascii?Q?yHUksdIOqaqC5i8Z0aZ0zzeWABHZ0FTY33obVXF3E2Fn5kSuqXuzCYdcyxJV?=
 =?us-ascii?Q?TEtk9mn16YL/rSHMC9lsHHpdPN9TuFcdxTFS3m4F/UiuDtpVuveZtLZzdpG0?=
 =?us-ascii?Q?B6jH0bt6Wx00ypZv3P2RtTlEBPj9zqk8xx7t9pLJmqECU71B4TbSn8YSHPSd?=
 =?us-ascii?Q?2pJqWv4h/wNyfWTPVRKvcsPpH2rRf7/rXtOZLXpXfKaUXF+qSjLuULUrF6d5?=
 =?us-ascii?Q?Qru8JXht6nyOrcEWLxxNtpEt5ZK3ZvQUdKjBNWO7GE7wxl2TA6t+ckGHK7MV?=
 =?us-ascii?Q?LYZNqTi1K547Y0XBDsdz/HOl6l7uv61I1YP40arnpFRQzka9cqKPq3T3ojZY?=
 =?us-ascii?Q?tc07iYrz1lQkNZuNjYKfR/ljFuxn320i8Fgpu5vblERAR9SGM5MvuEIebOj8?=
 =?us-ascii?Q?RbZvtheNm6wx+kizD9mh7hU7?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: c9458c65-a796-4d0d-f6d8-08d8e38b87cf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 06:12:49.4741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqRzMAwtDTxQrvP17P3kNKGQ2wn6AA9NrjFj6qMQM3a1WnBAAuUwEOw62xI7WGpq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4223
Received-SPF: pass client-ip=40.107.92.109; envelope-from=alxndr@bu.edu;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, f4bug@amsat.org, darren.kenny@oracle.com,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I noticed that with a sufficiently small timeout, the fuzzer fork-server
sometimes locks up. On closer inspection, the issue appeared to be
caused by entering our SIGALRM handler, while libfuzzer is in it's crash
handlers. Because libfuzzer relies on pipe communication with an
external child process to print out stack-traces, we shouldn't exit
early, and leave an orphan child. Check for children in the SIGALRM
handler to avoid this issue.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index ee8c17a04c..387ae2020a 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -583,6 +583,21 @@ static void handle_timeout(int sig)
         fprintf(stderr, "[Timeout]\n");
         fflush(stderr);
     }
+
+    /*
+     * If there is a crash, libfuzzer/ASAN forks a child to run an
+     * "llvm-symbolizer" process for printing out a pretty stacktrace. It
+     * communicates with this child using a pipe.  If we timeout+Exit, while
+     * libfuzzer is still communicating with the llvm-symbolizer child, we will
+     * be left with an orphan llvm-symbolizer process. Sometimes, this appears
+     * to lead to a deadlock in the forkserver. Use waitpid to check if there
+     * are any waitable children. If so, exit out of the signal-handler, and
+     * let libfuzzer finish communicating with the child, and exit, on its own.
+     */
+    if (waitpid(-1, NULL, WNOHANG) == 0) {
+        return;
+    }
+
     _Exit(0);
 }
 
-- 
2.28.0


