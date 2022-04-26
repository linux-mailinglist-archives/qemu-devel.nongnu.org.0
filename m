Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF665100FC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 16:53:44 +0200 (CEST)
Received: from localhost ([::1]:45450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njMZT-0006Oj-8n
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 10:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njMYE-0005dQ-Md
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:52:26 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njMYC-0003QC-QH
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 10:52:26 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso2400417pjb.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 07:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/4FjUSopQV98UyRxb+bkAWI3hKd0Q8cNAeojx+9SvZg=;
 b=nwR2unfhf5FybkIbHQqJYx1dO8fm1XDk/Jrvz3YJEPbOgdqPmC8WQOWCFB03GY+Dej
 qEIew/uaiyCjw8oGRok96iKREg3x29bW3LPWxgfzN4b3cHpTEG91nCGJ2mtSi/z2EPyM
 Pzuznj6KXLy+F1Sto9bNMROP7j3626aa54EKjXgdEGVZS9NU3HQUfH5XjaY/2xLWLcqs
 oZvyCglZsW+PiSU5flu6PRiyslRrV445oWBB8XMvX3SKOwUReLIbspEOP2lwRyltC+rl
 BUnObN8lCMXiYEmeiP5TtlWBr1Yj//MZ/rSsYlAo/21Yyq4nbu+OBj/y4iAYY5hxzTQh
 rMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/4FjUSopQV98UyRxb+bkAWI3hKd0Q8cNAeojx+9SvZg=;
 b=45OQXL8Kun6f4EjliNtJ15cdOPI4mgxfAdWR+Gq5+5M8KK14St+4D50hhtWUDl5jNo
 ZXYPBTYFqjFV7eB/oKohiTmlGpvtn1OlnLlhUZZf5vo7VFqRRtG9DJORbWT1rM8eKIpV
 qmxkn0F+tSN/X2w4wVHx+7kLr6PG+WQ9dg/W+ROBd6wPYyEcip04keOvb4WSRLBM4VlV
 88oFZ/OzE9nviBO5qKaPmzPANzsCX5WCk/q/r3SE3Ms/H6tffvELhKCexIM9pfAXEWJp
 4Zw3X1cjURuUXUuYjKtfKtmMfS1tY3K1zBYMQ7nYsFpajkmzJidysHZX6kx1kvU6tQYe
 KSfg==
X-Gm-Message-State: AOAM531KHCoV+3bIb8nBOuJqxOd5teWgBame2XBUnn9Xa5687rp7yPWU
 1IIJbRG5MXuCeswY/NNE5fffrA==
X-Google-Smtp-Source: ABdhPJyIVLeKp5AmTVFXuC5fGgrVtriru8QRbhCSkjh7hnYsRfAOCqc+mYbJr1xlMaO+4apjXiD1nQ==
X-Received: by 2002:a17:903:22c6:b0:15d:45d8:8f8a with SMTP id
 y6-20020a17090322c600b0015d45d88f8amr1101123plg.31.1650984743260; 
 Tue, 26 Apr 2022 07:52:23 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a63be4f000000b0039934531e95sm13118886pgo.18.2022.04.26.07.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 07:52:22 -0700 (PDT)
Message-ID: <32b7785d-fc7b-46e7-8bab-68c8cb286a55@linaro.org>
Date: Tue, 26 Apr 2022 07:52:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 25/43] target/loongarch: Add LoongArch CSR instruction
Content-Language: en-US
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
 <20220425091027.2877892-26-yangxiaojuan@loongson.cn>
 <cc6c67a1-d1c7-49dd-b661-23afdc5a308d@linaro.org>
 <b8354320-078d-3f4a-efb3-9af07e5fd7c5@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b8354320-078d-3f4a-efb3-9af07e5fd7c5@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 02:03, yangxiaojuan wrote:
> Hi, Richard
> 
> On 2022/4/26 上午6:55, Richard Henderson wrote:
>> On 4/25/22 02:10, Xiaojuan Yang wrote:
>>> +static void output_r_csr(DisasContext *ctx, arg_r_csr *a,
>>> +                         const char *mnemonic)
>>> +{
>>> +    output(ctx, mnemonic, "r%d, %d # %s", a->rd, a->csr, csr_names[a->csr]);
>>> +}
>>> +
>>> +static void output_rr_csr(DisasContext *ctx, arg_rr_csr *a,
>>> +                          const char *mnemonic)
>>> +{
>>> +    output(ctx, mnemonic, "r%d, r%d, %d # %s",
>>> +           a->rd, a->rj, a->csr, csr_names[a->csr]);
>>
>> Need to check for csr not in csr_names.
>>
> I will re-used  get_csr() to check csr,
> 
> like this:
> if (get_csr() == NULL)
> {
>      printf("Undefined CSR.\n");
> } else {
>      printf(" %s\n",  csr_names[a->csr]);
> }

No, please don't.  Since this is used twice, you may wish to create a local get_csr_name() 
function, but it's as simple as checking ARRAY_SIZE(csr_names), and validating that the 
entry has a name.

The disassembler should stay self-contained, so that we may re-use it for tcg/loongarch64 
host disassembly.


r~

