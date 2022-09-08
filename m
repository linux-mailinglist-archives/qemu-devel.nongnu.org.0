Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30E15B1605
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 09:54:27 +0200 (CEST)
Received: from localhost ([::1]:47698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWCMk-0006Hq-VN
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 03:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWCKv-0004gL-RW
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 03:52:33 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:44890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWCKu-00044V-AH
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 03:52:33 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso1129602wmr.3
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 00:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=MtxCyoeHedE9uu5Tp8r7ZSZ+BCCQNPBytvAyaRg6NaA=;
 b=JnL6bOGCZFfAWLs7kD3FYqhO3Guinb0aYWN1dQes/GIKsD7G0Bo/GQlDt9zxSqpot7
 lMSLkgwiOxlxPxo0LlnYTFHRfyIgcGLlDR3d1orZZ5PlupA5fzRmLyYP8LzsdV4bq/ph
 dk0uDcK1vtvwiRpqDIB/7DSXeWEMt2OCIQv2+hPDQhXvO4IHRzGgBZUIKPC2oJ/WT+tc
 fIVxot0p1WAHB3xpslVA/RT1lr9BYFMp/nQjyF4dm/7BEqJ9Bc+z8fkz7CKt9x6XgfqZ
 IjrEGJfPjbCdC+880BTmQWxMxSFTHGe96f6OFwkxmUGnA6sYB0S7p442ksSvUP4lfqaa
 sB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=MtxCyoeHedE9uu5Tp8r7ZSZ+BCCQNPBytvAyaRg6NaA=;
 b=bL+aFaubGo2656eeq8r/u0ywlx5Iee6/FeR3b+MCNuw+A6MCkKkg4APiLFTt9l084u
 AznWT2WRFs5RWDcs0Ro7GRAtNwa4n9z0zBHfHEtAl9zTA0Y5TdINXJeDhg6puoScZRYx
 062I35hpBwnQ4R1Vzso4d3rJLeLIi/32/MsOfZS4wWI60nCoXnqDBLYSJagbWwr7J8PQ
 7ZvihpoYEgJVfSlPWoz9rlt1YqgA9dNsGcGJMVTgURgxy5tggWecytm7STXsGlQ1+Muq
 /mHCr+kdGGHtqjERaO1BMW3Wbo8NhmIR9sFfxTvraPJXnEAwVflgQVC9t+MD2adKDf5p
 /uKA==
X-Gm-Message-State: ACgBeo3AafyjmgvplIrXyxv6Jk0JN3iE+/idrKSXZWqqWok/r3z0KD7i
 OEePKt5gACyivFCQhpSK+/Po/w==
X-Google-Smtp-Source: AA6agR6OeJiCQPQ1rJpwI/668EAuwuPZ/rp9dc+P4M2XiMhTrwT7VppdSeXK6Lu6Q1HI956B1iVNkQ==
X-Received: by 2002:a05:600c:3c96:b0:3a6:59b1:5eb5 with SMTP id
 bg22-20020a05600c3c9600b003a659b15eb5mr1322627wmb.187.1662623550472; 
 Thu, 08 Sep 2022 00:52:30 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.97.14])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a05600c068400b003a5ad7f6de2sm1698090wmn.15.2022.09.08.00.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 00:52:29 -0700 (PDT)
Message-ID: <3d93ddb2-2101-b89b-3ba5-fc1d78febbb9@linaro.org>
Date: Thu, 8 Sep 2022 08:52:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] target/ppc: Merge fsqrt and fsqrts helpers
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, matheus.ferst@eldorado.org.br, lucas.araujo@eldorado.org.br,
 leandro.lupori@eldorado.org.br, lucas.coutinho@eldorado.org.br
References: <20220905123746.54659-1-victor.colombo@eldorado.org.br>
 <20220905123746.54659-4-victor.colombo@eldorado.org.br>
 <f2fac00a-cacb-25b3-f6ae-9f35a82ab440@linaro.org>
 <e3153a0e-4451-3b21-7821-6877d78868e8@eldorado.org.br>
 <6dbd2eb5-efd6-073a-a106-4afbb8abcfc2@linaro.org>
 <20affe6c-fc70-78fe-ae3c-da5b66518320@eldorado.org.br>
 <6af72233-3e87-c35d-b581-3777d5992d9a@linaro.org>
 <f2234ecf-fac5-9a18-f6d5-d3170967cb9a@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f2234ecf-fac5-9a18-f6d5-d3170967cb9a@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 9/6/22 15:22, Víctor Colombo wrote:
> On 05/09/2022 14:20, Richard Henderson wrote:
>> Well, there would of course be no separate call, but 
> 
> I didn't understand what you meant here with 'no separate call'...

We generate a separate call from tcg to helper_reset_fpstatus sometimes.

> Right, makes sense. And what about when an invalid operation occurs,
> with the corresponding exception enabled bit set?
> float_invalid_op_* would stop the execution and do_float_check_status
> would not be called, right? So it would require to call
> set_float_exception_flags there too, correct?

Correct.


r~

