Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7546EBEA4
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 12:41:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqX99-0000Js-Tn; Sun, 23 Apr 2023 06:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqX98-0000JO-3c
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:40:42 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqX96-0007rQ-47
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:40:41 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f1cfed93e2so4422505e9.3
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 03:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682246438; x=1684838438;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HrRCudxZEQ+0I9RJgH0nqX4vIvfqTUPN5JYT1sedWYY=;
 b=AyWBfSG1gdJz3389ek2feEaOydB8ZYy3OYNNfxG7tKfTEl4SwGTnGZx9pVWCdiH/Za
 R4msxkfnMp6G9XGemxMqa5keVkk5j2PHqLTH08+D2mLatmQm219JRoD27IsnR/zjesF6
 pwRB5PwzDVa77+1ll6HVopX0uIEJOVJl5RDxEKwxGCNyjWOWcnuwWH1dnkNwR7hfapbH
 1kTOg4MFW9vRaO6oNlTz3XtmwfGOUGOdhZLKHbsavGVX1iWRaESpmnE9+fnw6/OW6rCT
 f3879Pnq2tDJ/g97KFGsPjx5dzeNgnxywsUylrJBxiyZ1udg3inOq1Obv5/y9kozc6uz
 nMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682246438; x=1684838438;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HrRCudxZEQ+0I9RJgH0nqX4vIvfqTUPN5JYT1sedWYY=;
 b=elIjdFUNMtI7FH9dX5i8jq0/IingeVw2tcjkFRLwiIvxUF4S50mY/+ztQCoCzpeQyE
 jF511OQdABnsnduf/a7AdvCM+8jOw7XvMvgJuef2OH9f9zbGttIQMS78WwhFVLOUvJSe
 i6tCX27W+C6a3yr+PhggKYZ5xJGR00ftHwJ9alOP3whOierzkLNBvQj/3PntbQV6y65I
 kEB+22nQ13Oejq6juCapl/gWx/HrYDDIyR1QgV2NvMPtfzvcywJQoaIgMtqGC0XzvaCe
 XTYDZaNtUWb06+vZlqn4u+/3JuIRWEk7uVRL0vgZ4BnEFIqOsbP62IGBxsLXPzg/98Y/
 jwbw==
X-Gm-Message-State: AAQBX9fAuHII0etvpO3mkUBh7uNZy0uOY2jFq0GRLaleEFD1jBKnAIR2
 xkA8096LkrNHeu6FWlYSQh06pqhgu4GiLp+jfNt1Zg==
X-Google-Smtp-Source: AKy350ZB/DKOAtxCtRKxcMUzuin6kDuvlVEJdJeL2/iX3qMsr0YSb7KzYrYe/6NUg/m55jdwG/4VbQ==
X-Received: by 2002:a1c:7c13:0:b0:3f0:7f4f:2aa8 with SMTP id
 x19-20020a1c7c13000000b003f07f4f2aa8mr5643342wmc.9.1682246438331; 
 Sun, 23 Apr 2023 03:40:38 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b003f0aefcc457sm12790280wmo.45.2023.04.23.03.40.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 03:40:38 -0700 (PDT)
Message-ID: <d558a918-1dde-debb-0540-ba81f056c10a@linaro.org>
Date: Sun, 23 Apr 2023 11:40:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: tcg_target_long to pointer conversion?
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
References: <8173c29d-eac4-2d5b-d75f-2b95eb129736@msgid.tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8173c29d-eac4-2d5b-d75f-2b95eb129736@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.047,
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

On 4/23/23 10:55, Michael Tokarev wrote:
> Hi!
> 
> This commit:
> 
> commit 705ed477d54c5bccf51d924c403a52049586c3d7
> Author: Richard Henderson <richard.henderson@linaro.org>
> Date:   Wed Oct 28 23:42:12 2020 -0700
> 
>      tcg/i386: Support split-wx code generation
> 
> contains the following change:
> 
> -    diff = arg - ((uintptr_t)s->code_ptr + 7);
> +    diff = tcg_pcrel_diff(s, (const void *)arg) - 7;
> 
> where arg is of type tcg_target_long.  It looks like this is
> the only place in qemu where this type is used as the pointer.
> 
> Does it make sense?

Hmm.  No, I don't think it does.  We can't truncate arg from uint64_t and have the test 
work properly.

> 
> This warning is produced when building qemu on x32:
> 
>   In file included from tcg/tcg.c:432:
>   tcg/i386/tcg-target.c.inc: In function ‘tcg_out_movi_int’:
>   tcg/i386/tcg-target.c.inc:1041:30: warning: cast to pointer from integer of different 
> size [-Wint-to-pointer-cast]
>    1041 |     diff = tcg_pcrel_diff(s, (const void *)arg) - 7;
> 
> yes, x32 itself isn't a supported target, but it has some
> rather unique properties which might catch possible issues.

Maybe

     diff = arg - ((uintptr_t)tcg_splitwx_to_rx(s->code_ptr) + 7);


r~


