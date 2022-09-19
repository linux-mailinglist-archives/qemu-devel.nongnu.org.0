Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D406B5BC4F7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 11:06:34 +0200 (CEST)
Received: from localhost ([::1]:54884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaCjY-0002TP-08
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 05:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oaBvy-00047N-Kb
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 04:15:19 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:33586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oaBvq-0000CP-Mv
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 04:15:17 -0400
Received: by mail-oi1-x22c.google.com with SMTP id j188so11364934oih.0
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 01:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Ww4Wev8T1tN5yo/ZSUxBB3yUm8MTEssSJImHvmQatlY=;
 b=Aylp9qkOMrn7FxhdZnDfF666s23Zb/oj8m5OksiDu16wyNe/JDjTskQr6XeoNvEqF/
 1R3mWgBXG3iQWbyuVuV4DwpGpXkfT11sJeo1Ws+Q+AGreyVqSC5Dc06Al1r+Gw0KvlWO
 TAID4tiicV4lRNmjIgHZkM/68L1xWkjPOiSYtKHXaZZQi9mRiMq5qLS0F1YYjego0+Kw
 8snQobw+IKMLGeHCGuYLrZSZXALna2P+3w+BWf9TD9GeOm46s7QLEG46Dz5HWft16b4q
 iKpks2bVyut9b0oKgqST9v9tjFuGilUI/Zu5aXFjCveAQ1SxuY2ZtHWFD2KzmLhfKW/l
 Q9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Ww4Wev8T1tN5yo/ZSUxBB3yUm8MTEssSJImHvmQatlY=;
 b=eiIDcnQYkpwsgpcVTGFtHvodtl42//stiBxb/KCkUfBV9NEKPeUEs1UCHO9wKhnQ2K
 Z1u/50ztnUP1sucqXp0rHh6CBHsLHYVeR0HcGR9+tD0+ObtW8qWnSCuVps5CEQTu/aSx
 9eVrFQOWij2IbZkm5GBd9vYSDihXAdxkljSdaYcqYIHy9BSwpQtTW+U2V3uUg+UL7Hn5
 MHNF7nghMf78xbccPzgKvyMc9AFq/88sVVq2oC5D7RCyELMil+/1Pa79hlKA1vAmMAk7
 M3NzrRhEUPdBbkw5XR/rpYszUkRew2S+3d+6ltsREEoo1oWkKrkdUlXHWP2hDfW7JsyW
 IJkg==
X-Gm-Message-State: ACgBeo0SGzEHSQluponAoxTdmepNENBnVNcznUBn9XzwAXaLKB9Nf9u/
 kgOsmD8zLW/AQY8oTr2Fb1kRmQ==
X-Google-Smtp-Source: AA6agR6f0AJPADRK6ZnA8JkPKT/4ZxJqJir5Z7lKR1z1M+4YNFOqtBVJNP9yS6tBVVWqjm58aDx4XA==
X-Received: by 2002:a05:6808:124c:b0:342:9c9e:c935 with SMTP id
 o12-20020a056808124c00b003429c9ec935mr12001684oiv.70.1663575307420; 
 Mon, 19 Sep 2022 01:15:07 -0700 (PDT)
Received: from [192.168.199.227] ([172.58.107.41])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a9d66d0000000b0061c9ab1032dsm13668069otm.18.2022.09.19.01.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 01:15:06 -0700 (PDT)
Message-ID: <e962d009-d46a-5f6e-9377-4d34ccd8d539@linaro.org>
Date: Mon, 19 Sep 2022 10:15:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] target/m68k: use M68K_FEATURE_MOVEFROMSR_PRIV feature
 for move_from_sr privilege check
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 lucienmp.qemu@gmail.com, qemu-devel@nongnu.org
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
 <20220917112515.83905-4-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220917112515.83905-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-3.657, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/22 13:25, Mark Cave-Ayland wrote:
> Now that M68K_FEATURE_M68000 has been renamed to M68K_FEATURE_M68K it is easier
> to see that the privilege exception check is wrong: it is currently only generated
> for ColdFire CPUs when in fact it should also be generated for Motorola CPUs from
> the 68010 onwards.
> 
> Introduce a new M68K_FEATURE_MOVEFROMSR_PRIV feature which is set for all non-
> Motorola CPUs, and for all Motorola CPUs from the 68010 onwards and use it to
> determine whether a privilege exception should be generated for the MOVE-from-SR
> instruction.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> ---
>   target/m68k/cpu.c       | 5 +++++
>   target/m68k/cpu.h       | 2 ++
>   target/m68k/translate.c | 2 +-
>   3 files changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

