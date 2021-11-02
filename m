Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F063442D86
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:07:03 +0100 (CET)
Received: from localhost ([::1]:40228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsZC-0006oP-N6
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhs4t-0000p5-RA
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:35:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhs4p-0006Wd-Qu
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635852939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LmMvfElX6M+0WYCPcYmQMWdPiGm8k07IOEcDvgd1SxY=;
 b=UmhKxuQ+q4gKOZSX6rAiOeZQ5fMp4qqstKeZdwa7QKlSQGMQUR6GS2TGN/XLohjXfAMQty
 eP3uS9+lbWmKGRlxe614JzMgRa+liFGEp8hdhGpJtyvrvKp445usbGXzntpQ/WnzB0Hnem
 uvzLWywB9gubFclQm2sg1U7arJMwRBY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-ZyPG22-4NGm9b0spL4JHlQ-1; Tue, 02 Nov 2021 07:35:38 -0400
X-MC-Unique: ZyPG22-4NGm9b0spL4JHlQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso989492wms.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LmMvfElX6M+0WYCPcYmQMWdPiGm8k07IOEcDvgd1SxY=;
 b=gjsAurcKBMuSysjjzwvLfAWr8UlTAeNqicA35RUqR0yFsXAcZCD3j3yE5o+MLOsMce
 daDO6x6SyIjLHQzQXlQ1iiAaaSM8Mp5qejZ7KNztd4ciJmwUDgB9Q8ee7X585PkUimek
 Qt8TQIrxtqK42LERZnd0zM411PEd1rd15DgQ8v1EML3aTdmyWxR/yuu9c0KTnAyVJ8YT
 GfJPOs5jPMFE4hTY4JaquJ5mEyIsjSvS17ZNoLaIsO1gYW2jp81dj5LvMMdxFH7b5Red
 ZFwoEwETLVvIEgfoGlzUCMreEDR8QwotC7zXaWeHN6u1fDdb4L+O9/sUcFgfMS03qB0O
 qKcg==
X-Gm-Message-State: AOAM532IVKieyI8sQzQ+Q5pO8b+vRnG5BAAOZhqODz3rMfYfYb8DvwFd
 +lqTxSRhms+bbZLPU50H4d0TBdLexNfwtEXDAXjmXfRDgZDIRUtI2xPoATMnjQfFUpDFRkgjYJB
 F9zexFpy2+fKRX5Y=
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr47330392wru.242.1635852936889; 
 Tue, 02 Nov 2021 04:35:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPGl4SyFSPG9ZM0E/Oj2KRRGHWrzU20lxdKAhKtxgtI9RAzppH5ex8ctP1VZa3BxTTX/bRIQ==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr47330357wru.242.1635852936676; 
 Tue, 02 Nov 2021 04:35:36 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207e:c1:107d:c1da:65:fcb8])
 by smtp.gmail.com with ESMTPSA id o20sm2145924wmq.47.2021.11.02.04.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:35:36 -0700 (PDT)
Date: Tue, 2 Nov 2021 07:35:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 00/12] virtio-mem: Expose device memory via multiple
 memslots
Message-ID: <20211102072843-mutt-send-email-mst@kernel.org>
References: <20211027124531.57561-1-david@redhat.com>
 <20211101181352-mutt-send-email-mst@kernel.org>
 <a5c94705-b66d-1b19-1c1f-52e99d9dacce@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a5c94705-b66d-1b19-1c1f-52e99d9dacce@redhat.com>
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

On Tue, Nov 02, 2021 at 09:33:55AM +0100, David Hildenbrand wrote:
> On 01.11.21 23:15, Michael S. Tsirkin wrote:
> > On Wed, Oct 27, 2021 at 02:45:19PM +0200, David Hildenbrand wrote:
> >> This is the follow-up of [1], dropping auto-detection and vhost-user
> >> changes from the initial RFC.
> >>
> >> Based-on: 20211011175346.15499-1-david@redhat.com
> >>
> >> A virtio-mem device is represented by a single large RAM memory region
> >> backed by a single large mmap.
> >>
> >> Right now, we map that complete memory region into guest physical addres
> >> space, resulting in a very large memory mapping, KVM memory slot, ...
> >> although only a small amount of memory might actually be exposed to the VM.
> >>
> >> For example, when starting a VM with a 1 TiB virtio-mem device that only
> >> exposes little device memory (e.g., 1 GiB) towards the VM initialliy,
> >> in order to hotplug more memory later, we waste a lot of memory on metadata
> >> for KVM memory slots (> 2 GiB!) and accompanied bitmaps. Although some
> >> optimizations in KVM are being worked on to reduce this metadata overhead
> >> on x86-64 in some cases, it remains a problem with nested VMs and there are
> >> other reasons why we would want to reduce the total memory slot to a
> >> reasonable minimum.
> >>
> >> We want to:
> >> a) Reduce the metadata overhead, including bitmap sizes inside KVM but also
> >>    inside QEMU KVM code where possible.
> >> b) Not always expose all device-memory to the VM, to reduce the attack
> >>    surface of malicious VMs without using userfaultfd.
> > 
> > I'm confused by the mention of these security considerations,
> > and I expect users will be just as confused.
> 
> Malicious VMs wanting to consume more memory than desired is only
> relevant when running untrusted VMs in some environments, and it can be
> caught differently, for example, by carefully monitoring and limiting
> the maximum memory consumption of a VM. We have the same issue already
> when using virtio-balloon to logically unplug memory. For me, it's a
> secondary concern ( optimizing a is much more important ).
> 
> Some users showed interest in having QEMU disallow access to unplugged
> memory, because coming up with a maximum memory consumption for a VM is
> hard. This is one step into that direction without having to run with
> uffd enabled all of the time.

Sorry about missing the memo - is there a lot of overhead associated
with uffd then?

> ("security is somewhat the wrong word. we won't be able to steal any
> information from the hypervisor.)

Right. Let's just spell it out.
Further, removing memory still requires guest cooperation.

> 
> > So let's say user wants to not be exposed. What value for
> > the option should be used? What if a lower option is used?
> > Is there still some security advantage?
> 
> My recommendation will be to use 1 memslot per gigabyte as default if
> possible in the configuration. If we have a virtio-mem devices with a
> maximum size of 128 GiB, the suggestion will be to use memslots=128.
> Some setups will require less (e.g., vhost-user until adjusted, old
> KVM), some setups can allow for more. I assume that most users will
> later set "memslots=0", to enable auto-detection mode.
> 
> 
> Assume we have a virtio-mem device with a maximum size of 1 TiB and we
> hotplugged 1 GiB to the VM. With "memslots=1", the malicious VM could
> actually access the whole 1 TiB. With "memslots=1024", the malicious VM
> could only access additional ~ 1 GiB. With "memslots=512", ~ 2 GiB.
> That's the reduced attack surface.
> 
> Of course, it's different after we hotunplugged memory, before we have
> VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE support in QEMU, because all memory
> inside the usable region has to be accessible and we cannot "unplug" the
> memslots.
> 
> 
> Note: With upcoming VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE changes in QEMU,
> one will be able to disallow any access for malicious VMs by setting the
> memblock size just as big as the device block size.
> 
> So with a 128 GiB virtio-mem device with memslots=128,block-size=1G, or
> with memslots=1024,block-size=128M we could make it impossible for a
> malicious VM to consume more memory than intended. But we lose
> flexibility due to the block size and the limited number of available
> memslots.
> 
> But again, for "full protection against malicious VMs" I consider
> userfaultfd protection more flexible. This approach here gives some
> advantage, especially when having large virtio-mem devices that start
> out small.
> 
> -- 
> Thanks,
> 
> David / dhildenb


