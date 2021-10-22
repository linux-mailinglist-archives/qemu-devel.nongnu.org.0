Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 571E5437014
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 04:38:49 +0200 (CEST)
Received: from localhost ([::1]:43046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdkSG-0000iH-0v
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 22:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdkRM-0008TL-Lo
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 22:37:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdkRK-0007n0-0l
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 22:37:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634870268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dy8EyJYyun1MoOv1B5qDFWVweyiCWIUEwcb0C1sKxpg=;
 b=NRyLVikAs13s093MebRF9BNWtv14WAYbx83s8XHbsHbX88w4KVQu/QIn/9OW8QPP5wmekY
 +qjhJO6x0sYskfskM4vR8OwzGuTV0PSu4FbyveU+ctIKU+qt0dznvwsPEpxr36AgjpTOK6
 LLbeUb4s+v94Hp2BPE8R2Ngf0cI6Ci8=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-Z9QTdA5UOYCPBhQ_7WkVEg-1; Thu, 21 Oct 2021 22:37:47 -0400
X-MC-Unique: Z9QTdA5UOYCPBhQ_7WkVEg-1
Received: by mail-pf1-f197.google.com with SMTP id
 y124-20020a623282000000b0047a09271e49so1154395pfy.16
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 19:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dy8EyJYyun1MoOv1B5qDFWVweyiCWIUEwcb0C1sKxpg=;
 b=N01JggTYSL/Cgc+4irM7LbsFKdRylRTFClAW8bsA3IsD9WMkyGdx9sVq0W1FoX/EWh
 Zh3H3o1P7sNIsf3kNS7wv5hLpouJvjnDy8EHG37zc9NfGxqxi4Iz/AGW+fcwL//BUV9z
 zoh+3udVW/cdYtnVp4bBTAqhNse1eucY5/NPS/lvu+dpSo7nqskRsN6pPsYUXaRT8hBL
 24g91Kj6Oh2KCdjIMtKIU4brCAtkLZM9QfRMKZreNaftWtf2VDUpgdbo/POOnmzonkAK
 V71p9nxzOVBRFWD4K9MpSv5s1iD2sF+I0Zx7Imb1+fkjrn3MmRapdcOcgR/QLcL5bHi9
 dDBg==
X-Gm-Message-State: AOAM533H8e5hgptCAf6nrGfZ5w1Kt511ljdv27nOKn1DVrBMCXftRVSu
 NVIf5Ejo9UDK3wK22Onm9eFyeD9E/jodn1Lju9Yits86jGOP4G3dxoEBprCloPvdt78cdkcwrL2
 aPvHC6995IHgKf6s=
X-Received: by 2002:a62:1d04:0:b0:44d:cb39:40f0 with SMTP id
 d4-20020a621d04000000b0044dcb3940f0mr9539790pfd.11.1634870266115; 
 Thu, 21 Oct 2021 19:37:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwntuPnRh1aGlm0I4cAdsrl5KEqZI3Y22FIY7mfX6Xw18SkpYgcauiCzy1UzpUK82dsFrecSA==
X-Received: by 2002:a62:1d04:0:b0:44d:cb39:40f0 with SMTP id
 d4-20020a621d04000000b0044dcb3940f0mr9539762pfd.11.1634870265723; 
 Thu, 21 Oct 2021 19:37:45 -0700 (PDT)
Received: from xz-m1.local ([94.177.118.50])
 by smtp.gmail.com with ESMTPSA id p31sm7448275pfw.201.2021.10.21.19.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 19:37:45 -0700 (PDT)
Date: Fri, 22 Oct 2021 10:37:30 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 8/8] x86-iommu: Fail early if vIOMMU specified after
 vfio-pci
Message-ID: <YXIj3skFTtnoUiWj@xz-m1.local>
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-9-peterx@redhat.com>
 <51201622-3d09-e5cf-9963-692b19450dc0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <51201622-3d09-e5cf-9963-692b19450dc0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 21, 2021 at 02:38:54PM +0200, Eric Auger wrote:
> Hi Peter,
> 
> On 10/21/21 12:42 PM, Peter Xu wrote:
> > Scan the pci bus to make sure there's no vfio-pci device attached before vIOMMU
> > is realized.
> >
> > Suggested-by: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  hw/i386/x86-iommu.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
> > index 86ad03972e..58abce7edc 100644
> > --- a/hw/i386/x86-iommu.c
> > +++ b/hw/i386/x86-iommu.c
> > @@ -21,6 +21,7 @@
> >  #include "hw/sysbus.h"
> >  #include "hw/i386/x86-iommu.h"
> >  #include "hw/qdev-properties.h"
> > +#include "hw/vfio/pci.h"
> >  #include "hw/i386/pc.h"
> >  #include "qapi/error.h"
> >  #include "qemu/error-report.h"
> > @@ -103,6 +104,16 @@ IommuType x86_iommu_get_type(void)
> >      return x86_iommu_default->type;
> >  }
> >  
> > +static void x86_iommu_pci_dev_hook(PCIBus *bus, PCIDevice *dev, void *opaque)
> > +{
> > +    Error **errp = (Error **)opaque;
> > +
> > +    if (object_dynamic_cast(OBJECT(dev), TYPE_VFIO_PCI)) {
> > +        error_setg(errp, "Device '%s' must be specified before vIOMMUs",
> > +                   TYPE_VFIO_PCI);
> if there are several VFIO-PCI devices set before the IOMMU, errp may be
> overriden
> as we do not exit the loop as soon as there is an error I think

Hmm, good point.  I won't worry too much about overriding yet as if there're
more devices violating the rule then reporting any of them should work - then
as the user tune the qemu cmdline it'll finally go right.

But I do see that error_setv() has an assertion on *errp being NULL.. I'll at
least make sure it won't trigger that assert by accident.

Thanks for spotting it!

-- 
Peter Xu


