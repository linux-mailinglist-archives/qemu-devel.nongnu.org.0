Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD48F6AEF2C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:21:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbvX-0003HY-D0; Tue, 07 Mar 2023 13:20:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbvT-0003Dj-BO
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:20:39 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbvR-0004ni-Ux
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:20:39 -0500
Received: by mail-pj1-x1032.google.com with SMTP id y2so14088463pjg.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678213236;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5gHg7wqB0Wt2IMD4tbvtYuHrsmbX5fzTyfp5wDXRN4Y=;
 b=Tjei545MdKBjYGiwWtzqWw7VKlH4yIZtsPJhZBFEaGK23n4kipXoC0+UeD6sdX/TYS
 BUoNGxzHJ1OfnSDyiJeJhsZ8cQONwW83lfgzsMIUbpzsVBp324I/2UVlCEuuJc66HWhy
 qO11WAXNJMPmWZRn8I4c2VGjYjANXGBWRhJc3me6ay/e1VsMQGmqiAbYUWHw2cp285gX
 ZW7m9yLNaE7H/AcaJJC3nL/Uxpk/TIzav+1akn8hi3+zbOdFNMvCLWtHI+oJwCtENYlg
 C37ZCa0aJA8V49Ixb0AxJ9g8uUVO8z8GQWSd2o8itkF8/HJ1fMWZ8l9wnWNWL4FljJDR
 Tu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678213236;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5gHg7wqB0Wt2IMD4tbvtYuHrsmbX5fzTyfp5wDXRN4Y=;
 b=DmER+OmqZEjCGOPvQW5rJCYXeY6uPpbSxzGvoq4eY4uky83z4FIXsB4Xgu2UtqJ/n8
 zZqE5/UuprcUKvu2rAfbYvUUDbxkWq13Vhab1f6Ebguvdd6jkf/X3nphw5rsRQXYiqYR
 oPAT3y2qR3VUT5UbZAUCKZ0qsBb5EOeZZLJIup38UtMlTME37+YmDqJnvhs+ET4DsV2w
 U1nH6Ji1b9vUCu99XFaDzyPZuK/h23CVKIe5bPD1Fb7DqSXDStSfEf4+yzb4NMLMm6/8
 RaLXAeJDQ8ABvjiDdIKJtTtCSgtTdI4etXzIgK6yUf3qGiFYZpT3d/lQPaDh6l4JMUvJ
 /5ew==
X-Gm-Message-State: AO0yUKW9U5XY3Tsk56hrIujWcE+Cz3/P1ILHXH+L+j6kJQxhGoYTdLBX
 V+7VsmMsT82uXrIlK19A0zCgOQ==
X-Google-Smtp-Source: AK7set/tBnR+iDGsJXtk7aVVtiXK05OBANMJ41DjeMHOXOManY7xCARmLXtCUzE7kxtkzkEhP7B5lQ==
X-Received: by 2002:a17:902:6b49:b0:19a:7f4b:3ef6 with SMTP id
 g9-20020a1709026b4900b0019a7f4b3ef6mr13051380plt.3.1678213236283; 
 Tue, 07 Mar 2023 10:20:36 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb?
 ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a170902ed5400b001963a178dfcsm8691409plb.244.2023.03.07.10.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 10:20:35 -0800 (PST)
Message-ID: <10a7773d-5665-3c84-f49e-df0cfc6d81a3@linaro.org>
Date: Tue, 7 Mar 2023 10:20:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] linux-user: fix bug about incorrect base addresss of gdt
 on i386 and x86_64
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>
Cc: peter.maydell@linaro.org, fanwj@mail.ustc.edu.cn, qemu-devel@nongnu.org
References: <4172b90.58b08.18631b77860.Coremail.fanwj@mail.ustc.edu.cn>
 <86533769-fecb-974e-765e-c1210cb36d4f@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <86533769-fecb-974e-765e-c1210cb36d4f@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/7/23 06:30, Laurent Vivier wrote:
> Richard,
> 
> do you think it's correct?

It's correct enough, until target/i386 is fixed to not require the GDT/LDT to be 
incorrectly mapped in the (ring 3) user address space.

You may wish to fix a few nits when applying:

>>   }
>> +static void target_cpu_free(void *obj)

Missing line before function.

>> +#if defined(TARGET_I386) || defined(TARGET_X86_64)
>> +    new_env->gdt.base = target_mmap(0, sizeof(uint64_t) * TARGET_GDT_ENTRIES,
>> +                                    PROT_READ|PROT_WRITE,
>> +                                    MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
>> +    memcpy((void*)g2h_untagged(new_env->gdt.base), (void*)g2h_untagged(env->gdt.base), 
>> sizeof(uint64_t) * TARGET_GDT_ENTRIES);

Unnecessary casts, overlong line.


r~

