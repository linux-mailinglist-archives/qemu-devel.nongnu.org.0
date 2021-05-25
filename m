Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A0038FB5A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 09:02:30 +0200 (CEST)
Received: from localhost ([::1]:59874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llR5A-0000oa-NU
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 03:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1llR2h-0008R6-0X
 for qemu-devel@nongnu.org; Tue, 25 May 2021 02:59:55 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44588
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1llR2e-0005DG-F8
 for qemu-devel@nongnu.org; Tue, 25 May 2021 02:59:54 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14P6c0D4130080; Tue, 25 May 2021 02:59:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=HyYJcuAbk2BRKrqcpAW+kOAIJUZpDGxvl4l/KS/gq7U=;
 b=E4xJUzGMXOKUgSoQvzKa2uUhHnKm3UCJjWZUnWM9mvKUQ2lV058l1r19Azf6E3XRqQsi
 f9igm4CkEBWWbrW41rIZl503LNV7alZ9Ac83U6XdchAeLpLgRflNAJrkwT7VoLFOef0+
 6uDdn9JLyYFuBeN3sEDYuZssMK+lQmZEesU+Wk3YZsxzkqBilMf1gue6HTUUTexraFNp
 DcxhMove5Xd7XMDgG4bYNl2QCk3a+IYbBw5NbANhQJIgLYUeJ73o9E1RGoF2jnRDoJFs
 3mTi0mFaMtN9Kx5H9unNtfhi/FYhvSN6oEUa2IKxlZ6Kdp5IgLjvf2l653wSngjEhito 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38rueyhe0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 02:59:48 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14P6cCZI132367;
 Tue, 25 May 2021 02:59:48 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38rueyhe0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 02:59:48 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14P6r0h9022883;
 Tue, 25 May 2021 06:59:47 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 38psk94wuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 06:59:47 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14P6xl6A9241364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 06:59:47 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03A4FB2068;
 Tue, 25 May 2021 06:59:47 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0B29B205F;
 Tue, 25 May 2021 06:59:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.2.130.16])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 25 May 2021 06:59:46 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] x86: add SEV hashing to fw_cfg for kernel/initrd/cmdline
Date: Tue, 25 May 2021 06:59:31 +0000
Message-Id: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FZ7PLIsT2A28MXx65ZVIpQiqiJMdwAet
X-Proofpoint-ORIG-GUID: qZcGYn5Z3NINiEvDNyHGbJ7U4hoiUMiY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-25_03:2021-05-24,
 2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 spamscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105250045
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Hubertus Franke <frankeh@us.ibm.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: James Bottomley <jejb@linux.ibm.com>

If the VM is using memory encryption and also specifies a kernel/initrd
or appended command line, calculate the hashes and add them to the
encrypted data.  For this to work, OVMF must support an encrypted area
to place the data which is advertised via a special GUID in the OVMF
reset table (if the GUID doesn't exist, the user isn't allowed to pass
in the kernel/initrd/cmdline via the fw_cfg interface).

The hashes of each of the files is calculated (or the string in the case
of the cmdline with trailing '\0' included).  Each entry in the hashes
table is GUID identified and since they're passed through the memcrypt
interface, the hash of the encrypted data will be accumulated by the
PSP.

Signed-off-by: James Bottomley <jejb@linux.ibm.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
[dovmurik@linux.ibm.com: use machine->cgs, remove parsing of GUID
strings, remove GCC pragma, fix checkpatch errors]
---

OVMF support for handling the table of hashes (verifying that the
kernel/initrd/cmdline passed via the fw_cfg interface indeed correspond
to the measured hashes in the table) will be posted soon to edk2-devel.

---
 hw/i386/x86.c | 120 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 1 deletion(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index ed796fe6ba..d8e77b99b4 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -37,12 +37,16 @@
 #include "sysemu/replay.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/cpu-timers.h"
+#include "sysemu/sev.h"
+#include "exec/confidential-guest-support.h"
 #include "trace.h"
+#include "crypto/hash.h"
 
 #include "hw/i386/x86.h"
 #include "target/i386/cpu.h"
 #include "hw/i386/topology.h"
 #include "hw/i386/fw_cfg.h"
+#include "hw/i386/pc.h"
 #include "hw/intc/i8259.h"
 #include "hw/rtc/mc146818rtc.h"
 
@@ -758,6 +762,42 @@ static bool load_elfboot(const char *kernel_filename,
     return true;
 }
 
+struct sev_hash_table_descriptor {
+    uint32_t base;
+    uint32_t size;
+};
+
+/* hard code sha256 digest size */
+#define HASH_SIZE 32
+
+struct sev_hash_table_entry {
+    uint8_t guid[16];
+    uint16_t len;
+    uint8_t hash[HASH_SIZE];
+} __attribute__ ((packed));
+
+struct sev_hash_table {
+    uint8_t guid[16];
+    uint16_t len;
+    struct sev_hash_table_entry entries[];
+} __attribute__((packed));
+
+#define SEV_HASH_TABLE_RV_GUID "7255371f-3a3b-4b04-927b-1da6efa8d454"
+
+static const uint8_t sev_hash_table_header_guid[] =
+        UUID_LE(0x9438d606, 0x4f22, 0x4cc9, 0xb4, 0x79, 0xa7, 0x93,
+                0xd4, 0x11, 0xfd, 0x21);
+
+static const uint8_t sev_kernel_entry_guid[] =
+        UUID_LE(0x4de79437, 0xabd2, 0x427f, 0xb8, 0x35, 0xd5, 0xb1,
+                0x72, 0xd2, 0x04, 0x5b);
+static const uint8_t sev_initrd_entry_guid[] =
+        UUID_LE(0x44baf731, 0x3a2f, 0x4bd7, 0x9a, 0xf1, 0x41, 0xe2,
+                0x91, 0x69, 0x78, 0x1d);
+static const uint8_t sev_cmdline_entry_guid[] =
+        UUID_LE(0x97d02dd8, 0xbd20, 0x4c94, 0xaa, 0x78, 0xe7, 0x71,
+                0x4d, 0x36, 0xab, 0x2a);
+
 void x86_load_linux(X86MachineState *x86ms,
                     FWCfgState *fw_cfg,
                     int acpi_data_size,
@@ -778,6 +818,11 @@ void x86_load_linux(X86MachineState *x86ms,
     const char *initrd_filename = machine->initrd_filename;
     const char *dtb_filename = machine->dtb;
     const char *kernel_cmdline = machine->kernel_cmdline;
+    uint8_t buf[HASH_SIZE];
+    uint8_t *hash = buf;
+    size_t hash_len = sizeof(buf);
+    struct sev_hash_table *sev_ht = NULL;
+    int sev_ht_index = 0;
 
     /* Align to 16 bytes as a paranoia measure */
     cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
@@ -799,6 +844,22 @@ void x86_load_linux(X86MachineState *x86ms,
         exit(1);
     }
 
+    if (machine->cgs && machine->cgs->ready) {
+        uint8_t *data;
+        struct sev_hash_table_descriptor *area;
+
+        if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
+            fprintf(stderr, "qemu: kernel command line specified but OVMF has "
+                    "no hash table guid\n");
+            exit(1);
+        }
+        area = (struct sev_hash_table_descriptor *)data;
+
+        sev_ht = qemu_map_ram_ptr(NULL, area->base);
+        memcpy(sev_ht->guid, sev_hash_table_header_guid, sizeof(sev_ht->guid));
+        sev_ht->len = sizeof(*sev_ht);
+    }
+
     /* kernel protocol version */
     if (ldl_p(header + 0x202) == 0x53726448) {
         protocol = lduw_p(header + 0x206);
@@ -925,6 +986,17 @@ void x86_load_linux(X86MachineState *x86ms,
     fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline) + 1);
     fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
 
+    if (sev_ht) {
+        struct sev_hash_table_entry *e = &sev_ht->entries[sev_ht_index++];
+
+        qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, (char *)kernel_cmdline,
+                           strlen(kernel_cmdline) + 1,
+                           &hash, &hash_len, &error_fatal);
+        memcpy(e->hash, hash, hash_len);
+        e->len = sizeof(*e);
+        memcpy(e->guid, sev_cmdline_entry_guid, sizeof(e->guid));
+    }
+
     if (protocol >= 0x202) {
         stl_p(header + 0x228, cmdline_addr);
     } else {
@@ -1008,6 +1080,17 @@ void x86_load_linux(X86MachineState *x86ms,
 
         stl_p(header + 0x218, initrd_addr);
         stl_p(header + 0x21c, initrd_size);
+
+        if (sev_ht) {
+            struct sev_hash_table_entry *e = &sev_ht->entries[sev_ht_index++];
+
+            qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, (char *)initrd_data,
+                               initrd_size, &hash, &hash_len, &error_fatal);
+            memcpy(e->hash, hash, hash_len);
+            e->len = sizeof(*e);
+            memcpy(e->guid, sev_initrd_entry_guid, sizeof(e->guid));
+        }
+
     }
 
     /* load kernel and setup */
@@ -1063,7 +1146,17 @@ void x86_load_linux(X86MachineState *x86ms,
         load_image_size(dtb_filename, setup_data->data, dtb_size);
     }
 
-    memcpy(setup, header, MIN(sizeof(header), setup_size));
+    /*
+     * If we're doing an encrypted VM (sev_ht will be set), it will be
+     * OVMF based, which uses the efi stub for booting and doesn't
+     * require any values to be placed in the kernel header.  We
+     * therefore don't update the header so the hash of the kernel on
+     * the other side of the fw_cfg interface matches the hash of the
+     * file the user passed in.
+     */
+    if (!sev_ht) {
+        memcpy(setup, header, MIN(sizeof(header), setup_size));
+    }
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
@@ -1073,6 +1166,31 @@ void x86_load_linux(X86MachineState *x86ms,
     fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, setup_size);
     fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA, setup, setup_size);
 
+    if (sev_ht) {
+        struct iovec iov[2] = {
+            {.iov_base = (char *)setup, .iov_len = setup_size },
+            {.iov_base = (char *)kernel, .iov_len = kernel_size }
+        };
+        struct sev_hash_table_entry *e = &sev_ht->entries[sev_ht_index++];
+        int len;
+
+        qcrypto_hash_bytesv(QCRYPTO_HASH_ALG_SHA256, iov, 2,
+                            &hash, &hash_len, &error_fatal);
+        memcpy(e->hash, hash, hash_len);
+        e->len = sizeof(*e);
+        memcpy(e->guid, sev_kernel_entry_guid, sizeof(e->guid));
+
+        /* now we have all the possible entries, finalize the hash table */
+        sev_ht->len += sev_ht_index * sizeof(*e);
+        /* SEV len has to be 16 byte aligned */
+        len = ROUND_UP(sev_ht->len, 16);
+        if (len != sev_ht->len) {
+            /* zero the excess data so hash can be reliably calculated */
+            memset(&sev_ht->entries[sev_ht_index], 0, len - sev_ht->len);
+        }
+
+        sev_encrypt_flash((uint8_t *)sev_ht, len, &error_fatal);
+    }
     option_rom[nb_option_roms].bootindex = 0;
     option_rom[nb_option_roms].name = "linuxboot.bin";
     if (linuxboot_dma_enabled && fw_cfg_dma_enabled(fw_cfg)) {
-- 
2.25.1


