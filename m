Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DFF509B5F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 11:06:20 +0200 (CEST)
Received: from localhost ([::1]:56234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhSlX-0007tR-8w
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 05:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhSUG-0003fA-Sc
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 04:48:28 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhSUF-0002n9-1C
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 04:48:28 -0400
Received: by mail-ej1-x635.google.com with SMTP id g18so8529522ejc.10
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 01:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vvO0oMSraL5i064RafsCBvLTl0Z39qofFpl0MIIpHVg=;
 b=JlmjoDWf4ozpD7weR68ONMAwDDGLsWFW5bymkNNpf5OwchRxfp5NyGY5xPW/ln93Au
 t0I9r3T9e3/GQbgHzVaLP3Q0Wrdfrf40XqKGWaVPzPa3y/G16qEwG0ZT3WhjWXvFsLvl
 faowZen83AgUYmxikAICeN+1txYSc4g6aAI+XEWlYEOptIUoKmJnHgMpKJmrI/RS1BxV
 qpFmBPJILT8EpjR61O7Jg7zlU4xT2asDrgwEhb8hUMFK1VS+NwyLzKfqUSFQih6Kgqrv
 c57FDjSZREL8WbvXko992Ri0Ghkh+cUuQxap8VoKQO8dpBVVuXBCqEOTcuuiM758U6kG
 h0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vvO0oMSraL5i064RafsCBvLTl0Z39qofFpl0MIIpHVg=;
 b=TdLvHXaYndKxKwcxbiscI4eXMF50ZUEfkTbNDWbpM4CklhjShzTSMHoLSmaZK6Pgu/
 ZAkB8Upkjl+Qv/SBjoNttuMOYqtLdl4KHC0h/VQIzERCGZXdE8lfdhcD4zDy/AH4B0X5
 ixg3YjuxQfFcXPN0yuNKY3VPDDAOROFhk7L6llsp87jKCPTq9uQih9Jz58fINiW3K3Eh
 a51DKOuri7os0Sc2snIvmCjOPlkKPGp0NKud2CScKeea4/z3yn//HswjgD3Y8o3pGUfz
 RckneXswhvbF8lHHsLiEUYIJwZF1VBIcxIncS2fm3OXkDYEaaSoj05Pu1SLrhjJkqQjw
 39Ag==
X-Gm-Message-State: AOAM530UzL6PaQArYQDSdk2fhdUyRsWwyPWIq61NPo//sR4G0f2Jz3a1
 S+FOMcBPjnwq4I1DyVr8CcWFUA==
X-Google-Smtp-Source: ABdhPJw7PUu4VkYoe7rHh0fP+C96xBByXzhRdEUfzh5HKiQNOBx+MblWvDVBqgjxDsJYGoFB1wLZIA==
X-Received: by 2002:a17:906:478b:b0:6db:8b6e:d5de with SMTP id
 cw11-20020a170906478b00b006db8b6ed5demr22895713ejc.161.1650530904886; 
 Thu, 21 Apr 2022 01:48:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170906170200b006efe7be5f10sm2408251eje.185.2022.04.21.01.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 01:48:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5695B1FFB7;
 Thu, 21 Apr 2022 09:48:23 +0100 (BST)
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-3-leandro.lupori@eldorado.org.br>
 <CAFEAcA854-k-c5ZAbb=m2LE_ogi2Gf-3idOxOc37zN844mKyAA@mail.gmail.com>
 <962f7ef4-7dcc-fb5d-5e55-90eb3ba65e47@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH v3 2/5] ppc64: Fix semihosting on ppc64le
Date: Thu, 21 Apr 2022 09:46:30 +0100
In-reply-to: <962f7ef4-7dcc-fb5d-5e55-90eb3ba65e47@linaro.org>
Message-ID: <87zgkevn3c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>, danielhb413@gmail.com,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 pbonzini@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/20/22 12:42, Peter Maydell wrote:
>> On Mon, 18 Apr 2022 at 20:19, Leandro Lupori
>> <leandro.lupori@eldorado.org.br> wrote:
>>>
>>> PPC64 CPUs can change its endian dynamically, so semihosting code
>>> must check its MSR at run time to determine if byte swapping is
>>> needed.
>> Arm CPUs also change endianness dynamically, so why is this
>> change PPC-specific ?
>
> I'm reasonably certain that we simply don't test armbe or aarch64_be
> semihosting.  Leandro found this because qemu-system-ppc64 defaults to
> BE and qemu-system-aarch64 defaults to LE.

Maybe it is time to have a generic endianess variable in CPUState so we
can avoid having arch specific hacks in the semihosting code. That said
is endianess binary? I seem to recall on ARM the instruction stream is
always in one endianess so it only really affects CPU data loads and
stores. Is it the same for PPC?


>
>
> r~


--=20
Alex Benn=C3=A9e

