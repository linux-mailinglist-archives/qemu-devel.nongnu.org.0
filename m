Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360D64431B8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:29:54 +0100 (CET)
Received: from localhost ([::1]:50276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvjV-0007pL-BE
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhvLZ-00033X-PY
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:05:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhvLU-0007A4-1X
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635865502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6UJaxNBDweeUH49g0iBrgPWcr2sforgIvYAhsaWx3d4=;
 b=LV7t/J+fJk2GmLzmcqbifOxESR8YO+JK1ZdFGO5bRMTGedMnVv57uOFhh7XnOCfAQqfLgC
 TI3tWOWiMoYJXEpODJehcobnWOAmr5qSuEUlY/DXpBm78SiNxHFYpxWsYaDd0S26x9u9/R
 xtHuphWqTTA5ou0a/EETvciN69ftRiw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-iTU4Oq2TMCCtuZ-b8AykIg-1; Tue, 02 Nov 2021 11:05:01 -0400
X-MC-Unique: iTU4Oq2TMCCtuZ-b8AykIg-1
Received: by mail-wm1-f69.google.com with SMTP id
 y9-20020a1c7d09000000b003316e18949bso4300035wmc.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 08:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6UJaxNBDweeUH49g0iBrgPWcr2sforgIvYAhsaWx3d4=;
 b=B1tM3TfecqjFhw1Hx9QIDAldoNAganUDrQC319QvkVaT33NhgvB4syGCghN21WGUKM
 16bP07jE7o4ZhAFiQdmxAOG52HXWBdIQsNiZxct36UPfjFOLO+7K/BnmunHV5nKcxCAl
 qGEZii7jO2qnDWSt3puNkgMcTDNUqJEVoaPoHI1nsPyTGEMlXLDDz8wnyE8xAXimoeWx
 cIuLeqgbGyzjNYFNZYS6Feo5jC94lpKhuV2GU6/ldTKb6wGq1h6SJAm6ao8kwUPX70dC
 n8wuCvStedWyxws2+e8XL3ZFoUlcbEt7FJiksbrNmv6P7nqbwrDKVGV5eanfqA9FmMD/
 6t7Q==
X-Gm-Message-State: AOAM531Lzozfq2GTwyAdmdR0M+ucLJUM6kP15tRhEfNQEi66yO0lEZb9
 ETgBEGpLJAsHPIU46gbJXTwuiuCENvUQsfAcFTPF1nAVJVndBtuhHN52x63qg1eqYbicP8fOeTv
 yulvDMspK/PMgcEk=
X-Received: by 2002:adf:ce8b:: with SMTP id r11mr26880637wrn.294.1635865500114; 
 Tue, 02 Nov 2021 08:05:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym14gOLoTS4Jj6qEXG3qjS2x9I4oGKbg1zB7rx0sr0ehFv2EAGlshl+GHFAIZgxxJyhnl12w==
X-Received: by 2002:adf:ce8b:: with SMTP id r11mr26880606wrn.294.1635865499951; 
 Tue, 02 Nov 2021 08:04:59 -0700 (PDT)
Received: from redhat.com ([2.55.17.31])
 by smtp.gmail.com with ESMTPSA id l5sm2732442wms.16.2021.11.02.08.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 08:04:58 -0700 (PDT)
Date: Tue, 2 Nov 2021 11:04:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 2/2] failover: don't allow to migrate a paused VM that
 needs PCI unplug
Message-ID: <20211102110043-mutt-send-email-mst@kernel.org>
References: <20210929144311.1168561-1-lvivier@redhat.com>
 <20210929144311.1168561-3-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210929144311.1168561-3-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 04:43:11PM +0200, Laurent Vivier wrote:
> As the guest OS is paused, we will never receive the unplug event
> from the kernel and the migration cannot continue.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Well ... what if user previously did

pause
start migration
unpause

we are breaking it now for no good reason.

Further, how about

start migration
pause

are we going to break this too? by failing pause?


> ---
>  hw/net/virtio-net.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index f205331dcf8c..e54b6c8cd86c 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -37,8 +37,10 @@
>  #include "qapi/qapi-events-migration.h"
>  #include "hw/virtio/virtio-access.h"
>  #include "migration/misc.h"
> +#include "migration/migration.h"
>  #include "standard-headers/linux/ethtool.h"
>  #include "sysemu/sysemu.h"
> +#include "sysemu/runstate.h"
>  #include "trace.h"
>  #include "monitor/qdev.h"
>  #include "hw/pci/pci.h"
> @@ -3279,7 +3281,13 @@ static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
>      should_be_hidden = qatomic_read(&n->failover_primary_hidden);
>  
>      if (migration_in_setup(s) && !should_be_hidden) {
> -        if (failover_unplug_primary(n, dev)) {
> +        if (!runstate_is_running()) {
> +            Error *err = NULL;
> +            error_setg(&err,
> +                       "cannot unplug primary device while VM is paused");
> +            migration_cancel(err);
> +            error_free(err);
> +        } else if (failover_unplug_primary(n, dev)) {
>              vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
>              qapi_event_send_unplug_primary(dev->id);
>              qatomic_set(&n->failover_primary_hidden, true);
> -- 
> 2.31.1


