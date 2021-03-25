Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0984B348D3B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 10:42:06 +0100 (CET)
Received: from localhost ([::1]:48748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPMVB-0005rl-3z
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 05:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lPMTZ-0004vA-RO
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 05:40:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lPMTV-00012e-M7
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 05:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616665218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ybhcc5geIY08QUFeHHdQGwbx/Gk2F9IRaxOo5vK+O9k=;
 b=GrMYm2uuY5SUzeJ6OPZ8JKmNqPfJuYhQYKlSXxaBGy55YbLaaLdbI2uaTwYXH/KAPUYzwN
 qAl1QbWcCAiiPZrqRVDC8c9lUvSidMj+TPB1/YQHyCSADkFkYMOzP1tvDqtscRaWYv89Si
 3tzr41Ovqn8iSJzmNkGyq5rnY5Njld4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-bFco39YbOS2P9TSnTfFsOg-1; Thu, 25 Mar 2021 05:40:16 -0400
X-MC-Unique: bFco39YbOS2P9TSnTfFsOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3DD087A83A;
 Thu, 25 Mar 2021 09:40:15 +0000 (UTC)
Received: from [10.36.115.72] (ovpn-115-72.ams2.redhat.com [10.36.115.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A5F1196A8;
 Thu, 25 Mar 2021 09:40:04 +0000 (UTC)
Subject: Re: [PATCH v4 09/14] util/mmap-alloc: Pass flags instead of separate
 bools to qemu_ram_mmap()
To: Peter Xu <peterx@redhat.com>
References: <20210319101230.21531-1-david@redhat.com>
 <20210319101230.21531-10-david@redhat.com> <20210323204913.GL6486@xz-x1>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <3438a238-39d6-5585-f9fd-014c474bdeb0@redhat.com>
Date: Thu, 25 Mar 2021 10:40:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323204913.GL6486@xz-x1>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.03.21 21:49, Peter Xu wrote:
> On Fri, Mar 19, 2021 at 11:12:25AM +0100, David Hildenbrand wrote:
>> Let's pass flags instead of bools to prepare for passing other flags and
>> update the documentation of qemu_ram_mmap(). Introduce new QEMU_MAP_
>> flags that abstract the mmap() PROT_ and MAP_ flag handling and simplify
>> it.
>>
>> We expose only flags that are currently supported by qemu_ram_mmap().
>> Maybe, we'll see qemu_mmap() in the future as well that can implement these
>> flags.
>>
>> Note: We don't use MAP_ flags as some flags (e.g., MAP_SYNC) are only
>> defined for some systems and we want to always be able to identify
>> these flags reliably inside qemu_ram_mmap() -- for example, to properly
>> warn when some future flags are not available or effective on a system.
>> Also, this way we can simplify PROT_ handling as well.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   include/qemu/mmap-alloc.h | 16 +++++++++-------
>>   include/qemu/osdep.h      | 18 ++++++++++++++++++
>>   softmmu/physmem.c         |  8 +++++---
>>   util/mmap-alloc.c         | 15 ++++++++-------
>>   util/oslib-posix.c        |  3 ++-
>>   5 files changed, 42 insertions(+), 18 deletions(-)
>>
>> diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
>> index 456ff87df1..a60a2085b3 100644
>> --- a/include/qemu/mmap-alloc.h
>> +++ b/include/qemu/mmap-alloc.h
>> @@ -7,18 +7,22 @@ size_t qemu_fd_getpagesize(int fd);
>>   size_t qemu_mempath_getpagesize(const char *mem_path);
>>   
>>   /**
>> - * qemu_ram_mmap: mmap the specified file or device.
>> + * qemu_ram_mmap: mmap anonymous memory, the specified file or device.
>> + *
>> + * mmap() abstraction to map guest RAM, simplifying flag handling, taking
>> + * care of alignment requirements and installing guard pages.
>>    *
>>    * Parameters:
>>    *  @fd: the file or the device to mmap
>>    *  @size: the number of bytes to be mmaped
>>    *  @align: if not zero, specify the alignment of the starting mapping address;
>>    *          otherwise, the alignment in use will be determined by QEMU.
>> - *  @readonly: true for a read-only mapping, false for read/write.
>> - *  @shared: map has RAM_SHARED flag.
>> - *  @is_pmem: map has RAM_PMEM flag.
>> + *  @qemu_map_flags: QEMU_MAP_* flags
>>    *  @map_offset: map starts at offset of map_offset from the start of fd
>>    *
>> + * Internally, MAP PRIVATE, MAP_ANONYMOUS and MAP_SHARED_VALIDATE are set
>                       ^
>                       |
>                       +---- underscore
> 

Nice catch, thanks :)


-- 
Thanks,

David / dhildenb


