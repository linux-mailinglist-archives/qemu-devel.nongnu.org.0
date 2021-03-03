Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43C032B7C7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:26:11 +0100 (CET)
Received: from localhost ([::1]:45796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQZu-0002HF-Mw
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHQYM-0001hL-7Y
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:24:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lHQYK-0008Iu-Kz
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:24:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614774271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=chYU7WqnLFJ21vl7f9w7xry2Yuqgeij98GlbitlpDNk=;
 b=WmTe+pJ7su08G/tcFMVwA9/0r8KFZ8bSEERC6SPAFlXyar2geWLPOk9ZDnoFyTFS/wIczV
 9EuGU6hsyyp7aNRH/PH3RznwP0HQYx//lWdAmw8RxLqCpvYjXBsxqmWnASVKs1khyfAOdR
 bEGAlVNwbBFwgwZHyHJLMfwCmXNy0Xw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-EdxyWr28PqWJADuF6gFd_w-1; Wed, 03 Mar 2021 07:24:28 -0500
X-MC-Unique: EdxyWr28PqWJADuF6gFd_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFF4C8017FF;
 Wed,  3 Mar 2021 12:24:25 +0000 (UTC)
Received: from [10.36.112.28] (ovpn-112-28.ams2.redhat.com [10.36.112.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FEB06085D;
 Wed,  3 Mar 2021 12:24:12 +0000 (UTC)
Subject: Re: [PATCH v1 7/9] memory: introduce RAM_NORESERVE and wire it up in
 qemu_ram_mmap()
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20210209134939.13083-1-david@redhat.com>
 <20210209134939.13083-8-david@redhat.com> <20210302173243.GM397383@xz-x1>
 <91613148-9ade-c192-4b73-0cb5a54ada98@redhat.com>
 <20210303123517.04729c1e.cohuck@redhat.com>
 <656d4494-ea36-39c2-2d47-bbb044a67f11@redhat.com>
 <104f9788-dee2-29ba-5b53-d358f2252cf8@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <72dd331f-2026-6da9-9089-7c4d1c2ffec8@redhat.com>
Date: Wed, 3 Mar 2021 13:24:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <104f9788-dee2-29ba-5b53-d358f2252cf8@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.03.21 13:12, Thomas Huth wrote:
> On 03/03/2021 12.37, David Hildenbrand wrote:
>> On 03.03.21 12:35, Cornelia Huck wrote:
>>> On Tue, 2 Mar 2021 20:02:34 +0100
>>> David Hildenbrand <david@redhat.com> wrote:
>>>
>>>> On 02.03.21 18:32, Peter Xu wrote:
>>>>> On Tue, Feb 09, 2021 at 02:49:37PM +0100, David Hildenbrand wrote:
>>>>>> @@ -899,13 +899,17 @@ int kvm_s390_mem_op_pv(S390CPU *cpu, uint64_t
>>>>>> offset, void *hostbuf,
>>>>>>      * to grow. We also have to use MAP parameters that avoid
>>>>>>      * read-only mapping of guest pages.
>>>>>>      */
>>>>>> -static void *legacy_s390_alloc(size_t size, uint64_t *align, bool shared)
>>>>>> +static void *legacy_s390_alloc(size_t size, uint64_t *align, bool shared,
>>>>>> +                               bool noreserve)
>>>>>>     {
>>>>>>         static void *mem;
>>>>>>         if (mem) {
>>>>>>             /* we only support one allocation, which is enough for
>>>>>> initial ram */
>>>>>>             return NULL;
>>>>>> +    } else if (noreserve) {
>>>>>> +        error_report("Skipping reservation of swap space is not
>>>>>> supported.");
>>>>>> +        return NULL
>>>>>
>>>>> Semicolon missing.
>>>>
>>>> Thanks for catching that!
>>>
>>> Regardless of that (and this patch set), can we finally get rid of
>>> legacy_s390_alloc? We already fence off running with a kernel prior to
>>> 3.15, and KVM_CAP_S390_COW depends on ESOP -- are non-ESOP kvm hosts
>>> still relevant? This seems to be a generation 10 feature; do we
>>> realistically expect anyone running this on e.g. a z/VM host that
>>> doesn't provide ESOP?
>>
>> Good question - last time I asked that question (~2 years ago) I was told
>> that such z/VM environemnts are still relevant.
> 
> Now that you've mentioned it ... I've even wrote a blog post about z/VM and
> ESOP some years ago:
> 
>   
> http://people.redhat.com/~thuth/blog/qemu/2017/04/05/s390x-selinux-problem.html
> 
> So if I've got that right again, the z/VM ESOP problem only exists on
> versions older than 6.3. And according to
> https://www.ibm.com/support/lifecycle/search?q=z%2FVM those old versions are
> now unsupported since June 2017 ... thus I guess it's valid to assume that
> nobody is running such an old z/VM version anymore (at least not to use it
> as an environment to run nested KVM guests).

Thanks for that info, I'll send a patch proposing to rip it out - that 
will make things nicer.

-- 
Thanks,

David / dhildenb


