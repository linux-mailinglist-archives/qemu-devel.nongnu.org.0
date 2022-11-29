Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B8863C3E0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 16:37:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p02e8-0000kg-Ur; Tue, 29 Nov 2022 10:35:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p02e0-0000ic-7P
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:35:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p02dw-0002Li-KB
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:35:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669736129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2rSdmEKeo583fk6KtvFLBQTQCJ40a7WbnFF6T278PLE=;
 b=RCDREH3SI8bkkHYCrzRvuHhtYlxhtVq+nyT8sKDO+oLcNoXB926ihZTdywBC8fmQ8l/9Rd
 EHczDMw2bSf8MAteAIj7pggDRVdrM6hZJYOVlIeZ2N2ceijRLj29Bd+XYAohDLkJttK0zV
 /jFKYtG/m+QyBKEa28gUP3dM74EG7To=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-155-IR9GY4w5M0ysCMqQIo3Gkw-1; Tue, 29 Nov 2022 10:35:28 -0500
X-MC-Unique: IR9GY4w5M0ysCMqQIo3Gkw-1
Received: by mail-qk1-f200.google.com with SMTP id
 bq13-20020a05620a468d00b006fa5a75759aso30106695qkb.13
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 07:35:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2rSdmEKeo583fk6KtvFLBQTQCJ40a7WbnFF6T278PLE=;
 b=JuOwsYqN3vskYcvC7o/Mlzg15OjW2rTlvoB2dHLNUCrLDmB01BhWxwdx3jOB8/dQNF
 lm4LhNEbN/6mkHoGK9W3ZM8qEGg4Eh/S/of1YOdDxTGJnN0yPkeyhHfGBMb3UF4+F95g
 M13G+JjXA4fHKNJxYNcYENh3rdXuAPJFIPLvXVnR3eZw9HR5TWpl7l8RVlQf9u1cVMNE
 6ALXGMbs9v2oQxbkf65JDGusQVM5OfuD6OQUp72pJT8e3if9ZFtuyAZPdcPDXSEmZX/m
 hC0hjN7dLvmrjUVp0/Vv2P9bWs/izfJBVv214OWsxRfx3GZ6dg5HrYHQx8EN+Qy6NZOi
 fibA==
X-Gm-Message-State: ANoB5plOcJzacDNW+tb/e2OjJ240E5B7YseXM0FifARN8WIJ7snPAkwf
 xBxNK0rtsGgVyY/a2kyUfdq2Git57TXdKqxZ0qFxcB88GuFH/UCoTWItU+isL3K4OGn0QO4xNXo
 OmwjPB3Efss+q7Rc=
X-Received: by 2002:ac8:480b:0:b0:3a5:73ba:6e3d with SMTP id
 g11-20020ac8480b000000b003a573ba6e3dmr38595988qtq.567.1669736127383; 
 Tue, 29 Nov 2022 07:35:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5MOF8kzuo5laMRmVLK7honR0SUxX8CXPMgHo+f92l7uwfs6hAIDGBjsEWskEHD0aHrEcI9Cw==
X-Received: by 2002:ac8:480b:0:b0:3a5:73ba:6e3d with SMTP id
 g11-20020ac8480b000000b003a573ba6e3dmr38595963qtq.567.1669736127084; 
 Tue, 29 Nov 2022 07:35:27 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 q38-20020a05620a2a6600b006b949afa980sm10828256qkp.56.2022.11.29.07.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 07:35:26 -0800 (PST)
Date: Tue, 29 Nov 2022 10:35:25 -0500
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 viktor@daynix.com
Subject: Re: [PATCH 1/3] intel-iommu: fail MAP notifier without caching mode
Message-ID: <Y4YmvYzVGwciJUbk@x1n>
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-2-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221129081037.12099-2-jasowang@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Tue, Nov 29, 2022 at 04:10:35PM +0800, Jason Wang wrote:
> Without caching mode, MAP notifier won't work correctly since guest
> won't send IOTLB update event when it establishes new mappings in the
> I/O page tables. Let's fail the IOMMU notifiers early instead of
> misbehaving silently.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/i386/intel_iommu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index a08ee85edf..9143376677 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3186,6 +3186,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>                           "Snoop Control with vhost or VFIO is not supported");
>          return -ENOTSUP;
>      }
> +    if (!s->caching_mode && (new & IOMMU_NOTIFIER_MAP)) {
> +        error_setg_errno(errp, ENOTSUP,
> +                         "device %02x.%02x.%x requires caching mode",
> +                         pci_bus_num(vtd_as->bus), PCI_SLOT(vtd_as->devfn),
> +                         PCI_FUNC(vtd_as->devfn));
> +        return -ENOTSUP;
> +    }

We used to have that but got reverted because it's too late to fail, so we
moved it over even though not as clean..

https://lore.kernel.org/all/20190916080718.3299-5-peterx@redhat.com/

Thanks,

-- 
Peter Xu


