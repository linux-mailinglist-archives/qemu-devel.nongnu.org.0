Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B70F34F2FB
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 23:21:04 +0200 (CEST)
Received: from localhost ([::1]:44874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRLnK-0007hM-Or
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 17:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRLlN-0006za-Lq
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 17:19:01 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:39668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRLlL-0002wg-Oc
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 17:19:01 -0400
Received: by mail-pl1-x634.google.com with SMTP id w11so6823170ply.6
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 14:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pv3GvwXoeFmRY6pnU0eL/NEri8nhEnFruSFLfZ6Zrd0=;
 b=YwpJSMrr2LuobFbOfiyKgZXK9FXcHDv+Gs/DOD7V1EvoSlyxBZh893vxBJ1LIKl0h0
 BRibjEnkDiHXzE/eHAYho1H4rXHvMWavECs77B9jMkLHGz7sqGTWiy3nzynGnIiYZzfc
 aw75nTlgFqaK+LaiZe0t45yjqpX1/Daf7hOb/xb0TbS5n32+eoiFo8rtiw7Lsb/Otetd
 9fs+uYR2Rj8o3oQPHCkMCdBVZz8f7BoLsNStk5GK/nsn+IDbqd0tEcKGvNF30vg9ydtb
 tB5gEztw0S2M7MXlV6v0CPVvL4i8U2no8c14ImBeKBrXkurInFMzVzXvT0FAGblBofZO
 WNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pv3GvwXoeFmRY6pnU0eL/NEri8nhEnFruSFLfZ6Zrd0=;
 b=I+2uNYIU86Osd47txEMn24cwcYTaYOINY/qeiaJ1c0wbxOK/04qeUJMWX8+Lb+o8kK
 FLf07v5JZVk8P/GeB607yl63VdAq//qrleIe/mK6vnZtOf2tjI/OlW18vGGQxzgcBLE6
 +ZPAGSNXwElOYE5lVf8ZMjhloykzsF18f5O0XKd/+ttcoxqkU7wMtru498wgrK8gjVg4
 z44jJUcynjojH/QMbeK+bT2A8kE+3BUEZTAPQtszAQG6clbJ7spBrZ1jlblNpoV+rVxk
 rODwujpnTLmcQjb99a0cc59CsVZnPZWps661fcyNx/h+r/dv56KnwTrTxK8yfHo6oeIl
 0WOQ==
X-Gm-Message-State: AOAM531ZLmF5dDltG7yRY+e6DwCkwrznGLkmliHbom3doPDi74Wu147D
 Hbu70rwKLM1vbgjC6MFuUZMYCA==
X-Google-Smtp-Source: ABdhPJx6sz2xJ66oNo86KQvEdya7cB6H7G0rFwiqcLP8sIsusrHqj22Zv/qcD0sDM+9FFXvt+UTFcA==
X-Received: by 2002:a17:90b:fce:: with SMTP id
 gd14mr273668pjb.64.1617139137669; 
 Tue, 30 Mar 2021 14:18:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id mr5sm56591pjb.53.2021.03.30.14.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 14:18:57 -0700 (PDT)
Subject: Re: [PATCH v1 6/6] tests/i386/test-i386: try and correct constrain 16
 bit call (WIP)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210329110303.15235-1-alex.bennee@linaro.org>
 <20210329110303.15235-7-alex.bennee@linaro.org>
 <a71640f7-a864-1214-52d7-e6dab4677dd8@linaro.org>
 <CAHDbmO1+q=DxGQcoirmnsSfwp_XKoJvj04oWJBhpGCiEsK=_MQ@mail.gmail.com>
 <c0e83eb0-29ef-495a-1653-e0281812664c@linaro.org>
 <CAFEAcA-UL1hYanrOb5dBJWRHhfD9VVMU5ka0TOpWdysjGH7d6g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b185e4cf-4db0-0a71-1a16-024aac9e9e20@linaro.org>
Date: Tue, 30 Mar 2021 14:18:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-UL1hYanrOb5dBJWRHhfD9VVMU5ka0TOpWdysjGH7d6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/21 2:46 PM, Peter Maydell wrote:
> On Tue, 30 Mar 2021 at 21:27, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 3/30/21 12:20 PM, Alex Bennée wrote:
>>> Hmm actually the fedora-i386-cross image is:
>>>
>>>     gcc (GCC) 10.2.1 20201125 (Red Hat 10.2.1-9)
>>>
>>> with CROSS_CC_GUEST_CFLAGS=-m32 so I wonder what the difference is
>>> between that and:
>>>
>>>     i686-linux-gnu-gcc -m32
>>>
>>> i686-linux-gnu-gcc --version
>>> i686-linux-gnu-gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
>>> Copyright (C) 2019 Free Software Foundation, Inc.
>>> This is free software; see the source for copying conditions.  There is NO
>>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
>>>
>>> They are both pretty new.
>>
>> The difference, I'm sure, is a local distro patch enabling -fpie by default.
>>
>> I'm hoping that we can just use
>>
>> --- a/tests/tcg/i386/Makefile.target
>> +++ b/tests/tcg/i386/Makefile.target
>> @@ -10,6 +10,9 @@ ALL_X86_TESTS=$(I386_SRCS:.c=)
>>    SKIP_I386_TESTS=test-i386-ssse3
>>    X86_64_TESTS:=$(filter test-i386-ssse3, $(ALL_X86_TESTS))
>>
>> +# test-i386 has non-pic calls into 16-bit mode
>> +test-i386: CFLAGS += -fno-pie
>> +
>>    test-i386-sse-exceptions: CFLAGS += -msse4.1 -mfpmath=sse
>>    run-test-i386-sse-exceptions: QEMU_OPTS += -cpu max
>>    run-plugin-test-i386-sse-exceptions-%: QEMU_OPTS += -cpu max
> 
> configure will set CFLAGS_NOPIE in config-host.mak, but I don't know
> if you have access to that here. (It does suggest that there are cases
> where -fno-pie isn't available, though I guess they might be non-x86.)

I think it's merely old compilers.  We do have to be worried about old host 
compilers here.  I'm hoping that gitlab will find out if our oldest docker 
build will find out one way or another.


r~


