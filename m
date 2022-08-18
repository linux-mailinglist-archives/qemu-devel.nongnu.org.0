Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F75959812C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 11:58:32 +0200 (CEST)
Received: from localhost ([::1]:46760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOcIJ-0004aF-9L
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 05:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oOc6M-0006wl-LL
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:46:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oOc6F-0007kk-RH
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660815962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KaqLU9Q/d4Yl08LPCBXzQuwyh1m6oGuec9Qs39Mjsbo=;
 b=Qbxu/kC0PNg+pa5tvlLh8L4E0uMfi0c7mfmfwG7d9spVkArJU3K5TJ2tzU3T9BSjUH7Ot5
 0qMyxwh5VHVvm4G1tQjyAAqQLcw/tClIAQt55vP69q2IVgtSjMa37zmFlEFtJhFWXps5f5
 7wHvbmqv7CoHW64OWSITb8eF8z7c0A8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-46iUxCcAMaekBIHKbgdpYQ-1; Thu, 18 Aug 2022 05:46:01 -0400
X-MC-Unique: 46iUxCcAMaekBIHKbgdpYQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 203-20020a1c02d4000000b003a5f5bce876so2445102wmc.2
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 02:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=KaqLU9Q/d4Yl08LPCBXzQuwyh1m6oGuec9Qs39Mjsbo=;
 b=KnNJwvHsywY2Iip4p/zU0InzsqJYh5s3MDHJDNfTMO5HKJcvFAXAqitZaEyCIy+GDE
 SRqqkZX5MhQETW4MiQ9OMbLdusELT0YnelZITvWv59DaLul5mKj/mnQux96exiM7KDTT
 83JGBW0dBvsQ2XSjxEeQt/MIgUxlXQTLzIVra/ZB4ycA7a6wLgMPr7UFa6n4mciadgXg
 rlZAQdPu1vOMUXuHrLB4IH4HngAuKhHii46inkzoj76+uIGHApsJoSUfGRI1JEv9jXeU
 13HdJ+eSo9UXNhaHmT7Nn4ypWd/7XvHhrxH2N1Dql8hRXXHmGXQa7PyyDvtv3fHpAZGX
 fDOw==
X-Gm-Message-State: ACgBeo2e5CwsHLicRi1NBvttS+3w4wr1Xyh72ZaNdA4cFmoA0SXP8lm1
 Hw4kBxfLT/qBQG3UR/Ts+8SKTzlVSFGWWTpAyJtljDqLJ16VvxqnUr6qv05OiJAeLrgaybmVgpP
 uezPx60h27WK5wFU=
X-Received: by 2002:a5d:4ecb:0:b0:225:25f7:191f with SMTP id
 s11-20020a5d4ecb000000b0022525f7191fmr1086544wrv.205.1660815960338; 
 Thu, 18 Aug 2022 02:46:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4EquykejJcMtonzW5iuRlNMgOlsPMA3lErdWHg88+2FXGatiRW2Bvbpvi28Y6UfAKMzwzqFg==
X-Received: by 2002:a5d:4ecb:0:b0:225:25f7:191f with SMTP id
 s11-20020a5d4ecb000000b0022525f7191fmr1086525wrv.205.1660815959995; 
 Thu, 18 Aug 2022 02:45:59 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c425100b003a5bd9448e5sm1454487wmm.28.2022.08.18.02.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 02:45:59 -0700 (PDT)
Date: Thu, 18 Aug 2022 10:45:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 alistair.francis@wdc.com, david@gibson.dropbear.id.au
Subject: Re: [PATCH for-7.2 v3 15/20] qmp/hmp, device_tree.c: introduce 'info
 fdt' command
Message-ID: <Yv4KVZ3QeXMinzf0@work-vm>
References: <20220816173428.157304-1-danielhb413@gmail.com>
 <20220816173428.157304-16-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816173428.157304-16-danielhb413@gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

* Daniel Henrique Barboza (danielhb413@gmail.com) wrote:
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
> }
> 
> And the same node for the aarch64 'virt' machine:
> 
> (qemu) info fdt /chosen
> chosen {
>     stdout-path;
>     rng-seed;
>     kaslr-seed;
> }
> 
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

For HMP:
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

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
> index d23ec85f9d..accde90380 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -2484,3 +2484,16 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
>          error_report_err(local_err);
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
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index cd487ddd4d..3fb07b537f 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -18,6 +18,7 @@
>  #endif
>  
>  #include "qapi/error.h"
> +#include "qapi/type-helpers.h"
>  #include "qemu/error-report.h"
>  #include "qemu/option.h"
>  #include "qemu/bswap.h"
> @@ -661,3 +662,49 @@ void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp)
>  
>      error_setg(errp, "Error when saving machine FDT to file %s", filename);
>  }
> +
> +static void fdt_format_node(GString *buf, int node, int depth)
> +{
> +    const struct fdt_property *prop = NULL;
> +    const char *propname = NULL;
> +    void *fdt = current_machine->fdt;
> +    int padding = depth * 4;
> +    int property = 0;
> +    int prop_size;
> +
> +    g_string_append_printf(buf, "%*s%s {\n", padding, "",
> +                           fdt_get_name(fdt, node, NULL));
> +
> +    padding += 4;
> +
> +    fdt_for_each_property_offset(property, fdt, node) {
> +        prop = fdt_get_property_by_offset(fdt, property, &prop_size);
> +        propname = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
> +
> +        g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
> +    }
> +
> +    padding -= 4;
> +    g_string_append_printf(buf, "%*s}\n", padding, "");
> +}
> +
> +HumanReadableText *qemu_fdt_qmp_query_fdt(const char *nodepath, Error **errp)
> +{
> +    g_autoptr(GString) buf = g_string_new("");
> +    int node;
> +
> +    if (!current_machine->fdt) {
> +        error_setg(errp, "Unable to find the machine FDT");
> +        return NULL;
> +    }
> +
> +    node = fdt_path_offset(current_machine->fdt, nodepath);
> +    if (node < 0) {
> +        error_setg(errp, "node '%s' not found in FDT", nodepath);
> +        return NULL;
> +    }
> +
> +    fdt_format_node(buf, node, 0);
> +
> +    return human_readable_text_from_str(buf);
> +}
> -- 
> 2.37.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


