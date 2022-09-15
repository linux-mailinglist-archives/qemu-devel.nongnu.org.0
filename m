Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B6C5B94F4
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 08:58:49 +0200 (CEST)
Received: from localhost ([::1]:54370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYipi-0006Zu-GL
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 02:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYifs-0000bq-Bk
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 02:48:36 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYifq-0001Hn-BL
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 02:48:35 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso12348417wma.1
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 23:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Ze5JVAxkwwdFWnpzCRKyK3SV+j6OBOo/IjWbI5VPD+M=;
 b=WhTTTfrANkhADGh4a3utfDzF5PGvofK5Q/T5VGCvAuVIPjb1nYifSLpMjY6/xZVhfN
 7e0QJshf5vHxt5clGaKz51lYp0e/RttQEUt9jRGVtJZ0tJ//tGW/4hGQAFJr9Sdh799M
 xmcl2tXcnU+c504n1CPI9opR3c4MhCqipUm0lNAGONhFL+1RhrN1g0wze7VUrb8pUMqh
 XW3Wc9+KMDotHvE3C7MRoSTNG3zIAVs2Z7nxfuAC6/EE+ZS8V7ONFOCSXNYX18DtyFPS
 oI/Ak1a/+NahSdSUtpOwUDNCYOsEO4bUklkC7oEp4gHMjHbctV6WqxdAho3+cp6TOD0g
 KY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Ze5JVAxkwwdFWnpzCRKyK3SV+j6OBOo/IjWbI5VPD+M=;
 b=mkaJvpIra+i1xGmIBXsnqG0Sjsh49OLtWfYKbRrPJB1E+JI7vBCz9xAnCr88n0D+aZ
 YeUPhfGm7xBmbWQ6EN5luofS81nTk6/9g0vWe1ja5Z7hgjA/8i8TlF6lLF5dQJZtsfDk
 Gh2sQAtrZVGEFA0ESK75N44xgb48nPc48L/t099npv8SYCb21iBEhmcCB6seccG34iiw
 WQh36R8OilNuaQc2njWfJGMzbfLxNA7gWKeFflOu7oC1J6VVPSdJn+9y14XF5k70sCAB
 tGx/g/+ylPovZBF6HB5ElOHs54LWjCFQFKaqImOoDUVEJ5lUw9pqn6fBNHejF7JPGH1h
 G0Mw==
X-Gm-Message-State: ACgBeo0hisMQ0Oqc7+zVGtHrMtpch3ekb3FEDXntIBKdPINynDPcAHYu
 9NlZncJoKVf1CRtvi9zBQz3GxQ==
X-Google-Smtp-Source: AA6agR7xmTEGmww62SvNj1o+1F5Wby0cRZijIER5kWfuPcnn5Ai5aEPVC+SSt6uyaAv0pwr/wcn/jA==
X-Received: by 2002:a05:600c:4ece:b0:3b4:a79c:1333 with SMTP id
 g14-20020a05600c4ece00b003b4a79c1333mr2149514wmq.49.1663224508236; 
 Wed, 14 Sep 2022 23:48:28 -0700 (PDT)
Received: from [192.168.85.227] ([185.122.134.1])
 by smtp.gmail.com with ESMTPSA id
 d5-20020adffbc5000000b00228d6bc8450sm1673464wrs.108.2022.09.14.23.48.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Sep 2022 23:48:27 -0700 (PDT)
Message-ID: <8a337a4f-4b76-b9bd-3e82-40cae3c43536@linaro.org>
Date: Thu, 15 Sep 2022 07:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 27/37] target/i386: Use tcg gvec ops for pmovmskb
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-28-pbonzini@redhat.com>
 <58a3c681-a46a-d433-38b5-37c03515a3c9@linaro.org>
 <CABgObfamzmohqhBUa+r4nzJxmYUhfz+8H2W3B3rjWnZxux9XLA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABgObfamzmohqhBUa+r4nzJxmYUhfz+8H2W3B3rjWnZxux9XLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/14/22 23:59, Paolo Bonzini wrote:
> On Tue, Sep 13, 2022 at 10:17 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/12/22 00:04, Paolo Bonzini wrote:
>>> +    while (vec_len > 8) {
>>> +        vec_len -= 8;
>>> +        tcg_gen_shli_tl(s->T0, s->T0, 8);
>>> +        tcg_gen_ld8u_tl(t, cpu_env, offsetof(CPUX86State, xmm_t0.ZMM_B(vec_len - 1)));
>>> +        tcg_gen_or_tl(s->T0, s->T0, t);
>>>        }
>>
>> The shl + or is deposit, for those hosts that have it,
>> and will be re-expanded to shl + or for those that don't:
>>
>>       tcg_gen_ld8u_tl(t, ...);
>>       tcg_gen_deposit_tl(s->T0, t, s->T0, 8, TARGET_LONG_BITS - 8);
> 
> What you get from that is an shl(t, 56) followed by extract2 (i.e.
> SHRD). Yeah there are targets with a native deposit (x86 itself could
> add PDEP/PEXT support I guess) but I find it hard to believe that it
> outperforms a simple shl + or.

Perhaps the shl+shrd (or shrd+rol if the deposit is slightly different) is over-cleverness 
on my part in the expansion, and pdep requires a constant mask.

But for other hosts, deposit is the same cost as shift.


r~

