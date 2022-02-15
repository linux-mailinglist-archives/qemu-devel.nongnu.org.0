Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE05F4B691B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:20:48 +0100 (CET)
Received: from localhost ([::1]:48688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuww-0004jW-Mw
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:20:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nJuNe-0007lK-89
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:44:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nJuNa-0001vY-Od
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:44:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644918252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kEHFxadDqGmpVBVNAP5NcKs4lKmRz8+HD+p60zoV9Vs=;
 b=OFwVVawXQ2CPAYMhkzZZmIsgQkdfqO1IjSHVFkm/t8yt5QnZvzYyAwMa6asZqh5+IeMbvC
 hYtdsgx6BGugSwjTUfEeeMsK/P3OYlRuJbDERLrNXmcm5Q6Ee6YAjRgnsto96enELQmNKS
 vQ79ALBvI3LegSN4nkJ2BWS8oMBm+Yc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-TSkUAP-6O4q6Igrmw_LePA-1; Tue, 15 Feb 2022 04:44:06 -0500
X-MC-Unique: TSkUAP-6O4q6Igrmw_LePA-1
Received: by mail-ed1-f72.google.com with SMTP id
 cr7-20020a056402222700b0040f59dae606so12025789edb.11
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=kEHFxadDqGmpVBVNAP5NcKs4lKmRz8+HD+p60zoV9Vs=;
 b=b05MUWj0Fgjmclg4sYS+qDZkH2dFKH3sqsdR4s2/tpPcQAxBh26JW991l0CO4uuRsB
 MH9hwuVW+drrsKq7WpC2scgPHVZF4BoTny2/9HnoVItlWfHNjQMELYkzbfx+Zp+4komO
 ggaa+QVS7m4H559QLRvoT9ot+lhNcrkUND8Er0Jx8L/bZX52xfrtr0kKbTQnJAG3V+5k
 0WXPapPz/vp+oyZrGCM6PBUKT6vKdsPHtlQDhloSdPoNsK4ciBTd+k6XrrnKOZoZ1Cgg
 S8sw65NFSPtVXDrlP1i6rkCJTnjphFI+y00WB3hyvY+JlWI7AufTmZqxn+DhDs5mG17C
 h4eQ==
X-Gm-Message-State: AOAM532oEctzNOWjdUIaRmgiYKpDxvJdzOzJqxiQgW5Woxaq94GEQ+uM
 d79L67Q4lbbPpVAe2wKSGLrBxQFBKGu7Beb8XvfjxeO2vsR1gUVsuFFnsH4v0pgoRbi4uqTnMV2
 R7jig9G5ybe8I4l4=
X-Received: by 2002:aa7:dbcc:: with SMTP id v12mr2917238edt.263.1644918245357; 
 Tue, 15 Feb 2022 01:44:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyO75jgBs7lEuciLNlDnG5RuoOhxnVdzelJ+dJ17ha9luKtwxDqzmkLIX0wCbJk7D3PAwQdTQ==
X-Received: by 2002:aa7:dbcc:: with SMTP id v12mr2917211edt.263.1644918245087; 
 Tue, 15 Feb 2022 01:44:05 -0800 (PST)
Received: from ?IPV6:2003:cb:c70e:3700:9260:2fb2:742d:da3e?
 (p200300cbc70e370092602fb2742dda3e.dip0.t-ipconnect.de.
 [2003:cb:c70e:3700:9260:2fb2:742d:da3e])
 by smtp.gmail.com with ESMTPSA id g3sm8457289ejz.180.2022.02.15.01.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 01:44:04 -0800 (PST)
Message-ID: <86b5c589-c1d2-bd2b-12e4-9bec25d3a9ef@redhat.com>
Date: Tue, 15 Feb 2022 10:44:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: 9 TiB vm memory creation
To: Ani Sinha <ani@anisinha.ca>
References: <alpine.DEB.2.22.394.2202141048390.13781@anisinha-lenovo>
 <20220214133634.248d7de0@redhat.com>
 <b9771171-8d28-b46b-4474-687a8fed0abd@redhat.com>
 <alpine.DEB.2.22.394.2202151221090.13781@anisinha-lenovo>
 <b06ab7b0-61f2-5301-70f9-197dfd9527e9@redhat.com>
 <CAARzgwwDFybUsCj8Ym6kpcjNRCVV6vbsY7Lks0wsmrc2+ET03Q@mail.gmail.com>
 <492bd3a4-4a26-afc9-1268-74a9fd7f095a@redhat.com>
 <CAARzgwzd-p-GLOQ-VtBC2_-fd1=fg2rZU7t9XhVA1QSUe1vT0A@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAARzgwzd-p-GLOQ-VtBC2_-fd1=fg2rZU7t9XhVA1QSUe1vT0A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.02.22 10:40, Ani Sinha wrote:
> On Tue, Feb 15, 2022 at 2:08 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 15.02.22 09:12, Ani Sinha wrote:
>>> On Tue, Feb 15, 2022 at 1:25 PM David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>> On 15.02.22 08:00, Ani Sinha wrote:
>>>>>
>>>>>
>>>>> On Mon, 14 Feb 2022, David Hildenbrand wrote:
>>>>>
>>>>>> On 14.02.22 13:36, Igor Mammedov wrote:
>>>>>>> On Mon, 14 Feb 2022 10:54:22 +0530 (IST)
>>>>>>> Ani Sinha <ani@anisinha.ca> wrote:
>>>>>>>
>>>>>>>> Hi Igor:
>>>>>>>>
>>>>>>>> I failed to spawn a 9 Tib VM. The max I could do was a 2 TiB vm on my
>>>>>>>> system with the following commandline before either the system
>>>>>>>> destabilized or the OOM killed killed qemu
>>>>>>>>
>>>>>>>> -m 2T,maxmem=9T,slots=1 \
>>>>>>>> -object memory-backend-file,id=mem0,size=2T,mem-path=/data/temp/memfile,prealloc=off \
>>>>>>>> -machine memory-backend=mem0 \
>>>>>>>> -chardev file,path=/tmp/debugcon2.txt,id=debugcon \
>>>>>>>> -device isa-debugcon,iobase=0x402,chardev=debugcon \
>>>>>>>>
>>>>>>>> I have attached the debugcon output from 2 TiB vm.
>>>>>>>> Is there any other commandline parameters or options I should try?
>>>>>>>>
>>>>>>>> thanks
>>>>>>>> ani
>>>>>>>
>>>>>>> $ truncate -s 9T 9tb_sparse_disk.img
>>>>>>> $ qemu-system-x86_64 -m 9T \
>>>>>>>   -object memory-backend-file,id=mem0,size=9T,mem-path=9tb_sparse_disk.img,prealloc=off,share=on \
>>>>>>>   -machine memory-backend=mem0
>>>>>>>
>>>>>>> works for me till GRUB menu, with sufficient guest kernel
>>>>>>> persuasion (i.e. CLI limit ram size to something reasonable) you can boot linux
>>>>>>> guest on it and inspect SMBIOS tables comfortably.
>>>>>>>
>>>>>>>
>>>>>>> With KVM enabled it bails out with:
>>>>>>>    qemu-system-x86_64: kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=1, start=0x100000000, size=0x8ff40000000: Invalid argument
>>>>>>>
>>>>>
>>>>> I have seen this in my system but not always. Maybe I should have dug
>>>>> deeper as to why i do see this all the time.
>>>>>
>>>>>>> all of that on a host with 32G of RAM/no swap.
>>>>>>>
>>>>>
>>>>> My system in 16 Gib of main memory, no swap.
>>>>>
>>>>>>
>>>>>> #define KVM_MEM_MAX_NR_PAGES ((1UL << 31) - 1)
>>>>>>
>>>>>> ~8 TiB (7,999999)
>>>>>
>>>>> That's not 8 Tib, thats 2 GiB. But yes, 0x8ff40000000 is certainly greater
>>>>> than 2 Gib * 4K (assuming 4K size pages).
>>>>
>>>> "pages" don't carry the unit "GiB/TiB", so I was talking about the
>>>> actual size with 4k pages (your setup, I assume)
>>>
>>> yes I got that after reading your email again.
>>> The interesting question now is how is redhat QE running 9 TiB vm with kvm?
>>
>> As already indicated by me regarding s390x only having single large NUMA
>> nodes, x86 is usually using multiple NUMA nodes with such large memory.
>> And QE seems to be using virtual numa nodes:
>>
>> Each of the 32 virtual numa nodes receive a:
>>
>>   -object memory-backend-ram,id=ram-node20,size=309237645312,host-
>>    nodes=0-31,policy=bind
>>
>> which results in a dedicated KVM memslot (just like each DIMM would)
>>
>>
>> 32 * 309237645312 == 9 TiB :)
> 
> ah, I should have looked closely at the other commandlines before
> shooting off the email. Yes the limitation is per mem-slot and they
> have 32 slots one per node.
> ok so should we do
> kvm_set_max_memslot_size(KVM_SLOT_MAX_BYTES);
> from i386 kvm_arch_init()?


As I said, I'm not a friend of these workarounds in user space.

Assume you have one KVM memslot left and you hotplug a huge DIMM that
will consume more than one KVM memslot -- you're in trouble, because
hotplug will succeed but creating the second memslot will fail. So you
need additional logic in memory device code to special-case on these
corner cases.

We should try increasing the limit in KVM and handle it gracefully in
QEMU. But that's just my 2 cents.

-- 
Thanks,

David / dhildenb


