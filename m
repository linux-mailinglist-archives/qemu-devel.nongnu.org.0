Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E316C4C37
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 14:47:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peynt-0006p7-Km; Wed, 22 Mar 2023 09:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peynr-0006oZ-5R
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:47:00 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peyno-0003Ro-V6
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:46:58 -0400
Received: by mail-wr1-x432.google.com with SMTP id t15so17138384wrz.7
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 06:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679492815;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yvsFM/jeK9UMzwJ5u+X8u4Fns/qKEJvyjCNvM+oh2No=;
 b=cFe+MFf8Wb+Z0CLHLaHVgeE+TUW2rQbn91r67Wnz/4AAjdnuHevf4aFdIJ73KRVoqV
 UQwDAsco9S+vPn4IGNAjhGfAMcy9wlBHrZZHRPvnz62XV+2NvNcTmxoDMhZHTQE0Jz0+
 MGsORHjVaLy9oR0ug4OASYjCcKVUrBlbpotneNTF/5TeDklp86riXPbA2gNmn5gxIpCX
 mY1eGXQwWNl8Ru2F3KCDgFzLf5k5cMrojBfTWf+IZMeHhD7mjUaiDFhnSYCSZApeAAsQ
 OZKhJxgWxoJzUMsuLOGP33Q5j0hrBS0s9GExvhtXU+LUYpOBiqXpWoZeivHZWwUddosW
 7rEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679492815;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yvsFM/jeK9UMzwJ5u+X8u4Fns/qKEJvyjCNvM+oh2No=;
 b=6G7vJf9W3kW6mHIqVAhRHxnwOKvafkUBaGOVCmcEQboQ3cZQvmZSV/IpUoXEf53hEl
 D+TZxtLRs2lYAJCdQxsZCcL+6rHpJgIe5XeOWyWX9EgSHBMwL4FHDNf+BfzLurEvCN4I
 c/bC/XGH4rL7j7NQpUNYK2keyhmLp364GCTDwPQzZOYRbcDRIoWxUWVmo0xHnzGqHOt3
 Yd4jqF5vStavnGkjfewxz1+Kt9OR1QXx1VUTE3RD6kOdhd9q1XsgHg+IoDVOZYe9V/8e
 Kl5SQomrO8Z0TxYIlhr5bkgjNn/gnVNj8ZlscOlwy4AW0Bl63FoUPPOcmw4V9Iva8pIV
 xfNw==
X-Gm-Message-State: AO0yUKULu2rugEgTgksazBq0q7fvIxqWV09aHJUN/GOr4gsQXrW4bqn4
 5QPJFuvPaiV/L3wMGFNyKzvdqw==
X-Google-Smtp-Source: AK7set/yl5CzZQPxAh64G5RcHdRxBHstn/iYdnhkCEjDGjr8A3d2qWXz86kch3j5plJP0ARvNU9gdA==
X-Received: by 2002:adf:efd1:0:b0:2c3:dd81:49ad with SMTP id
 i17-20020adfefd1000000b002c3dd8149admr5460852wrp.33.1679492815178; 
 Wed, 22 Mar 2023 06:46:55 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k10-20020a5d6e8a000000b002d1daafea30sm13842997wrz.34.2023.03.22.06.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 06:46:54 -0700 (PDT)
Message-ID: <b8f71e80-ee91-0976-7723-65abf6d05aef@linaro.org>
Date: Wed, 22 Mar 2023 14:46:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] tests/vm: skip X11 in openbsd installation
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230322123639.836104-1-berrange@redhat.com>
 <20230322123639.836104-2-berrange@redhat.com>
 <d8fe0d24-03ee-4c4a-6886-36319eaa2948@linaro.org>
 <c3c944e3-f7e6-1ec2-5a18-e694d4c9c842@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <c3c944e3-f7e6-1ec2-5a18-e694d4c9c842@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 22/3/23 14:40, Thomas Huth wrote:
> On 22/03/2023 14.38, Philippe Mathieu-Daudé wrote:
>> On 22/3/23 13:36, Daniel P. Berrangé wrote:
>>> As a VM used only for automated testing there is no need to
>>> install the X11 stack.
>>>
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>   tests/vm/openbsd | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
>>> index eaeb201e91..6af7afac0d 100755
>>> --- a/tests/vm/openbsd
>>> +++ b/tests/vm/openbsd
>>> @@ -106,8 +106,7 @@ class OpenBSDVM(basevm.BaseVM):
>>>           self.console_wait("Password for root account")
>>>           self.console_send("%s\n" % self._config["root_pass"])
>>>           self.console_wait_send("Start sshd(8)",           "yes\n")
>>> -        self.console_wait_send("X Window System",         "\n")
>>> -        self.console_wait_send("xenodm",                  "\n")
>>> +        self.console_wait_send("X Window System",         "no\n")
>>
>> Wasn't this useful to link a X11-ready binary, even if only testing
>> with -display=none?
> 
> tests/vm/openbsd later installs sdl2 and gtk+3, so I assume that will 
> pull in the required libraries if necessary, without all the other 
> non-necessary stuff.

Good then, thanks for checking!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


