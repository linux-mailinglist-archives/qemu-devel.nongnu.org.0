Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F247363BFAE
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 13:05:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozzKv-0007ji-HZ; Tue, 29 Nov 2022 07:03:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ozzKt-0007im-Sy
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 07:03:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ozzKs-0002Be-2g
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 07:03:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669723416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nm4hB4R+9eN3b12mHsPK1tOseVt3JO9oe80ti8t6AdE=;
 b=N5eKWISmYQ5dR4NTF9D9sEzmgpWR3a6NJV6IHd8yRnqQl9Mrda5VlEsbNWlieFwvC6piEc
 UpWMC1QNeIJvb7jnlVovvsB5m4XIb1XUoVyzUbA1mfu1wrnw35sve33mCkWvVJq+uO2KIz
 reGaCRGAnuBuiKGEJENVnCNJanpwGCQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121-hWnmbds_Oi6y-jE0Bw38Ag-1; Tue, 29 Nov 2022 07:03:35 -0500
X-MC-Unique: hWnmbds_Oi6y-jE0Bw38Ag-1
Received: by mail-wm1-f70.google.com with SMTP id
 v125-20020a1cac83000000b003cfa148576dso7720564wme.3
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 04:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nm4hB4R+9eN3b12mHsPK1tOseVt3JO9oe80ti8t6AdE=;
 b=8L9/cJk0T55jrmKq6Wl8wZHWuQBq9sG/nLOuxbgWnqEqG/zBVdCPQYj7v8GoxFJXYU
 fGs3Hg78h/KVwNWv4/yt/zbCdkd1t2jUWg78G26+H6izaXZzz2LFxvzZ1Thdc/Kb5EIE
 0oRSUB0e/04+xykxhFfhmxUD/RqUh0eGYDkTE3cg3sAO5lH12nScJyE2U1QkLEMFnL2r
 qp/mJx5CvBTA8Roibqcohgw4dmUFiql6d7yQsVAr4TBOOaG8VdrPCLyZxyNPRn4fbUZD
 EhYlolAUhWO4qyvFRlybmRQSaXUMFxZyiOuAUPhouU4iNPuj0dYCen1Wor/FJlqrdIqz
 4iWA==
X-Gm-Message-State: ANoB5plMSZr+OmU0bQr7Q3d6zPVf8dPk84JOqiqEPkWHqw/oT36Q5QUn
 Bbdui+9GVoZwDwxzjsfJSX6+jVgP8a1mXXThjsvxf9UVk7SDsFycUC9YOylREx4ve7J3LmP3fxg
 17oEg17h99Cay9Q8=
X-Received: by 2002:adf:d23a:0:b0:242:1cc2:b1ec with SMTP id
 k26-20020adfd23a000000b002421cc2b1ecmr4596847wrh.565.1669723413967; 
 Tue, 29 Nov 2022 04:03:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7HJlXd95NqwxiukYq5kQzN1VaWVhxqDMKutjQ0tYDjW4Fpofx+p4uO8l9DvbANnRZOFf4Riw==
X-Received: by 2002:adf:d23a:0:b0:242:1cc2:b1ec with SMTP id
 k26-20020adfd23a000000b002421cc2b1ecmr4596829wrh.565.1669723413747; 
 Tue, 29 Nov 2022 04:03:33 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 o7-20020adfeac7000000b00236883f2f5csm13543364wrn.94.2022.11.29.04.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 04:03:33 -0800 (PST)
Date: Tue, 29 Nov 2022 12:03:31 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com
Subject: Re: [PATCH 04/12] pci: Make query-pci stub consistent with the real
 one
Message-ID: <Y4X1E4br9QVRufJ6@work-vm>
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128080202.2570543-5-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128080202.2570543-5-armbru@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Markus Armbruster (armbru@redhat.com) wrote:
> QMP query-pci and HMP info pci can behave differently when there are
> no PCI devices.  They can report nothing, like this:
> 
>     qemu-system-aarch64 -S -M spitz -display none -monitor stdio
>     QEMU 7.1.91 monitor - type 'help' for more information
>     (qemu) info pci
> 
> Or they can fail, like this:
> 
>     qemu-system-microblaze -M petalogix-s3adsp1800 -display none -monitor stdio
>     QEMU 7.1.91 monitor - type 'help' for more information
>     (qemu) info pci
>     PCI devices not supported
> 
> They fail when none of the target's machines supports PCI, i.e. when
> we're using qmp_query_pci() from hw/pci/pci-stub.c.
> 
> The error is not useful, and reporting nothing makes sense, so do that
> in pci-stub.c, too.
> 
> Now qmp_query_pci() can't fail anymore.  Drop the dead error handling
> from hmp_info_pci().
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/pci/pci-hmp-cmds.c | 8 +-------
>  hw/pci/pci-stub.c     | 3 ---
>  2 files changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
> index 5adfe4f57f..e915fb9fe7 100644
> --- a/hw/pci/pci-hmp-cmds.c
> +++ b/hw/pci/pci-hmp-cmds.c
> @@ -105,14 +105,8 @@ static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
>  void hmp_info_pci(Monitor *mon, const QDict *qdict)
>  {
>      PciInfoList *info_list, *info;
> -    Error *err = NULL;
>  
> -    info_list = qmp_query_pci(&err);
> -    if (err) {
> -        monitor_printf(mon, "PCI devices not supported\n");
> -        error_free(err);
> -        return;
> -    }
> +    info_list = qmp_query_pci(&error_abort);
>  
>      for (info = info_list; info; info = info->next) {
>          PciDeviceInfoList *dev;
> diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
> index 3a027c42e4..f29ecc999e 100644
> --- a/hw/pci/pci-stub.c
> +++ b/hw/pci/pci-stub.c
> @@ -21,9 +21,7 @@
>  #include "qemu/osdep.h"
>  #include "sysemu/sysemu.h"
>  #include "monitor/monitor.h"
> -#include "qapi/error.h"
>  #include "qapi/qapi-commands-pci.h"
> -#include "qapi/qmp/qerror.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/msi.h"
>  #include "hw/pci/msix.h"
> @@ -33,7 +31,6 @@ bool pci_available;
>  
>  PciInfoList *qmp_query_pci(Error **errp)
>  {
> -    error_setg(errp, QERR_UNSUPPORTED);
>      return NULL;
>  }
>  
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


