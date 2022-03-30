Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395194EC509
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:57:27 +0200 (CEST)
Received: from localhost ([::1]:39386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZXt8-0005dd-9m
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:57:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZXpF-0002gm-KU
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:53:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZXpA-0003v2-HX
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:53:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648644799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cqz1wM/eHmwo4ZsjupNK2GLqQ9tf8MZ6wU86LaznZLU=;
 b=Khi72Og4aJBKhyKa6f4cRLGfX86+46jU5BRclcA7PKaiTlJI7GpdMD/QKaAVw8ChE33dEE
 W4lg8ap0xH9hNLo+ev4P4xZpvALSdciPaa8tCuXJYeag/QHczLSOvaWm0+PstJIaINkynZ
 S35E1WDPCqFzukYUSBeS0AoGnscHhfU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-m14LGG2XMdOmNbUf8CIwVw-1; Wed, 30 Mar 2022 08:53:18 -0400
X-MC-Unique: m14LGG2XMdOmNbUf8CIwVw-1
Received: by mail-qk1-f197.google.com with SMTP id
 d12-20020a379b0c000000b0067d8cda1aaaso12435478qke.8
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 05:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cqz1wM/eHmwo4ZsjupNK2GLqQ9tf8MZ6wU86LaznZLU=;
 b=3mQJ8iB9Qg43nmwG2mxzZbShDyYN/48P/Q59jcf0yhTa+b6A5OmGTBcoDQYzzl2tE+
 TLL33VVqckiN1YBORGRfWrByxAmAoIFebivknRJW7hCmNTQwEPrco9JoAXJb/KIzFGUy
 /v3K/4mLT3iseNneADM3LslEagvLSFUlgMAD9FYfzk+K2Y5gH0ChwtSWkJliw0kQM13y
 YM9f9kj7X+kHOgy81BQlK2rKH1BClBUnCY9gBbtwYmUTKIIuz7CYn/5Id5gwTQcfb+LO
 H9VXRBcSK0DGdl5o+lLWDmXuw5x413sriBDxuRIO2IucFk3TkwU6I7JExhnIIFmxRZu+
 CMFA==
X-Gm-Message-State: AOAM531/UIpOVEDb1UAaSpwijkyK+22xdF3N3Mx6lXu0YUEAnStJj23D
 NQbyyiDpHq0Cj8HcOG2wES9c9wiF/hsEOYsHr1qUpHBWLcllrvaesXec/FWoi/rfvZwAz/VmZPW
 T1VLTQJBz7xTV6yg=
X-Received: by 2002:a0c:e0d1:0:b0:440:f87b:6da7 with SMTP id
 x17-20020a0ce0d1000000b00440f87b6da7mr30618103qvk.111.1648644798427; 
 Wed, 30 Mar 2022 05:53:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzx+rGaQVhujtDEpuSHkn+lGVdb7mGRll6nUQA0iAHimMfVpiw9Lj1kTY57sWBfSymvSzUrvw==
X-Received: by 2002:a0c:e0d1:0:b0:440:f87b:6da7 with SMTP id
 x17-20020a0ce0d1000000b00440f87b6da7mr30618086qvk.111.1648644798214; 
 Wed, 30 Mar 2022 05:53:18 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05622a138e00b002e1e78c899fsm17743043qtk.53.2022.03.30.05.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 05:53:17 -0700 (PDT)
Date: Wed, 30 Mar 2022 08:53:16 -0400
From: Peter Xu <peterx@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Message-ID: <YkRSvDscyY+c+9yM@xz-m1.local>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <2fdb90acd40a1f79d571d4e68c56e6b08aded60d.1648234157.git.jag.raman@oracle.com>
 <YkL9C+oMUSav9y95@stefanha-x1.localdomain>
 <AC3FD7EB-773E-4684-9A86-176EDDAC135D@oracle.com>
 <YkMcJDFVFu/fW/a5@stefanha-x1.localdomain>
 <7022E4C4-D71A-4A6E-A5D8-222A9462654C@oracle.com>
 <YkQrKI0Az/k8Hc8g@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YkQrKI0Az/k8Hc8g@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 11:04:24AM +0100, Stefan Hajnoczi wrote:
> This makes me wonder whether there is a deeper issue with the
> pci_setup_iommu() API: the lack of per-device cleanup callbacks.
> Per-device IOMMU resources should be freed when a device is hot
> unplugged.
> 
> From what I can tell this is not the case today:
> 
> - hw/i386/intel_iommu.c:vtd_find_add_as() allocates and adds device
>   address spaces but I can't find where they are removed and freed.
>   VTDAddressSpace instances pointed to from vtd_bus->dev_as[] are leaked.
> 
> - hw/i386/amd_iommu.c has similar leaks.

AFAICT it's because there's no device-specific data cached in the
per-device IOMMU address space, at least so far.  IOW, all the data
structures allocated here can be re-used when a new device is plugged in
after the old device unplugged.

It's definitely not ideal since after unplug (and before a new device
plugged in) the resource is not needed at all so it's kind of wasted, but
it should work functionally.  If to achieve that, some iommu_unplug() or
iommu_cleanup() hook sounds reasonable.

One thing I'm not sure is these iommu ops are per-bus not per-device.  So
I'm not sure whether that's what we wanted here because remote device
cleanup seems to be per-device only.

Thanks,

-- 
Peter Xu


