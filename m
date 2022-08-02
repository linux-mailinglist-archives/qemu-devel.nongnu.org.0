Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778595875F9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 05:30:21 +0200 (CEST)
Received: from localhost ([::1]:43466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIibr-00047B-Sy
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 23:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oIiaY-0002i1-0L
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 23:28:58 -0400
Received: from mga11.intel.com ([192.55.52.93]:56139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oIiaV-00049T-Af
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 23:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659410935; x=1690946935;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=42Hile80qEC+ackNR+5ojEWkTie3LsqWbiPV2ZHGjFY=;
 b=lDqY6YZ7jal4dBB+GNjs72Jd1A91IojjsUnU7I/grNIbl3tx0tez2b2h
 SEdRE1x10mjpCPsnPWAFNWzAi6MSCelkXH79NwWLSsgGWhla7NaqaiRZY
 DXl74Xczb2A1Qp73qRhPB913TPpD1icYaeFtjRY3GjN+bLourZJnYUpv8
 /io4ePr6BZpcH3MRIko1ZfwcU7vZsDAxakLAxXM4N4aShIdFGIkg10W3j
 +AoRuqCIXoUdX04oIoNxreE8djwP+GUdQgR9Q+Hvux9qPpqmARkJOB3H1
 bHts25RTFy8aT8gYYJsbk3p4LmHWCuMgu4AXb9Zhx0fqNs4GQgwkeIUUB g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="286870149"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="286870149"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 20:28:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="578044017"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.175.192])
 ([10.249.175.192])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 20:28:18 -0700
Message-ID: <dae86884-6cfa-a428-374c-60c42900aade@intel.com>
Date: Tue, 2 Aug 2022 11:28:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PULL 9/9] hw/i386: pass RNG seed via setup_data entry
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=83=c2=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-10-pbonzini@redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220721163621.761513-10-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=xiaoyao.li@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/22/2022 12:36 AM, Paolo Bonzini wrote:
> From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> 
> Tiny machines optimized for fast boot time generally don't use EFI,
> which means a random seed has to be supplied some other way. For this
> purpose, Linux (â‰¥5.20) supports passing a seed in the setup_data table
> with SETUP_RNG_SEED, specially intended for hypervisors, kexec, and
> specialized bootloaders. The linked commit shows the upstream kernel
> implementation.
> 
> At Paolo's request, we don't pass these to versioned machine types â‰¤7.0.
> 
> Link: https://git.kernel.org/tip/tip/c/68b8e9713c8
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> Message-Id: <20220721125636.446842-1-Jason@zx2c4.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/i386/microvm.c                            |  2 +-
>   hw/i386/pc.c                                 |  4 +--
>   hw/i386/pc_piix.c                            |  2 ++
>   hw/i386/pc_q35.c                             |  2 ++
>   hw/i386/x86.c                                | 26 +++++++++++++++++---
>   include/hw/i386/pc.h                         |  3 +++
>   include/hw/i386/x86.h                        |  3 ++-
>   include/standard-headers/asm-x86/bootparam.h |  1 +
>   8 files changed, 35 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index dc929727dc..7fe8cce03e 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -332,7 +332,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
>       rom_set_fw(fw_cfg);
>   
>       if (machine->kernel_filename != NULL) {
> -        x86_load_linux(x86ms, fw_cfg, 0, true);
> +        x86_load_linux(x86ms, fw_cfg, 0, true, false);
>       }
>   
>       if (mms->option_roms) {
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 774cb2bf07..d2b5823ffb 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -796,7 +796,7 @@ void xen_load_linux(PCMachineState *pcms)
>       rom_set_fw(fw_cfg);
>   
>       x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
> -                   pcmc->pvh_enabled);
> +                   pcmc->pvh_enabled, pcmc->legacy_no_rng_seed);
>       for (i = 0; i < nb_option_roms; i++) {
>           assert(!strcmp(option_rom[i].name, "linuxboot.bin") ||
>                  !strcmp(option_rom[i].name, "linuxboot_dma.bin") ||
> @@ -992,7 +992,7 @@ void pc_memory_init(PCMachineState *pcms,
>   
>       if (linux_boot) {
>           x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
> -                       pcmc->pvh_enabled);
> +                       pcmc->pvh_enabled, pcmc->legacy_no_rng_seed);
>       }
>   
>       for (i = 0; i < nb_option_roms; i++) {
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index a234989ac3..fbf9465318 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -438,9 +438,11 @@ DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
>   
>   static void pc_i440fx_7_0_machine_options(MachineClass *m)
>   {
> +    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>       pc_i440fx_7_1_machine_options(m);
>       m->alias = NULL;
>       m->is_default = false;
> +    pcmc->legacy_no_rng_seed = true;
>       compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>       compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
>   }
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index f96cbd04e2..12cc76aaf8 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -375,8 +375,10 @@ DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
>   
>   static void pc_q35_7_0_machine_options(MachineClass *m)
>   {
> +    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>       pc_q35_7_1_machine_options(m);
>       m->alias = NULL;
> +    pcmc->legacy_no_rng_seed = true;

Is making .legacy_no_rng_seed default false and opt-in it for old 
machines correct?

AFAICT, QEMU with machine-7.1 fails to boot with OVMF on my environment.


