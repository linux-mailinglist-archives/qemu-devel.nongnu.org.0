Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499896E5C15
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 10:32:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poglJ-00051Y-6R; Tue, 18 Apr 2023 04:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1poglC-00050Q-UN
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:32:23 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pogkn-00083e-8v
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 04:32:22 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4ec81436975so2035614e87.0
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 01:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681806711; x=1684398711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=osj8/GPz/P9GU1ONg/ztykGOl9NLJe8v5vmhnnZb1nk=;
 b=oTmaI/mQYXoAlp3y7f/sWO/7SWWAzv9Wz/F03Qmqt4TWZOT9Le2PJcDZmhXpjgN9yE
 zfTbPkZOR5gySiBELs/mzoGhuGC2IVcnKMs1vi7qEiWTKAykXH1e05vbqAB8ZvifqUsg
 Ue6NasczaNDhVfSQsMjCw9y3gB6QmwgY1+dOZdyYHYcFANQJIyf/pd4JkJzR1jCuqaKf
 EVlOzU/ZFXtcTVJi3h2v3zdiNTD04Fy01D1dHAQZ/FhEGUzRUVYDs3qQUnSk7lkUbA2L
 MU9xW7In4IFcnvxI87uMg/OsaDdfB+6BJjGmYDe8GJ98qSuY3WVvNrx0GYB5SSCxOHyt
 NySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681806711; x=1684398711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=osj8/GPz/P9GU1ONg/ztykGOl9NLJe8v5vmhnnZb1nk=;
 b=UzoV83fsIBLwlAb6TTnij8MY6LAo8uzhS0Df+wCNivyuDeUL8XEU3vKE00xizEBDWt
 juBm+7xvwLo59Nzn678TcEBVKiYV7ZeuuJBjE6CDqSkAFZudn3TMiY4+30TNdaivtylP
 G8KfnvMixSBGRAjzEKMejHmghLQbYPTP5pvQOu9MiuV9C2aObsOl3jNrjFRxeNSlgyJl
 pUgxUfjwwQgN496ZibPp/xeJYnRRUELbnF16sVt7qIa5X3/U5eMndbWyEZMIil+FhGkc
 zIfSpz4+X4VlFGaevSGQZpL+Ou/l8Fy29scleZRLI1G3gXvZhD/mcRUZD2VirNuPk9eG
 etKA==
X-Gm-Message-State: AAQBX9fFzvloTAQ0bwvsUC7dUGRQH0SDrNK9g7RQhcZRbcallMQNicRS
 OXQQBlNMvks+jCdzf6vknBJAIg==
X-Google-Smtp-Source: AKy350bMzuY/up46E82EOf26CcpHsmw5xMPslGXecWSv6Ds2+dxK10LIDkAVAZmgOgLbSohMtROYfA==
X-Received: by 2002:ac2:4908:0:b0:4eb:e7f:945 with SMTP id
 n8-20020ac24908000000b004eb0e7f0945mr2367311lfi.41.1681806711278; 
 Tue, 18 Apr 2023 01:31:51 -0700 (PDT)
Received: from [192.168.58.227] ([91.209.212.60])
 by smtp.gmail.com with ESMTPSA id
 q9-20020ac25109000000b004edb8fac1cesm1498986lfb.215.2023.04.18.01.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 01:31:50 -0700 (PDT)
Message-ID: <c9e06460-19ad-812c-cce0-b2a7a20e423c@linaro.org>
Date: Tue, 18 Apr 2023 10:31:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 14/17] crypto: Create sm4_subword
Content-Language: en-US
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 philipp.tomsich@vrull.eu, kvm@vger.kernel.org, qemu-riscv@nongnu.org,
 Max Chou <max.chou@sifive.com>
References: <20230417135821.609964-1-lawrence.hunter@codethink.co.uk>
 <20230417135821.609964-15-lawrence.hunter@codethink.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230417135821.609964-15-lawrence.hunter@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-2.284, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/17/23 15:58, Lawrence Hunter wrote:
> From: Max Chou<max.chou@sifive.com>
> 
>      - Share sm4_subword between different targets.
> 
> Signed-off-by: Max Chou<max.chou@sifive.com>
> Reviewed-by: Frank Chang<frank.chang@sifive.com>
> ---
>   include/crypto/sm4.h           |  8 ++++++++
>   target/arm/tcg/crypto_helper.c | 10 ++--------
>   2 files changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

