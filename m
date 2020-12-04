Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7662CF546
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:07:40 +0100 (CET)
Received: from localhost ([::1]:55990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klHMh-0002RN-9q
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:07:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klEsp-0001Ke-EQ
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:28:45 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:46017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klEsU-0001sU-6M
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:28:26 -0500
Received: by mail-ej1-x641.google.com with SMTP id qw4so9742828ejb.12
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 09:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K+p+qHBTPYAZlOemNmAAlCb4kwszE/8ejMy4SRvtpWE=;
 b=l44vQNc7VNTaHbH8C5fxl9NLbnBkwtSZMVpE8zKLAbR7JyVFHatBdQv/sR0+B+z0zs
 4X6WqyXz6fWg5wEEeXlNTWwpMxekFoLxhE+jxBFpMK2wOfRC690GyTNgyY7hS6a7uv5U
 R5gE9a7wcOtjtoofpMKih75KY/Q2+ouJ/dD9vPkhhxPteO6+gZUDTtY+Ez4zUg5Y0YNu
 Hg0zsGIIU9DFbQrPjZuUNhkD3f5sJr+LLrliyUy3SPmgznez7RQkd4NAiDlwdY7vzOVV
 Qmo08WBdd3l2MTEmz+8eZ/FnHpHfWnO8JbG8N5UMcMp6YiAN8yazICIkyvVG4wGG9D+C
 8rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K+p+qHBTPYAZlOemNmAAlCb4kwszE/8ejMy4SRvtpWE=;
 b=SRkvKu9wqnIOJ++O3KI/Yho7uiAUsQy60pak8+xlUHsCgZ642lgC2y4MhLaW9RsPhs
 EwCLKD4IwtHtcdM+PvmPDGHMN75kVdhB+KiBUGZM757+F+CgYAo41nXskB1j3ppuLJkW
 zMJZ8+QsCVS1iumT29aJ23TX4UwOTI8GiJyFIXGBJfu7FRlSlHeWcIJ/WA+yTq7Em5KR
 LhQuLUhSPwFprDS2h1CbhWzc1ms+bMhpSLvvfzITxVB+nZdZOwMnIj6m0x0BnqpIXH59
 egW0ZQSwxsCS3mNzGPjCWMucQnxTR7ksvDr5BFPgtiPnjwzCxnwhg4kU6GTjaTssvQwd
 uHaw==
X-Gm-Message-State: AOAM530D8FfcrW4oDfeI9Kw7BgJze0aaafWFRdPVV2ZqvFJnUlfDQheg
 ONOYYi97UCdf5WJ5/ttnUnpaXBf8tfM=
X-Google-Smtp-Source: ABdhPJyVKED/HeIAX8B9xtA0zUqWpMNsapCx/0+M9H7ksGyTZRci/PDursmMhxWKAF8pepcCtDQlYg==
X-Received: by 2002:a17:906:d8dc:: with SMTP id
 re28mr8259462ejb.168.1607102613902; 
 Fri, 04 Dec 2020 09:23:33 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id s24sm3442281ejb.20.2020.12.04.09.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 09:23:32 -0800 (PST)
Subject: Re: [PATCH 7/9] target/mips: Extract msa_translate_init() from
 mips_tcg_init()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201202184415.1434484-1-f4bug@amsat.org>
 <20201202184415.1434484-8-f4bug@amsat.org>
 <9a103671-d4e7-bcff-c600-931655efbd2b@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1d04e931-015b-116f-f189-3d24e015b087@amsat.org>
Date: Fri, 4 Dec 2020 18:23:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <9a103671-d4e7-bcff-c600-931655efbd2b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, kvm@vger.kernel.org,
 Huacai Chen <chenhc@lemote.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 5:30 PM, Richard Henderson wrote:
> On 12/2/20 12:44 PM, Philippe Mathieu-Daudé wrote:
>> Extract the logic initialization of the MSA registers from
>> the generic initialization.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  target/mips/translate.c | 35 ++++++++++++++++++++---------------
>>  1 file changed, 20 insertions(+), 15 deletions(-)
> 
> Why?

msa_wr_d[] registers are only used by MSA, so in the next series
that allows me to move the 'static msa_wr_d[]' in msa_translate.c,
without having to declare them global with extern.

> 
>> -        fpu_f64[i] = tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2]);
>> +        fpu_f64[i] = tcg_global_mem_new_i64(cpu_env, off, fregnames[i]);
> 
> Maybe fold this back to the previous patch?

Certainly ;)

> 
> 
> r~
> 

