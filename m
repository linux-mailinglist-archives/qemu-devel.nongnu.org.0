Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAA03B2C5F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:22:54 +0200 (CEST)
Received: from localhost ([::1]:33344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMVZ-00056I-3o
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lwMTk-00035B-JE
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:21:00 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lwMTh-0007rz-VO
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:21:00 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15OA3Q5X161790; Thu, 24 Jun 2021 06:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6ZjaZqt7tv6tVOkOmGKg9J8Sq2xkouyIEPb2n+8RyN0=;
 b=jiWuXzYtI8Aarm4vkCBivUCibqi944gJpor0jpE9QXVIY2Kg7TNSV83WadCKkxXF95Bv
 Y7QW+vHR7I0dRrS8sAeCprLF2HXyG0/bgnHloDKvosntNn9Xjmppij9JAzF+O4+eHx/M
 OXm8dpnYBKWCgLvtJmMtWaYUAplS/11NM2+Tgsp/NR4U6Ch3Pb6bCZD/VNfl8DbSAHwy
 c/tJCWLm4Ng4n3kcgalATTD8Zx7A/IBn7bQkxOpJVGtpH1pm0Xm7bOvTO5cdmBS6ZbBN
 XBfERBz/SEuIE/rFRD2J39jJ8MRKTXfD0jNljU7K/AdQ7Z8z9MAsJaBCZEzHyfBjgjA6 DA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39chyac78j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 06:20:54 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15OA3TDg162027;
 Thu, 24 Jun 2021 06:20:53 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39chyac781-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 06:20:53 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15OAD7Gb017693;
 Thu, 24 Jun 2021 10:20:52 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 399879qw1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 10:20:52 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15OAKpgD16908568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 10:20:51 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34B8F78066;
 Thu, 24 Jun 2021 10:20:51 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12CDD7805C;
 Thu, 24 Jun 2021 10:20:50 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.2.130.16])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 24 Jun 2021 10:20:49 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] x86/sev: generate SEV kernel loader hashes in
 x86_load_linux
Date: Thu, 24 Jun 2021 10:20:40 +0000
Message-Id: <20210624102040.2015280-3-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210624102040.2015280-1-dovmurik@linux.ibm.com>
References: <20210624102040.2015280-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kBuf1aKVAJwDS-AgjejRihAZwqyCuAjC
X-Proofpoint-ORIG-GUID: uAMtmICkFxk9F5vffmQnxpEUA8GuQ5Ov
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-24_06:2021-06-24,
 2021-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106240054
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If SEV is enabled and a kernel is passed via -kernel, pass the hashes of
kernel/initrd/cmdline in an encrypted guest page to OVMF for SEV
measured boot.

Co-developed-by: James Bottomley <jejb@linux.ibm.com>
Signed-off-by: James Bottomley <jejb@linux.ibm.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
---
 hw/i386/x86.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index d30cf27e29..830c8f6f58 100644
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
+    KernelLoaderContext kernel_loader_context = {};
 
     /* Align to 16 bytes as a paranoia measure */
     cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
@@ -924,6 +926,8 @@ void x86_load_linux(X86MachineState *x86ms,
     fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline) + 1);
     fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
+    kernel_loader_context.cmdline_data = (char *)kernel_cmdline;
+    kernel_loader_context.cmdline_size = strlen(kernel_cmdline) + 1;
 
     if (protocol >= 0x202) {
         stl_p(header + 0x228, cmdline_addr);
@@ -1005,6 +1009,8 @@ void x86_load_linux(X86MachineState *x86ms,
         fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_ADDR, initrd_addr);
         fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_SIZE, initrd_size);
         fw_cfg_add_bytes(fw_cfg, FW_CFG_INITRD_DATA, initrd_data, initrd_size);
+        kernel_loader_context.initrd_data = initrd_data;
+        kernel_loader_context.initrd_size = initrd_size;
 
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
+    kernel_loader_context.kernel_data = (char *)kernel;
+    kernel_loader_context.kernel_size = kernel_size;
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, setup_size);
     fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA, setup, setup_size);
+    kernel_loader_context.setup_data = (char *)setup;
+    kernel_loader_context.setup_size = setup_size;
+
+    if (sev_enabled()) {
+        sev_add_kernel_loader_hashes(&kernel_loader_context, &error_fatal);
+    }
 
     option_rom[nb_option_roms].bootindex = 0;
     option_rom[nb_option_roms].name = "linuxboot.bin";
-- 
2.25.1


