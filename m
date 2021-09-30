Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448B641D3A0
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:53:56 +0200 (CEST)
Received: from localhost ([::1]:36608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpx5-0001Ew-AO
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mVowr-0000OR-69
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 01:49:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mVowp-0007dU-CW
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 01:49:36 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18U5fwuP007122; 
 Thu, 30 Sep 2021 01:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=YPlHPJnGvP2FCdCOf63RSd7EHg/tVZ2Z0b7afJwNbAQ=;
 b=FFPj/Sml7kmRYYasBmknXdBs/ADxQ+XRjAZy49hZxOTv7PlNiurriyzAOG7MqKangloS
 9E8fwFctOHUbmUyGg8hzdIrimEv3DZTN11vAgEtf/a4pzc5x55Z0CCaVeAkSI+BYE23C
 dlPW0FJX9x7FRbaRTPvbmNJigDZSg2tn36I8MDvYICsKfj8jR2cwVGiyBP/c2rcjdqH6
 +Y2bDyKMesCMI8Y2TmmWcG16vUQjYmHFKL0qgKSed0QUG0Yn0bTv6/MDmdjYBrkBljpv
 +ak9xSAW08gY9Gu2G1ex+w/SceRNuOGAaeJ622Al87MoQzD/9KZe95xMBWpOnBPB4io0 Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bd7ak84fc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 01:49:33 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18U5l6mT023393;
 Thu, 30 Sep 2021 01:49:32 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bd7ak84ew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 01:49:32 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18U5bPhk015273;
 Thu, 30 Sep 2021 05:49:31 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 3b9udcdaj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 05:49:31 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18U5nUTR27394434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Sep 2021 05:49:30 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A028AC060;
 Thu, 30 Sep 2021 05:49:30 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B51E9AC059;
 Thu, 30 Sep 2021 05:49:26 +0000 (GMT)
Received: from DOVMURIK-QI20.localdomain (unknown [9.65.215.111])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 30 Sep 2021 05:49:26 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] x86/sev: generate SEV kernel loader hashes in
 x86_load_linux
Date: Thu, 30 Sep 2021 08:49:15 +0300
Message-Id: <20210930054915.13252-3-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930054915.13252-1-dovmurik@linux.ibm.com>
References: <20210930054915.13252-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 79kEEkSEOYFwgIAnbrRY0eowQKk65TpE
X-Proofpoint-GUID: dgE50aP39wazTTBomxcdHaCHJsAdT3p3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_01,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109300035
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If SEV is enabled and a kernel is passed via -kernel, pass the hashes of
kernel/initrd/cmdline in an encrypted guest page to OVMF for SEV
measured boot.

Co-developed-by: James Bottomley <jejb@linux.ibm.com>
Signed-off-by: James Bottomley <jejb@linux.ibm.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/x86.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 00448ed55a..3f37d17b5c 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -45,6 +45,7 @@
 #include "hw/i386/fw_cfg.h"
 #include "hw/intc/i8259.h"
 #include "hw/rtc/mc146818rtc.h"
+#include "target/i386/sev_i386.h"
 
 #include "hw/acpi/cpu_hotplug.h"
 #include "hw/irq.h"
@@ -778,6 +779,7 @@ void x86_load_linux(X86MachineState *x86ms,
     const char *initrd_filename = machine->initrd_filename;
     const char *dtb_filename = machine->dtb;
     const char *kernel_cmdline = machine->kernel_cmdline;
+    SevKernelLoaderContext sev_load_ctx = {};
 
     /* Align to 16 bytes as a paranoia measure */
     cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
@@ -924,6 +926,8 @@ void x86_load_linux(X86MachineState *x86ms,
     fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline) + 1);
     fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
+    sev_load_ctx.cmdline_data = (char *)kernel_cmdline;
+    sev_load_ctx.cmdline_size = strlen(kernel_cmdline) + 1;
 
     if (protocol >= 0x202) {
         stl_p(header + 0x228, cmdline_addr);
@@ -1005,6 +1009,8 @@ void x86_load_linux(X86MachineState *x86ms,
         fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_ADDR, initrd_addr);
         fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_SIZE, initrd_size);
         fw_cfg_add_bytes(fw_cfg, FW_CFG_INITRD_DATA, initrd_data, initrd_size);
+        sev_load_ctx.initrd_data = initrd_data;
+        sev_load_ctx.initrd_size = initrd_size;
 
         stl_p(header + 0x218, initrd_addr);
         stl_p(header + 0x21c, initrd_size);
@@ -1063,15 +1069,32 @@ void x86_load_linux(X86MachineState *x86ms,
         load_image_size(dtb_filename, setup_data->data, dtb_size);
     }
 
-    memcpy(setup, header, MIN(sizeof(header), setup_size));
+    /*
+     * If we're starting an encrypted VM, it will be OVMF based, which uses the
+     * efi stub for booting and doesn't require any values to be placed in the
+     * kernel header.  We therefore don't update the header so the hash of the
+     * kernel on the other side of the fw_cfg interface matches the hash of the
+     * file the user passed in.
+     */
+    if (!sev_enabled()) {
+        memcpy(setup, header, MIN(sizeof(header), setup_size));
+    }
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
     fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
+    sev_load_ctx.kernel_data = (char *)kernel;
+    sev_load_ctx.kernel_size = kernel_size;
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, setup_size);
     fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA, setup, setup_size);
+    sev_load_ctx.setup_data = (char *)setup;
+    sev_load_ctx.setup_size = setup_size;
+
+    if (sev_enabled()) {
+        sev_add_kernel_loader_hashes(&sev_load_ctx, &error_fatal);
+    }
 
     option_rom[nb_option_roms].bootindex = 0;
     option_rom[nb_option_roms].name = "linuxboot.bin";
-- 
2.25.1


