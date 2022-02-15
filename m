Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4934B6655
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:41:07 +0100 (CET)
Received: from localhost ([::1]:52726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJtOU-0007Kj-TP
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:41:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nJtM9-0006XJ-9T
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:38:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nJtM7-000896-9c
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:38:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644914317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GUb3Dc9PgNe+qqEjRb+e3hi2hdutuukkunUpmDEQ2lM=;
 b=QH+axIKbBtyvG6rQQ3tW8KPu0njRNek2LTK5SnSxhnuiioook68Zmsy+maXYMfoVmN18OS
 +oppPBr1TD27SrkoQcTaFZlKDdg57TcnSCCAsebCelDyQ2U7eQ3o/t4CB08DtZRyQvne8c
 ixtj+umZ3tvdK47G1k1+TdJ7PD1cVgM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-WsNyn_tOO2GczTT1APfgag-1; Tue, 15 Feb 2022 03:38:36 -0500
X-MC-Unique: WsNyn_tOO2GczTT1APfgag-1
Received: by mail-wr1-f72.google.com with SMTP id
 k3-20020adfb343000000b001e463e6af20so7994871wrd.8
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GUb3Dc9PgNe+qqEjRb+e3hi2hdutuukkunUpmDEQ2lM=;
 b=TqOx1vE6pq/NnyPHSL3fl0YXiom6PzVIyC+FuUTJzqecrIQvn61zKY8X7Rot1mMuMe
 ehv2Ri9NnRT6Wed3eQMpU2KFGHXWFP0YFpqhklPN6Yog8A7D8sVZTuzf19AFDbmLrQGZ
 FLFt9rJG3N9iWUqtA0P8a2c2F6tzI3F2ANSCnBhVCtCyKhzZCbfIJMgeJBD30ZiuY9z/
 JJS/60GESLbq/VSDtl3wkLwg+JJcf3dEOZetqpTAnzlqAZn0y/+j3bDb7zq+iqRwYCWH
 ETzt8xLh7hSHfCULTBketDZYZJngvgpp9tNybFBlc+fukmZfVcOboEjnEFKaO3Qwdju+
 dnHg==
X-Gm-Message-State: AOAM531OGYuIm74TaLxSaRowh2ByFKt4C8OEEEQfdwC3i9eYd+egbIIn
 UhIuQWTTeWWbKVvJUFU9SbLcRK2Qc7KsHXkXGBJM2ZO7Qb40kOSJm+xCaFVCSp9nnmJ+t6ocPrp
 baYaoplJgcdW9hyc=
X-Received: by 2002:a05:600c:6018:b0:373:7b9b:92ff with SMTP id
 az24-20020a05600c601800b003737b9b92ffmr2080792wmb.49.1644914315619; 
 Tue, 15 Feb 2022 00:38:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzssoLBuIDRsoSceSmPekgbR3HaW9i8cZBCTo54KxPN56oX3qXsXJVNgba4PPWjlnhdSz4DqA==
X-Received: by 2002:a05:600c:6018:b0:373:7b9b:92ff with SMTP id
 az24-20020a05600c601800b003737b9b92ffmr2080778wmb.49.1644914315390; 
 Tue, 15 Feb 2022 00:38:35 -0800 (PST)
Received: from ?IPV6:2003:cb:c70e:3700:9260:2fb2:742d:da3e?
 (p200300cbc70e370092602fb2742dda3e.dip0.t-ipconnect.de.
 [2003:cb:c70e:3700:9260:2fb2:742d:da3e])
 by smtp.gmail.com with ESMTPSA id p8sm25707476wro.106.2022.02.15.00.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 00:38:35 -0800 (PST)
Message-ID: <492bd3a4-4a26-afc9-1268-74a9fd7f095a@redhat.com>
Date: Tue, 15 Feb 2022 09:38:34 +0100
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAARzgwwDFybUsCj8Ym6kpcjNRCVV6vbsY7Lks0wsmrc2+ET03Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 15.02.22 09:12, Ani Sinha wrote:
> On Tue, Feb 15, 2022 at 1:25 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 15.02.22 08:00, Ani Sinha wrote:
>>>
>>>
>>> On Mon, 14 Feb 2022, David Hildenbrand wrote:
>>>
>>>> On 14.02.22 13:36, Igor Mammedov wrote:
>>>>> On Mon, 14 Feb 2022 10:54:22 +0530 (IST)
>>>>> Ani Sinha <ani@anisinha.ca> wrote:
>>>>>
>>>>>> Hi Igor:
>>>>>>
>>>>>> I failed to spawn a 9 Tib VM. The max I could do was a 2 TiB vm on my
>>>>>> system with the following commandline before either the system
>>>>>> destabilized or the OOM killed killed qemu
>>>>>>
>>>>>> -m 2T,maxmem=9T,slots=1 \
>>>>>> -object memory-backend-file,id=mem0,size=2T,mem-path=/data/temp/memfile,prealloc=off \
>>>>>> -machine memory-backend=mem0 \
>>>>>> -chardev file,path=/tmp/debugcon2.txt,id=debugcon \
>>>>>> -device isa-debugcon,iobase=0x402,chardev=debugcon \
>>>>>>
>>>>>> I have attached the debugcon output from 2 TiB vm.
>>>>>> Is there any other commandline parameters or options I should try?
>>>>>>
>>>>>> thanks
>>>>>> ani
>>>>>
>>>>> $ truncate -s 9T 9tb_sparse_disk.img
>>>>> $ qemu-system-x86_64 -m 9T \
>>>>>   -object memory-backend-file,id=mem0,size=9T,mem-path=9tb_sparse_disk.img,prealloc=off,share=on \
>>>>>   -machine memory-backend=mem0
>>>>>
>>>>> works for me till GRUB menu, with sufficient guest kernel
>>>>> persuasion (i.e. CLI limit ram size to something reasonable) you can boot linux
>>>>> guest on it and inspect SMBIOS tables comfortably.
>>>>>
>>>>>
>>>>> With KVM enabled it bails out with:
>>>>>    qemu-system-x86_64: kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=1, start=0x100000000, size=0x8ff40000000: Invalid argument
>>>>>
>>>
>>> I have seen this in my system but not always. Maybe I should have dug
>>> deeper as to why i do see this all the time.
>>>
>>>>> all of that on a host with 32G of RAM/no swap.
>>>>>
>>>
>>> My system in 16 Gib of main memory, no swap.
>>>
>>>>
>>>> #define KVM_MEM_MAX_NR_PAGES ((1UL << 31) - 1)
>>>>
>>>> ~8 TiB (7,999999)
>>>
>>> That's not 8 Tib, thats 2 GiB. But yes, 0x8ff40000000 is certainly greater
>>> than 2 Gib * 4K (assuming 4K size pages).
>>
>> "pages" don't carry the unit "GiB/TiB", so I was talking about the
>> actual size with 4k pages (your setup, I assume)
> 
> yes I got that after reading your email again.
> The interesting question now is how is redhat QE running 9 TiB vm with kvm?

As already indicated by me regarding s390x only having single large NUMA
nodes, x86 is usually using multiple NUMA nodes with such large memory.
And QE seems to be using virtual numa nodes:

Each of the 32 virtual numa nodes receive a:

  -object memory-backend-ram,id=ram-node20,size=309237645312,host-
   nodes=0-31,policy=bind

which results in a dedicated KVM memslot (just like each DIMM would)


32 * 309237645312 == 9 TiB :)

-- 
Thanks,

David / dhildenb


