Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1964E4DAED7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 12:25:32 +0100 (CET)
Received: from localhost ([::1]:53120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nURmU-0003SU-Tg
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 07:25:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nURkF-0008UP-Ni
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 07:23:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nURkA-0006Kk-CR
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 07:23:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647429785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xt/N28QarI8r1Ey9RthCWgxM9Kl6RJSxLZpSUL7Ruh8=;
 b=QQIcW7HyBnm4/jIzAJvuncPU8uAz2L24gBYRhhc/1cUsG6tnu6+3uP6oNj8YuVF+UCCBpJ
 blhiUksLdpV8Zc/Ila8BEQPC27KGoE3xnAGyj0k5Zj43d8tr0B8ukgq+VVKttE2sN04+H7
 4xjwk/Kv2SNmA7m6WdKeuBdM4iTpaco=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-fTiV0MjxMLyEi18dGPn_ow-1; Wed, 16 Mar 2022 07:23:04 -0400
X-MC-Unique: fTiV0MjxMLyEi18dGPn_ow-1
Received: by mail-wr1-f70.google.com with SMTP id
 z1-20020adfec81000000b001f1f7e7ec99so451675wrn.17
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 04:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xt/N28QarI8r1Ey9RthCWgxM9Kl6RJSxLZpSUL7Ruh8=;
 b=1ANZOxKs4PvBahGbPCyVqDCcFcrs0FnLmDwW0jwmy0yCZDYMwhUYooESWyN72zQbmn
 O+Tdcfn7O7VBbGFWmAmMGudqL9/icUe4TUxdPMcn4oRZrTeHz2iCSiIzvEKj4/XolKch
 jg2UjOllm9TQYT1jore3F0jAGXwjrS15SbpmJJEW7lAvkDVdhz9rhS6HzcLm1CyaZ0wh
 sATo5KePXpnj5jI61P4CjkF0YUaNLfIzwC0ERx5wGIfXVIv9m1y0BCSFXwA+q73x9wCW
 7gsREKwnglK/YHBVkP5i641YKIoKK53ouROFs/y8PVSnUZ2pGBvKObOirNbigjLXKnMn
 L+zg==
X-Gm-Message-State: AOAM530veXBYa9ZcAtkeR3SosBHGC8dtzJplvtNiL360FaNpuQ7wx6KO
 YXLiBa5uX9Yk2/OFOzNzMKEhc9xmoT0SD8xyB/4tSxm81swsAbjFB9MARQh5auO4cpzwjkLfHj6
 D039Cg0hPgj1d4Bo=
X-Received: by 2002:a5d:6c6f:0:b0:203:7796:2d4 with SMTP id
 r15-20020a5d6c6f000000b00203779602d4mr24587243wrz.393.1647429783541; 
 Wed, 16 Mar 2022 04:23:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAnPuLOz8nAlJGOBG77saKiRJ8ls+OBK3GUlU71ooLY1rrlYp8LeBeAIzIwrq47S10XPh7Sw==
X-Received: by 2002:a5d:6c6f:0:b0:203:7796:2d4 with SMTP id
 r15-20020a5d6c6f000000b00203779602d4mr24587194wrz.393.1647429783234; 
 Wed, 16 Mar 2022 04:23:03 -0700 (PDT)
Received: from [192.168.42.76] (tmo-065-170.customers.d1-online.com.
 [80.187.65.170]) by smtp.gmail.com with ESMTPSA id
 u8-20020a5d4348000000b00203dbfa4ff2sm1440376wrr.34.2022.03.16.04.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 04:23:02 -0700 (PDT)
Message-ID: <ba668d50-e960-0dd3-6069-1fe89ac549be@redhat.com>
Date: Wed, 16 Mar 2022 12:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 10/27] Replace config-time define HOST_WORDS_BIGENDIAN
To: Halil Pasic <pasic@linux.ibm.com>
References: <20220316095308.2613651-1-marcandre.lureau@redhat.com>
 <9c101703-6aff-4188-a56a-8114281f75f4@redhat.com>
 <20220316121535.16631f9c.pasic@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220316121535.16631f9c.pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 "open list:virtio-blk" <qemu-block@nongnu.org>,
 David Hildenbrand <david@redhat.com>, marcandre.lureau@redhat.com,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 "open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Coiby Xu <Coiby.Xu@gmail.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/03/2022 12.15, Halil Pasic wrote:
> On Wed, 16 Mar 2022 11:28:59 +0100
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> On 16/03/2022 10.53, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> Replace a config-time define with a compile time condition
>>> define (compatible with clang and gcc) that must be declared prior to
>>> its usage. This avoids having a global configure time define, but also
>>> prevents from bad usage, if the config header wasn't included before.
>>>
>>> This can help to make some code independent from qemu too.
>>>
>>> gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>> [...]
>>> @@ -188,7 +188,7 @@ CPU_CONVERT(le, 64, uint64_t)
>>>     * a compile-time constant if you pass in a constant.  So this can be
>>>     * used to initialize static variables.
>>>     */
>>> -#if defined(HOST_WORDS_BIGENDIAN)
>>> +#if HOST_BIG_ENDIAN
>>>    # define const_le32(_x)                          \
>>>        ((((_x) & 0x000000ffU) << 24) |              \
>>>         (((_x) & 0x0000ff00U) <<  8) |              \
>>> @@ -211,7 +211,7 @@ typedef union {
>>>    
>>>    typedef union {
>>>        float64 d;
>>> -#if defined(HOST_WORDS_BIGENDIAN)
>>> +#if HOST_BIG_ENDIAN
>>>        struct {
>>>            uint32_t upper;
>>>            uint32_t lower;
>>> @@ -235,7 +235,7 @@ typedef union {
>>>    
>>>    typedef union {
>>>        float128 q;
>>> -#if defined(HOST_WORDS_BIGENDIAN)
>>> +#if HOST_BIG_ENDIAN
>>>        struct {
>>>            uint32_t upmost;
>>>            uint32_t upper;
>>> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
>>> index 0a5e67fb970e..7fdd88adb368 100644
>>> --- a/include/qemu/compiler.h
>>> +++ b/include/qemu/compiler.h
>>> @@ -7,6 +7,8 @@
>>>    #ifndef COMPILER_H
>>>    #define COMPILER_H
>>>    
>>> +#define HOST_BIG_ENDIAN (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)
>>
>> Why don't you do it this way instead:
>>
>> #if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
>> #define HOST_WORDS_BIGENDIAN 1
>> #endif
>>
>> ... that way you could avoid the churn in all the other files?
>>
> 
> I guess "prevents from bad usage, if the config header wasn't included
> before" from the commit message is the answer to that question. I agree
> that it is more robust. If we keep the #if defined we really can't
> differentiate between "not defined because not big-endian" and "not
> defined because the appropriate header was not included."
> 

Ok, fair point, now I got it.

Acked-by: Thomas Huth <thuth@redhat.com>


