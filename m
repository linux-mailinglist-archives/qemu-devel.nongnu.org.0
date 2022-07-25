Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECDA57FECB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 14:14:43 +0200 (CEST)
Received: from localhost ([::1]:46232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFwyv-0006Hh-O8
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 08:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oFwxA-0004sa-Qf
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:12:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oFwx7-0004Pt-O5
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658751168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=41JaJX3GNzXck1EJ32DKcd9hkubRp7uPtPDHymdItLs=;
 b=CrnOxeIymg9q0EgaRqpB/isOGuqh8M85IbiC4TjBXDLPNeEZCJK28TFeDi5ZsBTldWDnfX
 eng0gTTUfIQPnoXhTlrK/y1zfyckpagAcTC2Oxc/Y9lQ5BG4Se9UV16FxWvjOhLlk26MqZ
 iUgWCeF9+iAAPItgXTezUF/K8opBsdc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-T1kFXjjpNrWKSPDm70keig-1; Mon, 25 Jul 2022 08:12:46 -0400
X-MC-Unique: T1kFXjjpNrWKSPDm70keig-1
Received: by mail-wm1-f72.google.com with SMTP id
 bh18-20020a05600c3d1200b003a32044cc9fso6091094wmb.6
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 05:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=41JaJX3GNzXck1EJ32DKcd9hkubRp7uPtPDHymdItLs=;
 b=hWWscrCEpUy5ZiDO8NgnRZpjZPANvc2RyujdXaTTbRaZBjMJoe0LAk3gjqM4lu+38X
 PR9BvWadHtST9hCuTeu4PUxsMh1vZ47myJfPQwXc0rrPVhtF/p644SYhyt/33N194nUN
 AmXAFQYX3deciN+NH9Av3lLzVj+Swg4NjMcoZlE8NOsvTDRHqFmk1JVzb1iPzvPTwQQT
 GwZ8PektonKxMacWu7dd3azAOB3HjPUxyZQrEY8wIz5IigV6tcf9bGh/7i6WvYkqOQF7
 YZb9mchAILTWDKXBRNUi/Rl14xYCGUDY4Caamwhrl1YRKQYzswQhaIO/DHECePMk0hXS
 1Fwg==
X-Gm-Message-State: AJIora+71A5hqSrK31jtk6kzUbsn6SOiw9KIT8ULYQNBWiPiBZlAgX5b
 uAeEhzrzCQT3gqwFavud0nSWRBjdJvFvmWl1r7VjeBgJbEpirt2epMOSZiil9E5amcV+jt2pq9H
 h5YYiYibdlzVzfWs=
X-Received: by 2002:a05:600c:3593:b0:3a3:3a49:41a3 with SMTP id
 p19-20020a05600c359300b003a33a4941a3mr13009081wmq.166.1658751164444; 
 Mon, 25 Jul 2022 05:12:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ug5Tov+98U7PLKlfSaK2NXo42otXYKHBvUw3EpomTK5L1mbknXvkXRwVBPGMXeC9M/XVpDIg==
X-Received: by 2002:a05:600c:3593:b0:3a3:3a49:41a3 with SMTP id
 p19-20020a05600c359300b003a33a4941a3mr13009068wmq.166.1658751164217; 
 Mon, 25 Jul 2022 05:12:44 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 x3-20020a05600c420300b003a3200bc788sm17312161wmh.33.2022.07.25.05.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 05:12:42 -0700 (PDT)
Date: Mon, 25 Jul 2022 13:12:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH for-7.2 04/10] hmp, device_tree.c: introduce fdt-save
Message-ID: <Yt6IuASrnXp/7bQb@work-vm>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
 <20220722200007.1602174-5-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722200007.1602174-5-danielhb413@gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel Henrique Barboza (danielhb413@gmail.com) wrote:
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
> 
> A valid FDT consists of a FDT that was created using libfdt being
> retrieved via 'current_machine->fdt' in device_tree.c. This condition is
> met by most FDT users in QEMU.
> 
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

These all probably should be done as wrappers around qmp equivalents.

Dave

> ---
>  hmp-commands.hx              | 13 +++++++++++++
>  include/sysemu/device_tree.h |  2 ++
>  monitor/misc.c               | 13 +++++++++++++
>  softmmu/device_tree.c        | 18 ++++++++++++++++++
>  4 files changed, 46 insertions(+)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index c9d465735a..3c134cf652 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1768,3 +1768,16 @@ ERST
>                        "\n\t\t\t -b to specify dirty bitmap as method of calculation)",
>          .cmd        = hmp_calc_dirty_rate,
>      },
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
>  int qemu_fdt_add_subnode(void *fdt, const char *name);
>  int qemu_fdt_add_path(void *fdt, const char *path);
>  
> +void fdt_save(const char *filename, Error **errp);
> +
>  #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
>      do {                                                                      \
>          uint32_t qdt_tmp[] = { __VA_ARGS__ };                                 \
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 3d2312ba8d..145285cec0 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -78,6 +78,7 @@
>  #include "qapi/qmp-event.h"
>  #include "sysemu/cpus.h"
>  #include "qemu/cutils.h"
> +#include "sysemu/device_tree.h"
>  
>  #if defined(TARGET_S390X)
>  #include "hw/s390x/storage-keys.h"
> @@ -936,6 +937,18 @@ static void hmp_boot_set(Monitor *mon, const QDict *qdict)
>      }
>  }
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
>  static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
>  {
>      bool flatview = qdict_get_try_bool(qdict, "flatview", false);
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 6ca3fad285..eeab6a5ef0 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -643,3 +643,21 @@ out:
>      g_free(propcells);
>      return ret;
>  }
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
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


