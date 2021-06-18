Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF43AD311
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:45:08 +0200 (CEST)
Received: from localhost ([::1]:44262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKQN-0006nt-Cc
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKDm-0005WR-VL
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:32:06 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:36373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKDl-0002tK-Bh
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:32:06 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 s17-20020a17090a8811b029016e89654f93so8700819pjn.1
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zCdtJ8ocq7zP/PLx9Fr1XmIUCNvN6uNn4GfM8XCJ2Bc=;
 b=UrpqI44qPBNn5pa+rS0hv2cnj3OS1q8hM30aEYhwyfAUaadiaFkSNkukmARtuBXHaB
 WT7FQ6xfJqdIhKdAOXBY/fR1omR9enYDKMPY/KWL9Vw6UrIx0NWmLxw5Ujm9Snd366Wu
 dGmhGEHCbnDYeqJI1Q/3j/xgVukqoclsqLV+yNa6oMoJMmoPLj83bP7lEqD/5FmCaoo2
 EMdKdD4Wumdob+HkM30fuush796OIFc4EvyaJdHAHad6SguH0YHfncH6aLqnfXrnv3j4
 kNgyxxWaLJqxY1AyarcMP5OVzy3JgYrKUG5fI0JtWvqIXHtlcAX8npsTMxRfnZI24Lce
 NeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zCdtJ8ocq7zP/PLx9Fr1XmIUCNvN6uNn4GfM8XCJ2Bc=;
 b=UB162ywg3JQ6VHISvx3YH639BHp77PfiqndWTmVbaEksuWRt4lYc7xI5CDn4ER8luT
 y5fzgGB35y1/YyuHNnLGdgkS6Bs4V6ZT+kvePvZDuTNpjoy64IFCj7BcayVlGxcZmPzf
 WFUV7Kg1Lp6d0TedNbthnTU7+RTLR8g3+rI1C++lmNOrNXv/JzZgAE4/r2JUUXSh9ij6
 GJEOCRsbOkMdtl656jWU8wjVs6MWcr8jtmnmEWJSo21fmJ5wMPIozsMPMNDZbG5OKHvR
 nrqByMeLo/VmBf0KnaGzZ6ndzI7g3gpo6uERxOBuU9sekzRm2tAbq9d0TH66qVp/WEm0
 UYeg==
X-Gm-Message-State: AOAM5332OY13Kxq6FwrEEKirrezky7Z07GDWSF4wyzC/CG3R3yjV4/iv
 hbCxQJ767z0KbgfEP2c3RWi5Vg==
X-Google-Smtp-Source: ABdhPJwj3O23wW0Slcj3l4mPUmIJMv14md+2FqvIDbFvtMm4fBBjJSgjINTpAzFwmqfAFg7KfjfzEg==
X-Received: by 2002:a17:903:304e:b029:11d:75ff:c304 with SMTP id
 u14-20020a170903304eb029011d75ffc304mr6058438pla.33.1624044724100; 
 Fri, 18 Jun 2021 12:32:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s21sm9504359pgo.42.2021.06.18.12.32.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 12:32:03 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] accel/tcg: Probe the proper permissions for atomic
 ops
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210617011224.1602932-1-richard.henderson@linaro.org>
 <20210617011224.1602932-2-richard.henderson@linaro.org>
 <4180796b-ff24-545c-0be8-0ff389d64ec4@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e55c34aa-b5c6-9f88-2961-7abd8c1f9668@linaro.org>
Date: Fri, 18 Jun 2021 12:32:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4180796b-ff24-545c-0be8-0ff389d64ec4@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Cc: alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/18/21 11:57 AM, Matheus K. Ferst wrote:
> I can confirm that this fixes #390, and all the other test cases that I have for lq.

Yay!  Can I get a Tested-by then?

> Does "Resolves:" automatically closes the issue on GitLab...

Yes.


r~

