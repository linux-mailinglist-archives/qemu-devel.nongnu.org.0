Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB4032AA55
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:26:32 +0100 (CET)
Received: from localhost ([::1]:54008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAf9-0003zl-6T
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:26:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHAIH-00016J-8l
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:02:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHAIE-0000PJ-J0
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:02:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614711769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pNI+Ky/EAJ5ZEIbf6MYJ2/dtzIOLZZYEqaCFj9rQGv8=;
 b=EfSyo0vU3h8mMd5QSaqro0qMJ84PLkp5iJlwSJ4rL4Bcpzcd6VL89o2P0yATXgpYdtiow0
 lGsVquvwP/YYI6NqgEEMhIWEXjUsU1cEG2nLors0KL5WMl2/8SLik7nTPSutxm+PpCBQoP
 IKDadMnSDfkjwlreCVryioEy0Y0kDVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-O-lWEGKGMTus8FZOmVjsuA-1; Tue, 02 Mar 2021 14:02:48 -0500
X-MC-Unique: O-lWEGKGMTus8FZOmVjsuA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 763BC102C851;
 Tue,  2 Mar 2021 19:02:39 +0000 (UTC)
Received: from [10.36.114.189] (ovpn-114-189.ams2.redhat.com [10.36.114.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 814B16C941;
 Tue,  2 Mar 2021 19:02:35 +0000 (UTC)
Subject: Re: [PATCH v1 7/9] memory: introduce RAM_NORESERVE and wire it up in
 qemu_ram_mmap()
To: Peter Xu <peterx@redhat.com>
References: <20210209134939.13083-1-david@redhat.com>
 <20210209134939.13083-8-david@redhat.com> <20210302173243.GM397383@xz-x1>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <91613148-9ade-c192-4b73-0cb5a54ada98@redhat.com>
Date: Tue, 2 Mar 2021 20:02:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210302173243.GM397383@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.03.21 18:32, Peter Xu wrote:
> On Tue, Feb 09, 2021 at 02:49:37PM +0100, David Hildenbrand wrote:
>> @@ -899,13 +899,17 @@ int kvm_s390_mem_op_pv(S390CPU *cpu, uint64_t offset, void *hostbuf,
>>    * to grow. We also have to use MAP parameters that avoid
>>    * read-only mapping of guest pages.
>>    */
>> -static void *legacy_s390_alloc(size_t size, uint64_t *align, bool shared)
>> +static void *legacy_s390_alloc(size_t size, uint64_t *align, bool shared,
>> +                               bool noreserve)
>>   {
>>       static void *mem;
>>   
>>       if (mem) {
>>           /* we only support one allocation, which is enough for initial ram */
>>           return NULL;
>> +    } else if (noreserve) {
>> +        error_report("Skipping reservation of swap space is not supported.");
>> +        return NULL
> 
> Semicolon missing.

Thanks for catching that!

> 
>>       }
>>   
>>       mem = mmap((void *) 0x800000000ULL, size,
>> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
>> index b50dc86a3c..bb99843106 100644
>> --- a/util/mmap-alloc.c
>> +++ b/util/mmap-alloc.c
>> @@ -20,6 +20,7 @@
>>   #include "qemu/osdep.h"
>>   #include "qemu/mmap-alloc.h"
>>   #include "qemu/host-utils.h"
>> +#include "qemu/error-report.h"
>>   
>>   #define HUGETLBFS_MAGIC       0x958458f6
>>   
>> @@ -174,12 +175,18 @@ void *qemu_ram_mmap(int fd,
>>                       size_t align,
>>                       bool readonly,
>>                       bool shared,
>> -                    bool is_pmem)
>> +                    bool is_pmem,
>> +                    bool noreserve)
> 
> Maybe at some point we should use flags too here to cover all bools.
> 

Right. I guess the main point was to not reuse RAM_XXX.

Should I introduce RAM_MMAP_XXX ?

Thanks!

-- 
Thanks,

David / dhildenb


