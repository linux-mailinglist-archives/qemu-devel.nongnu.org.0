Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D244C78D0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 20:31:29 +0100 (CET)
Received: from localhost ([::1]:39554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOlk0-0006sZ-6D
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 14:31:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nOlhU-00060p-30; Mon, 28 Feb 2022 14:28:52 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:34259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nOlhO-0004bQ-3v; Mon, 28 Feb 2022 14:28:49 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B803C74579D;
 Mon, 28 Feb 2022 20:28:39 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8A201745708; Mon, 28 Feb 2022 20:28:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 848BD7456FE;
 Mon, 28 Feb 2022 20:28:39 +0100 (CET)
Date: Mon, 28 Feb 2022 20:28:39 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 02/14] hw/ppc/spapr.c: fail early if no firmware found
 in machine_init()
In-Reply-To: <20220228175004.8862-3-danielhb413@gmail.com>
Message-ID: <ea6ddbc-4228-abca-fcce-647823f5ff17@eik.bme.hu>
References: <20220228175004.8862-1-danielhb413@gmail.com>
 <20220228175004.8862-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: david@gibson.dropbear.id.au, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022, Daniel Henrique Barboza wrote:
> The firmware check consists on a file search (qemu_find_file) and load
> it via load_imag_targphys(). This validation is not dependent on any
> other machine state but it currently being done at the end of
> spapr_machine_init(). This means that we can do a lot of stuff and end
> up failing at the end for something that we can verify right out of the
> gate.
>
> Move this validation to the start of spapr_machine_init() to fail
> earlier.  While we're at it, use g_autofree in the 'filename' pointer.
>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
> hw/ppc/spapr.c | 24 +++++++++++-------------
> 1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index c74543ace3..4cc204f90d 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2707,15 +2707,25 @@ static void spapr_machine_init(MachineState *machine)
>     MachineClass *mc = MACHINE_GET_CLASS(machine);
>     const char *bios_default = spapr->vof ? FW_FILE_NAME_VOF : FW_FILE_NAME;
>     const char *bios_name = machine->firmware ?: bios_default;
> +    g_autofree char *filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
>     const char *kernel_filename = machine->kernel_filename;
>     const char *initrd_filename = machine->initrd_filename;
>     PCIHostState *phb;
>     int i;
>     MemoryRegion *sysmem = get_system_memory();
>     long load_limit, fw_size;
> -    char *filename;
>     Error *resize_hpt_err = NULL;

Keeping it close to where it's used, i.e. right here at the end of the 
declarations would be easier to read, considering that it also inits it 
right away so checking the value in the next line is more straight 
forward.

Grouping with the simliar filename variables is also reasonable but unless 
the value of those change later just removing them and using the 
machine->{kernel,initrd}_filename directly may be simpler. I did that 
before to mac machines to simplify code.

By the way those are declared const char *, does this filename needs to be 
const too? Maybe moving the bios_* vars here too makes more sense to keep 
them together.

Regards,
BALATON Zoltan

> +    if (!filename) {
> +        error_report("Could not find LPAR firmware '%s'", bios_name);
> +        exit(1);
> +    }
> +    fw_size = load_image_targphys(filename, 0, FW_MAX_SIZE);
> +    if (fw_size <= 0) {
> +        error_report("Could not load LPAR firmware '%s'", filename);
> +        exit(1);
> +    }
> +
>     /*
>      * if Secure VM (PEF) support is configured, then initialize it
>      */
> @@ -2996,18 +3006,6 @@ static void spapr_machine_init(MachineState *machine)
>         }
>     }
>
> -    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> -    if (!filename) {
> -        error_report("Could not find LPAR firmware '%s'", bios_name);
> -        exit(1);
> -    }
> -    fw_size = load_image_targphys(filename, 0, FW_MAX_SIZE);
> -    if (fw_size <= 0) {
> -        error_report("Could not load LPAR firmware '%s'", filename);
> -        exit(1);
> -    }
> -    g_free(filename);
> -
>     /* FIXME: Should register things through the MachineState's qdev
>      * interface, this is a legacy from the sPAPREnvironment structure
>      * which predated MachineState but had a similar function */
>

