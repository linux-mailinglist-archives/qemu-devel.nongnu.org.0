Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BA3443455
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 18:08:47 +0100 (CET)
Received: from localhost ([::1]:37834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhxHC-0004KN-KI
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 13:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhxF1-0002Ky-Db
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:06:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhxEy-0008VF-Ml
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:06:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635872785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xd9OP13HrszSg6dpANSLXHBMip4qKz84tpPndl2POUM=;
 b=iha9LRHDe2P2ZiyyW/pRr/Jt2P4wcKpcyXWEr15XkZbYUwRLKNc/gMRU+VFHgwv7G+DpLM
 vQMhzG/rj0LgYGlRqa+T7RJIOhMZu+uPmRvOgBbGSoqFRhs9NXGUWThJhK/2IXcHAu4Evb
 TX808w1yWzikGHmhjknCjhADoIJKWaM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-lw-xjjyJM7KDUlX5PJZCVQ-1; Tue, 02 Nov 2021 13:06:22 -0400
X-MC-Unique: lw-xjjyJM7KDUlX5PJZCVQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 z1-20020a05640235c100b003e28c89743bso6504375edc.22
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 10:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xd9OP13HrszSg6dpANSLXHBMip4qKz84tpPndl2POUM=;
 b=E/zOU+4CNIxVwq85p7xEvfmB6ud/QS1nbDfJfwc5+fP7AwDfR3A15uGgiADsOxzrE6
 Gyn0NNHyvpHKEord1o6G6yyP0yJG4b8dOSiOwM+4PCxZzaIlABppBWEE8fEMUEdP+0yr
 971OZ0B9GMxK5TPGwUV4doz9tB9UftMPKIb4g/R0c/IqxcULewq47x3l0g8vyZ16TJqu
 shvpe1HY1P9KBsH3hdUGUw0aDONPoDv9MnAVK9Eb+jBa+EJ7pPYqqRrcJQHMj5RicCZE
 2PtR2k73sleWT/Ca7RYYuJyTdRMdvvZ7xi5uhHuajsKVpXq4tuiTbDXfsEXzCToYbwuf
 DWwQ==
X-Gm-Message-State: AOAM532O4HLgMM8Iykm0MLdkT2rk781lKiovoWTwVrQMblA3dD6zuIgV
 klMXZ+4jf0lVrLv8V7YPRm0BTUGGf18qFgWnQ/S2yUMLvEEDidd6SALA7V2asL9wJS68mjwpHnm
 I9wo6P/AeZjgeuJk=
X-Received: by 2002:aa7:cd99:: with SMTP id x25mr7748287edv.249.1635872781649; 
 Tue, 02 Nov 2021 10:06:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoCFjx5agNfL7+P2Z10UjLjkgCtogz6su4lWXdZsqYEUrGIj8xKLzPR6gGlbBVLURar+RlCg==
X-Received: by 2002:aa7:cd99:: with SMTP id x25mr7748237edv.249.1635872781334; 
 Tue, 02 Nov 2021 10:06:21 -0700 (PDT)
Received: from redhat.com ([2.55.17.31])
 by smtp.gmail.com with ESMTPSA id ga1sm8709229ejc.100.2021.11.02.10.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 10:06:20 -0700 (PDT)
Date: Tue, 2 Nov 2021 13:06:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 00/12] virtio-mem: Expose device memory via multiple
 memslots
Message-ID: <20211102111228-mutt-send-email-mst@kernel.org>
References: <20211027124531.57561-1-david@redhat.com>
 <20211101181352-mutt-send-email-mst@kernel.org>
 <a5c94705-b66d-1b19-1c1f-52e99d9dacce@redhat.com>
 <20211102072843-mutt-send-email-mst@kernel.org>
 <171c8ed0-d55e-77ef-963b-6d836729ef4b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <171c8ed0-d55e-77ef-963b-6d836729ef4b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 02, 2021 at 12:55:17PM +0100, David Hildenbrand wrote:
> On 02.11.21 12:35, Michael S. Tsirkin wrote:
> > On Tue, Nov 02, 2021 at 09:33:55AM +0100, David Hildenbrand wrote:
> >> On 01.11.21 23:15, Michael S. Tsirkin wrote:
> >>> On Wed, Oct 27, 2021 at 02:45:19PM +0200, David Hildenbrand wrote:
> >>>> This is the follow-up of [1], dropping auto-detection and vhost-user
> >>>> changes from the initial RFC.
> >>>>
> >>>> Based-on: 20211011175346.15499-1-david@redhat.com
> >>>>
> >>>> A virtio-mem device is represented by a single large RAM memory region
> >>>> backed by a single large mmap.
> >>>>
> >>>> Right now, we map that complete memory region into guest physical addres
> >>>> space, resulting in a very large memory mapping, KVM memory slot, ...
> >>>> although only a small amount of memory might actually be exposed to the VM.
> >>>>
> >>>> For example, when starting a VM with a 1 TiB virtio-mem device that only
> >>>> exposes little device memory (e.g., 1 GiB) towards the VM initialliy,
> >>>> in order to hotplug more memory later, we waste a lot of memory on metadata
> >>>> for KVM memory slots (> 2 GiB!) and accompanied bitmaps. Although some
> >>>> optimizations in KVM are being worked on to reduce this metadata overhead
> >>>> on x86-64 in some cases, it remains a problem with nested VMs and there are
> >>>> other reasons why we would want to reduce the total memory slot to a
> >>>> reasonable minimum.
> >>>>
> >>>> We want to:
> >>>> a) Reduce the metadata overhead, including bitmap sizes inside KVM but also
> >>>>    inside QEMU KVM code where possible.
> >>>> b) Not always expose all device-memory to the VM, to reduce the attack
> >>>>    surface of malicious VMs without using userfaultfd.
> >>>
> >>> I'm confused by the mention of these security considerations,
> >>> and I expect users will be just as confused.
> >>
> >> Malicious VMs wanting to consume more memory than desired is only
> >> relevant when running untrusted VMs in some environments, and it can be
> >> caught differently, for example, by carefully monitoring and limiting
> >> the maximum memory consumption of a VM. We have the same issue already
> >> when using virtio-balloon to logically unplug memory. For me, it's a
> >> secondary concern ( optimizing a is much more important ).
> >>
> >> Some users showed interest in having QEMU disallow access to unplugged
> >> memory, because coming up with a maximum memory consumption for a VM is
> >> hard. This is one step into that direction without having to run with
> >> uffd enabled all of the time.
> > 
> > Sorry about missing the memo - is there a lot of overhead associated
> > with uffd then?
> 
> When used with huge/gigantic pages, we don't particularly care.
> 
> For other memory backends, we'll have to route any population via the
> uffd handler: guest accesses a 4k page -> place a 4k page from user
> space. Instead of the kernel automatically placing a THP, we'd be
> placing single 4k pages and have to hope the kernel will collapse them
> into a THP later.

How much value there is in a THP given it's not present?


> khugepagd will only collapse into a THP if all affected page table
> entries are present and don't map the zero page, though.
> 
> So we'll most certainly use less THP for our VM and VM startup time
> ("first memory access after plugging memory") can be slower.
> 
> I have prototypes for it, with some optimizations (e.g., on 4k guest
> access, populate the whole THP area), but we might not want to enable it
> all of the time. (interaction with postcopy has to be fixed, but it's
> not a fundamental issue)
> 
> 
> Extending uffd-based protection for virtio-mem to other processes
> (vhost-user), is a bit more complicated, and I am not 100% sure if it's
> worth the trouble for now. memslots provide at least some high-level
> protection for the important case of having a virtio-mem device to
> eventually hotplug a lot of memory later.
> 
> > 
> >> ("security is somewhat the wrong word. we won't be able to steal any
> >> information from the hypervisor.)
> > 
> > Right. Let's just spell it out.
> > Further, removing memory still requires guest cooperation.
> 
> Right.
> 
> 
> -- 
> Thanks,
> 
> David / dhildenb


