Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31AD602EB6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:43:36 +0200 (CEST)
Received: from localhost ([::1]:58286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknod-0007ME-9Q
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oknWz-0005oD-RN
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 10:25:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oknWw-0005zN-U3
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 10:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666103116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=410OzJNn04fyP2bq9fmi0u1mwcJsI3OAG1rvBXCANSE=;
 b=M33K64s6sT6/9tAbtA1yMg4d/nHbfq9fzAWcGk5i5m4yddeziWkyJHeKJkCS/rk1nlQ9Tt
 75lX/ytCnuzV8qVj3K5swhvEXTPDfBbMyEiopqAnI3zEeo3oKUQFxOKk9dqMrjcNmQGJgT
 JUc5orHZxv3Ymk9pQHFgPQlRfHQaS0s=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-602-FEJNQsnbNCa1B4HMmitMQA-1; Tue, 18 Oct 2022 10:25:14 -0400
X-MC-Unique: FEJNQsnbNCa1B4HMmitMQA-1
Received: by mail-io1-f69.google.com with SMTP id
 x21-20020a5d9455000000b006bc1172e639so9759864ior.18
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 07:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=410OzJNn04fyP2bq9fmi0u1mwcJsI3OAG1rvBXCANSE=;
 b=iFKPUJn8jouLxei7hJuiQWelVBZg9IZDsDcHlJ2sQ0i38O77INkM9PLaxa2JijkMWr
 7UBaK68MeO7I2nrjnY5N6E7/ARJPOX/6ixhJ1OBTy5APxvbXbNte3vrNk16Mk28iesJM
 2TAyz7A8AwMl+UAum69s2YVuGvkqWAj//PjoYVp/218GZsDtHxjvI5gBH3tcoOgubH4+
 FQUwpMjbGAyBsQfxZmgdemoLmiDNTLTY1m8SN7n5dcaaP/Iyt7KW4T0q7x7ByzVnMsw7
 reBD22wFaf9SINRSuL05WZPwdk8K2ETUssi0BZiFmV18xHCBPEyZRjoG5L9vSeaR6Jyi
 JB0A==
X-Gm-Message-State: ACrzQf3EePAD/eYpo48JtwMvwsornAFP6WYSCce0OliLkF+i8MUvaoTm
 5hhMhwKYCA1ibQwoD9g0HplzmjPJv82cXlK5VqQnDJeFh+dqMvwfl5Vn5waw3+/MBRWBxI3v9mn
 MXAYmFVxe914PshY=
X-Received: by 2002:a05:6e02:1aa8:b0:2fa:5239:c67a with SMTP id
 l8-20020a056e021aa800b002fa5239c67amr1862824ilv.166.1666103114005; 
 Tue, 18 Oct 2022 07:25:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5QwGBtg2Zb2Ij5TlZ2rnZjHwJHU50AAIDQXH24sF8zWowajGiuwHdR41jW8y2e7+ShkgXjLQ==
X-Received: by 2002:a05:6e02:1aa8:b0:2fa:5239:c67a with SMTP id
 l8-20020a056e021aa800b002fa5239c67amr1862805ilv.166.1666103113720; 
 Tue, 18 Oct 2022 07:25:13 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 y4-20020a92d804000000b002f66aacb98asm1019190ilm.70.2022.10.18.07.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 07:25:13 -0700 (PDT)
Date: Tue, 18 Oct 2022 10:25:09 -0400
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, eperezma@redhat.com, jasowang@redhat.com
Subject: Re: [PATCH] vhost: Warn if DEVIOTLB_UNMAP is not supported and ats
 is set
Message-ID: <Y063RZ4SkYcRM+SP@x1n>
References: <20221018122852.1185395-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221018122852.1185395-1-eric.auger@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Eric,

On Tue, Oct 18, 2022 at 02:28:52PM +0200, Eric Auger wrote:
> Since b68ba1ca5767 ("memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP
> IOMMUTLBNotificationType"), vhost attempts to register DEVIOTLB_UNMAP
> notifier. This latter is supported by the intel-iommu which supports
> device-iotlb if the corresponding option is set. Then 958ec334bca3
> ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support") allowed
> silent fallback to the legacy UNMAP notifier if the viommu does not
> support device iotlb.
> 
> Initially vhost/viommu integration was introduced with intel iommu
> assuming ats=on was set on virtio-pci device and device-iotlb was set
> on the intel iommu. vhost acts as an ATS capable device since it
> implements an IOTLB on kernel side. However translated transactions
> that hit the device IOTLB do not transit through the vIOMMU. So this
> requires a limited ATS support on viommu side.
> 
> However, in theory, if ats=on is set on a pci device, the
> viommu should support ATS for that device to work.

Pure question: what will happen if one ATS supported PCI device got plugged
into a system whose physical IOMMU does not support ATS?  Will ATS just be
ignored and the device keep working simply without ATS?

[1]

[...]

> @@ -760,8 +771,16 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>      iommu->iommu_offset = section->offset_within_address_space -
>                            section->offset_within_region;
>      iommu->hdev = dev;
> -    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
> +    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, &err);
>      if (ret) {
> +        if (vhost_dev_ats_enabled(dev)) {
> +            error_reportf_err(err,
> +                              "vhost cannot register DEVIOTLB_UNMAP "
> +                              "although ATS is enabled, "
> +                              "fall back to legacy UNMAP notifier: ");

We want to use the warning message to either remind the user to (1) add the
dev-iotlb=on parameter for vIOMMU, or (2) drop the ats=on on device.  Am I
right?

As we've discussed - I remember Jason used to test with/without dev-iotlb
on vhost on Intel and dev-iotlb is faster on vt-d guest driver than without
it.  So that can make sense to me for (1).  I don't know whether it helps
for (2) because fundamentally it's the same question as [1] above, and
whether that's a legal configuration.

Thanks,

-- 
Peter Xu


