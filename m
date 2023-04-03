Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C9B6D3DEE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 09:15:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjENw-0003Af-Dy; Mon, 03 Apr 2023 03:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pjENl-0003AC-Ub
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:13:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pjENj-0001KI-OJ
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680506013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HPaJccEIbufahlWEDRXHQ8z3tRX6nxKYZWhFBUrA/vw=;
 b=DBCeuH1TpCXXdjhO6Z0OHMtn2OUw8OZvRPxHRzsVQGBfwBhZl2/KQ6pePxWQLczWGjAR1Z
 lHK+nuxMe63VahFpx2gQe3IZs8HIsFPMOOnDEj21B1/D2LYj2+jKebYs6gocec5pox8kiO
 NxbqOT9c11ZOLVx5AO1uSJEdZJp73p0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-hVdl53z6O9exSQdLHNJP7w-1; Mon, 03 Apr 2023 03:13:32 -0400
X-MC-Unique: hVdl53z6O9exSQdLHNJP7w-1
Received: by mail-wr1-f70.google.com with SMTP id
 b14-20020a05600003ce00b002cfefd8e637so2988224wrg.15
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 00:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680506011;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :content-language:references:cc:to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HPaJccEIbufahlWEDRXHQ8z3tRX6nxKYZWhFBUrA/vw=;
 b=GfvdwTWzXwbZHqoJwYa/VuYI5AeB2RNUvAhpR8dKvB/CLw0QO6HEVGu+4RnrtLq4XW
 msmSoduxLGg4EJyn5H25OBEkZE2TSZO8GmfXQeryDrcNGcLIN0ht409Tbzsl/1Iz3KXK
 1WtAkVDGc5XucLvW8Dvw9U2rJm8xd4YoLyJAIm8oh34ACENjH3Rmc4J2Yq/3GfCsyNv4
 6DRkGDnoLn0WgQreIORC3TgYR66pbJAxB5DGavVcZNnf11jkogDnLDvOdYKl6T3uvHFT
 bgPLzsVYlGkpcoejdDYXUkDZTfB4wpIkylK7MCAM5yrqFFyewktGtdhiyGb3SxrhUAkv
 ikTQ==
X-Gm-Message-State: AO0yUKWGm3vj8WXdnuuIWY/grUiEDGT57kHgocEUGt9iP5K6oqJctcky
 xgAXQwLqm4HwvHy8x9/0TBlggltihQRi1t5wG4tJRemNwpiPiRN5RQZ9rf1FMv67JRK/W96NxJs
 Y2bFDGA3AweF3kmY=
X-Received: by 2002:a7b:c5c8:0:b0:3eb:2de8:b739 with SMTP id
 n8-20020a7bc5c8000000b003eb2de8b739mr25407139wmk.37.1680506011062; 
 Mon, 03 Apr 2023 00:13:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set/NPN/xIz60IZp6r8tdlqWRCeT6tK0qgF3SrQpWsWeufeR3YZvo44XbGNxQBWkW42GlTA4xYQ==
X-Received: by 2002:a7b:c5c8:0:b0:3eb:2de8:b739 with SMTP id
 n8-20020a7bc5c8000000b003eb2de8b739mr25407110wmk.37.1680506010671; 
 Mon, 03 Apr 2023 00:13:30 -0700 (PDT)
Received: from [192.168.3.108] (p5b0c69e9.dip0.t-ipconnect.de. [91.12.105.233])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a7bc8cb000000b003edff838723sm11147646wml.3.2023.04.03.00.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 00:13:30 -0700 (PDT)
Message-ID: <f2e232df-51d4-9cac-557d-329523a69530@redhat.com>
Date: Mon, 3 Apr 2023 09:13:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
To: Stefan Hajnoczi <stefanha@redhat.com>, Alexander Graf <graf@amazon.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Eric Blake <eblake@redhat.com>,
 Philippe Mathieu-Daude <philmd@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
References: <20230401124257.24537-1-graf@amazon.com>
 <20230401174716.GB154566@fedora>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4] hostmem-file: add offset option
In-Reply-To: <20230401174716.GB154566@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.37, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 01.04.23 19:47, Stefan Hajnoczi wrote:
> On Sat, Apr 01, 2023 at 12:42:57PM +0000, Alexander Graf wrote:
>> Add an option for hostmem-file to start the memory object at an offset
>> into the target file. This is useful if multiple memory objects reside
>> inside the same target file, such as a device node.
>>
>> In particular, it's useful to map guest memory directly into /dev/mem
>> for experimentation.
>>
>> Signed-off-by: Alexander Graf <graf@amazon.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@gmail.com>
>>
>> ---
>>
>> v1 -> v2:
>>
>>    - add qom documentation
>>    - propagate offset into truncate, size and alignment checks
>>
>> v2 -> v3:
>>
>>    - failed attempt at fixing typo
>>
>> v2 -> v4:
>>
>>    - fix typo
>> ---
>>   backends/hostmem-file.c | 40 +++++++++++++++++++++++++++++++++++++++-
>>   include/exec/memory.h   |  2 ++
>>   include/exec/ram_addr.h |  3 ++-
>>   qapi/qom.json           |  5 +++++
>>   qemu-options.hx         |  6 +++++-
>>   softmmu/memory.c        |  3 ++-
>>   softmmu/physmem.c       | 14 ++++++++++----
>>   7 files changed, 65 insertions(+), 8 deletions(-)
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

The change itself looks good to me, but I do think some other QEMU code 
that ends up working on the RAMBlock is not prepared yet. Most probably, 
because we never ended up using fd with an offset as guest RAM.

We don't seem to be remembering that offset in the RAMBlock. First, I 
thought block->offset would be used for that, but that's just the offset 
in the ram_addr_t space. Maybe we need a new "block->fd_offset" to 
remember the offset (unless I am missing something).

The real offset in the file would be required at least in two cases I 
can see (whenever we essentially end up calling mmap() on the fd again):

1) qemu_ram_remap(): We'd have to add the file offset on top of the 
calculated offset.

2) vhost-user: most probably whenever we set the mmap_offset. For 
example, in vhost_user_fill_set_mem_table_msg() we'd similarly have to 
add the file_offset on top of the calculated offset. 
vhost_user_get_mr_data() should most probably do that.

-- 
Thanks,

David / dhildenb


