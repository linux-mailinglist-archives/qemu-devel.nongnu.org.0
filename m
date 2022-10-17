Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BB9600DDC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 13:34:42 +0200 (CEST)
Received: from localhost ([::1]:56844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okOOG-0001Th-Ts
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 07:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1okOJ0-0007au-TE
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:29:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1okOIs-00060G-JD
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666006145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pb/9wU4qHZAVuVsI0JtSAfQ68ahpIHKe5OmFgdjSFug=;
 b=cIYWuQ16eSY7yLiUd0SuDJb1F98uBhLSg3l+fb+3cLnlcFtPSFcpkOwWIFG4pgFOuRqs7k
 QbepCfZyX8RKEMMQKY0Fd7qJTpxGkTTPWEcHnPyu+aZ+6bKGfmzX2AsDWO/iyLgIbr8UdM
 dca0sQqaojHG4jiQwa8g4oBbWnjV6xg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-22-NW7HqPKDMqmPhOHVXql7Zg-1; Mon, 17 Oct 2022 07:29:03 -0400
X-MC-Unique: NW7HqPKDMqmPhOHVXql7Zg-1
Received: by mail-wr1-f69.google.com with SMTP id
 h17-20020adfaa91000000b0022e9f2245c8so3589799wrc.19
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 04:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pb/9wU4qHZAVuVsI0JtSAfQ68ahpIHKe5OmFgdjSFug=;
 b=RRzZMknxprfJPye/QAAC+3eJ4ckhf+ZM/Fvol+KOLD6QVtHJNdzcsooIdKIybu5CoF
 /K44G0AbPwPutaJgn1oFJ6Vo2fvQ/hZ1PKgodOmT0NTGL4HCM/pdz90A8dzMhRvLnQLs
 Y1++6eqnkN4TYFdAyqcl3x5WBn9OL9O/Z+/9+tMKzwwBcsq7cvmwxuAW5CaBZIguxE16
 GCuicktULjesYv1nM8zCGXBOk0abB9PxEo6wWNYLlKbHS/kKvv+EFI92YduTVBDjVmLo
 yqGgRtY1irnopoxQ5hs/wa9LtYZ7nTeA5kbdNtdCkoLtwt5x/P3UlEzAkivHxQm8DCul
 xeEw==
X-Gm-Message-State: ACrzQf1g7WchX1akVOLm8nrkrY0nVEP/2KNkhNRMdGkX4W6Kd89PE7wm
 /BVSDivVaBC45flULj+4Cd1mfbbD+C0otxmCpSsNYu2V/vX9Uz1a1IZNXBP3WDREfCt45WkbQHH
 0iW+4g07lNl82kJA=
X-Received: by 2002:a5d:6387:0:b0:22f:1880:d68e with SMTP id
 p7-20020a5d6387000000b0022f1880d68emr5772474wru.322.1666006142658; 
 Mon, 17 Oct 2022 04:29:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5uCIGLiAD4p6/HsyafK+BhGvLzWg8IGudSAqBWs+eYOKI5N1MtrhzDoO5a9RkSX3XNTlTX2Q==
X-Received: by 2002:a5d:6387:0:b0:22f:1880:d68e with SMTP id
 p7-20020a5d6387000000b0022f1880d68emr5772455wru.322.1666006142363; 
 Mon, 17 Oct 2022 04:29:02 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70a:a00:37ed:519:6c33:4dc8?
 (p200300cbc70a0a0037ed05196c334dc8.dip0.t-ipconnect.de.
 [2003:cb:c70a:a00:37ed:519:6c33:4dc8])
 by smtp.gmail.com with ESMTPSA id
 e9-20020adffc49000000b002206203ed3dsm8187432wrs.29.2022.10.17.04.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 04:29:01 -0700 (PDT)
Message-ID: <35228940-dcae-172e-a29c-01ae2aaaa3bf@redhat.com>
Date: Mon, 17 Oct 2022 13:29:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 4/7] util: Add write-only "node-affinity" property for
 ThreadContext
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20221014134720.168738-1-david@redhat.com>
 <20221014134720.168738-5-david@redhat.com> <87lepe96c1.fsf@pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <87lepe96c1.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.10.22 10:56, Markus Armbruster wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> Let's make it easier to pin threads created via a ThreadContext to
>> all host CPUs currently belonging to a given set of host NUMA nodes --
>> which is the common case.
>>
>> "node-affinity" is simply a shortcut for setting "cpu-affinity" manually
>> to the list of host CPUs belonging to the set of host nodes. This property
>> can only be written.
>>
>> A simple QEMU example to set the CPU affinity to host node 1 on a system
>> with two nodes, 24 CPUs each, whereby odd-numbered host CPUs belong to
>> host node 1:
>>      qemu-system-x86_64 -S \
>>        -object thread-context,id=tc1,node-affinity=1
>>
>> And we can query the cpu-affinity via HMP/QMP:
>>      (qemu) qom-get tc1 cpu-affinity
>>      [
>>          1,
>>          3,
>>          5,
>>          7,
>>          9,
>>          11,
>>          13,
>>          15,
>>          17,
>>          19,
>>          21,
>>          23,
>>          25,
>>          27,
>>          29,
>>          31,
>>          33,
>>          35,
>>          37,
>>          39,
>>          41,
>>          43,
>>          45,
>>          47
>>      ]
>>
>> We cannot query the node-affinity:
>>      (qemu) qom-get tc1 node-affinity
>>      Error: Insufficient permission to perform this operation
>>
>> But note that due to dynamic library loading this example will not work
>> before we actually make use of thread_context_create_thread() in QEMU
>> code, because the type will otherwise not get registered. We'll wire
>> this up next to make it work.
>>
>> Note that if the host CPUs for a host node change due do CPU hot(un)plug
>> CPU onlining/offlining (i.e., lscpu output changes) after the ThreadContext
>> was started, the CPU affinity will not get updated.
>>
>> Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
>> Acked-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   qapi/qom.json         |  9 ++++-
>>   util/meson.build      |  2 +-
>>   util/thread-context.c | 84 +++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 93 insertions(+), 2 deletions(-)
>>
>> diff --git a/qapi/qom.json b/qapi/qom.json
>> index 8013ba4b82..5a2db663f0 100644
>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -839,10 +839,17 @@
>>   #                threads created in the thread context (default: QEMU main
>>   #                thread CPU affinity)
>>   #
>> +# @node-affinity: the list of host node numbers that will be resolved to a list
>> +#                 of host CPU numbers used as CPU affinity. This is a shortcut
>> +#                 for specifying the list of host CPU numbers belonging to the
>> +#                 host nodes manually by setting @cpu-affinity. (default: QEMU
>> +#                 main thread affinity)
> 
> Would you mind breaking these lines a bit earlier, like you did for the
> previous member?

Done!

-- 
Thanks,

David / dhildenb


