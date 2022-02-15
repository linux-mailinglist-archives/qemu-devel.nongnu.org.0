Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E444B64DF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 08:58:56 +0100 (CET)
Received: from localhost ([::1]:48730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJsjf-00078M-Bi
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 02:58:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nJsgq-0005Y3-QN
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 02:56:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nJsgo-0001C2-6v
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 02:56:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644911757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ympp/p0xCgmbASfboQxaqSF/QIhozfgr+0zVS/tIuL8=;
 b=JvuGknmskaFpKvbAayKObBcrkcb6Mxt/A8p3DbYpedfky2u4Cjom4FNcbyDwXwVdiaPFtr
 Wm/i31CZQbwvOnSg/79B0E4raGnQufw82pBWtMjb1cTcjdAM+QzNmfklW214IdnrIa/6tS
 HDa16aKpQCsPa13TTrg7w5XSEy1J6OM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-ezWDVZ0gPqCsTAdrNj86Qw-1; Tue, 15 Feb 2022 02:55:50 -0500
X-MC-Unique: ezWDVZ0gPqCsTAdrNj86Qw-1
Received: by mail-wr1-f69.google.com with SMTP id
 t14-20020adfa2ce000000b001e1ad2deb3dso7962402wra.0
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 23:55:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ympp/p0xCgmbASfboQxaqSF/QIhozfgr+0zVS/tIuL8=;
 b=VI6+Ry+chZMVG66lL2pQdsDsez2+NCF23K6Y6FGgBdLKyUIij7p7Rw76I1Udy3Ro0z
 3O72+o0jCRNinVP84JtYSmeefWNFBtoGqb6zX+k7MnEWXUGmHlgr0ofWpnrbJwTFIPzR
 kG6fZGoDW4X0boGBeCj16Rgc5sN0y6gG0IhbtQlFIq96NKX8Y+svQsuQOxALDgSZBuEx
 eqnwxMN3YYswMbMiK6/dbR2qzIstvJc695aMNYcdPPOeVQmaRsjSNr0vNJkMTZ8t+bY4
 vB/UWqbND0I0w5I7jbgLqS00zzjmn5drUsvcDdDe/64oTBV72qwU2lQTXoOsBSo3dNCh
 cCWQ==
X-Gm-Message-State: AOAM532IC3QNFIP4z40ecndfVYA7svPHwrp+U2LCITJHWntkV0hDFDQ6
 J3kfrw8uw0mWkCxqTEp9vX52D9T6L+OXSvFLJzh/jJhc8lMImLrW8fmfddNIvAGcLCDauvbyAwd
 U64B6jJVqvZ7CqOk=
X-Received: by 2002:adf:d1e6:: with SMTP id g6mr999105wrd.668.1644911749818;
 Mon, 14 Feb 2022 23:55:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVrKr2Mv8ZqG/8jNG4eVguBePW/apTls2/Kh4d3z8QfbPZmUpYGTmxrtp+2SRUp4xw1UKuRA==
X-Received: by 2002:adf:d1e6:: with SMTP id g6mr999091wrd.668.1644911749568;
 Mon, 14 Feb 2022 23:55:49 -0800 (PST)
Received: from ?IPV6:2003:cb:c70e:3700:9260:2fb2:742d:da3e?
 (p200300cbc70e370092602fb2742dda3e.dip0.t-ipconnect.de.
 [2003:cb:c70e:3700:9260:2fb2:742d:da3e])
 by smtp.gmail.com with ESMTPSA id g22sm13960360wmh.12.2022.02.14.23.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 23:55:49 -0800 (PST)
Message-ID: <b06ab7b0-61f2-5301-70f9-197dfd9527e9@redhat.com>
Date: Tue, 15 Feb 2022 08:55:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: 9 TiB vm memory creation
To: Ani Sinha <ani@anisinha.ca>
References: <alpine.DEB.2.22.394.2202141048390.13781@anisinha-lenovo>
 <20220214133634.248d7de0@redhat.com>
 <b9771171-8d28-b46b-4474-687a8fed0abd@redhat.com>
 <alpine.DEB.2.22.394.2202151221090.13781@anisinha-lenovo>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <alpine.DEB.2.22.394.2202151221090.13781@anisinha-lenovo>
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

On 15.02.22 08:00, Ani Sinha wrote:
> 
> 
> On Mon, 14 Feb 2022, David Hildenbrand wrote:
> 
>> On 14.02.22 13:36, Igor Mammedov wrote:
>>> On Mon, 14 Feb 2022 10:54:22 +0530 (IST)
>>> Ani Sinha <ani@anisinha.ca> wrote:
>>>
>>>> Hi Igor:
>>>>
>>>> I failed to spawn a 9 Tib VM. The max I could do was a 2 TiB vm on my
>>>> system with the following commandline before either the system
>>>> destabilized or the OOM killed killed qemu
>>>>
>>>> -m 2T,maxmem=9T,slots=1 \
>>>> -object memory-backend-file,id=mem0,size=2T,mem-path=/data/temp/memfile,prealloc=off \
>>>> -machine memory-backend=mem0 \
>>>> -chardev file,path=/tmp/debugcon2.txt,id=debugcon \
>>>> -device isa-debugcon,iobase=0x402,chardev=debugcon \
>>>>
>>>> I have attached the debugcon output from 2 TiB vm.
>>>> Is there any other commandline parameters or options I should try?
>>>>
>>>> thanks
>>>> ani
>>>
>>> $ truncate -s 9T 9tb_sparse_disk.img
>>> $ qemu-system-x86_64 -m 9T \
>>>   -object memory-backend-file,id=mem0,size=9T,mem-path=9tb_sparse_disk.img,prealloc=off,share=on \
>>>   -machine memory-backend=mem0
>>>
>>> works for me till GRUB menu, with sufficient guest kernel
>>> persuasion (i.e. CLI limit ram size to something reasonable) you can boot linux
>>> guest on it and inspect SMBIOS tables comfortably.
>>>
>>>
>>> With KVM enabled it bails out with:
>>>    qemu-system-x86_64: kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=1, start=0x100000000, size=0x8ff40000000: Invalid argument
>>>
> 
> I have seen this in my system but not always. Maybe I should have dug
> deeper as to why i do see this all the time.
> 
>>> all of that on a host with 32G of RAM/no swap.
>>>
> 
> My system in 16 Gib of main memory, no swap.
> 
>>
>> #define KVM_MEM_MAX_NR_PAGES ((1UL << 31) - 1)
>>
>> ~8 TiB (7,999999)
> 
> That's not 8 Tib, thats 2 GiB. But yes, 0x8ff40000000 is certainly greater
> than 2 Gib * 4K (assuming 4K size pages).

"pages" don't carry the unit "GiB/TiB", so I was talking about the
actual size with 4k pages (your setup, I assume)

-- 
Thanks,

David / dhildenb


