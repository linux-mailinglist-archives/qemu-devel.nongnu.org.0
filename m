Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83912337B60
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 18:51:44 +0100 (CET)
Received: from localhost ([::1]:37210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPTL-0000M7-Ix
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lKPJe-0002KH-BE
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:41:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lKPJb-0008Be-AG
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615484497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1XFpHlwkbpds72atcixnzjLheiZKADvnuhs6GR30m4=;
 b=IiY9XPIAi+swVpziUZFmzb1MczCJB4P1Yz9WVWYXGqCGDTLX9ItR86IkVi++nPJGxSTOU5
 SivAC3BbNN9P84O1I5p43OXEtofWvtLgQtnFiHFjkRLSxrkinP2KkYbk1Q3cdMdLtVhYvf
 7NPi/Lz+cQc7ztzqYD88UgiKJb4trcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-PhXjl9q2MPChqe83ITerug-1; Thu, 11 Mar 2021 12:41:36 -0500
X-MC-Unique: PhXjl9q2MPChqe83ITerug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C2C1108BD0A;
 Thu, 11 Mar 2021 17:41:34 +0000 (UTC)
Received: from [10.36.115.26] (ovpn-115-26.ams2.redhat.com [10.36.115.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FC7A5C23E;
 Thu, 11 Mar 2021 17:41:30 +0000 (UTC)
To: Peter Xu <peterx@redhat.com>
References: <20210308150600.14440-1-david@redhat.com>
 <20210308150600.14440-3-david@redhat.com> <YEpH1FAabcILd38K@work-vm>
 <df216a57-d45a-9563-5e88-0f2ebf6b0a7e@redhat.com>
 <20210311171153.GF194839@xz-x1>
 <26d2c57a-971d-3abd-6ec3-1a38fb47a398@redhat.com>
 <20210311172236.GG194839@xz-x1>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v3 02/12] softmmu/physmem: Fix ram_block_discard_range()
 to handle shared anonymous memory
Message-ID: <d0a57921-61ab-82a5-ed58-061961dfa6a3@redhat.com>
Date: Thu, 11 Mar 2021 18:41:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311172236.GG194839@xz-x1>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.03.21 18:22, Peter Xu wrote:
> On Thu, Mar 11, 2021 at 06:15:15PM +0100, David Hildenbrand wrote:
>> On 11.03.21 18:11, Peter Xu wrote:
>>> On Thu, Mar 11, 2021 at 05:45:46PM +0100, David Hildenbrand wrote:
>>>> On 11.03.21 17:39, Dr. David Alan Gilbert wrote:
>>>>> * David Hildenbrand (david@redhat.com) wrote:
>>>>>> We can create shared anonymous memory via
>>>>>>        "-object memory-backend-ram,share=on,..."
>>>>>> which is, for example, required by PVRDMA for mremap() to work.
>>>>>>
>>>>>> Shared anonymous memory is weird, though. Instead of MADV_DONTNEED, we
>>>>>> have to use MADV_REMOVE. MADV_DONTNEED fails silently and does nothing.
>>>>>
>>>>> OK, I wonder how stable these rules are; is it defined anywhere that
>>>>> it's required?
>>>>>
>>>>
>>>> I had a look at the Linux implementation: it's essentially shmem ... but we
>>>> don't have an fd exposed, so we cannot use fallocate() ... :)
>>>>
>>>> MADV_REMOVE documents (man):
>>>>
>>>> "In the initial implementation, only tmpfs(5) was supported MADV_REMOVE; but
>>>> since Linux 3.5, any filesystem which supports the fallocate(2)
>>>> FALLOC_FL_PUNCH_HOLE mode also supports MADV_REMOVE."
>>>
>>> Hmm, I see that MADV_DONTNEED will still tear down all mappings even for
>>> anonymous shmem.. what did I miss?
>>
>> Where did you see that?
> 
> I see madvise_dontneed_free() calls zap_page_range().
> 
>>
>>>
>>
>> MADV_DONTNEED only invalidates private copies in the pagecache. It's
>> essentially useless for any kind of shared mappings.

Let me rephrase because it was wrong: MADV_DONTNEED invalidates private 
COW pages referenced in the page tables :)

> 
> Since it's about zapping page tables, then I don't understand why it won't work
> for shmem..

It zaps the page tables but the shmem pages are still referenced (in the 
pagecache AFAIU). On next user space access, you would fill the page 
tables with the previous content.

That's why MADV_DONTNEED works properly on private anonymous memory, but 
not on shared anonymous memory - the only valid references are in the 
page tables in case of private mappings (well, unless we have other 
references like GUP etc.).


I did wonder, however, if there is benefit in doing both:

MADV_REMOVE followed by MADV_DONTNEED or the other way around. Like, 
will the extra MADV_DONTNEED also remove page tables and not just 
invalidate/zap the entries. Doesn't make a difference 
functionality-wise, but memory-consumption-wise.

I'll still have to have a look.

-- 
Thanks,

David / dhildenb


