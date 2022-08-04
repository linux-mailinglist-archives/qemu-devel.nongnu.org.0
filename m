Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FE1589C91
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 15:26:07 +0200 (CEST)
Received: from localhost ([::1]:43030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJarV-0007OX-Ok
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 09:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJapR-0002hX-1e
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:23:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJapM-0003lz-FT
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:23:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659619431;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KgFK3eOjLhAILT76s4BI0L999ABBTJQPKinZ/fP5nyE=;
 b=FxCSbmaQjhUY+6iczxJ7SXJ++R0T1juRcLbpl5+3TmoML57TIE3ns34FvZB8oRyLHxSqa6
 0NjlX5vOhqR/vsdjFYJWL1YRu/qpYd1AbbefDXT1Ql+4myb2dgpnZ7o2EbQHTBxyWfWrS4
 D5f211GDgzoQHC1m9lb4G99h05wA8C8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-qHhT1z45M5Cechjdf96CTA-1; Thu, 04 Aug 2022 09:23:49 -0400
X-MC-Unique: qHhT1z45M5Cechjdf96CTA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1DBE85A585;
 Thu,  4 Aug 2022 13:23:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A611492CA2;
 Thu,  4 Aug 2022 13:23:47 +0000 (UTC)
Date: Thu, 4 Aug 2022 14:23:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] pc: add property for Linux setup_data seed
Message-ID: <YuvIYQRI6o5T1z8A@redhat.com>
References: <20220804131320.395015-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220804131320.395015-1-pbonzini@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 04, 2022 at 03:13:20PM +0200, Paolo Bonzini wrote:
> Using a property makes it possible to use the normal compat property
> mechanism instead of ad hoc code; it avoids parameter proliferation
> in x86_load_linux; and allows shipping the code even if it is
> disabled by default.
> 
> Cc: Jason A. Donenfeld <Jason@zx2c4.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/i386/microvm.c     |  2 +-
>  hw/i386/pc.c          |  5 +++--
>  hw/i386/pc_piix.c     |  2 --
>  hw/i386/pc_q35.c      |  2 --
>  hw/i386/x86.c         | 31 +++++++++++++++++++++++++++----
>  include/hw/i386/pc.h  |  3 ---
>  include/hw/i386/x86.h |  5 +++--
>  7 files changed, 34 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 7fe8cce03e..dc929727dc 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -332,7 +332,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
>      rom_set_fw(fw_cfg);
>  
>      if (machine->kernel_filename != NULL) {
> -        x86_load_linux(x86ms, fw_cfg, 0, true, false);
> +        x86_load_linux(x86ms, fw_cfg, 0, true);
>      }
>  
>      if (mms->option_roms) {
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 7280c02ce3..1a77f5f0f0 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -112,6 +112,7 @@ const size_t pc_compat_7_0_len = G_N_ELEMENTS(pc_compat_7_0);
>  
>  GlobalProperty pc_compat_6_2[] = {
>      { "virtio-mem", "unplugged-inaccessible", "off" },
> +    { TYPE_X86_MACHINE, "linuxboot-seed", "off" },
>  };
>  const size_t pc_compat_6_2_len = G_N_ELEMENTS(pc_compat_6_2);
>  
> @@ -796,7 +797,7 @@ void xen_load_linux(PCMachineState *pcms)
>      rom_set_fw(fw_cfg);
>  
>      x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
> -                   pcmc->pvh_enabled, pcmc->legacy_no_rng_seed);
> +                   pcmc->pvh_enabled);
>      for (i = 0; i < nb_option_roms; i++) {
>          assert(!strcmp(option_rom[i].name, "linuxboot.bin") ||
>                 !strcmp(option_rom[i].name, "linuxboot_dma.bin") ||
> @@ -1118,7 +1119,7 @@ void pc_memory_init(PCMachineState *pcms,
>  
>      if (linux_boot) {
>          x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
> -                       pcmc->pvh_enabled, pcmc->legacy_no_rng_seed);
> +                       pcmc->pvh_enabled);
>      }
>  
>      for (i = 0; i < nb_option_roms; i++) {
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index a5c65c1c35..00c21f6e4d 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -446,11 +446,9 @@ DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
>  
>  static void pc_i440fx_7_0_machine_options(MachineClass *m)
>  {
> -    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_i440fx_7_1_machine_options(m);
>      m->alias = NULL;
>      m->is_default = false;
> -    pcmc->legacy_no_rng_seed = true;
>      pcmc->enforce_amd_1tb_hole = false;
>      compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>      compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 3a35193ff7..5bcf100b35 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -383,10 +383,8 @@ DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
>  
>  static void pc_q35_7_0_machine_options(MachineClass *m)
>  {
> -    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_7_1_machine_options(m);
>      m->alias = NULL;
> -    pcmc->legacy_no_rng_seed = true;
>      pcmc->enforce_amd_1tb_hole = false;
>      compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>      compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 050eedc0c8..3fbab258a9 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -767,8 +767,7 @@ static bool load_elfboot(const char *kernel_filename,
>  void x86_load_linux(X86MachineState *x86ms,
>                      FWCfgState *fw_cfg,
>                      int acpi_data_size,
> -                    bool pvh_enabled,
> -                    bool legacy_no_rng_seed)
> +                    bool pvh_enabled)
>  {
>      bool linuxboot_dma_enabled = X86_MACHINE_GET_CLASS(x86ms)->fwcfg_dma_enabled;
>      uint16_t protocol;
> @@ -786,7 +785,6 @@ void x86_load_linux(X86MachineState *x86ms,
>      const char *dtb_filename = machine->dtb;
>      const char *kernel_cmdline = machine->kernel_cmdline;
>      SevKernelLoaderContext sev_load_ctx = {};
> -    enum { RNG_SEED_LENGTH = 32 };
>  
>      /* Align to 16 bytes as a paranoia measure */
>      cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
> @@ -1076,7 +1074,8 @@ void x86_load_linux(X86MachineState *x86ms,
>          load_image_size(dtb_filename, setup_data->data, dtb_size);
>      }
>  
> -    if (!legacy_no_rng_seed) {
> +    if (x86ms->linuxboot_seed != ON_OFF_AUTO_OFF &&
> +        (data.protocol >= 0x209 || x86ms->linuxboot_seed == ON_OFF_AUTO_ON)) {
>          setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
>          kernel_size = setup_data_offset + sizeof(struct setup_data) + RNG_SEED_LENGTH;
>          kernel = g_realloc(kernel, kernel_size);


This fails to build

../hw/i386/x86.c: In function ‘x86_load_linux’:
../hw/i386/x86.c:1078:10: error: ‘data’ undeclared (first use in this function)
 1078 |         (data.protocol >= 0x209 || x86ms->linuxboot_seed == ON_OFF_AUTO_ON)) {
      |          ^~~~
../hw/i386/x86.c:1078:10: note: each undeclared identifier is reported only once for each function it appears in
../hw/i386/x86.c:1080:71: error: ‘RNG_SEED_LENGTH’ undeclared (first use in this function)
 1080 |         kernel_size = setup_data_offset + sizeof(struct setup_data) + RNG_SEED_LENGTH;
      |                                                                       ^~~~~~~~~~~~~~~
ninja: build stopped: subcommand failed.



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


