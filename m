Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8134D4B5470
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:19:38 +0100 (CET)
Received: from localhost ([::1]:50428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJd8b-0002h7-IJ
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:19:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nJcUK-0000R9-Rn
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:38:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nJcUI-0001CY-0w
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:37:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644849477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fA7gVA4J98ptQJEBtJFwBJRA/RQlMKNS0ky0xSnJhcw=;
 b=FrJRG5CCardrZO3RfTK+yUN0R/iFUrYAUzinJNX46uUe3/L2FtyQ+RctK2vRm0zjg7Dm+A
 RVzs7T5KJErvvNlJPA2bQZd0uxsg984vpPF7Lbxx2CAssajby8bMXOpNHNqFEgdcU1x4yk
 r2d8WcVl6oG+UO1EkSjPlcrCUBD8tMs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-qc6MbgtDNU2bXAODvwS0bA-1; Mon, 14 Feb 2022 09:37:56 -0500
X-MC-Unique: qc6MbgtDNU2bXAODvwS0bA-1
Received: by mail-wm1-f69.google.com with SMTP id
 h82-20020a1c2155000000b003552c13626cso9575857wmh.3
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 06:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fA7gVA4J98ptQJEBtJFwBJRA/RQlMKNS0ky0xSnJhcw=;
 b=EiPK37ww+1+NBeVRtyib+I0TtMBDMJSultN0+3FkuyDLS4JNS/4dC0/u/JbCyYL7qw
 n3e9yLt18A7nAGnch8HUOkvvfl/m1hP6GaL4X6Hq1/I+zjBa1P/CVhUrpbWk1cBMop5K
 hFscp92EGiq0+3VPpHwCorlhQiH/PA/ze5uYjiE/PsegiiBqN3Hcg8oV4un1inv0sIx2
 1R5xkjVzhCIHmdDu3LJrx4/YSb2o8ZheN9rIFR17ILB4x1TGnpt8i/aeEwagJckwbsqv
 rVwGgQzmBg6TvAtHn12jjgN9v4RaBWCFoansAyw9RGfxLtpoYb2V7ab22nqBwaJLWIyH
 xx0A==
X-Gm-Message-State: AOAM533PBpOHX04SnvHivQUG5s4fUVIAsJZjpzL6mAiINefupmmQQFxG
 dBFjM0eajgbM6V6zQTTW4aeujv1UaCwJ/GbsT0utOE5F9nPNhyKDNWZeud1i5hEwTnC0It5z7w8
 08JjneIo2foEDy7U=
X-Received: by 2002:adf:f843:: with SMTP id d3mr11424057wrq.306.1644849474977; 
 Mon, 14 Feb 2022 06:37:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytDady81ndHoyGmOPYfD1bid2GWK6TsFqC7SeYCW/DEA/Cxa3f2Vz64cyQ5JQ8tpS965GCVQ==
X-Received: by 2002:adf:f843:: with SMTP id d3mr11424038wrq.306.1644849474698; 
 Mon, 14 Feb 2022 06:37:54 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:5400:d8a3:8885:3275:4529?
 (p200300cbc7075400d8a3888532754529.dip0.t-ipconnect.de.
 [2003:cb:c707:5400:d8a3:8885:3275:4529])
 by smtp.gmail.com with ESMTPSA id r20sm150848wrr.69.2022.02.14.06.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 06:37:54 -0800 (PST)
Message-ID: <b9771171-8d28-b46b-4474-687a8fed0abd@redhat.com>
Date: Mon, 14 Feb 2022 15:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: 9 TiB vm memory creation
To: Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <alpine.DEB.2.22.394.2202141048390.13781@anisinha-lenovo>
 <20220214133634.248d7de0@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220214133634.248d7de0@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.02.22 13:36, Igor Mammedov wrote:
> On Mon, 14 Feb 2022 10:54:22 +0530 (IST)
> Ani Sinha <ani@anisinha.ca> wrote:
> 
>> Hi Igor:
>>
>> I failed to spawn a 9 Tib VM. The max I could do was a 2 TiB vm on my
>> system with the following commandline before either the system
>> destabilized or the OOM killed killed qemu
>>
>> -m 2T,maxmem=9T,slots=1 \
>> -object memory-backend-file,id=mem0,size=2T,mem-path=/data/temp/memfile,prealloc=off \
>> -machine memory-backend=mem0 \
>> -chardev file,path=/tmp/debugcon2.txt,id=debugcon \
>> -device isa-debugcon,iobase=0x402,chardev=debugcon \
>>
>> I have attached the debugcon output from 2 TiB vm.
>> Is there any other commandline parameters or options I should try?
>>
>> thanks
>> ani
> 
> $ truncate -s 9T 9tb_sparse_disk.img
> $ qemu-system-x86_64 -m 9T \
>   -object memory-backend-file,id=mem0,size=9T,mem-path=9tb_sparse_disk.img,prealloc=off,share=on \
>   -machine memory-backend=mem0
> 
> works for me till GRUB menu, with sufficient guest kernel
> persuasion (i.e. CLI limit ram size to something reasonable) you can boot linux
> guest on it and inspect SMBIOS tables comfortably.
> 
> 
> With KVM enabled it bails out with:
>    qemu-system-x86_64: kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=1, start=0x100000000, size=0x8ff40000000: Invalid argument
> 
> all of that on a host with 32G of RAM/no swap.
> 

#define KVM_MEM_MAX_NR_PAGES ((1UL << 31) - 1)

~8 TiB (7,999999)



In QEMU, we have

static hwaddr kvm_max_slot_size = ~0;

And only s390x sets

kvm_set_max_memslot_size(KVM_SLOT_MAX_BYTES);

with

#define KVM_SLOT_MAX_BYTES (4UL * TiB)

-- 
Thanks,

David / dhildenb


