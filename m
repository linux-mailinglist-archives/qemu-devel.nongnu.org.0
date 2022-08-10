Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E209B58F3B0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 22:53:09 +0200 (CEST)
Received: from localhost ([::1]:51148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLshR-0006rX-1H
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 16:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLsc8-0003mR-7Z
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:47:40 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:34684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLsc6-00014g-Fz
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:47:39 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 12so15382028pga.1
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 13:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=jUddSW7v9pUHafpMQtpHDJGjbYLFOj+b3/VWiaFuMgM=;
 b=b/PIt+LzUK2fxmJf5CFXsd9u2PoVsjTPAO1Z8Q5VlXuvrbEf4RlNt8IZuST18aFxyp
 n0IKeHdsZd5vLtI93dTXWV3d7Om8A9o8MD2d0Pkw3EOHMWAmqEjdfvTLOhwifmO1mfTJ
 8xBRNNYtiGg7hdDKxN8VIUaUOFP6EbWaDG0ggeBlDSnYSF6NWSDHq7YEFenJySU71XMJ
 PPfpO2QvFaJB2194VExoWwUSNSVjIus89LDTRrN0wfxGNz3HEo0GgkUxxQ2GnaE/CD2/
 RClImcS7OQAXT94eE8u4EZBXqfM0xVmw4FcCvocQ7UuoieNqqEibVCagyMGquka9sR5r
 Mk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=jUddSW7v9pUHafpMQtpHDJGjbYLFOj+b3/VWiaFuMgM=;
 b=KuUzQKS4yeVbIVJH3IOUFs+qnbP27x9C3Un0Yag2yjZRdgc8nnxdFsSkgxXHtPuZ1H
 rQFMa/lSau6Dqyoc9CRvtRWmPU5a4yZGp7GCdBgAAC0/+gERdsKtTFtAiXxC/rIcIr7q
 RKLjzzSs5qgK0lt1mBpqsfNAHxTFy86pVnqQ41pgFBgSPcUYuqJ4yejmUOCrt4HA+Evj
 Aw+9/euNg7SJ8QSZ3/l5nOwVgV6qF5eJjQd1LdH0aJR9R+2GmFL+H00lEkHERgvvXNgN
 RK85xYrvG661bo932HdkmzzfZYax0EkEzqdNqb6UQGh8rcbtU5UD2fxunypBOJL+EEWv
 UIig==
X-Gm-Message-State: ACgBeo3tcG8qpGAqoclCWGvOCsY/fnIS2aK7KflXzfSS30sduv3LFYqU
 pHW5B2EYmlmu4YzM/GmZ+2L+pA==
X-Google-Smtp-Source: AA6agR5d0G/iZBOK5HEyMou6MBbhBSBI2XcthtXEjzPpXm4sTHUGN9bt9mJz717sS7HIlAcVY9PWlw==
X-Received: by 2002:a63:d5:0:b0:41a:58f:929e with SMTP id
 204-20020a6300d5000000b0041a058f929emr23924727pga.260.1660164457024; 
 Wed, 10 Aug 2022 13:47:37 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:1d05:6ab9:1c4d:d646?
 ([2602:ae:154e:e201:1d05:6ab9:1c4d:d646])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a63fc57000000b0041d7ab5865dsm6223847pgk.49.2022.08.10.13.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 13:47:36 -0700 (PDT)
Message-ID: <8b32824b-4dc1-3d1a-1916-918a3fffab26@linaro.org>
Date: Wed, 10 Aug 2022 13:47:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
Content-Language: en-US
To: Vitaly Buka <vitalybuka@google.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
 <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
 <CAPjTjwuNwXdemwFYOUDi4Qnc5fA9KWzAEZQ1JaCNu+0x3RUh7Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAPjTjwuNwXdemwFYOUDi4Qnc5fA9KWzAEZQ1JaCNu+0x3RUh7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/10/22 13:32, Vitaly Buka wrote:
> Sorry, I only noticed today that it's not submitted.
> Version is not critical for us, as we build from masters anyway.
> Richard, do you know a reason to consider this critical?
> 
> On Wed, 10 Aug 2022 at 13:04, Peter Maydell <peter.maydell@linaro.org 
> <mailto:peter.maydell@linaro.org>> wrote:
> 
>     On Wed, 10 Aug 2022 at 21:00, Vitaly Buka <vitalybuka@google.com
>     <mailto:vitalybuka@google.com>> wrote:
>      >
>      > How can we land this one?
> 
>     Pinging it a week ago rather than now would have been a good start :-(
>     I think it got missed because you didn't cc the linux-user maintainer.
> 
>     Is this a critical fix for 7.1 or can we let it slip to 7.2 ?

It's unfortunate that it got missed.  It's not critical, but it would be nice, because 
support for MADV_DONTNEED is new in 7.1 (previously, we ignored all madvise).

I'll note there are missing braces for coding style on an IF.

Laurent, do you have an objection to merging this for rc3?


r~

