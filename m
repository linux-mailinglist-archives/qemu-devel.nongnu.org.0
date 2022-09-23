Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744295E7443
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 08:41:01 +0200 (CEST)
Received: from localhost ([::1]:39076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obcMt-0003s6-8C
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 02:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obc5x-0002SA-T3
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 02:23:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obc5v-0008N5-K5
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 02:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663914206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mgg1LGHqq0ofENBuQ3agnpH4qrDDmdNtgSXLWvlPvW0=;
 b=JARqbAojmjXUvGSHwpwbwsdd+ghvTYh5iJ7Bn2kkCyu0VfzZEvF0SKItWBrzribU4txA35
 Kd7Wm/6RrqMXYAQ6i1V3KTFzQZeRdsPDabeuvWvRh93e4MKVNjmiHjYHRnr0byYBEX3IeW
 An4FAhOrPHWn0XIzLkkEOHzyzkjM51s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-xGPDfRuyNBWzMmOA-moi6w-1; Fri, 23 Sep 2022 02:23:19 -0400
X-MC-Unique: xGPDfRuyNBWzMmOA-moi6w-1
Received: by mail-wm1-f69.google.com with SMTP id
 y15-20020a1c4b0f000000b003b47578405aso1473336wma.5
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 23:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mgg1LGHqq0ofENBuQ3agnpH4qrDDmdNtgSXLWvlPvW0=;
 b=bDci4wlfDDdyfn7crS/n8+CxK6CNUM6mEdu+ZLGdXoytIu8DCZjJbBIjC8GOxt6r75
 JTm5ANjVtrHOnmJvWExyKiuoJ+26Oo3+7pq6cGU7R53lwGxhrr9bPGEgceEDYP80o+sp
 ke69z+XDM0U/TxwBkHxYb+wKRk81aPFxGvjP73lUmWYLKAqkadNFNLrhuOkkl7NQctYz
 3i5JQhL7nrvHSxYpOOF1kLC0Ob47OPvAiW9HiATRrhQGc3CGMqAjb0NzrWPzCkxK+h/b
 SiNrBQUgYDsax5eJtRZB1nMaLJkQHtMLg3DN95ZdTLGu/cSTneyxHmsVoWUf0ri5/dcy
 meow==
X-Gm-Message-State: ACrzQf0IBFW2hHxnr615vV+L9fW6rfiNe0St7txk+zDcbVbZA6gTehmg
 Qrwio9C8eeX3MWnVP+0GsnAccEG+kU13jp70C9tmj1XcXwUbKVTGTgrROc3ILgh67TlFB1Rv5YT
 9R3pupvUnioPPGWE=
X-Received: by 2002:adf:e4ca:0:b0:228:d8b7:48a7 with SMTP id
 v10-20020adfe4ca000000b00228d8b748a7mr3944616wrm.300.1663914198522; 
 Thu, 22 Sep 2022 23:23:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6qVfLf+Qna7S1g9jdY2S8J6pa7hGwog4PmqJdMr985nMSuOw+RLM+Q9gqynDCOjXGiOhALuA==
X-Received: by 2002:adf:e4ca:0:b0:228:d8b7:48a7 with SMTP id
 v10-20020adfe4ca000000b00228d8b748a7mr3944599wrm.300.1663914198230; 
 Thu, 22 Sep 2022 23:23:18 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-37.web.vodafone.de.
 [109.43.179.37]) by smtp.gmail.com with ESMTPSA id
 p21-20020a1c5455000000b003b27f644488sm1505270wmi.29.2022.09.22.23.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 23:23:17 -0700 (PDT)
Message-ID: <e8041184-cfdd-d429-0377-db6b46d4d0ef@redhat.com>
Date: Fri, 23 Sep 2022 08:23:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8.1 1/2] target/s390x: support SHA-512 extensions
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <20220922153820.221811-1-david@redhat.com>
 <abf6fbb6-14f4-8c65-f5ac-a75b9c8931dd@redhat.com>
 <98dcb657-8862-5868-3979-55fc49864904@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <98dcb657-8862-5868-3979-55fc49864904@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/09/2022 19.18, David Hildenbrand wrote:
> On 22.09.22 17:55, Thomas Huth wrote:
>> On 22/09/2022 17.38, David Hildenbrand wrote:
>>> From: "Jason A. Donenfeld" <Jason@zx2c4.com>
>>>
>>> In order to fully support MSA_EXT_5, we have to support the SHA-512
>>> special instructions. So implement those.
>>>
>>> The implementation began as something TweetNacl-like, and then was
>>> adjusted to be useful here. It's not very beautiful, but it is quite
>>> short and compact, which is what we're going for.
>> ...
>>> @@ -52,6 +278,9 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, 
>>> uint32_t r2, uint32_t r3,
>>>                cpu_stb_data_ra(env, param_addr, subfunc[i], ra);
>>>            }
>>>            break;
>>> +    case 3: /* CPACF_*_SHA_512 */
>>> +        return cpacf_sha512(env, ra, env->regs[1], &env->regs[r2],
>>> +                            &env->regs[r2 + 1], type);
>>
>> I have to say that I liked Jason's v8 better here. Code 3 is also used for
>> other instructions with completely different meaning, e.g. PCKMO uses 3 for
>> TDEA-192 ... so having the "type" check here made more sense.
>> (meta comment: maybe we should split up the msa function and stop using just
>> one function for all crypto/rng related instructions? ... but that's of
>> course something for a different patch series)
> 
> It kind-f made sense in v8 where we actually had different functions. We no 
> longer have that here.

But the point is that the "msa" helper is also called for other instructions 
like PCKMO which can also be called with code 3. And there it means 
something completely different. ... unless I completely misunderstood the 
code, of course.

I think I'll go with Jason's v8 (+ compat machine handling on top) for now, 
so that we better record his state of the patch, and then we can do cleanup 
patches on top later.

  Thomas


