Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1ED5EF794
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:32:35 +0200 (CEST)
Received: from localhost ([::1]:59670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oduaY-0002XQ-8u
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odscA-0005o8-AN
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:26:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1odsc6-0000eH-Vj
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:26:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664454357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Fqe0HXfjYxu6rFTstW918vj1wY0y0gIGvo5W4jP1oo=;
 b=EVjncy8fErBePBjt+wB82wg4SV4ecVp+kCxfaCU/ZDoikRLIic8D4ciyE6MrTM+Tnl4rwX
 HzYJ2k+oP5IJr81vLW96kdPu//G3QdT7Dkh5ciShlMZ5h1UFRdog2xsXpUqUmC92nKxqut
 JcbDYPQcwdO+IM68x7vAAkzYGib4x6E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-m8Jr10F9Mku6zkjEzkThCw-1; Thu, 29 Sep 2022 08:25:55 -0400
X-MC-Unique: m8Jr10F9Mku6zkjEzkThCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 952E63C025BF;
 Thu, 29 Sep 2022 12:25:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3726A40C206B;
 Thu, 29 Sep 2022 12:25:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C5BC621E691D; Thu, 29 Sep 2022 14:25:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  Michal Privoznik <mprivozn@redhat.com>,  Igor
 Mammedov <imammedo@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v1 3/7] util: Introduce ThreadContext user-creatable object
References: <20220928164542.117952-1-david@redhat.com>
 <20220928164542.117952-4-david@redhat.com>
 <87fsgatowz.fsf@pond.sub.org>
 <27748202-1370-dff7-29da-7bcf4226c227@redhat.com>
Date: Thu, 29 Sep 2022 14:25:53 +0200
In-Reply-To: <27748202-1370-dff7-29da-7bcf4226c227@redhat.com> (David
 Hildenbrand's message of "Thu, 29 Sep 2022 13:18:48 +0200")
Message-ID: <87wn9mqsdq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> writes:

> On 29.09.22 13:12, Markus Armbruster wrote:
>> David Hildenbrand <david@redhat.com> writes:
>> 
>>> Setting the CPU affinity of QEMU threads is a bit problematic, because
>>> QEMU doesn't always have permissions to set the CPU affinity itself,
>>> for example, with seccomp after initialized by QEMU:
>>>      -sandbox enable=on,resourcecontrol=deny
>>>
>>> While upper layers are already aware how to handl;e CPU affinities for
>>
>> Typo in handle.
>
> Thanks!
>
>> 
>>> long-lived threads like iothreads or vcpu threads, especially short-lived
>>> threads, as used for memory-backend preallocation, are more involved to
>>> handle. These threads are created on demand and upper layers are not even
>>> able to identify and configure them.
>>>
>>> Introduce the concept of a ThreadContext, that is essentially a thread
>>> used for creating new threads. All threads created via that context
>>> thread inherit the configured CPU affinity. Consequently, it's
>>> sufficient to create a ThreadContext and configure it once, and have all
>>> threads created via that ThreadContext inherit the same CPU affinity.
>>>
>>> The CPU affinity of a ThreadContext can be configured two ways:
>>>
>>> (1) Obtaining the thread id via the "thread-id" property and setting the
>>>      CPU affinity manually.
>>>
>>> (2) Setting the "cpu-affinity" property and letting QEMU try set the
>>>      CPU affinity itself. This will fail if QEMU doesn't have permissions
>>>      to do so anymore after seccomp was initialized.
>>
>> Could you provide usage examples?
>
> Patch #7 and the cover letter contain examples. I can add another example here.

Yes, please.

>>> +##
>>> +# @ThreadContextProperties:
>>> +#
>>> +# Properties for thread context objects.
>>> +#
>>> +# @cpu-affinity: the CPU affinity for all threads created in the thread
>>> +#                context (default: QEMU main thread affinity)
>>> +#
>>> +# Since: 7.2
>>> +##
>>> +{ 'struct': 'ThreadContextProperties',
>>> +  'data': { '*cpu-affinity': ['uint16'] } }
>>
>> I understand this is a list of affinities.  What I poor ignorant me
>> doesn't understand is the meaning of the list index.  Or in other words,
>> the list maps some range [0:N] to affinities, but what are the numbers
>> being mapped there?
>
> Assume you have 8 physical CPUs.
>
> $ lscpu
> ...
>
> NUMA:
>   NUMA node(s):          1
>   NUMA node0 CPU(s):     0-7
> ...
>
> You will provide the CPU IDs here, for example as in patch #7 example:
>
> qemu-system-x86_64 -m 1G \
>  -object thread-context,id=tc1,cpu-affinity=3-4 \
>  -object memory-backend-ram,id=pc.ram,size=1G,prealloc=on,prealloc-threads=2,prealloc-context=tc1 
> \
>  -machine memory-backend=pc.ram \
>  -S -monitor stdio -sandbox enable=on,resourcecontrol=deny
>
>
> Details about CPU affinities in general can be found in the man page of taskset:
>
> https://man7.org/linux/man-pages/man1/taskset.1.html

Is @cpu-affinity a set of CPU numbers?

> Please let me know how I can further clarify this, that would help, thanks!

What happens when you try to create a thread context object with CPU
affinities on a host system that doesn't support CPU affinities?


