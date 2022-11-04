Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8488061A4C7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 23:48:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or5T7-00085F-Ek; Fri, 04 Nov 2022 18:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or5T2-00081j-Dl
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 18:47:16 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or5Sw-000383-O6
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 18:47:16 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-13d9a3bb27aso6278004fac.11
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 15:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o2H2xxZRJ1BeiOdqgTEIWcLoa0amfUHM94N1h6Bj//M=;
 b=yNtz5bCsPZHLs7QDBe+bh8Rw3P/Yd/uypMIfgfCdlWxSWferZS+vnuNRaPcURisbga
 zUdUFWGdN/HJ5M3lmttA1HOWEKBo5D8PRgQR6A/Rwv+Ne5nOIPLeWj7JCUxkptAA2JSf
 0z2yJYDBdR1sK9iz7ZAKAJuXBUqMU5zepmdvWXQqGgNxDuu6w0xUB7guXREmn0QqF3WZ
 /ivlA8lz9ZO6tlfvRFoFqo67Ye1Q2J8aNdHXnl8NbJd+q49+E68Zc8w8C403XGJDBsWF
 2/3By/kVrtwAUSNoPxS+Pv5zz9QqUGxEoRVvHhPMc2iAGY9G3KBeUxatwQ8Y1uRT+OA9
 PG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o2H2xxZRJ1BeiOdqgTEIWcLoa0amfUHM94N1h6Bj//M=;
 b=NyS1uoG4geLS9WF34FY78x1VV+KKxXJKTpsQVwzQJ9F73f5QL2mP+OKuES7Vw7Qgk3
 COcJbcabdW4IRlKt6bfLYVyr07Rd6WnwLXfi5MaJFazWwuESKGTSKr2zlNO3h8qJNx+j
 UIsP7zkcbIwbDCugi+uXoYZEEC26V+bSy6YwQb2bXDrU1lkBoTgXtueGiGdHTK1wgVp7
 xP3ZdagYR5RZVZ9wC7gSaGbIgqHnEXCXW7rMU9jm2u7Ig7bLZGBkcdYvJMyCBrqY1PJ0
 fPLW1oipaL++vgH1QWHtjIhlvfpRA7UB41lhSjAJ+tV6q4h+XKq/SWM6DO0WKL7sGB40
 EPIQ==
X-Gm-Message-State: ACrzQf27Delv7e7tNq08WRWOt0SVw5oOTSvQ3kLiK1PoIkquKz0MAilV
 ODmbua3J7N+1M4t2mx0mTEqoYw==
X-Google-Smtp-Source: AMsMyM7th0/dSC3P9kxDmcNtHSDvz2bb6nJZS5g6w8M4mEkVST+8mK6dv33TAD+KtJYtshYcFeMQzw==
X-Received: by 2002:a05:6870:56a9:b0:13b:d2ae:ed90 with SMTP id
 p41-20020a05687056a900b0013bd2aeed90mr33153795oao.198.1667602015422; 
 Fri, 04 Nov 2022 15:46:55 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 x34-20020a056870b42200b0013d7fffbc3csm112731oap.58.2022.11.04.15.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 15:46:54 -0700 (PDT)
Message-ID: <cc4a1846-f00a-60ed-797f-5c6d68329561@linaro.org>
Date: Sat, 5 Nov 2022 09:46:42 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 01/11] Hexagon (target/hexagon) Add pkt and insn to
 DisasContext
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20221104192631.29434-1-tsimpson@quicinc.com>
 <20221104192631.29434-2-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221104192631.29434-2-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
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

On 11/5/22 06:26, Taylor Simpson wrote:
> This enables us to reduce the number of parameters to many functions
> In particular, the generated functions previously took all 3 as arguments
> 
> Not only does this simplify the code, it improves the translation time
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg_hvx.h    |   6 +-
>   target/hexagon/insn.h           |   7 +-
>   target/hexagon/macros.h         |  10 +--
>   target/hexagon/mmvec/macros.h   |   4 +-
>   target/hexagon/translate.h      |   9 ++-
>   target/hexagon/genptr.c         |   6 +-
>   target/hexagon/translate.c      | 120 +++++++++++++++++---------------
>   target/hexagon/gen_tcg_funcs.py |  15 ++--
>   8 files changed, 89 insertions(+), 88 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

