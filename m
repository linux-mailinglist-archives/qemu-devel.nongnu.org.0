Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C64E648491
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 16:05:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3eul-0007pj-SH; Fri, 09 Dec 2022 10:03:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3etz-0007f4-TQ
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:03:44 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3ety-0005Ns-7x
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:03:03 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-14455716674so29435fac.7
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 07:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wa37G9YnYNnmmP2wIK/5k518pcEvkSDgsHDtNr4+8fg=;
 b=ddKbUJ0KQf9vBxf3tL1nSBZtJ1E2vzxiwwz5fUsdJxLQyaQEqg1d/OXS9bvZRI2CKY
 rQaVgoLarNeomETJBQKJQpjSYkjvNz6qt7yoHf6/XuBpRaOUR8jma9jkkzxtb/KY9bYu
 FlEIudz6Ri/aeNQtAVzBFSu90h8QbTRWfhhtOngd9fLzH3wxbnCAvWZJJX6s+CBsj75g
 3j7cvQaGd+h8Ht81f0er5X1rQ/WHvFvWHLa28/4eVPQ6ZIPXGyjLIbEJyhMN3zMOJhjm
 ZIFiYr65w4IPqji4qmHbNGPEzuHzy1rdidZ/NSREJSQWh/+m4JL46QP7/gK7SzxjN8Xa
 hgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wa37G9YnYNnmmP2wIK/5k518pcEvkSDgsHDtNr4+8fg=;
 b=1PDvf098KAMAms4mWmGMvyV2IVsxkrMgIvVTGfiQg1QBGH/AKYLsyJNsqTxfoDvWUZ
 tcGs+e0bbsfUm0TydNSkGHd0Jlqf5lCC9POonNZ/As7jHag5e+G89L5OpEeHcpDzqj3+
 KUADiPDgX7PLRjkyhUuFh+8Y9CsdDkbJWb1ChFG7zsZ7msKMdbMl0CtuWBAY66CzUpS0
 RbVu6U7KtEa2rMgt3c45inAM2C2ppttyca6rH6/fHWS/tltO9aQcQlBgOdD7sofGA9ub
 9QuAtv6MhG5aFGg0nyRbpYnuAhEGgb1azfI+ce1YRxkVtRF8cnFrHMihseDCJeEUXSvH
 LWHw==
X-Gm-Message-State: ANoB5pkLPWOUwRsPAdyAwIXWEvnbW6Fn+LhWYyWPuar9D4YPDTJZ7v/H
 se4HYEpnU8A5kOv7nbLz9tJ7sA==
X-Google-Smtp-Source: AA0mqf7W/nQl2UwzOzUBwTw0WiNVwOMlst5uWWjfItKg2RrdILMNWEG76RKBsO5e48NRr/9MnXcZxQ==
X-Received: by 2002:a05:6870:669a:b0:144:bf16:f432 with SMTP id
 ge26-20020a056870669a00b00144bf16f432mr3189200oab.50.1670598180639; 
 Fri, 09 Dec 2022 07:03:00 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:e9d4:8f23:13a5:7d87?
 ([2806:102e:18:2efc:e9d4:8f23:13a5:7d87])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a056870219200b00141e56210b2sm923108oae.57.2022.12.09.07.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 07:02:59 -0800 (PST)
Message-ID: <55b06ba2-cd46-b9f0-c789-0cc39101a007@linaro.org>
Date: Fri, 9 Dec 2022 09:02:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Target-dependent include path, why?
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <87edt9gnyz.fsf@pond.sub.org>
 <e797bb33-6f27-d20a-6a35-9372366bd4f5@linaro.org>
 <87v8mlez92.fsf@pond.sub.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87v8mlez92.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
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

On 12/9/22 02:51, Markus Armbruster wrote:
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 12/8/22 23:12, Markus Armbruster wrote:
>>> I stumbled over this:
>>>       ../include/ui/qemu-pixman.h:12:10: fatal error: pixman.h: No such file or directory
>>>          12 | #include <pixman.h>
>>>             |          ^~~~~~~~~~
>>> Works when included into target-dependent code.
>>> Running make -V=1 shows we're passing a number of -I only when compiling
>>> target-dependent code, i.e. together with -DNEED_CPU_H:
>>>       -I/usr/include/pixman-1 -I/usr/include/capstone -I/usr/include/spice-server -I/usr/include/spice-1
>>>       -I/usr/include/cacard -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/PCSC
>>>       -isystem../linux-headers -isystemlinux-headers
>>> Why?
>>
>> Because of where [pixman] is added as a dependency in meson.build.
> 
> Is it added where it is for a reason, or is it accidental?

I don't know for sure, but I doubt it's accidental.
I'm sure it is where it is based on existing usage.


r~

