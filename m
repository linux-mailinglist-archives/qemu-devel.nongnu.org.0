Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E0E487537
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 11:07:38 +0100 (CET)
Received: from localhost ([::1]:42444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5m9o-0005JC-V1
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 05:07:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5m6O-0001qE-UN
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:04:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5m6L-0005wJ-Jz
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641549833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uTSLmTYh+CF8+MFAdILk6LlSUrdjAClKISndAR+Xk/w=;
 b=bgqm31agEbtZvZszIifSGIPFiWiKAiuGijkcVGz785cm04iNKRgzOmUcrePzBb2M6HZJF5
 pBAEf37Aj5O3rHYdD2Uj+MtMBRrbK3Qky+wimrFs+YZ8Ibdi3IGjg+UzyyaVhxfhalpdJy
 41nxBqETLDu9xk7PBH3dBc5ov8RFd9Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-AhSrJt-BMkWtuTbvNFSrgg-1; Fri, 07 Jan 2022 05:03:52 -0500
X-MC-Unique: AhSrJt-BMkWtuTbvNFSrgg-1
Received: by mail-wm1-f70.google.com with SMTP id
 j18-20020a05600c1c1200b003335872db8dso688331wms.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 02:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uTSLmTYh+CF8+MFAdILk6LlSUrdjAClKISndAR+Xk/w=;
 b=BwKHlmR01RscEmG3eVAQcImrpjMvGclh/qKOJFtqsfxQfxFcIABpGHg7kFYSeiFIWE
 sdX/lk0JGKi4vlSVyUegxjNnIWCeIFigQqObRV6H0LwXnTTpRxahbN7tM5A0XJavqKZ2
 HVH88PqH2etXh4Y9oVfaTR8N69a4IhfnxmrM0zyQ7A3fnEilU+rHOms0JAAX0BRHckzO
 PVYAI5Ph5RDXz64q+ZoU7HWsnk0ldDgb/kckk05BoIkvrxrvWY6FrbhuPIzLz+kvk9V1
 rcC88V5gMEzHBl2CjbxhRwXTFQNb93yuhlWZnDTjtsnqi+mMRp44+APQ+r92r+86Hj1a
 7PLg==
X-Gm-Message-State: AOAM530k2QvQCpPVeAw4ktPQROETKAf4hlGpS0AEMvkrFLt2C+MSxRQX
 F4qYrNPAYtFuJ4PzaoQxSRbeJX542s3hHC2QFEQHakpUFSi6lYcsCHIfo+a83d7huxKdHCeWqdR
 73hMBZBn4QchOv6g=
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr10021763wmc.115.1641549830965; 
 Fri, 07 Jan 2022 02:03:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkBp6EbpzYzq0vCApiUOVGpyCuFNjZfFH8/83e9CZwHafUT+aa/EF/gOHf23T5psywihGZKA==
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr10021727wmc.115.1641549830668; 
 Fri, 07 Jan 2022 02:03:50 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id t6sm1829246wry.84.2022.01.07.02.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 02:03:49 -0800 (PST)
Date: Fri, 7 Jan 2022 05:03:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V7 17/29] pci: export functions for cpr
Message-ID: <20220107050334-mutt-send-email-mst@kernel.org>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-18-git-send-email-steven.sistare@oracle.com>
 <20211222180611-mutt-send-email-mst@kernel.org>
 <02a093fe-b2be-2ecb-7ef7-a95c54443894@oracle.com>
 <20220105151427-mutt-send-email-mst@kernel.org>
 <145d70f9-94a5-6693-83cd-02169ee46a8d@oracle.com>
MIME-Version: 1.0
In-Reply-To: <145d70f9-94a5-6693-83cd-02169ee46a8d@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 06, 2022 at 05:48:28PM -0500, Steven Sistare wrote:
> On 1/5/2022 3:16 PM, Michael S. Tsirkin wrote:
> > On Wed, Jan 05, 2022 at 12:22:25PM -0500, Steven Sistare wrote:
> >> On 12/22/2021 6:07 PM, Michael S. Tsirkin wrote:
> >>> On Wed, Dec 22, 2021 at 11:05:22AM -0800, Steve Sistare wrote:
> >>>> Export msix_is_pending, msix_init_vector_notifiers, and pci_update_mappings
> >>>> for use by cpr.  No functional change.
> >>>>
> >>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> >>>
> >>> With things like that, I prefer when the API is exported
> >>> together with the patch that uses it.
> >>> This was I can see why we are exporting these APIs.
> >>> Esp wrt pci_update_mappings, it's designed as an
> >>> internal API.
> >>
> >> Hi Michael, thanks very much for reviewing these patches.
> >>
> >> Serendipitously, I stopped calling pci_update_mappings from vfio code earlier
> >> in the series.  I will revert its scope.
> >>
> >> I would prefer to keep this patch separate from the use of these functions in
> >> "vfio-pci cpr part 2 msi", to make the latter smaller and easier to understand.
> >> How about if I say more in this commit message? :
> >>
> >>   Export msix_is_pending and msix_init_vector_notifiers for use in vfio cpr.
> >>   Both are needed in the vfio-pci post-load function during cpr-load.
> >>   msix_is_pending is checked to enable the PBA memory region.
> >>   msix_init_vector_notifiers is called to register notifier callbacks, without
> >>   the other side effects of msix_set_vector_notifiers.
> >>
> >> - Steve
> > 
> > Well the reason the side effects are there is to avoid losing events,
> > no? I'd like to figure out a bit better why we don't need them,
> 
> Currently I do not call vfio_msix_vector_do_use during resume, but
> instead execute a subset of its actions in vfio_claim_vectors, which is
> defined in vfio-cpr: cpr part 2.
> 
> > and when should users call msix_init_vector_notifiers versus
> > msix_set_vector_notifiers.
> 
> If I call msix_set_vector_notifiers, it calls the use notifier
> vfio_msix_vector_use, which calls vfio_msix_vector_do_use.  The latter
> gets confused and breaks the vectors because vector-related fields are
> only partially initialized.  The details are unimportant, because --
> 
> Instead of adding msix_init_vector_notifiers, I will call
> msix_set_vector_notifiers, but bail from vfio_msix_vector_do_use if resuming.
> Tested and works.
> 
> Thus this patch becomes simply "pci: export msix_is_pending".  I can keep it,
> or fold it into "vfio-pci: cpr part 2 (msi)".  Your call.
> 
> - Steve

Keep it, it's ok.

> >>>> ---
> >>>>  hw/pci/msix.c         | 20 ++++++++++++++------
> >>>>  hw/pci/pci.c          |  3 +--
> >>>>  include/hw/pci/msix.h |  5 +++++
> >>>>  include/hw/pci/pci.h  |  1 +
> >>>>  4 files changed, 21 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> >>>> index ae9331c..73f4259 100644
> >>>> --- a/hw/pci/msix.c
> >>>> +++ b/hw/pci/msix.c
> >>>> @@ -64,7 +64,7 @@ static uint8_t *msix_pending_byte(PCIDevice *dev, int vector)
> >>>>      return dev->msix_pba + vector / 8;
> >>>>  }
> >>>>  
> >>>> -static int msix_is_pending(PCIDevice *dev, int vector)
> >>>> +int msix_is_pending(PCIDevice *dev, unsigned int vector)
> >>>>  {
> >>>>      return *msix_pending_byte(dev, vector) & msix_pending_mask(vector);
> >>>>  }
> >>>> @@ -579,6 +579,17 @@ static void msix_unset_notifier_for_vector(PCIDevice *dev, unsigned int vector)
> >>>>      dev->msix_vector_release_notifier(dev, vector);
> >>>>  }
> >>>>  
> >>>> +void msix_init_vector_notifiers(PCIDevice *dev,
> >>>> +                                MSIVectorUseNotifier use_notifier,
> >>>> +                                MSIVectorReleaseNotifier release_notifier,
> >>>> +                                MSIVectorPollNotifier poll_notifier)
> >>>> +{
> >>>> +    assert(use_notifier && release_notifier);
> >>>> +    dev->msix_vector_use_notifier = use_notifier;
> >>>> +    dev->msix_vector_release_notifier = release_notifier;
> >>>> +    dev->msix_vector_poll_notifier = poll_notifier;
> >>>> +}
> >>>> +
> >>>>  int msix_set_vector_notifiers(PCIDevice *dev,
> >>>>                                MSIVectorUseNotifier use_notifier,
> >>>>                                MSIVectorReleaseNotifier release_notifier,
> >>>> @@ -586,11 +597,8 @@ int msix_set_vector_notifiers(PCIDevice *dev,
> >>>>  {
> >>>>      int vector, ret;
> >>>>  
> >>>> -    assert(use_notifier && release_notifier);
> >>>> -
> >>>> -    dev->msix_vector_use_notifier = use_notifier;
> >>>> -    dev->msix_vector_release_notifier = release_notifier;
> >>>> -    dev->msix_vector_poll_notifier = poll_notifier;
> >>>> +    msix_init_vector_notifiers(dev, use_notifier, release_notifier,
> >>>> +                               poll_notifier);
> >>>>  
> >>>>      if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
> >>>>          (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
> >>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> >>>> index e5993c1..0fd21e1 100644
> >>>> --- a/hw/pci/pci.c
> >>>> +++ b/hw/pci/pci.c
> >>>> @@ -225,7 +225,6 @@ static const TypeInfo pcie_bus_info = {
> >>>>  };
> >>>>  
> >>>>  static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
> >>>> -static void pci_update_mappings(PCIDevice *d);
> >>>>  static void pci_irq_handler(void *opaque, int irq_num, int level);
> >>>>  static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom, Error **);
> >>>>  static void pci_del_option_rom(PCIDevice *pdev);
> >>>> @@ -1366,7 +1365,7 @@ static pcibus_t pci_bar_address(PCIDevice *d,
> >>>>      return new_addr;
> >>>>  }
> >>>>  
> >>>> -static void pci_update_mappings(PCIDevice *d)
> >>>> +void pci_update_mappings(PCIDevice *d)
> >>>>  {
> >>>>      PCIIORegion *r;
> >>>>      int i;
> >>>> diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
> >>>> index 4c4a60c..46606cf 100644
> >>>> --- a/include/hw/pci/msix.h
> >>>> +++ b/include/hw/pci/msix.h
> >>>> @@ -32,6 +32,7 @@ int msix_present(PCIDevice *dev);
> >>>>  bool msix_is_masked(PCIDevice *dev, unsigned vector);
> >>>>  void msix_set_pending(PCIDevice *dev, unsigned vector);
> >>>>  void msix_clr_pending(PCIDevice *dev, int vector);
> >>>> +int msix_is_pending(PCIDevice *dev, unsigned vector);
> >>>>  
> >>>>  int msix_vector_use(PCIDevice *dev, unsigned vector);
> >>>>  void msix_vector_unuse(PCIDevice *dev, unsigned vector);
> >>>> @@ -41,6 +42,10 @@ void msix_notify(PCIDevice *dev, unsigned vector);
> >>>>  
> >>>>  void msix_reset(PCIDevice *dev);
> >>>>  
> >>>> +void msix_init_vector_notifiers(PCIDevice *dev,
> >>>> +                                MSIVectorUseNotifier use_notifier,
> >>>> +                                MSIVectorReleaseNotifier release_notifier,
> >>>> +                                MSIVectorPollNotifier poll_notifier);
> >>>>  int msix_set_vector_notifiers(PCIDevice *dev,
> >>>>                                MSIVectorUseNotifier use_notifier,
> >>>>                                MSIVectorReleaseNotifier release_notifier,
> >>>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> >>>> index e7cdf2d..cc63dd4 100644
> >>>> --- a/include/hw/pci/pci.h
> >>>> +++ b/include/hw/pci/pci.h
> >>>> @@ -910,5 +910,6 @@ extern const VMStateDescription vmstate_pci_device;
> >>>>  
> >>>>  MSIMessage pci_get_msi_message(PCIDevice *dev, int vector);
> >>>>  void pci_set_power(PCIDevice *pci_dev, bool state);
> >>>> +void pci_update_mappings(PCIDevice *d);
> >>>>  
> >>>>  #endif
> >>>> -- 
> >>>> 1.8.3.1
> >>>
> > 


