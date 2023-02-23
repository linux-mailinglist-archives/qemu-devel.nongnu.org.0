Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1046A11AC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:09:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIqC-0002pr-KA; Thu, 23 Feb 2023 16:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIqA-0002p9-SF
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:09:22 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIq9-0006JX-C6
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:09:22 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 il18-20020a17090b165200b0023127b2d602so635292pjb.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 13:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qzu0zx2wHo11qYxivzlLHMkFuxrVMWkxNLfTT0X5FtQ=;
 b=rKveNuCTF1IWo6/cHZdqPB98wqdJR2raiREjz+Qcy8WHxeB1/i8rv9+mk0u1S0vtkD
 qI9X90UjVDh5q+OKnmdkN66SkRVdbEvCAygrvmFzlhYZzN7wUDhoWeLn2odDp8gFy4I0
 RQmHbMz1n4NfAP5+aKldmOS9S6w2NhythqSjtnGiVQfBN2qeykUafUX5j8QsrzvTXa7Q
 VzaoLZNI0zGNNTBSDoc+O2MVLKfA8SstjYqk11mJKavxKXF1JD7ta1EbIV3oNl2XjVqK
 aleEX3Db8jEt82wBijXy/BpgcauY4wsygQq4ICCAc19DCG6vs1ejwlmCgSzHKuUU0ZrZ
 PjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qzu0zx2wHo11qYxivzlLHMkFuxrVMWkxNLfTT0X5FtQ=;
 b=Mp3zlrinj+i4vqt/gRsNjXYqrbSwxnilV7L9nXRHU9xEBaG9zLrAo1MJcF1tAq09G/
 FND8nZ1MjX9bx7rdvXCWlkJ9ARnYDE61ydHeSSaC0vKRMIG11O3dEkC9ly+H49ocboU1
 LpjoA0bmH8i54QbnH/Cv9Fjzu9O4FDebfbs+MaR1pU/94mSBI52/0GeKLGHagCamvE7/
 crajDIMmEPTsbXTH0ysMI9q8v0A9gvKzrrHmUmqkUofFFktSfpbJrmgf2jqi/1mS7MIp
 RfKwDgAIfhyvKTLECYTlgdpO4T3UxfjNKv4uINpRVUvpIjFu7sSnUrr1WdBANzx1VQpF
 LVtw==
X-Gm-Message-State: AO0yUKWp8t+YcG3D/fjGC3O04WnJVL8X8i9QGu1Poj/YDMtG3mlvCTCf
 84IlXGUQd1ezOOdHvHWbbxbj4g==
X-Google-Smtp-Source: AK7set8ep4qWsP94fCck6rbic0WhB9uPfNg/fnrBzTVMgwig1u/1UFUyhhbl3LvOWhD0cYJsd/Lj2g==
X-Received: by 2002:a17:902:d481:b0:19a:b427:230a with SMTP id
 c1-20020a170902d48100b0019ab427230amr15809053plg.63.1677186559639; 
 Thu, 23 Feb 2023 13:09:19 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b00198ef93d556sm120412plb.147.2023.02.23.13.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 13:09:19 -0800 (PST)
Message-ID: <9c049a8f-9178-c04b-58df-445029b67a18@linaro.org>
Date: Thu, 23 Feb 2023 11:09:15 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] exec/helper-head: Include missing "fpu/softfloat-types.h"
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <20221216225202.25664-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216225202.25664-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/16/22 12:52, Philippe Mathieu-Daudé wrote:
> 'dh_ctype_f32' is defined as 'float32', itself declared
> in "fpu/softfloat-types.h". Include this header to avoid
> when refactoring other headers:
> 
>    In file included from include/exec/helper-proto.h:7,
>                     from include/tcg/tcg-op.h:29,
>                     from ../../tcg/tcg-op-vec.c:22:
>    include/exec/helper-head.h:44:22: error: unknown type name ‘float32’; did you mean ‘_Float32’?
>       44 | #define dh_ctype_f32 float32
>          |                      ^~~~~~~
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Queued to tcg-next.


r~

> ---
>   include/exec/helper-head.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
> index 584b120312..325a42b14e 100644
> --- a/include/exec/helper-head.h
> +++ b/include/exec/helper-head.h
> @@ -18,6 +18,8 @@
>   #ifndef EXEC_HELPER_HEAD_H
>   #define EXEC_HELPER_HEAD_H
>   
> +#include "fpu/softfloat-types.h"
> +
>   #define HELPER(name) glue(helper_, name)
>   
>   /* Some types that make sense in C, but not for TCG.  */


