Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFFD4D54A2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 23:32:03 +0100 (CET)
Received: from localhost ([::1]:45680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSRKD-0003bM-3L
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 17:32:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nSRJ4-0002up-0d
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 17:30:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nSRIz-0003UE-K8
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 17:30:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646951444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wYvpMs5zMKSNd5GHrri/lC1+ck3xi1U14UI4yvNd/Cw=;
 b=XzULvI/70frsbMi7OMrrtdhse4MnyiYjwP0m+IrXiuRbj64Te3ZvI39BjMPIJs2ztvliEf
 GSbx3TZcTPFu2/QXuT+Rm2bhuialQzEtA5FqOABHO/9yIZBdka5GLZj4K89Zmsl0OhQFgs
 vMlLJurN6buZUzrNTlxXAMkg/V+LpRA=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-3fX2JIQjO1CpGxzoDgCosQ-1; Thu, 10 Mar 2022 17:30:43 -0500
X-MC-Unique: 3fX2JIQjO1CpGxzoDgCosQ-1
Received: by mail-il1-f199.google.com with SMTP id
 y7-20020a056e02128700b002c62013aaa6so4260260ilq.3
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 14:30:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=wYvpMs5zMKSNd5GHrri/lC1+ck3xi1U14UI4yvNd/Cw=;
 b=0tob5t9MR4LDHduV4cGxqsCMc3m1/iI1pEBo7rkYL703FEZfQsyyEp8mRATm6FZuKM
 JRyPLgo68LT8zunNrnaOfcJY0tXctctKpyqk/MLkpaOspthhvk545c0V/qhjc2g62Vzo
 Z2pe4DBzi8tj6x68Vn8txIe8+CVNkXIc8EPxtDbro5UDHgxzbaVetx5oq6I2tFNLm6xt
 MGp7QQrSOB/MkvU+P+/vvpTtgi6ZjVuEvOgY/AQOr3A2m+EmGqW3cfRR7qvakx9HVPKd
 m39ckaFwk+XOOBRaWWxgR8Hfpy2UbBgxOXGVz4ExAybJIzubaPFNANYKUAcWDxa7j1VS
 BkBg==
X-Gm-Message-State: AOAM530D0iNWyTBuVZXmweP84I8/HMPEPSsvmrjQdNO8D28X7p0QNwzJ
 J+nmMsi7c55h7hOoMZa3NERC4r+d+DLxKcmFfkU0t6932YlyxHYprx/7OVdiLv+ZsbCb5cbhokU
 hTSizeTSzhzr40XA=
X-Received: by 2002:a92:c10c:0:b0:2c6:490:9870 with SMTP id
 p12-20020a92c10c000000b002c604909870mr5294778ile.289.1646951442114; 
 Thu, 10 Mar 2022 14:30:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwc7KOxhKWHMEPzwAiJy7PwQP87JxOWe6qeeQ/Pj+H+1Mc1ucjr46QL9maLYBAwxbyb7qGBEg==
X-Received: by 2002:a92:c10c:0:b0:2c6:490:9870 with SMTP id
 p12-20020a92c10c000000b002c604909870mr5294757ile.289.1646951441739; 
 Thu, 10 Mar 2022 14:30:41 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 q5-20020a92ca45000000b002c67b78ba03sm2353045ilo.65.2022.03.10.14.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 14:30:41 -0800 (PST)
Date: Thu, 10 Mar 2022 15:30:39 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V7 19/29] vfio-pci: cpr part 1 (fd and dma)
Message-ID: <20220310153039.454fd21b.alex.williamson@redhat.com>
In-Reply-To: <588ff54d-e1df-d892-60c5-ac7c143a6e11@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-20-git-send-email-steven.sistare@oracle.com>
 <20220307151610.0d8b2269.alex.williamson@redhat.com>
 <a8de61de-37b9-b88a-ac8c-a94d51a0dc92@oracle.com>
 <20220310113541.47edeb9b.alex.williamson@redhat.com>
 <588ff54d-e1df-d892-60c5-ac7c143a6e11@oracle.com>
Organization: Red Hat
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Mar 2022 14:55:50 -0500
Steven Sistare <steven.sistare@oracle.com> wrote:

> On 3/10/2022 1:35 PM, Alex Williamson wrote:
> > On Thu, 10 Mar 2022 10:00:29 -0500
> > Steven Sistare <steven.sistare@oracle.com> wrote:
> >   
> >> On 3/7/2022 5:16 PM, Alex Williamson wrote:  
> >>> On Wed, 22 Dec 2021 11:05:24 -0800
> >>> Steve Sistare <steven.sistare@oracle.com> wrote:  
> >>>> @@ -1878,6 +1908,18 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
> >>>>  {
> >>>>      int iommu_type, ret;
> >>>>  
> >>>> +    /*
> >>>> +     * If container is reused, just set its type and skip the ioctls, as the
> >>>> +     * container and group are already configured in the kernel.
> >>>> +     * VFIO_TYPE1v2_IOMMU is the only type that supports reuse/cpr.
> >>>> +     * If you ever add new types or spapr cpr support, kind reader, please
> >>>> +     * also implement VFIO_GET_IOMMU.
> >>>> +     */    
> >>>
> >>> VFIO_CHECK_EXTENSION should be able to tell us this, right?  Maybe the
> >>> problem is that vfio_iommu_type1_check_extension() should actually base
> >>> some of the details on the instantiated vfio_iommu, ex.
> >>>
> >>> 	switch (arg) {
> >>> 	case VFIO_TYPE1_IOMMU:
> >>> 		return (iommu && iommu->v2) ? 0 : 1;
> >>> 	case VFIO_UNMAP_ALL:
> >>> 	case VFIO_UPDATE_VADDR:
> >>> 	case VFIO_TYPE1v2_IOMMU:
> >>> 		return (iommu && !iommu->v2) ? 0 : 1;
> >>> 	case VFIO_TYPE1_NESTING_IOMMU:
> >>> 		return (iommu && !iommu->nesting) ? 0 : 1;
> >>> 	...
> >>>
> >>> We can't support v1 if we've already set a v2 container and vice versa.
> >>> There are probably some corner cases and compatibility to puzzle
> >>> through, but I wouldn't think we need a new ioctl to check this.    
> >>
> >> That change makes sense, and may be worth while on its own merits, but does not
> >> solve the problem, which is that qemu will not be able to infer iommu_type in
> >> the future if new types are added.  Given:
> >>   * a new kernel supporting shiny new TYPE1v3
> >>   * old qemu starts and selects TYPE1v2 in vfio_get_iommu_type because it has no
> >>     knowledge of v3
> >>   * live update to qemu which supports v3, which will be listed first in vfio_get_iommu_type.
> >>
> >> Then the new qemu has no way to infer iommu_type.  If it has code that makes 
> >> decisions based on iommu_type (eg, VFIO_SPAPR_TCE_v2_IOMMU in vfio_container_region_add,
> >> or vfio_ram_block_discard_disable, or ...), then new qemu cannot function correctly.
> >>
> >> For that, VFIO_GET_IOMMU would be the cleanest solution, to be added the same time our
> >> hypothetical future developer adds TYPE1v3.  The current inability to ask the kernel
> >> "what are you" about a container feels like a bug to me.  
> > 
> > Hmm, I don't think the kernel has an innate responsibility to remind
> > the user of a configuration that they've already made.    
> 
> No, but it can make userland cleaner.  For example, CRIU checkpoint/restart queries
> the kernel to save process state, and later makes syscalls to restore it.  Where the
> kernel does not export sufficient information, CRIU must provide interpose libraries
> so it can remember state internally on its way to the kernel.  And applications must
> link against the interpose libraries.

The counter argument is that it bloats the kernel to add interfaces to
report back things that userspace should already know.  Which has more
exploit vectors, a new kernel ioctl or yet another userspace library?
 
> > But I also
> > don't follow your TYPE1v3 example.  If we added such a type, I imagine
> > the switch would change to:
> > 
> > 	switch (arg)
> > 	case VFIO_TYPE1_IOMMU:
> > 		return (iommu && (iommu->v2 || iommu->v3) ? 0 : 1;
> > 	case VFIO_UNMAP_ALL:
> > 	case VFIO_UPDATE_VADDR:
> > 		return (iommu && !(iommu-v2 || iommu->v3) ? 0 : 1;
> > 	case VFIO_TYPE1v2_IOMMU:
> > 		return (iommu && !iommu-v2) ? 0 : 1;
> > 	case VFIO_TYPE1v3_IOMMU:
> > 		return (iommu && !iommu->v3) ? 0 : 1;
> > 	...
> > 
> > How would that not allow exactly the scenario described, ie. new QEMU
> > can see that old QEMU left it a v2 IOMMU.  
> 
> OK, that works as long as the switch returns true for all options before
> VFIO_SET_IOMMU is called.  I guess your test for "iommu" above does that,
> which I missed before.  If we are on the same page now, I will modify my
> comment "please also implement VFIO_GET_IOMMU".

Yes, in the above all extensions are supported before the container
type is set, then once set only the relevant extensions are available.

...
> >>>> diff --git a/migration/cpr.c b/migration/cpr.c
> >>>> index 37eca66..cee82cf 100644
> >>>> --- a/migration/cpr.c
> >>>> +++ b/migration/cpr.c
> >>>> @@ -7,6 +7,7 @@
> >>>>  
> >>>>  #include "qemu/osdep.h"
> >>>>  #include "exec/memory.h"
> >>>> +#include "hw/vfio/vfio-common.h"
> >>>>  #include "io/channel-buffer.h"
> >>>>  #include "io/channel-file.h"
> >>>>  #include "migration.h"
> >>>> @@ -101,7 +102,9 @@ void qmp_cpr_exec(strList *args, Error **errp)
> >>>>          error_setg(errp, "cpr-exec requires cpr-save with restart mode");
> >>>>          return;
> >>>>      }
> >>>> -
> >>>> +    if (cpr_vfio_save(errp)) {
> >>>> +        return;
> >>>> +    }    
> >>>
> >>> Why is vfio so unique that it needs separate handlers versus other
> >>> devices?  Thanks,    
> >>
> >> In earlier patches these functions fiddled with more objects, but at this point
> >> they are simple enough to convert to pre_save and post_load vmstate handlers for
> >> the container and group objects.  However, we would still need to call special 
> >> functons for vfio from qmp_cpr_exec:
> >>
> >>   * validate all containers support CPR before we start blasting vaddrs
> >>     However, I could validate all, in every call to pre_save for each container.
> >>     That would be less efficient, but fits the vmstate model.  
> > 
> > Would it be a better option to mirror the migration blocker support, ie.
> > any device that doesn't support cpr registers a blocker and generic
> > code only needs to keep track of whether any blockers are registered.  
> 
> We cannot specifically use migrate_add_blocker(), because it is checked in
> the migration specific function migrate_prepare(), in a layer of functions 
> above the simpler qemu_save_device_state() used in cpr.  But yes, we could
> do something similar for vfio.  Increment a global counter in vfio_realize
> if the container does not support cpr, and decrement it when the container is
> destroyed.  pre_save could just check the counter.

Right, not suggesting to piggyback on migrate_add_blocker() only to use
a similar mechanism.  Only drivers that can't support cpr need register
a blocker but testing for blockers is done generically, not just for
vfio devices.

> >>   * restore all vaddr's if qemu_save_device_state fails.
> >>     However, I could recover for all containers inside pre_save when one container fails.
> >>     Feels strange touching all objects in a function for one, but there is no real
> >>     downside.  
> > 
> > I'm not as familiar as I should be with migration callbacks, thanks to
> > mostly not supporting it for vfio devices, but it seems strange to me
> > that there's no existing callback or notifier per device to propagate
> > save failure.  Do we not at least get some sort of resume callback in
> > that case?  
> 
> We do not:
>     struct VMStateDescription {
>         int (*pre_load)(void *opaque);
>         int (*post_load)(void *opaque, int version_id);
>         int (*pre_save)(void *opaque);
>         int (*post_save)(void *opaque);
> 
> The handler returns an error, which stops further saves and is propagated back
> to the top level caller qemu_save_device_state().
> 
> The vast majority of handlers do not have side effects, with no need to unwind 
> anything on failure.
> 
> This raises another point.  If pre_save succeeds for all the containers,
> but fails for some non-vfio object, then the overall operation is abandoned,
> but we do not restore the vaddr's.  To plug that hole, we need to call the
> unwind code from qmp_cpr_save, or implement your alternative below.

We're trying to reuse migration interfaces, are we also triggering
migration state change notifiers?  ie.
MIGRATION_STATUS_{CANCELLING,CANCELLED,FAILED}  We already hook vfio
devices supporting migration into that notifier to tell the driver to
move the device back to the running state on failure, which seems a bit
unique to vfio devices.  Containers could maybe register their own
callbacks.

> > As an alternative, maybe each container could register a vm change
> > handler that would trigger reloading vaddrs if we move to a running
> > state and a flag on the container indicates vaddrs were invalidated?
> > Thanks,  
> 
> That works and is modular, but I dislike that it adds checks on the
> happy path for a case that will rarely happen, and it pushes recovery from
> failure further away from the original failure, which would make debugging
> cascading failures more difficult.

Would using the migration notifier move us sufficiently closer to the
failure point?  Otherwise I think you're talking about unwinding all
the containers when any one fails, where you didn't like that object
overreach, or maybe adding an optional callback... but I wonder if the
above notifier essentially already does that.

In any case, I think we have options to either implement new or use
existing notifier-like functionality to avoid all these vfio specific
callouts.  Thanks,

Alex


