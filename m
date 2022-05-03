Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428B2518D2F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 21:29:25 +0200 (CEST)
Received: from localhost ([::1]:59278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyD5-000436-TF
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 15:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlyAj-0002vd-Fm
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:26:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlyAg-0004Pw-Ve
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651606014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bGItJ9fmbbNlJ6FGiSNLAMJ205YSQ/NhHMZtt20O+FE=;
 b=QNn/2JdqiHlkyajdmYYpAIsTfJ8dpaBMMhw4iI9c2O1t9zpqWdjayqDkbpBgWO9B4b+GF9
 L0uQ+vTc6K13tdsrLqM5aU7ePZizxhHDT8Gpe222/AdB/S/dnkX//XmS/Cgz7Zuv/VqeOH
 3WTNqz84A7XCfqk/0RnmqRYKz9kXYrA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-49xURklbM9OXE_4S6FSzGg-1; Tue, 03 May 2022 15:26:53 -0400
X-MC-Unique: 49xURklbM9OXE_4S6FSzGg-1
Received: by mail-ej1-f71.google.com with SMTP id
 sh14-20020a1709076e8e00b006f4a5de6888so852290ejc.8
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:from:to:cc:references:subject:in-reply-to
 :content-transfer-encoding;
 bh=bGItJ9fmbbNlJ6FGiSNLAMJ205YSQ/NhHMZtt20O+FE=;
 b=gOp8zdS1a7WCn3Jqs0FR3BBFU8w2Wu7F0MipFabcQLTmjGjbmNYipsTlNsG7CxhDWP
 +OlVBFZEojAr8HR3vk6F1pIKjR9BJzvKo7SfVoun99Gxv/Shyxx3WCDvV4O7sQc8UNsS
 iFVIkGIqapeIoYc11U7b2IJ9c5pm85c98Yk8NPqOIsrTYyZCxyEHKZVmBWezY78c8l/W
 IJqoYlH02QMro71fg6j/GBpF0XrOMZ7HYdNpYpDUk1x2UcKylH3hEjsjaV8tRhhpE0hs
 GwAQkqHfozYKInbKF/U+4ouwKC+fZ8vLFRQirpq0fgkdmk/jZr8y00ZNlV1QFTUi23Io
 XMvg==
X-Gm-Message-State: AOAM533qyLcAuvFv4JVtwVJSgNS6hwuaBrPpeSCnD4h3j+tupoWjV4B1
 wpB/nBoIAHOw84loLCoFkP9NwrAa/W2fBH1uoulTMwQbnCAZHsIjP+V6lz37/1igTyVPDKMvmyz
 nMcymudsPwF2LnI0=
X-Received: by 2002:a05:6402:354f:b0:418:849a:c66a with SMTP id
 f15-20020a056402354f00b00418849ac66amr11912703edd.234.1651606012157; 
 Tue, 03 May 2022 12:26:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4fn4upbMpL1xf28lZ+tzVh3czRBgrWG1Ir/O4fVv+PX6wXL1a/oyXB/1U1MvcEYxef2DmYg==
X-Received: by 2002:a05:6402:354f:b0:418:849a:c66a with SMTP id
 f15-20020a056402354f00b00418849ac66amr11912675edd.234.1651606011852; 
 Tue, 03 May 2022 12:26:51 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 s8-20020aa7cb08000000b0042617ba638csm8127927edt.22.2022.05.03.12.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 12:26:51 -0700 (PDT)
Message-ID: <e71d638b-3c62-31db-1abd-02ba40042eab@redhat.com>
Date: Tue, 3 May 2022 21:26:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <20220502164830.1622191-1-iii@linux.ibm.com>
 <0e5c5988-c764-edd8-5f8f-f208f5cef1d0@redhat.com>
Subject: Re: [PATCH] tests/tcg/s390x: Use a different PCRel32 notation in
 branch-relative-long.c
In-Reply-To: <0e5c5988-c764-edd8-5f8f-f208f5cef1d0@redhat.com>
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

On 03/05/2022 11.02, Thomas Huth wrote:
> On 02/05/2022 18.48, Ilya Leoshkevich wrote:
>> Binutils >=2.37 and Clang do not accept (. - 0x100000000) PCRel32
>> constants. While this looks like a bug that needs fixing, use a
>> different notation (-0x100000000) as a workaround.
>>
>> Reported-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>> ---
>>   tests/tcg/s390x/branch-relative-long.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/tcg/s390x/branch-relative-long.c 
>> b/tests/tcg/s390x/branch-relative-long.c
>> index 94219afcad..8ce9f1c2e5 100644
>> --- a/tests/tcg/s390x/branch-relative-long.c
>> +++ b/tests/tcg/s390x/branch-relative-long.c
>> @@ -13,8 +13,8 @@
>>           #_name "_end:\n");
>>   DEFINE_ASM(br_r14, "br %r14");
>> -DEFINE_ASM(brasl_r0, "brasl %r0,.-0x100000000");
>> -DEFINE_ASM(brcl_0xf, "brcl 0xf,.-0x100000000");
>> +DEFINE_ASM(brasl_r0, "brasl %r0,-0x100000000");
>> +DEFINE_ASM(brcl_0xf, "brcl 0xf,-0x100000000");
> 
> Works for me, thanks!

Sorry, I spoke too soon - it compiles fine, and also runs fine when I run it 
natively, but when I run it through "qemu-s390x", it crashes... does that 
work for you?

  Thomas



