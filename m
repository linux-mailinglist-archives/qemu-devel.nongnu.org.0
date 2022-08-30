Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2CC5A60FC
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 12:44:17 +0200 (CEST)
Received: from localhost ([::1]:35214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSyjA-0003bL-IX
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 06:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSyh0-0000io-3d
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 06:42:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSygx-0007En-LQ
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 06:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661856118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A3qv+iluehIpOwlWuvopHcEeavp+iKav42QccrWdwFU=;
 b=UwYuqVLlEnyljfFrPF7MoBiUkQr/I4x/ginEGZtdAq47ts0cwoCapWChtmwefa15FFxhT+
 QILKlP+RwRfBRaUhlOAuHzpISunKtQ4f6rl1aCdZ5BQPc88f3xjAH4xO+JzD6k55Y/XCqJ
 JQL4qmj/PsjKODdoHKY/TAmylxUQ160=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-NzKZ7xviPMqZ7E6icRIj3A-1; Tue, 30 Aug 2022 06:41:55 -0400
X-MC-Unique: NzKZ7xviPMqZ7E6icRIj3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EB86101A54E;
 Tue, 30 Aug 2022 10:41:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE7AB4010D42;
 Tue, 30 Aug 2022 10:41:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C4A4721E6900; Tue, 30 Aug 2022 12:41:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-ppc@nongnu.org,  clg@kaod.org,
 david@gibson.dropbear.id.au,  alistair.francis@wdc.com,  "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-7.2 v4 15/21] qmp/hmp, device_tree.c: introduce
 'info fdt' command
References: <20220826141150.7201-1-danielhb413@gmail.com>
 <20220826141150.7201-16-danielhb413@gmail.com>
Date: Tue, 30 Aug 2022 12:41:53 +0200
In-Reply-To: <20220826141150.7201-16-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Fri, 26 Aug 2022 11:11:44 -0300")
Message-ID: <87czcij9n2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

> Reading the FDT requires that the user saves the fdt_blob and then use
> 'dtc' to read the contents. Saving the file and using 'dtc' is a strong
> use case when we need to compare two FDTs, but it's a lot of steps if
> you want to do quick check on a certain node or property.
>
> 'info fdt' retrieves FDT nodes (and properties, later on) and print it
> to the user. This can be used to check the FDT on running machines
> without having to save the blob and use 'dtc'.
>
> The implementation is based on the premise that the machine thas a FDT
> created using libfdt and pointed by 'machine->fdt'. As long as this
> pre-requisite is met the machine should be able to support it.
>
> For now we're going to add the required QMP/HMP boilerplate and the
> capability of printing the name of the properties of a given node. Next
> patches will extend 'info fdt' to be able to print nodes recursively,
> and then individual properties.
>
> This command will always be executed in-band (i.e. holding BQL),
> avoiding potential race conditions with machines that might change the
> FDT during runtime (e.g. PowerPC 'pseries' machine).
>
> 'info fdt' is not something that we expect to be used aside from debugging,
> so we're implementing it in QMP as 'x-query-fdt'.
>
> This is an example of 'info fdt' fetching the '/chosen' node of the
> pSeries machine:
>
> (qemu) info fdt /chosen
> chosen {
>     ibm,architecture-vec-5;
>     rng-seed;
>     ibm,arch-vec-5-platform-support;
>     linux,pci-probe-only;
>     stdout-path;
>     linux,stdout-path;
>     qemu,graphic-depth;
>     qemu,graphic-height;
>     qemu,graphic-width;
> };
>
> And the same node for the aarch64 'virt' machine:
>
> (qemu) info fdt /chosen
> chosen {
>     stdout-path;
>     rng-seed;
>     kaslr-seed;
> };
>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hmp-commands-info.hx         | 13 ++++++++++
>  include/monitor/hmp.h        |  1 +
>  include/sysemu/device_tree.h |  4 +++
>  monitor/hmp-cmds.c           | 13 ++++++++++
>  monitor/qmp-cmds.c           | 12 +++++++++
>  qapi/machine.json            | 19 +++++++++++++++
>  softmmu/device_tree.c        | 47 ++++++++++++++++++++++++++++++++++++
>  7 files changed, 109 insertions(+)
>
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 188d9ece3b..743b48865d 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -921,3 +921,16 @@ SRST
>    ``stats``
>      Show runtime-collected statistics
>  ERST
> +
> +    {
> +        .name       = "fdt",
> +        .args_type  = "nodepath:s",
> +        .params     = "nodepath",
> +        .help       = "show firmware device tree node given its path",
> +        .cmd        = hmp_info_fdt,
> +    },
> +
> +SRST
> +  ``info fdt``
> +    Show a firmware device tree node given its path. Requires libfdt.
> +ERST
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index d7f324da59..c0883dd1e3 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -135,6 +135,7 @@ void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>  void hmp_cancel_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>  void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>  void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
> +void hmp_info_fdt(Monitor *mon, const QDict *qdict);
>  void hmp_human_readable_text_helper(Monitor *mon,
>                                      HumanReadableText *(*qmp_handler)(Error **));
>  void hmp_info_stats(Monitor *mon, const QDict *qdict);
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index bf7684e4ed..057d13e397 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -14,6 +14,8 @@
>  #ifndef DEVICE_TREE_H
>  #define DEVICE_TREE_H
>  
> +#include "qapi/qapi-types-common.h"
> +
>  void *create_device_tree(int *sizep);
>  void *load_device_tree(const char *filename_path, int *sizep);
>  #ifdef CONFIG_LINUX
> @@ -137,6 +139,8 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>  
>  void qemu_fdt_dumpdtb(void *fdt, int size);
>  void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
> +HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath,
> +                                          Error **errp);
>  
>  /**
>   * qemu_fdt_setprop_sized_cells_from_array:
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 1c7bfd3b9d..93a4103afa 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -2484,3 +2484,16 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
>          hmp_handle_error(mon, local_err);
>      }
>  }
> +
> +void hmp_info_fdt(Monitor *mon, const QDict *qdict)
> +{
> +    const char *nodepath = qdict_get_str(qdict, "nodepath");
> +    Error *err = NULL;
> +    g_autoptr(HumanReadableText) info = qmp_x_query_fdt(nodepath, &err);
> +
> +    if (hmp_handle_error(mon, err)) {
> +        return;
> +    }
> +
> +    monitor_printf(mon, "%s", info->human_readable_text);
> +}
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 8415aca08c..db2c6aa7da 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -603,9 +603,21 @@ void qmp_dumpdtb(const char *filename, Error **errp)
>  {
>      return qemu_fdt_qmp_dumpdtb(filename, errp);
>  }
> +
> +HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
> +{
> +    return qemu_fdt_qmp_query_fdt(nodepath, errp);
> +}
>  #else
>  void qmp_dumpdtb(const char *filename, Error **errp)
>  {
>      error_setg(errp, "dumpdtb requires libfdt");
>  }
> +
> +HumanReadableText *qmp_x_query_fdt(const char *nodepath, Error **errp)
> +{
> +    error_setg(errp, "this command requires libfdt");
> +
> +    return NULL;
> +}
>  #endif
> diff --git a/qapi/machine.json b/qapi/machine.json
> index aeb013f3dd..96cff541ca 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1681,3 +1681,22 @@
>  ##
>  { 'command': 'dumpdtb',
>    'data': { 'filename': 'str' } }
> +
> +##
> +# @x-query-fdt:
> +#
> +# Query for FDT element (node or property). Requires 'libfdt'.
> +#
> +# @nodepath: the path of the FDT node to be retrieved

In a QAPI schema, we separate words by dashes unless there's a
compelling reason not to.  Thus: @node-path.

> +#
> +# Features:
> +# @unstable: This command is meant for debugging.
> +#
> +# Returns: FDT node
> +#
> +# Since: 7.2
> +##
> +{ 'command': 'x-query-fdt',
> +  'data': { 'nodepath': 'str' },
> +  'returns': 'HumanReadableText',
> +  'features': [ 'unstable' ]  }

Same question as for the previous patch: why isn't this 'if':
'CONFIG_FDT'?

[...]


