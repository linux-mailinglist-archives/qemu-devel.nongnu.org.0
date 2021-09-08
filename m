Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBF1404028
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 22:22:44 +0200 (CEST)
Received: from localhost ([::1]:44586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO45k-0006Gx-2W
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 16:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mO44C-00059O-MP; Wed, 08 Sep 2021 16:21:08 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:41578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mO44A-0000vY-NJ; Wed, 08 Sep 2021 16:21:08 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so2472821wmq.0; 
 Wed, 08 Sep 2021 13:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OvU3u7iar1YsozclIJ2YcFEQUVeJZGT+4JiPZZBDbdU=;
 b=ZRh5S5MPQduPg1EhNRTok7ClmIxSjqqOL6UTmEm5YcIP9AEcYIgU2Dqys0GACNY44X
 ZNy3R44BYw6GpQBHAefH7OOheb/30F8ijsyMLh02F2OWe2TzMotzDxB8kv0FTu9MAdg3
 PBh0mXO8C0Mh/8cmyb9op5LBEebGKJIgiBSp+dEUl8h1vtJPlupwbsJRWkOaMRPhOWcM
 Y9bJUpNNzYmj/QAaeEuoBrupEttJ5dXZgGi0+hqsoh7rRXsqgbGbVXYS+U/8kaQRBqwl
 R9RtKg9LBlb/9odL+vEDGk6c5pWf6Z4/BmnF4jjhQJ1PX3oWDNeprmhUx5xejKdrMkDi
 67Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OvU3u7iar1YsozclIJ2YcFEQUVeJZGT+4JiPZZBDbdU=;
 b=iUbkglCTnjkjgcRV5fJ3qH+mKmKYx85dTw8vuQoB+bV/7Uq4hzC25z66b0n0kK2ri5
 2VLRVzsrpDQR+41IJcVGW3XHtGo85B4jULi9PxMbKMwuER72RxKduZk2lK6gFn45n23C
 bud3DJc7oOb6BXYHt5MBKp19IeUaKs0J0kltlXQsXhTVMW8XQ7tLZieVGL0/S/YCyVRy
 S9XU8LzWzGumtWXM27Rmxb2rTrVcE7xmavrWrgrivMjwzscvlpWHCKCnyPGIbmrROniY
 lkx93VKv3gMBCj7xwVwjbM+/ev3UN81g2IC3ucXV8xkxR+EtuvXvGM5d5kHJosi2v6lf
 hQBA==
X-Gm-Message-State: AOAM531wJ9gnwXMcZ+jMZtG1mur0adU8MvQSUihdIwPFJDl/aASg9bVJ
 qIiPzru0ByatckcWrXpM1Ok=
X-Google-Smtp-Source: ABdhPJxWIrzkJhcLtPyu6J06FqHSXLH37LY9Pvvtel4XyByLW0yCrJ4hEBwiAPeRGNQZqZCHht+UlA==
X-Received: by 2002:a1c:3584:: with SMTP id c126mr43406wma.121.1631132464246; 
 Wed, 08 Sep 2021 13:21:04 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id j18sm137462wrd.56.2021.09.08.13.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 13:21:03 -0700 (PDT)
Subject: Re: [PATCH] tcg/arm: Fix tcg_out_vec_op function signature
To: "Jose R. Ziviani" <jziviani@suse.de>, qemu-devel@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>
References: <20210908185338.7927-1-jziviani@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <71839203-0d36-1cac-9693-3b195c159b80@amsat.org>
Date: Wed, 8 Sep 2021 22:21:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908185338.7927-1-jziviani@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.922,
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 8:53 PM, Jose R. Ziviani wrote:
> Commit 5e8892db93 fixed several function signatures but tcg_out_vec_op
> for arm is missing. It causes a build error on armv6 and armv7:
> 
> tcg-target.c.inc:2718:42: error: argument 5 of type 'const TCGArg *'
> {aka 'const unsigned int *'} declared as a pointer [-Werror=array-parameter=]
>    const TCGArg *args, const int *const_args)
>   ~~~~~~~~~~~~~~^~~~
> ../tcg/tcg.c:120:41: note: previously declared as an array 'const TCGArg[16]'
> {aka 'const unsigned int[16]'}
>    const TCGArg args[TCG_MAX_OP_ARGS],
>   ~~~~~~~~~~~~~~^~~~
> 
> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
> ---
>  tcg/arm/tcg-target.c.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index 007ceee68e..e5b4f86841 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -2715,7 +2715,8 @@ static const ARMInsn vec_cmp0_insn[16] = {
>  
>  static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>                             unsigned vecl, unsigned vece,
> -                           const TCGArg *args, const int *const_args)
> +                           const TCGArg args[TCG_MAX_OP_ARGS],
> +                           const int const_args[TCG_MAX_OP_ARGS])
>  {
>      TCGType type = vecl + TCG_TYPE_V64;
>      unsigned q = vecl;
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

