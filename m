Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0963E352F5B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 20:39:34 +0200 (CEST)
Received: from localhost ([::1]:33706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSOhg-0002BC-Sm
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 14:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSOgh-0001jT-SK
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 14:38:31 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:45711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSOgf-0003gr-Er
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 14:38:31 -0400
Received: by mail-pg1-x52c.google.com with SMTP id j34so2034887pgj.12
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 11:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eVG85JSGYx3YW1Z3hObLHag8wYu8sq5+0PwKvZeLxg4=;
 b=bYo1uLAKAeymDKsgDBV7XavxWFXKaSvZHA7FEBlU1brc+ho63a5SLYGYCyHUeqTJ6C
 M6VJsuB1Su20u5lfg+ZWu2Sd5afFDzi8lUhZmwAc8B/Ktq6toKA7RTWRwWd/aEVAuJyp
 hF03WGQomNQsfiOCT4pQcUn+2txMpiP8L/jkTObcxv/aiKY9dxe+/7D2g6rDK+LiF9HF
 Y2LN7tIvBVTT8PWX7CZsHXFpIygfxXs4RxJMwMK5XMBudIO5jlbhHEZNcTqy5tzZ5e10
 ybz5SF2TGPBKINrt+wbg3UWzRzhg8gUImTuxgVvUP41YEoMlxIy5jvkKxq7L7uk8j1ed
 fxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eVG85JSGYx3YW1Z3hObLHag8wYu8sq5+0PwKvZeLxg4=;
 b=XQDPk+MougmpPfkta1B3szuAcaXA8Xasv3nB6WbKsMtxDLyf6/gXOJn5H0YI2EyN6N
 xP0427ZFjQu38CskcwSd/tq8jUjHsZUvcCu9ym7huUUSr7w3Jmr1pVvwe0LhN20UwEuo
 Gnd5Jem870XmfnITTvCAUR/sKHuc8TH93ffWPwaSt9QmKD5/VEfWZ2jt6d4IOhPjSlJ+
 rXyeyTExeRD+MflMT7oGZKG+0eDweS09M1na37HiOVQyREXLpcDIoYMx7C1ulYdzEraR
 tpQ4thgswqexGVz+ihxvO+3SB0N+ADOZ4pUv0OsNLbTYXFR58X3z8XdYXydHP3fhysCQ
 yWFA==
X-Gm-Message-State: AOAM533OhR0Iu9tTZdU5hm5Oro7B/ogbV00syx7oxWDqISFv5561I223
 S2rz1HpBpjB2nIrQc5kxXd/hFg==
X-Google-Smtp-Source: ABdhPJznUZA0bOyfYO0oJo0+cS4S3dqkLm6f6AI0Px0JzB7ceUaXTXMosX62vnll38H95ZCk4jVgjA==
X-Received: by 2002:a65:640f:: with SMTP id a15mr12554489pgv.121.1617388707981; 
 Fri, 02 Apr 2021 11:38:27 -0700 (PDT)
Received: from [192.168.51.152]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id r22sm9463710pgu.81.2021.04.02.11.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 11:38:27 -0700 (PDT)
Subject: Re: [PATCH v2 07/11] tests/tcg: relax the next step precision of the
 gdb sha1 test
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210401102530.12030-1-alex.bennee@linaro.org>
 <20210401102530.12030-8-alex.bennee@linaro.org>
 <de4fa9a0-8951-14fa-d2c4-fa0df2fbf8f8@linaro.org>
Message-ID: <cb05e689-062d-f1d8-264c-c8810592615d@linaro.org>
Date: Fri, 2 Apr 2021 11:38:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <de4fa9a0-8951-14fa-d2c4-fa0df2fbf8f8@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/2/21 9:41 AM, Richard Henderson wrote:
> On 4/1/21 3:25 AM, Alex Bennée wrote:
>>       check_break("SHA1Init")
>> -    # check step and inspect values
>> +    # Check step and inspect values. We do a double next after the
>> +    # breakpoint as depending on the version of gdb we may step the
>> +    # preamble and not the first actual line of source.
>> +    gdb.execute("next")
>>       gdb.execute("next")
>>       val_ctx = gdb.parse_and_eval("context->state[0]")
>>       exp_ctx = 0x67452301
> 
> This double next seems just as fragile.  Why don't you just set the breakpoint 
> where you want, which appears to be sha1.c:138?

That said, make check-tcg has passed, completely, on my laptop for the first 
time in a year.  So,

Tested-by: Richard Henderson <richard.henderson@linaro.org>

r~

