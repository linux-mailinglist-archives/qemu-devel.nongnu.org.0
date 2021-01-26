Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD64303B63
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:20:55 +0100 (CET)
Received: from localhost ([::1]:48314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MP0-0005TU-O7
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l4MLE-0001k5-Hr
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:17:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l4MLC-0008GQ-Dr
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:17:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611659817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AoGifc2rkC75Dy7IhFqi8Ggd4hCe3dP1tqxVNxHquU0=;
 b=fVvDlll9O52QLmNMWegJzL0l3gJ/swRCqriYEF4rPR3f3LIoUZzGBgBESZuHCBpgxo4apF
 Fx6vteUs7wybMZScxaEz2p417r0TpnQ7FUGH5OeJVVBinpEJG6jHT2Yzs4lG7V+E2OYCXl
 4xn5kwyKRKiZLAUC6+SPGzK9beVbPz0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-qtwpCAISNEOSJHQ4RglyKw-1; Tue, 26 Jan 2021 06:16:55 -0500
X-MC-Unique: qtwpCAISNEOSJHQ4RglyKw-1
Received: by mail-wr1-f71.google.com with SMTP id l7so5261303wrp.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 03:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AoGifc2rkC75Dy7IhFqi8Ggd4hCe3dP1tqxVNxHquU0=;
 b=L7SQ8fyH+y4vNCqVjACq+UkCURS3UURLKyijsDUvd6uaNXPGFl8nUbbv+SWYymYrZz
 RKisGhEYGCM84rskpuaUbntWRnExCUnZUmahFQYMl7LWZUHrbu5D5Bzlyg9xH3cN+cc8
 FLN28TYtAEef3123ht9YS10XImZtf7TDE27t5BRqrTajo+CkAMAGjwwmR5V89jaBeXT2
 gF2XSO7mDtM5cTiqa2OypSaABKV/E9qZY3AHM3zwgivgeXgQ5Ph9j53HJ9k4DLSuQUyR
 PVr4feoy/Z4cACp6U6IJiEDeyxqN1FJW0b8niAsQ47A+MzCNk81SR1RYWfUIQVtjbEEb
 D6ag==
X-Gm-Message-State: AOAM530aziG1VlHIuYb/VT+sd8T+7TTwDSmKVRQc7D7wQwty9x8Sir2n
 LalzOhlv4q/mf/D4TkGXmhFNQeWzjWjXoGmPenykP83bdI5Mly8BzV8JWRfwZMF8hJWHJOEu82a
 UHDCmsFTNi/9vJGY=
X-Received: by 2002:a5d:4e47:: with SMTP id r7mr5524889wrt.312.1611659814178; 
 Tue, 26 Jan 2021 03:16:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynEG8ahkUYzyTcaaLsBw+LLYfzPzgbw/4bzgorDgfdMNE3kBkkM703MixntDmG789DGyh6oQ==
X-Received: by 2002:a5d:4e47:: with SMTP id r7mr5524864wrt.312.1611659813949; 
 Tue, 26 Jan 2021 03:16:53 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id l18sm2713105wme.37.2021.01.26.03.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 03:16:53 -0800 (PST)
Date: Tue, 26 Jan 2021 06:16:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [RFC 4/5] pci: acpi: add _DSM method to PCI devices
Message-ID: <20210126061600-mutt-send-email-mst@kernel.org>
References: <20201222233934.451578-1-imammedo@redhat.com>
 <20201222233934.451578-5-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201222233934.451578-5-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: laine@redhat.com, jusual@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 22, 2020 at 06:39:33PM -0500, Igor Mammedov wrote:
> Implement _DSM according to:
>     PCI Firmware Specification 3.1
>     4.6.7.  DSM for Naming a PCI or PCI Express Device Under
>             Operating Systems
> and wire it up to cold and hot-plugged PCI devices.
> Feature depends on ACPI hotplug being enabled (as that provides
> PCI devices descriptions in ACPI and MMIO registers that are
> reused to fetch acpi-index).
> 
> acpi-index should work for
>   - cold plugged NICs:
>       $QEMU -evice e1000,acpi-index=100
>          => 'eno100'
>   - hot-plugged
>       (monitor) device_add e1000,acpi-index=200,id=remove_me
>          => 'eno200'
>   - replugged
>       (monitor) device_del remove_me
>       (monitor) device_add e1000,acpi-index=1
>          => 'eno1'
> 
> Windows also sees index under "PCI Label Id" field in properties
> dialog but otherwise it doesn't seem to have any effect.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/hw/acpi/pci.h |  1 +
>  hw/acpi/pci.c         | 78 +++++++++++++++++++++++++++++++++++++++++++
>  hw/i386/acpi-build.c  | 21 ++++++++++--
>  3 files changed, 97 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
> index bf2a3ed0ba..5e1eb2a96a 100644
> --- a/include/hw/acpi/pci.h
> +++ b/include/hw/acpi/pci.h
> @@ -34,4 +34,5 @@ typedef struct AcpiMcfgInfo {
>  } AcpiMcfgInfo;
>  
>  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info);
> +Aml *aml_pci_device_dsm(void);
>  #endif
> diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
> index 07d5101d83..6d49d515d3 100644
> --- a/hw/acpi/pci.c
> +++ b/hw/acpi/pci.c
> @@ -65,3 +65,81 @@ bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
>       AcpiPciHpState *s = opaque;
>       return s->acpi_index;
>  }
> +
> +Aml *aml_pci_device_dsm(void)
> +{
> +    Aml *method, *UUID, *ifctx, *ifctx1, *ifctx2, *ifctx3, *elsectx;

s/UUID/uuid/ I think ...

And can we move ifctx things to the correct scope?

> +    Aml *acpi_index = aml_local(0);
> +    Aml *zero = aml_int(0);
> +    Aml *bnum = aml_arg(4);
> +    Aml *sun = aml_arg(5);
> +
> +    method = aml_method("PDSM", 6, AML_SERIALIZED);
> +
> +    /*
> +     * PCI Firmware Specification 3.1
> +     * 4.6.  _DSM Definitions for PCI
> +     */
> +    UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
> +    ifctx = aml_if(aml_equal(aml_arg(0), UUID));
> +    {
> +        aml_append(ifctx, aml_store(aml_call2("AIDX", bnum, sun), acpi_index));
> +        ifctx1 = aml_if(aml_equal(aml_arg(2), zero));
> +        {
> +            uint8_t byte_list[1];
> +
> +            ifctx2 = aml_if(aml_equal(aml_arg(1), aml_int(2)));
> +            {
> +                /*
> +                 * advertise function 7 if device has acpi-index
> +                 */
> +                ifctx3 = aml_if(aml_lnot(aml_equal(acpi_index, zero)));
> +                {
> +                    byte_list[0] =
> +                        1 /* have supported functions */ |
> +                        1 << 7 /* support for function 7 */
> +                    ;
> +                    aml_append(ifctx3, aml_return(aml_buffer(1, byte_list)));
> +                }
> +                aml_append(ifctx2, ifctx3);
> +             }
> +             aml_append(ifctx1, ifctx2);
> +
> +             byte_list[0] = 0; /* nothing supported */
> +             aml_append(ifctx1, aml_return(aml_buffer(1, byte_list)));
> +         }
> +         aml_append(ifctx, ifctx1);
> +         elsectx = aml_else();
> +         /*
> +          * PCI Firmware Specification 3.1
> +          * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
> +          *        Operating Systems
> +          */
> +         ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(7)));
> +         {
> +             Aml *pkg = aml_package(2);
> +             Aml *label = aml_local(2);
> +             Aml *ret = aml_local(1);
> +
> +             aml_append(ifctx1, aml_concatenate(aml_string("PCI Device "),
> +                 aml_to_decimalstring(acpi_index, NULL), label));
> +
> +             aml_append(pkg, zero);
> +             aml_append(pkg, aml_string("placeholder"));
> +             aml_append(ifctx1, aml_store(pkg, ret));
> +             /*
> +              * update apci-index to actual value
> +              */
> +             aml_append(ifctx1, aml_store(acpi_index, aml_index(ret, zero)));
> +             /*
> +              * update device label to actual value
> +              */
> +             aml_append(ifctx1, aml_store(label, aml_index(ret, aml_int(1))));
> +             aml_append(ifctx1, aml_return(ret));
> +         }
> +         aml_append(elsectx, ifctx1);
> +         aml_append(ifctx, elsectx);
> +    }
> +    aml_append(method, ifctx);
> +    return method;
> +}
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 27d2958e25..447ad39c35 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -385,6 +385,13 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>                      aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
>                  );
>                  aml_append(dev, method);
> +                method = aml_method("_DSM", 4, AML_SERIALIZED);
> +                aml_append(method,
> +                    aml_return(aml_call6("PDSM", aml_arg(0), aml_arg(1),
> +                                         aml_arg(2), aml_arg(3),
> +                                         aml_name("BSEL"), aml_name("_SUN")))
> +                );
> +                aml_append(dev, method);
>                  aml_append(parent_scope, dev);
>  
>                  build_append_pcihp_notify_entry(notify_method, slot);
> @@ -412,6 +419,14 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>          dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
>          aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
>  
> +        aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
> +        method = aml_method("_DSM", 4, AML_SERIALIZED);
> +        aml_append(method,
> +           aml_return(aml_call6("PDSM", aml_arg(0), aml_arg(1), aml_arg(2),
> +                                aml_arg(3), aml_name("BSEL"), aml_name("_SUN")))
> +        );
> +        aml_append(dev, method);
> +
>          if (pc->class_id == PCI_CLASS_DISPLAY_VGA) {
>              /* add VGA specific AML methods */
>              int s3d;
> @@ -434,9 +449,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>              aml_append(method, aml_return(aml_int(s3d)));
>              aml_append(dev, method);
>          } else if (hotplug_enabled_dev) {
> -            /* add _SUN/_EJ0 to make slot hotpluggable  */
> -            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
> -
> +            /* add _EJ0 to make slot hotpluggable  */
>              method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
>              aml_append(method,
>                  aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
> @@ -1142,6 +1155,8 @@ static void build_piix4_pci_hotplug(Aml *table)
>      aml_append(method, aml_return(aml_local(0)));
>      aml_append(scope, method);
>  
> +    aml_append(scope, aml_pci_device_dsm());
> +
>      aml_append(table, scope);
>  }
>  
> -- 
> 2.27.0


