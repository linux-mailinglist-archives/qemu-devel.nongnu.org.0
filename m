Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E646FC2FE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:41:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJpH-0000Wp-MI; Tue, 09 May 2023 05:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pwJpE-0000WL-W5
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:40:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pwJpD-0003KG-0M
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:40:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683625201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=55ux2OYcQ8uWOIDgk0SSTTuHloFisoKUs+LhVJyCngo=;
 b=KLFqpwcgIYq+4AWdEWh10k4xbN6FVKIE46hJRtjYGIcDYTkmv4qlesWVxTmcWeHufKqolV
 BWN2PHeH/mN2ZwD8jv9HVwOGou774SGoq5d93O4cuuN+6+HhVs48NGfGvUTuvU7iiPVaSs
 vBXTk3QEacE6Su9vu+X9mirSR+chTIQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-JAFd4xG0P7K7Z_u8EkXIQg-1; Tue, 09 May 2023 05:40:00 -0400
X-MC-Unique: JAFd4xG0P7K7Z_u8EkXIQg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f423d47945so8619505e9.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683625199; x=1686217199;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=55ux2OYcQ8uWOIDgk0SSTTuHloFisoKUs+LhVJyCngo=;
 b=X+KVF7xX7qXZmoRHOsBUIiXLnT3MAB/MXPFehEPCe2imf5mdxmkDImatSSI50/mXOQ
 boek+JBQIwO5veF76Jjncx11xf8H93UCpDqjy7BuaaWTvoCi/4rV0TkG/0K0a7YIt9tG
 hglUdNAwqlXSo2GNUCB0PYZNbbXAAHTBhv5ISmPuJYmCe2RC91MUzOgfJeODf+3ILrpk
 mhyeUYUubX20T3n9P7tr6rSMsbJFr52lDMRBmISzPyiKfxtd2R0+HDjO21XufOBlvKCj
 vhrGXz8wlEWBOqKp0xqPGb6M19PqsYEJoJ0/rKzXbxoCOQtOf2/4Nj0JyYypbcmRYEFH
 0+Hw==
X-Gm-Message-State: AC+VfDztPV7KiXHQKj2zONU8sPBwwF4bw6jNOsvmonfBL7+kNvg+en8M
 QsWcvyOr11pya8KxmoJStubfqIGwhg72AxPF9vR6DyqLZ0+tPxBf4tUMnDb1qfYi6ryoRGA3Dj/
 reTmdHkNQpOk3/+5QNlcoYhg=
X-Received: by 2002:a7b:cb8a:0:b0:3f4:2174:b29c with SMTP id
 m10-20020a7bcb8a000000b003f42174b29cmr5615699wmi.20.1683625198778; 
 Tue, 09 May 2023 02:39:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5O7y71MQuOuFBvpTxLbV+m5sswj3n0bh5O0FKOB9+wTBHrKD7t1m9Rfyse9BfYSOWBfo4nxg==
X-Received: by 2002:a7b:cb8a:0:b0:3f4:2174:b29c with SMTP id
 m10-20020a7bcb8a000000b003f42174b29cmr5615692wmi.20.1683625198444; 
 Tue, 09 May 2023 02:39:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a056000018800b002f28de9f73bsm13985163wrx.55.2023.05.09.02.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 02:39:58 -0700 (PDT)
Message-ID: <0e61fc26-369b-3a6a-8001-8be1bb49ff40@redhat.com>
Date: Tue, 9 May 2023 11:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] vfio/pci: Static Resizable BAR capability
To: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
References: <20230505232308.2869912-1-alex.williamson@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230505232308.2869912-1-alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/6/23 01:23, Alex Williamson wrote:
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

> ---
> v2:
>   - Add spec reference
>   - Use PCI_REBAR_CAP_SIZES to check sizes in range
>   - Try to clarify capability bit generation
>   - Rename s/bars/nbar/ to match #defines
>   - More complete masking of NBAR value
> 
>   hw/vfio/pci.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index cf27f28936cb..3ab849767a92 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -2066,6 +2066,54 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
>       return 0;
>   }
>   
> +static int vfio_setup_rebar_ecap(VFIOPCIDevice *vdev, uint16_t pos)
> +{
> +    uint32_t ctrl;
> +    int i, nbar;
> +
> +    ctrl = pci_get_long(vdev->pdev.config + pos + PCI_REBAR_CTRL);
> +    nbar = (ctrl & PCI_REBAR_CTRL_NBAR_MASK) >> PCI_REBAR_CTRL_NBAR_SHIFT;
> +
> +    for (i = 0; i < nbar; i++) {
> +        uint32_t cap;
> +        int size;
> +
> +        ctrl = pci_get_long(vdev->pdev.config + pos + PCI_REBAR_CTRL + (i * 8));
> +        size = (ctrl & PCI_REBAR_CTRL_BAR_SIZE) >> PCI_REBAR_CTRL_BAR_SHIFT;
> +
> +        /* The cap register reports sizes 1MB to 127TB, with 4 reserved bits */

s/127/128/

C.

> +        cap = size <= 27 ? 1U << (size + 4) : 0;
> +
> +        /*
> +         * The PCIe spec (v6.0.1, 7.8.6) requires HW to support at least one
> +         * size in the range 1MB to 512GB.  We intend to mask all sizes except
> +         * the one currently enabled in the size field, therefore if it's
> +         * outside the range, hide the whole capability as this virtualization
> +         * trick won't work.  If >512GB resizable BARs start to appear, we
> +         * might need an opt-in or reservation scheme in the kernel.
> +         */
> +        if (!(cap & PCI_REBAR_CAP_SIZES)) {
> +            return -EINVAL;
> +        }
> +
> +        /* Hide all sizes reported in the ctrl reg per above requirement. */
> +        ctrl &= (PCI_REBAR_CTRL_BAR_SIZE |
> +                 PCI_REBAR_CTRL_NBAR_MASK |
> +                 PCI_REBAR_CTRL_BAR_IDX);
> +
> +        /*
> +         * The BAR size field is RW, however we've mangled the capability
> +         * register such that we only report a single size, ie. the current
> +         * BAR size.  A write of an unsupported value is undefined, therefore
> +         * the register field is essentially RO.
> +         */
> +        vfio_add_emulated_long(vdev, pos + PCI_REBAR_CAP + (i * 8), cap, ~0);
> +        vfio_add_emulated_long(vdev, pos + PCI_REBAR_CTRL + (i * 8), ctrl, ~0);
> +    }
> +
> +    return 0;
> +}
> +
>   static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
>   {
>       PCIDevice *pdev = &vdev->pdev;
> @@ -2139,9 +2187,13 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
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


