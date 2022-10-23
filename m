Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 933C3609ABC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:49:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omnKO-00066p-7E; Sun, 23 Oct 2022 22:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omi6x-0006SE-Ro
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 17:02:31 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omi6v-0002kj-6Y
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 17:02:23 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so5520495wmb.0
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 14:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KCPZ/jZzakaBN34zZCSaeMP1/DLcIe6ezeazQPw3pFg=;
 b=GICa3lHZnpHHL8tnCHeBfffl8gmF7bW4Z7Y8NJOVuAS5WvuXA70uyv1pIyic9uVmzD
 VEJUeo2Mam4eJQG4KxOuUuxA8c54+yzYsYUEinMwjuIu1c1Bc7iadr13TuUJeyzHYVkI
 vpFNmbyQgV06aclmzUB6Lnd877xAoO/XuNyV+SkfqA39+MszptQr1+GTN8OOORU2wmYp
 /cUB+5/Ny2uiDuNGRhQ8T0oKMAtYqNhBD3WyWhLegIzURPTHaAWHIGOVcmtGlCYjgz8g
 l6/5rQ/u57WMGbHcZZwID+f5/lEbS6dkg30wzF2vq7M2wDec3Z4S/r4nONvWCQ8oquoc
 bNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KCPZ/jZzakaBN34zZCSaeMP1/DLcIe6ezeazQPw3pFg=;
 b=2ndqlVneEfqbFbSCopKhu+N7yOKyOlOCgiF87tuoklJM6Jm4uuVZYEHFNybukQh2VT
 0E5svrRIXPU4Sz6a4UAR8v11LVc6J/rTLItvb+zd/7zJWipds/Y8sZFs6hcXgJwRX33C
 TrFl0LwZYi2xFZJLQmNWQdmn0iM1TL8M2932wkKxpWt8rEJlZyXqZHAQ60tm613Aj3mo
 kxJOXQHLw9exfTzcLCsV2BCikuvhBub+I9BcT20uma6y2opsxcAgm8x92HQ5OvHwTIDG
 yW94NGpSBLzznTbZsnho1KDW5unFPjMKJZwC+JraUOFirVdl2OART7s/VN+5vbTPKJgr
 LtFg==
X-Gm-Message-State: ACrzQf0OlnYwNGO7OEppQ57D6gkf+UjpKHGYsfJ+v+viInGLv7xl9c72
 HxFstgRE8rh/qnEbWS6BH7zwdA==
X-Google-Smtp-Source: AMsMyM6Hze2hagtgz3v502pIu8UwUlBTIGntGKUinPQOVCwY/98/Z7nJBhydEefQF5aDY0E+ONul7w==
X-Received: by 2002:a05:600c:4ed0:b0:3cd:3422:62d8 with SMTP id
 g16-20020a05600c4ed000b003cd342262d8mr3744393wmq.154.1666558939934; 
 Sun, 23 Oct 2022 14:02:19 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a5d49c2000000b0023657e1b980sm6471645wrs.53.2022.10.23.14.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Oct 2022 14:02:19 -0700 (PDT)
Message-ID: <bee67948-bbdf-d9a9-854a-ebc62f170589@linaro.org>
Date: Sun, 23 Oct 2022 23:02:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v2] target/i386: Fix caculation of LOCK NEG eflags
Content-Language: en-US
To: Qi Hu <huqi@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-devel@nongnu.org, Jinyang Shen <shenjinyang@loongson.cn>,
 Xuehai Chen <chenxuehai@loongson.cn>
References: <20221022061216.423098-1-huqi@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221022061216.423098-1-huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Typo "calculation" in subject.

On 22/10/22 08:12, Qi Hu wrote:
> In sequence:
> ---
> lock negl -0x14(%rbp)
> pushf
> pop    %rax
> ---
> 
> %rax will obtain the wrong value becasue the "lock neg" caculates the
> wrong eflags. The "s->T0" is updated by the wrong value.
> 
> You can use this to do some test:
> ---
> #include <assert.h>
> 
> int main()
> {
>    __volatile__ unsigned test = 0x2363a;
>    __volatile__ char cond = 0;
>    asm(
>        "lock negl %0 \n\t"
>        "sets %1"
>        : "=m"(test), "=r"(cond)
>        :
>        :);
>    assert(cond & 1);
>    return 0;
> }
> ---
> 
> Reported-by: Jinyang Shen <shenjinyang@loongson.cn>
> Co-Developed-by: Xuehai Chen <chenxuehai@loongson.cn>
> Signed-off-by: Xuehai Chen <chenxuehai@loongson.cn>
> Signed-off-by: Qi Hu <huqi@loongson.cn>
> ---
> V1 -> V2:
> Following Richard's suggestion, just change mov to neg instead of using
> local_tmp.
> ---
>   target/i386/tcg/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


