Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5BC6FDB9C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 12:25:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwh02-0000y2-Sl; Wed, 10 May 2023 06:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwh00-0000uW-T5
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:24:44 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgzz-0006LN-8D
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:24:44 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3063afa2372so6465636f8f.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 03:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683714282; x=1686306282;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sU1UcJWBgmL+pccXnwOqYfPuEQYr9pX8YKI3rRSuv/k=;
 b=aydwU+cysonOa0Y8xtfGYLTOUJdF8yEG/Jcvs/HMmr5I1FqPw1/1gOvxJ/zAJGbSuU
 RKkYzzELCX0vZuFhjGQA4J8FcfdNsHUz7LmSG4Ns7RT9v/x+uH504Gtk8o/pcX03qZfj
 FEdLWRcFutz1p0iRujTUJysN5/EEieJccPqPlY0m0QRGNpOFKFd8Q8UZeVOvUW+mRoVe
 RWjnHw6UxAZQyZ2HmKtzSa9QNSrDRke4aHHD2kawEcwcgEUtKYcWEbONPTyAcIgsDdNc
 Jxz2P04iyMZzwp5APjP7jEPgNEvkGk98YB8zjh2mgRwnQJBw9kEkR7yDInUQStRfeGhv
 MoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683714282; x=1686306282;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sU1UcJWBgmL+pccXnwOqYfPuEQYr9pX8YKI3rRSuv/k=;
 b=EEW3EFOR0LqfJy39xHHDoN0BOrY4qYbS15GgOFrkykZ2hpYiGI//ycN0yvxlCoIkyW
 Pa5rNUjoh5Ru/v1A5RFo6C3qtoQC7HB61ciUhSds5UXz2Df2KeRhj8i+nvABAyQo0tBG
 ncjb0GZafKPtcClh1ZbWRTj0Ent3UsBdZ3wz6D1AEaNF1ig0KZwgk/bGGyPhwHRoW9E0
 bBhQfPTbdhPLhU4qhAKhD8/HCbdxUkpA6fk6ykn9FlEHa7qi8a0c3brdpKyM9bckk3mV
 y94ImP9QHTa8v2OBzrKmnWMArf+OZ+XuE/4siA+qgtLRebyxhF0SwmpJIHS6zxPxVmd1
 41gw==
X-Gm-Message-State: AC+VfDzvHCmJMobKL2jvCoFMduREDEewac9uGza819uH1vZxr6/eb33K
 iI5QoHCoayHAR4IcOihm38b0ZYe5VwwE8NIhrW49Uw==
X-Google-Smtp-Source: ACHHUZ46yFUh+NBEdulRvEL3WBJlx9ReOr/0uuhaTxDT6BqjqhwoTnP0Xcm5xQ9Oyx46OBYKB54ARw==
X-Received: by 2002:adf:fb0b:0:b0:2cd:bc79:5444 with SMTP id
 c11-20020adffb0b000000b002cdbc795444mr12418211wrr.2.1683714281886; 
 Wed, 10 May 2023 03:24:41 -0700 (PDT)
Received: from [192.168.10.24] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a056000008200b0030630120e56sm16775568wrx.57.2023.05.10.03.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 03:24:41 -0700 (PDT)
Message-ID: <de13ef96-19a3-7997-2844-14c4af25cf1d@linaro.org>
Date: Wed, 10 May 2023 11:24:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH for-8.1 00/12] tcg/mips: Backend improvements
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org
References: <20230408030359.3368868-1-richard.henderson@linaro.org>
In-Reply-To: <20230408030359.3368868-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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

Ping.

r~

On 4/8/23 04:03, Richard Henderson wrote:
> I've posted some of these before, perhaps a year or more ago, but
> then failed to follow up and get them merged.
> 
> I don't think there are any real dependencies, but it has been
> rebased upon today's load/store helpers patch set, so there might
> be minor conflicts, therefore:
> 
> Based-on: 20230408024314.3357414-1-richard.henderson@linaro.org
> ("[PATCH for-8.1 00/42] tcg: Simplify calls to load/store helpers")
> 
> 
> Richard Henderson (12):
>    tcg/mips: Move TCG_AREG0 to S8
>    tcg/mips: Move TCG_GUEST_BASE_REG to S7
>    tcg/mips: Unify TCG_GUEST_BASE_REG tests
>    tcg/mips: Create and use TCG_REG_TB
>    tcg/mips: Split out tcg_out_movi_one
>    tcg/mips: Split out tcg_out_movi_two
>    tcg/mips: Use the constant pool for 64-bit constants
>    tcg/mips: Aggressively use the constant pool for n64 calls
>    tcg/mips: Try tb-relative addresses in tcg_out_movi
>    tcg/mips: Try three insns with shift and add in tcg_out_movi
>    tcg/mips: Use qemu_build_not_reached for LO/HI_OFF
>    tcg/mips: Replace MIPS_BE with HOST_BIG_ENDIAN
> 
>   tcg/mips/tcg-target.h     |   3 +-
>   tcg/mips/tcg-target.c.inc | 350 ++++++++++++++++++++++++++++----------
>   2 files changed, 260 insertions(+), 93 deletions(-)
> 


