Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E1C3894AC
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 19:32:49 +0200 (CEST)
Received: from localhost ([::1]:53358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljQ3s-0007iU-6y
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 13:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljQ1R-00060q-S3
 for qemu-devel@nongnu.org; Wed, 19 May 2021 13:30:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljQ1N-000513-H3
 for qemu-devel@nongnu.org; Wed, 19 May 2021 13:30:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621445409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2TXlL8l966dkI2PTc9Y7mMquXoOadZryVJoyfoxUXBE=;
 b=SDvq3lOTEARMXmF9GTrK7gV1mguRD9n7dypC6NTF/jnyeuikPQg9e2+KhrvkE830YIzDGG
 IoeqFM3xbJLE57H8rdPhYAM0zaIhyYe1ZlCsp8FXT2SE45dWOLIxqARXsgFrFC0EWKO4S+
 X56VH1DPG7dapLQqbiig4uj1g+BG41I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-hz52skd9PO6ja_qzVO6pEw-1; Wed, 19 May 2021 13:30:07 -0400
X-MC-Unique: hz52skd9PO6ja_qzVO6pEw-1
Received: by mail-wr1-f71.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so7370644wrm.13
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 10:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2TXlL8l966dkI2PTc9Y7mMquXoOadZryVJoyfoxUXBE=;
 b=HxVmrNbVqYJYwoOWC4Jgh80rQ3L/ewzCef6dwprfffPwQJ4YMj/I4h47x79MUxgg1W
 4f2KueWjmhDdRGQBwzgkFCrCziieKpSvx/rIJPE+oTyk1vEOcFIQ1kCcsH3rWdR8wjQ0
 06ggBxYcPqXxcH3A5BsKJbctz0eAX49RFkIOZBGouZgJi8aHEh9Kncbzz8QmpiCTmCUF
 9MpuUTSwQdJUa62aeurKI7I0ezQAXkQBbi4AYpBagvjE4DcOKinhq5DV+Fa7CUFEeDj1
 coSIJzjoyFnGTXAhBSAhHATmLM2mZSY/vXV5EKmR/cUGnp5BQGVKoSC4E5cLI/ESuntD
 lQsg==
X-Gm-Message-State: AOAM530HptflTV/9PuLhxz3/emLBryTZVuFbdJD2jyZKSndjPQt0g0xY
 KTofIQkrGeA4TwwqEhdZtAv7mlumHVMa2FXFVX3+lTRN8v3zumJdJmdI7YLrMNrU8+srHl2HtVa
 ZpSflROu1Ah3A38Q=
X-Received: by 2002:a05:600c:4f0f:: with SMTP id
 l15mr343787wmq.143.1621445406519; 
 Wed, 19 May 2021 10:30:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4FUP+gwoIGCVKM9tSgHzrvVMrNGWOpZYcmqK1ngu1CfMzwGrNBI7waWXAVssXSNXAKRtUHQ==
X-Received: by 2002:a05:600c:4f0f:: with SMTP id
 l15mr343765wmq.143.1621445406307; 
 Wed, 19 May 2021 10:30:06 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f7sm18627wrg.34.2021.05.19.10.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 10:30:05 -0700 (PDT)
Subject: Re: [RFC PATCH 08/25] qemu/bswap: Use ST_CONVERT() macro to emit
 16-bit load/store functions
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210518183655.1711377-1-philmd@redhat.com>
 <20210518183655.1711377-9-philmd@redhat.com>
 <CAFEAcA-sMr1_1Ckyu2qXJ5ZKhqDFgOd0Uxh+Q9ZKghrhB4ue5g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <26d7a151-e503-69d3-190f-2b08d8676d11@redhat.com>
Date: Wed, 19 May 2021 19:30:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-sMr1_1Ckyu2qXJ5ZKhqDFgOd0Uxh+Q9ZKghrhB4ue5g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 10:08 PM, Peter Maydell wrote:
> On Tue, 18 May 2021 at 19:37, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/qemu/bswap.h | 17 ++---------------
>>  1 file changed, 2 insertions(+), 15 deletions(-)
>>
>> diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
>> index 86f5ded6acf..4e2bd2e97ee 100644
>> --- a/include/qemu/bswap.h
>> +++ b/include/qemu/bswap.h
>> @@ -350,11 +350,6 @@ static inline int ldsw_he_p(const void *ptr)
>>      return r;
>>  }
>>
>> -static inline void stw_he_p(void *ptr, uint16_t v)
>> -{
>> -    __builtin_memcpy(ptr, &v, sizeof(v));
>> -}
>> -
>>  static inline int ldl_he_p(const void *ptr)
>>  {
>>      int32_t r;
>> @@ -399,11 +394,6 @@ static inline uint64_t ldq_le_p(const void *ptr)
>>      return le_bswap(ldq_he_p(ptr), 64);
>>  }
>>
>> -static inline void stw_le_p(void *ptr, uint16_t v)
>> -{
>> -    stw_he_p(ptr, le_bswap(v, 16));
>> -}
>> -
>>  static inline void stl_le_p(void *ptr, uint32_t v)
>>  {
>>      stl_he_p(ptr, le_bswap(v, 32));
>> @@ -434,11 +424,6 @@ static inline uint64_t ldq_be_p(const void *ptr)
>>      return be_bswap(ldq_he_p(ptr), 64);
>>  }
>>
>> -static inline void stw_be_p(void *ptr, uint16_t v)
>> -{
>> -    stw_he_p(ptr, be_bswap(v, 16));
>> -}
>> -
>>  static inline void stl_be_p(void *ptr, uint32_t v)
>>  {
>>      stl_he_p(ptr, be_bswap(v, 32));
>> @@ -466,6 +451,8 @@ static inline void st ## size ## _ ## endian ## _p(void *ptr, vtype v)\
>>      ST_CONVERT_END(le, bits, vtype, size)\
>>      ST_CONVERT_END(be, bits, vtype, size)
>>
>> +ST_CONVERT(16, uint16_t, w)
>> +
> 
> Where we have a macro that emits a bunch of function declarations,
> can we also add a comment that (a) documents the functions and
> (b) explicitly lists the name of every generated function?
> The latter in particular is really helpful for people who are
> trying to find function declarations/definitions with 'grep'.
> The comment above the definition and use of the CPU_CONVERT
> macro in bswap.h is an example.

For (a) I think the current comment is still valid:

/*
 * the generic syntax is:
 *
 * load: ld{type}{sign}{size}_{endian}_p(ptr)
 *
 * store: st{type}{size}_{endian}_p(ptr, val)
 ...

For (b), certainly, I'll add that list.

Thanks,

Phil.


