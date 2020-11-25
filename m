Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA362C3B3A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 09:40:58 +0100 (CET)
Received: from localhost ([::1]:45324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khqMB-0000FB-5o
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 03:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1khqL8-0008C7-VZ
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 03:39:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1khqL6-0003mB-OL
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 03:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606293586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w75DUHcU5j3lkvL+DnCVUk8HoSdx3Yy13uHBFwVmHl4=;
 b=dd6ZsV6YrR8ylCNWOBOZ43kFKRGaHLu61uAGHoJ45KEDpAK0mN/lJFeAdppnBTxwMa1/EW
 +VsspGJ5rhisqNv1vDdwCEpTGqwdn8hFdZRTks3C5OLLDfD/jjS2iWtpPvbN6WmurKz7bX
 mI75t2xXqH07cIXY1Dt5J765MgDOQSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-eIvJ9m3jNZSO9DKLVOdK-Q-1; Wed, 25 Nov 2020 03:39:41 -0500
X-MC-Unique: eIvJ9m3jNZSO9DKLVOdK-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 426AD1926DA3;
 Wed, 25 Nov 2020 08:39:19 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9007E19C87;
 Wed, 25 Nov 2020 08:38:47 +0000 (UTC)
Date: Wed, 25 Nov 2020 09:38:44 +0100
From: Andrew Jones <drjones@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] hw/arm/virt enable support for virtio-mem
Message-ID: <20201125083844.krr4d5ww3a2ki25c@kamzik.brq.redhat.com>
References: <20201105174311.566751-1-Jonathan.Cameron@huawei.com>
 <5b1dff01-7e6b-78d2-d55a-20c0617c3076@redhat.com>
 <20201124181150.0000025f@Huawei.com>
 <f2cfd3cb-27c8-f25b-2b57-6dc983a25a43@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f2cfd3cb-27c8-f25b-2b57-6dc983a25a43@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 linuxarm@huawei.com, Auger Eric <eric.auger@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 24, 2020 at 08:17:35PM +0100, David Hildenbrand wrote:
> On 24.11.20 19:11, Jonathan Cameron wrote:
> > On Mon, 9 Nov 2020 20:47:09 +0100
> > David Hildenbrand <david@redhat.com> wrote:
> > 
> > +CC Eric based on similar query in other branch of the thread.
> > 
> >> On 05.11.20 18:43, Jonathan Cameron wrote:
> >>> Basically a cut and paste job from the x86 support with the exception of
> >>> needing a larger block size as the Memory Block Size (MIN_SECTION_SIZE)
> >>> on ARM64 in Linux is 1G.
> >>>
> >>> Tested:
> >>> * In full emulation and with KVM on an arm64 server.
> >>> * cold and hotplug for the virtio-mem-pci device.
> >>> * Wide range of memory sizes, added at creation and later.
> >>> * Fairly basic memory usage of memory added.  Seems to function as normal.
> >>> * NUMA setup with virtio-mem-pci devices on each node.
> >>> * Simple migration test.
> >>>
> >>> Related kernel patch just enables the Kconfig item for ARM64 as an
> >>> alternative to x86 in drivers/virtio/Kconfig
> >>>
> >>> The original patches from David Hildenbrand stated that he thought it should
> >>> work for ARM64 but it wasn't enabled in the kernel [1]
> >>> It appears he was correct and everything 'just works'.
> >>>
> >>> The build system related stuff is intended to ensure virtio-mem support is
> >>> not built for arm32 (build will fail due no defined block size).
> >>> If there is a more elegant way to do this, please point me in the right
> >>> direction.  
> >>
> >> You might be aware of https://virtio-mem.gitlab.io/developer-guide.html 
> >> and the "issue" with 64k base pages - 512MB granularity. Similar as the 
> >> question from Auger, have you tried running arm64 with differing page 
> >> sizes in host/guest?
> >>
> > 
> > Hi David,
> > 
> >> With recent kernels, you can use "memhp_default_state=online_movable" on 
> >> the kernel cmdline to make memory unplug more likely to succeed - 
> >> especially with 64k base pages. You just have to be sure to not hotplug 
> >> "too much memory" to a VM.
> > 
> > Thanks for the pointer - that definitely simplifies testing.  Was getting a bit
> > tedious with out that.
> > 
> > As ever other stuff got in the way, so I only just got back to looking at this.
> > 
> > I've not done a particularly comprehensive set of tests yet, but things seem
> > to 'work' with mixed page sizes.
> > 
> > With 64K pages in general, you run into a problem with the device block_size being
> > smaller than the subblock_size.  I've just added a check for that into the
> 
> "device block size smaller than subblock size" - that's very common,
> e.g.,  on x86-64.
> 
> E.g., device_block_size is 2MiB, subblock size 4MiB - until we improve
> that in the future in Linux guests.
> 
> Or did you mean something else?
> 
> > virtio-mem kernel driver and have it fail to probe if that happens.  I don't
> > think such a setup makes any sense anyway so no loss there.  Should it make sense
> > to drop that restriction in the future we can deal with that then without breaking
> > backwards compatibility.
> > 
> > So the question is whether it makes sense to bother with virtio-mem support
> > at all on ARM64 with 64k pages given currently the minimum workable block_size
> > is 512MiB?  I guess there is an argument of virtio-mem being a possibly more
> > convenient interface than full memory HP.  Curious to hear what people think on
> > this?
> 
> IMHO we really want it. For example, RHEL is always 64k. This is a
> current guest limitation, to be improved in the future - either by
> moving away from 512MB huge pages with 64k or by improving
> alloc_contig_range().

Even with 64k pages you may be able to have 2MB huge pages by setting
default_hugepagesz=2M on the kernel command line.

Thanks,
drew

> 
> > 
> > 4K guest on 64K host seems fine and no such limit is needed - though there
> > may be performance issues doing that.
> 
> Yeah, if one is lucky to get one of these 512 MiB huge pages at all :)
> 
> > 
> > 64k guest on 4k host with 512MiB block size seems fine.
> > 
> > If there are any places anyone thinks need particular poking I'd appreciate a hint :)
> 
> If things seem to work for now, that's great :) Thanks!
> 
> -- 
> Thanks,
> 
> David / dhildenb
> 
> 


