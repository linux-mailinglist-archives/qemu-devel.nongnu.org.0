Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE80C43E638
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:37:48 +0200 (CEST)
Received: from localhost ([::1]:59544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8PR-00018B-QS
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mg80H-00066C-9r
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:11:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mg80D-00077U-NH
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:11:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635437501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zcq4YFOVWM/kGcsh4L98hR6lUc6fwt/lRiMrM7IyWBU=;
 b=LgEAlKBa77xo3BlCT6uwyALoBcXogWTSUi4elXNNnFk1sSL8K9Insj11j/7z8j0jAnQSqU
 swOvvLFW7Y0k3PbYfnkz52nQpR7GijgNOKzLnV07okZrsWOKDkqqTy/UWggi2WfjQWm3n5
 xiZXXSeIaUX1GEV1NEy8xelISJ7ZB/c=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-4xN0_kYfMmeqFeqYsTU19A-1; Thu, 28 Oct 2021 12:11:38 -0400
X-MC-Unique: 4xN0_kYfMmeqFeqYsTU19A-1
Received: by mail-oo1-f70.google.com with SMTP id
 g11-20020a4a924b000000b002b76277c71bso2900475ooh.22
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 09:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zcq4YFOVWM/kGcsh4L98hR6lUc6fwt/lRiMrM7IyWBU=;
 b=FoALKqNF7GSs1qLED8fx2wYXcySvPHWDSP/jifXiMQYZHioVIjw5NUsDIKWRkr11CT
 hjFaTnrt0GJHi3PN9EYbSu2Zs61Dm0AfQijfh6rDcnvL9monfiE3aUsi+sIKPU9Km48/
 w4+99WTNFrWRiPbd/pgLVU0lR7fQ7ZRCN60iex/58kWKpcGy9PevxYAi4QnIIfSUR+2N
 r01zzuO1npo8xM5pHaKinArkd/cp/Z13ZMAMg7zr9KUTuL7q141Cp39KrBZrPlN90Y9a
 FmH0S5Dz+hcHX5iezDiUnIy4RR8fwMRLX6szM2W0S3vxqxsNSDJFaRVcsfdy96fUylRt
 TNyg==
X-Gm-Message-State: AOAM531PDFmAinfvLsho2Z4Ftjh6z55umhezf7GkojUVDa88Leqaj1Ww
 ldT9OntABWsTWKQhgDwVmq+mRTSteAzmDKD8BMhfIqYVJmiCmVd0MqRFCPkMzlrWpm5UrPlWvMg
 LfJnEnTyB4sQD1gA=
X-Received: by 2002:aca:606:: with SMTP id 6mr3865359oig.82.1635437497572;
 Thu, 28 Oct 2021 09:11:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKksyD9U5/pbdsloURINgjV509to/REhTGI7bPDAtInSt0OOBA8CRiJAOzg+3T1a5qmYOUVA==
X-Received: by 2002:aca:606:: with SMTP id 6mr3865318oig.82.1635437497263;
 Thu, 28 Oct 2021 09:11:37 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id bp21sm1230693oib.31.2021.10.28.09.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 09:11:36 -0700 (PDT)
Date: Thu, 28 Oct 2021 10:11:35 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 5/5] pc/q35: Add pre-plug hook for x86-iommu
Message-ID: <20211028101135.72672e80.alex.williamson@redhat.com>
In-Reply-To: <YXrDgeembpIiJ0BE@xz-m1.local>
References: <20211028043129.38871-1-peterx@redhat.com>
 <20211028043129.38871-6-peterx@redhat.com>
 <20211028085242.770a9dde.alex.williamson@redhat.com>
 <YXrDgeembpIiJ0BE@xz-m1.local>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Oct 2021 23:36:33 +0800
Peter Xu <peterx@redhat.com> wrote:

> On Thu, Oct 28, 2021 at 08:52:42AM -0600, Alex Williamson wrote:
> > > +void x86_iommu_pre_plug(X86IOMMUState *iommu, Error **errp)
> > > +{
> > > +    bool ambiguous = false;
> > > +    Object *object;
> > > +
> > > +    object = object_resolve_path_type("", TYPE_VFIO_PCI, &ambiguous);
> > > +    if (object || ambiguous) {
> > > +        /* There're one or more vfio-pci devices detected */
> > > +        error_setg(errp, "Please specify all the vfio-pci devices to be after "
> > > +                   "the vIOMMU device");
> > > +    }  
> > 
> > I still really don't buy the argument that vfio-pci is the only driver
> > that does "this thing", therefore we can just look for vfio-pci devices
> > by name rather than try to generically detect devices that have this
> > dependency.  That seems short sighted.
> > 
> > I've already suggested that pci-core could record on the PCIDevice
> > structure if the device address space has been accessed.  We could also
> > do something like create a TYPE_PCI_AS_DEVICE class derived from
> > TYPE_PCI_DEVICE and any PCI drivers that make use of the device address
> > space before machine-init-done would be of this class.  That could even
> > be enforced by pci_device_iommu_address_space() and would allow the
> > same sort of object resolution as used here.  Thanks,  
> 
> Sorry Alex, I didn't receive any follow up so I thought you were fine with it.
> 
> I was always fine with either way, though I think another parent class would be
> an overkill just for this.  Would you think below acceptable?
> 
> ---8<---
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 5cdf1d4298..2156b5d3ed 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3266,6 +3266,7 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
>      pdc->exit = vfio_exitfn;
>      pdc->config_read = vfio_pci_read_config;
>      pdc->config_write = vfio_pci_write_config;
> +    pdc->require_consolidated_iommu_as = true;
>  }
> 
>  static const TypeInfo vfio_pci_dev_info = {
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 6813f128e0..ffddc766ba 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -239,6 +239,14 @@ struct PCIDeviceClass {
>       */
>      bool is_bridge;
> 
> +    /*
> +     * Set this to true when a pci device needs consolidated result from the
> +     * pci_device_iommu_address_space() in its realize() fn.  This also means
> +     * when specified in cmdline, this "-device" parameter needs to be put
> +     * before the vIOMMU devices so as to make it work.
> +     */
> +    bool require_consolidated_iommu_as;

Maybe this is where the naming of the previous attempt along these lines
didn't work.  There's no "consolidation" requirement and the IOMMU is
only related in that it is a driver that provides new address spaces
for devices.  This is why I thought we might be able to make it
automatic if pci_device_iommu_address_space() records that the address
space for a device has been consumed.

What we're trying to describe is that the address space object for a
device must be fixed at the time the device is realized.  Along those
lines, maybe a better name is something like "required_fixed_as_obj".

> +
>      /* rom bar */
>      const char *romfile;
>  };
> ---8<---
> 
> Then I'll need to pick the dropped patch back on pci scanning, since then I
> won't be able to use object_resolve_path_type() anymore, and I'll need to check
> up PCIDeviceClass instead.

Better.  Like the class layering proposal, a downside is that the
driver needs to be aware that it's imposing this requirement to be able
to mark it in the class init function rather than some automatic means,
like an "as_object_consumed" flag set automatically on the device
structure via accessors like pci_device_iommu_address_space().  Thanks,

Alex


