Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7836D4EDE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 19:24:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjNuR-00081g-D8; Mon, 03 Apr 2023 13:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjNuP-00081W-Nh
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:23:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjNuN-00039M-GD
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680542633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1h+w9aCviLj5Dgojm80FTyvUayaWcCZPXZn4EBPjruE=;
 b=RfyhkAhonfSAOnMdWodjjw9yyRl4gjn1owIxQuW9FdN+hAxV1+DA70D6VrhjCKNTTaLo9e
 b+f8YtnJnpxVspl5lDglWoqi8zsYQBVcfVGQozufGM6VBIdOzVw2NVkMxbWpowcD2Zos9V
 Mp/0+tGyZChFEszyuKMOH2Ft9wv8u6E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-oikb_bWyMTaQJnQKFeu59A-1; Mon, 03 Apr 2023 13:23:52 -0400
X-MC-Unique: oikb_bWyMTaQJnQKFeu59A-1
Received: by mail-ed1-f69.google.com with SMTP id
 ev6-20020a056402540600b004bc2358ac04so42718445edb.21
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 10:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680542631;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1h+w9aCviLj5Dgojm80FTyvUayaWcCZPXZn4EBPjruE=;
 b=mhiQzOGKrNMr2u9MZvAyK0VHaDmtZ4iae549zuNvo+8ZY9513qJq+74CPprgokHkg1
 DyNdES9gTrVG4MDGJEV0WbEllmj4gfYYunBEXN4ZVvJOayW0Aa6yeXSq+hW0GiOGYloj
 5kCPMNvbK0CoL+s68GvOIij5L2s2RCfcgpdd0Wk+J77yZ5HBsoBGoMXp+nw3pAVFFXbG
 jnVz5rs8buqyYzjDTJCJyMWpxOVdhQJAH3Ex3CB9qNnCxcG/ywYpFkRjs0kjb+R33Rb1
 X7GJ7HUh2wFRg5ZjhoFOFlScYKrHi4xJsTzpzvLAduLRBPShORg1IEmXlV1YwD+HyNZB
 EHbA==
X-Gm-Message-State: AAQBX9cryc4U/9rUl82Zg2ZBHJ1KooVmgU2xTuDZUQIgF5ztIHIPAhDq
 QRgy85UwwHIGv5WMvIbRMqSjNBowenWoKlkp+Eo26/RbvDzp2cIqefpnwuiIDFYjSn4bVlcGl/X
 JKjrJxc1gxMrQZto=
X-Received: by 2002:a17:907:a091:b0:947:fb7b:2fb5 with SMTP id
 hu17-20020a170907a09100b00947fb7b2fb5mr8042375ejc.31.1680542631690; 
 Mon, 03 Apr 2023 10:23:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350a5RBmqO2XuUBOscMOles+cjxGIhD/MA9v5TFTigdQdNQ27pp65ybIMBG1Y/fMFOFGuPJLVoA==
X-Received: by 2002:a17:907:a091:b0:947:fb7b:2fb5 with SMTP id
 hu17-20020a170907a09100b00947fb7b2fb5mr8042358ejc.31.1680542631363; 
 Mon, 03 Apr 2023 10:23:51 -0700 (PDT)
Received: from redhat.com ([213.152.162.235]) by smtp.gmail.com with ESMTPSA id
 d3-20020a170906c20300b0093e9fb91837sm4791002ejz.76.2023.04.03.10.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 10:23:50 -0700 (PDT)
Date: Mon, 3 Apr 2023 13:23:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, anisinha@redhat.com, jusual@redhat.com,
 kraxel@redhat.com, pbonzini@redhat.com
Subject: Re: [PATCH] acpi: pcihp: make pending delete expire in 5sec
Message-ID: <20230403131833-mutt-send-email-mst@kernel.org>
References: <20230403161618.1344414-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403161618.1344414-1-imammedo@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Apr 03, 2023 at 06:16:18PM +0200, Igor Mammedov wrote:
> with Q35 using ACPI PCI hotplug by default, user's request to unplug
> device is ignored when it's issued before guest OS has been booted.
> And any additional attempt to request device hot-unplug afterwards
> results in following error:
> 
>   "Device XYZ is already in the process of unplug"
> 
> arguably it can be considered as a regression introduced by [2],
> before which it was possible to issue unplug request multiple
> times.
> 
> Allowing pending delete expire brings ACPI PCI hotplug on par
> with native PCIe unplug behavior [1] which in its turn refers
> back to ACPI PCI hotplug ability to repeat unplug requests.
> 
> PS:
> >From ACPI point of view, unplug request sets PCI hotplug status
> bit in GPE0 block. However depending on OSPM, status bits may
> be retained (Windows) or cleared (Linux) during guest's ACPI
> subsystem initialization, and as result Linux guest looses
> plug/unplug event (no SCI generated) if plug/unplug has
> happend before guest OS initialized GPE registers handling.
> I couldn't find any restrictions wrt OPM clearing GPE status
> bits ACPI spec.
> Hence a fallback approach is to let user repeat unplug request
> later at the time when guest OS has booted.
> 
> 1) 18416c62e3 ("pcie: expire pending delete")
> 2)
> Fixes: cce8944cc9ef ("qdev-monitor: Forbid repeated device_del")
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

A bit concerned about how this interacts with failover,
and 5sec is a lot of time that I hoped we'd avoid with acpi.
Any better ideas of catching such misbehaving guests?


Also at this point I do not know why we deny hotplug
pending_deleted_event in qdev core.  
Commit log says:

    Device unplug can be done asynchronously. Thus, sending the second
    device_del before the previous unplug is complete may lead to
    unexpected results. On PCIe devices, this cancels the hot-unplug
    process.

so it's a work around for an issue in pcie hotplug (and maybe shpc
too?). Maybe we should have put that check in pcie/shpc and
leave acpi along?




> ---
> CC: mst@redhat.com
> CC: anisinha@redhat.com
> CC: jusual@redhat.com
> CC: kraxel@redhat.com
> ---
>  hw/acpi/pcihp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index dcfb779a7a..cd4f9fee0a 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -357,6 +357,8 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>       * acpi_pcihp_eject_slot() when the operation is completed.
>       */
>      pdev->qdev.pending_deleted_event = true;
> +    pdev->qdev.pending_deleted_expires_ms =
> +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs */
>      s->acpi_pcihp_pci_status[bsel].down |= (1U << slot);
>      acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
>  }
> -- 
> 2.39.1


