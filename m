Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83AA3E4D10
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 21:27:01 +0200 (CEST)
Received: from localhost ([::1]:37516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDAvN-0006oP-0X
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 15:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDAuO-00063X-64
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 15:26:00 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDAuM-0005C4-Qa
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 15:25:59 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so489876pjn.4
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 12:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ooO3obQdJ8yLzSO6lLf23ir/Dr6Ff+oZNwPb63A5HLc=;
 b=c+P1XPB706M+S3wZ3a041GqrTrZPX7DvHLt6+QBt1j5orNmBjuBEagAfMtkHgsb+p3
 zi0J0bhZMoJpO4eqlWAk4EYP+o0Kv7sakDNrOIBHAx8UnI4sBiRB3RQv3zHVBS5TpoA2
 ZulsZrqnPFNmDPplxMAAxAAoFbfbnyO2THdd/64OQ/oT3NfHZcFXkgjuKH54xu8FhyY7
 kL6vtBnWu+y27iPA0Z/B+b5AQ2C9ZM4Pk6rn4YHBzF0L1sMOUosHIASIoVEOB9JKckQk
 ezlq8TBd78DqmQveIiE+gGPwFzwg+OO2diVMgKQZrrikntwAeiOk7QaWBG49QyszyBMK
 hQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ooO3obQdJ8yLzSO6lLf23ir/Dr6Ff+oZNwPb63A5HLc=;
 b=k5wb4lE02MSGQCn8CN9ptMdV1fvzwlvjsqHXLG/HiEKWqBOdM0FwmSdsKB8ZGxd0rN
 y5pzdT5RH0ACk4TphNSkKA4ll+7p49BBBjr3dhu84+cftUEG4E9aiykGIrLJxKENsjIH
 Ryz2XUjgISAlQToR2PSD0jsLt0syjUuu+ZAaWssDsMQ0n3tUS03Xg1cSTm8myShGA5aZ
 UhwV0FM8uwOeFCYPnsJ2QBtgd2zPcxwWF4O+yLMGpEvSgjC5P4OHPm8YmiO/KC9xfIzh
 uJkiaJybZMSH3N+1/RZs5O4g76/IwvPcNYZbVJONqPsZCjCAjDc0a0weyUtP6oDkOi0f
 0O0g==
X-Gm-Message-State: AOAM5304/yN0DQ3F16YIbtjS7wUrf5Di0YM+XsEMFZaspOWde8khSjkY
 L2qtXiJmq3XVH5uYeG57ccGERA==
X-Google-Smtp-Source: ABdhPJwZ02ba5Sdu66L1TVXABDgV6kuqXGXoJDoba2y61uGe5CaCGrApZXY9AALvbixRSnK3K1a2LA==
X-Received: by 2002:a17:90a:19db:: with SMTP id
 27mr26145254pjj.25.1628537157075; 
 Mon, 09 Aug 2021 12:25:57 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id fv2sm117428pjb.53.2021.08.09.12.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 12:25:56 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 2/2] target/mips/mxu: Use tcg_constant_i32()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210808160843.84957-1-f4bug@amsat.org>
 <20210808160843.84957-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d44606d7-03d4-d391-4bcb-5fca50e844a4@linaro.org>
Date: Mon, 9 Aug 2021 09:25:53 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210808160843.84957-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/8/21 6:08 AM, Philippe Mathieu-Daudé wrote:
> Replace uses of tcg_const_i32() with the allocate and free close together.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/mxu_translate.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

In my opinion these functions should be simplified by dropping all of the special casing 
for the zero register and simply let the tcg optimizer do its thing.

But failing that, this is fine.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

