Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23083F5392
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 01:16:04 +0200 (CEST)
Received: from localhost ([::1]:37748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIJAb-0005Cv-Pg
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 19:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mIJ9Q-0004LW-2x
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 19:14:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mIJ9N-00023r-B7
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 19:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629760480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zxdVtpTTLx09JFUFmNHiIAvA/gJWYqLacgSAAa6uIt0=;
 b=HvJPLhodVpXjPFMVEg9qkNYjzwypO2RfEbWZRJM4uHw86+x5Y+0WQAn31Z8tlBPi4/pT7+
 kp8U8k7o8aPz7wyCGTlyph41kIRh0B4ulHUIjRcwJ7haEgwkfeLu/f2BVTkycN2rpjrd4C
 43W5R1Ul8inwTZYAGhl2EJfOhClPz9k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-3Zl3KUofNHy7KEpb-Wfa7w-1; Mon, 23 Aug 2021 19:06:52 -0400
X-MC-Unique: 3Zl3KUofNHy7KEpb-Wfa7w-1
Received: by mail-ed1-f69.google.com with SMTP id
 d12-20020a50fe8c0000b02903a4b519b413so836369edt.9
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 16:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zxdVtpTTLx09JFUFmNHiIAvA/gJWYqLacgSAAa6uIt0=;
 b=TktTTbO6CtliiunhvbsXIE6AjWRO7wH78eyywf9KAZ4mxT6p3bf+OcutGeMT29wcQL
 kBbLQ2302zcM7+V3lWxXK404meAFJSghngVBF7FV7aYlpCOQFfUbp3JtA45S102WIE66
 HhnWYayT17G66eHrrFs4uAQg2RDnBjLcDqO55nkat+3qbSLZFbEhamRft2TNDLGk4LwC
 uXZ3SimHP6NjIKiFY73GwsZPd9NvyDf5J4FuXfUciq8z42W+5db8XJjpjL/EvG9qajOB
 TzQi+5S1Te9/Okrt7ItVY/9SzQsPrV0/5Y6AUZSmA7jEsODSoYvOysN6M2sa6lpg2mSB
 v7ww==
X-Gm-Message-State: AOAM532ZtJ4OCez0Y1YM5PmBB+YzOyWie8kbeFtFDoLiMswFaWBLyM55
 ohf9YEdMqR4XBDr2DmwJS9IkRKFEMR94rhKAHLyY7TDPx8x30k5ZabPlWgkcI27Yhkqu6vsSxGW
 XIZZs+48ZwVFN9kA=
X-Received: by 2002:a05:6402:278b:: with SMTP id
 b11mr38998499ede.339.1629760011192; 
 Mon, 23 Aug 2021 16:06:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxJMgDKRiKeMKVqUGPdoFJs+XKtSb1fJnc8zSQUSfBIaIQopcyRC+V2N9R1lwRowNlPHf4/w==
X-Received: by 2002:a05:6402:278b:: with SMTP id
 b11mr38998487ede.339.1629760011004; 
 Mon, 23 Aug 2021 16:06:51 -0700 (PDT)
Received: from redhat.com ([2.55.137.225])
 by smtp.gmail.com with ESMTPSA id o3sm8105324eju.123.2021.08.23.16.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 16:06:50 -0700 (PDT)
Date: Mon, 23 Aug 2021 19:06:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/acpi/pcihp: validate bsel property of the bus before
 unplugging device
Message-ID: <20210823190444-mutt-send-email-mst@kernel.org>
References: <20210821150535.763541-1-ani@anisinha.ca>
MIME-Version: 1.0
In-Reply-To: <20210821150535.763541-1-ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Aug 21, 2021 at 08:35:35PM +0530, Ani Sinha wrote:
> Bsel property of the pci bus indicates whether the bus supports acpi hotplug.
> We need to validate the presence of this property before performing any hotplug
> related callback operations. Currently validation of the existence of this
> property was absent from acpi_pcihp_device_unplug_cb() function but is present
> in other hotplug/unplug callback functions. Hence, this change adds the missing
> check for the above function.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

I queued this but I have a general question:
are all these errors logged with LOG_GUEST_ERROR?
Because if not we have a security problem.
I also note that bsel is an internal property,
I am not sure we should be printing this to users,
it might just confuse them.

Same question for all the other places validating bsel.

> ---
>  hw/acpi/pcihp.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 0fd0c1d811..9982815a87 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -372,9 +372,15 @@ void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
>                                   DeviceState *dev, Error **errp)
>  {
>      PCIDevice *pdev = PCI_DEVICE(dev);
> +    int bsel = acpi_pcihp_get_bsel(pci_get_bus(pdev));
> +
> +    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn), bsel);
>  
> -    trace_acpi_pci_unplug(PCI_SLOT(pdev->devfn),
> -                          acpi_pcihp_get_bsel(pci_get_bus(pdev)));
> +    if (bsel < 0) {
> +        error_setg(errp, "Unsupported bus. Bus doesn't have property '"
> +                   ACPI_PCIHP_PROP_BSEL "' set");
> +        return;
> +    }
>  
>      /*
>       * clean up acpi-index so it could reused by another device
> -- 
> 2.25.1


