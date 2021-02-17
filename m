Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF2D31D791
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 11:33:29 +0100 (CET)
Received: from localhost ([::1]:60874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCK9A-0000FD-BA
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 05:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lCK7R-0008EI-Ny
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 05:31:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lCK7P-00016B-Hg
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 05:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613557895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpVfqtK4XfZyulMskbxlfSyHn9Cdym3iuCo9H83Xr/M=;
 b=bgoLxlPST5vD/PZjjNdzta2IIoa77qzVLhW0L+3cxvuU06o74IsgPW5zdgo8FdlnbU18Kx
 BXTxM/3l2g3Qy8GryOZw2bfbV/1TkQ5ic83FcBS0kH3F2P+Twh6gyE/qU8jkkZQjLzPEEj
 I56ytx0sfaf8IlbyG+F1Fv92Gxs+Wj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-1jyNSfpMNkeWkLjEJhoFFQ-1; Wed, 17 Feb 2021 05:31:31 -0500
X-MC-Unique: 1jyNSfpMNkeWkLjEJhoFFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D594CE642;
 Wed, 17 Feb 2021 10:31:30 +0000 (UTC)
Received: from [10.36.114.178] (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB0321002382;
 Wed, 17 Feb 2021 10:31:21 +0000 (UTC)
To: Peter Xu <peterx@redhat.com>, Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
References: <20210211210549.GE157159@xz-x1>
 <4E588B57-AAC8-40DD-9260-541836074DB3@redhat.com>
 <20210212030621.GF157159@xz-x1>
 <79c3ebb9-82ba-4714-0cf1-9f2e08eff660@redhat.com>
 <20210212161125.GH157159@xz-x1>
 <add5eef8-ff5b-5708-5383-f76262738e94@virtuozzo.com>
 <20210216233545.GD91264@xz-x1>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <12b9487c-103c-e938-2543-2d6418517e9e@redhat.com>
Date: Wed, 17 Feb 2021 11:31:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216233545.GD91264@xz-x1>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.02.21 00:35, Peter Xu wrote:
> Hi, Andrey,
> 
> On Sat, Feb 13, 2021 at 12:34:07PM +0300, Andrey Gruzdev wrote:
>> On 12.02.2021 19:11, Peter Xu wrote:
>>> On Fri, Feb 12, 2021 at 09:52:52AM +0100, David Hildenbrand wrote:
>>>> On 12.02.21 04:06, Peter Xu wrote:
>>>>> On Thu, Feb 11, 2021 at 10:09:58PM +0100, David Hildenbrand wrote:
>>>>>> The issue is when the discard happened before starting the snapshot. Write-protection won‘t work and the zeroed content won‘t be retained in the snapshot.
>>>>> I see what you mean now, and iiuc it will only be a problem if init_on_free=1.
>>>>> I think CONFIG_INIT_ON_FREE_DEFAULT_ON should be off for most distros, so the
>>>> Yes, some distros seem to enable init_on_alloc instead. Looking at the
>>>> introducing commit 6471384af2a6 ("mm: security: introduce init_on_alloc=1
>>>> and init_on_free=1 boot options") there are security use cases and it might
>>>> become important with memory tagging.
>>>>
>>>> Note that in Linux, there was also the option to poison pages with 0,
>>>> removed via f289041ed4cf ("mm, page_poison: remove
>>>> CONFIG_PAGE_POISONING_ZERO"), available in some kernels that supported free
>>>> page reporting.
>>>>
>>>> It got removed and use cases got told to use init_on_free.
>>
>> I think we talk about init_on_free()/init_on_alloc() on guest side, right?
> 
> Right.  IIUC it's the init_on_free() that matters.
> 
> We'll have no issue if init_on_alloc=1 && init_on_free=0, since in that case
> all pages will be zeroed after all before the new page returned to the caller
> to allocate the page. Then we're safe, I think.
> 
>> Still can't get how it relates to host's unpopulated pages..
>> Try to look from hardware side. Untouched SDRAM in hardware is required to contain zeroes somehow? No.
>> These 'trash' pages in migration stream are like never written physical memory pages, they are really
>> not needed in snapshot but they don't do any harm as well as there's no harm in that never-written physical
>> page is full of garbage.
>>
>> Do these 'trash' pages in snapshot contain sensitive information not allowed to be accessed by the same VM?
>> I think no. Or we need a good example how it can be potentially exploited.
>>
>> The only issue that I see is madvise(MADV_DONTNEED) for RAM blocks during snapshotting. And free page reporting
>> or memory balloon is secondary - the point is that UFFD_WP snapshot is incompatible with madvise(MADV_DONTNEED) on
>> hypervisor side. No matter which guest functionality can induce it.
> 
> I think the problem is if with init_on_free=1, the kernel will assume that
> all the pages that got freed has been zeroed before-hand so it thinks that it's
> a waste of time to zero it again when the page is reused/reallocated.  As a
> reference see kernel prep_new_page() where there's:
> 
> 	if (!free_pages_prezeroed() && want_init_on_alloc(gfp_flags))
> 		kernel_init_free_pages(page, 1 << order);
> 
> In this case I believe free_pages_prezeroed() will return true, then we don't
> even need to check want_init_on_alloc() at all. Note that it'll cover all the
> cases where kernel allocates with __GFP_ZERO: it means it could happen that
> even the guest kernel tries to alloc_page(__GFP_ZERO) it may got a page with
> random data after the live snapshot is loaded.  So it's not about any hardware,
> it's the optimization of guest kernel instead.  It is actually reasonable and
> efficient since if we *know* that page is zero page then we shouldn't bother
> zeroing it again.  However it brought us a bit of trouble on live snapshot that
> the current solution might not work for all guest OS configurations.

Adding to that, we are so far talking about how Linux *currently* 
implements it, but that is just an instance of the problem where it 
could happen in practice.

Free page reporting documents in the spec that with the right 
configuration, previously reported free pages are guaranteed to retain a 
certain value (e.g., 0) when re-accessed. So any future guest changes 
that rely on the virtio spec (e.g., Windows support) would be 
problematic - as these pages in the snapshot don't actually keep the value.

-- 
Thanks,

David / dhildenb


