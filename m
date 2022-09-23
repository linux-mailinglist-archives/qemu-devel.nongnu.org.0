Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D065E78D0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 12:53:58 +0200 (CEST)
Received: from localhost ([::1]:37588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obgJg-0000B4-SQ
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 06:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obgDR-0004WZ-Us
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 06:47:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obgDQ-0004W9-BO
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 06:47:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663930046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qr9D2nxa419/6RhWTwJtZgsn+SCyu83SR9F+lYB9nLM=;
 b=bbusqQ+hb0TZWLTq2e/WBmMDdHFiToovxqXvxgRAnzn+hhYF+1eJmbq5h6Mambm56jkYBx
 Oblgwcd3MpT1NSp4aMHuDrJ+Uvn3slmqVtJWpno4HMPt8ql9SMP8buK88aLztfVWkT9Ldc
 3/eHYpIAfFBwm0V0bF7FQAzKDl4zrHc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-AhYSDoibMr-poGDYFle9rA-1; Fri, 23 Sep 2022 06:47:25 -0400
X-MC-Unique: AhYSDoibMr-poGDYFle9rA-1
Received: by mail-wm1-f71.google.com with SMTP id
 h187-20020a1c21c4000000b003b51369ff1bso545999wmh.3
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 03:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Qr9D2nxa419/6RhWTwJtZgsn+SCyu83SR9F+lYB9nLM=;
 b=xXcSgSe8mOGSZoTpwJGZGUX9QL8fOhDg7kDpIigkuU8zG4M4D9zg+qFxEBHr/dkOsO
 z0FpuHD91GcG861lZDa5u7Patx9td07ETEzbgYik0NPdGklTLBiAPOIsUDwwCM5npl0E
 xKa6HGpRFf7+WGD0ADNoXU8L+5iFJ2464PNNkaagf2OSgnYjP9sA+yzUmP8z+uoT8n9k
 gs+dqtqRqf69BdmPHz/gk7fnb/6NI5X0tBbEEhXJSLVnJwnSlR7b4wsdEj0aLVsXRuuf
 xIX2Qkii2ZEZ5OBznUTAPYI41W1mOHeW+1KG+/qs7QmXX8ZYRWB1rjPvUT+q/Xl1Iyfr
 m0kw==
X-Gm-Message-State: ACrzQf22itaSHFflj/UXBvY9AhniUDnt9puZ3yxTaIlsiBzBAdNRqsfg
 pq1TJ64YnRVFh+UX0pLHr6VIW3REFxpjSupvBU4xNgRW5HQ6IS7woqKeeif84O4gXLJEiqJh2Ow
 Rs1AntczF+GZTskE=
X-Received: by 2002:a5d:5232:0:b0:228:6bb8:e985 with SMTP id
 i18-20020a5d5232000000b002286bb8e985mr4874215wra.10.1663930044159; 
 Fri, 23 Sep 2022 03:47:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7oahzqi6gvqJtWwHv1wGKmPcNFzhCGBqcPBy0fWzvOcNz30QeMRmnORWlgetNmzbkUF81SyA==
X-Received: by 2002:a5d:5232:0:b0:228:6bb8:e985 with SMTP id
 i18-20020a5d5232000000b002286bb8e985mr4874202wra.10.1663930043939; 
 Fri, 23 Sep 2022 03:47:23 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-37.web.vodafone.de.
 [109.43.179.37]) by smtp.gmail.com with ESMTPSA id
 n11-20020adfe34b000000b002252ec781f7sm7166167wrj.8.2022.09.23.03.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 03:47:23 -0700 (PDT)
Message-ID: <282102a6-7406-0a7a-2023-d2b9b6e68e36@redhat.com>
Date: Fri, 23 Sep 2022 12:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 farman@linux.ibm.com, pmorel@linux.ibm.com, richard.henderson@linaro.org,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 mst@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <20220902172737.170349-1-mjrosato@linux.ibm.com>
 <20220902172737.170349-3-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v8 2/8] s390x/pci: add routine to get host function handle
 from CLP info
In-Reply-To: <20220902172737.170349-3-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/09/2022 19.27, Matthew Rosato wrote:
> In order to interface with the underlying host zPCI device, we need
> to know it's function handle.  Add a routine to grab this from the

Nit: s/it's/its/

> vfio CLP capabilities chain.
> 
> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-vfio.c         | 83 ++++++++++++++++++++++++++------
>   include/hw/s390x/s390-pci-vfio.h |  5 ++
>   2 files changed, 72 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
> index 6f80a47e29..4bf0a7e22d 100644
> --- a/hw/s390x/s390-pci-vfio.c
> +++ b/hw/s390x/s390-pci-vfio.c
> @@ -124,6 +124,27 @@ static void s390_pci_read_base(S390PCIBusDevice *pbdev,
>       pbdev->zpci_fn.pft = 0;
>   }
>   
> +static bool get_host_fh(S390PCIBusDevice *pbdev, struct vfio_device_info *info,
> +                        uint32_t *fh)
> +{
> +    struct vfio_info_cap_header *hdr;
> +    struct vfio_device_info_cap_zpci_base *cap;
> +    VFIOPCIDevice *vpci =  container_of(pbdev->pdev, VFIOPCIDevice, pdev);

Nit: two spaces after the "="

> +    hdr = vfio_get_device_info_cap(info, VFIO_DEVICE_INFO_CAP_ZPCI_BASE);
> +
> +    /* Can only get the host fh with version 2 or greater */
> +    if (hdr == NULL || hdr->version < 2) {
> +        trace_s390_pci_clp_cap(vpci->vbasedev.name,
> +                               VFIO_DEVICE_INFO_CAP_ZPCI_BASE);
> +        return false;
> +    }
> +    cap = (void *) hdr;
> +
> +    *fh = cap->fh;
> +    return true;
> +}
> +
>   static void s390_pci_read_group(S390PCIBusDevice *pbdev,
>                                   struct vfio_device_info *info)
>   {
> @@ -217,25 +238,13 @@ static void s390_pci_read_pfip(S390PCIBusDevice *pbdev,
>       memcpy(pbdev->zpci_fn.pfip, cap->pfip, CLP_PFIP_NR_SEGMENTS);
>   }
>   
> -/*
> - * This function will issue the VFIO_DEVICE_GET_INFO ioctl and look for
> - * capabilities that contain information about CLP features provided by the
> - * underlying host.
> - * On entry, defaults have already been placed into the guest CLP response
> - * buffers.  On exit, defaults will have been overwritten for any CLP features
> - * found in the capability chain; defaults will remain for any CLP features not
> - * found in the chain.
> - */
> -void s390_pci_get_clp_info(S390PCIBusDevice *pbdev)
> +static struct vfio_device_info *get_device_info(S390PCIBusDevice *pbdev,
> +                                                uint32_t argsz)
>   {
> -    g_autofree struct vfio_device_info *info = NULL;
> +    struct vfio_device_info *info = g_malloc0(argsz);
>       VFIOPCIDevice *vfio_pci;
> -    uint32_t argsz;
>       int fd;
>   
> -    argsz = sizeof(*info);
> -    info = g_malloc0(argsz);
> -
>       vfio_pci = container_of(pbdev->pdev, VFIOPCIDevice, pdev);
>       fd = vfio_pci->vbasedev.fd;
>   
> @@ -250,7 +259,8 @@ retry:
>   
>       if (ioctl(fd, VFIO_DEVICE_GET_INFO, info)) {
>           trace_s390_pci_clp_dev_info(vfio_pci->vbasedev.name);
> -        return;
> +        free(info);

Nit: Please use g_free() for things that you've allocated with g_malloc0().

> +        return NULL;
>       }
>   
>       if (info->argsz > argsz) {
> @@ -259,6 +269,47 @@ retry:
>           goto retry;
>       }
>   
> +    return info;
> +}
...

Apart from the nits, the patch looks fine to me.

  Thomas


