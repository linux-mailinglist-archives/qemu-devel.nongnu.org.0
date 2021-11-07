Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11485447224
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 09:17:06 +0100 (CET)
Received: from localhost ([::1]:45402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjdMO-0002Vp-Nt
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 03:17:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mjdKV-0001Jt-Dp
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 03:15:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mjdKS-0004Rl-5Z
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 03:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636272902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sb5ScJOCfcawZx/sfwKI0732y92UjDthO+82Xq5q8S4=;
 b=UodpW/uT3Xs+kAXW8BXFTjb0hTigO3UfMH+SiRxfvMlUjy5rmudSJFhHxoEAgUdDx7t+Nq
 7OY8F6msMuOU8ur6mslKix5Z6g+KmjBQ2caH8tMMYA8if49b1Tn2ujjg1XwAF4J2dW6ZuV
 xIl498bBrBnKVCN/97dCIJtslVXdL0g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-RTlv8GloMI-HMNTbMHZYUQ-1; Sun, 07 Nov 2021 03:15:01 -0500
X-MC-Unique: RTlv8GloMI-HMNTbMHZYUQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 w26-20020a056402071a00b003e28a389d04so12375278edx.4
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 01:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sb5ScJOCfcawZx/sfwKI0732y92UjDthO+82Xq5q8S4=;
 b=xbPTNh9iXK/9zhKCP27FUVvPJ1Nr4kgcs+namr6skq9/Cw5E/DaOBlJuHwG92HNmvC
 1P5CRCGl5sfBbhHka2AXKIHEEv17BlqoHjVuXXx/xTVgIEQFDj1YCyURcH0XdjQhJg6r
 Wn1EUQEstm/J5hmdcYmss6fix3QN8svKepnF8ZVPNoLJ2vevU8ta3OznF7X8oKLz9y5R
 XwHja3XBMem4LfGrTO3uv+F7xo9AXTD13yhKLL21SVtrEuto8cp0xOlGJDRFHf+ZAlaV
 JZFMS5jT1SDOeU9FTlNj3LC2CB7JZ99gTF41jkc5yTQtY3INOvmtlgBhzZu0CxiZnoBO
 NADQ==
X-Gm-Message-State: AOAM532jSfNJYw3FSffaS/CKyL+grdS36vL9YV6OAES1MJ5Najibqsso
 iUCBg9KFLG/14zkyq8HOEbz7ryrIvKPVEJG1VIHbBCywrBsLpAFR5OG+1ziLFnlaJ5M/1aTFj8r
 QeFN3mnp+R/tfsc0=
X-Received: by 2002:aa7:c1c3:: with SMTP id d3mr72722365edp.254.1636272899380; 
 Sun, 07 Nov 2021 01:14:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrHMwqlA7tZgYWqHm1y+lFez/vTRrflkJK1iPQRUQpCWwd5km6bEtpl//hSaO5m0v5K7HiLw==
X-Received: by 2002:aa7:c1c3:: with SMTP id d3mr72722327edp.254.1636272899187; 
 Sun, 07 Nov 2021 01:14:59 -0700 (PDT)
Received: from redhat.com ([2.55.155.32])
 by smtp.gmail.com with ESMTPSA id e12sm6384592ejs.86.2021.11.07.01.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 01:14:57 -0700 (PDT)
Date: Sun, 7 Nov 2021 03:14:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 00/12] virtio-mem: Expose device memory via multiple
 memslots
Message-ID: <20211107031316-mutt-send-email-mst@kernel.org>
References: <20211027124531.57561-1-david@redhat.com>
 <20211101181352-mutt-send-email-mst@kernel.org>
 <a5c94705-b66d-1b19-1c1f-52e99d9dacce@redhat.com>
 <20211102072843-mutt-send-email-mst@kernel.org>
 <171c8ed0-d55e-77ef-963b-6d836729ef4b@redhat.com>
 <20211102111228-mutt-send-email-mst@kernel.org>
 <e4b63a74-57ad-551c-0046-97a02eb798e5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e4b63a74-57ad-551c-0046-97a02eb798e5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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

On Tue, Nov 02, 2021 at 06:10:13PM +0100, David Hildenbrand wrote:
> On 02.11.21 18:06, Michael S. Tsirkin wrote:
> > On Tue, Nov 02, 2021 at 12:55:17PM +0100, David Hildenbrand wrote:
> >> On 02.11.21 12:35, Michael S. Tsirkin wrote:
> >>> On Tue, Nov 02, 2021 at 09:33:55AM +0100, David Hildenbrand wrote:
> >>>> On 01.11.21 23:15, Michael S. Tsirkin wrote:
> >>>>> On Wed, Oct 27, 2021 at 02:45:19PM +0200, David Hildenbrand wrote:
> >>>>>> This is the follow-up of [1], dropping auto-detection and vhost-user
> >>>>>> changes from the initial RFC.
> >>>>>>
> >>>>>> Based-on: 20211011175346.15499-1-david@redhat.com
> >>>>>>
> >>>>>> A virtio-mem device is represented by a single large RAM memory region
> >>>>>> backed by a single large mmap.
> >>>>>>
> >>>>>> Right now, we map that complete memory region into guest physical addres
> >>>>>> space, resulting in a very large memory mapping, KVM memory slot, ...
> >>>>>> although only a small amount of memory might actually be exposed to the VM.
> >>>>>>
> >>>>>> For example, when starting a VM with a 1 TiB virtio-mem device that only
> >>>>>> exposes little device memory (e.g., 1 GiB) towards the VM initialliy,
> >>>>>> in order to hotplug more memory later, we waste a lot of memory on metadata
> >>>>>> for KVM memory slots (> 2 GiB!) and accompanied bitmaps. Although some
> >>>>>> optimizations in KVM are being worked on to reduce this metadata overhead
> >>>>>> on x86-64 in some cases, it remains a problem with nested VMs and there are
> >>>>>> other reasons why we would want to reduce the total memory slot to a
> >>>>>> reasonable minimum.
> >>>>>>
> >>>>>> We want to:
> >>>>>> a) Reduce the metadata overhead, including bitmap sizes inside KVM but also
> >>>>>>    inside QEMU KVM code where possible.
> >>>>>> b) Not always expose all device-memory to the VM, to reduce the attack
> >>>>>>    surface of malicious VMs without using userfaultfd.
> >>>>>
> >>>>> I'm confused by the mention of these security considerations,
> >>>>> and I expect users will be just as confused.
> >>>>
> >>>> Malicious VMs wanting to consume more memory than desired is only
> >>>> relevant when running untrusted VMs in some environments, and it can be
> >>>> caught differently, for example, by carefully monitoring and limiting
> >>>> the maximum memory consumption of a VM. We have the same issue already
> >>>> when using virtio-balloon to logically unplug memory. For me, it's a
> >>>> secondary concern ( optimizing a is much more important ).
> >>>>
> >>>> Some users showed interest in having QEMU disallow access to unplugged
> >>>> memory, because coming up with a maximum memory consumption for a VM is
> >>>> hard. This is one step into that direction without having to run with
> >>>> uffd enabled all of the time.
> >>>
> >>> Sorry about missing the memo - is there a lot of overhead associated
> >>> with uffd then?
> >>
> >> When used with huge/gigantic pages, we don't particularly care.
> >>
> >> For other memory backends, we'll have to route any population via the
> >> uffd handler: guest accesses a 4k page -> place a 4k page from user
> >> space. Instead of the kernel automatically placing a THP, we'd be
> >> placing single 4k pages and have to hope the kernel will collapse them
> >> into a THP later.
> > 
> > How much value there is in a THP given it's not present?
> 
> If you don't place a THP right during the first page fault inside the
> THP region, you'll have to rely on khugepagd to eventually place a huge
> page later -- and manually fault in each and every 4k page. I haven't
> done any performance measurements so far. Going via userspace on every
> 4k fault will most certainly hurt performance when first touching memory.

So, if the focus is performance improvement, maybe show the speedup?


> -- 
> Thanks,
> 
> David / dhildenb


