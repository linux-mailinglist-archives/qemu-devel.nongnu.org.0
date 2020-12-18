Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 325592DE40F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:31:11 +0100 (CET)
Received: from localhost ([::1]:34658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGmj-0000Bn-Bd
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:31:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqGlN-00081l-VI
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 09:29:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqGlK-0006FY-Ve
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 09:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608301782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5a0psf0WgXvIfv6QBQKeXxqQ/42ThVtBw+L4MJGsvp4=;
 b=EK9y5/hQG6CkG4NaM5suwI9PCKHbXskTwoRPn2EnySyPv7m4Fk+JPzS2+5TK0W6cYQWyLu
 Q5ltSDMgugbtGW8pJGz0WHU9yh7NakyHo3VXO2AeM7cm0bKpTM05inaVenrL5XDIQpJzOH
 jnG/K5csPN+/Ep8LlkudrFc5MTfrwmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-6jA3AHXUN_yjrEeBjGZwVg-1; Fri, 18 Dec 2020 09:29:40 -0500
X-MC-Unique: 6jA3AHXUN_yjrEeBjGZwVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E80A10054FF;
 Fri, 18 Dec 2020 14:29:39 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-84.ams2.redhat.com
 [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE8342CFAD;
 Fri, 18 Dec 2020 14:29:37 +0000 (UTC)
Subject: Re: [PATCH 1/9] block/vpc: Make vpc_open() read the full dynamic
 header
To: Markus Armbruster <armbru@redhat.com>
References: <20201217162003.1102738-1-armbru@redhat.com>
 <20201217162003.1102738-2-armbru@redhat.com>
 <c47aef12-38cd-fd21-7fdb-af3be0af1833@redhat.com>
 <878s9v9qc9.fsf@dusky.pond.sub.org>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a47eaff9-8772-fc0f-f8b1-6cdac09f8c54@redhat.com>
Date: Fri, 18 Dec 2020 15:29:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <878s9v9qc9.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, mrezanin@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.12.20 14:49, Markus Armbruster wrote:
> Max Reitz <mreitz@redhat.com> writes:
> 
>> On 17.12.20 17:19, Markus Armbruster wrote:
>>> The dynamic header's size is 1024 bytes.
>>>
>>> vpc_open() reads only the 512 bytes of the dynamic header into buf[].
>>> Works, because it doesn't actually access the second half.  However, a
>>> colleague told me that GCC 11 warns:
>>>
>>>       ../block/vpc.c:358:51: error: array subscript 'struct VHDDynDiskHeader[0]' is partly outside array bounds of 'uint8_t[512]' [-Werror=array-bounds]
>>>
>>> Clean up to read the full header.
>>>
>>> Rename buf[] to dyndisk_header_buf[] while there.
>>>
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>    block/vpc.c | 8 ++++----
>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/block/vpc.c b/block/vpc.c
>>> index 1ab55f9287..2fcf3f6283 100644
>>> --- a/block/vpc.c
>>> +++ b/block/vpc.c
>>> @@ -220,7 +220,7 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
>>>        QemuOpts *opts = NULL;
>>>        Error *local_err = NULL;
>>>        bool use_chs;
>>> -    uint8_t buf[HEADER_SIZE];
>>> +    uint8_t dyndisk_header_buf[1024];
>>
>> Perhaps this should be heap-allocated, but I don’t know whether qemu has
>> ever established a (perhaps just inofficial) threshold on what goes on
>> the stack and what goes on the heap.
> 
> There is no official per-function limit.  I generally don't worry about
> a few kilobytes unless it's recursive.  We have many, many functions
> with stack frames in the order of a kilobyte.

Which doesn’t mean it’s what we want.  But I suppose in respect to my 
implicit question that means we don’t have any hard limits.

> Our coroutine and thread
> stacks are reasonable (corotine stacks are 1MiB, the default thread
> stack size 2MiB on x86-64, and I can't see code that sets a different
> size).

I’m not too worried about some on-stack buffers in functions like *open 
and *create.  It’s just that I would have put it on the heap, probably.

(Speaking of coroutine stack sizes, I remember a recent bug report on 
how long a backing chain may become, and that one of the limiting 
factors is that the coroutine stack eventually overflows. *shrug*)

>>>        uint32_t checksum;
>>>        uint64_t computed_size;
>>>        uint64_t pagetable_size;
>>> @@ -340,14 +340,14 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
>>>        }
>>>    
>>>        if (disk_type == VHD_DYNAMIC) {
>>> -        ret = bdrv_pread(bs->file, be64_to_cpu(footer->data_offset), buf,
>>> -                         HEADER_SIZE);
>>> +        ret = bdrv_pread(bs->file, be64_to_cpu(footer->data_offset),
>>> +                         dyndisk_header_buf, 1024);
>>
>> sizeof() would be better, but I see that’s what patch 6 is for.
> 
> Yes, but sizeof what?  VHDDynDiskHeader becomes usable for that only in
> PATCH 5.

sizeof(dyndisk_header_buf).

> I chose to separate the buffers first, and only then tidy up their use.

Understood.  It’s just that I noticed, then looked further in the patch 
series to see whether you’d clean up the magic number, and indeed you 
did in patch 6. :)

Max


