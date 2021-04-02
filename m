Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A459C352DAB
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 18:23:40 +0200 (CEST)
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSMaB-0005Sp-Nk
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 12:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lSMXt-0003fN-5y
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 12:21:17 -0400
Received: from mail-bn8nam12on2124.outbound.protection.outlook.com
 ([40.107.237.124]:27936 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lSMXq-0004Z3-MS
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 12:21:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYKJU7RD2k6o1OyUBzEDU6TDFt38IScARg8TjwCt8sFK83dNdmtNBf5BsEyT3qrOfaU3ExcLvd0Fnf0cBmB5N87oQtAdNL+JhG/6bydsIZM3oh+CJMKw/SyQEAqf09OVStY0ZxIYX1iMbQ8QMxLWS3dKHcgZ33XVLWSDGlQ0ZrvejlwjKWZCzWayt9ngAWags4oVew9JqO7hXwrHLmTwSjrFzbmawPxUOJETCbAZaiD6UwAjCh9w6axAF+ctHZ2tell5u00dgPpbTRPHxGG1QMP5LL0+qNiBK1fhULIZeB4hvvH+Zw6y274aszMv35lZ1G7QMPiUAqepIawsJOlt9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYKFYkBNhwvS0zjYxCdM1cgVVNn49XThnrsBaWVIfOM=;
 b=QyceZYfOaOsoujtvUdmqUWOBrzMFju6xub4scTQMgmB5KqOIXpCTaBKeskslZbOSAzFe54QUzqRb2mlHO/4Uh8ZsIWSetFFLla2BROqD0d0MzDor6tKjriwVKK+plGyiJqYkoxNB6g12xXKgYlYBYMj/DDoxCUEwoUPRbw92ss93s1VOL9xco723FDal9Z/DZM8De3zFF2YHGToQJ/8QsLjOuPSRTDLEwKNSfU66zUVhfgIlUQfEvZgOOqA9nOWOcFsT1fkeUqvROop6IMQyxMONxj5wwi+ivxy55vd18WdVDWDjPlIAGAMEiMziNUI9W/iz9L9Hf3V2Nas+YnmIEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYKFYkBNhwvS0zjYxCdM1cgVVNn49XThnrsBaWVIfOM=;
 b=iXtcYzm7oazxB5pqUTCuUp5KWqxu6bMA7RGwrOart3ssgVcP/LyvJRwX8G7YGDDszL7GCOCewu4jt3wxKzBDc5C5zhdloMDav8/ZnuJ6kkCApMCniPkpSeFdIZJp6g+j94P8R4qn5m/xrMv0imFSkch+wC8T7hbQDQdwN8gHZa8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA0PR03MB5546.namprd03.prod.outlook.com (2603:10b6:806:bb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Fri, 2 Apr
 2021 16:21:12 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::c0e9:c756:fca4:f971]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::c0e9:c756:fca4:f971%7]) with mapi id 15.20.3999.029; Fri, 2 Apr 2021
 16:21:12 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/qtest: add one more test for the am53c974
Date: Fri,  2 Apr 2021 12:20:52 -0400
Message-Id: <20210402162052.264952-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <bb30a76c-c758-6829-d3fe-3e2d01cf55b6@ilande.co.uk>
References: <bb30a76c-c758-6829-d3fe-3e2d01cf55b6@ilande.co.uk>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:208:120::16) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR10CA0003.namprd10.prod.outlook.com (2603:10b6:208:120::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend
 Transport; Fri, 2 Apr 2021 16:21:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a08f7cfe-c564-407c-88cc-08d8f5f354d8
X-MS-TrafficTypeDiagnostic: SA0PR03MB5546:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB55464CD209E28C51960D7AFEBA7A9@SA0PR03MB5546.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:225;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Ph3GZxQU4viqITbBiWDufCEvK2IYEmf+MASSrHyzqvcOqtjj61ZwWfpNFJSXtUM5R7Hv5gdj3Eb50OQbLk0uN1+Fl3uBR+xrfs9H+yGMfpV/jh+Wpylhwr5I9wp+RxVIBhBR4TcryWVeZuiLNc7bmOXoK2j7jWMB1LTg3C0Ux+Pjck/onmQOw7cDl/WknVp5VHolKR0r8dzLWG1g2vmOHP1bS7cHvxnLnDcwLRuS1bGtHt/wr+99Qqtw+ARxSQBLnojX9y98xmt6Twb1dxJIohTpAACJ/JQhbFxXgKgUid2QddMqxITRMFXhciCdmuBqFi5/MCczu7+/X8m20XlYRF6ZmAbZm+G2l/0mtVLm0LeiwnZAoMj6kn4dyKPt/53P50YgzgzegCIwAmNPa+/VIxA5895GfIWeprO3WmBeiCOb07CxEVyg/X0BAPNp6wTeApOvEnxopEScFu5YWTAF/4uP479Ubt/yMKhjQBjApXCYsbvm9CONMwY8YSVTOhDVGhrcl9e4hLye6XzWbSKapHT1ZB4oQRvyc/2MLA4n9wszWtyliu5NA9sinpboZyTZtWQpBT93DtyW/vAo45oD3Gw0dYC0ZIjyhq8ycX5N8kbCxT5ELBAiRBBsiTCWKu/2I+CHosTnGTQC276B05JtaAjKwxPJyoWbAIgyXjUpFJHas/nXLwNjJit0bcLXTjK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(6916009)(66946007)(2616005)(66556008)(66476007)(38100700001)(956004)(478600001)(75432002)(6506007)(6486002)(52116002)(6512007)(1076003)(2906002)(6666004)(36756003)(26005)(786003)(16526019)(316002)(8676002)(186003)(54906003)(4326008)(8936002)(86362001)(83380400001)(5660300002)(138113003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TK26D1m6lzpZ+rh9tDgRjSL5L3LwTc93nzv2hzjW2P3KnFuMxWgYHj6TUCIP?=
 =?us-ascii?Q?JnjC1tZ5xuJtOMLY6tb1oYeu2u06Sj7qL6SDTNLIgkV3v5Y70CzWDgrq+PGs?=
 =?us-ascii?Q?JxdW2cbCokV6n/CMVS+rbwP4xwh04oTPtNLnRlnbR1GfRfqyPuSYjvCb3eKB?=
 =?us-ascii?Q?QkbHDd4WuPJ3Ox8QDk14Kk5JGs/FHQ5gAhtiMnG5Vjc5GQcXeDtN+XL3ogM1?=
 =?us-ascii?Q?SmG5wqI1lGPdECPNykdDWICNXmB3mjJjccfeYSIm7It1d6f4kPfeZeGcy3j+?=
 =?us-ascii?Q?wLdzMUss0ssJqK3otDP5fxZhnVhCLs8qU0TqDK9s/VjUVeKhIUsM72C4WaEx?=
 =?us-ascii?Q?Z6NqNQKgYYwwQfnlCKhsAGa6uxFBJCDuzgmgojEZcKCqECWsOwSCywQzNre3?=
 =?us-ascii?Q?1YebRCKPRumyoeWiCbwWL40BNv5SMkq+F0sc6Gg65GImLG6Ttf8im71+7Ucx?=
 =?us-ascii?Q?3uEXGpj4geY3ikcn3Q/5oDr6ODHrL9aiIXgp3rhazLlMKGJ8xerfLML0szd/?=
 =?us-ascii?Q?738J55ae+tVFmBk0DDpLCPj+tMhXBQE+toDN2KuoCIdBHH7gZ9KcYjRlENj6?=
 =?us-ascii?Q?DHzH6iTycPLs5Kc7VLl6XBOaMeOIrigYUucq7c3DOmC7R6TBzutK59QMQkiZ?=
 =?us-ascii?Q?Ht5awM9/iTN+mKuFG9zXJh7EBJNFhAQGevQxtBrqLP1xAIAPnqsBpXVQRw9+?=
 =?us-ascii?Q?a/JJI5DlSlZtbFuDRWyRHDgGjn6IdnOng4XiKySbgiY+hvAOmRcwch1s0svR?=
 =?us-ascii?Q?D7rP+xq/OzLO/cdkMOUtajGuxK54lCvD6d/ei8yni8Qt2ztzpR938WWj/QvM?=
 =?us-ascii?Q?L5e6g/FHqnnG/JIAylPbw+t8Rde8jnYtf9eRGHnyAeV+O+YMzRAMVoedItRH?=
 =?us-ascii?Q?hUBrHJHB0E/Pmo53h85IMlweHzXqr2BCJl7/oMKCqIjWB/aNt2Y1zT6z0pZR?=
 =?us-ascii?Q?9xaOcHVNknGG7y5ucXlapy5bh/legsn3zffsgu2ETwwb2tKV5lOw1+3Ktgt3?=
 =?us-ascii?Q?bskbE9LHXejhENLKDAAyR3iRsE40cDvqWl2AddAPHv+8Ox3Lld59p4xmPdOl?=
 =?us-ascii?Q?LrXYZi0HJVWnqArymmDsJzF2Jvtz8+mCIC63vKKWcPwYlfblCTs43/66dm62?=
 =?us-ascii?Q?PaOcmZSc2fS6ZdHCna0jPhYrxj/MFu2wecKP5e16ZpM6wsny4zw6qsGADdCA?=
 =?us-ascii?Q?n3lLKJ0eqlxvlq9vH7ZzUiZ3ce/7AHavtdUfUVFZnRVfMRQUJW3sDHkoDM7E?=
 =?us-ascii?Q?Piv7iyvYoFCPJ5nDo97+RqZvs1r3aLJWFu/ZC+n8sf1COdsSDMYRkc8zyV2q?=
 =?us-ascii?Q?JyDRkJmmQx72FTs0lB+eJ5zs?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: a08f7cfe-c564-407c-88cc-08d8f5f354d8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 16:21:12.4129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSsINzcUZc4X9OLCX7kifOIB+A5Alat4HXAdnjCtoMzlfqVsLsl5fxWRKF/nPJ5E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5546
Received-SPF: pass client-ip=40.107.237.124; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Original crash:
qemu-fuzz-i386: ../hw/scsi/esp.c:791: void esp_transfer_data(SCSIRequest *, uint32_t): Assertion `!s->do_cmd' failed.
==257532== ERROR: libFuzzer: deadly signal
__assert_fail assert/assert.c:101:3
esp_transfer_data hw/scsi/esp.c:791:5
scsi_req_data hw/scsi/scsi-bus.c:1412:9
scsi_disk_emulate_read_data hw/scsi/scsi-disk.c:1407:9
scsi_req_continue hw/scsi/scsi-bus.c:1394:9
do_busid_cmd hw/scsi/esp.c:317:9
handle_s_without_atn hw/scsi/esp.c:393:9
esp_reg_write hw/scsi/esp.c:1029:13
esp_pci_io_write hw/scsi/esp-pci.c:215:9
memory_region_write_accessor softmmu/memory.c:491:5
access_with_adjusted_size softmmu/memory.c:552:18
memory_region_dispatch_write softmmu/memory.c:1502:16
flatview_write_continue softmmu/physmem.c:2746:23
flatview_write softmmu/physmem.c:2786:14
address_space_write softmmu/physmem.c:2878:18
cpu_outl softmmu/ioport.c:80:5

Based-on: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/am53c974-test.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

The patch took care of the handle_satn_stop assert. Here's a test case
for the other assert.

Pasteable:

cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
512M -device am53c974,id=scsi -device scsi-hd,drive=disk0 -drive \
id=disk0,if=none,file=null-co://,format=raw -nodefaults -qtest stdio
outl 0xcf8 0x80001010
outl 0xcfc 0xc000
outl 0xcf8 0x80001004
outw 0xcfc 0x01
outl 0xc00b 0x4100
outb 0xc008 0x42
outw 0xc03f 0x0300
outl 0xc00b 0xc100
EOF


diff --git a/tests/qtest/am53c974-test.c b/tests/qtest/am53c974-test.c
index 9c4285d0c0..506276677a 100644
--- a/tests/qtest/am53c974-test.c
+++ b/tests/qtest/am53c974-test.c
@@ -9,6 +9,22 @@
 
 #include "libqos/libqtest.h"
 
+static void test_do_cmd_assert(void)
+{
+    QTestState *s = qtest_init(
+        "-device am53c974,id=scsi "
+        "-device scsi-hd,drive=disk0 -drive "
+        "id=disk0,if=none,file=null-co://,format=raw -nodefaults");
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xc000);
+    qtest_outl(s, 0xcf8, 0x80001004);
+    qtest_outw(s, 0xcfc, 0x01);
+    qtest_outl(s, 0xc00b, 0x4100);
+    qtest_outb(s, 0xc008, 0x42);
+    qtest_outw(s, 0xc03f, 0x0300);
+    qtest_outl(s, 0xc00b, 0xc100);
+    qtest_quit(s);
+}
 
 static void test_cmdfifo_underflow_ok(void)
 {
@@ -194,6 +210,8 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
 
     if (strcmp(arch, "i386") == 0) {
+        qtest_add_func("am53c974/test_do_cmd_asser",
+                       test_do_cmd_assert);
         qtest_add_func("am53c974/test_cmdfifo_underflow_ok",
                        test_cmdfifo_underflow_ok);
         qtest_add_func("am53c974/test_cmdfifo_underflow2_ok",
-- 
2.28.0


