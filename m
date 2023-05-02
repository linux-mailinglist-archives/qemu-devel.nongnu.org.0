Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF976F45C9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 16:10:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptqhN-0003u2-KV; Tue, 02 May 2023 10:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqhK-0003tX-Tt
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:09:42 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqhJ-0001Nw-4K
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:09:42 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2fa47de5b04so3699471f8f.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683036579; x=1685628579;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yQHIIjFyobscnPlakxAVXsfOlSh56S5VYgn4TXLtTbg=;
 b=Dtc/y3MsQt4J5ZKMjAY25BgESHG9/8FVeM+MfUyKFXsDz1TP6YdmkXkFaHL1RYDjJ5
 sDXnzY58+FiPe3sG19QZJ7JZIZGI0ddXz5vuvLPxaDCZBWmQa9ukExO70OdZhQrNALGw
 3fsFHIAx9DNVqQH92qwgz08yhshFmz2E2nNCtCizZBbuTuiNJwYUjEvmDQmwzDclhkWe
 +4JhgLBAuyw84kcsYxYBJCu+gZzCsARkdFQY4T8kPRkJKanuldiVTU48FSccz9DT0CCN
 0Dp2TAGo42SD5ZbhB+N+/t7cX4Yv/3cm/FGwz7F9QLr0HzCBczgJYROmkEjBknUONCQK
 eGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683036579; x=1685628579;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yQHIIjFyobscnPlakxAVXsfOlSh56S5VYgn4TXLtTbg=;
 b=l5RGmxUDxTA8/BZO68dIF8ikMDnpnBTye6m3edpFSP0K/R87uDW/Wteupj/515Ma/8
 zdodIGM9UiwRraysEdVs7J8DZfv3VQ/UeROdA1p4U/KXt+tWl707WVWkHdO8w35Pb8jK
 jynX7mz7jwHRdEcI3LlxsNet/gCZ/BsBGM+8cdTvI1O4YukGiV6pobzxeAUqmJ0Uu4HU
 TG2/VA5kXWD69OZocvil/NGRhih/+IkvxhS7qGZnDmzPnsMumU435SJSTG5ki2tpECG5
 77JMcnEKCos/mpd+iFCu8LnSjM9576KTUs4iGB4A/JBaYxunEgGgnSF0apj7W1vtGykZ
 E1cA==
X-Gm-Message-State: AC+VfDxS9VToOg6rv8iQNNndlp87u+C4gQ7j2rrwnlVotTof/8B++eCv
 oFN4PWAUS+pA/qzGgqqLHPtu3A==
X-Google-Smtp-Source: ACHHUZ4Ffv3pI17w8agocxWOqrSp9M1wqepB6GUOyS2fZwzCixbZhoSWt/6NpLne7HIlOdTdF1u6ZA==
X-Received: by 2002:adf:fe4e:0:b0:2ef:b123:46d9 with SMTP id
 m14-20020adffe4e000000b002efb12346d9mr11228334wrs.3.1683036579383; 
 Tue, 02 May 2023 07:09:39 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:ad29:f02c:48a2:269c?
 ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 k7-20020adff5c7000000b00306299be5a2sm7269292wrp.72.2023.05.02.07.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 07:09:39 -0700 (PDT)
Message-ID: <df8ad122-f0e9-1912-9ef7-8e34c9a4dcb9@linaro.org>
Date: Tue, 2 May 2023 15:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/35] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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

On 5/2/23 13:14, Peter Maydell wrote:
> Hi; here's an arm pullreq. The big bits here are Fabiano's
> CONFIG_TCG=n patches and my set that deprecate -singlestep;
> other than that there's a collection of smaller bugfixes.
> 
> thanks
> -- PMM
> 
> The following changes since commit 7c18f2d663521f1b31b821a13358ce38075eaf7d:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-04-29 23:07:17 +0100)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230502-1
> 
> for you to fetch changes up to 0ab99e4252f21550f2c16f859cbcdd3cced9f8bf:
> 
>    hw/net/allwinner-sun8i-emac: Correctly byteswap descriptor fields (2023-05-02 13:10:42 +0100)
> 
> ----------------------------------------------------------------
>   * Support building Arm targets with CONFIG_TCG=no (ie KVM only)
>   * hw/net: npcm7xx_emc: set MAC in register space
>   * hw/arm/bcm2835_property: Implement "get command line" message
>   * Deprecate the '-singlestep' command line option in favour of
>     '-one-insn-per-tb' and '-accel one-insn-per-tb=on'
>   * Deprecate 'singlestep' member of QMP StatusInfo struct
>   * docs/about/deprecated.rst: Add "since 7.1" tag to dtb-kaslr-seed deprecation
>   * hw/net/msf2-emac: Don't modify descriptor in-place in emac_store_desc()
>   * raspi, aspeed: Write bootloader code correctly on big-endian hosts
>   * hw/intc/allwinner-a10-pic: Fix bug on big-endian hosts
>   * Fix bug in A32 ERET on big-endian hosts that caused guest crash
>   * hw/sd/allwinner-sdhost: Correctly byteswap descriptor fields
>   * hw/net/allwinner-sun8i-emac: Correctly byteswap descriptor fields

The new notcg test is failing:

https://gitlab.com/qemu-project/qemu/-/jobs/4212154869#L3556


r~

