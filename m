Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B60731F195
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 22:16:04 +0100 (CET)
Received: from localhost ([::1]:58148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCqeZ-00058T-8T
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 16:16:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lCqbz-0004C1-PP
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 16:13:23 -0500
Received: from mail-eopbgr700103.outbound.protection.outlook.com
 ([40.107.70.103]:36705 helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lCqbw-0004Dv-TK
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 16:13:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHRIxHi3gckXlSjzxpYDuMrzLYrkns+IJ1g3aGcfM/+P92u1svTc0NZYn1CDNmOJ6EFAYVnS59Hb8yGkxGKbU7WlwmtLcsPJs3CxMMkn2w4H2I1NGUagDGKGf3J7RqMY0iG5QqO4ru1J+majh/cZioE/0w3PndXb0CjvTN4FdVTm3f3qQdVehXPraLonziVIxhDrJ1tMrSpJHAUs4DRk7P1/LipA8DWWgXYYB+nV0MPSXm7aOLxM2yvEOMR0PqsrBzbb6yjAZZrymgt5JSNy+/P4mGttGiuIGcJ5q4maMbyeM9NgPNbtar9mOKksUTqDXUZ7NJgKw5iItGcE8387wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddRurZ+ZElZVBcGM+vuY53jvc4bKVIs+2xnHlY3ebZ4=;
 b=mBTzZ/UGn+dCZ8JgL3zj3kjFcp5S9wL5gKAMhp9xQEM16/Tag1L6aONtYCi/IDbgSwd4OwUwvLHmJ/eyWZd5J8BfWhb22DX3b88dNZd1FffA7v3hf1/L81Nyeub2vkuSVMWjxJzVa24gNPUa00ausl5Nbm5CLsqJTWg2DhCx53RJTQnnx+xRxiK1DR9i0C1FeGvEhBpLz0JvxuX6kJg1RP0fBkR75h0bkVfozF7sxIA31O5S2TfOzhIYKtUJl9Vi+NGnGYC3Be/8UUGwojP0rkbFqd/d04JwhVNhA73e+siNyHgrvSPd9hATI85s4Vk1q3Y/KbCAYAFJIcGFbBMMKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddRurZ+ZElZVBcGM+vuY53jvc4bKVIs+2xnHlY3ebZ4=;
 b=TDvIThLKxIW1Cd1fIVmMoLpv13ujq9WhvZoEgusEr4YWp517fubM7Lr4CWWFFy6ia9LTkZcap9mpKnAL3tGpRi2X6aEEnPdKWQAskibcqcNh0czREy/F5a63naTDW5qKb90/BmeOiQMemdx56icS+zptB1V8N8At7rzZgc1OuZQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5724.namprd03.prod.outlook.com (2603:10b6:806:113::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 18 Feb
 2021 21:12:40 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::e828:cd84:e00c:6310%6]) with mapi id 15.20.3846.041; Thu, 18 Feb 2021
 21:12:40 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/5] tests: add a sdhci reproducer
Date: Thu, 18 Feb 2021 16:12:21 -0500
Message-Id: <20210218211224.2513413-4-alxndr@bu.edu>
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
 15.20.3868.28 via Frontend Transport; Thu, 18 Feb 2021 21:12:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db89d94c-78ff-4691-332e-08d8d451ec9d
X-MS-TrafficTypeDiagnostic: SA2PR03MB5724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR03MB572410A4C91AE9CB231D76F5BA859@SA2PR03MB5724.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:425;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MdWSaveVTjHOTc69LCJCeoKlSqu/bZNSKRIev9BRcRFLX+xVCTG097QDP4KTq5Ze93zFxGiVcb9IDUJ8J7S9+2k3s0Zta+U0G01MDqZAZbyRfRkTC6n0Hoy5gAg24KH+Gu7PlyGqcnWoHHuZqCWe92RcpkDQyFTyMmRVV8mJ9mtapmN5XN464NxVNWO1mQekZoW1ufT1apA1qOKdJCOZmttqTwPf/tLGyBMW+Vg+OqtwUEevbjFVc/C8Uypi5RN/8COeKbQvlsO2oBpGJ77F0hXEmVMur/aRR2252iWgAnU5nAUCdPZ77J1v76tV7zwsWCfoxnpn6br0zAXWL2NaGLA/1I8Qhlmz0ZB5efdSpVQ68ZTLL/JfH5/G/YmfKtHpn/OEn8SAA1a2XIzh8ZAIOtT8kMtysbAvkPp/94r6/ps8n6atxNbHWE7jU0QTKlXudEQ6WhEn1Db50ZhW3S8k6oMmoEln7/vzA+e+g5kjEYuFOy69uDCxgxtVgfMWwLPT6MZSmwsqNTi2Ml46vUaP+eNizRjDLsaf0jNZUE9rXIvdsnbXUcyb29KNerWvr0b2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(6916009)(54906003)(2906002)(316002)(66476007)(52116002)(86362001)(16526019)(83380400001)(6486002)(1076003)(956004)(966005)(6506007)(186003)(66946007)(478600001)(786003)(75432002)(6512007)(2616005)(6666004)(8676002)(8936002)(5660300002)(66556008)(4326008)(26005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HxnDr1dWA6q3RZKQWEqBZmQ0i8A2LVDJhUTles24G59LioB//JrcEkDjF8Yg?=
 =?us-ascii?Q?lHQOXopEOfvquNWl04qyCxn5iAZJT+eHrtICBzUe9bA94WwEIb0q7vbYedAK?=
 =?us-ascii?Q?e53QuCPgZGkNR9ULjNZdDhnK0YVE+wDcowpTx89GOAqOqD7gwhdjd5keGzeJ?=
 =?us-ascii?Q?E1Aej8+MgO7VZjwwsH2wIUq9NpWF6WvoQRwbkHYQpRXkl8hWGjKkhP0tVHz2?=
 =?us-ascii?Q?k5E4bei/6h4k0cBXE9dLidvTyzhKl98LNV7gRFbznpn6bQdp8IxA2XWcxF8g?=
 =?us-ascii?Q?MGrEVIjfOmNJnnxdG+FAzZXMQOJUWAPjB2KOZMermTb5nzRe1nNWzWcr8Je2?=
 =?us-ascii?Q?RNJvhOAW9lcHy3OuWwzwWwFipfPJInl+W24Acwd6nyM/CKw9OcTUB/cXcWLo?=
 =?us-ascii?Q?jYryLpbQ+mpL87zl0W146iZsi9WzVlVAfagyywy/RM292yikADI6cgTaDJAd?=
 =?us-ascii?Q?idQ/BgAhgtjpPxlr8XK/uDJ2K4tgbkW74i1c29+bBvDPyU6911CJyLrkVDK4?=
 =?us-ascii?Q?Ps87fArXBVYmnbtfByZLOyeufjiBfjy1gz2qeO0ulP0DTIKQ8PnT5S7x5ho/?=
 =?us-ascii?Q?x2fEQjLRip5Go0Dp18ngyvBUNtjrphvZtz7BDmVa7CNG3By+jVgfyIq/oLec?=
 =?us-ascii?Q?qGwLqR0djFO5yCsOo307dkMEVX4Eu6OcSRzQZAu3k19+ztO5vJnJbhJmAUZk?=
 =?us-ascii?Q?Zk8FhgvmGKTc4VlnKGYrcqoDKt8/cffxlYM/sBAWC0J5CsrX/w5uq8k/q4WE?=
 =?us-ascii?Q?0fUayFPgg2C2onSp7aigk8/+u2qlzaAVSFMVJMdOPJO59rqozGhhT8jEfohG?=
 =?us-ascii?Q?5L5O/td+ij72/0UXpCCrnSC3hR1pV4t1HP8akORP6m/vXyd2gaFI4ivdi7ER?=
 =?us-ascii?Q?suWzUur9ql853lUB0WIF36fc9X28IHkIdHUiaMw3XbD6S8okbXxLd7Wb1UgF?=
 =?us-ascii?Q?imLV9u2+4U1ogGj9LLFiEbSva6c3pJBssAABp9eKXJcdyL+9ZURoLMmF1ehf?=
 =?us-ascii?Q?PKiC4/9gUWSiP4QQZB//usQDfvTqLZ1TTd08Ijp4r8X162rBSjIWDFdCChZZ?=
 =?us-ascii?Q?0aSne8W3TnDn12vDoM6a6iUYczkXlpqLPNoj2T/zGwYqoEHvygViD6II+QWh?=
 =?us-ascii?Q?s4+de6BpB/Z7tdda8KIQqorNSq2uuDXECvZFYVhGYUVOenLefGnn5YIWvyky?=
 =?us-ascii?Q?J3gEB/QQEhzcxuyxj46Yq/Q1lnKjaF/Tp5S+IeNkLCO/XYtYN8rXhazANfIn?=
 =?us-ascii?Q?TcpA6LGG5GA0A25SWHZoi07fuIw+OxiFV8Zwb58/yxJXOmgppKiJgIU45w0S?=
 =?us-ascii?Q?kERj+P6SlWCZVRoNXCKCjxz6?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: db89d94c-78ff-4691-332e-08d8d451ec9d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 21:12:40.2738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYCHmc5mdAIAEWSYPgRX32N3SpzZdlQuoK2bUXbZVQi3brhL1FnAyFQUjuavsgTV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5724
Received-SPF: pass client-ip=40.107.70.103; envelope-from=alxndr@bu.edu;
 helo=NAM04-SN1-obe.outbound.protection.outlook.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch serves as an example of a file generated with the
./scripts/oss-fuzz/output_reproducer.py script:
The source file in this patch was generated like this:

$ wget https://paste.debian.net/plain/118513 -O /tmp/trace
$ export QEMU_ARGS="-nographic -machine accel=qtest -m 512M \
-nodefaults -device sdhci-pci,sd-spec-version=3 -drive \
if=sd,index=0,file=null-co://,format=raw,id=mydrive \
-device sd-card,drive=mydrive -qtest stdio"
$ export QEMU_PATH=./qemu-system-i386
$ ./scripts/oss-fuzz/output_reproducer.py \
-owner "Alexander Bulekov <alxndr@bu.edu>" /tmp/trace | \
clang-format -style="{BasedOnStyle: llvm, IndentWidth: 4, \
ColumnLimit: 90, BreakBeforeBraces: Linux}" > ../tests/qtest/fuzz-sdhci.c

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz-sdhci.c | 90 ++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build  |  2 +
 2 files changed, 92 insertions(+)
 create mode 100644 tests/qtest/fuzz-sdhci.c

diff --git a/tests/qtest/fuzz-sdhci.c b/tests/qtest/fuzz-sdhci.c
new file mode 100644
index 0000000000..0ce7378c69
--- /dev/null
+++ b/tests/qtest/fuzz-sdhci.c
@@ -0,0 +1,90 @@
+/*
+ * Autogenerated Fuzzer Test Case
+ *
+ * Copyright (c) 2021 Alexander Bulekov <alxndr@bu.edu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "libqos/libqtest.h"
+
+/*
+ * cat << EOF | ./qemu-system-i386 -nographic -machine accel=qtest -m 512M \
+ * -nodefaults -device sdhci-pci,sd-spec-version=3 -drive \
+ * if=sd,index=0,file=null-co://,format=raw,id=mydrive -device \
+ * sd-card,drive=mydrive -qtest stdio
+ * outl 0xcf8 0x80001010
+ * outl 0xcfc 0xfbefff00
+ * outl 0xcf8 0x80001001
+ * outl 0xcfc 0x06000000
+ * write 0xfbefff2c 0x1 0x05
+ * write 0xfbefff0f 0x1 0x37
+ * write 0xfbefff0a 0x1 0x01
+ * write 0xfbefff0f 0x1 0x29
+ * write 0xfbefff0f 0x1 0x02
+ * write 0xfbefff0f 0x1 0x03
+ * write 0xfbefff04 0x1 0x01
+ * write 0xfbefff05 0x1 0x01
+ * write 0xfbefff07 0x1 0x02
+ * write 0xfbefff0c 0x1 0x33
+ * write 0xfbefff0e 0x1 0x20
+ * write 0xfbefff0f 0x1 0x00
+ * write 0xfbefff2a 0x1 0x01
+ * write 0xfbefff0c 0x1 0x00
+ * write 0xfbefff03 0x1 0x00
+ * write 0xfbefff05 0x1 0x00
+ * write 0xfbefff2a 0x1 0x02
+ * write 0xfbefff0c 0x1 0x32
+ * write 0xfbefff01 0x1 0x01
+ * write 0xfbefff02 0x1 0x01
+ * write 0xfbefff03 0x1 0x01
+ * EOF
+ */
+static void test_fuzz(void)
+{
+    QTestState *s =
+        qtest_init("-nographic  -m 512M -nodefaults -device sdhci-pci,sd-spec-version=3 "
+                   "-drive if=sd,index=0,file=null-co://,format=raw,id=mydrive -device "
+                   "sd-card,drive=mydrive ");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xfbefff00);
+    qtest_outl(s, 0xcf8, 0x80001001);
+    qtest_outl(s, 0xcfc, 0x06000000);
+    qtest_bufwrite(s, 0xfbefff2c, "\x05", 0x1);
+    qtest_bufwrite(s, 0xfbefff0f, "\x37", 0x1);
+    qtest_bufwrite(s, 0xfbefff0a, "\x01", 0x1);
+    qtest_bufwrite(s, 0xfbefff0f, "\x29", 0x1);
+    qtest_bufwrite(s, 0xfbefff0f, "\x02", 0x1);
+    qtest_bufwrite(s, 0xfbefff0f, "\x03", 0x1);
+    qtest_bufwrite(s, 0xfbefff04, "\x01", 0x1);
+    qtest_bufwrite(s, 0xfbefff05, "\x01", 0x1);
+    qtest_bufwrite(s, 0xfbefff07, "\x02", 0x1);
+    qtest_bufwrite(s, 0xfbefff0c, "\x33", 0x1);
+    qtest_bufwrite(s, 0xfbefff0e, "\x20", 0x1);
+    qtest_bufwrite(s, 0xfbefff0f, "\x00", 0x1);
+    qtest_bufwrite(s, 0xfbefff2a, "\x01", 0x1);
+    qtest_bufwrite(s, 0xfbefff0c, "\x00", 0x1);
+    qtest_bufwrite(s, 0xfbefff03, "\x00", 0x1);
+    qtest_bufwrite(s, 0xfbefff05, "\x00", 0x1);
+    qtest_bufwrite(s, 0xfbefff2a, "\x02", 0x1);
+    qtest_bufwrite(s, 0xfbefff0c, "\x32", 0x1);
+    qtest_bufwrite(s, 0xfbefff01, "\x01", 0x1);
+    qtest_bufwrite(s, 0xfbefff02, "\x01", 0x1);
+    qtest_bufwrite(s, 0xfbefff03, "\x01", 0x1);
+    qtest_quit(s);
+}
+int main(int argc, char **argv)
+{
+    const char *arch = qtest_get_arch();
+
+    g_test_init(&argc, &argv, NULL);
+
+    if (strcmp(arch, "i386") == 0) {
+        qtest_add_func("fuzz/test_fuzz", test_fuzz);
+    }
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c83bc211b6..97caf84443 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -56,6 +56,8 @@ qtests_i386 = \
    'rtc-test',
    'i440fx-test',
    'fuzz-test',
+   'fuzz-sdhci',
+   'sdhci-test',
    'fw_cfg-test',
    'device-plug-test',
    'drive_del-test',
-- 
2.28.0


