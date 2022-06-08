Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741AC5436EE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 17:16:10 +0200 (CEST)
Received: from localhost ([::1]:35742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyxPl-0006sW-DT
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 11:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyxO9-0005LD-Hk
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:14:29 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:41759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyxO7-0000wC-Tp
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 11:14:29 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso18608537pjg.0
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 08:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ulmJke/CoSb0JRVtLzSmSt86OeiEu/WBTKc9SsnPM7Q=;
 b=ENS8+Xsfbwk+pGdFj7k47eZRYbzV/37Cxgl24OlmBb09SlJrmcBfxuOCXG/zldSQ67
 V0gzlTdCGVWG14h0Q/k88Fgy+otzzHSyvePyOZjmxPiu4PL1gPeIFkT4rHj1cwuWT1CF
 lWbT1rLi7y8gNKsnBpVRIVfcbVX398zM7njATpk0fkPr0BK1rEBqFJUaH+zuluzpEMKX
 Jv3P0Z24Gxsvoo2pHWXvIFZMJnkYOF82k1ycgsJpAltZurIFXL3Ag7tyP8r2cmjexRNc
 aww/xAeZo3LGZ6RcFKWbJCpK/bLq8QbzVE9MSC6UFO9dTX2ESFeDvgXs+38d6CHnqg7J
 Fciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ulmJke/CoSb0JRVtLzSmSt86OeiEu/WBTKc9SsnPM7Q=;
 b=YRcwEEoA7pnvN6fIqYH+dOCWGRFhyiEttP69YkOJSV9qRFV8JblwUrwJGdQpGDd61Z
 dFTFcCD93SzCE7QDSTuaBtJwIGa2twdrUgjTb+5tXlgYuQG/4UPQ/0zW2Ks/mjMotWya
 zMPxWTrAvl8FIgw0JLOtXqxaQcp2QiFnUhk/1RgK4kuTGNpxwG5hswEHpIdllxjdjcPt
 FFgTzY7+NEzZyB3VLVan1TWZc333mDKh6yTTdiILRMN8d7y+2ebmgjr6hIcWXQmAmqi9
 ZUlFgYvnS7AfiWZ6QLPQtelCxoFZPKzOjQKub+Hky67KC3uuNimVX/Km2MyEeL6CUJb3
 w7ew==
X-Gm-Message-State: AOAM5314FLTiO7S+fyb/Qs7HCk4195UzAL96Ztv1hhPtU58YrUOdy/TX
 bXZEsjFOOIvqwFG9B6aWnI5Tfg==
X-Google-Smtp-Source: ABdhPJxvs8QdwDi4Tl2oLQeIqpMsCuR2DfM5T3eGaCGlo4Z51Pd762EPBi35GtS3XZS+fQdxbYWIGg==
X-Received: by 2002:a17:902:9303:b0:15f:446e:dccc with SMTP id
 bc3-20020a170902930300b0015f446edcccmr35297401plb.35.1654701265500; 
 Wed, 08 Jun 2022 08:14:25 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:6812:d08e:b22c:43d7?
 ([2602:ae:1547:e101:6812:d08e:b22c:43d7])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a17090a8b8900b001e8520b211bsm8689592pjn.53.2022.06.08.08.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 08:14:24 -0700 (PDT)
Message-ID: <8c3735a8-3de1-d096-26c9-912997d26db0@linaro.org>
Date: Wed, 8 Jun 2022 08:14:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/mips: make SEMIHOSTING conditional on TCG
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20220608104054.323642-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220608104054.323642-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/22 03:40, Alex Bennée wrote:
> Previously SEMIHOSTING was always selected due to requirements in the
> helper files. Since the original fix there has been refactoring in the
> mips code to split TCG and KVM code. The recent semihosting
> refactoring triggers the inverse build problem for KVM only mips
> builds. Instead of selecting it in the common config make it optional
> on TCG being enabled in the target Kconfig.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Richard Henderson<richard.henderson@linaro.org>
> ---
>   configs/devices/mips-softmmu/common.mak | 3 ---
>   target/mips/Kconfig                     | 1 +
>   2 files changed, 1 insertion(+), 3 deletions(-)

Awesome, thanks.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

