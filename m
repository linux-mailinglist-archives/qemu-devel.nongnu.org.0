Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442D74547BC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 14:49:48 +0100 (CET)
Received: from localhost ([::1]:38720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnLJq-0000We-Tt
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 08:49:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnLEy-00046C-2e
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 08:44:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnLEv-0006sR-6x
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 08:44:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637156680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HG4zhSS56yMophqppaBzEZghFyVfpx16ADwqfDK5BRg=;
 b=Nlhu/x0N/JhCFUG1lppYdQlLqxcjLLuAUepJ6T3XOimoznVZyfoies2z57JsrkUgR7xK0q
 C+smKffCqrPudYW0eHlcFxf4OiPAchVPSe/ribg/vm0iqvBO3IAfOf5ZSUCrLiVUomi4Io
 g/B++7Zkty0KAmjMi96D0WyyACXKYn4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-MUnYNRLPO2qQieFfphrTXg-1; Wed, 17 Nov 2021 08:44:39 -0500
X-MC-Unique: MUnYNRLPO2qQieFfphrTXg-1
Received: by mail-wr1-f71.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso373915wrj.12
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 05:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HG4zhSS56yMophqppaBzEZghFyVfpx16ADwqfDK5BRg=;
 b=BWn/pclMBg39L5o5Z9qM2ZlNFrDEaoDtDRhBT6kNTJQu2xQLkmeCXDLZKUNrikIGXo
 33Qmmdw74c9zHG8Cco1WYNtKVLl09gAfymkZBP9TSihg87y8Wr1C87tUg6pe1UZhekZo
 Et6af614u7Fr0haf0NHSAqMeEeYs3Mini9KZwJNKtR73/yIKslw/AJJtdTGqOqyWwf0/
 6ks91+K3zGGrcUaRUmp5iNRMN9IYn5u2s3uzr1a0qGZvMBuXKvxAbSgX5oF7hZsg9MFy
 FkySzoBCgfWfkZcTAq8Nc75RwQGQvJlS77jYdr5q7KakvPwxIutGH+5XKaDvjCXLjw49
 S5GQ==
X-Gm-Message-State: AOAM533NaUnlL3+aWgd9RUlhnZ0xfGIMdrcuQr5sb3MFoGgSdKByuku7
 chP3xLusjq3Pnnq90Pcc1AIa9K+zKAaF5Q7f5lx98BnthAWr8qZ4Kugoze2FRY+yzifqOngX7pd
 AhHTq5ImDnzBPSWE=
X-Received: by 2002:adf:db47:: with SMTP id f7mr20167490wrj.113.1637156678385; 
 Wed, 17 Nov 2021 05:44:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8GxLeLh99qRtaTivgGA7lhw7Lo6j539nilOlvRjTkA8WrtMebKnl3fvgOWS0bMeUhGa24rg==
X-Received: by 2002:adf:db47:: with SMTP id f7mr20167444wrj.113.1637156678144; 
 Wed, 17 Nov 2021 05:44:38 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1?
 ([2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1])
 by smtp.gmail.com with ESMTPSA id t189sm5512133wma.8.2021.11.17.05.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 05:44:37 -0800 (PST)
Message-ID: <f8d79ced-c965-2dee-2bfb-a7aaaa19c84e@redhat.com>
Date: Wed, 17 Nov 2021 14:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 24/25] job.h: split function pointers in JobDriver
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-25-eesposit@redhat.com>
 <c7324851-ebe8-c797-360a-a5ec1c465d06@redhat.com>
 <a93747e7-8cb1-d2be-f658-d71d3a2a40e0@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <a93747e7-8cb1-d2be-f658-d71d3a2a40e0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.11.21 14:43, Emanuele Giuseppe Esposito wrote:
>
>
> On 15/11/2021 16:11, Hanna Reitz wrote:
>> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
>>> The job API will be handled separately in another serie.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>   include/qemu/job.h | 16 ++++++++++++++++
>>>   1 file changed, 16 insertions(+)
>>>
>>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>>> index 6e67b6977f..7e9e59f4b8 100644
>>> --- a/include/qemu/job.h
>>> +++ b/include/qemu/job.h
>>> @@ -169,12 +169,21 @@ typedef struct Job {
>>>    * Callbacks and other information about a Job driver.
>>>    */
>>>   struct JobDriver {
>>> +
>>> +    /* Fields initialized in struct definition and never changed. */
>>
>> Like in patch 19, I’d prefer a slightly more verbose comment that I’d 
>> find more easily readable.
>>
>>> +
>>>       /** Derived Job struct size */
>>>       size_t instance_size;
>>>       /** Enum describing the operation */
>>>       JobType job_type;
>>> +    /*
>>> +     * Functions run without regard to the BQL and may run in any
>>
>> s/and/that/?
>>
>>> +     * arbitrary thread. These functions do not need to be thread-safe
>>> +     * because the caller ensures that are invoked from one thread 
>>> at time.
>>
>> s/that/they/ (or “that they”)
>>
>> I believe .run() must be run in the job’s context, though.  Not sure 
>> if that’s necessary to note, but it isn’t really an arbitrary thread, 
>> and block jobs certainly require this (because they run in the block 
>> device’s context).  Or is that something that’s going to change with 
>> I/O threading?
>>
>
> What about moving .run() before the comment and add "Must be run in 
> the job's context" to its comment description?

Sure, works for me.

> maybe also add the following assertion in job_co_entry (that calls 
> job->run())?
>
> assert(job->aio_context == qemu_get_current_aio_context());

Sounds good!

Hanna


