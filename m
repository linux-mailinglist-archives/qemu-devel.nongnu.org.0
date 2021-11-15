Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C4045002D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 09:43:24 +0100 (CET)
Received: from localhost ([::1]:57208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmXaE-0007ro-Tr
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 03:43:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmXZ7-0007B7-JL
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 03:42:14 -0500
Received: from [2a00:1450:4864:20::42e] (port=35510
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmXZ6-00049j-2v
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 03:42:13 -0500
Received: by mail-wr1-x42e.google.com with SMTP id i5so29075118wrb.2
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 00:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2CYKang/LD+YZ76S3YQWr7l6LeNPNbYWAz3K7IdkwrQ=;
 b=q9Yg/4hPN8gqSg/diki6E7Rcfjmqbj677Ls4qkKRhZ1GJLK6eP7KU3dMC2EnmEE/kb
 H7blsgSZfIpddRhIIN3GuFHc1H1b/QOJHwkVpxkhJTc6V8sPkMPdFPlFFOqBZsWiFQdd
 WYljnfHPNZBp2LDqAYdcPNrsCYYJ2vBogc7kT/PBPzFWqdTPTOGeb78MW4mgPKFfv7oV
 /UPInvQcEA9MxZKZoApdoxfoPmGjqK74/PHyF1iRbxv3M2eL6S9dhlzcCUpzkOdsWYjb
 cMI9HFRqU34XzErjZIft/2JKncRmG7tm31SD6eSJ0WCYWIfd3g3KUp5Z6ZpM46YxMGhK
 c2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2CYKang/LD+YZ76S3YQWr7l6LeNPNbYWAz3K7IdkwrQ=;
 b=gAso2lHfr/wYbBzbKF+g4J7F3s2RAc6UKgZg1hrEG3aKf2CgbIHYh6Tge3XBOs0DBD
 dsxz9fFfJOIeCmHGruERyNb8Jw5pEw3F8IFzi9j0O+4VBaKKZB/2eGLd4FzaH80BMdoZ
 +V0YoQt11GMp9MjozruZt66yt8BPrjc1dATZqGBBVNPAGZZi35xIpiVGzG+gCdUBCSFY
 K7ZxdSEUjXxWfdYk+fxy+aTcAgMq+nBRLV5i1vg/CgtwVnQ7FUWV8wWTySKEWFW0T1JF
 2oPPuQ4zxTgGHFQkm8ejJU+jBl8EiCCsOXoUBJtcW0T0+eswfsYaQXcPzcFyDlXehwJA
 1x8A==
X-Gm-Message-State: AOAM530W/SCK9E9vqchCb0k30olk3kCw8fM+kRWXeETObA6r+REGgrIe
 Yl9KB7CJDXezMlDWOJsHG8yR4A==
X-Google-Smtp-Source: ABdhPJxLks5PCB0XmWyHQI2cSNQLPJrGeHfcB4GrXcpDdSH1qpszg/q4UVVqYh+vvwm1bjMP794Ozg==
X-Received: by 2002:a5d:6781:: with SMTP id v1mr43867817wru.239.1636965730300; 
 Mon, 15 Nov 2021 00:42:10 -0800 (PST)
Received: from [192.168.8.105] (137.red-176-80-46.dynamicip.rima-tde.net.
 [176.80.46.137])
 by smtp.gmail.com with ESMTPSA id m20sm20868244wmq.11.2021.11.15.00.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 00:42:09 -0800 (PST)
Subject: Re: [PATCH v10 04/26] target/loongarch: Add fixed point arithmetic
 instruction translation
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1636700049-24381-1-git-send-email-gaosong@loongson.cn>
 <1636700049-24381-5-git-send-email-gaosong@loongson.cn>
 <7e6e5c26-2c1a-e4b5-a724-c2db33a36180@linaro.org>
 <5c3c3107-da7f-7e13-189e-866c7ff1acde@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f1e1b0fd-b34e-1403-1851-35c783a12237@linaro.org>
Date: Mon, 15 Nov 2021 09:42:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <5c3c3107-da7f-7e13-189e-866c7ff1acde@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.278,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 4:59 AM, gaosong wrote:
> 'The width of the immediate is a detail of the format'  means:
> 
> &fmt_rdrjimm         rd  rj imm
> 
> @fmt_rdrjimm         .... ...... imm:12  rj:5 rd:5     &fmt_rdrjimm
> @fmt_rdrjimm14         .... .... imm:14  rj:5 rd:5     &fmt_rdrjimm
> @fmt_rdrjimm16           .... .. imm:16  rj:5 rd:5     &fmt_rdrjimm
> 
> and we print in the disassembly, liks this
> 
> output_rdrjimm(DisasContext *ctx, arg_fmt_rdrjimm * a,  const char *mnemonic)
> {
>      output(ctx, mnemonic, "%s, %s, 0x%x", regnames[a->rd], regnames[a->rj], a->imm);
> }
> 
> is that right?

Yes.

I'll note that regnames[] is defined in target/loongarch/cpu.c, which is not available 
when we want to use this disassembler for tcg/loongarch64/.  I think it would be easier to 
print this as

     "r%d", a->rd

so that you do not need to rely on the external strings.

I also think you should print signed numbers, "%d", because 0xfffffff8 (truncated to 32 
bits) is not really the correct representation of -8 for a 64-bit operand.


> 1. We print sa in disassembly...
> 2. We use sa on gen_alsl_* not (sa2+1).
> 3. bytepick_w use the same print functions.
> Is my understanding right?

Yes, that is the issue I am describing.


r~

