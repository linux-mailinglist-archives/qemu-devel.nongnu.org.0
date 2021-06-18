Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CB83AD060
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 18:27:26 +0200 (CEST)
Received: from localhost ([::1]:44378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luHL3-0007ph-Ib
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 12:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luHJa-0006C3-LH
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:25:54 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:45651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luHJY-0003hH-WD
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:25:54 -0400
Received: by mail-pg1-x534.google.com with SMTP id q15so8167972pgg.12
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 09:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ibXeOQEkwijqn1VkyUt19cBgm7EwKCI1LaKaTip8Xl8=;
 b=ss1mtOkhd/qvwVmLYd9zFItXPHXsM9G/ZfQdYRoqpgLLbszBx9JvMkOVUUn0ocioPS
 Fov5qopJy3sEy2+vVgtP1/TwUNl94C9dNusBf8VxN4HFgXztlDvjeLubvgHEurSaeRR+
 P4tG/EDK1lVgqZlFGf2cqRwBbhNELfIOnxJ9yjN4fI0/hh4yFx05FY/XfuFJAr6Y+Kcd
 9IVlhsU/p7BoCmB5yv68yTia4pk8PlYVinPeQPSdT06EPuK1dK03sBWojxjyhDwey9/N
 84tqFD7Zp2vqJhZIgHhzMPkEc8/iNkBFpopxnPnjXybrL27azf1SLeR18erFA3HO45fO
 h1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ibXeOQEkwijqn1VkyUt19cBgm7EwKCI1LaKaTip8Xl8=;
 b=LcBgHjwOLeqJ9iw0HX3wo3WdtzytA7ic6oO7oZgiE7do/GwYSjXQ3/4XxA327wxqiL
 LNtojj4RSxNsQOuxJvIi7Xmei/JVhDdlyUrcjssvkQt5HvR170bi4BGHMyFWXSqi12Z5
 jj9YtSdkc9sy+pTb7snYgCwFSNb9yH6Ed/KK932v7KN/scM+wK2I9SoYCfCnzH/0Z9cy
 2VigVqIPfYFQhuG1UxT7D76CRbjnPXGf1ekI4a0cWg3wnscl4xeDvfF7eeDsXXrJlhZq
 9si4ch2/TbdVewUcUgV6mHYbEdYzmR5AzZjtJIZyqeO+puDMzZ7q4Kl+DtWsp4hS1M7d
 W/tw==
X-Gm-Message-State: AOAM531EKOv/OWTsm7nImCEq8UoDt5tocoQqWMBduNZO96ifGCxWQR2t
 cbyferqOBl9Mqq/JPr59XkkP7AK8N5OejQ==
X-Google-Smtp-Source: ABdhPJzHpqf5ZSq2Y7oLRLTN2jXgeGeQQkXqClwE/TFqMTv9HEJ1tBNITqM++zdwKIx1MCoifHsaPA==
X-Received: by 2002:a63:1b62:: with SMTP id b34mr10616900pgm.417.1624033551415; 
 Fri, 18 Jun 2021 09:25:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k25sm8206594pfa.213.2021.06.18.09.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 09:25:51 -0700 (PDT)
Subject: Re: [PATCH 7/7] target/arm: Handle FPU check for FPCXT_NS insns via
 vfp_access_check_m()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210618141019.10671-1-peter.maydell@linaro.org>
 <20210618141019.10671-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3ead921-b138-402b-20d8-4559162135cd@linaro.org>
Date: Fri, 18 Jun 2021 09:25:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210618141019.10671-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/18/21 7:10 AM, Peter Maydell wrote:
> Instead of open-coding the "take NOCP exception if FPU disabled,
> otherwise call gen_preserve_fp_state()" code in the accessors for
> FPCXT_NS, add an argument to vfp_access_check_m() which tells it to
> skip the gen_update_fp_context() call, so we can use it for the
> FPCXT_NS case.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a32.h    |  2 +-
>   target/arm/translate-m-nocp.c | 10 ++--------
>   target/arm/translate-vfp.c    | 13 ++++++++-----
>   3 files changed, 11 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

