Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D441EA57A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 16:02:14 +0200 (CEST)
Received: from localhost ([::1]:51196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfl13-0000eI-G1
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 10:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jfl0D-0008OX-QS
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 10:01:21 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43782
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jfl0C-00041U-Hx
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 10:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591020078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D1XgezHZpt4n+RLKP3dkL7SDwMoY+fOlgULCkhT45CQ=;
 b=gHhCNsH+3cfbEDsH0enA8OvgmhNIjd30K415S7+b8jvkri+kYJYXTOdGN60dtU80UJwV18
 F7QIeBNRizWwhyLBi//tzpa11boFHYhTyfnQMzCn//EJ26JgMEHtR0D7JRncm1PERScTPo
 /KKpLJdjOHeVGBSJeIU6z4xQTZQ9oMo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-tl2pQ4yFM8O3hnK9eQ9aTw-1; Mon, 01 Jun 2020 10:01:16 -0400
X-MC-Unique: tl2pQ4yFM8O3hnK9eQ9aTw-1
Received: by mail-wr1-f72.google.com with SMTP id e7so4459489wrp.14
 for <qemu-devel@nongnu.org>; Mon, 01 Jun 2020 07:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D1XgezHZpt4n+RLKP3dkL7SDwMoY+fOlgULCkhT45CQ=;
 b=eXdrQM3AUSp2oWg2/Zi/u6hRTEIeFQgJMF6uHi273EwZmHoL5SKe3zCSQU6a6x+sz2
 o0lsqXyQGaEOBvGjHZRTJGSKWAzNutm4t65VGrxacQzjck52Jod8Lhk1Ju06nChKlLEF
 T1umJJZltI+HjXR9WZJCPPYLAdUU4Dp8No9XV8OrfSt2lmleORdTqxvOAyGZNcas0weV
 zUDnj3kdUYr3VvF59mO7CqBKsaj/vjnpb1UlKbfVcr65Vnl9PY8qNtXUxtOHozv111Bu
 uGGpOAKB6/c6J7GHscp702HWnGN2tWxPK0tMaohL8bNSzv/bQ7bFFD+C5EPOYzF48u0/
 RZQg==
X-Gm-Message-State: AOAM530pnzHH3OcpyvHgO9esISClcMcos4gTRnJfwFAyBwFCXl25hJkR
 pLMi7qpUYWKDorqlr8V6MbhNQbLW0qs5u3xzVzaDv1cJgORO9N3HO/WvXi8zRalI0cGi/Lw5AsB
 89VqZpc6+fI0yAZc=
X-Received: by 2002:a05:600c:2147:: with SMTP id
 v7mr21727804wml.101.1591020075092; 
 Mon, 01 Jun 2020 07:01:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0OWiTDCFe2QIgM6mPB0QABGEPGXw9iV3W1z3nFVDwP5Mm+5a/QS8XNAs1RHEty1ZMKWVgyw==
X-Received: by 2002:a05:600c:2147:: with SMTP id
 v7mr21727772wml.101.1591020074732; 
 Mon, 01 Jun 2020 07:01:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e044:3d2:1991:920c?
 ([2001:b07:6468:f312:e044:3d2:1991:920c])
 by smtp.gmail.com with ESMTPSA id q128sm11469939wma.38.2020.06.01.07.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 07:01:14 -0700 (PDT)
Subject: Re: [PATCH] replay: notify the main loop when there are no
 instructions
To: Pavel Dovgalyuk <dovgaluk@ispras.ru>,
 Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>, qemu-devel@nongnu.org
References: <159013007895.28110.2020104406699709721.stgit@pasha-ThinkPad-X280>
 <c0867841-ae6c-5190-ab43-80b4c8e0fe43@ispras.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d0f6ee58-39fd-e8a0-11a4-b7692183dcbb@redhat.com>
Date: Mon, 1 Jun 2020 16:01:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <c0867841-ae6c-5190-ab43-80b4c8e0fe43@ispras.ru>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 08:52:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: alex.bennee@linaro.org, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/06/20 12:35, Pavel Dovgalyuk wrote:
> ping
> 
> On 22.05.2020 09:47, Pavel Dovgalyuk wrote:
>> When QEMU is executed in console mode without any external event sources,
>> main loop may sleep for a very long time. But in case of replay
>> there is another event source - event log.
>> This patch adds main loop notification when the vCPU loop has nothing
>> to do and main loop should process the inputs from the event log.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>

It's a long weekend here today but I should get a QEMU pull request
submitted on Wednesday.

Paolo

>>   0 files changed
>>
>> diff --git a/cpus.c b/cpus.c
>> index 7ce0d569b3..b4d0d9f21b 100644
>> --- a/cpus.c
>> +++ b/cpus.c
>> @@ -1362,6 +1362,13 @@ static int64_t tcg_get_icount_limit(void)
>>       }
>>   }
>>   +static void notify_aio_contexts(void)
>> +{
>> +    /* Wake up other AioContexts.  */
>> +    qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
>> +    qemu_clock_run_timers(QEMU_CLOCK_VIRTUAL);
>> +}
>> +
>>   static void handle_icount_deadline(void)
>>   {
>>       assert(qemu_in_vcpu_thread());
>> @@ -1370,9 +1377,7 @@ static void handle_icount_deadline(void)
>>                                                        
>> QEMU_TIMER_ATTR_ALL);
>>             if (deadline == 0) {
>> -            /* Wake up other AioContexts.  */
>> -            qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
>> -            qemu_clock_run_timers(QEMU_CLOCK_VIRTUAL);
>> +            notify_aio_contexts();
>>           }
>>       }
>>   }
>> @@ -1395,6 +1400,10 @@ static void prepare_icount_for_run(CPUState *cpu)
>>           cpu->icount_extra = cpu->icount_budget - insns_left;
>>             replay_mutex_lock();
>> +
>> +        if (cpu->icount_budget == 0 && replay_has_checkpoint()) {
>> +            notify_aio_contexts();
>> +        }
>>       }
>>   }
>>  
> 


