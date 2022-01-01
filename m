Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2843C482859
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Jan 2022 20:51:22 +0100 (CET)
Received: from localhost ([::1]:60628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3kPR-0004ws-9q
	for lists+qemu-devel@lfdr.de; Sat, 01 Jan 2022 14:51:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3kNA-0003Ld-AR
 for qemu-devel@nongnu.org; Sat, 01 Jan 2022 14:49:00 -0500
Received: from [2607:f8b0:4864:20::42f] (port=40563
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3kN7-0005t8-Le
 for qemu-devel@nongnu.org; Sat, 01 Jan 2022 14:48:58 -0500
Received: by mail-pf1-x42f.google.com with SMTP id q3so21787645pfs.7
 for <qemu-devel@nongnu.org>; Sat, 01 Jan 2022 11:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5IiEudQMvResE/8WiUfbWhjW+91YE1wdR/BfYJc4HVQ=;
 b=rQD7joDyMLhlHeZZ79S2K0cHQrU5md/gS0Oe8a1M7tkzFfackImlV5PDs8oLKKEzr4
 r82w6x5LMTAeeghdxuqlW7CeZcL8ByvQcJPSi7TZkbrDeqXH6oulXAxW3HkRzUDmB69j
 Y7XsENVmOKnUXRhAE07ixUg6szz/7//9fUZZ7Ki8KOEy3Lkf1PbV79UHjAgi/KEiJRLn
 5lLgBshLOCIdZ+dl7q2dFiq9u+tPOJOA2mY75T4nXemo/VdX+1HIZyII0xBV64AREH1J
 VeV8eXz1eAyNL8o4aGhZ726i9G0+07qNzuar9gM48CQMvoZkzF9fn2WcMwcNlddRr63W
 8hJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5IiEudQMvResE/8WiUfbWhjW+91YE1wdR/BfYJc4HVQ=;
 b=3IvyyWqEYaLK58JCUZAZESCEn0TuEtaI0xfpT4CZckC82mBwKK30F/jYoSfEoBWBdO
 YIWMk/adM27Ywf/ntGmqyEyXIqityYYtHKemhw45OakQZtaJBLB5xmWt8iC5t8TxymDZ
 khjIxEqVLXTjxTnGYvk+Gk/indJeN/UCGBtp1nUm2JjsWx+nLNlmPLutlE2AGxFmnsfP
 vqZiPoLScGT2dav+0QJ6aEmEbub4Ekz61MerQabb48X9mxju1kIWup6Cf9dG/qNORbYG
 vn62GNesMKc6LkOJVOwE+Gi7FA5V4XD3k+UbblsE8v9HWuWFZVaCFDQRTPUZyGGpU4SR
 l61w==
X-Gm-Message-State: AOAM5324mkNjEA6bYeA8KkwtejBUAIUPokR4jEzK4brd7MjvuYORiMqx
 lD/TmOlYRre0/v3RxV8I2uxgag==
X-Google-Smtp-Source: ABdhPJwNIO/UtOBhmBfv1EnEyN559aIEtRkQxPzd7whKisu2YHm5eD0ijGi48ODN9p3QGyFbNiUNVA==
X-Received: by 2002:a63:384d:: with SMTP id h13mr16548141pgn.472.1641066536330; 
 Sat, 01 Jan 2022 11:48:56 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:ffc3:704e:e577:9222?
 ([2601:1c0:6101:be80:ffc3:704e:e577:9222])
 by smtp.gmail.com with ESMTPSA id g16sm31434589pfv.159.2022.01.01.11.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jan 2022 11:48:56 -0800 (PST)
Subject: Re: [PATCH v2 3/6] target/riscv: add support for zfinx
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
 <20211231032337.15579-4-liweiwei@iscas.ac.cn>
 <a522f7f6-b6ad-02de-dabc-0511740aef83@linaro.org>
 <7096a296-f1c2-44e7-d084-1c473b50a711@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <120dea96-eade-bcd6-eea0-0017b165f1ca@linaro.org>
Date: Sat, 1 Jan 2022 11:48:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7096a296-f1c2-44e7-d084-1c473b50a711@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/31/21 10:05 PM, Weiwei Li wrote:
> 在 2022/1/1 上午4:06, Richard Henderson 写道:
>> On 12/30/21 7:23 PM, Weiwei Li wrote:
>>> +    if (reg_num != 0) {
>>> +        switch (get_ol(ctx)) {
>>
>> Oh, you should be using get_xl here and elsewhere in this patch, not get_ol.
> 
> Sorry. I don't know the difference between get_xl and  get_ol. From gpr register 
> read/write function, It seems get_ol is used in register read, and get_xl is used in 
> register write.
> 
> However, "ctx->ol= ctx->xl;" is executed before translate instruction.

ol is the operation length; xl is the register length.

In this case, the operation length doesn't matter -- we're interested in distinguishing 
RV32 and RV64, because that's where the change in semantics comes from.


r~

