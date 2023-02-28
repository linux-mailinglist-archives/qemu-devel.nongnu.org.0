Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753EB6A6074
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 21:37:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX6id-0001M3-OW; Tue, 28 Feb 2023 15:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pX6ib-0001Lj-T1
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:37:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pX6iZ-00047f-Uf
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677616618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h6qSvrnurg9A/O/aIytj2fs4gf9s58sGekBXz57mGj4=;
 b=f/gALsXUGLTaAt2sOa4597KrZUkbdjw+YwjvG+0orjtqWcc4yQ4rqla4Vfz/CpkgBj3W1N
 WwKk1xe6LsrCJHTftOvBxvzt39gmYEdVVyRKowU6xVMLC++GFWy6fqp/n4qvAWdGTkQdIU
 ncIJi8h1paDyavodt61O2xoH315EySU=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-395-vSIk2OpnORKyUqCCpnF-tA-1; Tue, 28 Feb 2023 15:36:56 -0500
X-MC-Unique: vSIk2OpnORKyUqCCpnF-tA-1
Received: by mail-io1-f72.google.com with SMTP id
 k13-20020a5d9d4d000000b0074caed3a2d2so7276757iok.12
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 12:36:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h6qSvrnurg9A/O/aIytj2fs4gf9s58sGekBXz57mGj4=;
 b=XeLGfFgK/rhE2zh/EZ6BgUN+CKuXQOLoUS7koPMFCIGBvT1V6NDpNTvUsgrDZxWwcj
 YkRan8GKUjYj1rLTfZYde4ubD0Au3W10O3ofzSMAcNKezkY0lDsckvs8/Mvhb4ix6BGa
 WJWbnuMDksGevVZUeOr5mXVk+KZF46XUgEUC1EO613QYskKGprrhwFSndehP2VEEABTx
 rO7/RQPEgPqya34eVLWOKDgudGfE0dXShGg6kZ1wPL9N31yXw4E1v194gapMOHuMF72A
 kIA4khJy+Yjq542GsZB2wAjD85qR44MDoWr8rdIwc9PhKMScx3erIhOUVLfMNr/wcQfb
 541Q==
X-Gm-Message-State: AO0yUKWZulhGqxAVTBnYUFvSTQTgoufMZZNTURLXKkbMwryG/PAjRWrU
 HSBWKrwpNozxzm2v4YOVnbEFpzN8TUYHvxAYIiJ1t5DfO37Hx4lf99p6+uhvSOcjaKVky9vkED5
 ucxr3iuoV1nqn/K0=
X-Received: by 2002:a05:6e02:1a0c:b0:315:420e:a77b with SMTP id
 s12-20020a056e021a0c00b00315420ea77bmr3364075ild.10.1677616616122; 
 Tue, 28 Feb 2023 12:36:56 -0800 (PST)
X-Google-Smtp-Source: AK7set+o9JOYe6yY/N93gvnjT7d2CRwnn0PxH1KvLn10mH+k8e4R8yVeAr526gHV2/ZOhSEtVBbVrg==
X-Received: by 2002:a05:6e02:1a0c:b0:315:420e:a77b with SMTP id
 s12-20020a056e021a0c00b00315420ea77bmr3364049ild.10.1677616615574; 
 Tue, 28 Feb 2023 12:36:55 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 b9-20020a92c149000000b00316e54fd7e9sm2974074ilh.9.2023.02.28.12.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 12:36:54 -0800 (PST)
Date: Tue, 28 Feb 2023 13:36:53 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti
 Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v2 10/20] vfio/common: Record DMA mapped IOVA ranges
Message-ID: <20230228133653.2f911490.alex.williamson@redhat.com>
In-Reply-To: <617b396a-d5e2-8c10-9717-1cc6fc9d43dd@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-11-avihaih@nvidia.com>
 <20230222151039.1de95db4.alex.williamson@redhat.com>
 <83238759-4808-1e41-824b-865c330a431a@oracle.com>
 <20230223140527.096dc42b.alex.williamson@redhat.com>
 <a53767f9-b630-8f2e-0523-bd47d4539c61@oracle.com>
 <20230223145018.3c46a966.alex.williamson@redhat.com>
 <617b396a-d5e2-8c10-9717-1cc6fc9d43dd@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Tue, 28 Feb 2023 12:11:06 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 23/02/2023 21:50, Alex Williamson wrote:
> > On Thu, 23 Feb 2023 21:19:12 +0000
> > Joao Martins <joao.m.martins@oracle.com> wrote:  
> >> On 23/02/2023 21:05, Alex Williamson wrote:  
> >>> On Thu, 23 Feb 2023 10:37:10 +0000
> >>> Joao Martins <joao.m.martins@oracle.com> wrote:    
> >>>> On 22/02/2023 22:10, Alex Williamson wrote:    
> >>>>> On Wed, 22 Feb 2023 19:49:05 +0200
> >>>>> Avihai Horon <avihaih@nvidia.com> wrote:      
> >>>>>> From: Joao Martins <joao.m.martins@oracle.com>
> >>>>>> @@ -612,6 +665,16 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
> >>>>>>          .iova = iova,
> >>>>>>          .size = size,
> >>>>>>      };
> >>>>>> +    int ret;
> >>>>>> +
> >>>>>> +    ret = vfio_record_mapping(container, iova, size, readonly);
> >>>>>> +    if (ret) {
> >>>>>> +        error_report("vfio: Failed to record mapping, iova: 0x%" HWADDR_PRIx
> >>>>>> +                     ", size: 0x" RAM_ADDR_FMT ", ret: %d (%s)",
> >>>>>> +                     iova, size, ret, strerror(-ret));
> >>>>>> +
> >>>>>> +        return ret;
> >>>>>> +    }      
> >>>>>
> >>>>> Is there no way to replay the mappings when a migration is started?
> >>>>> This seems like a horrible latency and bloat trade-off for the
> >>>>> possibility that the VM might migrate and the device might support
> >>>>> these features.  Our performance with vIOMMU is already terrible, I
> >>>>> can't help but believe this makes it worse.  Thanks,
> >>>>>       
> >>>>
> >>>> It is a nop if the vIOMMU is being used (entries in container->giommu_list) as
> >>>> that uses a max-iova based IOVA range. So this is really for iommu identity
> >>>> mapping and no-VIOMMU.    
> >>>
> >>> Ok, yes, there are no mappings recorded for any containers that have a
> >>> non-empty giommu_list.
> >>>     
> >>>> We could replay them if they were tracked/stored anywhere.    
> >>>
> >>> Rather than piggybacking on vfio_memory_listener, why not simply
> >>> register a new MemoryListener when migration is started?  That will
> >>> replay all the existing ranges and allow tracking to happen separate
> >>> from mapping, and only when needed.
> >>>     
> >>
> >> The problem with that is that *starting* dirty tracking needs to have all the
> >> range, we aren't supposed to start each range separately. So on a memory
> >> listener callback you don't have introspection when you are dealing with the
> >> last range, do we?  
> > 
> > As soon as memory_listener_register() returns, all your callbacks to
> > build the IOVATree have been called and you can act on the result the
> > same as if you were relying on the vfio mapping MemoryListener.  I'm
> > not seeing the problem.  Thanks,
> >   
> 
> While doing these changes, the nice thing of the current patch is that whatever
> changes apply to vfio_listener_region_add() will be reflected in the mappings
> tree that stores what we will dirty track. If we move the mappings calculation
> necessary for dirty tracking only when we start, we will have to duplicate the
> same checks, and open for bugs where we ask things to be dirty track-ed that
> haven't been DMA mapped. These two aren't necessarily tied, but felt like I
> should raise the potentially duplication of the checks (and the same thing
> applies for handling virtio-mem and what not).
> 
> I understand that if we were going to store *a lot* of mappings that this would
> add up in space requirements. But for no-vIOMMU (or iommu=pt) case this is only
> about 12ranges or so, it is much simpler to piggyback the existing listener.
> Would you still want to move this to its own dedicated memory listener?

Code duplication and bugs are good points, but while typically we're
only seeing a few handfuls of ranges, doesn't virtio-mem in particular
allow that we could be seeing quite a lot more?

We used to be limited to a fairly small number of KVM memory slots,
which effectively bounded non-vIOMMU DMA mappings, but that value is
now 2^15, so we need to anticipate that we could see many more than a
dozen mappings.

Can we make the same argument that the overhead is negligible if a VM
makes use of 10s of GB of virtio-mem with 2MB block size?

But then on a 4KB host we're limited to 256 tracking entries, so
wasting all that time and space on a runtime IOVATree is even more
dubious.

In fact, it doesn't really matter that vfio_listener_region_add and
this potentially new listener come to the same result, as long as the
new listener is a superset of the existing listener.  So I think we can
simplify out a lot of the places we'd see duplication and bugs.  I'm
not even really sure why we wouldn't simplify things further and only
record a single range covering the low and high memory marks for a
non-vIOMMU VMs, or potentially an approximation removing gaps of 1GB or
more, for example.  Thanks,

Alex


