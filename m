Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C647B5069AB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 13:19:38 +0200 (CEST)
Received: from localhost ([::1]:46592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngltR-0002SL-Um
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 07:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nglpF-000785-6u
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:15:17 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:43521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nglpD-0002qm-Hl
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:15:16 -0400
Received: by mail-ed1-x52c.google.com with SMTP id b24so20766638edu.10
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 04:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=q8haGWnl+VkxCrXySm267dM5NAYTNc55DyJ2QFSk3r8=;
 b=lW08qAv4CjWQcz1HwvQogChxSfQYf3OhpGLhz9jue1uTYVuYZpV1lOj/+GoINKPBdp
 ccMmIkEvbX7PCUEO9dBDLi6a34XKo9rBqfAOxjzFL0RM9EceoV536EQ0wVDlAcC3UlcT
 xjl4CcYfjH53Z91qMpyZcY+wdO32QBDrcwFM32gDMOT1ChB4vk707964Npuvu9qlBu5B
 0+05ndsz41B1T2C9eoHhlbgCDa2KrJLeFscPbzlji0l/0yfN7cGNzAxcYULiaNajr5Ru
 5PL49UXLd8KJkxieNt8er9im7+Gt5J2OnVq4HnbP0ThaPERRxasQKmtojjXbxJzt+5HJ
 hnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=q8haGWnl+VkxCrXySm267dM5NAYTNc55DyJ2QFSk3r8=;
 b=htjsK9VG7DOTsfj+NA+P1BOfGaiJlPFN1+bpBnznyk0arWgu6zmBywcJdL9QUDq703
 PNM98Jyb21wFwOj4XiuHjHT/IUdcHbm9Vtg6eoOPncA18EtYxb/xiKrXbA42lPLMdzl0
 h322RO5EDLXkmomnqJaptkx5t9ctOlmjOHGaaUG6sygbyCIO6kSm5oxX+q5aKxmaXnUc
 o7iEyrHpzQ4h4k0QjOvGRWpEggNoB43pss1elzpRoSILkH95WKlNOi3H5gzCSJGGkao4
 MTV2uq/+YcOiwmz4QT1KcC8ep/rwyNSN/Ow/vl6LZTDwuUpw55Hc5t4I7tQ1NWVIaR+G
 rBUg==
X-Gm-Message-State: AOAM530fYE0yHZzrxoYjSD2hnew7xsRgYQSyjGdT1RMutneTdZRa9XMn
 IX2YMfKKDlG2XdaiSfbQCu1pQb+5ySM/nA==
X-Google-Smtp-Source: ABdhPJyBp4E1mC+ktTtlRhtKc6rfpZkPvm8OxLYQtJpXtd87v0S0aBnYEoFZzaWxdPp+hgR24MIg6w==
X-Received: by 2002:a05:6402:458:b0:418:78a4:ac3f with SMTP id
 p24-20020a056402045800b0041878a4ac3fmr16661926edw.196.1650366913992; 
 Tue, 19 Apr 2022 04:15:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 vw17-20020a170907059100b006e8732d1944sm5522828ejb.5.2022.04.19.04.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:15:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 27F451FFB7;
 Tue, 19 Apr 2022 12:15:12 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-4-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 03/60] target/arm: Update SCR_EL3 bits to ARMv8.8
Date: Tue, 19 Apr 2022 12:14:35 +0100
In-reply-to: <20220417174426.711829-4-richard.henderson@linaro.org>
Message-ID: <87y201wchr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Update SCR_EL3 fields per ARM DDI0487 H.a.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Aside: I notice you have added FEAT_foo comments to the SCTLR bits next,
it might be worth at least flagging the FEAT_RME ones here.

> ---
>  target/arm/cpu.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9a29a4a215..f843c62c83 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1544,6 +1544,18 @@ static inline void xpsr_write(CPUARMState *env, ui=
nt32_t val, uint32_t mask)
>  #define SCR_FIEN              (1U << 21)
>  #define SCR_ENSCXT            (1U << 25)
>  #define SCR_ATA               (1U << 26)
> +#define SCR_FGTEN             (1U << 27)
> +#define SCR_ECVEN             (1U << 28)
> +#define SCR_TWEDEN            (1U << 29)
> +#define SCR_TWEDEL            MAKE_64BIT_MASK(30, 4)
> +#define SCR_TME               (1ULL << 34)
> +#define SCR_AMVOFFEN          (1ULL << 35)
> +#define SCR_ENAS0             (1ULL << 36)
> +#define SCR_ADEN              (1ULL << 37)
> +#define SCR_HXEN              (1ULL << 38)
> +#define SCR_TRNDR             (1ULL << 40)
> +#define SCR_ENTP2             (1ULL << 41)
> +#define SCR_GPF               (1ULL << 48)
>=20=20
>  #define HSTR_TTEE (1 << 16)
>  #define HSTR_TJDBX (1 << 17)


--=20
Alex Benn=C3=A9e

