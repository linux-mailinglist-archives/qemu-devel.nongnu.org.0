Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D97857EA32
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 01:15:48 +0200 (CEST)
Received: from localhost ([::1]:47000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oF1s3-0007hu-Fc
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 19:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oF1qC-0006K6-KQ
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 19:13:52 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:20002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oF1qA-0005H2-EX
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 19:13:51 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C2C6074637E;
 Sat, 23 Jul 2022 01:13:48 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D170874633F; Sat, 23 Jul 2022 01:13:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D04F9745702;
 Sat, 23 Jul 2022 01:13:47 +0200 (CEST)
Date: Sat, 23 Jul 2022 01:13:47 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-7.2 04/10] hmp, device_tree.c: introduce fdt-save
In-Reply-To: <20220722200007.1602174-5-danielhb413@gmail.com>
Message-ID: <f0b25992-ac35-4b1-1ed9-ebf7ceaecbb7@eik.bme.hu>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
 <20220722200007.1602174-5-danielhb413@gmail.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Jul 2022, Daniel Henrique Barboza wrote:
> To save the FDT blob we have the '-machine dumpdtb=<file>' property. With this
> property set, the machine saves the FDT in <file> and exit. The created
> file can then be converted to plain text dts format using 'dtc'.
>
> There's nothing particularly sophisticated into saving the FDT that
> can't be done with the machine at any state, as long as the machine has
> a valid FDT to be saved.
>
> The 'fdt-save' command receives a 'filename' paramenter and, if a valid
> FDT is available, it'll save it in a file 'filename'. In short, this is
> a '-machine dumpdtb' that can be fired on demand via HMP.

If it does the same as -machine dumpdtb wouldn't it be more intuitive to 
call the HMP command the same, so either dumpdtb or machine-dumpdtb or 
similar? That way it's more obvious that these do the same.

Regards,
BALATON Zoltan

> A valid FDT consists of a FDT that was created using libfdt being
> retrieved via 'current_machine->fdt' in device_tree.c. This condition is
> met by most FDT users in QEMU.
>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
> hmp-commands.hx              | 13 +++++++++++++
> include/sysemu/device_tree.h |  2 ++
> monitor/misc.c               | 13 +++++++++++++
> softmmu/device_tree.c        | 18 ++++++++++++++++++
> 4 files changed, 46 insertions(+)
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index c9d465735a..3c134cf652 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1768,3 +1768,16 @@ ERST
>                       "\n\t\t\t -b to specify dirty bitmap as method of calculation)",
>         .cmd        = hmp_calc_dirty_rate,
>     },
> +
> +    {
> +        .name       = "fdt-save",
> +        .args_type  = "filename:s",
> +        .params     = "[filename] file to save the FDT",
> +        .help       = "save the FDT in the 'filename' file to be decoded using dtc",
> +        .cmd        = hmp_fdt_save,
> +    },
> +
> +SRST
> +``fdt-save`` *filename*
> +  Save the FDT in the 'filename' file to be decoded using dtc
> +ERST
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index ef060a9759..1397adb21c 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -123,6 +123,8 @@ int qemu_fdt_nop_node(void *fdt, const char *node_path);
> int qemu_fdt_add_subnode(void *fdt, const char *name);
> int qemu_fdt_add_path(void *fdt, const char *path);
>
> +void fdt_save(const char *filename, Error **errp);
> +
> #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
>     do {                                                                      \
>         uint32_t qdt_tmp[] = { __VA_ARGS__ };                                 \
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 3d2312ba8d..145285cec0 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -78,6 +78,7 @@
> #include "qapi/qmp-event.h"
> #include "sysemu/cpus.h"
> #include "qemu/cutils.h"
> +#include "sysemu/device_tree.h"
>
> #if defined(TARGET_S390X)
> #include "hw/s390x/storage-keys.h"
> @@ -936,6 +937,18 @@ static void hmp_boot_set(Monitor *mon, const QDict *qdict)
>     }
> }
>
> +static void hmp_fdt_save(Monitor *mon, const QDict *qdict)
> +{
> +    const char *path = qdict_get_str(qdict, "filename");
> +    Error *local_err = NULL;
> +
> +    fdt_save(path, &local_err);
> +
> +    if (local_err) {
> +        error_report_err(local_err);
> +    }
> +}
> +
> static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
> {
>     bool flatview = qdict_get_try_bool(qdict, "flatview", false);
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 6ca3fad285..eeab6a5ef0 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -643,3 +643,21 @@ out:
>     g_free(propcells);
>     return ret;
> }
> +
> +void fdt_save(const char *filename, Error **errp)
> +{
> +    int size;
> +
> +    if (!current_machine->fdt) {
> +        error_setg(errp, "Unable to find the machine FDT");
> +        return;
> +    }
> +
> +    size = fdt_totalsize(current_machine->fdt);
> +
> +    if (g_file_set_contents(filename, current_machine->fdt, size, NULL)) {
> +        return;
> +    }
> +
> +    error_setg(errp, "Error when saving machine FDT to file %s", filename);
> +}
>

