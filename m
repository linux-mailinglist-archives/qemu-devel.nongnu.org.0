Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9D938CF9C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 23:09:11 +0200 (CEST)
Received: from localhost ([::1]:36108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkCOM-0001G1-Ca
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 17:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lkCMs-0000Zo-TB
 for qemu-devel@nongnu.org; Fri, 21 May 2021 17:07:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lkCMp-0000qq-2S
 for qemu-devel@nongnu.org; Fri, 21 May 2021 17:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621631253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V5teRubZh5iPhaJ1XS1fYIjkprDXd6fRQcXtmsJeKDU=;
 b=jB6v9d7cpytuIG+2WVGn7fK/5pahfVBNMgRQLC7cs+YQGa3AhpIYouAwD301FUu1vpCEL1
 GwRlzaenWWTr41JTXdBkMBSJ2inuFygfAyxcSltUJAAIxHy6pCYPFKqf0UGZ5ldlBw3HLy
 jJQa6JtjQeahg9KhSHUxd2M7Yz4jUsk=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-ULgsJTqEOZynoqnzDKMuyA-1; Fri, 21 May 2021 17:07:31 -0400
X-MC-Unique: ULgsJTqEOZynoqnzDKMuyA-1
Received: by mail-ot1-f71.google.com with SMTP id
 f16-20020a0568301c30b0290332c8d61b47so6029366ote.19
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 14:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V5teRubZh5iPhaJ1XS1fYIjkprDXd6fRQcXtmsJeKDU=;
 b=UKHAC7JUvB3cEsoBDwstNDOPANANtpYKdUHh7q4vybxQn5lVAX8Uv+xP2upx9/PLE6
 QoARBGqW7R44ZDVOGO+jTKuGWEpbBe+HXBS7D6Dhyquql2b9JYR5jYJNSSqsCjqiq3Rp
 +1W3f7K9o3dbE17pdPG16DvQFAAhDmVmBEoPoKRFsatmEUc9GghDCFX481/clgagERWo
 P3EMobztaLlt8E7ZmDYVHc9yRmW3orDOAEuOF247MbWA9p4nwptmyb52Dx6p9GozomeQ
 HQLhEAq3cbVpbs4zX/XiJzO++l+n04bRC/lPMbxqqwPN1YAgYZOr4Yr7XHj1O3djERAX
 OxZw==
X-Gm-Message-State: AOAM532MEoKxHtJbM0RdTvcO0C4c+i4E83GO6k8hZ5+zpdhBaDxP045u
 SZi4uve/R0MAh2dZ4iFdSA/TplKaO16NfdUDDOm/qqEoqcuREdydAO1PQWBLmZqpC5k54od+C4q
 xYXA9Du/y2Lk/j18=
X-Received: by 2002:a05:6808:5d8:: with SMTP id
 d24mr3536190oij.49.1621631251067; 
 Fri, 21 May 2021 14:07:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUhjssveAUm0N+datSDmt7qUM7xP3UuPLXqO5vVMvytbTBmkWT0ns4u2c7L2HPc3VRfuMqbQ==
X-Received: by 2002:a05:6808:5d8:: with SMTP id
 d24mr3536170oij.49.1621631250831; 
 Fri, 21 May 2021 14:07:30 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id a18sm1118421oiy.24.2021.05.21.14.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 14:07:30 -0700 (PDT)
Date: Fri, 21 May 2021 15:07:29 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 11/22] vfio-pci: refactor for cpr
Message-ID: <20210521150729.0bb54382.alex.williamson@redhat.com>
In-Reply-To: <2e186496-942f-5c34-48bb-b6362996ce71@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-12-git-send-email-steven.sistare@oracle.com>
 <20210519163852.016aa9dc.alex.williamson@redhat.com>
 <2e186496-942f-5c34-48bb-b6362996ce71@oracle.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 21 May 2021 09:33:13 -0400
Steven Sistare <steven.sistare@oracle.com> wrote:

> On 5/19/2021 6:38 PM, Alex Williamson wrote:
> > On Fri,  7 May 2021 05:25:09 -0700
> > Steve Sistare <steven.sistare@oracle.com> wrote:
> >   
> >> Export vfio_address_spaces and vfio_listener_skipped_section.
> >> Add optional eventfd arg to vfio_add_kvm_msi_virq.
> >> Refactor vector use into a helper vfio_vector_init.
> >> All for use by cpr in a subsequent patch.  No functional change.
> >>
> >> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> >> ---
> >>  hw/vfio/common.c              |  4 ++--
> >>  hw/vfio/pci.c                 | 36 +++++++++++++++++++++++++-----------
> >>  include/hw/vfio/vfio-common.h |  3 +++
> >>  3 files changed, 30 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >> index ae5654f..9220e64 100644
> >> --- a/hw/vfio/common.c
> >> +++ b/hw/vfio/common.c
> >> @@ -42,7 +42,7 @@
> >>  
> >>  VFIOGroupList vfio_group_list =
> >>      QLIST_HEAD_INITIALIZER(vfio_group_list);
> >> -static QLIST_HEAD(, VFIOAddressSpace) vfio_address_spaces =
> >> +VFIOAddressSpaceList vfio_address_spaces =
> >>      QLIST_HEAD_INITIALIZER(vfio_address_spaces);
> >>  
> >>  #ifdef CONFIG_KVM
> >> @@ -534,7 +534,7 @@ static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
> >>      return -1;
> >>  }
> >>  
> >> -static bool vfio_listener_skipped_section(MemoryRegionSection *section)
> >> +bool vfio_listener_skipped_section(MemoryRegionSection *section)
> >>  {
> >>      return (!memory_region_is_ram(section->mr) &&
> >>              !memory_region_is_iommu(section->mr)) ||
> >> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> >> index 5c65aa0..7a4fb6c 100644
> >> --- a/hw/vfio/pci.c
> >> +++ b/hw/vfio/pci.c
> >> @@ -411,7 +411,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
> >>  }
> >>  
> >>  static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
> >> -                                  int vector_n, bool msix)
> >> +                                  int vector_n, bool msix, int eventfd)
> >>  {
> >>      int virq;
> >>  
> >> @@ -419,7 +419,9 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
> >>          return;
> >>      }
> >>  
> >> -    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
> >> +    if (eventfd >= 0) {
> >> +        event_notifier_init_fd(&vector->kvm_interrupt, eventfd);
> >> +    } else if (event_notifier_init(&vector->kvm_interrupt, 0)) {
> >>          return;
> >>      }  
> > 
> > This seems very obfuscated.  The "active" arg of event_notifier_init()
> > just seems to preload the eventfd with a signal.  What does that have
> > to do with an eventfd arg to this function?  What if the first branch
> > returns failure?  
> 
> Perhaps you mis-read the code?  The function called in the first branch is different than
> the function called in the second branch.  And event_notifier_init_fd is void and never fails.
> 
> Eschew obfuscation.
> 
> Gesundheit.

D'oh!  I looked at that so many times trying to figure out what I was
missing and still didn't spot the "_fd" on the first function.  The
fact that @active is an int used as a bool in the non-fd version didn't
help.  Maybe we need our own wrapper just to spread the code out a
bit...

/* Create new or reuse existing eventfd */
static int vfio_event_notifier_init(EventNotifier *e, int fd)
{
    if (fd < 0) {
        return event_notifier_init(e, 0);
    }

    event_notifier_init_fd(e, fd);
    return 0;
}

Or I should just user bigger fonts, but that's somehow more apparent to
me and can be reused below.

> >> @@ -455,6 +457,22 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
> >>      kvm_irqchip_commit_routes(kvm_state);
> >>  }
> >>  
> >> +static void vfio_vector_init(VFIOPCIDevice *vdev, int nr, int eventfd)
> >> +{
> >> +    VFIOMSIVector *vector = &vdev->msi_vectors[nr];
> >> +    PCIDevice *pdev = &vdev->pdev;
> >> +
> >> +    vector->vdev = vdev;
> >> +    vector->virq = -1;
> >> +    if (eventfd >= 0) {
> >> +        event_notifier_init_fd(&vector->interrupt, eventfd);
> >> +    } else if (event_notifier_init(&vector->interrupt, 0)) {
> >> +        error_report("vfio: Error: event_notifier_init failed");
> >> +    }  
> > 
> > Gak, here's that same pattern.
> >   
> >> +    vector->use = true;
> >> +    msix_vector_use(pdev, nr);
> >> +}
> >> +
> >>  static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
> >>                                     MSIMessage *msg, IOHandler *handler)
> >>  {
> >> @@ -466,14 +484,10 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
> >>  
> >>      vector = &vdev->msi_vectors[nr];
> >>  
> >> +    vfio_vector_init(vdev, nr, -1);
> >> +
> >>      if (!vector->use) {
> >> -        vector->vdev = vdev;
> >> -        vector->virq = -1;
> >> -        if (event_notifier_init(&vector->interrupt, 0)) {
> >> -            error_report("vfio: Error: event_notifier_init failed");
> >> -        }
> >> -        vector->use = true;
> >> -        msix_vector_use(pdev, nr);
> >> +        vfio_vector_init(vdev, nr, -1);
> >>      }  
> > 
> > Huh?  That's not at all "no functional change".  Also the branch is
> > entirely dead code now.  
> 
> Good catch, thank you.  This is a rebase error.  The unconditional call to vfio_vector_init
> should not be there.  With that fix, we have:
> 
>     if (!vector->use) {
>         vfio_vector_init(vdev, nr, -1);
>     }
> 
> and there is no functional change; the actions performed in vfio_vector_init are identical to 
> those deleted here.

Yup.

> >>      qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
> >> @@ -491,7 +505,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
> >>          }
> >>      } else {
> >>          if (msg) {
> >> -            vfio_add_kvm_msi_virq(vdev, vector, nr, true);
> >> +            vfio_add_kvm_msi_virq(vdev, vector, nr, true, -1);
> >>          }
> >>      }
> >>  
> >> @@ -641,7 +655,7 @@ retry:
> >>           * Attempt to enable route through KVM irqchip,
> >>           * default to userspace handling if unavailable.
> >>           */
> >> -        vfio_add_kvm_msi_virq(vdev, vector, i, false);
> >> +        vfio_add_kvm_msi_virq(vdev, vector, i, false, -1);
> >>      }  
> > 
> > And then we're not really passing an eventfd anyway :-\  I'm so
> > confused...  
> 
> This patch just adds the eventfd arg.  The next few patches pass valid eventfd's from the
> cpr code paths.

Yeah, I couldn't put the pieces together though after repeatedly
misreading eventfd being used as a bool in event_notifier_init(), even
though -1 here should have clued me in too.  Thanks,

Alex


