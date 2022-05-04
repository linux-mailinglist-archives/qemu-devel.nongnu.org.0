Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6585519E0E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 13:31:27 +0200 (CEST)
Received: from localhost ([::1]:40388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDE6-0005kR-9O
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 07:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmCXD-0003kQ-L8
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:47:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmCXA-0005iu-EZ
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651661223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z5bs3Q+qBJiwgk4BHVD77k1jaFP+QWYG6xmNV8kMYTI=;
 b=a3u/WuuUEhrDtQpPYonmVSxD1ogLHnxQn8pY0NJ5NKXVczlvHqkB6KYujGsSdYhigHDzCo
 0PIUU7s4vG2nExdiSxBZWTOvAifqw6CjO9t4aE1ut76w7FMBkhMy757elCK8iGf7VN31Od
 myeSb1E21ej4MF/nMdqxEDLceawZ5dw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-TftCWgu9OFqsKtc5qQttpw-1; Wed, 04 May 2022 06:47:02 -0400
X-MC-Unique: TftCWgu9OFqsKtc5qQttpw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m186-20020a1c26c3000000b003943e12185dso522546wmm.7
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 03:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=Z5bs3Q+qBJiwgk4BHVD77k1jaFP+QWYG6xmNV8kMYTI=;
 b=3Xp2CYuT06GMo8mJBfCp4fBFYi9clTVt8ApNcI/LkIRIU3VB3pwC9aIM7c0a4Cy9NA
 adpKw3JmhKXvTrn+ap01QrfxGsMkjYKZzslpvHfBFe3G5d6vldOkLOS6xRbDl34PuOT+
 gXQEXaVw341fFiJtS8oXwFQelAl7Q6MIoyjDSl7MbxF7CDjS6147bfs/LDGZ83Bz+Mpm
 1E1tsYTkBsw0tiGYVLPwLRiDr927VQP23DCog7FtGYXpH9TXmqXIDL8xb0bn9ZesKbKi
 u6wv/aLCEwXYK0UP3qAAxNry7rh3qrT5NEp1oKKAlx5SeLBeZt1ScZZQw68mFDDcWm+p
 IkaQ==
X-Gm-Message-State: AOAM5310XVS/Sxdx+8wU00ePgl7qaZJePQ2GFmDByiPeC2/eUwROhhyu
 I4gtKSQYT9iYQNb6NxZCCOR1LxTFwHNBzeZuUPVdQH7hyzEuEBOMOrnfzLS24MOEYlFP3spNLjv
 JuSY40J4By7Wor6Y=
X-Received: by 2002:a05:6000:18d0:b0:209:199b:77bd with SMTP id
 w16-20020a05600018d000b00209199b77bdmr16133829wrq.537.1651661221017; 
 Wed, 04 May 2022 03:47:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoeP62+xvB94nqoi3e+spbRV/a+y+GWHOFAGXIPFgE4usRVcv3nGaBep2LX/k1FgWXo3ks9g==
X-Received: by 2002:a05:6000:18d0:b0:209:199b:77bd with SMTP id
 w16-20020a05600018d000b00209199b77bdmr16133809wrq.537.1651661220699; 
 Wed, 04 May 2022 03:47:00 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-177-80.web.vodafone.de.
 [109.43.177.80]) by smtp.gmail.com with ESMTPSA id
 bh19-20020a05600c3d1300b003942a244f45sm3358108wmb.30.2022.05.04.03.46.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 03:47:00 -0700 (PDT)
Message-ID: <dfddafae-3d7d-c865-2255-72e469fda5bb@redhat.com>
Date: Wed, 4 May 2022 12:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
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
 <dc9b9d50-aa32-9483-551a-2054e31b36a4@redhat.com>
 <ceb3c159c495b79d313016bcd0e3f36f217dbd38.camel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: branch-relative-long fails on s390x host (was: [PATCH]
 tests/tcg/s390x: Use a different PCRel32 notation in branch-relative-long.c)
In-Reply-To: <ceb3c159c495b79d313016bcd0e3f36f217dbd38.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On 04/05/2022 11.37, Ilya Leoshkevich wrote:
> On Wed, 2022-05-04 at 11:14 +0200, Thomas Huth wrote:
>> On 04/05/2022 11.07, Ilya Leoshkevich wrote:
>>> On Wed, 2022-05-04 at 09:01 +0200, Thomas Huth wrote:
>>>> On 04/05/2022 00.46, Ilya Leoshkevich wrote:
>>>>> On Tue, 2022-05-03 at 21:26 +0200, Thomas Huth wrote:
>>>>>> On 03/05/2022 11.02, Thomas Huth wrote:
>>>>>>> On 02/05/2022 18.48, Ilya Leoshkevich wrote:
>>>>>>>> Binutils >=2.37 and Clang do not accept (. - 0x100000000)
>>>>>>>> PCRel32
>>>>>>>> constants. While this looks like a bug that needs fixing,
>>>>>>>> use
>>>>>>>> a
>>>>>>>> different notation (-0x100000000) as a workaround.
>>>>>>>>
>>>>>>>> Reported-by: Thomas Huth <thuth@redhat.com>
>>>>>>>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>>>>>>>> ---
>>>>>>>>      tests/tcg/s390x/branch-relative-long.c | 4 ++--
>>>>>>>>      1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/tests/tcg/s390x/branch-relative-long.c
>>>>>>>> b/tests/tcg/s390x/branch-relative-long.c
>>>>>>>> index 94219afcad..8ce9f1c2e5 100644
>>>>>>>> --- a/tests/tcg/s390x/branch-relative-long.c
>>>>>>>> +++ b/tests/tcg/s390x/branch-relative-long.c
>>>>>>>> @@ -13,8 +13,8 @@
>>>>>>>>              #_name "_end:\n");
>>>>>>>>      DEFINE_ASM(br_r14, "br %r14");
>>>>>>>> -DEFINE_ASM(brasl_r0, "brasl %r0,.-0x100000000");
>>>>>>>> -DEFINE_ASM(brcl_0xf, "brcl 0xf,.-0x100000000");
>>>>>>>> +DEFINE_ASM(brasl_r0, "brasl %r0,-0x100000000");
>>>>>>>> +DEFINE_ASM(brcl_0xf, "brcl 0xf,-0x100000000");
>>>>>>>
>>>>>>> Works for me, thanks!
>>>>>>
>>>>>> Sorry, I spoke too soon - it compiles fine, and also runs
>>>>>> fine
>>>>>> when I
>>>>>> run it
>>>>>> natively, but when I run it through "qemu-s390x", it
>>>>>> crashes...
>>>>>> does
>>>>>> that
>>>>>> work for you?
>>>>>
>>>>> Hi, yes, I just double-checked - it works fine for me.
>>>>> Could you please share the resulting test binary?
>>>>
>>>>
>>>> Sure, here it is:
>>>>
>>>> https://people.redhat.com/~thuth/data/branch-relative-long
>>>>
>>>>     Thomas
>>>
>>> Your binary worked fine for me.
>>>
>>> QEMU commit 2e3408b3cc7de4e87a9adafc8c19bfce3abec947,
>>> x86_64 host,
>>
>> Oh, well, now that you've mentioned it: I was running "make check-
>> tcg" on a
>> s390x host. It works fine on a x86, indeed. So the new problem is
>> likely in
>> the s390x TCG host backend... Richard, could you maybe have a look?
>>
>>    Thomas
> 
> It worked fine on a s390x host for me as well.

Weird ... Did you compile qemu-s390x itself with Clang or with GCC? I just 
discovered that the crash also only happens if I compile qemu-s390x with 
Clang - there is no crash when I compile it with GCC.

> Can this be related to the large mmap() that the test performs?

It works when I compile the test with GCC instead of Clang - so I assume 
that the problem is somewhere else...

  Thomas


