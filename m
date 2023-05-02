Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011046F3FC4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:04:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptlv4-0001oa-P0; Tue, 02 May 2023 05:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ptlv2-0001oR-H5
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:03:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ptlv0-0005dP-M7
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683018209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cSbRx1H+cG8NzIjCF3YLAeY91SKkBCotNuy/KA1bti4=;
 b=XyjCjW+Xpji9aZvfY6IVAzZmCsBlVYztE2Pq/IHAUvsQ3cYyK2AGF1M6k0FIocMRLuCBNH
 t49bz4oxgqlhmd2Nl2vFpkGA/O6z4oke82IIxnAYbPe009HZVaBQ8uCvvfn1T5xMt13Kqe
 PSxIzkhzt51NJVgmUxfD1dilZo2hhO4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-KVywX8IFN7u-YYNhIIOb8w-1; Tue, 02 May 2023 05:03:27 -0400
X-MC-Unique: KVywX8IFN7u-YYNhIIOb8w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F573885626;
 Tue,  2 May 2023 09:03:27 +0000 (UTC)
Received: from localhost (unknown [10.39.193.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D30A12166B26;
 Tue,  2 May 2023 09:03:26 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Eric Auger <eauger@redhat.com>, Gavin Shan
 <gshan@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Andrea Bolognani <abologna@redhat.com>
Subject: Re: [PATCH v7 1/1] arm/kvm: add support for MTE
In-Reply-To: <64915da6-4276-1603-1454-9350a44561d8@linaro.org>
Organization: Red Hat GmbH
References: <20230428095533.21747-1-cohuck@redhat.com>
 <20230428095533.21747-2-cohuck@redhat.com> <87sfcj99rn.fsf@secure.mitica>
 <64915da6-4276-1603-1454-9350a44561d8@linaro.org>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 02 May 2023 11:03:25 +0200
Message-ID: <871qjzcdgi.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 01 2023, Richard Henderson <richard.henderson@linaro.org> wrote:

> On 4/28/23 18:50, Juan Quintela wrote:
>> Pardon my ignorance here, but to try to help with migration.  How is
>> this mte tag stored?
>> - 1 array of 8bits per page of memory
>> - 1 array of 64bits per page of memory
>> - whatever
>> 
>> Lets asume that it is 1 byte per page. For the explanation it don't
>> matter, only matters that it is an array of things that are one for each
>> page.
>
> Not that it matters, as you say, but for concreteness, 1 4-bit tag per 16 bytes, packed, 
> so 128 bytes per 4k page.
>
>> So my suggestion is just to send another array:
>> 
>> - 1 array of page addresses
>> - 1 array of page tags that correspond to the previous one
>> - 1 array of pages that correspond to the previous addresses
>> 
>> You put compatiblity marks here and there checking that you are using
>> mte (and the same version) in both sides and you call that a day.
>
> Sounds reasonable.

Yes, something like that sounds reasonable as an interface.

>
>> Notice that this requires the series (still not upstream but already on
>> the list) that move the zero page detection to the multifd thread,
>> because I am assuming that zero pages also have tags (yes, it was not a
>> very impressive guess).
>
> Correct.  "Proper" zero detection would include checking the tags as well.
> Zero tags are what you get from the kernel on a new allocation.
>
>> Now you need to tell me if I should do this for each page, or use some
>> kind of scatter-gather function that allows me to receive the mte tags
>> from an array of pages.
>
> That is going to depend on if KVM exposes an interface with which to bulk-set tags (STGM, 
> "store tag multiple", is only available to kernel mode for some reason), a-la 
> arch/arm64/mm/copypage.c (which copies the page data then the page tags separately).
>
> For the moment, KVM believes that memcpy from userspace is sufficient, which means we'll 
> want a custom memcpy using STGP to store 16 bytes along with its tag.
>
>> You could pass this information when we are searching for dirty pages,
>> but it is going to be complicated doing that (basically we only pass the
>> dirty page id, nothing else).
>
> A page can be dirtied by changing nothing but a tag.
> So we cannot of course send tags "early", they must come with the data.
> I'm not 100% sure I understood your question here.

Last time MTE migration came up, we thought that we would need to go
with an uffd extension (page + extra data) to handle the postcopy case
properly (i.e. use some kind of array for precopy, and that interface
extension for postcopy.) TBH, I'm not sure if multifd makes any
difference here.

>
>> Another question, if you are using MTE, all pages have MTE, right?
>> Or there are other exceptions?
>
> No such systems are built yet, so we won't know what corner cases the host system will 
> have to cope with, but I believe as written so far all pages must have tags when MTE is 
> enabled by KVM.

Has anyone been able to access a real system with MTE? (All the systems
where I had hoped that MTE would be available didn't have MTE in the end
so far, so I'd be interested to hear if anybody else already got to play
with one.) Honestly, I don't want to even try to test migration if I only
have access to MTE on the FVP...


