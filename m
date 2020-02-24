Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F7F16AFE6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 20:02:08 +0100 (CET)
Received: from localhost ([::1]:41148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6IzX-0001Au-HD
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 14:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34623)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j6Iyb-0000gs-8i
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 14:01:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j6IyY-0008Vp-OR
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 14:01:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31655
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j6IyY-0008TI-F9
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 14:01:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582570865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zfMd2WMhwZJQ7H8rImltnLQJwqFzfJktU/DwmcD0VSQ=;
 b=g95+c+BPjOOBi6rCA7T91CQOn7IxeRT9JxVKugCqiVPXD5q361A198NQUbnqiAEAdoITe8
 Ty8yoMpbmdnh6dKaxNkaEb/N8mrIw/YqLhq1BbpeJSeCrkll754lwmpETzthhsVJD0zCwk
 Ah2ARGYQjMbcO894yeLyipcXFIIqvgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-B7h8GBrqOpuBgp0jFK-KZw-1; Mon, 24 Feb 2020 13:59:26 -0500
X-MC-Unique: B7h8GBrqOpuBgp0jFK-KZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D995418B5F6A;
 Mon, 24 Feb 2020 18:59:24 +0000 (UTC)
Received: from [10.36.116.78] (ovpn-116-78.ams2.redhat.com [10.36.116.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34D481001B2C;
 Mon, 24 Feb 2020 18:59:11 +0000 (UTC)
Subject: Re: [PATCH v2 00/13] migrate/ram: Fix resizing RAM blocks while
 migrating
From: David Hildenbrand <david@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <20200221164204.105570-1-david@redhat.com>
 <20200221180440.GE37727@xz-x1>
 <d10b53cc-89f3-042b-9889-d16ea7572f42@redhat.com>
 <20200224174515.GJ37727@xz-x1>
 <39ced494-023b-e020-e986-218919063af5@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <0ffb449a-84a3-3555-e0c1-0bc842977bb2@redhat.com>
Date: Mon, 24 Feb 2020 19:59:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <39ced494-023b-e020-e986-218919063af5@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Shannon Zhao <shannon.zhao@linaro.org>, Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.02.20 19:44, David Hildenbrand wrote:
> On 24.02.20 18:45, Peter Xu wrote:
>> On Mon, Feb 24, 2020 at 10:09:19AM +0100, David Hildenbrand wrote:
>>> On 21.02.20 19:04, Peter Xu wrote:
>>>> On Fri, Feb 21, 2020 at 05:41:51PM +0100, David Hildenbrand wrote:
>>>>> I was now able to actually test resizing while migrating. I am using the
>>>>> prototype of virtio-mem to test (which also makes use of resizable
>>>>> allocations). Things I was able to reproduce:
>>>>
>>>> The test cases cover quite a lot.  Thanks for doing that.
>>>>
>>>>> - Resize while still running on the migration source. Migration is canceled
>>>>> -- Test case for "migraton/ram: Handle RAM block resizes during precopy"
>>>>
>>>>> - Resize (grow+shrink) on the migration target during postcopy migration
>>>>>   (when syncing RAM blocks), while not yet running on the target
>>>>> -- Test case for "migration/ram: Discard new RAM when growing RAM blocks
>>>>>    and the VM is stopped", and overall RAM size synchronization. Seems to
>>>>>    work just fine.
>>>>
>>>> This won't be able to trigger without virtio-mem, right?
>>>
>>> AFAIK all cases can also be triggered without virtio-mem (not just that
>>> easily :) ). This case would be "RAM block is bigger on source than on
>>> destination.".
>>>
>>>>
>>>> And I'm also curious on how to test this even with virtio-mem.  Is
>>>> that a QMP command to extend/shrink virtio-mem?
>>>
>>> Currently, there is a single qom property that can be modifed via
>>> QMP/HMP - "requested-size". With resizable resizable memory backends,
>>> increasing the requested size will also implicitly grow the RAM block.
>>> Shrinking the requested size will currently result in shrinking the RAM
>>> block on the next reboot.
>>>
>>> So, to trigger growing of a RAM block (assuming requested-size was
>>> smaller before, e.g., 1000M)
>>>
>>> echo "qom-set vm1 requested-size 6000M" | sudo nc -U $MON
>>>
>>> To trigger shrinking (assuming requested-size was bigger before)
>>>
>>> echo "qom-set vm1 requested-size 100M" | sudo nc -U $MON
>>> echo 'system_reset' | sudo nc -U $MON
>>>
>>>
>>> Placing these at the right spots during a migration allows to test this
>>> very reliably.
>>
>> I see, thanks for the context.  The question was majorly about when
>> you say "during postcopy migration (when syncing RAM blocks), while
>> not yet running on the target" - it's not easy to do so imho, because:
> 
> This case is very easy to trigger, even with acpi. Simply have a ram
> block on the source be bigger than one on the target. The sync code
> (migration/ram.c:qemu_ram_resize()) will perform the resize during
> precopy. Postcopy misses to discard the additional memory.
> 
> Maybe my description was confusing. But this really just triggers when
> 
> - Postcopy is advised and discards memory on all ram blocks
> - Precopy grows the RAM block when syncing the RAM block sizes with the
> source
> 
> Postcopy misses to discard the new RAM.
> 
>>
>>   - it's a very short transition period between precopy and postcopy,
>>     so I was curious about how you made sure that the grow/shrink
>>     happened exactly during that period
>>
>>   - during the period, IIUC it was still in the main thread, which
>>     means logically QEMU should not be able to respond to any QMP/HMP
>>     command at all...  So even if you send a command, I think it'll
>>     only be executed later after the transition completes
>>
>>   - this I'm not sure, but ... even for virtio-mem, the resizing can
>>     only happen after guest ack it, right?  During the precopy to
>>     postcopy transition period, the VM is stopped, AFAICT, so
>>     logically we can't trigger resizing during the transition

Regarding that question: Resizes will happen without guest interaction
(e.g., during a reboot, or when increasing the requested size). In the
future, there are theoretical plans to have resizes that can be
triggered by guest interaction/request to some extend as well.

-- 
Thanks,

David / dhildenb


