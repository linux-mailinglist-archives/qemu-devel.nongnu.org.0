Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A72A34148F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 06:12:24 +0100 (CET)
Received: from localhost ([::1]:55092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN7Qt-0007Bo-Gu
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 01:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lN7O9-0005fp-Is; Fri, 19 Mar 2021 01:09:33 -0400
Received: from mail-dm6nam12on2110.outbound.protection.outlook.com
 ([40.107.243.110]:5728 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lN7O7-0005UR-Ty; Fri, 19 Mar 2021 01:09:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqNO1jcNmpQCxgmU8zbPwix9L1xLnVxumkSejBJvrdN3qODNscrzCldxKxRO4L30rKUBhsY6niPy1jR6PgXB7ydlGKkXdOAGJTqtNmwqB4sy0NvbafQM5uIG+7XnunrZJfnvi7UHBsmfUItoqxHyTF8cloPalpYYfYoP61ueExGDgc8rZHAevi8jTNqTxHDQCqloYgcoPZtnpfZKTHlAXpgewg68DkSpWmKqDwawwrDUakGYtDNILokT1d4t64My1R6x8q5Cfg0H99yiF1zXjR6LQugHpx8gsZRzD5I9NEqamVHJYPZ3sZm56LlxGJUZh32ppEVipPHJ1imh2OmmHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1RQxUtsg5QOXR/BOGpdUcDWVxgzoVqq4gt8LkrUVOQ=;
 b=Hcrne8Se0DwzbAlGtQorguJLrtNQmv3IfiBnUbAvQe5DKdiKttCnStbw74zx2jmfHrLUfp8USZX92QqwGgGCnUSaSZLI8QIC7EuVSB0WeNoaV6FftPBzTaBH00pCQzly7Cg7vMlvfA7AlbtNVBqrjuBzoHydrMGWr3aOEhO2WaOgmqyxa9FGU3vU1RA1o5Iik8Gub2wrH4sTh1K+4YvxcvTo0KCphGx2ld/rtiWG8QJtd9iG+2ZwDG+NVruHXcMSb2ei2mCBksIP2a/BEE35POu6zgeAP9dEH48iEPdg5ZWtaL4ADrKH5D5h1Lm1mHB64/IZz2p9dDxeq28m8Cp/pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1RQxUtsg5QOXR/BOGpdUcDWVxgzoVqq4gt8LkrUVOQ=;
 b=wGp22LdedyalNXS85DHS/f47aq7Zvk6EQ36/ykbIgEya5aiQ4Nn43o1Jeouog2YtPCxyh235NlCUakXsengzrjLgW1XIhunKGHKMGUW83OdrnDvdrv9eXk+58KV4fJSpkz7zdqsGtA8BLnZDNLKu0VpMiwz+XSVZFjQ+tiEzz/o=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=bu.edu;
Received: from DM6PR03MB3865.namprd03.prod.outlook.com (2603:10b6:5:47::31) by
 DM6PR03MB4506.namprd03.prod.outlook.com (2603:10b6:5:109::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Fri, 19 Mar 2021 05:09:24 +0000
Received: from DM6PR03MB3865.namprd03.prod.outlook.com
 ([fe80::3d08:f80f:7252:a948]) by DM6PR03MB3865.namprd03.prod.outlook.com
 ([fe80::3d08:f80f:7252:a948%4]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 05:09:24 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: John Snow <jsnow@redhat.com>
Subject: [PATCH 2/2] floppy: add a regression test for CVE-2021-20196
Date: Fri, 19 Mar 2021 01:09:06 -0400
Message-Id: <20210319050906.14875-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319050906.14875-1-alxndr@bu.edu>
References: <20200827113806.1850687-1-ppandit@redhat.com>
 <20210319050906.14875-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: MN2PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:208:d4::24) To DM6PR03MB3865.namprd03.prod.outlook.com
 (2603:10b6:5:47::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 MN2PR04CA0011.namprd04.prod.outlook.com (2603:10b6:208:d4::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 05:09:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5446cf85-f0e8-4556-b22a-08d8ea95296f
X-MS-TrafficTypeDiagnostic: DM6PR03MB4506:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB450622F7952B680C49D39325BA689@DM6PR03MB4506.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:252;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rzn8hbxBoZ6e2ZRT3AvThwZPpfRl1Doj9HlRegT45HJ+xbeHdJEDhmAZd3ElmNbTqVdzsllcAIlBZpijhLbNpN0yg/4XFik0vQNVKj9pUsEoPZGut8PtcGA+dLgclqFFBwnpa5veoOZlg/3y1RzkLwkYjHtsVMM53wMrDwiUjuspY6PPJoOU2Gi6BHyLhhd6C+YwkBB4q1m7D2cnazfSXJ6dv6MWU60w5v6H1L07VMvQ/d13Wr1SGxVpImrNW6mUPvOCHeWbXiuUUonA2RIdIzK6CVZnUulhQ/6ZnF6kyHonksS5tw7RY9hvyaUcX6NSJ9Qnx6Yj7E+Npkv0UgWuXpqjSoTEDAqs/pB6Uci2wymcieWbbdZPINYBL4DS00drr+R/W1dvVg0DwFbl3mL9xccGOGmAcBroDDntXlQRlFOH0qg+HB1L3sT+ZejZG+gntq4uuQEqCWjwTLRNaXm4o6vuNW3xw6oN5LIPwHb08Xur4X91B4UG9cQFnA2dqNP0Q8XuH1aByexc5k9dD2ASw5HDhrN831u28dmL20GsqMvjTgJe7IGvpFa9a7BfJmQovSs/gl1lA+pMLKj7ynyA/CLuYL5/EnduUyWBrRmZshvx49yzxVCaLCeNK2xoWc+KFtmSv6KqgbYbcauT/dxsDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB3865.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(16526019)(54906003)(66476007)(66946007)(186003)(478600001)(75432002)(52116002)(6486002)(8676002)(786003)(7696005)(5660300002)(26005)(2906002)(6916009)(1076003)(6666004)(66556008)(956004)(4326008)(36756003)(316002)(8936002)(2616005)(86362001)(83380400001)(38100700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?J1uvDvsCZsF4yHUr0gMfO7y4LUcO5qkhYRN/Tm7Fhsi/b1OW9zIns2r33G9j?=
 =?us-ascii?Q?gky+6VXD54WknDW38hRrJULSIs6mwz04WcTQwwfjUFo0chDkEyi7imbHBq8U?=
 =?us-ascii?Q?uU5DxOODjTEqMSEMl6Z9rLI/qAp+c2RgQrJnmG/QODSdD02+bq/lR6MwOfV5?=
 =?us-ascii?Q?Ytoh/N8F+CIDQv7IyM6mKIzO4vNBheEjgU3Z9N2zneP1gFOgG3jl8UXBPO7y?=
 =?us-ascii?Q?Tp5rN+gaeahT4yJl/K0oREkffgq0DhZLtXHIapyuhB7L+qH6dxhmhlHeQfvC?=
 =?us-ascii?Q?MMqj5NEPD7BouN6mYffsmfMptzo+cqzhswia+P26erUh0x0QRBNd0ggfTnAF?=
 =?us-ascii?Q?0yfmjLu1JWSJYao/S0nTwo/AQnHK/64ni4r6JR1svF1/c1th0VqVO3YwNwdG?=
 =?us-ascii?Q?8763CLlVVgVezDxvphLZGCBVnYVAcmmLO0ZDnEf7eSSSBt6hdVAQUELmj0Zg?=
 =?us-ascii?Q?vcyjVnSHlCvNyheF9FNIh9H1PTdormRNhp0cIiFD4EzdgugQrznGzB+cWDL0?=
 =?us-ascii?Q?jANs3p2zUSg7nGjPzhUufFNeUoikSBWgTUh1ILvMJ/WXaGBrhy6Q0LZtS8wp?=
 =?us-ascii?Q?5/FuIGubLlLppdD/rb8da0ZTr9EAdMnQfSCuNoRAmtT6GCc2Oi67PkNNPoed?=
 =?us-ascii?Q?YOWcrTDukpB43XpTOYd2X6IthazMWMvKFvjjrKFaTgNbqAvV4SE8Ocv4vcow?=
 =?us-ascii?Q?BuMBSCiQCyLr5XaPx1EWSgoAm47LKWBrP9Y24p1dtczh5Kn1uuC2DhElVVWY?=
 =?us-ascii?Q?U7k0zgsFfl4zOpgX65G2SROQwZI9wEWxg6dvKqCI4Ggy6EOmwi/wwzWRl8n9?=
 =?us-ascii?Q?vD//AcW0/Ml7Ef4qpeF9Mt7nJm1NJK8rx0Y+r5bYgxHkm+aHiCZBbmqLA9LM?=
 =?us-ascii?Q?yTTgO9/jJL6ef39IR+LgOzBHfqfe9W8X3Ho6lezyaGp53/1oJLW3Klxtr2kj?=
 =?us-ascii?Q?5INkCA//ZylyCcWCfUZmLmBbAgUlveNr59pZiROfU7xCe5q6QLnlOIi7ui7k?=
 =?us-ascii?Q?wF/owQf/9YsOxeZ6TbgUzYF4stPSjGY6K6w6ZPw84ivmKjM7GJEKnn/7CplG?=
 =?us-ascii?Q?jU8RhdXNqaRG00l9CRghMgNgT1RCBSQKumi7Ew4gjT01V/bJHO5tBA1TuGCu?=
 =?us-ascii?Q?KRSKDNLTfwO95EJ4gML5WGkUWcS7id1hDcWABbTAXMmUIetSndS5GBjxbVT4?=
 =?us-ascii?Q?cZz9Y+agKBnG49kUmFbrftJfstEm9vKrKI10kLSR/1Yb9B5OV9jcXQMuSYNz?=
 =?us-ascii?Q?n0g9WXMn+Urb0i6cUYjZa8zMq1YUWw5ZfFpAownfMn1B0+AeXhOarOuzoCJh?=
 =?us-ascii?Q?OoJErURBjzr0DmxfmPEByMhs?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5446cf85-f0e8-4556-b22a-08d8ea95296f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB3865.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 05:09:24.0826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56me4dY2hN21cjrnoOO7t+lqBNgM115MxkUBzIn29mW9Yr2YS7b73tj4/oZ+oa/H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4506
Received-SPF: pass client-ip=40.107.243.110; envelope-from=alxndr@bu.edu;
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
Cc: Li Qiang <liq3ea@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dd if=/dev/zero of=/tmp/fda.img bs=1024 count=1440
cat << EOF | ./qemu-system-i386 -nographic -m 512M -nodefaults \
-accel qtest -fda /tmp/fda.img -qtest stdio
outw 0x3f4 0x0500
outb 0x3f5 0x00
outb 0x3f5 0x00
outw 0x3f4 0x00
outb 0x3f5 0x00
outw 0x3f1 0x0400
outw 0x3f4 0x0
outw 0x3f4 0x00
outb 0x3f5 0x0
outb 0x3f5 0x01
outw 0x3f1 0x0500
outb 0x3f5 0x00
EOF

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---

Since this looks very similar to CVE-2021-20196 (I believe Li pointed
out that issue in this thread), I'm also posting the reproducer for that
here.

 tests/qtest/fuzz-test.c | 57 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
index 62ececc66f..8e4ccdaca8 100644
--- a/tests/qtest/fuzz-test.c
+++ b/tests/qtest/fuzz-test.c
@@ -76,6 +76,61 @@ static void test_fdc_cve_2020_25741(void)
     qtest_quit(s);
 }
 
+
+/*
+ * ERROR: UndefinedBehaviorSanitizer: SEGV on unknown address 0x000000000344
+ * The signal is caused by a WRITE memory access.
+ * #0 0x555556494543 in blk_inc_in_flight /block/block-backend.c:1356:5
+ * #1 0x555556494543 in blk_prw /block/block-backend.c:1328:5
+ * #2 0x555556494d03 in blk_pread /block/block-backend.c:1491:15
+ * #3 0x555555ec8986 in fdctrl_read_data /hw/block/fdc.c:1910:17
+ * #4 0x555555ec8986 in fdctrl_read /hw/block/fdc.c:936:18
+ * #5 0x5555563f26b7 in portio_read /softmmu/ioport.c:185:25
+ * #6 0x55555636908a in memory_region_read_accessor /softmmu/memory.c:442:11
+ * #7 0x55555635ec25 in access_with_adjusted_size /softmmu/memory.c:552:18
+ * #8 0x55555635ec25 in memory_region_dispatch_read1 /softmmu/memory.c:1420:16
+ * #9 0x55555635ec25 in memory_region_dispatch_read /softmmu/memory.c:1448:9
+ * #10 0x555556248aa7 in flatview_read_continue /softmmu/physmem.c:2810:23
+ * #11 0x5555563f18f0 in address_space_read /include/exec/memory.h:2494:26
+ * #12 0x5555563f18f0 in cpu_inw /softmmu/ioport.c:99:5
+ * #13 0x55555637619c in qtest_process_command /softmmu/qtest.c:502:21
+ * #14 0x55555637535d in qtest_process_inbuf /softmmu/qtest.c:797:9
+ * #15 0x555556405f9c in tcp_chr_read /chardev/char-socket.c:557:13
+ * #16 0x7ffff6f8ac3e in g_main_context_dispatch
+ * #17 0x5555567479f1 in glib_pollfds_poll /util/main-loop.c:231:9
+ * #18 0x5555567479f1 in os_host_main_loop_wait /util/main-loop.c:254:5
+ * #19 0x5555567479f1 in main_loop_wait /util/main-loop.c:530:11
+ * #20 0x5555562d9ee4 in qemu_main_loop /softmmu/runstate.c:725:9
+ * #21 0x555555d5b615 in main /softmmu/main.c:50:5
+*/
+static void test_fdc_cve_2021_20196(void)
+{
+    QTestState *s;
+    int fd;
+    char tmpdisk[] = "/tmp/fda.XXXXXX";
+    fd = mkstemp(tmpdisk);
+    assert(fd >= 0);
+    ftruncate(fd, 1440 * 1024);
+    close(fd);
+
+    s = qtest_initf("-nographic -m 512M -nodefaults "
+                    "-drive file=%s,format=raw,if=floppy", tmpdisk);
+    qtest_outw(s, 0x3f2, 0x04);
+    qtest_outw(s, 0x3f4, 0x0200);
+    qtest_outw(s, 0x3f4, 0x00);
+    qtest_outw(s, 0x3f4, 0x00);
+    qtest_outw(s, 0x3f4, 0x00);
+    qtest_outw(s, 0x3f4, 0x00);
+    qtest_outw(s, 0x3f4, 0x00);
+    qtest_outw(s, 0x3f4, 0x00);
+    qtest_outw(s, 0x3f4, 0x00);
+    qtest_outw(s, 0x3f4, 0x00);
+    qtest_outw(s, 0x3f2, 0x01);
+    qtest_inw(s, 0x3f4);
+    qtest_quit(s);
+    unlink(tmpdisk);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -87,6 +142,8 @@ int main(int argc, char **argv)
                        test_lp1878642_pci_bus_get_irq_level_assert);
         qtest_add_func("fuzz/test_fdc_cve_2020_25741",
                        test_fdc_cve_2020_25741);
+        qtest_add_func("fuzz/test_fdc_cve_2021_20196",
+                       test_fdc_cve_2021_20196);
     }
 
     return g_test_run();
-- 
2.27.0


