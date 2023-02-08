Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC96768F900
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:44:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPrI5-0006CH-Sh; Wed, 08 Feb 2023 15:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPrI3-00064K-6z
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:43:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPrHx-0008Pm-Ie
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675889012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=emGeiQXQP/2SS79K9e6Eur/OYbfrPfLtjJjY96I7LIg=;
 b=FG6kq450xmDKPHc8nKVAG5aaGr1oChDHvHsoaM+JwaZezUwcSVcrsEdM4XzaFxrlBFayNs
 jrM4YBVxwoGbAHPY727MVaMThhXMUOXmwzLJz1nIpo+5GnsrLxmwjQZFq7YsuA/KRa4kPu
 GVfSgugHVbDrD0GfI9B5JENsVZwZNAY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-114-3dQDojQaMyum5acdK0W28A-1; Wed, 08 Feb 2023 15:43:21 -0500
X-MC-Unique: 3dQDojQaMyum5acdK0W28A-1
Received: by mail-ej1-f69.google.com with SMTP id
 ti11-20020a170907c20b00b00886244203fcso97570ejc.2
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 12:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=emGeiQXQP/2SS79K9e6Eur/OYbfrPfLtjJjY96I7LIg=;
 b=wyklWCCdRssd5y6gxyiDGhrHGVbV2Ro31+cZWeSeI2Xayf+6H1uEhzGXUmbTVGno1m
 vhRKO/YvL+MszHhh4peSptDjk3PHPCIcCnG6x2M3qj0D3yKDhxB/2uk2O3svIma6ZgCB
 N73TalQt79iKJ0DBaubr27yiMRQU0d8yYLrmR4eBp5WQL9bTtAS2VUTr03em3EUzifvS
 WOFU/I82TnF+zzAouqngCZVYqCjcAVMase17jdR5mI90dBZJif/k65q3makSv/TwSXMZ
 zl0ezBEueJ7fGhLoNFzszrNTPN6SppH9ie5y8bs5hj6hFmXfJXV6OWLyLljLzxNJmUk/
 LWOQ==
X-Gm-Message-State: AO0yUKXwlj55oJVKAi03AsFzHiaGIQTbBcUETdRDuwJshZ/bNxcPF0E0
 kIUnVF8SPDEOM92Un9c2v3rSEBl1w9B0cxSHbRhY8wfw3HqotxDAXwZOvsYMkvk6TH+Yv6WFBjt
 MWZIpP0h3/ly9N0U=
X-Received: by 2002:a17:907:1dd9:b0:894:ad38:aafb with SMTP id
 og25-20020a1709071dd900b00894ad38aafbmr9956818ejc.18.1675889000424; 
 Wed, 08 Feb 2023 12:43:20 -0800 (PST)
X-Google-Smtp-Source: AK7set8clM0796i+jt6/uEmYq7LdFlC0oaZFY01VpUhsAu5vAIHUtl8O0J9+u+cAHiAtREa97z5rJw==
X-Received: by 2002:a17:907:1dd9:b0:894:ad38:aafb with SMTP id
 og25-20020a1709071dd900b00894ad38aafbmr9956797ejc.18.1675889000191; 
 Wed, 08 Feb 2023 12:43:20 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 s13-20020a170906c30d00b0088842b00241sm8717467ejz.114.2023.02.08.12.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 12:43:19 -0800 (PST)
Date: Wed, 8 Feb 2023 15:43:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH] x86: temporarily remove all attempts to provide setup_data
Message-ID: <20230208151813-mutt-send-email-mst@kernel.org>
References: <20230208180835.234638-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230208180835.234638-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Feb 08, 2023 at 03:08:35PM -0300, Jason A. Donenfeld wrote:
> All attempts at providing setup_data have been made as an iteration on
> whatever was there before, stretching back to the original
> implementation used for DTBs that [mis]used the kernel image itself.
> We've now had a dozen rounds of bugs and hacks, and the result is
> turning into a pile of unmaintainable and increasingly brittle hacks.
> 
> Let's just rip out all the madness and start over. We can re-architect
> this based on having a separate standalone setup_data file, which is how
> it should have been done in the first place. This is a larger project
> with a few things to coordinate, but we can't really begin thinking
> about that while trying to play whack-a-mole with the current buggy
> implementation.
> 
> So this commit removes the setup_data setting from x86_load_linux(),
> while leaving intact the infrastructure we'll need in the future to try
> again.
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Dov Murik <dovmurik@linux.ibm.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

So I think we have:

Fixes: 67f7e426e5 ("hw/i386: pass RNG seed via setup_data entry")
Fixes: eac7a7791b ("x86: don't let decompressed kernel image clobber setup_data")
Fixes: 14b29fea74 ("x86: do not re-randomize RNG seed on snapshot load")
Fixes: cc63374a5a ("x86: re-initialize RNG seed when selecting kernel")
Fixes: 763a2828bf ("x86: reinitialize RNG seed on system reboot")
Fixes: eebb38a563 ("x86: use typedef for SetupData struct")
Fixes: e935b73508 ("x86: return modified setup_data only if read as memory, not as file")



> ---
>  hw/i386/microvm.c |  15 ++----
>  hw/i386/x86.c     | 120 +++++-----------------------------------------
>  2 files changed, 17 insertions(+), 118 deletions(-)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 29f30dd6d3..170a331e3f 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -378,8 +378,7 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
>      MicrovmMachineState *mms = MICROVM_MACHINE(machine);
>      BusState *bus;
>      BusChild *kid;
> -    char *cmdline, *existing_cmdline;
> -    size_t len;
> +    char *cmdline;
>  
>      /*
>       * Find MMIO transports with attached devices, and add them to the kernel
> @@ -388,8 +387,7 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
>       * Yes, this is a hack, but one that heavily improves the UX without
>       * introducing any significant issues.
>       */
> -    existing_cmdline = fw_cfg_read_bytes_ptr(x86ms->fw_cfg, FW_CFG_CMDLINE_DATA);
> -    cmdline = g_strdup(existing_cmdline);
> +    cmdline = g_strdup(machine->kernel_cmdline);
>      bus = sysbus_get_default();
>      QTAILQ_FOREACH(kid, &bus->children, sibling) {
>          DeviceState *dev = kid->child;
> @@ -413,12 +411,9 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
>          }
>      }
>  
> -    len = strlen(cmdline);
> -    if (len > VIRTIO_CMDLINE_TOTAL_MAX_LEN + strlen(existing_cmdline)) {
> -        fprintf(stderr, "qemu: virtio mmio cmdline too large, skipping\n");
> -    } else {
> -        memcpy(existing_cmdline, cmdline, len + 1);
> -    }
> +    fw_cfg_modify_i32(x86ms->fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(cmdline) + 1);
> +    fw_cfg_modify_string(x86ms->fw_cfg, FW_CFG_CMDLINE_DATA, cmdline);
> +
>      g_free(cmdline);
>  }
>  
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index eaff4227bd..6cfdca9acd 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -50,7 +50,6 @@
>  #include "hw/intc/i8259.h"
>  #include "hw/rtc/mc146818rtc.h"
>  #include "target/i386/sev.h"
> -#include "hw/i386/microvm.h"
>  
>  #include "hw/acpi/cpu_hotplug.h"
>  #include "hw/irq.h"
> @@ -770,30 +769,6 @@ static bool load_elfboot(const char *kernel_filename,
>      return true;
>  }
>  
> -typedef struct SetupDataFixup {
> -    void *pos;
> -    hwaddr orig_val, new_val;
> -    uint32_t addr;
> -} SetupDataFixup;
> -
> -static void fixup_setup_data(void *opaque)
> -{
> -    SetupDataFixup *fixup = opaque;
> -    stq_p(fixup->pos, fixup->new_val);
> -}
> -
> -static void reset_setup_data(void *opaque)
> -{
> -    SetupDataFixup *fixup = opaque;
> -    stq_p(fixup->pos, fixup->orig_val);
> -}
> -
> -static void reset_rng_seed(void *opaque)
> -{
> -    SetupData *setup_data = opaque;
> -    qemu_guest_getrandom_nofail(setup_data->data, le32_to_cpu(setup_data->len));
> -}
> -
>  void x86_load_linux(X86MachineState *x86ms,
>                      FWCfgState *fw_cfg,
>                      int acpi_data_size,
> @@ -803,29 +778,20 @@ void x86_load_linux(X86MachineState *x86ms,
>      bool linuxboot_dma_enabled = X86_MACHINE_GET_CLASS(x86ms)->fwcfg_dma_enabled;
>      uint16_t protocol;
>      int setup_size, kernel_size, cmdline_size;
> -    int dtb_size, setup_data_offset;
>      uint32_t initrd_max;
>      uint8_t header[8192], *setup, *kernel;
> -    hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0, first_setup_data = 0;
> +    hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0;
>      FILE *f;
>      char *vmode;
>      MachineState *machine = MACHINE(x86ms);
> -    SetupData *setup_data;
>      const char *kernel_filename = machine->kernel_filename;
>      const char *initrd_filename = machine->initrd_filename;
> -    const char *dtb_filename = machine->dtb;
> -    char *kernel_cmdline;
> +    const char *kernel_cmdline = machine->kernel_cmdline;
>      SevKernelLoaderContext sev_load_ctx = {};
>      enum { RNG_SEED_LENGTH = 32 };
>  
> -    /*
> -     * Add the NUL terminator, some padding for the microvm cmdline fiddling
> -     * hack, and then align to 16 bytes as a paranoia measure
> -     */
> -    cmdline_size = (strlen(machine->kernel_cmdline) + 1 +
> -                    VIRTIO_CMDLINE_TOTAL_MAX_LEN + 16) & ~15;
> -    /* Make a copy, since we might append arbitrary bytes to it later. */
> -    kernel_cmdline = g_strndup(machine->kernel_cmdline, cmdline_size);
> +    /* Align to 16 bytes as a paranoia measure */
> +    cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
>  
>      /* load the kernel header */
>      f = fopen(kernel_filename, "rb");
> @@ -966,6 +932,12 @@ void x86_load_linux(X86MachineState *x86ms,
>          initrd_max = x86ms->below_4g_mem_size - acpi_data_size - 1;
>      }
>  
> +    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
> +    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline) + 1);
> +    fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
> +    sev_load_ctx.cmdline_data = (char *)kernel_cmdline;
> +    sev_load_ctx.cmdline_size = strlen(kernel_cmdline) + 1;
> +
>      if (protocol >= 0x202) {
>          stl_p(header + 0x228, cmdline_addr);
>      } else {
> @@ -1078,81 +1050,13 @@ void x86_load_linux(X86MachineState *x86ms,
>      }
>      fclose(f);
>  
> -    /* append dtb to kernel */
> -    if (dtb_filename) {
> -        if (protocol < 0x209) {
> -            fprintf(stderr, "qemu: Linux kernel too old to load a dtb\n");
> -            exit(1);
> -        }
> -
> -        dtb_size = get_image_size(dtb_filename);
> -        if (dtb_size <= 0) {
> -            fprintf(stderr, "qemu: error reading dtb %s: %s\n",
> -                    dtb_filename, strerror(errno));
> -            exit(1);
> -        }
> -
> -        setup_data_offset = cmdline_size;
> -        cmdline_size += sizeof(SetupData) + dtb_size;
> -        kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
> -        setup_data = (void *)kernel_cmdline + setup_data_offset;
> -        setup_data->next = cpu_to_le64(first_setup_data);
> -        first_setup_data = cmdline_addr + setup_data_offset;
> -        setup_data->type = cpu_to_le32(SETUP_DTB);
> -        setup_data->len = cpu_to_le32(dtb_size);
> -        load_image_size(dtb_filename, setup_data->data, dtb_size);
> -    }
> -
> -    if (!legacy_no_rng_seed && protocol >= 0x209) {
> -        setup_data_offset = cmdline_size;
> -        cmdline_size += sizeof(SetupData) + RNG_SEED_LENGTH;
> -        kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
> -        setup_data = (void *)kernel_cmdline + setup_data_offset;
> -        setup_data->next = cpu_to_le64(first_setup_data);
> -        first_setup_data = cmdline_addr + setup_data_offset;
> -        setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
> -        setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
> -        qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
> -        qemu_register_reset_nosnapshotload(reset_rng_seed, setup_data);
> -        fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_KERNEL_DATA, reset_rng_seed, NULL,
> -                                  setup_data, kernel, kernel_size, true);
> -    } else {
> -        fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
> -    }
> -
> -    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
> -    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, cmdline_size);
> -    fw_cfg_add_bytes(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline, cmdline_size);
> -    sev_load_ctx.cmdline_data = (char *)kernel_cmdline;
> -    sev_load_ctx.cmdline_size = cmdline_size;
> -
> +    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
>      fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
>      fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
>      sev_load_ctx.kernel_data = (char *)kernel;
>      sev_load_ctx.kernel_size = kernel_size;
>  
> -    /*
> -     * If we're starting an encrypted VM, it will be OVMF based, which uses the
> -     * efi stub for booting and doesn't require any values to be placed in the
> -     * kernel header.  We therefore don't update the header so the hash of the
> -     * kernel on the other side of the fw_cfg interface matches the hash of the
> -     * file the user passed in.
> -     */
> -    if (!sev_enabled() && first_setup_data) {
> -        SetupDataFixup *fixup = g_malloc(sizeof(*fixup));
> -
> -        memcpy(setup, header, MIN(sizeof(header), setup_size));
> -        /* Offset 0x250 is a pointer to the first setup_data link. */
> -        fixup->pos = setup + 0x250;
> -        fixup->orig_val = ldq_p(fixup->pos);
> -        fixup->new_val = first_setup_data;
> -        fixup->addr = cpu_to_le32(real_addr);
> -        fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_SETUP_ADDR, fixup_setup_data, NULL,
> -                                  fixup, &fixup->addr, sizeof(fixup->addr), true);
> -        qemu_register_reset(reset_setup_data, fixup);
> -    } else {
> -        fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
> -    }
> +    fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
>      fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, setup_size);
>      fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA, setup, setup_size);
>      sev_load_ctx.setup_data = (char *)setup;
> -- 
> 2.39.1


