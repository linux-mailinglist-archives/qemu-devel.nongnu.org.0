Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F29394EBD
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 02:56:01 +0200 (CEST)
Received: from localhost ([::1]:46700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ln9kF-00047a-SX
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 20:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ln9jG-0003Sq-VA
 for qemu-devel@nongnu.org; Sat, 29 May 2021 20:54:58 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:38849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ln9jE-0004kJ-Me
 for qemu-devel@nongnu.org; Sat, 29 May 2021 20:54:58 -0400
Received: by mail-pl1-x629.google.com with SMTP id 69so3424099plc.5
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 17:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z9edqr0+dqpLjAa5fqxIKx6REp8B2DxkfyLWb1l3G9Y=;
 b=hpbL/0zPZep2PA7itwxqF2dNAhLugBZPtTq8gAcQwzgblLL/UYkT33oR1j+NyOic8v
 zgC5S8ammLXvC5GyHG17vz77q96IrX+v/J7QvSSmdwBhVfl3AVsayTNTNZZXKjTtL56w
 s6sxDpUSptg4VUw7T7LCAwaTjM78pAHu/jSVeDpC77+oKWrMtnsq5Tsz0Ze4Lsu5RsZM
 2pLR9NFHVQmVKidyybuLNjFZd1+IRishOUDdSleGFgrC/8VftD6lusOK9EzpJMhvsHju
 TNVBw7vQrGJy5QmMHnVqUgBZHrvugZmlUWXNAJwOcJRCmlVb8MmEbA52NTHcllDMJcxD
 lUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z9edqr0+dqpLjAa5fqxIKx6REp8B2DxkfyLWb1l3G9Y=;
 b=tVoXp3E5Qm7zdrpVeSuXB1EkpEvxofKr6Y6odixaWpEvgP0sofBKP20mCeugJdmwme
 ykBuI1kU2ddn3JyORz7pd2sZxn342VZSj5iafZKRWcwxQYujtqUeFkdsnysjlm0l7NRQ
 604+DKj8UkzftRXGvEwVM4gtpgCQZrghcILI950482UXsqgoI0ZKkloZuTi6/HI4UfVF
 LiiVxm2k1jiSwCH2L8A0OCMFy7AyxRzFSO3iTCUfCGdO8eph1sK2E5LoRa6U7E7Jj8HK
 DKjHIY+JUz0mtkPqMQYmVXKRH4jw0A99A12ErtHdZE5z9+LmV2C0W9DYFGWNmzGPK5qt
 GevA==
X-Gm-Message-State: AOAM531sYPITUnQb/V3/20ptYayCa79bFdSlwuK4wHwNjS77dZExXbOe
 HnOB6QtGaKYLlXx4U1TFM542Pg==
X-Google-Smtp-Source: ABdhPJxpwcUxwyOol3Xx7nkN5LN8RA5HefyXHLvtT4pwilOFepFIfRItVsamOCcgAUvfPU5jxY1Q1g==
X-Received: by 2002:a17:90a:b88d:: with SMTP id
 o13mr12103150pjr.207.1622336095031; 
 Sat, 29 May 2021 17:54:55 -0700 (PDT)
Received: from [192.168.172.34] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178])
 by smtp.gmail.com with ESMTPSA id o10sm7394576pfh.67.2021.05.29.17.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 May 2021 17:54:54 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Raise exception when DINSV opcode used with
 DSP disabled
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210529165443.1114402-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8a297f82-ed18-b974-b7a7-eca8d4a46817@linaro.org>
Date: Sat, 29 May 2021 17:54:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210529165443.1114402-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/29/21 9:54 AM, Philippe Mathieu-Daudé wrote:
> Per the "MIPS® DSP Module for MIPS64 Architecture" manual, rev. 3.02,
> Table 5.3 "SPECIAL3 Encoding of Function Field for DSP Module":
> 
>    If the Module/ASE is not implemented, executing such an instruction
>    must cause a Reserved Instruction Exception.
> 
> The DINSV instruction lists the following exceptions:
> - Reserved Instruction
> - DSP Disabled
> 
> If the MIPS core doesn't support the DSP module, or the DSP is
> disabled, do not handle the '$rt = $0' case as a no-op but raise
> the proper exception instead.
> 
> Cc: Jia Liu<proljc@gmail.com>
> Fixes: 1cb6686cf92 ("target-mips: Add ASE DSP bit/manipulation instructions")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

