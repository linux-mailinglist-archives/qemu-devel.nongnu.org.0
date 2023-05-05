Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0BD6F7F1A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 10:30:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puqp4-0003zz-LY; Fri, 05 May 2023 04:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1puqp3-0003zc-2P
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:29:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1puqox-0002xz-Ji
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:29:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683275382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dGBASXstOjNT2b16ZqALRQbH3kdoWdyt8YZrsYYsNm4=;
 b=f4VHex6in8+1+AN/eocdVrKQEkWE50TvjB//IZ6UGPYT0iH31bVDeC6Fh5bK5d37enLOQD
 gZhL5QNpgeoj3UXXlrmFb1SB8qxvtNokYR4ZBGkl3LYjTCQLbaf9CxvVr6XlYm3oyS4eND
 MToKZnQ5k2GyUUkLdwNROfvTzUJQZFY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-IiciK1hzOlyJqtKfaTCZtQ-1; Fri, 05 May 2023 04:29:40 -0400
X-MC-Unique: IiciK1hzOlyJqtKfaTCZtQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f1763fac8bso9755025e9.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 01:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683275379; x=1685867379;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dGBASXstOjNT2b16ZqALRQbH3kdoWdyt8YZrsYYsNm4=;
 b=iFtFUEPOoPCmn3CVMqq0qXDuy4rsOFTrkBIFTi1hiZrr4EMyajbxcW3p0bV5Y2L720
 5Lkw7gkiF1eIWCjDRjXr0vrmRF72j3RHMyqGAhSSKKp7BLdl+SipRF0yGCakvE10JRme
 AT1Bjr/pJu9zTEq9LpPyuzITy9A383VEMPDn6uXMZwaHcDbxSIVcJN/EtiBiEg9bsFWd
 AmBSQxuzZ6wABeHtZ7qPA5Pnle4YFEMYnz7FAWXisnV3ZeZKbfSvd25zJ00hfE+bDQgb
 IwCkJ6q/3UhNXqZpQWL0cmUszO/+4HMrOpg4muJOicpvSfSrP12ctRd2a9v/2oY0mCXA
 eMpw==
X-Gm-Message-State: AC+VfDysi0kNzNIUlsyetQmvIwzfHpZMA7vuHprOxw0XUN067wFJMk8W
 FrR8rDGP2ZzXkiZHP4oeZwZnZXIFwJLqeuzoeMaF5T4VdkEJLIKEox2RRi51WIDZk6DsT+G52GR
 b2vgBq/xF5nG0hWhifHoqPm8=
X-Received: by 2002:a05:600c:215a:b0:3f1:728a:1881 with SMTP id
 v26-20020a05600c215a00b003f1728a1881mr439598wml.31.1683275378741; 
 Fri, 05 May 2023 01:29:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ40k7Z7yBPNzkNsktN4SSvJjJLws7zlXbkSRd8ziyNHOr3P2mMIW+XHcny90cjrbbwKwCkkxg==
X-Received: by 2002:a05:600c:215a:b0:3f1:728a:1881 with SMTP id
 v26-20020a05600c215a00b003f1728a1881mr439586wml.31.1683275378375; 
 Fri, 05 May 2023 01:29:38 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:853d:fa00:c28a:3e3d:34f3:3891?
 ([2a01:cb19:853d:fa00:c28a:3e3d:34f3:3891])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a05600c210400b003f332ecea4csm7215918wml.26.2023.05.05.01.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 01:29:37 -0700 (PDT)
Message-ID: <fca03c69-5a5d-f743-5238-1eb43192226a@redhat.com>
Date: Fri, 5 May 2023 10:29:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] vfio/pci: Static Resizable BAR capability
To: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
References: <20230504204248.2774200-1-alex.williamson@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230504204248.2774200-1-alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 5/4/23 22:42, Alex Williamson wrote:
> The PCI Resizable BAR (ReBAR) capability is currently hidden from the
> VM because the protocol for interacting with the capability does not
> support a mechanism for the device to reject an advertised supported
> BAR size.  However, when assigned to a VM, the act of resizing the
> BAR requires adjustment of host resources for the device, which
> absolutely can fail.  Linux does not currently allow us to reserve
> resources for the device independent of the current usage.
> 
> The only writable field within the ReBAR capability is the BAR Size
> register.  The PCIe spec indicates that when written, the device
> should immediately begin to operate with the provided BAR size.  The
> spec however also notes that software must only write values
> corresponding to supported sizes as indicated in the capability and
> control registers.  Writing unsupported sizes produces undefined
> results.  Therefore, if the hypervisor were to virtualize the
> capability and control registers such that the current size is the
> only indicated available size, then a write of anything other than
> the current size falls into the category of undefined behavior,
> where we can essentially expose the modified ReBAR capability as
> read-only.
> 
> This may seem pointless, but users have reported that virtualizing
> the capability in this way not only allows guest software to expose
> related features as available (even if only cosmetic), but in some
> scenarios can resolve guest driver issues.  Additionally, no
> regressions in behavior have been reported for this change.
> 
> A caveat here is that the PCIe spec requires for compatibility that
> devices report support for a size in the range of 1MB to 512GB,
> therefore if the current BAR size falls outside that range we revert
> to hiding the capability.
> 
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Some more below.

> ---
>   hw/vfio/pci.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index ec9a854361ac..3b4d36ce87bf 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -2066,6 +2066,49 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
>       return 0;
>   }
>   
> +static int vfio_setup_rebar_ecap(VFIOPCIDevice *vdev, uint16_t pos)
> +{
> +    uint8_t bars = pci_get_byte(vdev->pdev.config + pos + PCI_REBAR_CTRL) >>
> +                                                    PCI_REBAR_CTRL_NBAR_SHIFT;
> +    int i;
> +
> +    for (i = 0; i < bars; i++) {
> +        uint32_t cap, ctrl;
> +        uint8_t size;
> +
> +        ctrl = pci_get_long(vdev->pdev.config + pos + PCI_REBAR_CTRL + (i * 8));
> +        size = (ctrl & PCI_REBAR_CTRL_BAR_SIZE) >> PCI_REBAR_CTRL_BAR_SHIFT;
> +
> +        /*
> +         * PCIe spec requires HW to support at least one size in the range 1MB
> +         * to 512GB, we intend to mask all sizes except the one currently
May be mention "7.8.6 Resizable BAR Extended Capability" of the PCIe specs ?
Because the size encoding is different between the CAP and CTRL registers
and the '19' and '+ 4' values below are a bit confusing. I don't see how
to make things better without macros (seems unnecessary as of today)


> +         * enabled in the size field, therefore if it's outside the range,
> +         * hide the whole capability.
> +         */
> +        if (size > 19) {

should we not report a warning ?

Thanks,

C.

> +            return -EINVAL;
> +        }
> +
> +        /* Hide all sizes reported in the ctrl reg per above requirement. */
> +        ctrl &= (PCI_REBAR_CTRL_BAR_SIZE |
> +                 PCI_REBAR_CTRL_NBAR_MASK | PCI_REBAR_CTRL_BAR_IDX);
> +
> +        /* Only the current size is reported in the capabilities register. */
> +        cap = 1 << (4 + size);
> +
> +        /*
> +         * The BAR size field is RW, however we've mangled the capability
> +         * register such that we only report a single size, ie. the current
> +         * BAR size.  A write of an unsupported value is undefined, therefore
> +         * the register field is essentially RO.
> +         */
> +        vfio_add_emulated_long(vdev, pos + PCI_REBAR_CTRL + (i * 8), ctrl, ~0);
> +        vfio_add_emulated_long(vdev, pos + PCI_REBAR_CAP + (i * 8), cap, ~0);
> +    }
> +
> +    return 0;
> +}
> +
>   static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>   {
>       PCIDevice *pdev = &vdev->pdev;
> @@ -2139,9 +2182,13 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>           case 0: /* kernel masked capability */
>           case PCI_EXT_CAP_ID_SRIOV: /* Read-only VF BARs confuse OVMF */
>           case PCI_EXT_CAP_ID_ARI: /* XXX Needs next function virtualization */
> -        case PCI_EXT_CAP_ID_REBAR: /* Can't expose read-only */
>               trace_vfio_add_ext_cap_dropped(vdev->vbasedev.name, cap_id, next);
>               break;
> +        case PCI_EXT_CAP_ID_REBAR:
> +            if (!vfio_setup_rebar_ecap(vdev, next)) {
> +                pcie_add_capability(pdev, cap_id, cap_ver, next, size);
> +            }
> +            break;
>           default:
>               pcie_add_capability(pdev, cap_id, cap_ver, next, size);
>           }


