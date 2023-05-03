Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B6F6F5589
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:02:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9J2-0001em-4u; Wed, 03 May 2023 06:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9Ix-0001di-RZ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:01:48 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9Iw-0005ym-83
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:01:47 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f315712406so17111055e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683108104; x=1685700104;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NzKgsbLuZQiMlOx8mPCVWkD93l5Zfc511giepGKKsTM=;
 b=XEWqc4ALPHALQUgshNmBY5A0MYmNcmewb/k3JGrCyboAaUmcNeqP/xDEKvdZHBt9Ly
 H+PjNs2qCN5/+pJ5EULCkyZ/3g9/zLOgZzG902zOZKLYln7E4ZK9GUCvPoGDNLBWSPJN
 iLmzQbAu2jmpSLkboZLQbLo5eqF3wlBr6v+crmOBQ6iZc0UQ6BKeRCnallPFGLCStVZg
 NT7Z6drpGaqM6nedPa64Xprlyow4hnswGmqiNPiJ6r2174xC08qbCbOr3nHd9rPFzauh
 KRqoiTo42KzTWD/WSWn5d5MgHPwlbeELkcR+YV1+SeqQb4ULPJc0x/+9NHOYGwbr1ccA
 G2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683108104; x=1685700104;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NzKgsbLuZQiMlOx8mPCVWkD93l5Zfc511giepGKKsTM=;
 b=gVZzgi++y68LGGaB9NrNmizrFWImR41WQMvPacqNWcX4UzAs/gOFF8w8079DiVMwNE
 G9YqWxnrQdhCRIl2ZmFeK/YC6JaQg6DsFKGa8uQygQJXC6NPvg+IABRoe0gw23eNZWq6
 37sozRdTD3tA5GiEaqezaExeV4pZdTJDBKHEC517ovlKk74bMnGeuuzZTdmmEPQYPypr
 LQ4uCfvuItd1tSDIxWCiIj1tqiKoVJOsYjfiJZVU0XR77yeMWwZLgg/KCTHm2JS1iUNL
 0LZqstShLYEVeKJynrUiIQtnZ55+TFPs1Ms1/rG3N0iAnGTrQHnKCGlQ5hcXVkZh5Jgx
 1fkQ==
X-Gm-Message-State: AC+VfDzf3j20jFS2BKK2L6Dc7RGbKpxEvgP/6rNM94Z+S+yqboUIW/nz
 RE/sMh/cgnEAFuvYr2fbYq2r1Ur4gTloZkBza4CDQw==
X-Google-Smtp-Source: ACHHUZ7Y40L9N1u6ZWDWiCzGWpjwFE7fDcOflCvh3U8tJNSHPoPdztzAG3FNlMaHCV4SCnrx5I25Ew==
X-Received: by 2002:a5d:6a82:0:b0:306:2f91:a1a9 with SMTP id
 s2-20020a5d6a82000000b003062f91a1a9mr992918wru.16.1683108104507; 
 Wed, 03 May 2023 03:01:44 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a5d4492000000b0030632833e74sm5875600wrq.11.2023.05.03.03.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:01:44 -0700 (PDT)
Message-ID: <cbb81951-3e4f-c286-e632-d41777d89ad7@linaro.org>
Date: Wed, 3 May 2023 11:01:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 08/10] tcg: remove the final vestiges of dstate
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091756.1453057-1-alex.bennee@linaro.org>
 <20230503091756.1453057-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091756.1453057-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 5/3/23 10:17, Alex Bennée wrote:
> Now we no longer have dynamic state affecting things we can remove the
> additional fields in cpu.h and simplify the TB hash calculation.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1358
> Message-Id:<20230420150009.1675181-9-alex.bennee@linaro.org>
> Reviewed-by: Stefan Hajnoczi<stefanha@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   accel/tcg/tb-hash.h       | 6 +++---
>   include/exec/exec-all.h   | 3 ---
>   include/hw/core/cpu.h     | 5 -----
>   accel/tcg/cpu-exec.c      | 7 +------
>   accel/tcg/tb-maint.c      | 5 ++---
>   accel/tcg/translate-all.c | 6 ------
>   6 files changed, 6 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

