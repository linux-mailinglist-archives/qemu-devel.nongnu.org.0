Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B77B5F6DCC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 21:00:31 +0200 (CEST)
Received: from localhost ([::1]:33666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogW6g-0007mo-1I
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 15:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogVeZ-0002V7-Ia
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:31:28 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogVeX-00038o-Vg
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:31:27 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 e11-20020a17090a77cb00b00205edbfd646so5120439pjs.1
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 11:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=gI4PgX/cNiQ9Ubah2GF7hH96dpJjDojj2/SuSlGQYe0=;
 b=kNnxBOHIkIjP3CY/RfBTYg3npUZKwE/glixUYgEAAHV80nbm0oU8RPGoo+w20qiec/
 Hhzrnu4CGw+T57JSf3woSNuLFn9gLOjDGyHKeBeTAi2zjoU1UbU4msyZpZblZqRTuKPI
 omJfuzWPftPN1arJBeG+1MR1KnbZMObI3dWstnYe29GetEEEMDpFjj3ox/RhVUd5h6mQ
 VXpi4RYzExtL2K18s2usnbnWx9NWyB5b8ecQUu2X4I+/HHKNkOBRBeFgmPWMEZmZc5JM
 LX01xpdicouqQIFMw6lSD8kWrMPrdbAiKXhTgBs2dgulTINfiADIWrtMHduvAYzvlhLW
 tTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=gI4PgX/cNiQ9Ubah2GF7hH96dpJjDojj2/SuSlGQYe0=;
 b=eTr67e4PskoUP00NNj6wlX5o+q+iMkr/0vLtG40Tqjwb0h5eiW9KkxvrHeu6g1PIXy
 aH8CeY6KLesEeiam3IniAsvPXledUMYBaSdE3/jiGG1pHmUI8rjPCJnPx7SWEccMi3Yc
 5+dcqig7gZajyvqcmG+i8C32OUheMHdDMMVzypALm501Y1FN9x0cjDCduyqKT2LMq/sl
 CJbDY0WVYhlaVnG9Jf8N5ISazTe8c8d63PkOPsxhR+Q9JEINFOeHKiHUOnnkDjKNXagv
 8vPts38YKozLnk+3zjEWow13Twz9Y69HJ1CfvA7B0LJ/VOemJNzc33ebXtFrf851d/HU
 MQ3Q==
X-Gm-Message-State: ACrzQf35wgF9JkojcLQ5EdlDrnmyj4GLnhUt9xy+IqxQaoYsqdQ+g+Ax
 Di9e541TW7fsVXoTz3eZ8OSWRw==
X-Google-Smtp-Source: AMsMyM53ekvhetoQZtOBdqRKxdANw3Jn4tHEv1UTe9YW7RTnGyyS+NKdUBcg8yn+rVgKLqnoS++DFg==
X-Received: by 2002:a17:902:c209:b0:17f:7da5:b884 with SMTP id
 9-20020a170902c20900b0017f7da5b884mr850564pll.26.1665081084202; 
 Thu, 06 Oct 2022 11:31:24 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:bc82:8006:f19e:85e?
 ([2602:47:d49d:ec01:bc82:8006:f19e:85e])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a1709026f1700b00178acc7ef16sm7746189plk.253.2022.10.06.11.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 11:31:23 -0700 (PDT)
Message-ID: <15c94fb7-3861-7933-91e9-49a6983a185d@linaro.org>
Date: Thu, 6 Oct 2022 11:31:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user: mprotect() should returns 0 when len is 0.
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Soichiro Isshiki <sisshiki@isshiki-clinic.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 sisshiki1969 <sisshiki@mac.com>
References: <20221006153841.10750-1-sisshiki@mac.com>
 <CAFEAcA-fXq47T2kNUcjbpZ9fQbLdc=jzkT_phMqJ5wyKrdXNmg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-fXq47T2kNUcjbpZ9fQbLdc=jzkT_phMqJ5wyKrdXNmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/6/22 11:13, Peter Maydell wrote:
> On Thu, 6 Oct 2022 at 19:05, Soichiro Isshiki
> <sisshiki@isshiki-clinic.com> wrote:
>>
>> From: sisshiki1969 <sisshiki@mac.com>
>>
>> For now, qemu-x86_64 returns ENOMEM when mprotect() was called with an argument
>> len is 0 from a guest process.
>> This behavior is incompatible with the current Linux implementation,
>> which mprotect() with len = 0 does nothing and returns 0,
>> although it does not appear to be explicitly described in man.
>>
>> This is due to the following function which always returns false if len = 0.
>>
>> ```C
>> static inline bool guest_range_valid_untagged(abi_ulong start, abi_ulong len)
>> {
>>      return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
>> }
>>
...
> Cc'ing Richard -- is this the right fix, or would it be better instead
> to make guest_range_valid_untagged() correctly handle a zero-length
> range ?

I think fixing the range check might be best.


r~

