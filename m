Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41C75197E3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 09:12:03 +0200 (CEST)
Received: from localhost ([::1]:50770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm9B4-0003cH-IT
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 03:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nm90n-00082S-KT
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:01:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nm90g-0002mS-Ru
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:01:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651647677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MlKuMntdGG5jofG3RftHwdC4fjPLXAcXBQuUXMV/ptM=;
 b=AUEF/dqEUTxT5s80t3v2oSd1p5cH5IO2IQc86L7UphM8n6Ci0+81gHY9i1MOOo0l5o84bC
 USHvG2uhzouTcoQn5LfzzOVuNCAL/zYh5NbViybUu6tviFmdYz4DTM2HVAUUS8gT+0ixcx
 PhkwBLHaVjCpsXJa8Ris+LuuVHty76A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-dH1yfjQkMNiQ72tmLpB3Yg-1; Wed, 04 May 2022 03:01:16 -0400
X-MC-Unique: dH1yfjQkMNiQ72tmLpB3Yg-1
Received: by mail-wr1-f69.google.com with SMTP id
 v29-20020adfa1dd000000b0020ad932b7c0so72768wrv.0
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 00:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MlKuMntdGG5jofG3RftHwdC4fjPLXAcXBQuUXMV/ptM=;
 b=zRPww8kJlGnbVvv+pC1t/AuWbjLz7hTcNtn+tJn0/e4jXEsObVwgvZMCrv7KyURi2y
 TyJLDB/XSvU6rolAXzVhIHIw0Urcji1zOUPl5H1eXd8pqsjvzm2JE7jVeLz43NU+KPhD
 7tmdGRgnIvkWXfACua91V559opIB5ZKexEx6VblTNT+TcYz+6b5cR9ckuV8IDx44rUv2
 PgM1HXKilhPDAPlbebxZH4lfZx4PvgLy9B/cgDN36zffIYOjZ/I2rVcz+Z8bpmz+5f2z
 VQACXr1AoupQnvQFealEEUEGW82NaVDOg/XyZizvkXBA7j1F/YEWuqDVSqb/Nfmef63m
 d1Ww==
X-Gm-Message-State: AOAM533TD3LDFYsybWiKNjbc9LlGCqBGgBY873aA10PUbFvRtETHk2j9
 7GGSroXuKA1eG3uxYQ5tcSuE/pHwtLTHZeTQOJxHXTQPNEpM9DpERH0qIsOt8in2i/IFf00o+5D
 VAxUS6PykSftnel0=
X-Received: by 2002:a05:6000:381:b0:20c:5e07:f75f with SMTP id
 u1-20020a056000038100b0020c5e07f75fmr8023456wrf.678.1651647675464; 
 Wed, 04 May 2022 00:01:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrDovY0onVTVSssS5zl+tSd2RCXBJalqvb1azS1iXfz8gJu81WqqF7anMbfvBnnh0zz++PZQ==
X-Received: by 2002:a05:6000:381:b0:20c:5e07:f75f with SMTP id
 u1-20020a056000038100b0020c5e07f75fmr8023418wrf.678.1651647674930; 
 Wed, 04 May 2022 00:01:14 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-177-80.web.vodafone.de.
 [109.43.177.80]) by smtp.gmail.com with ESMTPSA id
 k37-20020a05600c1ca500b003942a244f53sm156597wms.44.2022.05.04.00.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 00:01:14 -0700 (PDT)
Message-ID: <f7a77dcc-590c-96f5-8e92-5806f51ac0d4@redhat.com>
Date: Wed, 4 May 2022 09:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] tests/tcg/s390x: Use a different PCRel32 notation in
 branch-relative-long.c
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <20220502164830.1622191-1-iii@linux.ibm.com>
 <0e5c5988-c764-edd8-5f8f-f208f5cef1d0@redhat.com>
 <e71d638b-3c62-31db-1abd-02ba40042eab@redhat.com>
 <8543dc2de432c787770f9f01c448434ab1e30c63.camel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <8543dc2de432c787770f9f01c448434ab1e30c63.camel@linux.ibm.com>
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

On 04/05/2022 00.46, Ilya Leoshkevich wrote:
> On Tue, 2022-05-03 at 21:26 +0200, Thomas Huth wrote:
>> On 03/05/2022 11.02, Thomas Huth wrote:
>>> On 02/05/2022 18.48, Ilya Leoshkevich wrote:
>>>> Binutils >=2.37 and Clang do not accept (. - 0x100000000) PCRel32
>>>> constants. While this looks like a bug that needs fixing, use a
>>>> different notation (-0x100000000) as a workaround.
>>>>
>>>> Reported-by: Thomas Huth <thuth@redhat.com>
>>>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>>>> ---
>>>>    tests/tcg/s390x/branch-relative-long.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/tests/tcg/s390x/branch-relative-long.c
>>>> b/tests/tcg/s390x/branch-relative-long.c
>>>> index 94219afcad..8ce9f1c2e5 100644
>>>> --- a/tests/tcg/s390x/branch-relative-long.c
>>>> +++ b/tests/tcg/s390x/branch-relative-long.c
>>>> @@ -13,8 +13,8 @@
>>>>            #_name "_end:\n");
>>>>    DEFINE_ASM(br_r14, "br %r14");
>>>> -DEFINE_ASM(brasl_r0, "brasl %r0,.-0x100000000");
>>>> -DEFINE_ASM(brcl_0xf, "brcl 0xf,.-0x100000000");
>>>> +DEFINE_ASM(brasl_r0, "brasl %r0,-0x100000000");
>>>> +DEFINE_ASM(brcl_0xf, "brcl 0xf,-0x100000000");
>>>
>>> Works for me, thanks!
>>
>> Sorry, I spoke too soon - it compiles fine, and also runs fine when I
>> run it
>> natively, but when I run it through "qemu-s390x", it crashes... does
>> that
>> work for you?
> 
> Hi, yes, I just double-checked - it works fine for me.
> Could you please share the resulting test binary?


Sure, here it is:

https://people.redhat.com/~thuth/data/branch-relative-long

  Thomas



