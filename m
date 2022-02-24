Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D8B4C3450
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 19:08:05 +0100 (CET)
Received: from localhost ([::1]:44116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNIX6-0001lz-Hi
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 13:08:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNIUg-00004x-6K
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:05:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNIUN-0005rv-OE
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:05:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645725914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9LkhU9tRpXxovko+Mu2kLKeZ2QGmMQUVQtWADPzd2BQ=;
 b=G6MRUbgtmwom5hAKCUa8ZlkxWEm0t5HpegneYG6P0kyCoqFx7xtrKiZcjQTUkMNjFIfKxw
 GuyNoqCrwkb3jYr+8DKgLNfgneE01RO2dHF5Q525/Gsq/8fmTDpzEXgvZ7Q4xvKcULTzLp
 IMwCfgbY7V0ZEXEUSGh9Yqkvy5JvuSM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-pCWCWfujMV2Fweomb-NeGQ-1; Thu, 24 Feb 2022 13:05:13 -0500
X-MC-Unique: pCWCWfujMV2Fweomb-NeGQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 r9-20020a05640251c900b00412d54ea618so1070103edd.3
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 10:05:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9LkhU9tRpXxovko+Mu2kLKeZ2QGmMQUVQtWADPzd2BQ=;
 b=n28VEEr+puhh4JTFAf2I3M4TIP3g1qCvxXMtyiD6MaX87Zmoe4rhVgtcBCpvqA7VQr
 VtUfiPWovXlQo4r0n4w0NoUH2zFM949c68wRgtX3k4EryMURS3VO4bpMLa29yhkgsvNY
 U1Q3s3SrQTPJf2QZXoDpi3F+MUfqVMlAHvp/3F+uR5YPn8EEfjkJzD7GiqXa+1yrnJIf
 m8B98obcLWlhkyHAdanJ1Vy32QKQ2gKZ7y0kUx6yTYMfZKXeYBB6BnZI2V5Jz//6lXkm
 N70+2+A+r7+YsxJMJ8vqoHJG7Z6S1Sxkvei7oZ9lSaPBkfnJq2rw5xktJbmfETURrYRJ
 BHwQ==
X-Gm-Message-State: AOAM532+QO03lmAAtQSHrEWoEmmVIF0TirMwxv9qZkxA3FImZrFURfu4
 scM5tg/t2GsfIz62sfh5Dxv7QRVQHxelecQ0w/tS+kDZQdwqkyrdEEnE339wAPwmGW7DNxkp65x
 1VrqQzZMGkaavO/Q=
X-Received: by 2002:a17:906:7745:b0:6b5:fe2b:4827 with SMTP id
 o5-20020a170906774500b006b5fe2b4827mr3175699ejn.628.1645725911943; 
 Thu, 24 Feb 2022 10:05:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZAQYJSwQCHhHhLWbYDbzfs0XlHC3kUsNfV+w9Tx55Z0Mk2jE4uQN/0Rr7IFEP32tV+JrFJQ==
X-Received: by 2002:a17:906:7745:b0:6b5:fe2b:4827 with SMTP id
 o5-20020a170906774500b006b5fe2b4827mr3175678ejn.628.1645725911667; 
 Thu, 24 Feb 2022 10:05:11 -0800 (PST)
Received: from redhat.com ([2.55.145.157]) by smtp.gmail.com with ESMTPSA id
 m13-20020a170906234d00b006cf86bb0652sm4964eja.121.2022.02.24.10.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 10:05:11 -0800 (PST)
Date: Thu, 24 Feb 2022 13:05:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 2/4] pcie: update slot power status only is power control
 is enabled
Message-ID: <20220224125928-mutt-send-email-mst@kernel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
 <20220224174411.3296848-3-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220224174411.3296848-3-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24, 2022 at 12:44:09PM -0500, Igor Mammedov wrote:
> on creation a PCIDevice has power turned on at the end of pci_qdev_realize()
> however later on if PCIe slot isn't populated with any children
> it's power is turned off. It's fine if native hotplug is used
> as plug callback will power slot on among other things.
> However when ACPI hotplug is enabled it replaces native PCIe plug
> callbacks with ACPI specific ones (acpi_pcihp_device_*plug_cb) and
> as result slot stays powered off. It works fine as ACPI hotplug
> on guest side takes care of enumerating/initializing hotplugged
> device. But when later guest is migrated, call chain introduced by [1]
> 
>    pcie_cap_slot_post_load()
>        -> pcie_cap_update_power()
>            -> pcie_set_power_device()
>                -> pci_set_power()
>                    -> pci_update_mappings()
> 
> will disable earlier initialized BARs for the hotplugged device
> in powered off slot due to commit [2] which disables BARs if
> power is off. As result guest OS after migration will be very
> much confused [3], still thinking that it has working device,
> which isn't true anymore due to disabled BARs.
> 
> Fix it by honoring PCI_EXP_SLTCAP_PCP and updating power status
> only if capability is enabled. Follow up patch will disable
> PCI_EXP_SLTCAP_PCP overriding COMPAT_PROP_PCP property when
> PCIe slot is under ACPI PCI hotplug control.
> 
> See [3] for reproducer.
> 
> 1)
> Fixes: commit d5daff7d312 (pcie: implement slot power control for pcie root ports)
> 2)
>        commit 23786d13441 (pci: implement power state)
> 3)
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2053584
> 


Correct format for the last paragraph:


Fixes: d5daff7d312 ("pcie: implement slot power control for pcie root ports")
Fixes: 23786d13441 ("pci: implement power state")
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2053584

> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/pci/pcie.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index d7d73a31e4..2339729a7c 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -383,10 +383,9 @@ static void pcie_cap_update_power(PCIDevice *hotplug_dev)
>  
>      if (sltcap & PCI_EXP_SLTCAP_PCP) {
>          power = (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON;
> +        pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> +                            pcie_set_power_device, &power);
>      }
> -
> -    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
> -                        pcie_set_power_device, &power);

I think this is correct. However, I wonder whether for 6.2 compatiblity
as a hack we should sometimes skip the power update even when
PCI_EXP_SLTCAP_PCP exists. Will that not work around the issue for
these machine types?

And assuming we want bug for bug compat anyway, why not just put
it here? It seems easier to reason about frankly ...

>  }
>  
>  /*
> -- 
> 2.31.1


