Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE35539334
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 16:34:55 +0200 (CEST)
Received: from localhost ([::1]:36850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw2xR-00050Z-Kc
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 10:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw2ud-0003Hb-R5
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:31:59 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw2ub-0004aZ-7c
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:31:59 -0400
Received: by mail-pg1-x529.google.com with SMTP id e66so13000970pgc.8
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3AXIJdEPmzez2A1nnD43US2+aGxHHZqDgzDb+qv6wCs=;
 b=zDFxU0eXZYXQRwU3rSCaAzDsBW/iq/K5xSgnfNnRquX1pdXCtdrqvQ3QW0K3A1gQOZ
 /2luakm80G3FENkE9IlgL+/9Y1mHSJBF+Ye1nQ4G7DEts4yAEddPWptJCW2WBhkWktb2
 JlhnqFIjvwj4m5jD+ivZYNYNoTJUPs8HWJm+/Id0hmA3hbMwhIRkrXXv12R7h42rW0mA
 qvIOk0idtqGeGuTA6VGofMpScRTcpO/GBLLeYvg9HOiLwK9PZ6uBJ3H0LlX/EK8NczAn
 /j9Un/vZIuJ6xmlQPJOTcB9bJGTppWxyCaQu1JmfM8iPlrukaEg6PH389KHS5mUzQAGL
 /ouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3AXIJdEPmzez2A1nnD43US2+aGxHHZqDgzDb+qv6wCs=;
 b=mWQiqusC9y+wkATq8fMDtQQ9SniVPUAPBPi4es+ipaTXNAwtU8HPWX+Yn+8kLMMvji
 1XZlHXMbvsUtDU9yTRxibn9p3bHTMhezKHTCAtEPBXVM8EcXWXcOupxzz5PiiPvdFOCB
 7+0r0629c/A4qlGbGRFt1HBwnfc9a/5TUudU/a839FE0NBU5Zr1+MgKZDVpayeP4OHGn
 eHvGK4D2E3q1spY1hEvE3pueMzM/estnPn9Vxz7+9pm7goje8CL5pkwqq63lxSeO6OIb
 ws1MYhzsQ0u+hdPszSfP6ROmmIr0iLPbV/SlTU6hPWuIFCRJ34q4ud3TIEYYrumwnwIZ
 VMPg==
X-Gm-Message-State: AOAM530ACm5B8UlcDlODS7wm2OTFDU85+xMmphyve+s1uhEj91i30cZP
 d5dSEKWesuM2S4oqAfNgDg6mww==
X-Google-Smtp-Source: ABdhPJyCa3nKDv+UPqqaIr8tK3JZJ+upj42A7MvZQ2Mmr/080+3fvAsM53Psy9MUNgIF43MXQc/wNw==
X-Received: by 2002:a63:2b02:0:b0:3fb:fe88:8a8f with SMTP id
 r2-20020a632b02000000b003fbfe888a8fmr10611430pgr.247.1654007514974; 
 Tue, 31 May 2022 07:31:54 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:4ae9:ceee:85cc:a70c?
 ([2602:ae:1547:e101:4ae9:ceee:85cc:a70c])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a170903204b00b00163be997587sm6177077pla.100.2022.05.31.07.31.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 07:31:54 -0700 (PDT)
Message-ID: <5b2a06d7-4b2a-e24d-0630-1dd41a12dbf6@linaro.org>
Date: Tue, 31 May 2022 07:31:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 07/18] target/arm: Hoist arm_current_el in
 arm_generate_debug_exceptions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-8-richard.henderson@linaro.org>
 <CAFEAcA9Z9cc_K+JC9z2K5qKJ=zOUcGJSwznsaX=7t+5edjNMiA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9Z9cc_K+JC9z2K5qKJ=zOUcGJSwznsaX=7t+5edjNMiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/31/22 05:04, Peter Maydell wrote:
> On Mon, 23 May 2022 at 21:58, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Read this value once in the main function, and pass it
>> around between the subroutines.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
> What's the benefit from doing this ?

Just trying to reduce the number of times that arm_current_el is computed within these 
tightly coupled functions.


r~

