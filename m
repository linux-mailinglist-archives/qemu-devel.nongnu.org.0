Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BDB3C72C7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:05:50 +0200 (CEST)
Received: from localhost ([::1]:60350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Jyn-0004fz-BU
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3Ju5-0005Yb-4g
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:00:57 -0400
Received: from mail-dm6nam11on2096.outbound.protection.outlook.com
 ([40.107.223.96]:35521 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3Ju3-0002ks-If
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:00:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emTukVd2Rwxo3Lu7G0Ivv3LVUvj0NrVae+ecJUFjaYntAd74oLQhNuo38j8jOb8+IK66UVYVyDaaLfONpm5geU1ahdONK9zjRk6Rl3KDJY0W6mX7xskenEf81joXBicnCUxs4ZYK5WGEQFR9jHYCztJdqrULJB0Trd9PM9bjlI5ufBpRa70QTUgbdsADiPd2/LgFP8bmuXJFGzeOTOc860oC0W9O+ynDc0tNes3WNpQco6rvPl2RwyXCiZ4MM8S+N85x+PzHS3Cm/tzrWhCbUHn/B+QuPfivAD+Kf1Q89u81hGDNl9g6c1IPG6rreeWx1Qepw3r+yKl/cpW+B9VVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDuTuRvvyyjY/C3Rw978QPEPGrNt41qFTnQqUM9FCgE=;
 b=hUU0dTMqcHvWQvh/33Dmli9Jyv5jCr4ky9rY2oN0JN1zPJAtoPrWuZhMLaqx0MZ5u8K5kOdE8X8lfwXAOd5VGIBnDeTbqtN16d8sNFRVLI33psYxGFM0+UTvZjEuKxrxH/4GfBfTlduE8D7gLXF0Z1fgl8C2aYtuzlAMzDSFSqLZDrhZuEQJsofmbHneLBwdWIKTjHxZmZ6HJcDaBMjFVufMHB+3NfD5CvfIkdf5VjZF5E3SE6+bAQXATZk6NljVfxmIR9Y5lMZWSsEzYSbUovmTTf0CiWzREc11dW5XTlDd2XvAfvOA6gVyUU7KHFzsIBY9AAhbnhnnNZefgWWeIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDuTuRvvyyjY/C3Rw978QPEPGrNt41qFTnQqUM9FCgE=;
 b=pQDGlt7OSLpZQMJ8qAuNhoQvqwpALq3ihWipFKsTWpWeGvRJCqM6cADA9Mlw9JsZpPslHx36a1itxoXNT8Ah99l80f6MjlCNvxeBfwFcv8aLnHOjc0xG+SOckJ7ruryOCBzYYsmGL7ZK7ynAKr1/QUYcUydxXNKo2yOf0s9YZNg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5722.namprd03.prod.outlook.com (2603:10b6:806:110::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Tue, 13 Jul
 2021 15:00:49 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 15:00:49 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL v2 2/4] fuzz: adjust timeout to allow for longer inputs
Date: Tue, 13 Jul 2021 11:00:35 -0400
Message-Id: <20210713150037.9297-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210713150037.9297-1-alxndr@bu.edu>
References: <20210713150037.9297-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0002.namprd11.prod.outlook.com
 (2603:10b6:208:23b::7) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR11CA0002.namprd11.prod.outlook.com (2603:10b6:208:23b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 15:00:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f469b962-b86a-4629-4f0f-08d9460f004b
X-MS-TrafficTypeDiagnostic: SA2PR03MB5722:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB5722E52837FC579AD71E7312BA149@SA2PR03MB5722.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rqlT6TedaxCb7NvL9Vs1m6QNZF+/JwQMdZAiWJyLPqMjvK1j8n8AQdYfA+hjiCw5F1/LFhP8iRkpf1wKOBQVLNl2/Dy5p5cB8FMnyv+O1nWwt1/oBv4vzTgsZU2G/yN5NSjPlRLH8eADPm43sk+GdogMRIqprK8tR9JosjG28x3cIyn8pUY6Sgh4zoQHM/yboMc/ZPzW+7f6kM14n30j51An0Fzv79uDhZ9irQuJgJ779i/qCwuZbTGIS7DyCB+HXJGyECs6B/DgFGiAk0xfc3UpCrPk7OPcvMw7A9AhizybJ/o9pWAk1VwDQr+Nkn9BDlOOmOAIlwfUjnuUpb1NB/o4XryU8bvYTU9VmFkaP1yfKy8vlIG27GOyrRmPBe5cHbI0Zr9rXj/a8L52JZhy6IeAbPXqZEnsTqEQeaHm1ZN/mi74NHKM5rFtjcAiF2v9jLwP+nmKgxdo1zI7ihSg01TwypdwNRKev9QC1yb23SKBZzqmoPnbSKkpFJJArvySGlfwDMUCZutYbCDdu9BGZZaCOYzNB/cwxaRx6HtNSFj8DVHkoX/jn50H8UOrLrKIc3gElYYwPBH+HPi6pKX1eH1Cqg7OI+ZGBK+LqmAzm7J55qThqK7F4T/21vuQThBnHVNoFQ/aV+4SokJKGQs8K8i3sOAGBkgtLjDouZxZMAjyfiZn+1Mp8GdwLkpr15cSu7Uqt/9bzxOSp3K8aCfEILJlwwZKIgT/3vEjV30WYL8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(6916009)(2906002)(1076003)(66946007)(186003)(83380400001)(6666004)(52116002)(86362001)(66476007)(75432002)(26005)(8936002)(36756003)(8676002)(478600001)(66556008)(2616005)(5660300002)(4326008)(6486002)(54906003)(6506007)(38100700002)(316002)(38350700002)(956004)(786003)(6512007)(148743002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xBmrmny0Q/vDzZuH759fZwe4leN9/KWC/5ck48q0I8peVCHMmXyYmdUe94PJ?=
 =?us-ascii?Q?rHTxMZF0AVF2+7ohmM+RHaK4A0dV2e0BR9E2kBZhJSQ6yTMr/FW/1x5YzBWk?=
 =?us-ascii?Q?Oy0qRqh7+bUF5i9Rf3q4tRSUC2YTaxhdz3RUyXlF2XpQDkeLejEZVriL3F/r?=
 =?us-ascii?Q?cdeEN3ZJqk4CYLYO+xmu8rcIS0Y0yd/NxSqmBFjnqNn54iqX/sS1l5VEegXj?=
 =?us-ascii?Q?/66rBRGgPH+ToeRq15y2cGxmH4NpMYIMzkRMMekRtc/ZyLem7amF3ADiUSa5?=
 =?us-ascii?Q?wAEq0l3w9eiqtXzbndbH3Pf0XQjzfrLDljbBrwRCiWrYEGl4bkI2HKw1mjQ5?=
 =?us-ascii?Q?5wAZ1TJzgl5MZTFVYUPyK1kRI3liIMIdj24rt+3AzZNRgxAkIeSdAsx+zAnN?=
 =?us-ascii?Q?KwGBBRA8FqoGXcA6H7WgLY5hjwijnx6GGxY6CQjeQN2INiVtINHVhGir5HgD?=
 =?us-ascii?Q?ZiXEmtjznrzV6FUz5HtiD8P82vHOmsWGBzkrWMpzvpt1X/Q8Ix6QWPT9VW6O?=
 =?us-ascii?Q?UOgrJU7HiOVdpo6zMnDpLoXtgLH9hcex4OXIkHkdcJQPuIpAey9s78+T4uMs?=
 =?us-ascii?Q?Z7T2MESCz9uKoGghgwHjcNiN9vggMma88lrQmts7pJyeaQUHIyY5ACFzpHtr?=
 =?us-ascii?Q?RwnYCTu+HRG3Pt/kwpiH2LlJ5/1gH6bHKeFo05PRuvVf8hZo9lo+pjPVpljC?=
 =?us-ascii?Q?zaPomDjzJRr8JAkWtjgxECoXcgonxmeObPhAi3NXvFCR6DQopf27akYS4//o?=
 =?us-ascii?Q?l9NY0rWvc8nGrl6/6Bhzk0RhEg+6wZxZBzdTm/LOg/+gms64QTskKu3h4QzW?=
 =?us-ascii?Q?6yfCeN3XVM6IrbN/rezh34go74G+e8F0evPpiuFauKI+qJteXDbF1zGz8oKy?=
 =?us-ascii?Q?lA0qQq1y36dD539cXq0baVwtbG2ORUHkY2wfr16e6uGDayWmC6qYJzgfPG6/?=
 =?us-ascii?Q?xLlj1zd7u18sTJMnqqpsjUnTuCXD8lRy9FdOyTdG7M+d5QI0KPo56sv+U2e9?=
 =?us-ascii?Q?0psl7AF1gfioduch4CCoNXfMu71cTLu/DpTOEJjypD0LmZh7kMlR0QO8F2Bp?=
 =?us-ascii?Q?E5OK/kykE5ylDLoHDUnN+xBjSA4F6SwMhAH7uwaV4WdRI1Djfo6IFMhjMfs7?=
 =?us-ascii?Q?8lmjDSkaSTxL01pkw9NJ8S5ZC5u29ZzXd5WXTrxH5REP5Bdy3rlZ3IzQQkfi?=
 =?us-ascii?Q?sfS+DFSK8DWIXXLkPxGGKtyjvsktbV3kRpnfIbg3a9WbSxfu4jrRnB218jni?=
 =?us-ascii?Q?3eDVWAnnpp5RO2geR/ZQpupHoOYeYWB6YMxc5sqnEneqoihgvKyROWdBUwte?=
 =?us-ascii?Q?64GgkgdgssiLJlYXQGBJlJJN?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: f469b962-b86a-4629-4f0f-08d9460f004b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 15:00:49.5773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bB+5DGMKm0dV1bAwrX2lyKBSpIuP96M/Gn9G9uvHHeqyEy/TPgCNgXSLux8Tu1s4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5722
Received-SPF: pass client-ip=40.107.223.96; envelope-from=alxndr@bu.edu;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998, MSGID_FROM_MTA_HEADER=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using a custom timeout is useful to continue fuzzing complex devices,
even after we run into some slow code-path. However, simply adding a
fixed timeout to each input effectively caps the maximum input
length/number of operations at some artificial value. There are two
major problems with this:
1. Some code might only be reachable through long IO sequences.
2. Longer inputs can actually be _better_ for performance. While the
   raw number of fuzzer executions decreases with larger inputs, the
   number of MMIO/PIO/DMA operation/second actually increases, since
   were are speding proportionately less time fork()ing.

With this change, we keep the custom-timeout, but we renew it, prior to
each MMIO/PIO/DMA operation. Thus, we time-out only when a specific
operation takes a long time.

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 0ea47298b7..80eb29bd2d 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -668,15 +668,16 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
     uint8_t op;
 
     if (fork() == 0) {
+        struct sigaction sact;
+        struct itimerval timer;
         /*
          * Sometimes the fuzzer will find inputs that take quite a long time to
          * process. Often times, these inputs do not result in new coverage.
          * Even if these inputs might be interesting, they can slow down the
-         * fuzzer, overall. Set a timeout to avoid hurting performance, too much
+         * fuzzer, overall. Set a timeout for each command to avoid hurting
+         * performance, too much
          */
         if (timeout) {
-            struct sigaction sact;
-            struct itimerval timer;
 
             sigemptyset(&sact.sa_mask);
             sact.sa_flags   = SA_NODEFER;
@@ -686,13 +687,17 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
             memset(&timer, 0, sizeof(timer));
             timer.it_value.tv_sec = timeout / USEC_IN_SEC;
             timer.it_value.tv_usec = timeout % USEC_IN_SEC;
-            setitimer(ITIMER_VIRTUAL, &timer, NULL);
         }
 
         op_clear_dma_patterns(s, NULL, 0);
         pci_disabled = false;
 
         while (cmd && Size) {
+            /* Reset the timeout, each time we run a new command */
+            if (timeout) {
+                setitimer(ITIMER_VIRTUAL, &timer, NULL);
+            }
+
             /* Get the length until the next command or end of input */
             nextcmd = memmem(cmd, Size, SEPARATOR, strlen(SEPARATOR));
             cmd_len = nextcmd ? nextcmd - cmd : Size;
-- 
2.28.0


