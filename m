Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926F368382C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 21:59:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMxeu-0005yB-Me; Tue, 31 Jan 2023 15:55:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pMxee-0005V6-Ct
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:55:00 -0500
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpa@zytor.com>) id 1pMxea-0004kR-RP
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:55:00 -0500
Received: from [127.0.0.1] ([73.223.250.219]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 30VKsTto1346294
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 31 Jan 2023 12:54:30 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 30VKsTto1346294
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2023010601; t=1675198471;
 bh=y96oR8HeUa1z5EESBGv9vlP/gbyuX2wS/ddqRYMTi5k=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=Wc/siy+lSSaGnatuP1LSq0OpawEbqDpPIFg75t68PXMGYBKuT8kc+ISPY43rHDMuK
 xodRQmNDuHBTaNvRBWQRoVRhJPn7Wc1fv2TBpyvGTJ8BEzXmr2lOCq/ia29Cx+kuow
 L5LH0DpiZvigUheh52hj/hOZnQ7GPVJ4LcYqoHPGpEcy4c0JuH6OyKIfZvIgHDClg/
 XMPIn6xf015oiIm2Ra1sFacPrJfQrh+afQQhTLJtKIMt2muciyu1qRlfhNdmALWdDy
 VuHlGLniQsPTp9QIU504fen3fYHTryJPFZkAFZrAVQ4xQMR/M5z2kilVgykHTRHdS7
 7y0DVHuIF74zg==
Date: Tue, 31 Jan 2023 12:54:29 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
CC: Peter Maydell <peter.maydell@linaro.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Borislav Petkov <bp@alien8.de>, Eric Biggers <ebiggers@kernel.org>,
 Eric Biggers <ebiggers@google.com>,
 Mathias Krause <minipli@grsecurity.net>, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPULL_10/56=5D_x86=3A_don=27t_let_decomp?=
 =?US-ASCII?Q?ressed_kernel_image_clobber_setup=5Fdata?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20230130201810.11518-11-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
 <20230130201810.11518-11-mst@redhat.com>
Message-ID: <7B8997DB-60EE-4DE9-A594-4031F8315C23@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:7c80:54:3::138
 (failed)
Received-SPF: pass client-ip=2607:7c80:54:3::138; envelope-from=hpa@zytor.com;
 helo=mail.zytor.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On January 30, 2023 12:19:14 PM PST, "Michael S=2E Tsirkin" <mst@redhat=2Ec=
om> wrote:
>From: "Jason A=2E Donenfeld" <Jason@zx2c4=2Ecom>
>
>The setup_data links are appended to the compressed kernel image=2E Since
>the kernel image is typically loaded at 0x100000, setup_data lives at
>`0x100000 + compressed_size`, which does not get relocated during the
>kernel's boot process=2E
>
>The kernel typically decompresses the image starting at address
>0x1000000 (note: there's one more zero there than the compressed image
>above)=2E This usually is fine for most kernels=2E
>
>However, if the compressed image is actually quite large, then
>setup_data will live at a `0x100000 + compressed_size` that extends into
>the decompressed zone at 0x1000000=2E In other words, if compressed_size
>is larger than `0x1000000 - 0x100000`, then the decompression step will
>clobber setup_data, resulting in crashes=2E
>
>Visually, what happens now is that QEMU appends setup_data to the kernel
>image:
>
>          kernel image            setup_data
>   |--------------------------||----------------|
>0x100000                  0x100000+l1     0x100000+l1+l2
>
>The problem is that this decompresses to 0x1000000 (one more zero)=2E So
>if l1 is > (0x1000000-0x100000), then this winds up looking like:
>
>          kernel image            setup_data
>   |--------------------------||----------------|
>0x100000                  0x100000+l1     0x100000+l1+l2
>
>                                 d e c o m p r e s s e d   k e r n e l
>                     |---------------------------------------------------=
----------|
>                0x1000000                                                =
     0x1000000+l3
>
>The decompressed kernel seemingly overwriting the compressed kernel
>image isn't a problem, because that gets relocated to a higher address
>early on in the boot process, at the end of startup_64=2E setup_data,
>however, stays in the same place, since those links are self referential
>and nothing fixes them up=2E  So the decompressed kernel clobbers it=2E
>
>Fix this by appending setup_data to the cmdline blob rather than the
>kernel image blob, which remains at a lower address that won't get
>clobbered=2E
>
>This could have been done by overwriting the initrd blob instead, but
>that poses big difficulties, such as no longer being able to use memory
>mapped files for initrd, hurting performance, and, more importantly, the
>initrd address calculation is hard coded in qboot, and it always grows
>down rather than up, which means lots of brittle semantics would have to
>be changed around, incurring more complexity=2E In contrast, using cmdlin=
e
>is simple and doesn't interfere with anything=2E
>
>The microvm machine has a gross hack where it fiddles with fw_cfg data
>after the fact=2E So this hack is updated to account for this appending,
>by reserving some bytes=2E
>
>Fixup-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>Cc: x86@kernel=2Eorg
>Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>Cc: H=2E Peter Anvin <hpa@zytor=2Ecom>
>Cc: Borislav Petkov <bp@alien8=2Ede>
>Cc: Eric Biggers <ebiggers@kernel=2Eorg>
>Signed-off-by: Jason A=2E Donenfeld <Jason@zx2c4=2Ecom>
>Message-Id: <20221230220725=2E618763-1-Jason@zx2c4=2Ecom>
>Message-ID: <20230128061015-mutt-send-email-mst@kernel=2Eorg>
>Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>Signed-off-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>Tested-by: Eric Biggers <ebiggers@google=2Ecom>
>Tested-by: Mathias Krause <minipli@grsecurity=2Enet>
>---
> include/hw/i386/microvm=2Eh |  5 ++--
> include/hw/nvram/fw_cfg=2Eh |  9 +++++++
> hw/i386/microvm=2Ec         | 15 +++++++----
> hw/i386/x86=2Ec             | 52 +++++++++++++++++++++------------------
> hw/nvram/fw_cfg=2Ec         |  9 +++++++
> 5 files changed, 59 insertions(+), 31 deletions(-)
>
>diff --git a/include/hw/i386/microvm=2Eh b/include/hw/i386/microvm=2Eh
>index fad97a891d=2E=2Ee8af61f194 100644
>--- a/include/hw/i386/microvm=2Eh
>+++ b/include/hw/i386/microvm=2Eh
>@@ -50,8 +50,9 @@
>  */
>=20
> /* Platform virtio definitions */
>-#define VIRTIO_MMIO_BASE      0xfeb00000
>-#define VIRTIO_CMDLINE_MAXLEN 64
>+#define VIRTIO_MMIO_BASE                0xfeb00000
>+#define VIRTIO_CMDLINE_MAXLEN           64
>+#define VIRTIO_CMDLINE_TOTAL_MAX_LEN    ((VIRTIO_CMDLINE_MAXLEN + 1) * 1=
6)
>=20
> #define GED_MMIO_BASE         0xfea00000
> #define GED_MMIO_BASE_MEMHP   (GED_MMIO_BASE + 0x100)
>diff --git a/include/hw/nvram/fw_cfg=2Eh b/include/hw/nvram/fw_cfg=2Eh
>index 2e503904dc=2E=2E990dcdbb2e 100644
>--- a/include/hw/nvram/fw_cfg=2Eh
>+++ b/include/hw/nvram/fw_cfg=2Eh
>@@ -139,6 +139,15 @@ void fw_cfg_add_bytes_callback(FWCfgState *s, uint16=
_t key,
>                                void *data, size_t len,
>                                bool read_only);
>=20
>+/**
>+ * fw_cfg_read_bytes_ptr:
>+ * @s: fw_cfg device being modified
>+ * @key: selector key value for new fw_cfg item
>+ *
>+ * Reads an existing fw_cfg data pointer=2E
>+ */
>+void *fw_cfg_read_bytes_ptr(FWCfgState *s, uint16_t key);
>+
> /**
>  * fw_cfg_add_string:
>  * @s: fw_cfg device being modified
>diff --git a/hw/i386/microvm=2Ec b/hw/i386/microvm=2Ec
>index 170a331e3f=2E=2E29f30dd6d3 100644
>--- a/hw/i386/microvm=2Ec
>+++ b/hw/i386/microvm=2Ec
>@@ -378,7 +378,8 @@ static void microvm_fix_kernel_cmdline(MachineState *=
machine)
>     MicrovmMachineState *mms =3D MICROVM_MACHINE(machine);
>     BusState *bus;
>     BusChild *kid;
>-    char *cmdline;
>+    char *cmdline, *existing_cmdline;
>+    size_t len;
>=20
>     /*
>      * Find MMIO transports with attached devices, and add them to the k=
ernel
>@@ -387,7 +388,8 @@ static void microvm_fix_kernel_cmdline(MachineState *=
machine)
>      * Yes, this is a hack, but one that heavily improves the UX without
>      * introducing any significant issues=2E
>      */
>-    cmdline =3D g_strdup(machine->kernel_cmdline);
>+    existing_cmdline =3D fw_cfg_read_bytes_ptr(x86ms->fw_cfg, FW_CFG_CMD=
LINE_DATA);
>+    cmdline =3D g_strdup(existing_cmdline);
>     bus =3D sysbus_get_default();
>     QTAILQ_FOREACH(kid, &bus->children, sibling) {
>         DeviceState *dev =3D kid->child;
>@@ -411,9 +413,12 @@ static void microvm_fix_kernel_cmdline(MachineState =
*machine)
>         }
>     }
>=20
>-    fw_cfg_modify_i32(x86ms->fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(cmdline=
) + 1);
>-    fw_cfg_modify_string(x86ms->fw_cfg, FW_CFG_CMDLINE_DATA, cmdline);
>-
>+    len =3D strlen(cmdline);
>+    if (len > VIRTIO_CMDLINE_TOTAL_MAX_LEN + strlen(existing_cmdline)) {
>+        fprintf(stderr, "qemu: virtio mmio cmdline too large, skipping\n=
");
>+    } else {
>+        memcpy(existing_cmdline, cmdline, len + 1);
>+    }
>     g_free(cmdline);
> }
>=20
>diff --git a/hw/i386/x86=2Ec b/hw/i386/x86=2Ec
>index 78cc131926=2E=2Eeaff4227bd 100644
>--- a/hw/i386/x86=2Ec
>+++ b/hw/i386/x86=2Ec
>@@ -50,6 +50,7 @@
> #include "hw/intc/i8259=2Eh"
> #include "hw/rtc/mc146818rtc=2Eh"
> #include "target/i386/sev=2Eh"
>+#include "hw/i386/microvm=2Eh"
>=20
> #include "hw/acpi/cpu_hotplug=2Eh"
> #include "hw/irq=2Eh"
>@@ -813,12 +814,18 @@ void x86_load_linux(X86MachineState *x86ms,
>     const char *kernel_filename =3D machine->kernel_filename;
>     const char *initrd_filename =3D machine->initrd_filename;
>     const char *dtb_filename =3D machine->dtb;
>-    const char *kernel_cmdline =3D machine->kernel_cmdline;
>+    char *kernel_cmdline;
>     SevKernelLoaderContext sev_load_ctx =3D {};
>     enum { RNG_SEED_LENGTH =3D 32 };
>=20
>-    /* Align to 16 bytes as a paranoia measure */
>-    cmdline_size =3D (strlen(kernel_cmdline) + 16) & ~15;
>+    /*
>+     * Add the NUL terminator, some padding for the microvm cmdline fidd=
ling
>+     * hack, and then align to 16 bytes as a paranoia measure
>+     */
>+    cmdline_size =3D (strlen(machine->kernel_cmdline) + 1 +
>+                    VIRTIO_CMDLINE_TOTAL_MAX_LEN + 16) & ~15;
>+    /* Make a copy, since we might append arbitrary bytes to it later=2E=
 */
>+    kernel_cmdline =3D g_strndup(machine->kernel_cmdline, cmdline_size);
>=20
>     /* load the kernel header */
>     f =3D fopen(kernel_filename, "rb");
>@@ -959,12 +966,6 @@ void x86_load_linux(X86MachineState *x86ms,
>         initrd_max =3D x86ms->below_4g_mem_size - acpi_data_size - 1;
>     }
>=20
>-    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
>-    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline) +=
 1);
>-    fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
>-    sev_load_ctx=2Ecmdline_data =3D (char *)kernel_cmdline;
>-    sev_load_ctx=2Ecmdline_size =3D strlen(kernel_cmdline) + 1;
>-
>     if (protocol >=3D 0x202) {
>         stl_p(header + 0x228, cmdline_addr);
>     } else {
>@@ -1091,27 +1092,24 @@ void x86_load_linux(X86MachineState *x86ms,
>             exit(1);
>         }
>=20
>-        setup_data_offset =3D QEMU_ALIGN_UP(kernel_size, 16);
>-        kernel_size =3D setup_data_offset + sizeof(SetupData) + dtb_size=
;
>-        kernel =3D g_realloc(kernel, kernel_size);
>-
>-
>-        setup_data =3D (SetupData *)(kernel + setup_data_offset);
>+        setup_data_offset =3D cmdline_size;
>+        cmdline_size +=3D sizeof(SetupData) + dtb_size;
>+        kernel_cmdline =3D g_realloc(kernel_cmdline, cmdline_size);
>+        setup_data =3D (void *)kernel_cmdline + setup_data_offset;
>         setup_data->next =3D cpu_to_le64(first_setup_data);
>-        first_setup_data =3D prot_addr + setup_data_offset;
>+        first_setup_data =3D cmdline_addr + setup_data_offset;
>         setup_data->type =3D cpu_to_le32(SETUP_DTB);
>         setup_data->len =3D cpu_to_le32(dtb_size);
>-
>         load_image_size(dtb_filename, setup_data->data, dtb_size);
>     }
>=20
>-    if (!legacy_no_rng_seed) {
>-        setup_data_offset =3D QEMU_ALIGN_UP(kernel_size, 16);
>-        kernel_size =3D setup_data_offset + sizeof(SetupData) + RNG_SEED=
_LENGTH;
>-        kernel =3D g_realloc(kernel, kernel_size);
>-        setup_data =3D (SetupData *)(kernel + setup_data_offset);
>+    if (!legacy_no_rng_seed && protocol >=3D 0x209) {
>+        setup_data_offset =3D cmdline_size;
>+        cmdline_size +=3D sizeof(SetupData) + RNG_SEED_LENGTH;
>+        kernel_cmdline =3D g_realloc(kernel_cmdline, cmdline_size);
>+        setup_data =3D (void *)kernel_cmdline + setup_data_offset;
>         setup_data->next =3D cpu_to_le64(first_setup_data);
>-        first_setup_data =3D prot_addr + setup_data_offset;
>+        first_setup_data =3D cmdline_addr + setup_data_offset;
>         setup_data->type =3D cpu_to_le32(SETUP_RNG_SEED);
>         setup_data->len =3D cpu_to_le32(RNG_SEED_LENGTH);
>         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
>@@ -1122,6 +1120,12 @@ void x86_load_linux(X86MachineState *x86ms,
>         fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size=
);
>     }
>=20
>+    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
>+    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, cmdline_size);
>+    fw_cfg_add_bytes(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline, cmdlin=
e_size);
>+    sev_load_ctx=2Ecmdline_data =3D (char *)kernel_cmdline;
>+    sev_load_ctx=2Ecmdline_size =3D cmdline_size;
>+
>     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
>     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
>     sev_load_ctx=2Ekernel_data =3D (char *)kernel;
>@@ -1134,7 +1138,7 @@ void x86_load_linux(X86MachineState *x86ms,
>      * kernel on the other side of the fw_cfg interface matches the hash=
 of the
>      * file the user passed in=2E
>      */
>-    if (!sev_enabled()) {
>+    if (!sev_enabled() && first_setup_data) {
>         SetupDataFixup *fixup =3D g_malloc(sizeof(*fixup));
>=20
>         memcpy(setup, header, MIN(sizeof(header), setup_size));
>diff --git a/hw/nvram/fw_cfg=2Ec b/hw/nvram/fw_cfg=2Ec
>index a00881bc64=2E=2E432754eda4 100644
>--- a/hw/nvram/fw_cfg=2Ec
>+++ b/hw/nvram/fw_cfg=2Ec
>@@ -741,6 +741,15 @@ void fw_cfg_add_bytes(FWCfgState *s, uint16_t key, v=
oid *data, size_t len)
>     fw_cfg_add_bytes_callback(s, key, NULL, NULL, NULL, data, len, true)=
;
> }
>=20
>+void *fw_cfg_read_bytes_ptr(FWCfgState *s, uint16_t key)
>+{
>+    int arch =3D !!(key & FW_CFG_ARCH_LOCAL);
>+
>+    key &=3D FW_CFG_ENTRY_MASK;
>+    assert(key < fw_cfg_max_entry(s));
>+    return s->entries[arch][key]=2Edata;
>+}
>+
> void fw_cfg_add_string(FWCfgState *s, uint16_t key, const char *value)
> {
>     size_t sz =3D strlen(value) + 1;

Saying they are "appended to" is wrong; the loader is free to put them any=
where in usable RAM that is not covered by the kernel image, the kernel kee=
pout area, the command line or initrd=2E

