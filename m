Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A767D5B1A3C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:41:36 +0200 (CEST)
Received: from localhost ([::1]:60614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEyV-0003tn-Ub
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oWEqK-0003CV-Nx
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:33:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oWEqH-0003a9-I0
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662633184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wSdjoa7oNVD0wtNaPeJUAl0Gcagh8Jq7HYdW6PllfR8=;
 b=ALJK2J1YHauf+yMG91wuU5fplGB3xfyawq6ZBOvDjY2EmUfYPc6Kvrg/upl+xs+bap8qro
 pXMdkojZWlDBYRntkkRv+tUWA4XYCl1sVcIHuRjCtUmk+FFd/2O4IOTN+AFRySjXaovaDG
 +WQfTz4NJuyVlE0+VmaSLT2WHXBdXJs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-179-uK4PdPBXOkaoH19ZhVA8Ig-1; Thu, 08 Sep 2022 06:33:03 -0400
X-MC-Unique: uK4PdPBXOkaoH19ZhVA8Ig-1
Received: by mail-wr1-f71.google.com with SMTP id
 h2-20020adfa4c2000000b00228db7822cbso2639308wrb.19
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 03:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wSdjoa7oNVD0wtNaPeJUAl0Gcagh8Jq7HYdW6PllfR8=;
 b=TN+9sL8cxlk23DOoYeMGlHBR6cKPkmXK3PE9MOx0KFl2eudaT7364h+tirZPvPR1se
 ZAj6RECje/Yp79FR3zPZ4IWGSw7MWio6xdCyhNZVYQSma73o9GHPNGQ9VoGvw4on0OGm
 QSwj9fY79ikeZConx12savqQIMMxRzPqQ11ZXDM5t7W0E0xJkMcQc6+sk3SqFe/wzg32
 cLHOm31f3VmG/hTsDFzqm5xKpvIo2vUFFTzgdPVlaSBxvA0/Ns2yrcRctwXfXL/Wo5Sv
 24A8rzGN+YerqSIHUiAnFkykXCdQYW82LpbpGLF0wPg+RZtfhtzMkD4Vze2o4N6O3GdK
 +K3g==
X-Gm-Message-State: ACgBeo0FqQc10OsfLgQfmLgURmGVVE7As2cUIujti91h1mGg0rkS397v
 ANaMqFdtF4X6fX54CZR1PX1Eg9Dalcx7v/h7Ka4hj49SMUiFFNpUjbe0mV/BwNeLEVStFdxtjfI
 GvaqJljg6kM9M91w=
X-Received: by 2002:a05:600c:384e:b0:3a9:6f5a:b6aa with SMTP id
 s14-20020a05600c384e00b003a96f5ab6aamr1810804wmr.131.1662633181833; 
 Thu, 08 Sep 2022 03:33:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR79G4HTLuCRHGIxWxXXLgEu+dh/9BAsqYqmSJsUDyrvgU9ZAgWb6wocLf3ptQlB2Qk1bFXyqw==
X-Received: by 2002:a05:600c:384e:b0:3a9:6f5a:b6aa with SMTP id
 s14-20020a05600c384e00b003a96f5ab6aamr1810779wmr.131.1662633181460; 
 Thu, 08 Sep 2022 03:33:01 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 f18-20020a05600c4e9200b003a5dbdea6a8sm3310455wmq.27.2022.09.08.03.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 03:33:01 -0700 (PDT)
Date: Thu, 8 Sep 2022 11:32:58 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v6 14/14] qmp/hmp, device_tree.c: introduce dumpdtb
Message-ID: <YxnE2iGNODE9nKxb@work-vm>
References: <20220904233456.209027-1-danielhb413@gmail.com>
 <20220904233456.209027-15-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220904233456.209027-15-danielhb413@gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Daniel Henrique Barboza (danielhb413@gmail.com) wrote:
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
> +ERST

Can you please put the SRST/ERST below the { }'s please;  most of the
hmp-commands.hx has it that way around but it looks like the diry
rate/limit set at the bottom have them flipped which we need to fix.

> +    {
> +        .name       = "dumpdtb",
> +        .args_type  = "filename:F",
> +        .params     = "filename",
> +        .help       = "save the FDT in the 'filename' file to be decoded using dtc",
> +        .cmd        = hmp_dumpdtb,
> +    },
> +#endif

Other than the flip,

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

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
> -- 
> 2.37.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


