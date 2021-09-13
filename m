Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2D0408912
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:35:12 +0200 (CEST)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPjIr-0002BE-TY
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mPjEW-00087y-H1
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:30:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mPjET-0006jQ-Ni
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631529034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QWmWe9t/StP8wVvuGHuPt7HEms96EHJn8hHltaGGSc=;
 b=HiWcDIHGjlkb6s2F6SpbJZJcinbCvewixNwvtWLpnEadZx13EauzdrdSvdDd5qGWeBxL+R
 l9qTYYcxKu6ZYoOmUeoXurAotC023RLUpZgKWHeEiFdQohhzsTe/quEFsgDNVboIHvMvsf
 rKDNn8FInHVD/bAFssx4rlWBzBCv17Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-fgE8cTxnMqqn4uUqKkl4Wg-1; Mon, 13 Sep 2021 06:30:33 -0400
X-MC-Unique: fgE8cTxnMqqn4uUqKkl4Wg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so3806649wml.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 03:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3QWmWe9t/StP8wVvuGHuPt7HEms96EHJn8hHltaGGSc=;
 b=WGQAiOHzg92SjsKxiTlk3+rQHHXE+5Q1UuG+E+cTPdew5a8zVWLksCDCLEX2MvFPZ1
 eodxL8eLmqOjLp1+IRJlo7QnpaFPnQ/NWfGrXEmGGdFXmx1cH10eoair0Fm1Jv4IrJr5
 Yj6uJ3F/Mc7HQYI/AF5gMb9jCi91tBuoNwfxsT8BWmGSHvhl7Q1upUsXSmhjcipH5jvi
 s9cw62sPzrAKQDpreRXo/XHwwTGyDu8mmc2TY/uwaGntlQp0+k8YnDYR3ME6UKJIUQgK
 2mVYcGE254yM0e1kl3u1JP0iSG37+rnr7mGurYOSC5cM8QDqdHKse/HmwxW6ykCXzfHx
 irQA==
X-Gm-Message-State: AOAM530Hv+opwE0hXsbU9oEnuNbaXGxw7ZgVH5Hr6l22U0vGZxXTTlya
 Lof4KLP+pC9WzAEgxIQaJAkRPE1BbGfl2lnw+LxpiFmym1e669Il8TESDAI5m83A2txhodfYtan
 zhYqKLH2xInBGVPw=
X-Received: by 2002:a1c:4d7:: with SMTP id 206mr9117472wme.158.1631529032385; 
 Mon, 13 Sep 2021 03:30:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOVZ6qbBFwanxrFjTmf2a8FPkF4ntn6O6s/WV9mvKHgNsv8d7aywkkGabuaDdEguOzgC+heA==
X-Received: by 2002:a1c:4d7:: with SMTP id 206mr9117442wme.158.1631529032139; 
 Mon, 13 Sep 2021 03:30:32 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id k4sm6461464wrv.24.2021.09.13.03.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 03:30:31 -0700 (PDT)
Subject: Re: [PATCH v8 16/19] hvf: arm: Implement PSCI handling
To: Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-17-agraf@csgraf.de>
 <CAFEAcA_VJa_vJtJx6PtQS=WTy2y9ZJg8pcgu4Pkzp=CbuH85qw@mail.gmail.com>
 <a9ac1625-1cb0-bd44-da27-67f9a003ec54@csgraf.de>
 <11281306-a11a-5b8c-6b2b-202be8e2655a@linaro.org>
 <f05467cb-aae6-e943-3d4a-9894d9c72ef8@csgraf.de>
 <8e0879b6-23c0-8f14-fd96-4d72f1d640c1@linaro.org>
 <6fe284da-6989-f837-adda-1aa722f0d345@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <db51fd0c-42c0-19c0-2049-bb56e88c4b51@redhat.com>
Date: Mon, 13 Sep 2021 12:30:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6fe284da-6989-f837-adda-1aa722f0d345@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.584, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Markus

On 9/13/21 12:06 PM, Alexander Graf wrote:
> On 12.09.21 23:40, Richard Henderson wrote:
>> On 9/12/21 2:37 PM, Alexander Graf wrote:
>>>
>>> On 12.09.21 23:20, Richard Henderson wrote:
>>>> On 9/12/21 1:36 PM, Alexander Graf wrote:
>>>>>> I think the callsites would be clearer if you made the function
>>>>>> return true for "PSCI call handled", false for "not recognised,
>>>>>> give the guest an UNDEF". Code like
>>>>>>            if (hvf_handle_psci_call(cpu)) {
>>>>>>                stuff;
>>>>>>            }
>>>>>>
>>>>>> looks like the 'stuff' is for the "psci call handled" case,
>>>>>> which at the moment it isn't.
>>>>>
>>>>>
>>>>> This function merely follows standard C semantics along the lines
>>>>> of "0
>>>>> means success, !0 is error". Isn't that what you would usually expect?
>>>>
>>>> No, not really.  I expect stuff that returns error codes to return
>>>> negative integers on failure.  I expect stuff that returns a boolean
>>>> success/failure to return true on success.
>>>
>>>
>>> Fair, I'll change it to return -1 then. Thanks!
>>
>> Not quite the point I was making.  If the only two return values are
>> -1/0, then bool false/true is in fact more appropriate.
> 
> 
> If the whole code base adheres to it, maybe. The big problem with using
> true/false as return values for functions that don't make it very
> explicit (have an is in their name or use gerund for example). QEMU uses
> a lot of 0 == success internally.
> 
> If you now add bools to the a code base that already uses int returns a
> lot, you always need to look up what a function actually returns if the
> caller treats it as bool (if, ?, assert, etc), making code review and
> reasoning about code flows extremely hard. I've had one too many
> occasions where I called an innocently looking API and put the assert()
> the wrong way around for example.
> 
> I don't think we can solve this problem here, but IMHO the only sensible
> way to get to good readability would be to have functions that return
> success/failure return a libc defined struct that indicates the error.
> Then check for success explicitly on every caller site. Overloading bool
> or int for success/failure return is just bad :).

IIUC what we are trying to do lately is, if caller only expects
success/failure then return boolean, with error information in
Error* for eventual propagation. Only return libc errno if the
caller has to handle failures differently.


