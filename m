Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E274B6839
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:54:49 +0100 (CET)
Received: from localhost ([::1]:52620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuXo-0001Zr-8t
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:54:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nJuUp-0002HO-Vg
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:51:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nJuUe-00034B-T9
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644918692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0hsH7ZT/PI23KOIyk4Z/0SjXihqf3zklroTj+29hySM=;
 b=Bt8QJAn2Xd1V94igkeZioDqrS9fj1iEgHv/33NEuhpjYc6WhZ6LiSbjgESaH9GGtBLE6l8
 qQXMkyFbsa2MBqUsHDdIZOnE253o5zKk/Ti+ogEqdtwpddV3a9rrxmVfz3KA0lnlJSAIuc
 OzuqrXZK8Dh9TSr5X/gqMiYfSINHRkk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-UjO0AUpLPkm8ZmyYf_vAyg-1; Tue, 15 Feb 2022 04:51:28 -0500
X-MC-Unique: UjO0AUpLPkm8ZmyYf_vAyg-1
Received: by mail-wr1-f70.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so8129521wrc.5
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:51:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0hsH7ZT/PI23KOIyk4Z/0SjXihqf3zklroTj+29hySM=;
 b=PihURQ9ytk/VSALWNV5nktYt7w2YoGXuiCsm24TdyeSHql5whsVFsmqpn/ok06DUb1
 2FMPcI0zIH63uniBITBv68dKiB8kk5i5eyHMNTQm4FF6KvAgxjmumLOzxMXKjgvEvZKW
 LTGJ1U/oqZ7Twux3Ykv6/zGDYFRFTclAbcRkhvmTOPFJ8OuThHI+KC342PnUsrARSY6p
 RDToEBxdP5QTR1HbSRpYPZ5XfccsA/vnArjEX9rdc/sHZI+hPftgXIbP2jPqgGdCaiOu
 nYOZs/9PTPWj0aYX5cJv5dlCfNsXCn6zuvqCqMij/6y9S2Tyi32V2FrvSoxmv8J5KkIw
 z3Jw==
X-Gm-Message-State: AOAM533P2mQZLasy8PPYA8RdqVyIEqIaE7WmWNj3RL9pwDHQnngCWhCX
 2Hh46FjYn8NgwCERj6iDakLe/4IZILIb8tlGpV/BHc/iGZcfGFyTUK150WvuQqWMfaUfP1NXCOF
 ulfLxKiYkXjtWiyY=
X-Received: by 2002:a1c:a552:0:b0:37b:c7e2:e4ed with SMTP id
 o79-20020a1ca552000000b0037bc7e2e4edmr2369527wme.34.1644918687336; 
 Tue, 15 Feb 2022 01:51:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzN1n2qFTA1kapWfkTJByuFBhDdSIs8Bk07qfvrGzSmdvv2RlvMiUGxhGsvslbJ4vNWcAalVg==
X-Received: by 2002:a1c:a552:0:b0:37b:c7e2:e4ed with SMTP id
 o79-20020a1ca552000000b0037bc7e2e4edmr2369500wme.34.1644918687043; 
 Tue, 15 Feb 2022 01:51:27 -0800 (PST)
Received: from ?IPV6:2003:cb:c70e:3700:9260:2fb2:742d:da3e?
 (p200300cbc70e370092602fb2742dda3e.dip0.t-ipconnect.de.
 [2003:cb:c70e:3700:9260:2fb2:742d:da3e])
 by smtp.gmail.com with ESMTPSA id g8sm17617928wrd.9.2022.02.15.01.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 01:51:26 -0800 (PST)
Message-ID: <dcb41232-ccaf-d747-35c3-359459f62689@redhat.com>
Date: Tue, 15 Feb 2022 10:51:26 +0100
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
 <86b5c589-c1d2-bd2b-12e4-9bec25d3a9ef@redhat.com>
 <CAARzgwzYvk=pLz3gHX_Q3gTsJzog+S1mmB-ob6N=hY_odqA7Hw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAARzgwzYvk=pLz3gHX_Q3gTsJzog+S1mmB-ob6N=hY_odqA7Hw@mail.gmail.com>
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

On 15.02.22 10:48, Ani Sinha wrote:
> On Tue, Feb 15, 2022 at 3:14 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 15.02.22 10:40, Ani Sinha wrote:
>>> On Tue, Feb 15, 2022 at 2:08 PM David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>> On 15.02.22 09:12, Ani Sinha wrote:
>>>>> On Tue, Feb 15, 2022 at 1:25 PM David Hildenbrand <david@redhat.com> wrote:
>>>>>>
>>>>>> On 15.02.22 08:00, Ani Sinha wrote:
>>>>>>>
>>>>>>>
>>>>>>> On Mon, 14 Feb 2022, David Hildenbrand wrote:
>>>>>>>
>>>>>>>> On 14.02.22 13:36, Igor Mammedov wrote:
>>>>>>>>> On Mon, 14 Feb 2022 10:54:22 +0530 (IST)
>>>>>>>>> Ani Sinha <ani@anisinha.ca> wrote:
>>>>>>>>>
>>>>>>>>>> Hi Igor:
>>>>>>>>>>
>>>>>>>>>> I failed to spawn a 9 Tib VM. The max I could do was a 2 TiB vm on my
>>>>>>>>>> system with the following commandline before either the system
>>>>>>>>>> destabilized or the OOM killed killed qemu
>>>>>>>>>>
>>>>>>>>>> -m 2T,maxmem=9T,slots=1 \
>>>>>>>>>> -object memory-backend-file,id=mem0,size=2T,mem-path=/data/temp/memfile,prealloc=off \
>>>>>>>>>> -machine memory-backend=mem0 \
>>>>>>>>>> -chardev file,path=/tmp/debugcon2.txt,id=debugcon \
>>>>>>>>>> -device isa-debugcon,iobase=0x402,chardev=debugcon \
>>>>>>>>>>
>>>>>>>>>> I have attached the debugcon output from 2 TiB vm.
>>>>>>>>>> Is there any other commandline parameters or options I should try?
>>>>>>>>>>
>>>>>>>>>> thanks
>>>>>>>>>> ani
>>>>>>>>>
>>>>>>>>> $ truncate -s 9T 9tb_sparse_disk.img
>>>>>>>>> $ qemu-system-x86_64 -m 9T \
>>>>>>>>>   -object memory-backend-file,id=mem0,size=9T,mem-path=9tb_sparse_disk.img,prealloc=off,share=on \
>>>>>>>>>   -machine memory-backend=mem0
>>>>>>>>>
>>>>>>>>> works for me till GRUB menu, with sufficient guest kernel
>>>>>>>>> persuasion (i.e. CLI limit ram size to something reasonable) you can boot linux
>>>>>>>>> guest on it and inspect SMBIOS tables comfortably.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> With KVM enabled it bails out with:
>>>>>>>>>    qemu-system-x86_64: kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=1, start=0x100000000, size=0x8ff40000000: Invalid argument
>>>>>>>>>
>>>>>>>
>>>>>>> I have seen this in my system but not always. Maybe I should have dug
>>>>>>> deeper as to why i do see this all the time.
>>>>>>>
>>>>>>>>> all of that on a host with 32G of RAM/no swap.
>>>>>>>>>
>>>>>>>
>>>>>>> My system in 16 Gib of main memory, no swap.
>>>>>>>
>>>>>>>>
>>>>>>>> #define KVM_MEM_MAX_NR_PAGES ((1UL << 31) - 1)
>>>>>>>>
>>>>>>>> ~8 TiB (7,999999)
>>>>>>>
>>>>>>> That's not 8 Tib, thats 2 GiB. But yes, 0x8ff40000000 is certainly greater
>>>>>>> than 2 Gib * 4K (assuming 4K size pages).
>>>>>>
>>>>>> "pages" don't carry the unit "GiB/TiB", so I was talking about the
>>>>>> actual size with 4k pages (your setup, I assume)
>>>>>
>>>>> yes I got that after reading your email again.
>>>>> The interesting question now is how is redhat QE running 9 TiB vm with kvm?
>>>>
>>>> As already indicated by me regarding s390x only having single large NUMA
>>>> nodes, x86 is usually using multiple NUMA nodes with such large memory.
>>>> And QE seems to be using virtual numa nodes:
>>>>
>>>> Each of the 32 virtual numa nodes receive a:
>>>>
>>>>   -object memory-backend-ram,id=ram-node20,size=309237645312,host-
>>>>    nodes=0-31,policy=bind
>>>>
>>>> which results in a dedicated KVM memslot (just like each DIMM would)
>>>>
>>>>
>>>> 32 * 309237645312 == 9 TiB :)
>>>
>>> ah, I should have looked closely at the other commandlines before
>>> shooting off the email. Yes the limitation is per mem-slot and they
>>> have 32 slots one per node.
>>> ok so should we do
>>> kvm_set_max_memslot_size(KVM_SLOT_MAX_BYTES);
>>> from i386 kvm_arch_init()?
>>
>>
>> As I said, I'm not a friend of these workarounds in user space.
> 
> Oh ok, did not realize you were against s390x like workarounds.
> 

s390x doesn't support DIMMs so it was "easy" for them to just do it that
way :)

-- 
Thanks,

David / dhildenb


