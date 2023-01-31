Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B396838A1
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 22:28:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMyAu-00034w-Us; Tue, 31 Jan 2023 16:28:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=PxBQ=54=zx2c4.com=Jason@kernel.org>)
 id 1pMyAt-00034n-Gz
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 16:28:19 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=PxBQ=54=zx2c4.com=Jason@kernel.org>)
 id 1pMyAq-0000re-4m
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 16:28:19 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFB546172A
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 21:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBAAC433A1
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 21:28:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Lcpo4Ngz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675200487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ng4NxY4W5f0zOdgNczA+8toxWkwJMcG2RZbLZVX4MJ8=;
 b=Lcpo4NgzvDq3PCxy+Rvx0G/hR8XcAJuaUeAYoBwPYYiXvddQSKir+zSEtyS3XrzGZ/9vuz
 s87r4oUNeYqy1TdZptrc176HX9kcq8mfQ+oaAUy3WsgaMQ6M9NUXiE+WKzU0SGL6KZqkE/
 7lazyFhsEILKax+U3vX0w/nRDWSXbks=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f9235840
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 31 Jan 2023 21:28:07 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-4c131bede4bso220920467b3.5
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 13:28:07 -0800 (PST)
X-Gm-Message-State: AO0yUKXsfPP0xcV12xo+bg75x0fnUSWG2Qb3TthZ0uNGKs0Lb8Glnvgc
 kJzCeWowKTdPkxo0tjSVSWSrtjXeY8N+qbZgvSY=
X-Google-Smtp-Source: AK7set9FHLnGXdhY5BbgoRxSKYtOReiAfl++as6ONDGly/hn4itp9cawoxyxiSebtYF+7A0dYDkZ5HjdJ9HKoqGo+/M=
X-Received: by 2002:a81:af1c:0:b0:368:e6b8:77f1 with SMTP id
 n28-20020a81af1c000000b00368e6b877f1mr23581ywh.414.1675200485732; Tue, 31 Jan
 2023 13:28:05 -0800 (PST)
MIME-Version: 1.0
References: <20230130201810.11518-1-mst@redhat.com>
 <20230130201810.11518-11-mst@redhat.com>
 <7B8997DB-60EE-4DE9-A594-4031F8315C23@zytor.com>
In-Reply-To: <7B8997DB-60EE-4DE9-A594-4031F8315C23@zytor.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 31 Jan 2023 16:22:43 -0500
X-Gmail-Original-Message-ID: <CAHmME9oRX=Yfuv+R7Yrtmg40gq3iwC_+hQx3j-mEM7wc1xXjoA@mail.gmail.com>
Message-ID: <CAHmME9oRX=Yfuv+R7Yrtmg40gq3iwC_+hQx3j-mEM7wc1xXjoA@mail.gmail.com>
Subject: Re: [PULL 10/56] x86: don't let decompressed kernel image clobber
 setup_data
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>, X86 ML <x86@kernel.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Borislav Petkov <bp@alien8.de>, Eric Biggers <ebiggers@kernel.org>,
 Eric Biggers <ebiggers@google.com>, 
 Mathias Krause <minipli@grsecurity.net>, Sergio Lopez <slp@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e1456805f3960159"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=PxBQ=54=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

--000000000000e1456805f3960159
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2023, 15:55 H. Peter Anvin <hpa@zytor.com> wrote:

> On January 30, 2023 12:19:14 PM PST, "Michael S. Tsirkin" <mst@redhat.com=
>
> wrote:
> >From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> >
> >The setup_data links are appended to the compressed kernel image. Since
> >the kernel image is typically loaded at 0x100000, setup_data lives at
> >`0x100000 + compressed_size`, which does not get relocated during the
> >kernel's boot process.
> >
> >The kernel typically decompresses the image starting at address
> >0x1000000 (note: there's one more zero there than the compressed image
> >above). This usually is fine for most kernels.
> >
> >However, if the compressed image is actually quite large, then
> >setup_data will live at a `0x100000 + compressed_size` that extends into
> >the decompressed zone at 0x1000000. In other words, if compressed_size
> >is larger than `0x1000000 - 0x100000`, then the decompression step will
> >clobber setup_data, resulting in crashes.
> >
> >Visually, what happens now is that QEMU appends setup_data to the kernel
> >image:
> >
> >          kernel image            setup_data
> >   |--------------------------||----------------|
> >0x100000                  0x100000+l1     0x100000+l1+l2
> >
> >The problem is that this decompresses to 0x1000000 (one more zero). So
> >if l1 is > (0x1000000-0x100000), then this winds up looking like:
> >
> >          kernel image            setup_data
> >   |--------------------------||----------------|
> >0x100000                  0x100000+l1     0x100000+l1+l2
> >
> >                                 d e c o m p r e s s e d   k e r n e l
> >
>  |-------------------------------------------------------------|
> >                0x1000000
>      0x1000000+l3
> >
> >The decompressed kernel seemingly overwriting the compressed kernel
> >image isn't a problem, because that gets relocated to a higher address
> >early on in the boot process, at the end of startup_64. setup_data,
> >however, stays in the same place, since those links are self referential
> >and nothing fixes them up.  So the decompressed kernel clobbers it.
> >
> >Fix this by appending setup_data to the cmdline blob rather than the
> >kernel image blob, which remains at a lower address that won't get
> >clobbered.
> >
> >This could have been done by overwriting the initrd blob instead, but
> >that poses big difficulties, such as no longer being able to use memory
> >mapped files for initrd, hurting performance, and, more importantly, the
> >initrd address calculation is hard coded in qboot, and it always grows
> >down rather than up, which means lots of brittle semantics would have to
> >be changed around, incurring more complexity. In contrast, using cmdline
> >is simple and doesn't interfere with anything.
> >
> >The microvm machine has a gross hack where it fiddles with fw_cfg data
> >after the fact. So this hack is updated to account for this appending,
> >by reserving some bytes.
> >
> >Fixup-by: Michael S. Tsirkin <mst@redhat.com>
> >Cc: x86@kernel.org
> >Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >Cc: H. Peter Anvin <hpa@zytor.com>
> >Cc: Borislav Petkov <bp@alien8.de>
> >Cc: Eric Biggers <ebiggers@kernel.org>
> >Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> >Message-Id: <20221230220725.618763-1-Jason@zx2c4.com>
> >Message-ID: <20230128061015-mutt-send-email-mst@kernel.org>
> >Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >Tested-by: Eric Biggers <ebiggers@google.com>
> >Tested-by: Mathias Krause <minipli@grsecurity.net>
> >---
> > include/hw/i386/microvm.h |  5 ++--
> > include/hw/nvram/fw_cfg.h |  9 +++++++
> > hw/i386/microvm.c         | 15 +++++++----
> > hw/i386/x86.c             | 52 +++++++++++++++++++++------------------
> > hw/nvram/fw_cfg.c         |  9 +++++++
> > 5 files changed, 59 insertions(+), 31 deletions(-)
> >
> >diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
> >index fad97a891d..e8af61f194 100644
> >--- a/include/hw/i386/microvm.h
> >+++ b/include/hw/i386/microvm.h
> >@@ -50,8 +50,9 @@
> >  */
> >
> > /* Platform virtio definitions */
> >-#define VIRTIO_MMIO_BASE      0xfeb00000
> >-#define VIRTIO_CMDLINE_MAXLEN 64
> >+#define VIRTIO_MMIO_BASE                0xfeb00000
> >+#define VIRTIO_CMDLINE_MAXLEN           64
> >+#define VIRTIO_CMDLINE_TOTAL_MAX_LEN    ((VIRTIO_CMDLINE_MAXLEN + 1) *
> 16)
> >
> > #define GED_MMIO_BASE         0xfea00000
> > #define GED_MMIO_BASE_MEMHP   (GED_MMIO_BASE + 0x100)
> >diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> >index 2e503904dc..990dcdbb2e 100644
> >--- a/include/hw/nvram/fw_cfg.h
> >+++ b/include/hw/nvram/fw_cfg.h
> >@@ -139,6 +139,15 @@ void fw_cfg_add_bytes_callback(FWCfgState *s,
> uint16_t key,
> >                                void *data, size_t len,
> >                                bool read_only);
> >
> >+/**
> >+ * fw_cfg_read_bytes_ptr:
> >+ * @s: fw_cfg device being modified
> >+ * @key: selector key value for new fw_cfg item
> >+ *
> >+ * Reads an existing fw_cfg data pointer.
> >+ */
> >+void *fw_cfg_read_bytes_ptr(FWCfgState *s, uint16_t key);
> >+
> > /**
> >  * fw_cfg_add_string:
> >  * @s: fw_cfg device being modified
> >diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> >index 170a331e3f..29f30dd6d3 100644
> >--- a/hw/i386/microvm.c
> >+++ b/hw/i386/microvm.c
> >@@ -378,7 +378,8 @@ static void microvm_fix_kernel_cmdline(MachineState
> *machine)
> >     MicrovmMachineState *mms =3D MICROVM_MACHINE(machine);
> >     BusState *bus;
> >     BusChild *kid;
> >-    char *cmdline;
> >+    char *cmdline, *existing_cmdline;
> >+    size_t len;
> >
> >     /*
> >      * Find MMIO transports with attached devices, and add them to the
> kernel
> >@@ -387,7 +388,8 @@ static void microvm_fix_kernel_cmdline(MachineState
> *machine)
> >      * Yes, this is a hack, but one that heavily improves the UX withou=
t
> >      * introducing any significant issues.
> >      */
> >-    cmdline =3D g_strdup(machine->kernel_cmdline);
> >+    existing_cmdline =3D fw_cfg_read_bytes_ptr(x86ms->fw_cfg,
> FW_CFG_CMDLINE_DATA);
> >+    cmdline =3D g_strdup(existing_cmdline);
> >     bus =3D sysbus_get_default();
> >     QTAILQ_FOREACH(kid, &bus->children, sibling) {
> >         DeviceState *dev =3D kid->child;
> >@@ -411,9 +413,12 @@ static void microvm_fix_kernel_cmdline(MachineState
> *machine)
> >         }
> >     }
> >
> >-    fw_cfg_modify_i32(x86ms->fw_cfg, FW_CFG_CMDLINE_SIZE,
> strlen(cmdline) + 1);
> >-    fw_cfg_modify_string(x86ms->fw_cfg, FW_CFG_CMDLINE_DATA, cmdline);
> >-
> >+    len =3D strlen(cmdline);
> >+    if (len > VIRTIO_CMDLINE_TOTAL_MAX_LEN + strlen(existing_cmdline)) =
{
> >+        fprintf(stderr, "qemu: virtio mmio cmdline too large,
> skipping\n");
> >+    } else {
> >+        memcpy(existing_cmdline, cmdline, len + 1);
> >+    }
> >     g_free(cmdline);
> > }
> >
> >diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> >index 78cc131926..eaff4227bd 100644
> >--- a/hw/i386/x86.c
> >+++ b/hw/i386/x86.c
> >@@ -50,6 +50,7 @@
> > #include "hw/intc/i8259.h"
> > #include "hw/rtc/mc146818rtc.h"
> > #include "target/i386/sev.h"
> >+#include "hw/i386/microvm.h"
> >
> > #include "hw/acpi/cpu_hotplug.h"
> > #include "hw/irq.h"
> >@@ -813,12 +814,18 @@ void x86_load_linux(X86MachineState *x86ms,
> >     const char *kernel_filename =3D machine->kernel_filename;
> >     const char *initrd_filename =3D machine->initrd_filename;
> >     const char *dtb_filename =3D machine->dtb;
> >-    const char *kernel_cmdline =3D machine->kernel_cmdline;
> >+    char *kernel_cmdline;
> >     SevKernelLoaderContext sev_load_ctx =3D {};
> >     enum { RNG_SEED_LENGTH =3D 32 };
> >
> >-    /* Align to 16 bytes as a paranoia measure */
> >-    cmdline_size =3D (strlen(kernel_cmdline) + 16) & ~15;
> >+    /*
> >+     * Add the NUL terminator, some padding for the microvm cmdline
> fiddling
> >+     * hack, and then align to 16 bytes as a paranoia measure
> >+     */
> >+    cmdline_size =3D (strlen(machine->kernel_cmdline) + 1 +
> >+                    VIRTIO_CMDLINE_TOTAL_MAX_LEN + 16) & ~15;
> >+    /* Make a copy, since we might append arbitrary bytes to it later. =
*/
> >+    kernel_cmdline =3D g_strndup(machine->kernel_cmdline, cmdline_size)=
;
> >
> >     /* load the kernel header */
> >     f =3D fopen(kernel_filename, "rb");
> >@@ -959,12 +966,6 @@ void x86_load_linux(X86MachineState *x86ms,
> >         initrd_max =3D x86ms->below_4g_mem_size - acpi_data_size - 1;
> >     }
> >
> >-    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
> >-    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline) =
+
> 1);
> >-    fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
> >-    sev_load_ctx.cmdline_data =3D (char *)kernel_cmdline;
> >-    sev_load_ctx.cmdline_size =3D strlen(kernel_cmdline) + 1;
> >-
> >     if (protocol >=3D 0x202) {
> >         stl_p(header + 0x228, cmdline_addr);
> >     } else {
> >@@ -1091,27 +1092,24 @@ void x86_load_linux(X86MachineState *x86ms,
> >             exit(1);
> >         }
> >
> >-        setup_data_offset =3D QEMU_ALIGN_UP(kernel_size, 16);
> >-        kernel_size =3D setup_data_offset + sizeof(SetupData) + dtb_siz=
e;
> >-        kernel =3D g_realloc(kernel, kernel_size);
> >-
> >-
> >-        setup_data =3D (SetupData *)(kernel + setup_data_offset);
> >+        setup_data_offset =3D cmdline_size;
> >+        cmdline_size +=3D sizeof(SetupData) + dtb_size;
> >+        kernel_cmdline =3D g_realloc(kernel_cmdline, cmdline_size);
> >+        setup_data =3D (void *)kernel_cmdline + setup_data_offset;
> >         setup_data->next =3D cpu_to_le64(first_setup_data);
> >-        first_setup_data =3D prot_addr + setup_data_offset;
> >+        first_setup_data =3D cmdline_addr + setup_data_offset;
> >         setup_data->type =3D cpu_to_le32(SETUP_DTB);
> >         setup_data->len =3D cpu_to_le32(dtb_size);
> >-
> >         load_image_size(dtb_filename, setup_data->data, dtb_size);
> >     }
> >
> >-    if (!legacy_no_rng_seed) {
> >-        setup_data_offset =3D QEMU_ALIGN_UP(kernel_size, 16);
> >-        kernel_size =3D setup_data_offset + sizeof(SetupData) +
> RNG_SEED_LENGTH;
> >-        kernel =3D g_realloc(kernel, kernel_size);
> >-        setup_data =3D (SetupData *)(kernel + setup_data_offset);
> >+    if (!legacy_no_rng_seed && protocol >=3D 0x209) {
> >+        setup_data_offset =3D cmdline_size;
> >+        cmdline_size +=3D sizeof(SetupData) + RNG_SEED_LENGTH;
> >+        kernel_cmdline =3D g_realloc(kernel_cmdline, cmdline_size);
> >+        setup_data =3D (void *)kernel_cmdline + setup_data_offset;
> >         setup_data->next =3D cpu_to_le64(first_setup_data);
> >-        first_setup_data =3D prot_addr + setup_data_offset;
> >+        first_setup_data =3D cmdline_addr + setup_data_offset;
> >         setup_data->type =3D cpu_to_le32(SETUP_RNG_SEED);
> >         setup_data->len =3D cpu_to_le32(RNG_SEED_LENGTH);
> >         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
> >@@ -1122,6 +1120,12 @@ void x86_load_linux(X86MachineState *x86ms,
> >         fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel,
> kernel_size);
> >     }
> >
> >+    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
> >+    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, cmdline_size);
> >+    fw_cfg_add_bytes(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline,
> cmdline_size);
> >+    sev_load_ctx.cmdline_data =3D (char *)kernel_cmdline;
> >+    sev_load_ctx.cmdline_size =3D cmdline_size;
> >+
> >     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
> >     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
> >     sev_load_ctx.kernel_data =3D (char *)kernel;
> >@@ -1134,7 +1138,7 @@ void x86_load_linux(X86MachineState *x86ms,
> >      * kernel on the other side of the fw_cfg interface matches the has=
h
> of the
> >      * file the user passed in.
> >      */
> >-    if (!sev_enabled()) {
> >+    if (!sev_enabled() && first_setup_data) {
> >         SetupDataFixup *fixup =3D g_malloc(sizeof(*fixup));
> >
> >         memcpy(setup, header, MIN(sizeof(header), setup_size));
> >diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> >index a00881bc64..432754eda4 100644
> >--- a/hw/nvram/fw_cfg.c
> >+++ b/hw/nvram/fw_cfg.c
> >@@ -741,6 +741,15 @@ void fw_cfg_add_bytes(FWCfgState *s, uint16_t key,
> void *data, size_t len)
> >     fw_cfg_add_bytes_callback(s, key, NULL, NULL, NULL, data, len, true=
);
> > }
> >
> >+void *fw_cfg_read_bytes_ptr(FWCfgState *s, uint16_t key)
> >+{
> >+    int arch =3D !!(key & FW_CFG_ARCH_LOCAL);
> >+
> >+    key &=3D FW_CFG_ENTRY_MASK;
> >+    assert(key < fw_cfg_max_entry(s));
> >+    return s->entries[arch][key].data;
> >+}
> >+
> > void fw_cfg_add_string(FWCfgState *s, uint16_t key, const char *value)
> > {
> >     size_t sz =3D strlen(value) + 1;
>
> Saying they are "appended to" is wrong; the loader is free to put them
> anywhere in usable RAM that is not covered by the kernel image, the kerne=
l
> keepout area, the command line or initrd.
>

No. That sentence describes what QEMU does currently, without this patch,
and it is accurate. This is not a kernel commit. It's a QEMU one.

(Also, this patch sat on the list for over a month, during which time you
could have chimed in. The ship for nitpicking has sailed now.)

Sorry for the HTML crud; I'll be mobile for another 10 days, without a real
computer.

Jason

>

--000000000000e1456805f3960159
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jan 31, 2023, 15:55 H. Peter Anvin &lt;<a href=
=3D"mailto:hpa@zytor.com">hpa@zytor.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">On January 30, 2023 12:19:14 PM PST, &quot;Michael S. T=
sirkin&quot; &lt;<a href=3D"mailto:mst@redhat.com" target=3D"_blank" rel=3D=
"noreferrer">mst@redhat.com</a>&gt; wrote:<br>
&gt;From: &quot;Jason A. Donenfeld&quot; &lt;<a href=3D"mailto:Jason@zx2c4.=
com" target=3D"_blank" rel=3D"noreferrer">Jason@zx2c4.com</a>&gt;<br>
&gt;<br>
&gt;The setup_data links are appended to the compressed kernel image. Since=
<br>
&gt;the kernel image is typically loaded at 0x100000, setup_data lives at<b=
r>
&gt;`0x100000 + compressed_size`, which does not get relocated during the<b=
r>
&gt;kernel&#39;s boot process.<br>
&gt;<br>
&gt;The kernel typically decompresses the image starting at address<br>
&gt;0x1000000 (note: there&#39;s one more zero there than the compressed im=
age<br>
&gt;above). This usually is fine for most kernels.<br>
&gt;<br>
&gt;However, if the compressed image is actually quite large, then<br>
&gt;setup_data will live at a `0x100000 + compressed_size` that extends int=
o<br>
&gt;the decompressed zone at 0x1000000. In other words, if compressed_size<=
br>
&gt;is larger than `0x1000000 - 0x100000`, then the decompression step will=
<br>
&gt;clobber setup_data, resulting in crashes.<br>
&gt;<br>
&gt;Visually, what happens now is that QEMU appends setup_data to the kerne=
l<br>
&gt;image:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel image=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 setup_data<br>
&gt;=C2=A0 =C2=A0|--------------------------||----------------|<br>
&gt;0x100000=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x100000+l1=C2=A0 =C2=A0 =C2=A00x100000+l1+l2<br>
&gt;<br>
&gt;The problem is that this decompresses to 0x1000000 (one more zero). So<=
br>
&gt;if l1 is &gt; (0x1000000-0x100000), then this winds up looking like:<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel image=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 setup_data<br>
&gt;=C2=A0 =C2=A0|--------------------------||----------------|<br>
&gt;0x100000=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x100000+l1=C2=A0 =C2=A0 =C2=A00x100000+l1+l2<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d e c o m p r e s s e d=C2=
=A0 =C2=A0k e r n e l<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|-------------------------------------------------------------|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1000000=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1000000+l3<br>
&gt;<br>
&gt;The decompressed kernel seemingly overwriting the compressed kernel<br>
&gt;image isn&#39;t a problem, because that gets relocated to a higher addr=
ess<br>
&gt;early on in the boot process, at the end of startup_64. setup_data,<br>
&gt;however, stays in the same place, since those links are self referentia=
l<br>
&gt;and nothing fixes them up.=C2=A0 So the decompressed kernel clobbers it=
.<br>
&gt;<br>
&gt;Fix this by appending setup_data to the cmdline blob rather than the<br=
>
&gt;kernel image blob, which remains at a lower address that won&#39;t get<=
br>
&gt;clobbered.<br>
&gt;<br>
&gt;This could have been done by overwriting the initrd blob instead, but<b=
r>
&gt;that poses big difficulties, such as no longer being able to use memory=
<br>
&gt;mapped files for initrd, hurting performance, and, more importantly, th=
e<br>
&gt;initrd address calculation is hard coded in qboot, and it always grows<=
br>
&gt;down rather than up, which means lots of brittle semantics would have t=
o<br>
&gt;be changed around, incurring more complexity. In contrast, using cmdlin=
e<br>
&gt;is simple and doesn&#39;t interfere with anything.<br>
&gt;<br>
&gt;The microvm machine has a gross hack where it fiddles with fw_cfg data<=
br>
&gt;after the fact. So this hack is updated to account for this appending,<=
br>
&gt;by reserving some bytes.<br>
&gt;<br>
&gt;Fixup-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" targ=
et=3D"_blank" rel=3D"noreferrer">mst@redhat.com</a>&gt;<br>
&gt;Cc: <a href=3D"mailto:x86@kernel.org" target=3D"_blank" rel=3D"noreferr=
er">x86@kernel.org</a><br>
&gt;Cc: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org=
" target=3D"_blank" rel=3D"noreferrer">philmd@linaro.org</a>&gt;<br>
&gt;Cc: H. Peter Anvin &lt;<a href=3D"mailto:hpa@zytor.com" target=3D"_blan=
k" rel=3D"noreferrer">hpa@zytor.com</a>&gt;<br>
&gt;Cc: Borislav Petkov &lt;<a href=3D"mailto:bp@alien8.de" target=3D"_blan=
k" rel=3D"noreferrer">bp@alien8.de</a>&gt;<br>
&gt;Cc: Eric Biggers &lt;<a href=3D"mailto:ebiggers@kernel.org" target=3D"_=
blank" rel=3D"noreferrer">ebiggers@kernel.org</a>&gt;<br>
&gt;Signed-off-by: Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com=
" target=3D"_blank" rel=3D"noreferrer">Jason@zx2c4.com</a>&gt;<br>
&gt;Message-Id: &lt;<a href=3D"mailto:20221230220725.618763-1-Jason@zx2c4.c=
om" target=3D"_blank" rel=3D"noreferrer">20221230220725.618763-1-Jason@zx2c=
4.com</a>&gt;<br>
&gt;Message-ID: &lt;<a href=3D"mailto:20230128061015-mutt-send-email-mst@ke=
rnel.org" target=3D"_blank" rel=3D"noreferrer">20230128061015-mutt-send-ema=
il-mst@kernel.org</a>&gt;<br>
&gt;Reviewed-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" t=
arget=3D"_blank" rel=3D"noreferrer">mst@redhat.com</a>&gt;<br>
&gt;Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com"=
 target=3D"_blank" rel=3D"noreferrer">mst@redhat.com</a>&gt;<br>
&gt;Tested-by: Eric Biggers &lt;<a href=3D"mailto:ebiggers@google.com" targ=
et=3D"_blank" rel=3D"noreferrer">ebiggers@google.com</a>&gt;<br>
&gt;Tested-by: Mathias Krause &lt;<a href=3D"mailto:minipli@grsecurity.net"=
 target=3D"_blank" rel=3D"noreferrer">minipli@grsecurity.net</a>&gt;<br>
&gt;---<br>
&gt; include/hw/i386/microvm.h |=C2=A0 5 ++--<br>
&gt; include/hw/nvram/fw_cfg.h |=C2=A0 9 +++++++<br>
&gt; hw/i386/microvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +++++++----<br=
>
&gt; hw/i386/x86.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 52 ++++=
+++++++++++++++++------------------<br>
&gt; hw/nvram/fw_cfg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 +++++++<b=
r>
&gt; 5 files changed, 59 insertions(+), 31 deletions(-)<br>
&gt;<br>
&gt;diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h<br>
&gt;index fad97a891d..e8af61f194 100644<br>
&gt;--- a/include/hw/i386/microvm.h<br>
&gt;+++ b/include/hw/i386/microvm.h<br>
&gt;@@ -50,8 +50,9 @@<br>
&gt;=C2=A0 */<br>
&gt; <br>
&gt; /* Platform virtio definitions */<br>
&gt;-#define VIRTIO_MMIO_BASE=C2=A0 =C2=A0 =C2=A0 0xfeb00000<br>
&gt;-#define VIRTIO_CMDLINE_MAXLEN 64<br>
&gt;+#define VIRTIO_MMIO_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0xfeb00000<br>
&gt;+#define VIRTIO_CMDLINE_MAXLEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
64<br>
&gt;+#define VIRTIO_CMDLINE_TOTAL_MAX_LEN=C2=A0 =C2=A0 ((VIRTIO_CMDLINE_MAX=
LEN + 1) * 16)<br>
&gt; <br>
&gt; #define GED_MMIO_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xfea00000<br>
&gt; #define GED_MMIO_BASE_MEMHP=C2=A0 =C2=A0(GED_MMIO_BASE + 0x100)<br>
&gt;diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h<br>
&gt;index 2e503904dc..990dcdbb2e 100644<br>
&gt;--- a/include/hw/nvram/fw_cfg.h<br>
&gt;+++ b/include/hw/nvram/fw_cfg.h<br>
&gt;@@ -139,6 +139,15 @@ void fw_cfg_add_bytes_callback(FWCfgState *s, uint=
16_t key,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *data, size_t len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool read_only);<br>
&gt; <br>
&gt;+/**<br>
&gt;+ * fw_cfg_read_bytes_ptr:<br>
&gt;+ * @s: fw_cfg device being modified<br>
&gt;+ * @key: selector key value for new fw_cfg item<br>
&gt;+ *<br>
&gt;+ * Reads an existing fw_cfg data pointer.<br>
&gt;+ */<br>
&gt;+void *fw_cfg_read_bytes_ptr(FWCfgState *s, uint16_t key);<br>
&gt;+<br>
&gt; /**<br>
&gt;=C2=A0 * fw_cfg_add_string:<br>
&gt;=C2=A0 * @s: fw_cfg device being modified<br>
&gt;diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c<br>
&gt;index 170a331e3f..29f30dd6d3 100644<br>
&gt;--- a/hw/i386/microvm.c<br>
&gt;+++ b/hw/i386/microvm.c<br>
&gt;@@ -378,7 +378,8 @@ static void microvm_fix_kernel_cmdline(MachineState=
 *machine)<br>
&gt;=C2=A0 =C2=A0 =C2=A0MicrovmMachineState *mms =3D MICROVM_MACHINE(machin=
e);<br>
&gt;=C2=A0 =C2=A0 =C2=A0BusState *bus;<br>
&gt;=C2=A0 =C2=A0 =C2=A0BusChild *kid;<br>
&gt;-=C2=A0 =C2=A0 char *cmdline;<br>
&gt;+=C2=A0 =C2=A0 char *cmdline, *existing_cmdline;<br>
&gt;+=C2=A0 =C2=A0 size_t len;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * Find MMIO transports with attached devices, and =
add them to the kernel<br>
&gt;@@ -387,7 +388,8 @@ static void microvm_fix_kernel_cmdline(MachineState=
 *machine)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * Yes, this is a hack, but one that heavily improv=
es the UX without<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * introducing any significant issues.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 */<br>
&gt;-=C2=A0 =C2=A0 cmdline =3D g_strdup(machine-&gt;kernel_cmdline);<br>
&gt;+=C2=A0 =C2=A0 existing_cmdline =3D fw_cfg_read_bytes_ptr(x86ms-&gt;fw_=
cfg, FW_CFG_CMDLINE_DATA);<br>
&gt;+=C2=A0 =C2=A0 cmdline =3D g_strdup(existing_cmdline);<br>
&gt;=C2=A0 =C2=A0 =C2=A0bus =3D sysbus_get_default();<br>
&gt;=C2=A0 =C2=A0 =C2=A0QTAILQ_FOREACH(kid, &amp;bus-&gt;children, sibling)=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DeviceState *dev =3D kid-&gt;child;<b=
r>
&gt;@@ -411,9 +413,12 @@ static void microvm_fix_kernel_cmdline(MachineStat=
e *machine)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;-=C2=A0 =C2=A0 fw_cfg_modify_i32(x86ms-&gt;fw_cfg, FW_CFG_CMDLINE_SIZE,=
 strlen(cmdline) + 1);<br>
&gt;-=C2=A0 =C2=A0 fw_cfg_modify_string(x86ms-&gt;fw_cfg, FW_CFG_CMDLINE_DA=
TA, cmdline);<br>
&gt;-<br>
&gt;+=C2=A0 =C2=A0 len =3D strlen(cmdline);<br>
&gt;+=C2=A0 =C2=A0 if (len &gt; VIRTIO_CMDLINE_TOTAL_MAX_LEN + strlen(exist=
ing_cmdline)) {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;qemu: virtio mmio cm=
dline too large, skipping\n&quot;);<br>
&gt;+=C2=A0 =C2=A0 } else {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(existing_cmdline, cmdline, len + 1)=
;<br>
&gt;+=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0g_free(cmdline);<br>
&gt; }<br>
&gt; <br>
&gt;diff --git a/hw/i386/x86.c b/hw/i386/x86.c<br>
&gt;index 78cc131926..eaff4227bd 100644<br>
&gt;--- a/hw/i386/x86.c<br>
&gt;+++ b/hw/i386/x86.c<br>
&gt;@@ -50,6 +50,7 @@<br>
&gt; #include &quot;hw/intc/i8259.h&quot;<br>
&gt; #include &quot;hw/rtc/mc146818rtc.h&quot;<br>
&gt; #include &quot;target/i386/sev.h&quot;<br>
&gt;+#include &quot;hw/i386/microvm.h&quot;<br>
&gt; <br>
&gt; #include &quot;hw/acpi/cpu_hotplug.h&quot;<br>
&gt; #include &quot;hw/irq.h&quot;<br>
&gt;@@ -813,12 +814,18 @@ void x86_load_linux(X86MachineState *x86ms,<br>
&gt;=C2=A0 =C2=A0 =C2=A0const char *kernel_filename =3D machine-&gt;kernel_=
filename;<br>
&gt;=C2=A0 =C2=A0 =C2=A0const char *initrd_filename =3D machine-&gt;initrd_=
filename;<br>
&gt;=C2=A0 =C2=A0 =C2=A0const char *dtb_filename =3D machine-&gt;dtb;<br>
&gt;-=C2=A0 =C2=A0 const char *kernel_cmdline =3D machine-&gt;kernel_cmdlin=
e;<br>
&gt;+=C2=A0 =C2=A0 char *kernel_cmdline;<br>
&gt;=C2=A0 =C2=A0 =C2=A0SevKernelLoaderContext sev_load_ctx =3D {};<br>
&gt;=C2=A0 =C2=A0 =C2=A0enum { RNG_SEED_LENGTH =3D 32 };<br>
&gt; <br>
&gt;-=C2=A0 =C2=A0 /* Align to 16 bytes as a paranoia measure */<br>
&gt;-=C2=A0 =C2=A0 cmdline_size =3D (strlen(kernel_cmdline) + 16) &amp; ~15=
;<br>
&gt;+=C2=A0 =C2=A0 /*<br>
&gt;+=C2=A0 =C2=A0 =C2=A0* Add the NUL terminator, some padding for the mic=
rovm cmdline fiddling<br>
&gt;+=C2=A0 =C2=A0 =C2=A0* hack, and then align to 16 bytes as a paranoia m=
easure<br>
&gt;+=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;+=C2=A0 =C2=A0 cmdline_size =3D (strlen(machine-&gt;kernel_cmdline) + 1=
 +<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
VIRTIO_CMDLINE_TOTAL_MAX_LEN + 16) &amp; ~15;<br>
&gt;+=C2=A0 =C2=A0 /* Make a copy, since we might append arbitrary bytes to=
 it later. */<br>
&gt;+=C2=A0 =C2=A0 kernel_cmdline =3D g_strndup(machine-&gt;kernel_cmdline,=
 cmdline_size);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0/* load the kernel header */<br>
&gt;=C2=A0 =C2=A0 =C2=A0f =3D fopen(kernel_filename, &quot;rb&quot;);<br>
&gt;@@ -959,12 +966,6 @@ void x86_load_linux(X86MachineState *x86ms,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initrd_max =3D x86ms-&gt;below_4g_mem=
_size - acpi_data_size - 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;-=C2=A0 =C2=A0 fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr=
);<br>
&gt;-=C2=A0 =C2=A0 fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kerne=
l_cmdline) + 1);<br>
&gt;-=C2=A0 =C2=A0 fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cm=
dline);<br>
&gt;-=C2=A0 =C2=A0 sev_load_ctx.cmdline_data =3D (char *)kernel_cmdline;<br=
>
&gt;-=C2=A0 =C2=A0 sev_load_ctx.cmdline_size =3D strlen(kernel_cmdline) + 1=
;<br>
&gt;-<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (protocol &gt;=3D 0x202) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stl_p(header + 0x228, cmdline_addr);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;@@ -1091,27 +1092,24 @@ void x86_load_linux(X86MachineState *x86ms,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 setup_data_offset =3D QEMU_ALIGN_UP(kernel=
_size, 16);<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_size =3D setup_data_offset + sizeof=
(SetupData) + dtb_size;<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel =3D g_realloc(kernel, kernel_size);=
<br>
&gt;-<br>
&gt;-<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 setup_data =3D (SetupData *)(kernel + setu=
p_data_offset);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 setup_data_offset =3D cmdline_size;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmdline_size +=3D sizeof(SetupData) + dtb_=
size;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_cmdline =3D g_realloc(kernel_cmdlin=
e, cmdline_size);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 setup_data =3D (void *)kernel_cmdline + se=
tup_data_offset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setup_data-&gt;next =3D cpu_to_le64(f=
irst_setup_data);<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 first_setup_data =3D prot_addr + setup_dat=
a_offset;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 first_setup_data =3D cmdline_addr + setup_=
data_offset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setup_data-&gt;type =3D cpu_to_le32(S=
ETUP_DTB);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setup_data-&gt;len =3D cpu_to_le32(dt=
b_size);<br>
&gt;-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0load_image_size(dtb_filename, setup_d=
ata-&gt;data, dtb_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;-=C2=A0 =C2=A0 if (!legacy_no_rng_seed) {<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 setup_data_offset =3D QEMU_ALIGN_UP(kernel=
_size, 16);<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_size =3D setup_data_offset + sizeof=
(SetupData) + RNG_SEED_LENGTH;<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel =3D g_realloc(kernel, kernel_size);=
<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 setup_data =3D (SetupData *)(kernel + setu=
p_data_offset);<br>
&gt;+=C2=A0 =C2=A0 if (!legacy_no_rng_seed &amp;&amp; protocol &gt;=3D 0x20=
9) {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 setup_data_offset =3D cmdline_size;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmdline_size +=3D sizeof(SetupData) + RNG_=
SEED_LENGTH;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_cmdline =3D g_realloc(kernel_cmdlin=
e, cmdline_size);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 setup_data =3D (void *)kernel_cmdline + se=
tup_data_offset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setup_data-&gt;next =3D cpu_to_le64(f=
irst_setup_data);<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 first_setup_data =3D prot_addr + setup_dat=
a_offset;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 first_setup_data =3D cmdline_addr + setup_=
data_offset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setup_data-&gt;type =3D cpu_to_le32(S=
ETUP_RNG_SEED);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setup_data-&gt;len =3D cpu_to_le32(RN=
G_SEED_LENGTH);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_guest_getrandom_nofail(setup_dat=
a-&gt;data, RNG_SEED_LENGTH);<br>
&gt;@@ -1122,6 +1120,12 @@ void x86_load_linux(X86MachineState *x86ms,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNE=
L_DATA, kernel, kernel_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;+=C2=A0 =C2=A0 fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr=
);<br>
&gt;+=C2=A0 =C2=A0 fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, cmdline_size=
);<br>
&gt;+=C2=A0 =C2=A0 fw_cfg_add_bytes(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmd=
line, cmdline_size);<br>
&gt;+=C2=A0 =C2=A0 sev_load_ctx.cmdline_data =3D (char *)kernel_cmdline;<br=
>
&gt;+=C2=A0 =C2=A0 sev_load_ctx.cmdline_size =3D cmdline_size;<br>
&gt;+<br>
&gt;=C2=A0 =C2=A0 =C2=A0fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_add=
r);<br>
&gt;=C2=A0 =C2=A0 =C2=A0fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_s=
ize);<br>
&gt;=C2=A0 =C2=A0 =C2=A0sev_load_ctx.kernel_data =3D (char *)kernel;<br>
&gt;@@ -1134,7 +1138,7 @@ void x86_load_linux(X86MachineState *x86ms,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * kernel on the other side of the fw_cfg interface=
 matches the hash of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * file the user passed in.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 */<br>
&gt;-=C2=A0 =C2=A0 if (!sev_enabled()) {<br>
&gt;+=C2=A0 =C2=A0 if (!sev_enabled() &amp;&amp; first_setup_data) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SetupDataFixup *fixup =3D g_malloc(si=
zeof(*fixup));<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(setup, header, MIN(sizeof(head=
er), setup_size));<br>
&gt;diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c<br>
&gt;index a00881bc64..432754eda4 100644<br>
&gt;--- a/hw/nvram/fw_cfg.c<br>
&gt;+++ b/hw/nvram/fw_cfg.c<br>
&gt;@@ -741,6 +741,15 @@ void fw_cfg_add_bytes(FWCfgState *s, uint16_t key,=
 void *data, size_t len)<br>
&gt;=C2=A0 =C2=A0 =C2=A0fw_cfg_add_bytes_callback(s, key, NULL, NULL, NULL,=
 data, len, true);<br>
&gt; }<br>
&gt; <br>
&gt;+void *fw_cfg_read_bytes_ptr(FWCfgState *s, uint16_t key)<br>
&gt;+{<br>
&gt;+=C2=A0 =C2=A0 int arch =3D !!(key &amp; FW_CFG_ARCH_LOCAL);<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 key &amp;=3D FW_CFG_ENTRY_MASK;<br>
&gt;+=C2=A0 =C2=A0 assert(key &lt; fw_cfg_max_entry(s));<br>
&gt;+=C2=A0 =C2=A0 return s-&gt;entries[arch][key].data;<br>
&gt;+}<br>
&gt;+<br>
&gt; void fw_cfg_add_string(FWCfgState *s, uint16_t key, const char *value)=
<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0size_t sz =3D strlen(value) + 1;<br>
<br>
Saying they are &quot;appended to&quot; is wrong; the loader is free to put=
 them anywhere in usable RAM that is not covered by the kernel image, the k=
ernel keepout area, the command line or initrd.<br></blockquote></div></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">No. That sentence describes =
what QEMU does currently, without this patch, and it is accurate. This is n=
ot a kernel commit. It&#39;s a QEMU one.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">(Also, this patch sat on the list for over a month, during=
 which time you could have chimed in. The ship for nitpicking has sailed no=
w.)</div><div dir=3D"auto"><br></div><div dir=3D"auto">Sorry for the HTML c=
rud; I&#39;ll be mobile for another 10 days, without a real computer.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Jason</div><div dir=3D"auto">=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000e1456805f3960159--

