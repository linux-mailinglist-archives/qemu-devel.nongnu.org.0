Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F47D41C897
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 17:38:54 +0200 (CEST)
Received: from localhost ([::1]:47544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVbfY-0002ps-UF
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 11:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mVbda-0001GU-S7
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:36:51 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:51258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mVbdX-0001le-Nv
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:36:50 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 06542746353;
 Wed, 29 Sep 2021 17:36:46 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D59A9745953; Wed, 29 Sep 2021 17:36:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D44227457EE;
 Wed, 29 Sep 2021 17:36:45 +0200 (CEST)
Date: Wed, 29 Sep 2021 17:36:45 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 2/3] hw/mips/boston: Allow loading elf kernel and
 dtb
In-Reply-To: <20210929151211.108-3-jiaxun.yang@flygoat.com>
Message-ID: <ad60c95f-d2b1-a41b-ad27-cc811eef68dc@eik.bme.hu>
References: <20210929151211.108-1-jiaxun.yang@flygoat.com>
 <20210929151211.108-3-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-135601437-1632929805=:36041"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: aleksandar.rikalo@syrmia.com, qemu-devel@nongnu.org, paulburton@kernel.org,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-135601437-1632929805=:36041
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT



On Wed, 29 Sep 2021, Jiaxun Yang wrote:

> ELF kernel allows us debugging much easier with DWARF symbols.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> --
> v2: Use g_autofree
> ---
> hw/mips/boston.c | 36 ++++++++++++++++++++++++++++++++----
> 1 file changed, 32 insertions(+), 4 deletions(-)
>
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index 5c720440fb..5d3f054a3e 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -20,6 +20,7 @@
> #include "qemu/osdep.h"
> #include "qemu/units.h"
>
> +#include "elf.h"
> #include "hw/boards.h"
> #include "hw/char/serial.h"
> #include "hw/ide/pci.h"
> @@ -546,10 +547,37 @@ static void boston_mach_init(MachineState *machine)
>             exit(1);
>         }
>     } else if (machine->kernel_filename) {
> -        fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
> -        if (fit_err) {
> -            error_report("unable to load FIT image");
> -            exit(1);
> +        uint64_t kernel_entry, kernel_low, kernel_high, kernel_size;
> +
> +        kernel_size = load_elf(machine->kernel_filename, NULL,
> +                           cpu_mips_kseg0_to_phys, NULL,
> +                           (uint64_t *)&kernel_entry,
> +                           (uint64_t *)&kernel_low, (uint64_t *)&kernel_high,

These (uint64_t *) casts should not be needed and kernel_low seems to be 
unused so you could just pass NULL for it (see commit 617160c9e1f8).

Regards,
BALATON Zoltan

> +                           NULL, 0, EM_MIPS, 1, 0);
> +
> +        if (kernel_size) {
> +            hwaddr dtb_paddr = QEMU_ALIGN_UP(kernel_high, 64 * KiB);
> +            hwaddr dtb_vaddr = cpu_mips_phys_to_kseg0(NULL, dtb_paddr);
> +
> +            s->kernel_entry = kernel_entry;
> +            if (machine->dtb) {
> +                int dt_size;
> +                g_autofree const void *dtb_file_data, *dtb_load_data;
> +
> +                dtb_file_data = load_device_tree(machine->dtb, &dt_size);
> +                dtb_load_data = boston_fdt_filter(s, dtb_file_data, NULL, &dtb_vaddr);
> +
> +                /* Calculate real fdt size after filter */
> +                dt_size = fdt_totalsize(dtb_load_data);
> +                rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
> +            }
> +        } else {
> +            /* Try to load file as FIT */
> +            fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
> +            if (fit_err) {
> +                error_report("unable to load kernel image");
> +                exit(1);
> +            }
>         }
>
>         gen_firmware(memory_region_get_ram_ptr(flash) + 0x7c00000,
>
--3866299591-135601437-1632929805=:36041--

