Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9992CA9F6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:43:51 +0100 (CET)
Received: from localhost ([::1]:43720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9gs-0004rl-MP
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1kk9Mx-0001ZY-G8; Tue, 01 Dec 2020 12:23:15 -0500
Received: from mail-bn8nam08on2123.outbound.protection.outlook.com
 ([40.107.100.123]:30210 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1kk9Mv-0002bA-1H; Tue, 01 Dec 2020 12:23:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUETwU9PCzQeIycBxZQYx6yq+B3KZOkiR7vMrz/OLsglY9Gxl+QySQTJF9lVS4MBKTvHpaMCdR4PfLE+HyDijhLDzOwm2h/F2mRPSTQC1BcBYtTcMWoxtcFVM4xhQWTYLHUqinOJWbhLWYX6VRiOfjr1DEoOQIpxcRnCJEqX9e0s5fvvG/Chx8EMaakw253DQMW4CNfST1XO4B0KPpZdUhnaAxmhswGzf97AbHzZ08mlSTsE6CjuuvHSWNyzyNAXmX4/vXCiC0wjOyA4++A1WVK6WtqWOIbKPyxgAuFAdUfHE0xKHW7mjkhhbIEY7B0ie4oovXgTEWW2tYJEOVA9qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHTW27W17PFaA41DaUSZmDM6H2ukVIXaFomRvmFITJ4=;
 b=TV+fQk7tSRKb4N3Hb/apvqfQ2l/gDVpM+XGnfBagAOWVtQZDGrQVUs5QMMfJD1+t/x7Hj0Ij920KdworXGfYb38Z7jwdolvAEBsUjS72v4dIoW9mGyK2x1OpGLkat2JOrNIEXxOHntSN1Gn+sULgObK909I9wjzpXjTolWAGzhkgg78yblX2hbs/7Tqj1KW98/xQRhquAh3aM8kWZLDtgXhqyUmh4++0PqUTPvv/rUDein6v4EfDWXTl6/qeTwptF/X2yE5/b/uXcFo6mHo/UmuvqKRAzf8+Lt8t33bnblfN3CYGiOy2zK+MaPqCgY0yQ3yv2QqPaiam1FKb/ckorg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHTW27W17PFaA41DaUSZmDM6H2ukVIXaFomRvmFITJ4=;
 b=eSVIIa6nFizj/fHeDSYF6FuIlCDtp5rtvIe1gTGHbub/IGk7GhlmP5nJd6qEAofgjQMA3SG+AZ5EUHH5ycraJ5IlaTuKzk/v9fTp2SDRVsfdeOeIY5jBafu89v9QT9ZyNVU7x1lAmAoxTe1LF9+itOTiogry8FakHrVe1a2R9GA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB3520.namprd03.prod.outlook.com (2603:10b6:805:4d::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Tue, 1 Dec
 2020 17:23:08 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::d520:4c19:8ce6:7db2]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::d520:4c19:8ce6:7db2%2]) with mapi id 15.20.3611.031; Tue, 1 Dec 2020
 17:23:08 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/scsi/megasas: Assert cdb_len is valid in
 megasas_handle_scsi()
Date: Tue,  1 Dec 2020 12:22:50 -0500
Message-Id: <20201201172250.208197-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201201151319.2943325-3-philmd@redhat.com>
References: <20201201151319.2943325-3-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [72.93.72.163]
X-ClientProxiedBy: BL1PR13CA0403.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::18) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.93.72.163) by
 BL1PR13CA0403.namprd13.prod.outlook.com (2603:10b6:208:2c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.8 via Frontend
 Transport; Tue, 1 Dec 2020 17:23:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6862f0f1-7961-4a39-dc13-08d8961dc545
X-MS-TrafficTypeDiagnostic: SN6PR03MB3520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB3520B97FAD322672B039BBF2BAF40@SN6PR03MB3520.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:285;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F4zdSQAHVsWTXG4Tbb/JL3zGU6o/8xvS/4OOfHA+ViaVmBqbECCmu5ubdSH1Wz2xtzrVOVhvWq89MsT44l7sWQz1coBwbF3ecb9gjpV8DJrbn5aonoK8HTjnjSnPcSaFmwXWxjEZ/smd/uLQHlynueJFW+7/sQ4sLdrl9Mp2nf9Jyjv5F3aCGxuQoLtuiwEhLtRxKpvTXFNnWU/SeA0llinJwMvGpPaEbMSTJslMheZjfnWwG/IUbJS9tGMN1dNriDSFTw8Fj0ZuCFdAVl3uSKOJqh9o/u6wlwoCJ+DZysdwvZMqnXtny2MbPKM43SuIK4RkZJYTUqtW/phRk/34qA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(8676002)(478600001)(2906002)(66946007)(36756003)(4326008)(186003)(316002)(1076003)(26005)(6486002)(54906003)(2616005)(6512007)(956004)(6506007)(6916009)(16526019)(786003)(52116002)(6666004)(66556008)(66476007)(75432002)(86362001)(83380400001)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WUVpTUYrNWQ0czlUcFVYRkxhSmkyUklaVEp6eGFvQjB1NEZiVEJua0NLcGEy?=
 =?utf-8?B?bHc3WHdFRHZzanhRSkgwTVhMQklQMU9IQkpGRi9XbGJLbUZET0ZoMTBVNUox?=
 =?utf-8?B?czlaK01RdjdaNkJtRG83RUZpRzBZN3ZzUXNVZkMzQ1VXVTBtSmh2YW9PeGQ1?=
 =?utf-8?B?YjBqRHh2MGVsbGFIWXI1bGJkZG1NSU8xNE9mL01uVUZPNjRnaGdNVzd4NVpm?=
 =?utf-8?B?cXZhUkwrYmNpeCtjRmtEUkp5M1VMVHB6aGd4ZFhqc3loTFp1QmVKWTRjVUZK?=
 =?utf-8?B?YXMzb3FnTzlnajlZd3g1K2QxZ3dnOUtWWnpQUWYzczlaZXcxMTgxOHhpdmF3?=
 =?utf-8?B?VEI0dW5hSDBBbnk0WDgySTRYTDdEMEJOWHVuVFlHcVgrb1gvVWJVRFNHUGlF?=
 =?utf-8?B?S0pVMk9nQzZ6cUtVTXFjNkxCbHdkNlRJR3F4T1J1VUkwQmhMSzljWW90SnlQ?=
 =?utf-8?B?d2s3c0R0eDcrOGtzanJHK3VNbDhLa05heHYxZnRGMnhCUk5SdFJaeWJSbmZj?=
 =?utf-8?B?bUZTaGNPTCsxaEFmMnRza0VnNVprZG9tTUpmUGs3ZisvNkdRc0FhWk1TazN4?=
 =?utf-8?B?SmpJUDBwM1VPTHJ3MDdZRVRTU0ZRdWlUaG01MVlzVEdpTEM1RndiSU04RXdN?=
 =?utf-8?B?K0JXRHFYTjBjalo0TzFYRFQ1UDlvdmJYZk03WjB0b1J2TzcxaWNMOVp3YklX?=
 =?utf-8?B?aFdrcnBXbTFqR1NhRStUWFlYY3FZaXR3ZmRnWFVkQ3FuUWt2UWZHdmJ3Umt6?=
 =?utf-8?B?QmdZK1IwUFhLempTUjlyK2xCRm9mejk3L0ZyVERJUHdKcDVlRFJUY0orSWpw?=
 =?utf-8?B?dGZubEZDbkw1Q1VsL3pjRytoQzZvYmgreld6U3JCZkZ2R0N1dTBnQlJTMi9v?=
 =?utf-8?B?TEQySCtCWEIxZ2VRR2paSTZBWTI4UDd0eldUTWl5d05FelhWdFhSMUNGK0Fv?=
 =?utf-8?B?Z0o2NXFNdUlHd2ROUjJ5ZlZ1OExJT3VuSzVab3EwY2M3TWhzZTFQTnJLSzcz?=
 =?utf-8?B?RlpWZlNQRE00andsNi84N1hicGRzU1NpaEhhYkVHeUYybkVmQmJJT3B2OFV1?=
 =?utf-8?B?SiszSS9zTjRlUGJsWWJKTmxRRldLNStaVlM3RUZBbHphSklwSklrUjd3YXdP?=
 =?utf-8?B?Z25NOElubjdmTEV3bGFDMS9VTXJKTlRpMWUwUDhSdGJRVWtoQTlTL2Q3bk9G?=
 =?utf-8?B?QVlNZk44c1kyeHk1eS9vTU5xL3Y1aFh6Ym9tMkhBczFTQ2h5VXFsSVkzNDV5?=
 =?utf-8?B?UmtiVGRrRlpHSjdlU0dZNVlOZ1RDOWN5MW1RMTh5aDBKZ1gzZi9wMXdxRGFk?=
 =?utf-8?Q?LcXIq+E6vI9P0=3D?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6862f0f1-7961-4a39-dc13-08d8961dc545
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 17:23:08.3021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gj75mCD2mWsRIS/I0gzNGuxMlNGNjHh9DT8Du/CvVAJMcDYwh6sCDpS1pY2VeZse
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3520
Received-SPF: pass client-ip=40.107.100.123; envelope-from=alxndr@bu.edu;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

cdb_len can not be zero... (or less than 6) here, else we have a
out-of-bound read first in scsi_cdb_length():

 71 int scsi_cdb_length(uint8_t *buf)
 72 {
 73     int cdb_len;
 74
 75     switch (buf[0] >> 5) {
 76     case 0:
 77         cdb_len = 6;
 78         break;

Then another out-of-bound read when the size returned by
scsi_cdb_length() is used.

Add a reproducer which triggers:

  $ make check-qtest-x86_64
  Running test qtest-x86_64/fuzz-test
  qemu-system-x86_64: hw/scsi/megasas.c:1679: megasas_handle_scsi: Assertion `cdb_len > 0 && scsi_cdb_length(cdb) >= cdb_len' failed.
  tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
  ERROR qtest-x86_64/fuzz-test - too few tests run (expected 1, got 0)

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---

Ran it through the minimizer - No more blobs.

 hw/scsi/megasas.c       |  1 +
 tests/qtest/fuzz-test.c | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 1a5fc5857d..28efd09411 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1676,6 +1676,7 @@ static int megasas_handle_scsi(MegasasState *s, MegasasCmd *cmd,
     lun_id = cmd->frame->header.lun_id;
     cdb_len = cmd->frame->header.cdb_len;
 
+    assert(cdb_len > 0 && scsi_cdb_length(cdb) >= cdb_len);
     if (is_logical) {
         if (target_id >= MFI_MAX_LD || lun_id != 0) {
             trace_megasas_scsi_target_not_present(
diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
index 87b72307a5..31f90cfb4f 100644
--- a/tests/qtest/fuzz-test.c
+++ b/tests/qtest/fuzz-test.c
@@ -48,6 +48,23 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
     qtest_quit(s);
 }
 
+static void test_megasas_cdb_len_zero(void)
+{
+    QTestState *s;
+
+    s = qtest_init("-M pc -nodefaults "
+                   "-device megasas-gen2 -device scsi-cd,drive=null0 "
+                   "-blockdev driver=null-co,read-zeroes=on,node-name=null0");
+
+    qtest_outl(s, 0xcf8, 0x80001011);
+    qtest_outb(s, 0xcfc, 0xbb);
+    qtest_outl(s, 0xcf8, 0x80001002);
+    qtest_outl(s, 0xcfc, 0xf3ff2966);
+    qtest_writeb(s, 0x4600, 0x03);
+    qtest_outw(s, 0xbb40, 0x460b);
+    qtest_quit(s);
+}
+
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -59,6 +76,8 @@ int main(int argc, char **argv)
                        test_lp1878263_megasas_zero_iov_cnt);
         qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
                        test_lp1878642_pci_bus_get_irq_level_assert);
+        qtest_add_func("fuzz/test_megasas_cdb_len_zero",
+                       test_megasas_cdb_len_zero);
     }
 
     return g_test_run();
-- 
2.28.0


