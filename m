Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7DE681B68
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:26:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMadg-0004Nz-UE; Mon, 30 Jan 2023 15:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadT-0003RB-Gq
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadQ-00076S-BV
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UAwSvHSOl+UoCWd5gVq+4zPfPKuJ/FxuHvkI36xoePk=;
 b=hyejNH1MkH3I4gctVQzmEgL3cR1k79yUOInzoIJtY4yGuY91FdZYVVZvpXO15QjlqSJQ3R
 gFHizw2PQKCFhPZwAOyJrTyh4Nf3jDktKEwLEUbHcVVlGKwmRyQA620/XPZ/VcDJcybYNn
 5o6T47CAIREZ/cQ0HoIcmiW1YBjN8CU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-299-ulUkELp9My-vNQlZ2ATScQ-1; Mon, 30 Jan 2023 15:20:08 -0500
X-MC-Unique: ulUkELp9My-vNQlZ2ATScQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 t26-20020aa7d71a000000b004a244cc7ee8so2816827edq.2
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UAwSvHSOl+UoCWd5gVq+4zPfPKuJ/FxuHvkI36xoePk=;
 b=MaOpSVcs7Iegi+U08cDcyEevJPe0zIeNa67DIavt9rraD14Yc0og32a5RQBZStX30I
 CPyfcs/eE3O4uHtlBevTTeDEr1x6ordgVC/pIF3xqh+vXPOCyV1+LypCGHqbZomvbTRN
 jJFcUbF4vUZQ6UrUQRRwAEennpWDoP3Bl+qPUEA/PcYSCXJjG2wO4xVfkrCC/Fk9LUJI
 2JTNdyYCCGAcN7VUMGxkcVnTpU90TsnSvimScsOGzjpqflCpGSUIJ+fYaNxsjcrPUEje
 fOMKoyW6r1nGo+945UQa5BDp0mQc4/1NW4V+Lrhlb8gqBwN4/L7CUgWYbPfSsDF0StVo
 BQrQ==
X-Gm-Message-State: AO0yUKVK3AZKogE6NnQUd+josIT5oUAgzcRyruEFgpVS8V1QnWY5IHjH
 wFNF7WLbf1UWWeU2jiK8+St8cyaR/G2aK/Z82sgCKaetuG0PdVwW5FfEQBWONFKE7HhC41GCeyj
 9+TuiSOuIC2t6HfGxno525LDd42rG2zmJcgs99jmntkGa0BW41ykIrcTac25L
X-Received: by 2002:a17:906:b7ca:b0:878:814d:bc99 with SMTP id
 fy10-20020a170906b7ca00b00878814dbc99mr16014110ejb.66.1675110004022; 
 Mon, 30 Jan 2023 12:20:04 -0800 (PST)
X-Google-Smtp-Source: AK7set8WEbaok4QRm+tfQUwP43WlgpJvFsOb3kX+Eo92Am5pQD1LgLnseQotKea5csNMeOlgTHprHg==
X-Received: by 2002:a17:906:b7ca:b0:878:814d:bc99 with SMTP id
 fy10-20020a170906b7ca00b00878814dbc99mr16014075ejb.66.1675110003753; 
 Mon, 30 Jan 2023 12:20:03 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 gn19-20020a1709070d1300b008512e1379dbsm7505598ejc.171.2023.01.30.12.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:03 -0800 (PST)
Date: Mon, 30 Jan 2023 15:19:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 Eric Biggers <ebiggers@kernel.org>, Eric Biggers <ebiggers@google.com>,
 Mathias Krause <minipli@grsecurity.net>,
 Sergio Lopez <slp@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 10/56] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <20230130201810.11518-11-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

The setup_data links are appended to the compressed kernel image. Since
the kernel image is typically loaded at 0x100000, setup_data lives at
`0x100000 + compressed_size`, which does not get relocated during the
kernel's boot process.

The kernel typically decompresses the image starting at address
0x1000000 (note: there's one more zero there than the compressed image
above). This usually is fine for most kernels.

However, if the compressed image is actually quite large, then
setup_data will live at a `0x100000 + compressed_size` that extends into
the decompressed zone at 0x1000000. In other words, if compressed_size
is larger than `0x1000000 - 0x100000`, then the decompression step will
clobber setup_data, resulting in crashes.

Visually, what happens now is that QEMU appends setup_data to the kernel
image:

          kernel image            setup_data
   |--------------------------||----------------|
0x100000                  0x100000+l1     0x100000+l1+l2

The problem is that this decompresses to 0x1000000 (one more zero). So
if l1 is > (0x1000000-0x100000), then this winds up looking like:

          kernel image            setup_data
   |--------------------------||----------------|
0x100000                  0x100000+l1     0x100000+l1+l2

                                 d e c o m p r e s s e d   k e r n e l
                     |-------------------------------------------------------------|
                0x1000000                                                     0x1000000+l3

The decompressed kernel seemingly overwriting the compressed kernel
image isn't a problem, because that gets relocated to a higher address
early on in the boot process, at the end of startup_64. setup_data,
however, stays in the same place, since those links are self referential
and nothing fixes them up.  So the decompressed kernel clobbers it.

Fix this by appending setup_data to the cmdline blob rather than the
kernel image blob, which remains at a lower address that won't get
clobbered.

This could have been done by overwriting the initrd blob instead, but
that poses big difficulties, such as no longer being able to use memory
mapped files for initrd, hurting performance, and, more importantly, the
initrd address calculation is hard coded in qboot, and it always grows
down rather than up, which means lots of brittle semantics would have to
be changed around, incurring more complexity. In contrast, using cmdline
is simple and doesn't interfere with anything.

The microvm machine has a gross hack where it fiddles with fw_cfg data
after the fact. So this hack is updated to account for this appending,
by reserving some bytes.

Fixup-by: Michael S. Tsirkin <mst@redhat.com>
Cc: x86@kernel.org
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-Id: <20221230220725.618763-1-Jason@zx2c4.com>
Message-ID: <20230128061015-mutt-send-email-mst@kernel.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Eric Biggers <ebiggers@google.com>
Tested-by: Mathias Krause <minipli@grsecurity.net>
---
 include/hw/i386/microvm.h |  5 ++--
 include/hw/nvram/fw_cfg.h |  9 +++++++
 hw/i386/microvm.c         | 15 +++++++----
 hw/i386/x86.c             | 52 +++++++++++++++++++++------------------
 hw/nvram/fw_cfg.c         |  9 +++++++
 5 files changed, 59 insertions(+), 31 deletions(-)

diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index fad97a891d..e8af61f194 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -50,8 +50,9 @@
  */
 
 /* Platform virtio definitions */
-#define VIRTIO_MMIO_BASE      0xfeb00000
-#define VIRTIO_CMDLINE_MAXLEN 64
+#define VIRTIO_MMIO_BASE                0xfeb00000
+#define VIRTIO_CMDLINE_MAXLEN           64
+#define VIRTIO_CMDLINE_TOTAL_MAX_LEN    ((VIRTIO_CMDLINE_MAXLEN + 1) * 16)
 
 #define GED_MMIO_BASE         0xfea00000
 #define GED_MMIO_BASE_MEMHP   (GED_MMIO_BASE + 0x100)
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 2e503904dc..990dcdbb2e 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -139,6 +139,15 @@ void fw_cfg_add_bytes_callback(FWCfgState *s, uint16_t key,
                                void *data, size_t len,
                                bool read_only);
 
+/**
+ * fw_cfg_read_bytes_ptr:
+ * @s: fw_cfg device being modified
+ * @key: selector key value for new fw_cfg item
+ *
+ * Reads an existing fw_cfg data pointer.
+ */
+void *fw_cfg_read_bytes_ptr(FWCfgState *s, uint16_t key);
+
 /**
  * fw_cfg_add_string:
  * @s: fw_cfg device being modified
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 170a331e3f..29f30dd6d3 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -378,7 +378,8 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
     MicrovmMachineState *mms = MICROVM_MACHINE(machine);
     BusState *bus;
     BusChild *kid;
-    char *cmdline;
+    char *cmdline, *existing_cmdline;
+    size_t len;
 
     /*
      * Find MMIO transports with attached devices, and add them to the kernel
@@ -387,7 +388,8 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
      * Yes, this is a hack, but one that heavily improves the UX without
      * introducing any significant issues.
      */
-    cmdline = g_strdup(machine->kernel_cmdline);
+    existing_cmdline = fw_cfg_read_bytes_ptr(x86ms->fw_cfg, FW_CFG_CMDLINE_DATA);
+    cmdline = g_strdup(existing_cmdline);
     bus = sysbus_get_default();
     QTAILQ_FOREACH(kid, &bus->children, sibling) {
         DeviceState *dev = kid->child;
@@ -411,9 +413,12 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
         }
     }
 
-    fw_cfg_modify_i32(x86ms->fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(cmdline) + 1);
-    fw_cfg_modify_string(x86ms->fw_cfg, FW_CFG_CMDLINE_DATA, cmdline);
-
+    len = strlen(cmdline);
+    if (len > VIRTIO_CMDLINE_TOTAL_MAX_LEN + strlen(existing_cmdline)) {
+        fprintf(stderr, "qemu: virtio mmio cmdline too large, skipping\n");
+    } else {
+        memcpy(existing_cmdline, cmdline, len + 1);
+    }
     g_free(cmdline);
 }
 
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 78cc131926..eaff4227bd 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -50,6 +50,7 @@
 #include "hw/intc/i8259.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "target/i386/sev.h"
+#include "hw/i386/microvm.h"
 
 #include "hw/acpi/cpu_hotplug.h"
 #include "hw/irq.h"
@@ -813,12 +814,18 @@ void x86_load_linux(X86MachineState *x86ms,
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     const char *dtb_filename = machine->dtb;
-    const char *kernel_cmdline = machine->kernel_cmdline;
+    char *kernel_cmdline;
     SevKernelLoaderContext sev_load_ctx = {};
     enum { RNG_SEED_LENGTH = 32 };
 
-    /* Align to 16 bytes as a paranoia measure */
-    cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
+    /*
+     * Add the NUL terminator, some padding for the microvm cmdline fiddling
+     * hack, and then align to 16 bytes as a paranoia measure
+     */
+    cmdline_size = (strlen(machine->kernel_cmdline) + 1 +
+                    VIRTIO_CMDLINE_TOTAL_MAX_LEN + 16) & ~15;
+    /* Make a copy, since we might append arbitrary bytes to it later. */
+    kernel_cmdline = g_strndup(machine->kernel_cmdline, cmdline_size);
 
     /* load the kernel header */
     f = fopen(kernel_filename, "rb");
@@ -959,12 +966,6 @@ void x86_load_linux(X86MachineState *x86ms,
         initrd_max = x86ms->below_4g_mem_size - acpi_data_size - 1;
     }
 
-    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
-    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline) + 1);
-    fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
-    sev_load_ctx.cmdline_data = (char *)kernel_cmdline;
-    sev_load_ctx.cmdline_size = strlen(kernel_cmdline) + 1;
-
     if (protocol >= 0x202) {
         stl_p(header + 0x228, cmdline_addr);
     } else {
@@ -1091,27 +1092,24 @@ void x86_load_linux(X86MachineState *x86ms,
             exit(1);
         }
 
-        setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
-        kernel_size = setup_data_offset + sizeof(SetupData) + dtb_size;
-        kernel = g_realloc(kernel, kernel_size);
-
-
-        setup_data = (SetupData *)(kernel + setup_data_offset);
+        setup_data_offset = cmdline_size;
+        cmdline_size += sizeof(SetupData) + dtb_size;
+        kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
+        setup_data = (void *)kernel_cmdline + setup_data_offset;
         setup_data->next = cpu_to_le64(first_setup_data);
-        first_setup_data = prot_addr + setup_data_offset;
+        first_setup_data = cmdline_addr + setup_data_offset;
         setup_data->type = cpu_to_le32(SETUP_DTB);
         setup_data->len = cpu_to_le32(dtb_size);
-
         load_image_size(dtb_filename, setup_data->data, dtb_size);
     }
 
-    if (!legacy_no_rng_seed) {
-        setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
-        kernel_size = setup_data_offset + sizeof(SetupData) + RNG_SEED_LENGTH;
-        kernel = g_realloc(kernel, kernel_size);
-        setup_data = (SetupData *)(kernel + setup_data_offset);
+    if (!legacy_no_rng_seed && protocol >= 0x209) {
+        setup_data_offset = cmdline_size;
+        cmdline_size += sizeof(SetupData) + RNG_SEED_LENGTH;
+        kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
+        setup_data = (void *)kernel_cmdline + setup_data_offset;
         setup_data->next = cpu_to_le64(first_setup_data);
-        first_setup_data = prot_addr + setup_data_offset;
+        first_setup_data = cmdline_addr + setup_data_offset;
         setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
@@ -1122,6 +1120,12 @@ void x86_load_linux(X86MachineState *x86ms,
         fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
     }
 
+    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
+    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, cmdline_size);
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline, cmdline_size);
+    sev_load_ctx.cmdline_data = (char *)kernel_cmdline;
+    sev_load_ctx.cmdline_size = cmdline_size;
+
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
     sev_load_ctx.kernel_data = (char *)kernel;
@@ -1134,7 +1138,7 @@ void x86_load_linux(X86MachineState *x86ms,
      * kernel on the other side of the fw_cfg interface matches the hash of the
      * file the user passed in.
      */
-    if (!sev_enabled()) {
+    if (!sev_enabled() && first_setup_data) {
         SetupDataFixup *fixup = g_malloc(sizeof(*fixup));
 
         memcpy(setup, header, MIN(sizeof(header), setup_size));
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index a00881bc64..432754eda4 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -741,6 +741,15 @@ void fw_cfg_add_bytes(FWCfgState *s, uint16_t key, void *data, size_t len)
     fw_cfg_add_bytes_callback(s, key, NULL, NULL, NULL, data, len, true);
 }
 
+void *fw_cfg_read_bytes_ptr(FWCfgState *s, uint16_t key)
+{
+    int arch = !!(key & FW_CFG_ARCH_LOCAL);
+
+    key &= FW_CFG_ENTRY_MASK;
+    assert(key < fw_cfg_max_entry(s));
+    return s->entries[arch][key].data;
+}
+
 void fw_cfg_add_string(FWCfgState *s, uint16_t key, const char *value)
 {
     size_t sz = strlen(value) + 1;
-- 
MST


