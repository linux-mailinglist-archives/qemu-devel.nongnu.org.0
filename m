Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CDB411F29
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:37:05 +0200 (CEST)
Received: from localhost ([::1]:43580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSNE0-0007nu-He
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSN8f-0001e6-Sp
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:31:34 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:41617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSN8e-0001MG-2B
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:31:33 -0400
Received: by mail-pl1-x633.google.com with SMTP id v2so11534416plp.8
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 10:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=TvlDNajBLecyCOyw+Afglzy+YBiSPIvXRf+JjXMTW/4=;
 b=HHsAxYXadOkcqqGwSS0P0kn/4NLeCP4sVp14DWsqChqJ4SFkJH5XQq/TYvalbzD7hY
 ihUT4a0areo5inS30TZMlVB/b1SRv/BjSwd1mcBJb5EDMnv+z0Hk+cPLBLoaQ6p9rlLC
 D7QKbs5cP1DGUPbpen+b9byerVX2kg3uP8Us12o2UsbFwA/pIqRP7i7druCduRqbnRnc
 /q/bsZBvMzEqvagMY6Et/KBz80F4NTEX9n+0Atsp2fBx3D9kp/0AiyA6jMjTV7mTaGl9
 fYAmMMax2slWf8fG/UNVx9+SOpMTs6NEuSkK7NqVwkRuGr4SdN8ou+3YyAOPsdxfInSe
 Lv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TvlDNajBLecyCOyw+Afglzy+YBiSPIvXRf+JjXMTW/4=;
 b=EsN5kC/wf0+/soIvKlMA8A52QV3Nq0NUvPecWYhoEr4BWmaJr8OHNk2H35OBuv6tcW
 p3Zd84CKcYq4/A+3BEyQDtDeZWdS5ndqjvvnw+LIG9OfeVtQHB1ZqNIGYImzeOIbTjCf
 mNTA42JKXuvomWiTvLwXvai4oE/J5AglGcMA3N7EWDLNgPq5f0eVTcnYatxrJNMX8ecl
 OTpv2hqKwKOe16IMnk4KqtHTXxtQsb8rr2boiumdECRGvg+ng112wqVPG43X4qke5JjY
 mzoTcxOnps+7j/FxD78e3q2MvG4vJ9lALcUMxkw/vdvP9nEbP+BpsO6CwhZCdzIpDMKF
 oJ6g==
X-Gm-Message-State: AOAM530WdeUHABYilPXGEJCAG2C29wY2FPxPwWH0OaSmX968Hn1vCWbc
 1bVF5fOqSqMOluhhISBVF8cNe1yQKcZQwA==
X-Google-Smtp-Source: ABdhPJxgrQPeUkxiwZmUe6CMvqMTmVCy9eSObyDHjk8KEoKNGgxYsow7p4MdZ4yTBXQU5+/mBS378w==
X-Received: by 2002:a17:90a:19d8:: with SMTP id
 24mr147800pjj.129.1632159090382; 
 Mon, 20 Sep 2021 10:31:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b11sm4320001pge.57.2021.09.20.10.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 10:31:30 -0700 (PDT)
Subject: Re: [PATCH 30/30] accel/tcg/user-exec: Implement CPU-specific signal
 handler for LoongArch hosts
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-31-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ec6d909c-398b-83d6-d106-ba049ae25866@linaro.org>
Date: Mon, 20 Sep 2021 10:31:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-31-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>   accel/tcg/user-exec.c | 83 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 83 insertions(+)
> 
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 8fed542622..0f85062e61 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -878,6 +878,89 @@ int cpu_signal_handler(int host_signum, void *pinfo,
>       return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
>   }
>   
> +#elif defined(__loongarch__)
> +
> +/*
> + * This logic is bitness-agnostic, so the generic __loongarch__ guard is used
> + * instead of explicit ones like __loongarch64.
> + */
> +
> +int cpu_signal_handler(int host_signum, void *pinfo,
> +                       void *puc)

Looks ok, as far as it goes.  Similar comments about loongarch64 vs loongarch32 vs loongarch.

Also have a look at

https://lore.kernel.org/qemu-devel/20210918184527.408540-1-richard.henderson@linaro.org/


r~

