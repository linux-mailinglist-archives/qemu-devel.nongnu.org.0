Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243FD3DAAC3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 20:07:10 +0200 (CEST)
Received: from localhost ([::1]:47564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9AR3-00034C-7y
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 14:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9AL5-0002JZ-Af
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 14:00:59 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9AL3-0002wG-9P
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 14:00:58 -0400
Received: by mail-pl1-x634.google.com with SMTP id k1so7853597plt.12
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 11:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zrXFFm9TBio1p4bQ/INKXueyykh/PeV1pGctuZ0C9E0=;
 b=AKYb4J6wcTnf0spBa4jJFvHaFEgLoR0t2BkrMLym0ZD5k8BxiH6a0tu1X9qctiYXh8
 VMcqB5dM8/Mrdua1U3htZfLRIcYclFu4We4k+36A0bj/FfMshuQcXe6qxcsAWv4Ac28l
 TnZxRhkErEBV51YpIlttSzll7rLZOZpoCrZ+oC3ZolJA+vHCkdUPw0bTef1zI9A47tBG
 HqaOKsvpjnJ62c8Gmgpw17F3mTlV6k1qRdQ3tAhX2x0hgA9rXRKMitaqFP67muS/BoqY
 1SxKWeydhTYcoAyNm72+d38eWoY+Wd3H6KbCGy+Xj6RfZTMNtLb1pGdo0wgKl/2h0IG9
 xpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zrXFFm9TBio1p4bQ/INKXueyykh/PeV1pGctuZ0C9E0=;
 b=JSNgT68FUEf7mQ2qjqw8MOYflTUv5lWF9YrjlhqLWw8ZwmFGG5kkyWFbR+FlP61nI+
 +z4djAUqcXs3rUdAqQcWGojIls8rhcnUoI1YB0CFWcI9NfT/L6J2k5e6Kx726/k3cjqg
 N6OvYNmRH8rYHTc7kdYD3jqOVEV/1mJfl+hotGYIFrMk5yVQUF5Q3uox7vPWeyTlFIz+
 hfq8XXz0UBYi1UbSaOyIVNI8Lni0/IH27Y727GCGlJbL2s7+r2WZ/EoUDXAPwCQTl8Bt
 7pyECqN6XFvvE5HXwYdJIlzD64RobMA1gwfSvO34wyxadd1txm4nkH43YNFo/DmtnMwd
 ZDrA==
X-Gm-Message-State: AOAM531tDzrbCOk87R2l7TrB8OvgVP+Wn6+AN6SJSKDTdfrpMIzZ+Z22
 BB5cIvh6pGH+Q3S6D86TwTXSGQ==
X-Google-Smtp-Source: ABdhPJzjUhWh5E2kaOc2ZGKL4kP6NIOOEMzswmp0EeYvS/rI+3UpS91Qtg2vIuqSnnKil3gSFuJjDA==
X-Received: by 2002:a17:90b:ec5:: with SMTP id
 gz5mr6377021pjb.77.1627581655778; 
 Thu, 29 Jul 2021 11:00:55 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id j10sm4690257pfd.200.2021.07.29.11.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 11:00:54 -0700 (PDT)
Subject: Re: [PATCH for-6.2 05/43] target/microblaze: Implement
 do_unaligned_access for user-only
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-6-richard.henderson@linaro.org>
 <CAFEAcA-gkse1PAzXuOwCrEbQXDiaMRWctyFSk46CC=A=oZg_tw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <890da7f4-accc-078e-e731-72d48c2122eb@linaro.org>
Date: Thu, 29 Jul 2021 08:00:50 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-gkse1PAzXuOwCrEbQXDiaMRWctyFSk46CC=A=oZg_tw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 3:26 AM, Peter Maydell wrote:
> On Thu, 29 Jul 2021 at 01:54, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/microblaze/cpu.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
>> index 72d8f2a0da..cbec062ed7 100644
>> --- a/target/microblaze/cpu.c
>> +++ b/target/microblaze/cpu.c
>> @@ -367,11 +367,11 @@ static const struct TCGCPUOps mb_tcg_ops = {
>>       .synchronize_from_tb = mb_cpu_synchronize_from_tb,
>>       .cpu_exec_interrupt = mb_cpu_exec_interrupt,
>>       .tlb_fill = mb_cpu_tlb_fill,
>> +    .do_unaligned_access = mb_cpu_do_unaligned_access,
>>
>>   #ifndef CONFIG_USER_ONLY
>>       .do_interrupt = mb_cpu_do_interrupt,
>>       .do_transaction_failed = mb_cpu_transaction_failed,
>> -    .do_unaligned_access = mb_cpu_do_unaligned_access,
>>   #endif /* !CONFIG_USER_ONLY */
>>   };
> 
> If I'm reading the kernel sources correctly, for Microblaze it always
> fixes up unaligned accesses, so for our linux-user code we want
> "ignore unaligned access errors" rather than reporting them up
> to cpu-loop.c, I think ?

Ah, in that case we should not be setting MO_ALIGN for some -cpu xxx, I think?  Or does 
the MSR_EE bit cover that?  Anyway, it looked reachable at first glance.


r~

