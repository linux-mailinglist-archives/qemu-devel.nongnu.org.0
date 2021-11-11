Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FD744D9AA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:58:29 +0100 (CET)
Received: from localhost ([::1]:59202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlCT6-0004Sb-Vp
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:58:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlCQU-0000Rx-0q
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:55:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlCQP-00084P-KD
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:55:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636646139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sx5EdwsXZEz/jV37SqDSp6MluJz7F8Q6qbQFChBZWO4=;
 b=UUfNZulOyeKej6rrWOPcTXi/JIrrZ7YZmOIWAqnw2pmqvjYyksjdwtoK/VFXYk8xCqX313
 RRlEJBK/kDaUhrKM/5EvNN0qf9DmnprWpl2VoYwzDrAQuxi2KVWYZzQFzrW0mAfykRWIEE
 HfJxo/PFo3ExvJfYAyGQsjqTQG9ISBE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-nbip1cPZPzK2B2xt6ZjZiQ-1; Thu, 11 Nov 2021 10:55:38 -0500
X-MC-Unique: nbip1cPZPzK2B2xt6ZjZiQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso2882647wms.5
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 07:55:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Sx5EdwsXZEz/jV37SqDSp6MluJz7F8Q6qbQFChBZWO4=;
 b=j/uhpAxqdSjeX86cbFOVIbrVXTh9wXgrNPYfTnCUi9llK/XtpnZoBdEv6Lw2kg6cvK
 8jHBLvYBx7YT0xJ0zpSHY/RVzdnt7J6+eQo9gU+N1NyXsiOJikpnBr8uttXUuxED+Jko
 8ESnFJgtgsjYH2BqnBWU/aw9jiEkzJs5qDE63aYUZ3wIiQFLhhzf4At7NyGkebC5l8A7
 RolL89r+KWlByJDt1VJzAwqWTj92TcD6nScbrh9j8FA/pe3I8e+9BN5M7pdpZKOJ6Mbr
 QSl09S/4ws1caxaTgy6fklqhPCP7vsrJVH8JRuH4w+Nt4imUQbupDTGwbrhCaw6s0mjX
 wStw==
X-Gm-Message-State: AOAM530Bmla8JW3ldhupPMazC43sKO3hu8rG5hK8kt5aLfUY/qjnU0UY
 EqZnWVB3LR9aPZLkgf4s9aJ8Cg0qS95wHq0v99+V/r1j6WVUgDhNYHqF/Xh9x11MXnkoKIovpYT
 miJUhhsm93H3IAEU=
X-Received: by 2002:a05:600c:202:: with SMTP id
 2mr9171356wmi.167.1636646136786; 
 Thu, 11 Nov 2021 07:55:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzr1GL9MLSekHN0zRpKNhhmeMtO3is9M4hqnEBCJOCR5ZNytavasoUpiHY8OlbnUYISsFx0nw==
X-Received: by 2002:a05:600c:202:: with SMTP id
 2mr9171323wmi.167.1636646136515; 
 Thu, 11 Nov 2021 07:55:36 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h3sm3172130wrv.69.2021.11.11.07.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 07:55:36 -0800 (PST)
Message-ID: <7e490883-b723-1ff6-9191-6ef0c91ccd25@redhat.com>
Date: Thu, 11 Nov 2021 16:55:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] hw/core/loader: workaround read() size limit.
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Jamie Iles <jamie@nuviainc.com>
References: <20211111141141.3295094-1-jamie@nuviainc.com>
 <20211111141141.3295094-3-jamie@nuviainc.com>
 <c9950c92-86c5-ce0d-054e-357db1de851c@redhat.com> <YY04ioqviteeKy0c@hazel>
 <bd0f1a0a-1b5e-9800-069c-764cb9cfb5e1@redhat.com>
In-Reply-To: <bd0f1a0a-1b5e-9800-069c-764cb9cfb5e1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, lmichel@kalray.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 16:43, Philippe Mathieu-Daudé wrote:
> On 11/11/21 16:36, Jamie Iles wrote:
>> Hi Philippe,
>>
>> On Thu, Nov 11, 2021 at 03:55:48PM +0100, Philippe Mathieu-Daudé wrote:
>>> Hi Jamie,
>>>
>>> On 11/11/21 15:11, Jamie Iles wrote:
>>>> On Linux, read() will only ever read a maximum of 0x7ffff000 bytes
>>>> regardless of what is asked.  If the file is larger than 0x7ffff000
>>>> bytes the read will need to be broken up into multiple chunks.
>>>>
>>>> Cc: Luc Michel <lmichel@kalray.eu>
>>>> Signed-off-by: Jamie Iles <jamie@nuviainc.com>
>>>> ---
>>>>  hw/core/loader.c | 40 ++++++++++++++++++++++++++++++++++------
>>>>  1 file changed, 34 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/hw/core/loader.c b/hw/core/loader.c
>>>> index 348bbf535bd9..16ca9b99cf0f 100644
>>>> --- a/hw/core/loader.c
>>>> +++ b/hw/core/loader.c
>>>> @@ -80,6 +80,34 @@ int64_t get_image_size(const char *filename)
>>>>      return size;
>>>>  }
>>>>  
>>>> +static ssize_t read_large(int fd, void *dst, size_t len)
>>>> +{
>>>> +    /*
>>>> +     * man 2 read says:
>>>> +     *
>>>> +     * On Linux, read() (and similar system calls) will transfer at most
>>>> +     * 0x7ffff000 (2,147,479,552) bytes, returning the number of bytes
>>>
>>> Could you mention MAX_RW_COUNT from linux/fs.h?
>>>
>>>> +     * actually transferred.  (This is true on both 32-bit and 64-bit
>>>> +     * systems.)
>>>
>>> Maybe "This is true for both ILP32 and LP64 data models used by Linux"?
>>> (because that would not be the case for the ILP64 model).
>>>
>>> Otherwise s/systems/Linux variants/?
>>>
>>>> +     *
>>>> +     * So read in chunks no larger than 0x7ffff000 bytes.
>>>> +     */
>>>> +    size_t max_chunk_size = 0x7ffff000;
>>>
>>> We can declare it static const.
>>
>> Ack, can fix all of those up.
>>
>>>> +    size_t offset = 0;
>>>> +
>>>> +    while (offset < len) {
>>>> +        size_t chunk_len = MIN(max_chunk_size, len - offset);
>>>> +        ssize_t br = read(fd, dst + offset, chunk_len);
>>>> +
>>>> +        if (br < 0) {
>>>> +            return br;
>>>> +        }
>>>> +        offset += br;
>>>> +    }
>>>> +
>>>> +    return (ssize_t)len;
>>>> +}
>>>
>>> I see other read()/pread() calls:
>>>
>>> hw/9pfs/9p-local.c:472:            tsize = read(fd, (void *)buf, bufsz);
>>> hw/vfio/common.c:269:    if (pread(vbasedev->fd, &buf, size,
>>> region->fd_offset + addr) != size) {
>>> ...
>>>
>>> Maybe the read_large() belongs to "sysemu/os-xxx.h"?
>>
>> I think util/osdep.c would be a good fit for this.  To make sure we're 
> 
> Yes.
> 
>> on the same page though are you proposing converting all pread/read 
>> calls to a qemu variant or auditing for ones that could potentially take 
>> a larger size?
> 
> Yes, I took some time wondering beside loading blob in guest memory,
> what would be the other issues you might encounter. I couldn't find
> many cases. Eventually hw/vfio/. I haven't audit much, only noticed
> hw/9pfs/9p-local.c and qga/commands-*.c (not sure if relevant), but
> since we want to fix this, I'd rather try to fix it globally.

Actually what you suggest is simpler, add qemu_read() / qemu_pread()
in util/osdep.c, convert all uses without caring about any audit.


