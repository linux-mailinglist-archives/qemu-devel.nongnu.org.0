Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624B858F2D9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 21:13:22 +0200 (CEST)
Received: from localhost ([::1]:59512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLr8q-0007yG-IC
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 15:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLqjE-0006DF-DE
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:46:52 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLqjC-0007Q2-Oe
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:46:51 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 v131-20020a1cac89000000b003a4bb3f786bso1483101wme.0
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 11:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=b6l1VklOuEUHnqfkqAZAJqpOFEKNR5cv60NOgLiyDG8=;
 b=Uz1c1RiCmT0MZphPW0ZJMRfhlBjZecRuD7PIEMpS8q82Ugz7GN1ZGcsOQOCTfsEHSW
 aMm8ab8ZZ0PNXxS3pdRckZLif6ZpYpyG2SLysUvR/n9lbVGDcohaFYm+lZnNXoMzt5hP
 YoHc68G/Xw7eByAX3vHVBB1666AQD9ZYbDDEdbXMZj51g8IeRiSdoK2T2Z9AyLlrCxBv
 zljAXmhSyIK2nzBjz1OUtRlS42QppLfesdN89xaVwKFqpM41FXYeNaWXKMfmxN3wddAz
 cBFo4+eiyqPn9nypCa3eWtlNo3epzHX4tLO6Rrdk+7xk8+fSsYS17T5bzPIXT/CDZ95G
 jObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=b6l1VklOuEUHnqfkqAZAJqpOFEKNR5cv60NOgLiyDG8=;
 b=mLrCpPJ3Z7qy/hRhjknWKG3l6DZQ5gJHkaAmyagVIUUWOiTXB4OvpMnT/PnEoec2xN
 gJzkxg6ScTBuRJbCv2J9MHOntU0woxJ8Z5mrA6kwCHKRiaKd3DR3jvJE+4DvkZNh9/K3
 0CypBdQ5lbYJZE3GjOSN9RTJKu/qVBFTHFONcnLRBlqTrn3Jw/sq5v8KypnMKn4TpRwj
 IcFfQ+p8+cYSGzHVn12kvLynZYrE1cDNKJObzk2haWNk9CnMwRvDXKljA6FqrbOl8MA5
 WQNZ4tBMSql6ClsUYktpLAVqRfmsXajQRT6RUJE05YERNBDFyrwDX8m0ruaRGFXplWeC
 ZOyg==
X-Gm-Message-State: ACgBeo1cFB9SNWW1ooEbwDWud4dN1ZAsgsR6aG7NrpBB+13dm9GMT0B0
 PeGTs2q2IH2Dx9XZfmGyICRasg==
X-Google-Smtp-Source: AA6agR7mi83bri9H8cm+X8AOFtWGLQL7YS7UZ6q78fki3M0P590zFY84nbBTVHuKusZa1z/qHiWimA==
X-Received: by 2002:a1c:a145:0:b0:3a5:b84b:f746 with SMTP id
 k66-20020a1ca145000000b003a5b84bf746mr581671wme.127.1660157209322; 
 Wed, 10 Aug 2022 11:46:49 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a05600c4e4500b003a32251c3f9sm3471816wmq.5.2022.08.10.11.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 11:46:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0AB3A1FFB7;
 Wed, 10 Aug 2022 19:46:48 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-23-richard.henderson@linaro.org>
 <87fsi4kzkz.fsf@linaro.org>
 <3128223b-56d9-8efd-05c0-f1f2a30dfd99@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 22/62] target/arm: Add secure parameter to
 get_phys_addr_pmsav8
Date: Wed, 10 Aug 2022 19:46:28 +0100
In-reply-to: <3128223b-56d9-8efd-05c0-f1f2a30dfd99@linaro.org>
Message-ID: <87czd8j5rc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 8/10/22 06:16, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> Remove the use of regime_is_secure from get_phys_addr_pmsav8.
>>> Since we already had a local variable named secure, use that.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   target/arm/ptw.c | 5 ++---
>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
>>> index d424dec729..f7892a0c48 100644
>>> --- a/target/arm/ptw.c
>>> +++ b/target/arm/ptw.c
>>> @@ -1960,10 +1960,9 @@ void v8m_security_lookup(CPUARMState *env, uint3=
2_t address,
>>>     static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t
>>> address,
>>>                                    MMUAccessType access_type, ARMMMUIdx=
 mmu_idx,
>>> -                                 GetPhysAddrResult *result,
>>> +                                 bool secure, GetPhysAddrResult
>>>   *result,
>> NIT: why not use is_secure like all the other functions (and
>> reformat
>> the commit subject to match too).
>
> It's right there in the commit message -- there was an existing local
> variable.

doh - sorry so focused on the mechanics I missed the explanation!
>
>
> r~
>
>> Otherwise:
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>=20


--=20
Alex Benn=C3=A9e

