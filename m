Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE0D23BB8C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 15:58:31 +0200 (CEST)
Received: from localhost ([::1]:44812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2xSX-0008JH-SW
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 09:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k2xRl-0007n6-4z
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 09:57:41 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48750
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k2xRj-0002fo-9V
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 09:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596549458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KYu8ioF9yN3hlqFs3COjWWW7WoManQ74r0DViFTHPT0=;
 b=BB9AqoIkPLrsmUBPHbbZpgyPD4OkafdgYKMuBDaVENz/huEVlIdSFR/M/Vx6huIqhKZ4YT
 r+w4lBf9qxGEDEJCnYEOuRWDJF/Fy5oqrXsX6ZhRKNg8iKC5VVnWBeOG7+dGU804PiAAfG
 jJ/goe17qmr0n0bjZsTgeL4AECViKys=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-2m76T6rUMaGtBkk_ri-K4g-1; Tue, 04 Aug 2020 09:57:36 -0400
X-MC-Unique: 2m76T6rUMaGtBkk_ri-K4g-1
Received: by mail-ej1-f69.google.com with SMTP id gg11so4768418ejb.6
 for <qemu-devel@nongnu.org>; Tue, 04 Aug 2020 06:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=oKn9gKuW+rDBMRy9SYoT4QEJRsmFV5qCsZWp/OvUhrI=;
 b=J8nztUYvSLD/JbQ4i8pP6CWCsCrNd7ZYi9Ky/jluNtFFy+3pPhtnBz2NtljYfv6nqL
 m/gGfhCkm10gtGEdagZhQGVznuEk5ogboq9gZN2t7YJBCW1c/cGzAFpRjnNSnSSl7GCg
 OJDXNASvjR+BLeNoJo0o8hLfqf3EJJaB+5hcldt+VJqxAO22o0NmgjAuRppfZyqzbfIs
 iscLduRL/uT434Wllpx4QoTTLR5HJ9YvyzIrb3lt+TbEpvcLnQjNsedH3vrFFuKevaM6
 wSEazbnSJw81GGNRadWrTBk+SlcVqdC85jdoTD3aBsDcTe21RNkUsSFv2J1cqxrcOl4D
 7/1w==
X-Gm-Message-State: AOAM533sN0LCxPAgLNJbjAgfErYG3/fhjq5PI2Rf3L242lR2rkyLxxn/
 wiMzY9zfYCyTgYdxVQc2wWUHlwv+XGS+vmPrnaZ55jzyTfyXHAKw526MYnMA81uGcMp9RaX9GAc
 rpxYLCwxXCgNRrsI=
X-Received: by 2002:a17:906:3a4c:: with SMTP id
 a12mr21196831ejf.306.1596549455510; 
 Tue, 04 Aug 2020 06:57:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuDHnTew2E+8+7pcgAxJ6PxGInWbgKDT2IbcpfVBpxpGOhnkx7xqLb60EIoYJY0ugqIxo7FQ==
X-Received: by 2002:a17:906:3a4c:: with SMTP id
 a12mr21196807ejf.306.1596549455233; 
 Tue, 04 Aug 2020 06:57:35 -0700 (PDT)
Received: from [192.168.1.43] (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id v14sm18819955ejb.63.2020.08.04.06.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2020 06:57:34 -0700 (PDT)
Subject: Re: [PATCH 1/3] memory: add readonly support to
 memory_region_init_ram_from_file()
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20200804101244.1283503-1-stefanha@redhat.com>
 <20200804101244.1283503-2-stefanha@redhat.com>
 <febc6361-1c62-bc3e-7924-bbd19711b5df@redhat.com>
 <1240d81b-7ac5-d06d-671a-70614004a721@redhat.com>
 <20200804134756.GA1287869@stefanha-x1.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <ac5b358e-ac12-1979-f254-323e6fa2de99@redhat.com>
Date: Tue, 4 Aug 2020 15:57:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200804134756.GA1287869@stefanha-x1.localdomain>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 01:01:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/20 3:47 PM, Stefan Hajnoczi wrote:
> On Tue, Aug 04, 2020 at 02:26:22PM +0200, Philippe Mathieu-Daudé wrote:
>> On 8/4/20 2:25 PM, Philippe Mathieu-Daudé wrote:
>>> Hi Stefan,
>>>
>>> On 8/4/20 12:12 PM, Stefan Hajnoczi wrote:
>>>> There is currently no way to open(O_RDONLY) and mmap(PROT_READ) when
>>>> creating a memory region from a file. This functionality is needed since
>>>> the underlying host file may not allow writing.
>>>>
>>>> Add a bool readonly argument to memory_region_init_ram_from_file() and
>>>> the APIs it calls.
>>>>
>>>> Extend memory_region_init_ram_from_file() rather than introducing a
>>>> memory_region_init_rom_from_file() API so that callers can easily make a
>>>> choice between read/write and read-only at runtime without calling
>>>> different APIs.
>>>
>>> What happens if we call:
>>>
>>>  memory_region_init_ram_from_file(mr, ..., readonly=false, ...);
>>>  memory_region_set_readonly(mr, false);
>>
>> In case my error is not obvious, I meant:
>>
>>    memory_region_init_ram_from_file(mr, ..., readonly=true, ...);
>>    memory_region_set_readonly(mr, false);
> 
> Since the mmap was made using PROT_READ any store instructions to the
> memory will fault.
> 
> Is there some scenario where memory_region_set_readonly() is called? I
> can't find one.

Not in the current code base, but I was wondering about the API abuses.

I see in the next patch the property is protected:

    if (host_memory_backend_mr_inited(backend)) {
        error_setg(errp, "cannot change property 'readonly' of %s.",
                   object_get_typename(o));
        return;
    }

By using memory_region_set_readonly() you bypass this protection.

Maybe not something to worry.

Anyway for the patch:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Stefan
> 


