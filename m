Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044643CFDA6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:34:26 +0200 (CEST)
Received: from localhost ([::1]:40032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rlI-0004o3-Id
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5rkL-0003zy-OC
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:33:25 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5rkI-0007IQ-Sl
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:33:25 -0400
Received: by mail-pf1-x42b.google.com with SMTP id i14so7854694pfd.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lG93XOuPVhsRng7XrWCXnb+EypYZHkSQi0fCNBTxwjk=;
 b=f8NfFZfH2iFYlBlLuYlofibm0HGOTBTYTutg3OQ3qMg+WYnFvQ+9fUTvTmXzy/v8q+
 82rKcM6lnOTtpD1m/rnDjN+saQGpvQOHYahRq/FkmbjSmCdARha5PbzKlIEVBqX04vbZ
 gU4zWMHe1oTMugkWf7/ObCbgYThzig2eToojbwYS1v0kIxNoo+eaYgJUKrzNzoXNRbaj
 mHs2zw3WAgcNsNj4gJ+k9pWCnZiSTG9mXl/2k3bbTRkprKjEcNiL4jsNeh1CkH+8uZCl
 1ITnGtLyLwnSx2BT+m7cxGJnp81/nRyK7MeZh0OZkzl1StMSpFl+MqB/ROCpH5P8i5do
 cmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lG93XOuPVhsRng7XrWCXnb+EypYZHkSQi0fCNBTxwjk=;
 b=Vzh6v3ogb+l6i++1L24WLLwd5FzsdhazlWibiy5lQqzxmg5H7Ny1jgmmcaLdhkQ/LD
 pujs6w+oIetKVcdHTqlKUGDdtp/SjLZWOMbZhpu+7NfUK+Cma7WgJjnkslmCZJ5eIu93
 yrvulwbQ6xbP9Praji8xrINwInQBt/nmDSIbfEwgKkJ8GIV47+B93xV+gKA58y747khT
 i7cecEF5JoBfaZia2DHPrrN5VijcptArhn5mcw3RGfI1UhSq2Wq6I8Z62/nDxCH+yGVH
 r+EUf5offLItztMq+cnTW85EB2my/TxwiaN/VWbu/sowmMpbbnHoqdngRDxCGMrHFJhS
 Oo6w==
X-Gm-Message-State: AOAM530aJm9ozBCxhFgLgcea/qOXXy34L2VAlxV2D1u0V+qiEGaPshhp
 zl7s9FfECsgbSbqPG8GmBypLrg==
X-Google-Smtp-Source: ABdhPJzMTEFMv2fGre2MkOPNLAS9EoQEJpFWnG0lAw7ttjFSh5G6//8qKvivfXuETNaq1fko61xXtw==
X-Received: by 2002:a63:f711:: with SMTP id x17mr31136059pgh.226.1626795201234; 
 Tue, 20 Jul 2021 08:33:21 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id o134sm25187608pfg.62.2021.07.20.08.33.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 08:33:20 -0700 (PDT)
Subject: Re: [PATCH v2] target/ppc: Ease L=0 requirement on
 cmp/cmpi/cmpl/cmpli for ppc32
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210720135507.2444635-1-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f2fedb2e-f375-f4ff-4035-21f1b679fae8@linaro.org>
Date: Tue, 20 Jul 2021 05:33:17 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720135507.2444635-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 3:55 AM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> In commit 8f0a4b6a9b, we started to require L=0 for ppc32 to match what
> The Programming Environments Manual say:
> 
> "For 32-bit implementations, the L field must be cleared, otherwise
> the instruction form is invalid."
> 
> The stricter behavior, however, broke AROS boot on sam460ex, which is a
> regression from 6.0. This patch partially reverts the change, raising
> the exception only for CPUs known to require L=0 (e500 and e500mc) and
> logging a guest error for other cases.
> 
> Both behaviors are acceptable by the PowerISA, which allows "the system
> illegal instruction error handler to be invoked or yield boundedly
> undefined results."
> 
> Reported-by: BALATON Zoltan<balaton@eik.bme.hu>
> Fixes: 8f0a4b6a9b ("target/ppc: Move cmp/cmpi/cmpl/cmpli to decodetree")
> Tested-by: BALATON Zoltan<balaton@eik.bme.hu>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/translate/fixedpoint-impl.c.inc | 58 +++++++++++++++++++++-
>   1 file changed, 56 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

