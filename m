Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D86E3B7C2C
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 05:43:37 +0200 (CEST)
Received: from localhost ([::1]:32946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyR8R-0004DG-Kb
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 23:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lyR79-0002Dq-4t
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 23:42:15 -0400
Received: from mail-mw2nam10on2132.outbound.protection.outlook.com
 ([40.107.94.132]:5024 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lyR76-0007HD-VG
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 23:42:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnDb+e2VuU9uJ65YsWR6eHjmYwYHB0N1aHs2QjGg1VTYx6kadavUs8l3Ysm+hipxphoQl0SQaxqkjXPSMHVHDsa8S52T5N5vLO2WzsDj4u9CdVSc8wLci5jC3T/v0TNRxQ7VijRL6OqPgdQm7XYUMaAI1sv6r5EavAVHdsRGykIml/1Rl7Ca/ofwuzAA7VOsO4ipT4nPPAz/IqkoLUT8bjdnYEvzPW0npww/tVrlpYulbEqJ3tZBKk3q0XLryqtdzCwwE0dqm7EWdFk/z222X3YtFrR9Qmjs6/9vBWwOJqyt5YzYwEauVJxS6zF1MiEJM5w2aaEbgV16c5484X3Okw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9imeiB9aCDEIdZCqooCS7CIrBJUip/G8IeHpyIdKgus=;
 b=S78jJ1oa2fSs5TlXczGnPjWrWv6ugwV8KMonEtbi8jouyudvMmy4oQ1TRMbAUc7o5EZX9bujbQofIzjacoIAjibRBDgIAYoq4KbzsbdOnKHTg7+7xqIlFVbCDNs6nj5qM1FfbHqzn2F1B0CeP4dA4Use46sFROKzLiNdBx2QkJ504JiB5npGCywnBcAnEq3fAOjVmpPFI3dX6pv3eJ8zz2i8Ho8C54gE9LUbxTXBFzgAxNRFCTbS7ke8p//7f8DJvf8xaALMKwjDvhCzYjYECbBAo2W73IBWJJD5f7dUamM9d94sQc9/kUMgCDsDaiSWMFTz+LrvdsGqo3fKzPmppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9imeiB9aCDEIdZCqooCS7CIrBJUip/G8IeHpyIdKgus=;
 b=mBl0lcybLlvArcMZ+gwZpsKPC/pekMMOeWyQy54cvWkOM8rNs8AEpIjbigF/FCa4mqz610c/VZ60+qsrl3AfIx2E21tDu8OQVD7zhOle99voBurXT+SeyDJJ45RSnpK9Lhp+KmqOoQjJ95+QYwOEtqd9KV93dvTzgazz/dn9OZk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5817.namprd03.prod.outlook.com (2603:10b6:806:11d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21; Wed, 30 Jun
 2021 03:41:36 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4264.027; Wed, 30 Jun 2021
 03:41:36 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/3] fuzz: adjust timeout to allow for longer inputs
Date: Tue, 29 Jun 2021 23:41:22 -0400
Message-Id: <20210630034124.222689-2-alxndr@bu.edu>
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
 Transport; Wed, 30 Jun 2021 03:41:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae21d752-12f0-43cc-89f2-08d93b78f650
X-MS-TrafficTypeDiagnostic: SA2PR03MB5817:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB58173AC5655E1A99B3C63C5CBA019@SA2PR03MB5817.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wPi/uFcRMlo2DyVEYrqbh4W348cucnPgF0U+y0EdErXuBauy6gIhq9pq4iq6UDPfZ9CE7KZ7SgiJ6dAmAsiA/QdsHq/jh6uJ7Y2H2RH0btz6yGKkrl5i8hW7hl0amc37+KchxX/WoiE5h9wWT9TP0Q5JiIoRTih85GbnJVfVVszya3+Sxdu5qIP2EeA0UxYoVw56QXfm6KA2i15CgkChehNyKC5qDJitewfl9/nX/pF2h+ZFbAYa0w9Z8JGpxzBWRW+QQkCM94QeTzksgGpgnljXODVO8y/0CPdfAzjX4dW1/5gn7yJrcJvjq5EdWBJoqHFEgX1IJmssJy13iXh1G+FFrUjXVMoOpd9nLOayiiVx8FW4MH5zoyXM+I7kqot3HXHSbOmR0E+oqaBqAUUu+9GgnOjwpw29YsVL6vOpRy5I/2gv3G4pQXZRWOiyCfywhkz/+TSeRNyNcYJIBLsMXg9uTSa+FGeXVF/CslvmthG2x9XpHZpUYZNUVaIMFGFEVpn2yGM4Ro3gQoHqgzTvGZSNkVJeJtd145B7tAUvyVmnEHnCt54GPXidm9ndL0Ea5r9sK6RTE5V5FmXoSfk9HfV41qIypy3YVU/Q4H677l3Cf+AeHjYr0Po8W7wxsPtJZUr7yT/DYX/RtGNhDUqIMYUvWvTyHavYIELyb5pB9AoRQDNAtfapZaB7SmSRD2MY2RoNxQQ6uCzodw3UPc4C3Owi8U8JI23L6wKe0vCOYc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(956004)(2616005)(66946007)(66476007)(1076003)(66556008)(26005)(478600001)(16526019)(38100700002)(6916009)(38350700002)(6486002)(8936002)(8676002)(6666004)(186003)(6506007)(36756003)(52116002)(83380400001)(4326008)(6512007)(786003)(316002)(54906003)(2906002)(86362001)(5660300002)(75432002)(148743002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HMFBN12z+fHKIO0LEu9BZ0Il2J6McWlBFU+wgdugMQPTHBQAINoqhB/OfVzz?=
 =?us-ascii?Q?1jTMFf69Ik5BAlwvNMy8wmOP1CW0nQEh58I79w/y4Vrw2cKR+JUTzVakobv4?=
 =?us-ascii?Q?OdVxtlZ/Qy2YTuA2/l09A4xnf9mlBwyQuwIIZaf0koO4rsQO3txVNG80s5oi?=
 =?us-ascii?Q?g1DnOIgfhjob8d1k2iaCEEAA238BNRFsiWepDnI9sjnOJCQvTYm5BU4UQdz4?=
 =?us-ascii?Q?0PbwM2TODiISl/pVwPJr+zjTOH02+bI7Qh4o8ZKmSyFgCJkjLeWFMFR5LMiy?=
 =?us-ascii?Q?l1kqPEzjlkKn0EFDf5hknioxPL+k7oVri5LvkZd2NegdlTVmaadu9icn7G6e?=
 =?us-ascii?Q?FrtU/5gnGEWlu/FzA97PAXDSodOpdqEg056ep8WvTnb4qgI6JbKmdWRjcgIP?=
 =?us-ascii?Q?V/bbkoWIhaZcZmkueBSKsVp39gtbWOx9wR7MxuRfMh6CVG31saUWTNV4YzP0?=
 =?us-ascii?Q?rU5+cWIbOKwpgPXOI5urX9MVfkXldz4LlKaQiVeX1oaRCLR+0oZ7lo286fIl?=
 =?us-ascii?Q?o1DgYVPYaqXqw6ADw7capGg658tTwojUbVWwZNrcIdxmbe6hgzmqHUqMrXYg?=
 =?us-ascii?Q?limEbw841dVVu6veLV7CUUIqOuodIb4u3gDCbL0vqkRyk7pIdZulSNi6qn3D?=
 =?us-ascii?Q?vPaMiBFtO9KYbuH7jTP8Cje6c7N0hWhosLuKZydUniS1+zWwNoW22XV18S13?=
 =?us-ascii?Q?rK2PHlB1TQ4b6/vIx3eELAVD0vMBqcVvF86eYhKhYDOsk7CuqBr5BpFYuY8Z?=
 =?us-ascii?Q?F6oQ4olqbKW3/ifIh9Klss14CLUa+nG29C7pFxbCZl87o5ryixThLa4/qVkz?=
 =?us-ascii?Q?oATXqknTCvFgPGHjcQ1FyBuBF5yU4PpGSiLKpVlBoNs4KThfvpIC51AMxL/4?=
 =?us-ascii?Q?psQUdAuciirNM6ZobY/LutKghSySLgtk65HrE2Zs8gPvMIJN9bCawF8OUHax?=
 =?us-ascii?Q?AcOB36VIdN5utfC4V43HrZfcXzGUXjwKODkZ1Qn+v8fBB2gLMIfS1X2UFf6F?=
 =?us-ascii?Q?C5qST7SMrvN/bCH4cPhpLN7Q5KJEDzyzFX8X/TeyeFc4cxr6jtVO+cdNj22w?=
 =?us-ascii?Q?Ael2F8PXC2SNkOlHIg1As8jzMG7lndCnQiR+rKXgCfmk7V6rJuP0zmgGFmR2?=
 =?us-ascii?Q?zt4RSzWlR/ck+IyKqSjX0TDyBz0DV/m9sgngtAj1h2luoQpr9XebkF7FP+KR?=
 =?us-ascii?Q?jaB2QKZrEpahog+pNxZYN2Go5u9axuWEDwPfpude4InzjMmr1NK/1wFMF7r7?=
 =?us-ascii?Q?7I0US0X9u7ZBtKOtwTL/h4Z2pSXHeRR0PsYi4qbjwU52WIgeMpPmpfpvlbkG?=
 =?us-ascii?Q?ucfUkuOUHovTwTxXLkZeNlJc?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: ae21d752-12f0-43cc-89f2-08d93b78f650
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 03:41:36.6002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMMJIcuYOc1IwBEMMAtTAQtXvU3wjb3mqsRAxTFtSHGM/XCOTnKUi/QyBAIbGdHf
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 darren.kenny@oracle.com, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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
index 6c67522717..43f9011626 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -661,15 +661,16 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
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
@@ -679,13 +680,17 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
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


