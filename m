Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151405A60F2
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 12:42:23 +0200 (CEST)
Received: from localhost ([::1]:57386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSyhK-0001G7-3n
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 06:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSyfx-0007n2-ES
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 06:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSyfu-00075R-4B
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 06:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661856053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ls2JRJWzMEhHR7OAPEJ1V2mzxgOfjs1Xr5id8uT5nLY=;
 b=EQiNjTo+5/qVYoIjk0noAuodn6U92zD5FdAmAXaW7jyHR6Ggrt6AeX+S5+7MJP43hiQYnc
 ZnF3QpWUEyl6KCQlRYBOTbOyiaTunPAzkKXKsUWA/vlV2JFb9pLboDiedrT124oakyV6Vi
 LrFt/XPCSf1YUglBdjDhE6eLZJD5lr0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-XelfpfVgMeqW_DYMofNR2w-1; Tue, 30 Aug 2022 06:40:36 -0400
X-MC-Unique: XelfpfVgMeqW_DYMofNR2w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 354E1811E81;
 Tue, 30 Aug 2022 10:40:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B70A4492C3B;
 Tue, 30 Aug 2022 10:40:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7036021E6900; Tue, 30 Aug 2022 12:40:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-ppc@nongnu.org,  clg@kaod.org,
 david@gibson.dropbear.id.au,  alistair.francis@wdc.com,  "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-7.2 v4 14/21] qmp/hmp, device_tree.c: introduce dumpdtb
References: <20220826141150.7201-1-danielhb413@gmail.com>
 <20220826141150.7201-15-danielhb413@gmail.com>
Date: Tue, 30 Aug 2022 12:40:31 +0200
In-Reply-To: <20220826141150.7201-15-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Fri, 26 Aug 2022 11:11:43 -0300")
Message-ID: <87edwyj9pc.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> To save the FDT blob we have the '-machine dumpdtb=<file>' property.
> With this property set, the machine saves the FDT in <file> and exit.
> The created file can then be converted to plain text dts format using
> 'dtc'.
>
> There's nothing particularly sophisticated into saving the FDT that
> can't be done with the machine at any state, as long as the machine has
> a valid FDT to be saved.
>
> The 'dumpdtb' command receives a 'filename' paramenter and, if a valid
> FDT is available, it'll save it in a file 'filename'. In short, this is
> a '-machine dumpdtb' that can be fired on demand via QMP/HMP.
>
> A valid FDT consists of a FDT that was created using libfdt being
> retrieved via 'current_machine->fdt' in device_tree.c. This condition is
> met by most FDT users in QEMU.
>
> This command will always be executed in-band (i.e. holding BQL),
> avoiding potential race conditions with machines that might change the
> FDT during runtime (e.g. PowerPC 'pseries' machine).
>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hmp-commands.hx              | 13 +++++++++++++
>  include/monitor/hmp.h        |  1 +
>  include/sysemu/device_tree.h |  1 +
>  monitor/hmp-cmds.c           | 12 ++++++++++++
>  monitor/qmp-cmds.c           | 13 +++++++++++++
>  qapi/machine.json            | 17 +++++++++++++++++
>  softmmu/device_tree.c        | 18 ++++++++++++++++++
>  7 files changed, 75 insertions(+)
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 182e639d14..2dd737078e 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1800,3 +1800,16 @@ ERST
>                        "\n\t\t\t\t\t limit on a specified virtual cpu",
>          .cmd        = hmp_cancel_vcpu_dirty_limit,
>      },
> +
> +SRST
> +``dumpdtb`` *filename*
> +  Save the FDT in the 'filename' file to be decoded using dtc.
> +  Requires 'libfdt' support.
> +ERST
> +    {
> +        .name       = "dumpdtb",
> +        .args_type  = "filename:F",
> +        .params     = "filename",
> +        .help       = "save the FDT in the 'filename' file to be decoded using dtc",
> +        .cmd        = hmp_dumpdtb,
> +    },
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index a618eb1e4e..d7f324da59 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -134,6 +134,7 @@ void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
>  void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>  void hmp_cancel_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>  void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
>  void hmp_human_readable_text_helper(Monitor *mon,
>                                      HumanReadableText *(*qmp_handler)(Error **));
>  void hmp_info_stats(Monitor *mon, const QDict *qdict);
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index ef060a9759..bf7684e4ed 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -136,6 +136,7 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>      } while (0)
>  
>  void qemu_fdt_dumpdtb(void *fdt, int size);
> +void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
>  
>  /**
>   * qemu_fdt_setprop_sized_cells_from_array:
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index c6cd6f91dd..1c7bfd3b9d 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -2472,3 +2472,15 @@ exit:
>  exit_no_print:
>      error_free(err);
>  }
> +
> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
> +{
> +    const char *filename = qdict_get_str(qdict, "filename");
> +    Error *local_err = NULL;
> +
> +    qmp_dumpdtb(filename, &local_err);
> +
> +    if (local_err) {
> +        hmp_handle_error(mon, local_err);
> +    }

Make this unconditional, please.

> +}
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 7314cd813d..8415aca08c 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -45,6 +45,7 @@
>  #include "hw/intc/intc.h"
>  #include "hw/rdma/rdma.h"
>  #include "monitor/stats.h"
> +#include "sysemu/device_tree.h"
>  
>  NameInfo *qmp_query_name(Error **errp)
>  {
> @@ -596,3 +597,15 @@ bool apply_str_list_filter(const char *string, strList *list)
>      }
>      return false;
>  }
> +
> +#ifdef CONFIG_FDT
> +void qmp_dumpdtb(const char *filename, Error **errp)
> +{
> +    return qemu_fdt_qmp_dumpdtb(filename, errp);
> +}
> +#else
> +void qmp_dumpdtb(const char *filename, Error **errp)
> +{
> +    error_setg(errp, "dumpdtb requires libfdt");

Bad error message, in my opinion: not enough information to be
actionable.  But see below.

> +}
> +#endif

Have you considered adding this to softmmu/device_tree.c instead?

> diff --git a/qapi/machine.json b/qapi/machine.json
> index 6afd1936b0..aeb013f3dd 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1664,3 +1664,20 @@
>       '*size': 'size',
>       '*max-size': 'size',
>       '*slots': 'uint64' } }
> +
> +##
> +# @dumpdtb:
> +#
> +# Save the FDT in dtb format. Requires 'libfdt' support.
> +#
> +# @filename: name of the FDT file to be created
> +#
> +# Since: 7.2
> +#
> +# Example:
> +#   {"execute": "dumpdtb"}
> +#    "arguments": { "filename": "/tmp/fdt.dtb" } }
> +#
> +##
> +{ 'command': 'dumpdtb',
> +  'data': { 'filename': 'str' } }

Why isn't this 'if': 'CONFIG_FDT'?

If it was, you wouldn't need a qmp_dumpdtb() dummy that always fails.

Same for HMP.

> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 6ca3fad285..cd487ddd4d 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -643,3 +643,21 @@ out:
>      g_free(propcells);
>      return ret;
>  }
> +
> +void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp)
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

Unhelpful error reporting.  Please try something like

       g_autoptr(GError) err = NULL;

       if (!g_file_set_contents(filename, current_machine->fdt, size, &err)) {
           error_setg(errp, "Error saving FDT to file %s: %s",
                            filename, err->message);
           return;
       }


