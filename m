Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266BD2C1366
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 20:01:43 +0100 (CET)
Received: from localhost ([::1]:34816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khH5o-0001VI-13
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 14:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1khH3X-0000nt-Nm
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:59:19 -0500
Received: from mail-dm6nam08on2111.outbound.protection.outlook.com
 ([40.107.102.111]:62753 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1khH3Q-0007PR-4x
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:59:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHnR0HrBD2AU6K5tlru9ddBjvx8+HRmT6bT6aYjn04JmkFoJp/fmu5Xrl319h36ZECKciSC8TOvqSoR856FiXXFYDF5kRz6/uaXB2Ascv8WxGdbtqnuDksA/vBREtFjUamNE9o3N0YI1QC26wRR9TcAhbE7zEGeKBG8kWCwDh8oS4WxhenBDY4uyghxiSFUB0Oetk1WLr58PUMOzAxYTKxLdlYEYSLGuCAyqErsvdFTuT4SPVtStpUCgZIIkJ2DK9aefIG+EFcQsFQK9d1ZNzml+PORpCuqavVIsg7hqVh2hNAxVvgTngib5VVEPaycieyX4ejzC89OWxk7SQwl4nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55i9rF0q6n288xFw4wbjpvUELSIkqaY1Wkc2DqksZjc=;
 b=V70NAfFzu009LeWPN4ZDVcRxVzWLeoh7I5dsH1kyrSStWyJNBWGb8S6NcUX80E+P3VJyheDsrLRth5cYRqpKjEDjnRBEc4ePmuml9MHGsrp9PBT/9nDc36R3qFQJxQUIiF8nnoYlJysmARd865wqpOF7VYC43oXe42X3XMh4hMbf42u5HZIWsJa4dwhJG3ApD4FsrZL+/gITp8CeSHDE2KtETQdUziz33tlLeGMgj22+1iRfZm8r1cnhHjH3KT4fYfv5rBnmwuP08svuINp6Vjl2h8RfQ5PyQQMhDkLFH4hgHsvJVHSBvEKLvX36LgfxcbuCinqfmDdO/q8/9k/rFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55i9rF0q6n288xFw4wbjpvUELSIkqaY1Wkc2DqksZjc=;
 b=vJgQ6PvSVC8UDGk/yezJQJnLKWoCpfDC7+gfjZQBynBpVhi3vv14E/nsLmMKMDdMMOGjtUR7nz+urLnDuBNTMkfuCMkqrR3i3ZE2l91CKg5C6Gv9RZ02OJCbrqrKgGhHG2JOyQ25qG7jf5hrpokkjDAXy8XdVzpnFsQykhqcj7o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4544.namprd03.prod.outlook.com (2603:10b6:805:fc::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Mon, 23 Nov
 2020 18:44:05 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::d520:4c19:8ce6:7db2]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::d520:4c19:8ce6:7db2%2]) with mapi id 15.20.3564.028; Mon, 23 Nov 2020
 18:44:05 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] fuzz: Add more i386 configurations for fuzzing
Date: Mon, 23 Nov 2020 13:43:52 -0500
Message-Id: <20201123184352.242907-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [72.93.72.163]
X-ClientProxiedBy: MN2PR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:208:23d::16) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.93.72.163) by
 MN2PR06CA0011.namprd06.prod.outlook.com (2603:10b6:208:23d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Mon, 23 Nov 2020 18:44:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f8d9116-8665-42fc-19db-08d88fdfc0fd
X-MS-TrafficTypeDiagnostic: SN6PR03MB4544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4544181A73F44DF9923B9AADBAFC0@SN6PR03MB4544.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 888FNQaOKGUQxThL68c4ZMFo3g3Hy5gSvwkyrtQurymniQKVPOMIOl7aPYsRMxfXsw598v5uVUjZ9KOCS4A6dRI/xp9AC63ZpTKsAWCRa9R/MCR8d7FWxCJ3h3a8MXNN7d8sShmZhvau8LV9Ly1ug3uj2WDqiWrMpRo8lKpeh/5KmO3JuPGssorNBaVEOA5dizQPFGt4mJopuyzqxvdQAXD4StZ+nh8ezZjvfQGfYw3PZnDwO7QZkuVxExoeL5qElmvoNB7UiaqO6s1wRC6BG+gIpqhPdlHpmo8cqrq2dort/gFUzc515eWD4L80plR9KdL0po4W0InLtyrn7nFM/jzhujfJkIfW/+Ny/TwXA1foTNtwclpoY3FUTrTYoTANSpwulQEC5IBXbMrsdPgvkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(8676002)(16526019)(66556008)(2616005)(7416002)(26005)(66946007)(66476007)(6486002)(956004)(54906003)(6666004)(786003)(6512007)(316002)(186003)(478600001)(966005)(83380400001)(4326008)(5660300002)(36756003)(6506007)(6916009)(86362001)(52116002)(8936002)(75432002)(1076003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: ihIBl5fPWXxMwX1xuw93AeD8yFd1jOzyu+y7N2rAdeg/MyjYjfgbKnjr5PjzHTol/TW0y6mFyyQzHAOq4fXca1i+jXUACPT3oT3hZzjucHl0bsK0Il4Ch0FZE5O2AremaLZyDa/KFKQ6W4Tis7dzB76Xjx2SSgZQmbaGNjx/Gs8snwDl98lazyYHq75PPSInLbc3nyig6YOT2SLis4u7KqyeRLo8We2+4FA152p1+G9W1+Wcs0jyIZt0iwf/EQhX2djl+ajO9GzGgLA+KkVs1r11iqMl+ChwwhvJ066dyn9suyGJP5IaB3R8/cfZanOU6SMJXw5cipKxTUEAWPPPG0SiLLFGRINPl7gBrGiCJK+Iurf9FT7QtUimBwJMAvLn2LnDJNvJ6PCmyLok6eekQ3/reb9H8vrkRBVbHGC+2EvHRcOrKWAN3xN5dNQuEhUfF3iGZAiMPnORl43jUaQLVrdkl9/oOjI0jjBVOcxEvu/qQhe4lkJpJbTmXPSeV/N8j9iHQBNXcuE9mRX7HtgD3PcUm/TZwrxrdMN1c/GJtnX1rfjX83IXmEXEfyiioy33Gpn6BuLQrJ69VohootZfE1uIEHqMqgcxEUHnSTG9trH+w4ma+FrlUMB0I/tpa5N3PFOJE4CFGQWr+y/P6yLXOMopyDC5vbQCC07ajod8kt/6heFlmt/eUpXv/tqp03NtGuQadKKmz1iiWpjnsVtHgqUlVNTeWCXMW1SY1TRHIpqidNx4zC1gS+lkGZUT5RPObVCNfficr116o5qhjgkbP/9quQWXDLQxL1YdClIckfG8zjMCA47PbO1mGjyNMD503+g66uWqNmiMF8Dbv7D8kFxMiI8D0PSLFEniUNz34X1UFPrYWLVdvqc6P88hVEdBWS0YNHaFCEIsrmkg1IhU5Q==
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8d9116-8665-42fc-19db-08d88fdfc0fd
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 18:44:05.4924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llHevvqPhX+RnxH8xmDX+fhNsf2pMudITkqTrVunP1bTmTtNmDEDY0Hp7K4MU/R4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4544
Received-SPF: pass client-ip=40.107.102.111; envelope-from=alxndr@bu.edu;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 GOOG_STO_NOIMG_HTML=2.999, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds configurations for fuzzing the following devices on oss-fuzz:

* vmxnet3
CC: Dmitry Fleytman <dmitry.fleytman@gmail.com>
* ne2k
* pcnet
* rtl8139
CC: Jason Wang <jasowang@redhat.com>
* eepro100
CC: Stefan Weil <sw@weilnetz.de>
* sdhci
CC: Philippe Mathieu-Daudé <f4bug@amsat.org>
* ehci
* ohci
* ac97
* cs4231a
* es1370
* sb16
CC: Gerd Hoffmann <kraxel@redhat.com>
* megasas
CC: Hannes Reinecke <hare@suse.com>
* parallel
CC: Michael S. Tsirkin <mst@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---

Hello,
If you are CC-ed on this email, this patch will likely enable continuous
fuzzing for a device that you are listed under in MAINTAINERS. If this is
accepted, these devices will be continuously fuzzed over their PCI, PIO,
MMIO and DMA interfaces. The fuzzer will start qemu with the arguments
specified by ".args" and we will use the globs specified under
".objects" to match the Object/MemoryRegion names that we should fuzz.
The fuzzer will find and report issues such as memory-corruptions and
aborts. For now, I am manually reproducing each issue and opening a
bug-report with a qtest-based reproducer, so the process is still quite
flexible.

The current code-coverage achieved by fuzzing using the
existing-configurations is available here:
https://storage.googleapis.com/oss-fuzz-coverage/qemu/reports/20201122/linux/src/qemu/hw/report.html
I am slowly trying to fill in the blanks.

I have little context for how useful these configurations are for
fuzzing. I appreciate if you can Ack/Nack them or provide feedback if
the devices should be configured differently.  Of course, if you think
we should be fuzzing some additional device configurations, you can also
submit a patch adding the necessary lines to this generic_fuzz_configs.h
file. 
Thanks
-Alex

 tests/qtest/fuzz/generic_fuzz_configs.h | 80 +++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index c4d925f9e6..0b1fe0f836 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -115,6 +115,86 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "pc-q35",
         .args = "-machine q35",
         .objects = "*",
+    },{
+        .name = "vmxnet3",
+        .args = "-machine q35 -nodefaults "
+        "-device vmxnet3,netdev=net0 -netdev user,id=net0",
+        .objects = "vmxnet3"
+    },{
+        .name = "ne2k_pci",
+        .args = "-machine q35 -nodefaults "
+        "-device ne2k_pci,netdev=net0 -netdev user,id=net0",
+        .objects = "ne2k*"
+    },{
+        .name = "pcnet",
+        .args = "-machine q35 -nodefaults "
+        "-device pcnet,netdev=net0 -netdev user,id=net0",
+        .objects = "pcnet"
+    },{
+        .name = "rtl8139",
+        .args = "-machine q35 -nodefaults "
+        "-device rtl8139,netdev=net0 -netdev user,id=net0",
+        .objects = "rtl8139"
+    },{
+        .name = "i82550",
+        .args = "-machine q35 -nodefaults "
+        "-device i82550,netdev=net0 -netdev user,id=net0",
+        .objects = "eepro*"
+    },{
+        .name = "sdhci-v3",
+        .args = "-nodefaults -device sdhci-pci,sd-spec-version=3 "
+        "-device sd-card,drive=mydrive "
+        "-drive if=sd,index=0,file=null-co://,format=raw,id=mydrive -nographic",
+        .objects = "sd*"
+    },{
+        .name = "ehci",
+        .args = "-machine q35 -nodefaults "
+        "-device ich9-usb-ehci1,bus=pcie.0,addr=1d.7,"
+        "multifunction=on,id=ich9-ehci-1 "
+        "-device ich9-usb-uhci1,bus=pcie.0,addr=1d.0,"
+        "multifunction=on,masterbus=ich9-ehci-1.0,firstport=0 "
+        "-device ich9-usb-uhci2,bus=pcie.0,addr=1d.1,"
+        "multifunction=on,masterbus=ich9-ehci-1.0,firstport=2 "
+        "-device ich9-usb-uhci3,bus=pcie.0,addr=1d.2,"
+        "multifunction=on,masterbus=ich9-ehci-1.0,firstport=4 "
+        "-drive if=none,id=usbcdrom,media=cdrom "
+        "-device usb-tablet,bus=ich9-ehci-1.0,port=1,usb_version=1 "
+        "-device usb-storage,bus=ich9-ehci-1.0,port=2,drive=usbcdrom",
+        .objects = "*usb* *hci*",
+    },{
+        .name = "ohci",
+        .args = "-machine q35 -nodefaults  -device pci-ohci -device usb-kbd",
+        .objects = "*usb* *ohci*",
+    },{
+        .name = "megaraid",
+        .args = "-machine q35 -nodefaults -device megasas -device scsi-cd,drive=null0 "
+        "-blockdev driver=null-co,read-zeroes=on,node-name=null0",
+        .objects = "megasas*",
+    },{
+        .name = "ac97",
+        .args = "-machine q35 -nodefaults "
+        "-device ac97,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
+        .objects = "ac97*",
+    },{
+        .name = "cs4231a",
+        .args = "-machine q35 -nodefaults "
+        "-device cs4231a,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
+        .objects = "cs4231a* i8257*",
+    },{
+        .name = "es1370",
+        .args = "-machine q35 -nodefaults "
+        "-device es1370,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
+        .objects = "es1370*",
+    },{
+        .name = "sb16",
+        .args = "-machine q35 -nodefaults "
+        "-device sb16,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
+        .objects = "sb16* i8257*",
+    },{
+        .name = "parallel",
+        .args = "-machine q35 -nodefaults "
+        "-parallel file:/dev/null",
+        .objects = "parallel*",
     }
 };
 
-- 
2.28.0


