Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E287152ABBB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 21:14:23 +0200 (CEST)
Received: from localhost ([::1]:44674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr2e8-0002T3-Qj
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 15:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr2c6-0000XT-9u
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:12:10 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr2c3-0003Ey-VV
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:12:10 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 pq9-20020a17090b3d8900b001df622bf81dso3122849pjb.3
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kHwY1PdlcMuFc6ysAeypQ08LYuDa9fPUymtrQeA3S+E=;
 b=SKA9E9XM34CKJ6pqMAiatueBLJlYIKDW76dg7vkSFHSgKRd2DlDhAyD7oayOpA4KFj
 AVSQm8UFlM6e6bsU/ZXYajjxyYI4fymSzsuLafAD/6G+H4XEQnqZkTW1rG3u6nR3ib6C
 rvdNryMuHb1Kd8h/2M9TFFl/S0H+s7W4Nw4M7LxFWH1Nd2Qige2Yxn07rN2bOUIu0QDI
 n/HhRubO0ZyZPeUXlfIIKbfjenKB2YfeF4v9zXKKWOfMvcUDI3Xp7GcfTlQ9m3KFdmWz
 Gs8caFqFGlBaRrlJB5k22hDSR+whtriuQJKxgC9vRGyr+OV3SRbQRaTSwxOVzJ/QhrxI
 WHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kHwY1PdlcMuFc6ysAeypQ08LYuDa9fPUymtrQeA3S+E=;
 b=7w7zvcTZU5InPKuF2CPbmJ7EVGKEzDhBAdrjx8rlnC57eutfVgtj23fFxbrcxkZMDU
 yfLZi0AEHstNeYkYog3iwHYpv8bg1aSBp1+XqK97uee6t7De6JIB4RQgrcxEYOCMMH9g
 ZFlOWm4sFXvGgMb7ei/UnLjsEJN8st0R8gSBYfPUvuHfzYqjNM+WHDO8HPL1wGfFpX1T
 OYTRz1ccvuVG64SIf/hBl3u/5vve5VjquQeHMeUdHqiXKlvO9MHhDDsON9SqsjRn5WnB
 MZ353ZRz2Rk8/gUQF8jYuO9MeZJGEFXfzTp+hj9QS8LGv326mtIdBMKny7582XKKca3g
 WGeQ==
X-Gm-Message-State: AOAM532zCdNNehml+XuvusfJXeMsUBu7+1dnhEmqyLMphmIye+jU3Do8
 4oWUs6arx9aY7GE8IJni5v+7+Q==
X-Google-Smtp-Source: ABdhPJwfIqwusj4cBQiOGRtLLDVVRG+9/z9TJXm0ut2MobTyZWUxCR3IENTod3zrsZBdc+If4e6MyA==
X-Received: by 2002:a17:902:8696:b0:15d:946:2f98 with SMTP id
 g22-20020a170902869600b0015d09462f98mr23632934plo.82.1652814725485; 
 Tue, 17 May 2022 12:12:05 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a1709029a0400b0015e8d4eb2c1sm9430679plp.267.2022.05.17.12.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 12:12:04 -0700 (PDT)
Message-ID: <8ec126e1-bc9c-bf7d-5586-e5fcda786222@linaro.org>
Date: Tue, 17 May 2022 12:12:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH RESEND 10/10] target/ppc: implement cdtbcd
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
References: <20220517164744.58131-1-victor.colombo@eldorado.org.br>
 <20220517164744.58131-11-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517164744.58131-11-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/22 09:47, Víctor Colombo wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implements the Convert Declets To Binary Coded Decimal instruction.
> Since libdecnumber doesn't expose the methods for direct conversion
> (decDigitsFromDPD, DPD2BCD, etc), a positive decimal32 with zero
> exponent is used as an intermediate value to convert the declets.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/dfp_helper.c                    | 26 ++++++++++++++++++++++
>   target/ppc/helper.h                        |  1 +
>   target/ppc/insn32.decode                   |  1 +
>   target/ppc/translate/fixedpoint-impl.c.inc |  7 ++++++
>   4 files changed, 35 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

