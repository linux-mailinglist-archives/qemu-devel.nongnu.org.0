Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0C650BBD9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 17:41:33 +0200 (CEST)
Received: from localhost ([::1]:59020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhvPY-0004XW-7H
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 11:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhvMi-0003Le-Im
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:38:36 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:46023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhvMg-0005FZ-Tu
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:38:36 -0400
Received: by mail-oi1-x22b.google.com with SMTP id 12so9402682oix.12
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+oGxA1W17R0UFokFtbmNbAcISBKnIWsjtYkpCQW5SRI=;
 b=ia9oCt7XpzNVhxIdblM28lqPnDGIaG/xWf2HK1hiAOnGDXHrrSfmjsjPzGpeTFSpJX
 3N2jqZAGtkZYhri6/VQucDWmeTl9vzxGLMEs7Rsw6eSSPgKLGXpIxScBKzbhvDTTf/FC
 rSmxO5VHsA45xHlJWqNb0A+FIolZPRs0lqpVwKi43gMA8s/wzoHEIa0aZ+AWB2AY7BGl
 oO8elmFRRpr80aPyG/i+nE49VrAp8txxJTO6U8jj7MbcbGSMvPALnWxhRj8ekL/t78j0
 zA26uh7HE0lsGcYh9YXuOlNhbCX7Bbw2Cinicl6lX2JY1oYvNgqDcFxZ6BbxYr7pwgH5
 JKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+oGxA1W17R0UFokFtbmNbAcISBKnIWsjtYkpCQW5SRI=;
 b=AjNcZE7hS5lUkXhIc8e/TVda+XuWhRSVTGoPnnRBQJPxV7YZInBfowlRHwsSxUta1F
 UjDlsaLiIr6/x5sEDYk0Jajf2B8aoI68XetgrjtYNi0vr5NRZR+e/IxjeOayjuLjn1v9
 +kf0KqfIUeNFtZihOmN0Wx4J7jn3ykONGBpm4YrmxuLGa0yoMwfH6Yi3Kgi1i0b7GUZ4
 OLkdyzxJcpy2MlrLhF5EZml0QKLSltbm1EfXAA/GxrXbC23RD2DGv6Ud8COswUo67Dws
 hX9l58lWvlUxPv0IIWoqiWbQAYWbV9HpPhpbmBji4m/FDfa5gLh5wM9JvQmX5FoR5Vuj
 f6Xw==
X-Gm-Message-State: AOAM532oqzJ5pkCuDOErBonGNzcMUWZkQd5k4N4hUrIooKWhuIFrI59l
 H67JxrD//VPcxuoRb2U3haku+Q==
X-Google-Smtp-Source: ABdhPJw3GwVJi45GvEo08zqkjmhXv4SMgDdiyv8pdTBFKA/UyNXhUSvnBpd6tUfjtGG1J4SylfmEyg==
X-Received: by 2002:aca:3384:0:b0:2ef:8afa:2716 with SMTP id
 z126-20020aca3384000000b002ef8afa2716mr2495878oiz.137.1650641913213; 
 Fri, 22 Apr 2022 08:38:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a9d6a90000000b0060548d240d4sm831071otq.74.2022.04.22.08.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 08:38:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ADAF91FFB7;
 Fri, 22 Apr 2022 16:38:29 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-27-richard.henderson@linaro.org>
 <CAFEAcA98sjUhUccvEAjAWeK+Z7-HER9LDz6LMSFMNuVnBSPW=Q@mail.gmail.com>
 <20b109b9-81fe-e8df-bada-c3a0ce920c45@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 26/60] target/arm: Replace sentinels with ARRAY_SIZE
 in cpregs.h
Date: Fri, 22 Apr 2022 16:36:47 +0100
In-reply-to: <20b109b9-81fe-e8df-bada-c3a0ce920c45@linaro.org>
Message-ID: <87k0bht9fu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=alex.bennee@linaro.org; helo=mail-oi1-x22b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/22/22 02:37, Peter Maydell wrote:
>> On Sun, 17 Apr 2022 at 19:08, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> Remove a possible source of error by removing REGINFO_SENTINEL
>>> and using ARRAY_SIZE (convinently hidden inside a macro) to
>>> find the end of the set of regs being registered or modified.
>>>
>>> The space saved by not having the extra array element reduces
>>> the executable's .data.rel.ro section by about 9k.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>=20
>>> +#define define_arm_cp_regs_with_opaque(CPU, REGS, OPAQUE)             =
  \
>>> +    do {                                                              =
  \
>>> +        QEMU_BUILD_BUG_ON(ARRAY_SIZE(REGS) =3D=3D 0);                 =
      \
>>> +        if (ARRAY_SIZE(REGS) =3D=3D 1) {                              =
      \
>>> +            define_one_arm_cp_reg_with_opaque(CPU, REGS, OPAQUE);     =
  \
>>> +        } else {                                                      =
  \
>>> +            define_arm_cp_regs_with_opaque_len(CPU, REGS, OPAQUE,     =
  \
>>> +                                               ARRAY_SIZE(REGS));     =
  \
>>> +        }                                                             =
  \
>>> +    } while (0)
>> Do we actually need to special case "array has one element" here,
>> or is this just efficiency?
>> Anyway
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> Just efficiency.  There seem to be a lot of these.

If you moved define_arm_cp_regs_with_opaque_len into the header as an
inline surely the compiler could figure it out when presented with a
constant i? The would avoid the need for the special casing in the macro
expansion right?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>
>
> r~


--=20
Alex Benn=C3=A9e

