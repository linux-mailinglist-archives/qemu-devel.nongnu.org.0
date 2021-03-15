Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEF533C639
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:57:30 +0100 (CET)
Received: from localhost ([::1]:36094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsPB-0004am-IM
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs6x-00042w-5k
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:39 -0400
Received: from mail-dm3nam07on2107.outbound.protection.outlook.com
 ([40.107.95.107]:46049 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs6s-0006Gc-HX
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csWu8FW2VJsWwDgXGYHuvYX7u65EtWl4owMYjV3Y6HtuNmmzKelTLLklRQAMjz3DQcwR5CdIZeqlfgJrT/wGUDxS/jb+IvK47dD5CijttnJkdww7v7XWk1Gt4LraY+IPjxNB4R/VHIVnT2mQK3d9HfH/xKBsfqr76LcnZryk6G+6wuWqgR4gQfnTZ6VuSf1IL6lCJfwtLQKj8XqOBIBqBsXAP+6b8tgUrTrVcuhm86Ih5PisFH8hjFB68PP6xxLPdtzebX8mNf9Gjhfq5q9bhqi18eMSAFkJYEj8ng9Rq6qAsE3sLztrc9OhqQJtiJdL4odteX93C4T9/vfKuXC8PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRXAsrHHRt6KLO2T1hjpIzs1JdkqDovcjiXeSJ6HP40=;
 b=ZblashyKC4F92EOmBQgKDJgZ+GPN8DXXISwWXbM7EdOia7rpFgerGfHYn0HlQghirV5Ll1AfquYJeEvRcdJWQpCD+5nPOqb1giIZw7S2AWJ5OolVexBqe4aRAxcmSW5wCfoc1NGoZvKfP0pBmGLQq/wEFQN9S6VdTc9aJUUqXkCP0DUa1j7KVgHwXLF6Ox5d6dLyaYXfRuXLlwl0jkIsK8aPUgGQgYIBwsQPH5vvfcv7LlHRzDoJ1JZtWwqolX0Z0raG0iSUunTyUUSlNljBa8nWdbDEoCvK4odbiV0XYUS7N9p1BzR8nZvCz+L+SHktQLTZqL5kAeQQNyFi9azQPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRXAsrHHRt6KLO2T1hjpIzs1JdkqDovcjiXeSJ6HP40=;
 b=7i/CUkVcQqujoCCoIDB14eMTm+vqqVZ2pwGlK1O3mtLD4t2YUmb9AimO67jWJ0pIc6vkxRF8ZR4IzHPc/Dmucr3e9IIB+gMQ/408gJdPr72ebFs3iNvRGP0wsBzftEo1yYJxyDHTjgz+zo71SsXLMTfGMbMyMNvft0SENjf1fq8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4286.namprd03.prod.outlook.com (2603:10b6:805:c8::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 18:38:24 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 18:38:24 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/11] tests/qtest: Only run fuzz-megasas-test if megasas
 device is available
Date: Mon, 15 Mar 2021 14:38:02 -0400
Message-Id: <20210315183812.27760-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315183812.27760-1-alxndr@bu.edu>
References: <20210315183812.27760-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Transport; Mon, 15 Mar 2021 18:38:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a19ddde-7b86-4b8e-bd12-08d8e7e183d5
X-MS-TrafficTypeDiagnostic: SN6PR03MB4286:
X-Microsoft-Antispam-PRVS: <SN6PR03MB42869E05F45295B918B39979BA6C9@SN6PR03MB4286.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3aSOYp7dcTSbUwBGTMCvO1eHd6PTQXR5kB+Nq3eFTxPMc4UzykVKQkVzdy3QHGLFoYOOJCj6xTkv+aU1bKMWYHZQ2oZVYJHvmyfd8YEtA908BTd+zauhEJKAZFVGkpoPcS1bOUM5xLmMXIk+Mo99rL/CNVYppFf3u3MObqsaim3F8mxkF2Y0igzcjG32LM6bPnHq47kBYf6isnR035AlJ5eK0xTvxdKssY9c6gQw03xcSGkS0K+T6RTFtbtR0WCCUzx0MZOXx/t608+phW2MysS7FSvt2AIkTxvq9SKKJJubWGaUUkby3NNneKoiqVXmHaqgWXmpDQxpM/xyuApGiwy69mP5zL7a6SPGe3o4Qc63oow8NeGa8xtzOU/nwKxSBpApEuv8ghEn6Brp/gr07ezfp7mims2I6Ea1eomeJ12LqH8VwYU7gME1dtARQ/tgWXyG12ufGJ8FT7VXl5NjzBtnv+nnXGvj242orAe/T1/LDS3fKUPOVW750Bp9cD+ZDsNMOEXrFLGlZ/G//CP+tczuIEBe1C4VfFLkUMcroDi/zoChv2Ncv0+kcgn/ORAJdpavqS2/VjL4ovP/z3V2raD706Yhv/tJ5inlYSKvYGMv2DOXTs9m4knjt4rOY94HrFIvLibUNeBdcsvzmSgf2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(2906002)(6916009)(52116002)(786003)(26005)(66946007)(86362001)(6486002)(6666004)(186003)(2616005)(16526019)(8936002)(66476007)(1076003)(83380400001)(956004)(66556008)(54906003)(75432002)(478600001)(4326008)(8676002)(36756003)(316002)(966005)(5660300002)(7696005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UEN1WDVNRDFtcnhmaWNPcHJOTURyZDdpQWZTbTM4YkVjNnVFRndmZmRtNFNK?=
 =?utf-8?B?VFZsbEI5d1RCc2RhSlMwL3J4MTlzeG9qdForVzB5UzkxOG1JZ0FjVFBCNk15?=
 =?utf-8?B?MlcvbmlVT1libVNOUERwZE1oU2xycCtuUER4dnFQNG1vQWViVTVpOUdxZFVr?=
 =?utf-8?B?LzdaT3lBVFM3WUJuekppemhIcWkwSXhhMnZWNll0UUNOQzJpczhOaElnQmZK?=
 =?utf-8?B?TVpFVWxLaXYrQXhjWkVzZ2czb2N5QkZjdm5ySWRFQ2xXZmE0WEZVZWFXbmpp?=
 =?utf-8?B?VS9RbDBGa0laL0M0ekxnYUtTd0o2azd6OTlXZ2hxUzhwcDd3bHlsSTVJZFhX?=
 =?utf-8?B?NVJiNHFvc1AvVDhTSjdlanI0UmwrRnRNV0hpdmQyNjcvS20zRDNOSDBhRW5R?=
 =?utf-8?B?R1FDa3BIaWY0eUNZMS9hcGZXN3FiMysxSnBvckF2aUlZVUE0b2NCQi83ZzJs?=
 =?utf-8?B?QUk2V3I2Y0hxc1VNRHp4dE9rR25lQWdBQnBBQnpnRVhJWTl6TEZ4K1ZiMkhH?=
 =?utf-8?B?aDRUZG9JWDU2amJFcGN2NVlyTGtGK2pXM2JMV1FSaVpZSGxXd2VSRDVMU2p1?=
 =?utf-8?B?ME5QSDNmR1kzTGFqMk9ScEsram05TFhmNXhIWmZlVnhhdVpZZXVmMERCbUVs?=
 =?utf-8?B?QkJoejZJOTcwL0lhRTJYeXdyUG5XeHVtN3FCVUpia2Uwb1Z5OWU5bWJaeWRM?=
 =?utf-8?B?YUZ2cWtqd01CSUs3TERoSncyL1NMU1QwS3JGZnRjSlBMV0ZacHkxVzJDSHE3?=
 =?utf-8?B?RDM4c0tKekxsQlAzc0dVK1RaWXBVK2ZwMUZvd1oySEFyRWp4b2dFTDFNNUdk?=
 =?utf-8?B?MnlrZWlaYUNWdXhUTWpGVE96NEY2KytOQnRPNGllem5Eb0ptUzM3OG90UHpT?=
 =?utf-8?B?UEczZ2svUUpOTkxWM1NhYlc3Smh4TGUxR0VFa3Rka0ZsWlF0RXZHWFdVdWQz?=
 =?utf-8?B?aDg2N1hlVXIxVUlXWFlwVkYvTTRiSTNPMnQvSnhHN09YTEszU3R3QXFCVzN5?=
 =?utf-8?B?WklwTTZraTdmOXB1OW4yTHZHWitWRXFMdEVFWXhlSE5zdmt0K2dTZzcrRjN4?=
 =?utf-8?B?K2Y0UExMTVowcHVXcHlFTHBKVHZzVmxGYjZ3OWxXVjRpQ3ZBV0V2NHBidEZW?=
 =?utf-8?B?UVFES2VaZU5sc0pYeGJmTVBTak1sRjJQb3EyaXRLc1R3TGJ4MFY2YUl6Vjk5?=
 =?utf-8?B?ZEpOUmJWb254K3dqb3pIME5LRnB2bkJSQTQyaVIwZGhzUFdIODBQb2NWcEpw?=
 =?utf-8?B?UWx3VTRNMlNESlJvKzR4THZ1SXk3d3R2eDFSa3FtZG42SlRoajNaMm9LQ05S?=
 =?utf-8?B?QldvM3VnZWNEeUhzVTRXc0pTREdJTmJOQ0JITkViaHVXYXlab0RpWVJCMHZB?=
 =?utf-8?B?OG5qSUdnUzdsZTRYNTFwZWRpNXg0UUY5Y0N3MzBWMUxpcXZlb25OUkRVbmdr?=
 =?utf-8?B?ekJ3MitmUG9aTXRWM2hSQVlqWXRMZ3l3QitjZXg2ZXMxWHhiWXowS0VkRDRO?=
 =?utf-8?B?SVZ2WFpMSm5LSUIyUk5QVklyQmlaNlNNeWhqbjFQVnptNDBlMVZGdEdKQ1g3?=
 =?utf-8?B?ZFMxdUx6TjBwcGhsK3Y1VTZrYXJEVWlGTStJbkhUbk9zL1lOTXhRcUdSNHpN?=
 =?utf-8?B?MEhTU0Q0T2pmaE5JbVQ5QTAzQmlFWnB3YXNUT2ovZlpxRmpoOElYUFdGSHk5?=
 =?utf-8?B?VER1L3I4aThkL2k2cHFuZHhSOWl5QVdhbkFRSWtkWWMwV3lLM1pZdkdvZG9m?=
 =?utf-8?Q?0QAbWGZ8uNIBxy+FUoXbMZ7HLowecDFsyUimUsf?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a19ddde-7b86-4b8e-bd12-08d8e7e183d5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 18:38:24.0164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtEOevMEMpy+zduQsei4TAm58iZDFrIX8xt5iFRrURdVFZsmTv0TFIh85fuqYnaB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4286
Received-SPF: pass client-ip=40.107.95.107; envelope-from=alxndr@bu.edu;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

This test fails when QEMU is built without the megasas device,
restrict it to its availability.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                     |  1 +
 tests/qtest/fuzz-megasas-test.c | 49 +++++++++++++++++++++++++++++++++
 tests/qtest/fuzz-test.c         | 25 -----------------
 tests/qtest/meson.build         |  4 ++-
 4 files changed, 53 insertions(+), 26 deletions(-)
 create mode 100644 tests/qtest/fuzz-megasas-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ca3c9f851..0f560d1b91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1969,6 +1969,7 @@ S: Supported
 F: hw/scsi/megasas.c
 F: hw/scsi/mfi.h
 F: tests/qtest/megasas-test.c
+F: tests/qtest/fuzz-megasas-test.c
 
 Network packet abstractions
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
diff --git a/tests/qtest/fuzz-megasas-test.c b/tests/qtest/fuzz-megasas-test.c
new file mode 100644
index 0000000000..940a76bf25
--- /dev/null
+++ b/tests/qtest/fuzz-megasas-test.c
@@ -0,0 +1,49 @@
+/*
+ * QTest fuzzer-generated testcase for megasas device
+ *
+ * Copyright (c) 2020 Li Qiang <liq3ea@gmail.com>
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
+ * This used to trigger the assert in scsi_dma_complete
+ * https://bugs.launchpad.net/qemu/+bug/1878263
+ */
+static void test_lp1878263_megasas_zero_iov_cnt(void)
+{
+    QTestState *s;
+
+    s = qtest_init("-nographic -monitor none -serial none "
+                   "-M q35 -device megasas -device scsi-cd,drive=null0 "
+                   "-blockdev driver=null-co,read-zeroes=on,node-name=null0");
+    qtest_outl(s, 0xcf8, 0x80001818);
+    qtest_outl(s, 0xcfc, 0xc101);
+    qtest_outl(s, 0xcf8, 0x8000181c);
+    qtest_outl(s, 0xcf8, 0x80001804);
+    qtest_outw(s, 0xcfc, 0x7);
+    qtest_outl(s, 0xcf8, 0x8000186a);
+    qtest_writeb(s, 0x14, 0xfe);
+    qtest_writeb(s, 0x0, 0x02);
+    qtest_outb(s, 0xc1c0, 0x17);
+    qtest_quit(s);
+}
+
+int main(int argc, char **argv)
+{
+    const char *arch = qtest_get_arch();
+
+    g_test_init(&argc, &argv, NULL);
+
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        qtest_add_func("fuzz/test_lp1878263_megasas_zero_iov_cnt",
+                       test_lp1878263_megasas_zero_iov_cnt);
+    }
+
+    return g_test_run();
+}
diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
index 6f161c93be..631feaf0eb 100644
--- a/tests/qtest/fuzz-test.c
+++ b/tests/qtest/fuzz-test.c
@@ -11,29 +11,6 @@
 
 #include "libqos/libqtest.h"
 
-/*
- * This used to trigger the assert in scsi_dma_complete
- * https://bugs.launchpad.net/qemu/+bug/1878263
- */
-static void test_lp1878263_megasas_zero_iov_cnt(void)
-{
-    QTestState *s;
-
-    s = qtest_init("-nographic -monitor none -serial none "
-                   "-M q35 -device megasas -device scsi-cd,drive=null0 "
-                   "-blockdev driver=null-co,read-zeroes=on,node-name=null0");
-    qtest_outl(s, 0xcf8, 0x80001818);
-    qtest_outl(s, 0xcfc, 0xc101);
-    qtest_outl(s, 0xcf8, 0x8000181c);
-    qtest_outl(s, 0xcf8, 0x80001804);
-    qtest_outw(s, 0xcfc, 0x7);
-    qtest_outl(s, 0xcf8, 0x8000186a);
-    qtest_writeb(s, 0x14, 0xfe);
-    qtest_writeb(s, 0x0, 0x02);
-    qtest_outb(s, 0xc1c0, 0x17);
-    qtest_quit(s);
-}
-
 static void test_lp1878642_pci_bus_get_irq_level_assert(void)
 {
     QTestState *s;
@@ -103,8 +80,6 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
-        qtest_add_func("fuzz/test_lp1878263_megasas_zero_iov_cnt",
-                       test_lp1878263_megasas_zero_iov_cnt);
         qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
                        test_lp1878642_pci_bus_get_irq_level_assert);
         qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 2688e1bfad..b65efd6c5d 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -17,7 +17,9 @@ slow_qtests = {
   'test-hmp' : 120,
 }
 
-qtests_generic = [
+qtests_generic = \
+  (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
+  [
   'cdrom-test',
   'device-introspect-test',
   'machine-none-test',
-- 
2.27.0


