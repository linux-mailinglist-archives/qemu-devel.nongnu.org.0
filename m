Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E200F33C625
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:52:15 +0100 (CET)
Received: from localhost ([::1]:46596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsK6-0005ap-Tf
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs6x-00042e-2V
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:39 -0400
Received: from mail-dm3nam07on2131.outbound.protection.outlook.com
 ([40.107.95.131]:13664 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs6r-0006Et-6S
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbGbhzqRk2N0HpomCgEBDXtalOYfCHLTPgtn49fk5NoHTKlqboFKOcMPETyXvLJ8+rJOMXn4yagP5YK0q3M9N3q3WrLnPlQsftsMSYXxEWUROiMoRC/4mrxJfX6TAiDq20KmX6yHYuvUnwFzrWzgozBkzlTHb8ogNvPgMwFn3Z5ZCBQglrK1j1uoB+gJTlznYcHedYBeng+vH25QlL4G8MCHUJTwm4460m5JISmTP4ru9ZRUXxSbdx5DbMEke8TBRP6eCFehr1deBcaViEdosNMEOSBMMtT1zMG3MEsva6exMePWJdWRddl12CBsTKzP1VwUnSdS9PtpuhElMdRN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihsR7TqIPlNdidI7kLLtZmFhuCSZbhKamD2O+eVsVAU=;
 b=RccG2Z9AIL+p1uApVUYAfq6XULu16azYxk0S3XGnQVw0vlJoslyBtt2hAwT3CLVbjHfuixcoIf2AfsCwspgctgeorsZOysLjxPiEP/K+ZDZineJrq2qkgWBaOWl4vUSr4bzwxYSml7/vk9EMxi0kRq+4Wa+0GeXCgrfaAIbPOoqAZXBIRiAakReCXDH2E5heayPI7j4SSSNfdsOyOW0xK78LyH0J1uoplVnuwxkdueH279WGspVUJJP0QmgdFq1O2d20EDqRFpvP00qmWc9tDENQkY1q/SG6YaRGDD8ZpN8saA+BARo3xKbhDgauqbTNfUPfBT3OJvaCV1QUycTpzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihsR7TqIPlNdidI7kLLtZmFhuCSZbhKamD2O+eVsVAU=;
 b=7BbCZ/rkI7IEWgftPSFrYocR3gd4K01G+FFAJNxYu5B21jFLkla8b59zq1/cpbVe6zCOyUKys+BlCBRPZjYPu9EHVgv6Kl3nB3uEyLoDsc5klzTH1AQs8BbHMLHPzQeOaV11KKDCbr41cFf9Hlaci3r1qmW/fiajImKlzcscMDo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4286.namprd03.prod.outlook.com (2603:10b6:805:c8::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 18:38:25 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 18:38:25 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/11] tests/qtest: Only run fuzz-virtio-scsi when virtio-scsi
 is available
Date: Mon, 15 Mar 2021 14:38:03 -0400
Message-Id: <20210315183812.27760-3-alxndr@bu.edu>
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
 Transport; Mon, 15 Mar 2021 18:38:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fe5e178-e737-492e-6cdf-08d8e7e18473
X-MS-TrafficTypeDiagnostic: SN6PR03MB4286:
X-Microsoft-Antispam-PRVS: <SN6PR03MB428667F5E084F61475209539BA6C9@SN6PR03MB4286.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vKHqlay36tdpNwzlAJWWu6SwbrIgyLXy2MoB/5+ZLL5mngMpxbAGRC6h0/r+/Od8c7YTJb0Md30lt22xNlDBUjxWYNTc2sKhXMGjuhhCOQSZrgufHmtD3cYqD/ixTkMM9r0sIMieF4w+H7GJhmZC2v7l5tee5SGdmdk4pqUpufRGYqeDCY/ETf8cx+tz8bd9qSz88J5Ir4X+YnHd/A2KVOf06PCRL7zYW4YDDR83CLTU6lUaV4NBfyRJACwPxRrUGszRs8cHFg/DOwSFUwmaTr7qJa0eiR3DiGnm6owW7rQTQy0wqAf5eB7TxEsnafJQOlAPwIXLeqJFBAK6pd4Zxqc5OJVe9fGwSobb5BNS9hiUrrzpmXrxxYFIYky5azuqkcLGFpE/jlzSV6WqICyxm8RJ8GQ6E+dMh05uJhhoXvZSfPbZNckpTNNk6lzlM0eD7KWqAzDU/G13l1qp3rA7Cz7umq7JO7boE0cp6Z6ldVv8UMxu9/sBux01NX6dAcGTA/xok5VPr1nOS1bHp76JKDDSQ6K3D4YhY36kT6XhEfjS2ekJ9r3E1iC9QWMBRPeW3gDDoXkJHzjGDJOzPysyZck/98Lv3plX3cmVzZ7a3oGY8KkTmU9/5EyAGeSK8QNNmBjJhH04sjlzxZ88AKL0fQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(2906002)(6916009)(52116002)(786003)(26005)(66946007)(86362001)(6486002)(6666004)(186003)(2616005)(16526019)(8936002)(66476007)(1076003)(83380400001)(956004)(66556008)(54906003)(75432002)(478600001)(4326008)(8676002)(36756003)(316002)(966005)(5660300002)(7696005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?allRUWF1RmhxdmYwVjQ0MndPaWJaWG5YVEVsMU1XU2FuM3NQMG04b1lybXZY?=
 =?utf-8?B?NzNWdFUrdTlkZWlWVnFLNVBYNVFWOFM2N3h1UElMMTNYYWQwNXhkWmRsWDVt?=
 =?utf-8?B?a1FZOGp1eWh5QWJSdWRrL2R6SnZrOElvejFpdkFJOEhaaGZobkgzMUg1NVZI?=
 =?utf-8?B?QzgvMnl5T0ZmOXBMRWRrNWRqc0lKUXBCQWJBeFBMeG1tcWRzQWxKVHFQbXN0?=
 =?utf-8?B?NjJMYkt2U2psenhkMUZCcmlNR3RKSmU1bjZrdXpGeE9PSDRxOXBGWlUxbmw0?=
 =?utf-8?B?OVhPZkFSUFhWdjVGU0NpVndKYlh1NUNoSTBLUE5ENm1YVmJTdjdjMmZ2ZzBF?=
 =?utf-8?B?eXkvdElhSGltOGdGMHFjazhNTlVzemQyVVZPbmJEdHVzM3FHdFJHRWFZRHlv?=
 =?utf-8?B?TTE0ZmRZcWxPNTRhQk9zajg4QWluakhIc0tMNUJOUTVweTJmQTNjZTc5VEQz?=
 =?utf-8?B?SGN2c3pVK2JZdTVQTFYyRm43R0E2SVFxaXlPd29SRGJPS0RwT1BITWd4WEVS?=
 =?utf-8?B?TGZsejB5M3Rja0JEYy83Y1lJMVJVQ0pmbWI4RzJENGMxeG1Ea2s4cW5OSnJG?=
 =?utf-8?B?K3pJRVhvVjA5ZDRLLy92S3NaMUVKaytqTVVIdUlmNmR2eTg5aFFtQ01zd2lz?=
 =?utf-8?B?ZjI5QnBCaVJFeTNlRWZnbjlBNjFBZTVBVGY4bTBxT0tSRlNtQXI1SFNnTlVh?=
 =?utf-8?B?V0hrNHFzNitUblMzQ281NzJKVzZaajJneklNZzZtOGh6VGRCenpReXl0cCtl?=
 =?utf-8?B?L0h4Q2dxM2tsQzQ5VFZmZ29mZ2I1NytlbERXZHhBREg5RVVUZ3FoOHF1dTd0?=
 =?utf-8?B?OTRNby84OFFMUENLTHNNM2dhc2N2NmUxd3pxVlA2N2NvU2UxeWhEenkyUHFm?=
 =?utf-8?B?WjBSelJ0QTlrTlExUVBwL0t5V1lXVVpTREhMMUFubGpqWFRaUDVscUpHaWdW?=
 =?utf-8?B?WmhPK2NVM0hGWmhlKzh0QVZzMGZaL1lJVzFOeVgycUt1VVV3YVlWK09XTzdr?=
 =?utf-8?B?M3gxa1VCdFlHVUpWZXlob0hFdzNYMmdIOU53U2hMY2ljVEJMREJiTWYrTTZR?=
 =?utf-8?B?My85aDU5Q3krWHZ4QXZDKzFsREhYVnk0c211MWZyMmRKVDdla3RHb056d1Jv?=
 =?utf-8?B?a0htcEVyOUlkbjVtV3l1ODMxQW1ETXg3YUZrTUMvZFVKUjBDRzMwN2FQTjlK?=
 =?utf-8?B?SXAvaTlYdktIZGg3MEhlR0RTMUF2N05wZm11T21XV2twSHZ3aFZrSzl0Smo3?=
 =?utf-8?B?eGRiQlozUnZCanZUTWxqVjY0TG10U2x6ODBEV2wybDY0ZHVmNjNZQW1sZVdh?=
 =?utf-8?B?cHc1M3g0c3F4cHVmS0ZTNG5oL1J2T0pkWE9GemlNMVQvUWZuZ0NmbmZwQ2RY?=
 =?utf-8?B?eEhkNzBuZTAvUWExYzhSWEhFOWdQT2dGZ1ZpeEVsNGd3ODgrNTVLZkZHMEJ0?=
 =?utf-8?B?MldrTTU0Yzd4cEY5QmVsT2VXSjRmTEFLQ21PbVJKV2N3MkxXcGxFWTZJckp0?=
 =?utf-8?B?dWhXQkdvcUVweDFsSU5YcnMxTDZISnluS2drNitRcC9GeXExYktvbHhjSy9k?=
 =?utf-8?B?MnlKeFFQTWFwQmw1TlpJNTFKOFpKZXFudU8zQmVpZjBSOXp3VHVnQ0lySU9p?=
 =?utf-8?B?ZXNSNVNSUlZMWHZ1cHAwMUg2bjJEcTlDNTN6MmpiNCtpc3FETW1rSCtrTnhK?=
 =?utf-8?B?ZmEwUGdjeXJrQXZJazRsdm95OWtXNUZpRU9vN0NjSXhBZTN0dUYxdDVtYm1w?=
 =?utf-8?Q?8h9cmdc+8/2uLK5MxZcVqUl6Uq2kXCVawyU+Sh2?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe5e178-e737-492e-6cdf-08d8e7e18473
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 18:38:25.0968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dBOYluaymYwh4LkZ6swDE59b1tMQZ/HKXCSq3EPrKmYDyfaYR8hINhjFtGiFG+la
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4286
Received-SPF: pass client-ip=40.107.95.131; envelope-from=alxndr@bu.edu;
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

This test fails when QEMU is built without the virtio-scsi device,
restrict it to its availability.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                         |  1 +
 tests/qtest/fuzz-test.c             | 51 --------------------
 tests/qtest/fuzz-virtio-scsi-test.c | 75 +++++++++++++++++++++++++++++
 tests/qtest/meson.build             |  1 +
 4 files changed, 77 insertions(+), 51 deletions(-)
 create mode 100644 tests/qtest/fuzz-virtio-scsi-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f560d1b91..71c835bc1d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1759,6 +1759,7 @@ S: Supported
 F: include/hw/scsi/*
 F: hw/scsi/*
 F: tests/qtest/virtio-scsi-test.c
+F: tests/qtest/fuzz-virtio-scsi-test.c
 T: git https://github.com/bonzini/qemu.git scsi-next
 
 SSI
diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
index 631feaf0eb..00149abec7 100644
--- a/tests/qtest/fuzz-test.c
+++ b/tests/qtest/fuzz-test.c
@@ -24,55 +24,6 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
     qtest_quit(s);
 }
 
-/*
- * Here a MemoryRegionCache pointed to an MMIO region but had a
- * larger size than the underlying region.
- */
-static void test_mmio_oob_from_memory_region_cache(void)
-{
-    QTestState *s;
-
-    s = qtest_init("-M pc-q35-5.2 -display none -m 512M "
-		   "-device virtio-scsi,num_queues=8,addr=03.0 ");
-
-    qtest_outl(s, 0xcf8, 0x80001811);
-    qtest_outb(s, 0xcfc, 0x6e);
-    qtest_outl(s, 0xcf8, 0x80001824);
-    qtest_outl(s, 0xcf8, 0x80001813);
-    qtest_outl(s, 0xcfc, 0xa080000);
-    qtest_outl(s, 0xcf8, 0x80001802);
-    qtest_outl(s, 0xcfc, 0x5a175a63);
-    qtest_outb(s, 0x6e08, 0x9e);
-    qtest_writeb(s, 0x9f003, 0xff);
-    qtest_writeb(s, 0x9f004, 0x01);
-    qtest_writeb(s, 0x9e012, 0x0e);
-    qtest_writeb(s, 0x9e01b, 0x0e);
-    qtest_writeb(s, 0x9f006, 0x01);
-    qtest_writeb(s, 0x9f008, 0x01);
-    qtest_writeb(s, 0x9f00a, 0x01);
-    qtest_writeb(s, 0x9f00c, 0x01);
-    qtest_writeb(s, 0x9f00e, 0x01);
-    qtest_writeb(s, 0x9f010, 0x01);
-    qtest_writeb(s, 0x9f012, 0x01);
-    qtest_writeb(s, 0x9f014, 0x01);
-    qtest_writeb(s, 0x9f016, 0x01);
-    qtest_writeb(s, 0x9f018, 0x01);
-    qtest_writeb(s, 0x9f01a, 0x01);
-    qtest_writeb(s, 0x9f01c, 0x01);
-    qtest_writeb(s, 0x9f01e, 0x01);
-    qtest_writeb(s, 0x9f020, 0x01);
-    qtest_writeb(s, 0x9f022, 0x01);
-    qtest_writeb(s, 0x9f024, 0x01);
-    qtest_writeb(s, 0x9f026, 0x01);
-    qtest_writeb(s, 0x9f028, 0x01);
-    qtest_writeb(s, 0x9f02a, 0x01);
-    qtest_writeb(s, 0x9f02c, 0x01);
-    qtest_writeb(s, 0x9f02e, 0x01);
-    qtest_writeb(s, 0x9f030, 0x01);
-    qtest_outb(s, 0x6e10, 0x00);
-    qtest_quit(s);
-}
-
 int main(int argc, char **argv)
 {
     const char *arch = qtest_get_arch();
@@ -82,8 +33,6 @@ int main(int argc, char **argv)
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
         qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
                        test_lp1878642_pci_bus_get_irq_level_assert);
-        qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
-                       test_mmio_oob_from_memory_region_cache);
     }
 
     return g_test_run();
diff --git a/tests/qtest/fuzz-virtio-scsi-test.c b/tests/qtest/fuzz-virtio-scsi-test.c
new file mode 100644
index 0000000000..aaf6d10e18
--- /dev/null
+++ b/tests/qtest/fuzz-virtio-scsi-test.c
@@ -0,0 +1,75 @@
+/*
+ * QTest fuzzer-generated testcase for virtio-scsi device
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
+ * Here a MemoryRegionCache pointed to an MMIO region but had a
+ * larger size than the underlying region.
+ */
+static void test_mmio_oob_from_memory_region_cache(void)
+{
+    QTestState *s;
+
+    s = qtest_init("-M pc-q35-5.2 -display none -m 512M "
+                   "-device virtio-scsi,num_queues=8,addr=03.0 ");
+
+    qtest_outl(s, 0xcf8, 0x80001811);
+    qtest_outb(s, 0xcfc, 0x6e);
+    qtest_outl(s, 0xcf8, 0x80001824);
+    qtest_outl(s, 0xcf8, 0x80001813);
+    qtest_outl(s, 0xcfc, 0xa080000);
+    qtest_outl(s, 0xcf8, 0x80001802);
+    qtest_outl(s, 0xcfc, 0x5a175a63);
+    qtest_outb(s, 0x6e08, 0x9e);
+    qtest_writeb(s, 0x9f003, 0xff);
+    qtest_writeb(s, 0x9f004, 0x01);
+    qtest_writeb(s, 0x9e012, 0x0e);
+    qtest_writeb(s, 0x9e01b, 0x0e);
+    qtest_writeb(s, 0x9f006, 0x01);
+    qtest_writeb(s, 0x9f008, 0x01);
+    qtest_writeb(s, 0x9f00a, 0x01);
+    qtest_writeb(s, 0x9f00c, 0x01);
+    qtest_writeb(s, 0x9f00e, 0x01);
+    qtest_writeb(s, 0x9f010, 0x01);
+    qtest_writeb(s, 0x9f012, 0x01);
+    qtest_writeb(s, 0x9f014, 0x01);
+    qtest_writeb(s, 0x9f016, 0x01);
+    qtest_writeb(s, 0x9f018, 0x01);
+    qtest_writeb(s, 0x9f01a, 0x01);
+    qtest_writeb(s, 0x9f01c, 0x01);
+    qtest_writeb(s, 0x9f01e, 0x01);
+    qtest_writeb(s, 0x9f020, 0x01);
+    qtest_writeb(s, 0x9f022, 0x01);
+    qtest_writeb(s, 0x9f024, 0x01);
+    qtest_writeb(s, 0x9f026, 0x01);
+    qtest_writeb(s, 0x9f028, 0x01);
+    qtest_writeb(s, 0x9f02a, 0x01);
+    qtest_writeb(s, 0x9f02c, 0x01);
+    qtest_writeb(s, 0x9f02e, 0x01);
+    qtest_writeb(s, 0x9f030, 0x01);
+    qtest_outb(s, 0x6e10, 0x00);
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
+        qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
+                       test_mmio_oob_from_memory_region_cache);
+    }
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index b65efd6c5d..82b60f4d87 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -19,6 +19,7 @@ slow_qtests = {
 
 qtests_generic = \
   (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
   [
   'cdrom-test',
   'device-introspect-test',
-- 
2.27.0


