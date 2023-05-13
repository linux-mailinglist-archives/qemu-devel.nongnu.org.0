Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E63701687
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 13:57:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxnsM-0008Ix-Pu; Sat, 13 May 2023 07:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnsL-0008Ip-Cf
 for qemu-devel@nongnu.org; Sat, 13 May 2023 07:57:25 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnsJ-0001cV-Mw
 for qemu-devel@nongnu.org; Sat, 13 May 2023 07:57:25 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-96adcb66f37so95909366b.1
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 04:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683979042; x=1686571042;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SV/a6APIQrFA2Ihoo6jNdZ14T8OlZaWf5ZzS2lMWmz0=;
 b=BkBVRqBQRTHV7sF1o1r/RIede0jxbjUs+OKmqRPI+hqNxufNw01lCl4V1T0BCLyq0u
 mnKX9L6XGxgjTmEtODckvfwlzQfxhsAoCvPWME9flO2h8IbrHBfvNpldW+mjCTZ+Kuj1
 BLp40Zp2Nd3DbbCyu+yHlzFpzg82AfS7i3UO8rrh4ZvQeKiY0bH7cDeDENm0zbX53TS+
 BPeKIXGPqBq9+hFtT9nOBY2UBBo/v+JUlDbLpG/r61zkKIo7wBszLkP0uoTC9IOalP+T
 uDuQRxCFLYD3KRUgSMj/kUAp2KgKNLAKTKFlfVIf0x10n7cCrnGErxgyVdM21l/FdIhE
 gr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683979042; x=1686571042;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SV/a6APIQrFA2Ihoo6jNdZ14T8OlZaWf5ZzS2lMWmz0=;
 b=BxRHVyfyoJOaqhkjncppOwEucWvmhdlpAjqihmikr0Qa3HDssJi99TRIhN3xxMl5zq
 6jW2/zEtTJhZyzSZbD+Lm0HErhBhF06hL6sH/cFMLkvEt+/HlA9Q7RmgwA351Co/zO20
 XP7LGiByyHxjFTqBBHyRqssPd3dihtxOXudSrdJ6FIF+DeSxi3j0YkbY4h+vCnQnXJVv
 P+0HsWlvpJl/K/M/by9hEwtpLfmhSPZnCjldH4JSPjvUdwfO2dtzywswboeMciw0duwG
 fTrQ8nbfTwZLvXhx4AGDmZNupODRDEg0+OqYx/KdSOc1sZKhgj1x0ZLNaPu4fKR6OCbL
 Fmug==
X-Gm-Message-State: AC+VfDyiCB9Q3rIeKzx7I+EBOjRvKD9WBK2NkNSCKzrO7UpOB+fn9Cv/
 iSbkCB6HFPzYb/REzqOP7q4h7w==
X-Google-Smtp-Source: ACHHUZ5Uk31xTNgzMVitoGNJofZ/nEY+BcXyBq8siM9CZAU6npqU80mmajNP4NufIauBoDScwGveyA==
X-Received: by 2002:a17:907:8688:b0:96a:3005:61b7 with SMTP id
 qa8-20020a170907868800b0096a300561b7mr10457966ejc.74.1683979042022; 
 Sat, 13 May 2023 04:57:22 -0700 (PDT)
Received: from [192.168.190.227] ([109.144.17.21])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a1709070b2100b0096a16761ab4sm5263594ejl.144.2023.05.13.04.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 04:57:21 -0700 (PDT)
Message-ID: <38f9b939-69c0-8ce8-28cb-8e5e6b787767@linaro.org>
Date: Sat, 13 May 2023 12:57:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] linux-user: fix incorrect alignment of pretcode
Content-Language: en-US
To: fanwj@mail.ustc.edu.cn, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, peter.maydell@linaro.org
References: <7478fbcd.65885.188109d27f2.Coremail.fanwj@mail.ustc.edu.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7478fbcd.65885.188109d27f2.Coremail.fanwj@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.923,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/12/23 16:38, fanwj@mail.ustc.edu.cn wrote:
> sigframe::pretcode & rt_sigframe::pretcode must align of 16n-sizeof(void*) instead of 16n, Because rsp align of 16n before instruction "call" in caller, After "call", push address of "call" in caller. sp of begin in callee is 16n-sizeof(void*)
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1648
> Signed-off-by: Fan WenJie <fanwj@mail.ustc.edu.cn>
> 
> ---
>   linux-user/i386/signal.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
> index 60fa07d6f9c..1f019689ae7 100644
> --- a/linux-user/i386/signal.c
> +++ b/linux-user/i386/signal.c
> @@ -197,7 +197,8 @@ struct sigframe {
>        * to it ensures that the base of the frame has an appropriate alignment
>        * too.
>        */
> -    struct target_fpstate fpstate QEMU_ALIGNED(8);
> +    abi_ulong unused QEMU_ALIGNED(8);
> +    struct target_fpstate fpstate;
>   };

This is not the correct way to fix this problem.

You need to adjust get_sigframe(), for one, to give you the allocation desired.


r~

