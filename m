Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0123AE4B6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:23:13 +0200 (CEST)
Received: from localhost ([::1]:44020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFD6-0005dg-Hz
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvFC3-00049e-AM
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:22:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvFC1-0003KI-LR
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624263724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qnsg2p8Gq5vcgmw+48vmKWdPEaB69Sn5WsBKilCjKI4=;
 b=QH2/XxLPE+O2Q7MpFKM5CBUbxnhvZqgbizZxpiOprZ41clfheMYSIRFUTeJNZH8noxPkBg
 knSLcKh+UAh7G8hSAanwh0sg3V12kaiFM0ltohu0vEDAFMT/UXatLVIfpLLOBWbFtB5wET
 CsgQvn71sThaaDohRWrBRYrTcx7mLHo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-kU_WkpwBNwGnvAQNYqoJAg-1; Mon, 21 Jun 2021 04:21:59 -0400
X-MC-Unique: kU_WkpwBNwGnvAQNYqoJAg-1
Received: by mail-ed1-f69.google.com with SMTP id
 ee28-20020a056402291cb0290394a9a0bfaeso1925096edb.6
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 01:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qnsg2p8Gq5vcgmw+48vmKWdPEaB69Sn5WsBKilCjKI4=;
 b=WvVQp5duVy13bUCssdfKGKYbyb82oB99czZWWIG+wiAHed9v3Yz0fVFnYrXWuGMToT
 Hg94huUqjrz/co1DPsLky/AOEZ4YoJp233nLoNq8AbulmNkIrzVX7NkwLQaa3qaMcFjz
 alrUEgHVLkyclkD4bezmf8uSkgkQ3UQZbq+YHr+qPI+6VlHWEWFR1VdSP3G0yrCokUhK
 N0sHge+bBg47HJphXYv7Wtt9WOo+h3sgST67sxQ4dX9vL23mF175INSLok0xLH/49CAH
 jEMwwfnYP8mEQiux3B4J1K+nXkIGB6SpNTH3Ta/ppI9qLR3R9nbJcqcCoI4Ka4lYvyyE
 ddhA==
X-Gm-Message-State: AOAM5304Y+c5vc8YgqR1uIkgrpdbBa2N38TVOBdF10YDquZCVnS3GMhD
 7Y7eVu1f/WmBwihr5zjlAK9AcWjiSvK/jYJMh4sx1UQ5YTjlkpHI0CiQrAOtJNR33p5u+GEGVLQ
 JRU7/nuSmwIGqf6420j25yZu1J7r/DjW5uW+JF/GPUwHZVao0FrdPj3tki2Dowc9EPIg=
X-Received: by 2002:a17:906:64c8:: with SMTP id
 p8mr6388968ejn.428.1624263717741; 
 Mon, 21 Jun 2021 01:21:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4wLxJymJjQ51ITgwILVG/7rHlHbComrHmsG0pkItoeRRX9bHej4qHij+m9rFQrNmxBIwOIA==
X-Received: by 2002:a17:906:64c8:: with SMTP id
 p8mr6388946ejn.428.1624263717472; 
 Mon, 21 Jun 2021 01:21:57 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 e3sm556455ejy.78.2021.06.21.01.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 01:21:56 -0700 (PDT)
Subject: Re: [PATCH v4 3/6] block-copy: improve comments of BlockCopyTask and
 BlockCopyState types and functions
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-4-eesposit@redhat.com>
 <b29eeb07-5f96-ae06-931a-bda015429418@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <70770a8c-2c38-bb4f-9437-55851af85a52@redhat.com>
Date: Mon, 21 Jun 2021 10:21:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b29eeb07-5f96-ae06-931a-bda015429418@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 19/06/2021 19:27, Vladimir Sementsov-Ogievskiy wrote:
> 14.06.2021 10:33, Emanuele Giuseppe Esposito wrote:
>> As done in BlockCopyCallState, categorize BlockCopyTask
>> and BlockCopyState in IN, State and OUT fields.
>> This is just to understand which field has to be protected with a lock.
>>
>> .sleep_state is handled in the series "coroutine: new sleep/wake API"
>> and thus here left as TODO.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>
>> ---
>>   block/block-copy.c | 49 +++++++++++++++++++++++++++++-----------------
>>   1 file changed, 31 insertions(+), 18 deletions(-)
>>
>> diff --git a/block/block-copy.c b/block/block-copy.c
>> index 3f26be8ddc..5ff7764e87 100644
>> --- a/block/block-copy.c
>> +++ b/block/block-copy.c
>> @@ -52,29 +52,35 @@ typedef struct BlockCopyCallState {
>>       /* Coroutine where async block-copy is running */
>>       Coroutine *co;
>> -    /* To reference all call states from BlockCopyState */
>> -    QLIST_ENTRY(BlockCopyCallState) list;
>> -
>>       /* State */
>> -    int ret;
>>       bool finished;
>> -    QemuCoSleep sleep;
>> -    bool cancelled;
>> +    QemuCoSleep sleep; /* TODO: protect API with a lock */
>> +
>> +    /* To reference all call states from BlockCopyState */
>> +    QLIST_ENTRY(BlockCopyCallState) list;
>>       /* OUT parameters */
>> +    bool cancelled;
> 
> actually, cancelled is not OUT field. It's set by user to cancel the 
> operation. And block-copy tracks the field to understand should it 
> cancel at the moment or not. So, it's part of state.

Makes sense.

> 
> Also, I just now understand, that "out parameter" sounds strange here. 
> As "parameter" is an input by general meaning.. We may have "out 
> parameters" for functions, as all parameters of a function are generally 
> called "parameters" anyway. I think "OUT fields" is more correct here. I 
> don't insist, as I'm not an expert in English (for sure, you'll find 
> mistakes even in this paragraph :\
> 
Actually I am using the terminology that was already there :)
Anyways, I am not expert here either but fields do sounds better.
I will change parameter -> field replacement to this patch.

Emanuele


