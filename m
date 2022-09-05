Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5AE5AD431
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 15:43:16 +0200 (CEST)
Received: from localhost ([::1]:36768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVCNf-0004BS-NK
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 09:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVCLr-0002ZZ-CH
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 09:41:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oVCLn-0001S9-0i
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 09:41:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662385277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kT+DQZyNNMNjZTrXAXT7SPEFcnJH0LmHyTJ3JZkM9VA=;
 b=X5JB7i64KIvcWdIBrbgHuVBSpH8Conk2OPz9nQtLxY55KE4yxzMjyanv7tdsEYR/P8kADB
 /HKFrDGjgEwRyetnvmIEmEHKjM7L7/n44MsT4g5kdgUuS+sDQemEjvH7vXClD0j+Vv7e43
 p/pg7/ZVTylr5jhxFm3gtRfTMNFp2qg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-Ws8tfkRJOBy13MIaAD8dXA-1; Mon, 05 Sep 2022 09:41:16 -0400
X-MC-Unique: Ws8tfkRJOBy13MIaAD8dXA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA6CD10395C1;
 Mon,  5 Sep 2022 13:41:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 841342166B26;
 Mon,  5 Sep 2022 13:41:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 31CED21E6900; Mon,  5 Sep 2022 15:41:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-ppc@nongnu.org,  clg@kaod.org,  "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Alistair Francis <alistair.francis@wdc.com>,  David
 Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v6 14/14] qmp/hmp, device_tree.c: introduce dumpdtb
References: <20220904233456.209027-1-danielhb413@gmail.com>
 <20220904233456.209027-15-danielhb413@gmail.com>
Date: Mon, 05 Sep 2022 15:41:13 +0200
In-Reply-To: <20220904233456.209027-15-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Sun, 4 Sep 2022 20:34:56 -0300")
Message-ID: <87edwqhrba.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hmp-commands.hx              | 15 +++++++++++++++
>  include/sysemu/device_tree.h |  1 +
>  monitor/misc.c               |  1 +
>  qapi/machine.json            | 18 ++++++++++++++++++
>  softmmu/device_tree.c        | 31 +++++++++++++++++++++++++++++++
>  5 files changed, 66 insertions(+)
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 182e639d14..9a3e57504f 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1800,3 +1800,18 @@ ERST
>                        "\n\t\t\t\t\t limit on a specified virtual cpu",
>          .cmd        = hmp_cancel_vcpu_dirty_limit,
>      },
> +
> +#if defined(CONFIG_FDT)
> +SRST
> +``dumpdtb`` *filename*
> +  Save the FDT in the 'filename' file to be decoded using dtc.
> +  Requires 'libfdt' support.

Does the #if suppress the documentation snippet when
!defined(CONFIG_FDT)?

If yes, the "Requires" line is redundant.

Other conditional commands don't have such lines.

> +ERST
> +    {
> +        .name       = "dumpdtb",
> +        .args_type  = "filename:F",
> +        .params     = "filename",
> +        .help       = "save the FDT in the 'filename' file to be decoded using dtc",
> +        .cmd        = hmp_dumpdtb,
> +    },
> +#endif
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index ef060a9759..e7c5441f56 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -136,6 +136,7 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>      } while (0)
>  
>  void qemu_fdt_dumpdtb(void *fdt, int size);
> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
>  
>  /**
>   * qemu_fdt_setprop_sized_cells_from_array:
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 3d2312ba8d..e7dd63030b 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -49,6 +49,7 @@
>  #include "sysemu/blockdev.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/tpm.h"
> +#include "sysemu/device_tree.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qerror.h"
>  #include "qapi/qmp/qstring.h"
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 6afd1936b0..f968a5d343 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1664,3 +1664,21 @@
>       '*size': 'size',
>       '*max-size': 'size',
>       '*slots': 'uint64' } }
> +
> +##
> +# @dumpdtb:
> +#
> +# Save the FDT in dtb format. Requires 'libfdt' support.

We rarely document conditionals like this.  It's kind of redundant with
the

    If

    CONFIG_FDT

part in the generated documentation.  Aside: this "If" part could
certainly be improved.

> +#
> +# @filename: name of the FDT file to be created
> +#
> +# Since: 7.2
> +#
> +# Example:
> +#   {"execute": "dumpdtb"}
> +#    "arguments": { "filename": "/tmp/fdt.dtb" } }

Excuse my nitpicking...  Creating files with a fixed filename in /tmp is
a bad habit, and this example promotes it.  We have similar examples
elsewhere.  Still, I'd prefer not to add more.

> +#
> +##
> +{ 'command': 'dumpdtb',
> +  'data': { 'filename': 'str' },
> +  'if': 'CONFIG_FDT' }
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 6ca3fad285..cdd41b6de6 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -26,6 +26,9 @@
>  #include "hw/loader.h"
>  #include "hw/boards.h"
>  #include "qemu/config-file.h"
> +#include "qapi/qapi-commands-machine.h"
> +#include "qapi/qmp/qdict.h"
> +#include "monitor/hmp.h"
>  
>  #include <libfdt.h>
>  
> @@ -643,3 +646,31 @@ out:
>      g_free(propcells);
>      return ret;
>  }
> +
> +void qmp_dumpdtb(const char *filename, Error **errp)
> +{
> +    g_autoptr(GError) err = NULL;
> +    int size;
> +
> +    if (!current_machine->fdt) {
> +        error_setg(errp, "Unable to find the machine FDT");

Perhaps: "this machine doesn't have an FDT".

> +        return;
> +    }
> +
> +    size = fdt_totalsize(current_machine->fdt);
> +
> +    if (!g_file_set_contents(filename, current_machine->fdt, size, &err)) {
> +        error_setg(errp, "Error saving FDT to file %s: %s",
> +                   filename, err->message);
> +    }
> +}
> +
> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
> +{
> +    const char *filename = qdict_get_str(qdict, "filename");
> +    Error *local_err = NULL;
> +
> +    qmp_dumpdtb(filename, &local_err);
> +
> +    hmp_handle_error(mon, local_err);
> +}


