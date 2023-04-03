Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C75A6D504C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 20:27:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjOtq-00008m-2E; Mon, 03 Apr 2023 14:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pjOtm-00008P-FI
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:27:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pjOtg-000839-US
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 14:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680546435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yAva9IDv/0mIPwye7zcbpgEOJiiU2AKBEXYB5gLRbiY=;
 b=VDJsB/pthcxqjRaG985vjppY7dz93L0Jq0S3/YXVP1Cj7JEwmtYuKNBmfl+DFYYPFaXL+z
 pwQCwEYwX7XQCm28yl7mXHK2hY8106SCss1K3BrNCo+FwO9zlyysAP5GL2fnA+i54U7miT
 s4oscd81rElgLZP397/E5hbNpfkvRX4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-0ojrQK2vMP6D37YRlA3NUA-1; Mon, 03 Apr 2023 14:27:14 -0400
X-MC-Unique: 0ojrQK2vMP6D37YRlA3NUA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k25-20020a05600c1c9900b003ef79f2c207so9412844wms.5
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 11:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680546433;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yAva9IDv/0mIPwye7zcbpgEOJiiU2AKBEXYB5gLRbiY=;
 b=6Ul7t45HyUlAbOtZi0N8o/sSXz7DhFCZu53nKKjFGVZ/CBqOBvrmHBUASY8Csdp01O
 V5UC/+XlLYHwTPrt2K0a/R5sI3QDO1b4SF+wE4lBWmnnhe6OFXjMj+2QU6FxWOzskQ2W
 xPfquLYbztSlelMFNTKSM8IpH1gohd+e+GdHc9wxCVgvLTjwo+fmh2/SjXEVmi8q2uhl
 VyNILVkdyJmlPS6Ah8xAs+mYQnVfiCWjC7xRiOjGhGK8NPD7B1V8egOMLYJdg/HSif7e
 iZCQoJ1NWFWzRY+5ieJGLuWcNKDlL7rLTGLAH1DlyRhbiigVgFBwFEwExLtwF5I/bPtl
 Gh9Q==
X-Gm-Message-State: AAQBX9dMEllkC/6iig50q4hk0W8CfuwW0ytFCFgDD4hafzPGGDDhziTy
 oC5V/3LDb44GIw2voTkYeewP5wNARmtKyCrY8YYkmr3IAL1TujYGMzGKRhyKL8CRWtM4OOkHiSh
 hNfGW8BZ4mfWArlM=
X-Received: by 2002:adf:f0cf:0:b0:2ce:aed5:7dc with SMTP id
 x15-20020adff0cf000000b002ceaed507dcmr27317936wro.68.1680546433496; 
 Mon, 03 Apr 2023 11:27:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350ax2EqvHVUpPYrK023oaea9wom+QL5ODBM0/vf02sU8rfHA1MtR6pC3IpNd00CO+lkfYM5bUQ==
X-Received: by 2002:adf:f0cf:0:b0:2ce:aed5:7dc with SMTP id
 x15-20020adff0cf000000b002ceaed507dcmr27317918wro.68.1680546433080; 
 Mon, 03 Apr 2023 11:27:13 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:5e00:8e78:71f3:6243:77f0?
 (p200300cbc7025e008e7871f3624377f0.dip0.t-ipconnect.de.
 [2003:cb:c702:5e00:8e78:71f3:6243:77f0])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a5d4e0b000000b002e71156b0fcsm7460570wrt.6.2023.04.03.11.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 11:27:12 -0700 (PDT)
Message-ID: <d8170e1e-b225-0d4c-5aaf-8db19d3ca3db@redhat.com>
Date: Mon, 3 Apr 2023 20:27:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4] hostmem-file: add offset option
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Alexander Graf <graf@amazon.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Eric Blake <eblake@redhat.com>,
 Philippe Mathieu-Daude <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
References: <20230401124257.24537-1-graf@amazon.com>
 <20230401174716.GB154566@fedora>
 <f2e232df-51d4-9cac-557d-329523a69530@redhat.com> <ZCr1iNzATiThmpXS@x1n>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <ZCr1iNzATiThmpXS@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.349, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03.04.23 17:49, Peter Xu wrote:
> On Mon, Apr 03, 2023 at 09:13:29AM +0200, David Hildenbrand wrote:
>> On 01.04.23 19:47, Stefan Hajnoczi wrote:
>>> On Sat, Apr 01, 2023 at 12:42:57PM +0000, Alexander Graf wrote:
>>>> Add an option for hostmem-file to start the memory object at an offset
>>>> into the target file. This is useful if multiple memory objects reside
>>>> inside the same target file, such as a device node.
>>>>
>>>> In particular, it's useful to map guest memory directly into /dev/mem
>>>> for experimentation.
>>>>
>>>> Signed-off-by: Alexander Graf <graf@amazon.com>
>>>> Reviewed-by: Stefan Hajnoczi <stefanha@gmail.com>
>>>>
>>>> ---
>>>>
>>>> v1 -> v2:
>>>>
>>>>     - add qom documentation
>>>>     - propagate offset into truncate, size and alignment checks
>>>>
>>>> v2 -> v3:
>>>>
>>>>     - failed attempt at fixing typo
>>>>
>>>> v2 -> v4:
>>>>
>>>>     - fix typo
>>>> ---
>>>>    backends/hostmem-file.c | 40 +++++++++++++++++++++++++++++++++++++++-
>>>>    include/exec/memory.h   |  2 ++
>>>>    include/exec/ram_addr.h |  3 ++-
>>>>    qapi/qom.json           |  5 +++++
>>>>    qemu-options.hx         |  6 +++++-
>>>>    softmmu/memory.c        |  3 ++-
>>>>    softmmu/physmem.c       | 14 ++++++++++----
>>>>    7 files changed, 65 insertions(+), 8 deletions(-)
>>>
>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>
>> The change itself looks good to me, but I do think some other QEMU code that
>> ends up working on the RAMBlock is not prepared yet. Most probably, because
>> we never ended up using fd with an offset as guest RAM.
>>
>> We don't seem to be remembering that offset in the RAMBlock. First, I
>> thought block->offset would be used for that, but that's just the offset in
>> the ram_addr_t space. Maybe we need a new "block->fd_offset" to remember the
>> offset (unless I am missing something).
> 
> I think you're right.
> 
>>
>> The real offset in the file would be required at least in two cases I can
>> see (whenever we essentially end up calling mmap() on the fd again):
>>
>> 1) qemu_ram_remap(): We'd have to add the file offset on top of the
>> calculated offset.
>>
>> 2) vhost-user: most probably whenever we set the mmap_offset. For example,
>> in vhost_user_fill_set_mem_table_msg() we'd similarly have to add the
>> file_offset on top of the calculated offset. vhost_user_get_mr_data() should
>> most probably do that.
> 
> I had a patch to add that offset for the upcoming doublemap feature here:
> 
> https://lore.kernel.org/all/20230117220914.2062125-8-peterx@redhat.com/
> 
> But that was because doublemap wants to map the guest mem twice for other
> purposes. I didn't yet notice that the code seem to be already broken if
> without offset==0.
> 
> While, I _think_ we already have offset!=0 case for a ramblock, since:
> 
>          commit ed5d001916dd46ceed6d8850e453bcd7b5db2acb
>          Author: Jagannathan Raman <jag.raman@oracle.com>
>          Date:   Fri Jan 29 11:46:13 2021 -0500
> 
>          multi-process: setup memory manager for remote device
> 
> Where there's:
> 
>          memory_region_init_ram_from_fd(subregion, NULL,
>                                         name, sysmem_info->sizes[region],
>                                         RAM_SHARED, msg->fds[region],
>                                         sysmem_info->offsets[region],
>                                         errp);

Interesting ... maybe so far never used alongside vhost-user.

-- 
Thanks,

David / dhildenb


