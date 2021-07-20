Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C08D3CFC65
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:36:17 +0200 (CEST)
Received: from localhost ([::1]:56172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5qr2-0004hc-GZ
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m5qp1-0002ht-LT
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:34:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m5qoz-0000cb-LO
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626791648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmp3n5XiB5WJp2nRiv26EoiNG3BV/l/plLjYTjtEIk0=;
 b=brHOeFBhR8Wdtso1x5YJ27m40cEiJyd3IEXnTwOF9Nk86/Z1pIyRJH1cK6fWJ0B+hvKKw0
 FBrGeA7UQcA6E3jZMLXJjD73CEikJi2Zadof/mIe1escdYZNppFqXpHPmKwV4ZvKgozjLA
 jFz7fbPRg2ZXyuE/lTIn2HEvPC1obYA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-_9KfFLeAPxCUk9Q627awwg-1; Tue, 20 Jul 2021 10:34:07 -0400
X-MC-Unique: _9KfFLeAPxCUk9Q627awwg-1
Received: by mail-wr1-f70.google.com with SMTP id
 p4-20020a5d63840000b0290126f2836a61so10458237wru.6
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 07:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rmp3n5XiB5WJp2nRiv26EoiNG3BV/l/plLjYTjtEIk0=;
 b=grk7tcE6aAjmwzzcoQEVA+tWzJMrD/os4olyXI/0YHPslApw2ni4/OG4Q35uPktLuf
 mwod14DHW7I0bmzAQo32y7hsG48W4kGywZNp/Ny0QZkVJXzF41C0th1ajv73ca86zfFg
 fjJ7URGOGDQzVkV84yImGl0nu9++fVBdMHFVOrEUhYB/+SRu8tlbOwRmwF5s0Qqdrtju
 B9IQmIHQgcltatK8DmZ8YXwZquc49hZfqpU5PYMtPNIWZdvcs1o6BOn1tB2wzQ0Wdb8H
 AOjMWNfp7W2MPbydncuVPiAvXR4QN3ksjrgqpCFBg+VvZkUtEe5lyuZ9nDA1wE4ZjXld
 wyAQ==
X-Gm-Message-State: AOAM530+Sqj5J3OcsaUcFZfx2p8PWE0wlg3A/AUZlLoS7fS+XGwEGiYC
 GMqgKPLLHaa5DC0gmqFO1yzuvZJTNgvTTXCIDK9lfGTBiZItqDt39DgFXMVm9JR8iDoDVo3FAeE
 AHlPLJS4tWn4v/Ng=
X-Received: by 2002:adf:f74f:: with SMTP id z15mr36493869wrp.54.1626791646304; 
 Tue, 20 Jul 2021 07:34:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYbkhA2kyH7wm7BuQuR5m4/B1548i9dC0sN9D4FR6yAdKNej+BHU081pBJqM9zUDYb7vzxdg==
X-Received: by 2002:adf:f74f:: with SMTP id z15mr36493837wrp.54.1626791646062; 
 Tue, 20 Jul 2021 07:34:06 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id d15sm24065947wri.39.2021.07.20.07.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 07:34:05 -0700 (PDT)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210714112306.67793-1-david@redhat.com>
 <20210714112306.67793-2-david@redhat.com> <YPbY45FmTYNVPKCs@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 1/3] util/oslib-posix: Support MADV_POPULATE_WRITE for
 os_mem_prealloc()
Message-ID: <f8ab8d7c-200f-471b-5881-b0c42b3f3939@redhat.com>
Date: Tue, 20 Jul 2021 16:34:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPbY45FmTYNVPKCs@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>       memset_thread_failed = false;
>>       threads_created_flag = false;
>>       memset_num_threads = get_memset_num_threads(smp_cpus);
>> @@ -534,7 +558,7 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
>>           memset_thread[i].numpages = numpages_per_thread + (i < leftover);
>>           memset_thread[i].hpagesize = hpagesize;
>>           qemu_thread_create(&memset_thread[i].pgthread, "touch_pages",
>> -                           do_touch_pages, &memset_thread[i],
>> +                           touch_fn, &memset_thread[i],
>>                              QEMU_THREAD_JOINABLE);
>>           addr += memset_thread[i].numpages * hpagesize;
>>       }
> 
> Do you have an indication of what the speed differential is for the
> old read/write dance vs the kernel madvise. We needed to use threads
> previously because the read/write dance is pretty terribly slow.

The kernel patch has some performance numbers: 
https://lkml.kernel.org/r/20210712083917.16361-1-david@redhat.com

For example (compressed),

     **************************************************
     4096 MiB MAP_PRIVATE:
     **************************************************
     Anon 4 KiB     : Read/Write               :  1054.041 ms
     Anon 4 KiB     : POPULATE_WRITE           :   572.582 ms
     Memfd 4 KiB    : Read/Write               :  1106.561 ms
     Memfd 4 KiB    : POPULATE_WRITE           :   805.881 ms
     Memfd 2 MiB    : Read/Write               :   357.606 ms
     Memfd 2 MiB    : POPULATE_WRITE           :   356.937 ms
     tmpfs          : Read/Write               :  1105.954 ms
     tmpfs          : POPULATE_WRITE           :   822.826 ms
     file           : Read/Write               :  1107.439 ms
     file           : POPULATE_WRITE           :   857.622 ms
     hugetlbfs      : Read/Write               :   356.127 ms
     hugetlbfs      : POPULATE_WRITE           :   355.138 ms


     4096 MiB MAP_SHARED:
     **************************************************
     Anon 4 KiB     : Read/Write               :  1060.350 m
     Anon 4 KiB     : POPULATE_WRITE           :   782.885 ms
     Anon 2 MiB     : Read/Write               :   357.992 ms
     Anon 2 MiB     : POPULATE_WRITE           :   357.808 ms
     Memfd 4 KiB    : Read/Write               :  1100.391 ms
     Memfd 4 KiB    : POPULATE_WRITE           :   804.394 ms
     Memfd 2 MiB    : Read/Write               :   358.250 ms
     Memfd 2 MiB    : POPULATE_WRITE           :   357.334 ms
     tmpfs          : Read/Write               :  1107.567 ms
     tmpfs          : POPULATE_WRITE           :   810.094 ms
     file           : Read/Write               :  1289.509 ms
     file           : POPULATE_WRITE           :  1106.816 ms
     hugetlbfs      : Read/Write               :   357.120 ms
     hugetlbfs      : POPULATE_WRITE           :   356.693 ms

For huge pages, it barely makes a difference with smallish VMs. In the 
other cases, it speeds it up, but not as extreme as that it would allow 
for dropping multi-threading.

The original MADV_POPULATE from 2016 
https://lore.kernel.org/patchwork/patch/389581/ mentiones that it 
especially helps speed up multi-threaded pre-faulting, due to reduced 
mmap_lock contention. I did not do any multi-threading benchmarks, though.

[...]

> 
> Initialized with random garbage from the stack
> 
>> +
>> +    /*
>> +     * Sense on every invocation, as MADV_POPULATE_WRITE cannot be used for
>> +     * some special mappings, such as mapping /dev/mem.
>> +     */
>> +    if (madv_populate_write_possible(area, hpagesize)) {
>> +        use_madv_populate_write = true;
>> +    }
> 
> but this implicitly assumes it was initialized to false.

Indeed, thanks for catching that!


-- 
Thanks,

David / dhildenb


