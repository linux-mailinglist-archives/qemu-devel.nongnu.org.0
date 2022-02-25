Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DEA4C4201
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 11:12:48 +0100 (CET)
Received: from localhost ([::1]:52030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNXah-0006GO-Kr
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 05:12:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNXTp-0000Wg-3I
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 05:05:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nNXTf-0006wP-3f
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 05:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645783530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/XHZqk+Uen2Mu8ZMWpNOroFTekAjqxK1x+2lOhDlXCY=;
 b=DpNy6PZcVDchQuQ1jWib3goDreb2jWeJw7BmZeZHujU8Jngmfm9I++h2sts0T8AVWm9dww
 0gWz2iGPH6XFm9djolbSBM46lUPHUR21PPcXcNOxmHA7bWq/4O3+Daib7+9z92cYPJVoVq
 ADSNgQrdvupknrwQ8EOGga5O1W6J/Zg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-qho0Gg6zM4W-8NtJrmmFFQ-1; Fri, 25 Feb 2022 05:05:29 -0500
X-MC-Unique: qho0Gg6zM4W-8NtJrmmFFQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 az39-20020a05600c602700b00380e48f5994so1135102wmb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 02:05:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/XHZqk+Uen2Mu8ZMWpNOroFTekAjqxK1x+2lOhDlXCY=;
 b=4h2FwoQxXazS3/DaD6/6rfJEi0oHs3qJufhot/JkghmU9c7UFhuN68wfKW/yZ4NhCT
 4mgUa+73V/JPQQsbaWtzsum9cw0+l/mAdOmIW8M3Ro1OUANH58QhnkQyMibu1tBtKvBi
 FgZoeyjerCgMogjXx8uHqq9JM/uTqJv6BokRCvaVEfShrPWOOd2PJ9tB6FaXNdRDBe1u
 Typ0T7KG0ZITzuGTeDTkcf7HsONGotnmlwInneIIRQ82/g/o2eAmAo1r5vAARHOC2dap
 VLljxFOnzQq6QebrCbLelsJrFW1O2WhZNIWQMPFaWORwB9Ldwfmi/LPriQ7nLi014Bpg
 AVSg==
X-Gm-Message-State: AOAM533vaPoWfVxg6hW0dCku+nbgeweAOuPvPTfCzE3evtVWNN+TMULx
 SoGTTTnTch/OWL07cOB76/FqJpN7SFjCHxZk9ew1652GprdzkaGjEQhQXR6W9KA9eGpwQSXPCgP
 rg1O+knxJp/ltcJY=
X-Received: by 2002:a5d:4e0e:0:b0:1ed:f5f5:89a0 with SMTP id
 p14-20020a5d4e0e000000b001edf5f589a0mr5094128wrt.525.1645783527800; 
 Fri, 25 Feb 2022 02:05:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6JTfgjIuBRF2vkFkAJ5nu63Cif3rW2ExqV6Ybnd7jS7gMisRYymkDqeZ/psDNLFIMQiAXVA==
X-Received: by 2002:a5d:4e0e:0:b0:1ed:f5f5:89a0 with SMTP id
 p14-20020a5d4e0e000000b001edf5f589a0mr5094113wrt.525.1645783527543; 
 Fri, 25 Feb 2022 02:05:27 -0800 (PST)
Received: from redhat.com ([2.55.145.157]) by smtp.gmail.com with ESMTPSA id
 6-20020a05600c230600b0038115c73362sm1873137wmo.12.2022.02.25.02.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 02:05:27 -0800 (PST)
Date: Fri, 25 Feb 2022 05:05:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 2/4] pcie: update slot power status only is power control
 is enabled
Message-ID: <20220225045956-mutt-send-email-mst@kernel.org>
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
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> only if capability is enabled.
> Follow up patch will disable
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


Hmm I wrote I like it but now I am not sure I understand how does this
patch help fix things.  here is the full function:


static void pcie_cap_update_power(PCIDevice *hotplug_dev)
{
    uint8_t *exp_cap = hotplug_dev->config + hotplug_dev->exp.exp_cap;
    PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(hotplug_dev));
    uint32_t sltcap = pci_get_long(exp_cap + PCI_EXP_SLTCAP);
    uint16_t sltctl = pci_get_word(exp_cap + PCI_EXP_SLTCTL);
    bool power = true;

    if (sltcap & PCI_EXP_SLTCAP_PCP) {
        power = (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON;
    }

    pci_for_each_device(sec_bus, pci_bus_num(sec_bus),
                        pcie_set_power_device, &power);
}

I understand the follow up patch, but it looks to me that without the
capability, power is always on.  Why does skipping that help fix
anything?

Thanks,


>  }
>  
>  /*
> -- 
> 2.31.1


