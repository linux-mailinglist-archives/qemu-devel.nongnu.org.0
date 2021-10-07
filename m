Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973494250CF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 12:14:13 +0200 (CEST)
Received: from localhost ([::1]:46198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYQPj-0005vj-SU
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 06:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mYQOB-0004vb-Mu
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:12:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mYQO5-0006cy-15
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633601547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5VN7A+Ep6qchqovxZWIoVI+B5DBFmy2KkOFEAaXkkk=;
 b=bnvjdOrpttGdDVWFlMOyfPmpr6AvCYyz68leURDZLlUVIVoPEBXmoq9PZgaoTVodv/sxzA
 HLPuVF6CPBRLURM9GSV5ch8H/7EjWb7I12VZUSOG851dzfLqHXxtBmbu3JatQpWACkRUU4
 SKxODS7/fEhNWHyRQEt8tIjqSUD9AA4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-43KMX0PVMI6InWNYAf1Y7g-1; Thu, 07 Oct 2021 06:12:26 -0400
X-MC-Unique: 43KMX0PVMI6InWNYAf1Y7g-1
Received: by mail-wr1-f71.google.com with SMTP id
 m17-20020adffa11000000b00160c1ac74e9so4280941wrr.9
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 03:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=e5VN7A+Ep6qchqovxZWIoVI+B5DBFmy2KkOFEAaXkkk=;
 b=YEZCrLjgbAI0bD10FMF81VYR0KqplFPrBfazBh4xTkpUykFk3ZGJ7bOH0FHhotF7nB
 ahIAqdNPXeVTXRmTaSZFazBYVqew46o3iAuo1Z+DKIm5iQLrfmFjQWCuoyqfmmqZajMp
 yb6E9n4lqY9nUKZLJTEH9W1UzVE8aNzgngQC59qrdSNmWkytBIlbanZUC8wT6+iFqNGZ
 doPst3Bs456rdySI54KLp87N9jX6DOaWo8Vf6RANZekCi8XjZGGDMOERP6gGmURGZZkT
 puncCN6+voXW/rx+phOXGXuuXOqFt+fnIbdmq8pw65k3pB7WLsRmYB4Nwmi0zkFA25jO
 IdCA==
X-Gm-Message-State: AOAM5316QXrw55Go/i/Hu1oaVgFVFt1kx/j8CTvT6I70HRrypqKH3A3Z
 fM3EA/GQqPX4SkmRnVJT6Jgn1OrzSJis0jDzJ57CvkGMG+UNxZ1Fg8YUs13On/THWVePgQjeETr
 KR5Cd9zAGXhBSWB0=
X-Received: by 2002:adf:f386:: with SMTP id m6mr4310667wro.187.1633601545232; 
 Thu, 07 Oct 2021 03:12:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybPMt4GJDD/QaIxSY8CilONooLDwTpGKIS9QGMUktspPE67pXSUGJ0qv0wCyZZN8eKdNaMVw==
X-Received: by 2002:adf:f386:: with SMTP id m6mr4310629wro.187.1633601544977; 
 Thu, 07 Oct 2021 03:12:24 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6886.dip0.t-ipconnect.de. [91.12.104.134])
 by smtp.gmail.com with ESMTPSA id r27sm23093977wrr.70.2021.10.07.03.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 03:12:24 -0700 (PDT)
Subject: Re: [PATCH v4 3/7] util/oslib-posix: Introduce and use MemsetContext
 for touch_all_pages()
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20211004120208.7409-1-david@redhat.com>
 <20211004120208.7409-4-david@redhat.com> <YV7GZIYZBC5ZoiGU@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <0ad68665-681e-bcd1-bf4d-d1490ff9e62b@redhat.com>
Date: Thu, 7 Oct 2021 12:12:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YV7GZIYZBC5ZoiGU@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.10.21 12:05, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
>> Let's minimize the number of global variables to prepare for
>> os_mem_prealloc() getting called concurrently and make the code a bit
>> easier to read.
>>
>> The only consumer that really needs a global variable is the sigbus
>> handler, which will require protection via a mutex in the future either way
>> as we cannot concurrently mess with the SIGBUS handler.
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   util/oslib-posix.c | 73 +++++++++++++++++++++++++++++-----------------
>>   1 file changed, 47 insertions(+), 26 deletions(-)
>>
>> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
>> index cb89e07770..cf2ead54ad 100644
>> --- a/util/oslib-posix.c
>> +++ b/util/oslib-posix.c
>> @@ -73,21 +73,30 @@
>>   
>>   #define MAX_MEM_PREALLOC_THREAD_COUNT 16
>>   
>> +struct MemsetThread;
>> +
>> +typedef struct MemsetContext {
>> +    bool all_threads_created;
>> +    bool any_thread_failed;
>> +    struct MemsetThread *threads;
>> +    int num_threads;
>> +} MemsetContext;
>> +
>>   struct MemsetThread {
>>       char *addr;
>>       size_t numpages;
>>       size_t hpagesize;
>>       QemuThread pgthread;
>>       sigjmp_buf env;
>> +    MemsetContext *context;
>>   };
>>   typedef struct MemsetThread MemsetThread;
>>   
>> -static MemsetThread *memset_thread;
>> -static int memset_num_threads;
>> +/* used by sigbus_handler() */
>> +static MemsetContext *sigbus_memset_context;
>>   
>>   static QemuMutex page_mutex;
>>   static QemuCond page_cond;
>> -static bool threads_created_flag;
> 
> Is there a reason you didn't lift page_mutex and page_cond into the
> MemsetContext ?

Mostly for simplicity and I didn't think that it will really make a 
difference in practice.

In patch #6 I spelled out that this was done: "Note that page_mutex and 
page_cond are shared between concurrent invocations, which shouldn't be 
a problem."

> 
> (You don't need to change it for this series, just a thought;
> another thought is that I think we hav ea few threadpools like this
> with hooks to check they've all been created and to do something if one
> fails).

I can look into that as an add-on series once I have some spare cycles.

Thanks!

-- 
Thanks,

David / dhildenb


