Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475E44115DC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 15:32:06 +0200 (CEST)
Received: from localhost ([::1]:50352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJOu-0007Hn-RU
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 09:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSJMy-0006GJ-1X
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:30:07 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSJMv-0000fI-6e
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:30:02 -0400
Received: by mail-pg1-x532.google.com with SMTP id m21so8131538pgu.13
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 06:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D8pOEMc+aylnRz+FHkTZ45jwr2z/i/M898t/O6zkGJA=;
 b=rYAMkuHQ3UvTHfcU+uvSjNn//fi4Zn/48TnrqQzw06+vUdXdAxluEfpu6cDWHO4GCu
 G4W3da+cCuos5+t54Shv85SBKlvYv3Jo4fRXGkdCHDNKozhPUWfL2mxUxHRrE96cJNyk
 py3x/LM0vGE4cT71MQGkE2IrcKzboX1A8SeTVBqE490ZjBqTMLecD1f665JUwi1yE8ML
 dRMmLFAWqx83FqeyGPbGTW5m0A7i6V2F00E69Ukbf58aL8V/hsVHGQcad8fD5pq9S9IB
 N3a057sEnDHBVnvdG+u53jCL1E3WnN6fyXcnxCsWkew3fTlkMGtbFQEf7ofIV3dvQbzg
 f08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D8pOEMc+aylnRz+FHkTZ45jwr2z/i/M898t/O6zkGJA=;
 b=wrt6ufJr5f5H9WMBjFHSzcCdZqHlBD3Xl0aCJYUqQImj1IOavLHCZPkwZ955g65tPS
 dWOSMOOS6oEcoskBa8HdZogWZedo4f6hUkY0FJWIm2bLJ/bIlMlNnCSzcc4hzgq7zfAZ
 57j9tRwtrDuxr2L+lB6dVzpQq+s6twtiatg5fc9mdO53uo+S/8H3u5ytnhLnZh+U7nFN
 yYYh6+b58yY93ZQbOytl40X6ZMgUqOKkSjEd8XhTR+4AoFWw3hDwvQ3uOFxuYf/H8peo
 SEI1g5w1BYruFxVvSvFIcDRCVHN5qLf8j7y9FhhWfqg7oHouDnwtSX/OAaFhD2X0rZ2P
 lPqQ==
X-Gm-Message-State: AOAM531DHEFzQoQD6rga1SnAJIk+SclFnxNn6BBEdqN4UiMW7rqvwVoK
 ytMYiG+gO7/RdAwFfU6b8vFA+w==
X-Google-Smtp-Source: ABdhPJy04binPouJ67oV3VBLcLurZWlUwZNNA4/hmE+JL/VwYU4q20FRQerDZVap94dIoG6uWkaZpw==
X-Received: by 2002:a65:44c3:: with SMTP id g3mr23389714pgs.233.1632144599383; 
 Mon, 20 Sep 2021 06:29:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x7sm14837580pfc.71.2021.09.20.06.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 06:29:59 -0700 (PDT)
Subject: Re: [PATCH v2 5/8] target/arm: Take an exception if PC is misaligned
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-6-richard.henderson@linaro.org>
 <CAFEAcA9Eg1gPuNR1DKPB8Yk1VJ=xADTEDim=jrwFN6mhVdV=Nw@mail.gmail.com>
 <af2e92e3-ef2d-50a8-bec4-6c1191f3ac27@linaro.org>
 <CAFEAcA8woYVpeKrUrqHBVu2mg25x7e8oh3kh1-1DukfOrLv_PQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c13cc671-709d-6734-7179-ebad949e7dff@linaro.org>
Date: Mon, 20 Sep 2021 06:29:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8woYVpeKrUrqHBVu2mg25x7e8oh3kh1-1DukfOrLv_PQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 1:08 AM, Peter Maydell wrote:
> On Mon, 20 Sept 2021 at 02:29, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 8/26/21 6:45 AM, Peter Maydell wrote:
>>> I don't think you should need to special case AArch64 vs AArch32 like this;
>>> you can do
>>>      env->exception.vaddress = pc;
>>>      env->exception.fsr = the_fsr;
>>>      raise_exception(env, EXCP_PREFETCH_ABORT, syn_pcalignment(), target_el);
>>>
>>> for both. AArch64/AArch32-Hyp exception entry will ignore exception.fsr,
>>> and AArch32-not-Hyp entry will ignore exception.syndrome.
>>
>> Not true.  The latter case still requires syndrome with EC_INSNABORT, etc.
> 
> For AArch32-not-Hyp ? Syndrome doesn't matter at all in that case
> (only Hyp mode and AArch64 have syndrome registers); it just needs
> to take the prefetch abort exception, which you get by using
> EXCP_PREFETCH_ABORT.

In which case I have incorrect asserts over in cpu_loop.  Sigh.

r~

