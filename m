Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F315B4BA582
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 17:14:25 +0100 (CET)
Received: from localhost ([::1]:42704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKjQH-00042m-3s
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 11:14:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKj3o-0008PS-Pf
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:51:12 -0500
Received: from [2a00:1450:4864:20::32f] (port=37761
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKj3m-0005FG-7t
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:51:12 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso6518901wmj.2
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 07:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kjsgOtUh2R9uifbmUiQOKUv91lKQ7ZUvApqVEN2a/uc=;
 b=YYx/QkU/fraIut2COHVNGanK9KvZ0bQ5CYjlHYFaKz9ndoJ0quKEEJIRO9/l0Z1uck
 EpwYrGrf4/1/EXCQPHoaw1/Fn8Snq4RdX/mormuQJcgQKHbi+j1sZaCG1NggxewGyeM1
 VOw2yDtm3g1y9L2UQ3BqaMLB8iptr4r9EfNRQvFU4uIhkfAh0nBEjihZt9qkBlSrn36n
 KMw/bCQLxqx7Fs5+nsvjqWVHyhmLrWdO8wBPps1txFloX4HBshhhxmG1BX3uE2+Y1Jnw
 s/PTybj7zj+0QS+6NXAHT+U0s3n8rJi11V4waQEpJSJgWY7vrh5oHD2ZXv7XYDSw6eoD
 BTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kjsgOtUh2R9uifbmUiQOKUv91lKQ7ZUvApqVEN2a/uc=;
 b=RHUOZGSJfcTBogxQ5GvJPPREH3ZFGOpJ4Rb3QNB/Y7PkplAzaFZqrNlVqvEzjewoUU
 zLnoqO3ZBzgvmGSb+YEk3jERN4CeIV1Ul4CnxFywWfubwA5meLYQkNsYe9pnMVJ3IuIz
 t0qQmC6xm8x7Ggc13rnBYNfmM0CkJq1EJb2NsxQB1AgsXNSNLOfi80Urrv76Wf57myz1
 Ih6myXTRJSkv1t7zTENIvMEXwFLvREEYYbyQBevmGEQEEf8o7vzXFg3tD/RgPzBhWeuy
 95iLUxqfUOApFKX9zhXG7E7uToEceHGhlJvn2RwEqllLo4c8KMZDRt65q+cHZN8yXJha
 MsbA==
X-Gm-Message-State: AOAM532BmrKxfEhRjJ5jup3VYgJhMxCxzuOowuTN9gbTBtzDK1SXt2el
 fe6Ki+1RG+kiUWPCpq6v6jI=
X-Google-Smtp-Source: ABdhPJwoElQ30l77t7GYWshXTzzffze2HF3zy3HcyB9kDfBVUjbRhNNXBK9Pom6rDgL1q5kxkwkAaA==
X-Received: by 2002:a05:600c:3588:b0:37c:306a:9eb7 with SMTP id
 p8-20020a05600c358800b0037c306a9eb7mr6421215wmq.107.1645113068220; 
 Thu, 17 Feb 2022 07:51:08 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id m8sm1813750wms.4.2022.02.17.07.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 07:51:07 -0800 (PST)
Message-ID: <38223bfc-a90b-d91b-527e-3ad6c4c9e45e@redhat.com>
Date: Thu, 17 Feb 2022 16:51:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Portable inline asm to get address of TLS variable
Content-Language: en-US
To: Serge Guelton <sguelton@redhat.com>
References: <Yg04Y05ccrbFVmG/@stefanha-x1.localdomain>
 <87leyaznm6.fsf@oldenburg.str.redhat.com>
 <CAJSP0QXmF=AKtaZO7GjxFtd7o5iQ9JC2xYGYDo-zC0Ea1POS5w@mail.gmail.com>
 <877d9uzgsd.fsf@oldenburg.str.redhat.com>
 <Yg4VV+VFe3Bc1BQ6@stefanha-x1.localdomain>
 <1a17e6e5-fd03-a01b-9692-4dd9d7bffcb0@redhat.com>
 <20220217150216.GD11782@sguelton.remote.csb>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220217150216.GD11782@sguelton.remote.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Florian Weimer <fweimer@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/22 16:02, Serge Guelton wrote:
>>> I took a quick look at C++20 coroutines since they are available in
>>> compilers but the primitives look hard to use even from C++, let alone
>> >from C.
>>
>> They're C++ only in GCC, too.  I really think that QEMU should be
>> compilable in C++, but I'm not sure how easy a sell it is.
> It's perfectly fine to have one compilation unit written in C++ with a few
> symbol in `extern "C"`. No need to touch the other part of the project.

It's not just one compilation unit, it's everything that uses coroutines 
so basically all of block/.  But yes, good point---it means for example 
that you don't have to deal as much with lack of operators in C++ enums, 
which would be a huge PITA in compiling QEMU with C++.  There would 
still be some churn such as adding extern "C" blocks to headers, etc.

The main change with C++20 coroutines would be to introduce co_await, 
co_return and std::future<> everywhere, which is also a pretty 
substantial change (possibly an improvement in the case of co_await and 
co_return, but still a lot of work).

That said, it's certainly valuable to try and get at least 
tests/unit/test-coroutine.c to run with C++ coroutines, and see how much 
work that is.

Paolo

