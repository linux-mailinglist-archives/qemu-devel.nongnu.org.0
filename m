Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E32C519B7E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 11:21:07 +0200 (CEST)
Received: from localhost ([::1]:60936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmBBy-00007Q-OI
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 05:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmB68-0005BE-6P
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:15:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmB65-0001kv-Gr
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:15:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651655700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sNUupHrLdR+u6oE3tsAmhnUVn1EyTTpFkYNPwliwz/Q=;
 b=ieyFZcpQ0OHCeCiSBcd1hMVeBSXHx5/Dt+wEGvzsk5VJBWiG7bCnGe9otWPdB3Rz+Dv6lG
 n8nbfVFFAw7XNMYi/edvWPjOC6joys5elGYiyVgPYLEaqi05mGb4+I2ZcLtC4LCYQFVEIQ
 wc3Cd42Re8NN4e9tXBSQXADbnLXt4oc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-RStDsUTRNtyubIPX-yIUMA-1; Wed, 04 May 2022 05:14:59 -0400
X-MC-Unique: RStDsUTRNtyubIPX-yIUMA-1
Received: by mail-wm1-f72.google.com with SMTP id
 p13-20020a05600c358d00b00394586f6959so933942wmq.1
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 02:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sNUupHrLdR+u6oE3tsAmhnUVn1EyTTpFkYNPwliwz/Q=;
 b=SZopI1Yn9i9b9j9RAWiRt6tdMvp15rMcuRfVD26fBrBZZ99Hw/VVhDvYDv7hkUrk9r
 ndM/EaYoPstB5NbZsX0O4Ay+5WsC3GxIcfpuE76VavugC8FMEVInW+BS/ETKFGY+wWBG
 nARtyHs3mSFmsy7TUlz+svrYlQMv/VmRtgGybyvyTmzl+/T4jESYxSBb79esNotR3FUn
 3Oz/UCZOlMHR/p0/tX+awVHlvFVOLHPoQaTYYX5orvaoqBCD+lk215/9OBc1/jMvlsQW
 VD1Jvj0y5WeF0+6ccz65WjJgowiiAGvgv45ordqYMT8pWVAXs8S39XqdMcTqm4fMACKR
 ARgw==
X-Gm-Message-State: AOAM5303ZyHNqStXiPvidzy071keoHXPskd0OcFQR7PkRbOHNupsheb2
 n8tM/h/cV52TkoKxbcve+J0taNORY6Zd6qpL+1Zzt3IBA5PzKyVjePbbi6NA9H81QodOWX4ZE/U
 G52aqvwxG52XrhWs=
X-Received: by 2002:a1c:a3c6:0:b0:392:a630:286c with SMTP id
 m189-20020a1ca3c6000000b00392a630286cmr6793223wme.72.1651655698315; 
 Wed, 04 May 2022 02:14:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJym+C2zEn8NP6DB3LdliLERaw06yAdRghS2kw3vv7curlBdlX3x7vtuUksA1Y6FO7QDc5nwmQ==
X-Received: by 2002:a1c:a3c6:0:b0:392:a630:286c with SMTP id
 m189-20020a1ca3c6000000b00392a630286cmr6793209wme.72.1651655698118; 
 Wed, 04 May 2022 02:14:58 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-177-80.web.vodafone.de.
 [109.43.177.80]) by smtp.gmail.com with ESMTPSA id
 c11-20020adfa70b000000b0020c5253d90esm14580840wrd.90.2022.05.04.02.14.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 02:14:57 -0700 (PDT)
Message-ID: <dc9b9d50-aa32-9483-551a-2054e31b36a4@redhat.com>
Date: Wed, 4 May 2022 11:14:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: branch-relative-long fails on s390x host (was: [PATCH]
 tests/tcg/s390x: Use a different PCRel32 notation in branch-relative-long.c)
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 David Hildenbrand <david@redhat.com>
References: <20220502164830.1622191-1-iii@linux.ibm.com>
 <0e5c5988-c764-edd8-5f8f-f208f5cef1d0@redhat.com>
 <e71d638b-3c62-31db-1abd-02ba40042eab@redhat.com>
 <8543dc2de432c787770f9f01c448434ab1e30c63.camel@linux.ibm.com>
 <f7a77dcc-590c-96f5-8e92-5806f51ac0d4@redhat.com>
 <1c4e55e45a92250f93d7671b4f658e616fc1edce.camel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <1c4e55e45a92250f93d7671b4f658e616fc1edce.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 04/05/2022 11.07, Ilya Leoshkevich wrote:
> On Wed, 2022-05-04 at 09:01 +0200, Thomas Huth wrote:
>> On 04/05/2022 00.46, Ilya Leoshkevich wrote:
>>> On Tue, 2022-05-03 at 21:26 +0200, Thomas Huth wrote:
>>>> On 03/05/2022 11.02, Thomas Huth wrote:
>>>>> On 02/05/2022 18.48, Ilya Leoshkevich wrote:
>>>>>> Binutils >=2.37 and Clang do not accept (. - 0x100000000)
>>>>>> PCRel32
>>>>>> constants. While this looks like a bug that needs fixing, use
>>>>>> a
>>>>>> different notation (-0x100000000) as a workaround.
>>>>>>
>>>>>> Reported-by: Thomas Huth <thuth@redhat.com>
>>>>>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>>>>>> ---
>>>>>>     tests/tcg/s390x/branch-relative-long.c | 4 ++--
>>>>>>     1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/tests/tcg/s390x/branch-relative-long.c
>>>>>> b/tests/tcg/s390x/branch-relative-long.c
>>>>>> index 94219afcad..8ce9f1c2e5 100644
>>>>>> --- a/tests/tcg/s390x/branch-relative-long.c
>>>>>> +++ b/tests/tcg/s390x/branch-relative-long.c
>>>>>> @@ -13,8 +13,8 @@
>>>>>>             #_name "_end:\n");
>>>>>>     DEFINE_ASM(br_r14, "br %r14");
>>>>>> -DEFINE_ASM(brasl_r0, "brasl %r0,.-0x100000000");
>>>>>> -DEFINE_ASM(brcl_0xf, "brcl 0xf,.-0x100000000");
>>>>>> +DEFINE_ASM(brasl_r0, "brasl %r0,-0x100000000");
>>>>>> +DEFINE_ASM(brcl_0xf, "brcl 0xf,-0x100000000");
>>>>>
>>>>> Works for me, thanks!
>>>>
>>>> Sorry, I spoke too soon - it compiles fine, and also runs fine
>>>> when I
>>>> run it
>>>> natively, but when I run it through "qemu-s390x", it crashes...
>>>> does
>>>> that
>>>> work for you?
>>>
>>> Hi, yes, I just double-checked - it works fine for me.
>>> Could you please share the resulting test binary?
>>
>>
>> Sure, here it is:
>>
>> https://people.redhat.com/~thuth/data/branch-relative-long
>>
>>    Thomas
> 
> Your binary worked fine for me.
> 
> QEMU commit 2e3408b3cc7de4e87a9adafc8c19bfce3abec947,
> x86_64 host,

Oh, well, now that you've mentioned it: I was running "make check-tcg" on a 
s390x host. It works fine on a x86, indeed. So the new problem is likely in 
the s390x TCG host backend... Richard, could you maybe have a look?

  Thomas


