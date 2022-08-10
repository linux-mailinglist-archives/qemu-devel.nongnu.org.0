Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E7458ED83
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:42:58 +0200 (CEST)
Received: from localhost ([::1]:43716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlz7-0001eM-51
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlaM-0003yL-V6
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:17:22 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:34680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlaK-0003xO-SX
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:17:22 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso1582634wmq.1
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=H0PIRdNwWizlOoR1Xydn0eh/sthd+R7JdmhFuvwtIQo=;
 b=D4fai9J/eG9Txvzj/0YF6yV1ULYHj2Gjq/wt1rn3joqyKB8EvRc15Tf2CU11CDDVnm
 lPg2jCWJ5UffnD+iseCYiAr0BybVaO05SsrthEnwZbId083ATxG9KkoF2+D0Go8XUer5
 g7ElPYJYLUQhVgZfxE873z4Oq2c8VFNBG91OxTuiZibetoFlIdlkwa7pHYU5zWhonMOk
 Rt9HJTOiYXnIWcbZDJa0m/MchlQGkORWsR2+n2xKhsROF3rnBV3UmE+13pSG7GXpn8Fu
 XGekzCmMARtbEfSDJGkYhqBXOI8GZE0uVlobBQ9FzAInAwOvrN5b41PVYrikVGXKQaMY
 QkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=H0PIRdNwWizlOoR1Xydn0eh/sthd+R7JdmhFuvwtIQo=;
 b=jqmXn208JhaphwnD5+g6XzXxZggRTLSQYruMJ0vsSayptM9XmpdP9C4oSqAgwnMfhr
 krh2HsMn8L7JI6nMyTSO/g8LdAxDLO0hbGtTJXywo6AihrocAjzhwY19gmf7TygQsxe3
 zRNqJWwSG889yUCznTNfTQXkZJnff0uwJ/Q9SQ8NAw/lOhzCuIIjng3WKuxZdjUiVbfp
 LT9Rf7elM5gRnEvkUoasx4KjRngiQ8CGpujgyaX/OCH+rAuxI8W803jpJyANfUxUu30g
 e9v19ikNIQ/HPTSXRAVMlH4KlJ+9G2lfsOHKF9mBeoenEhXG0P/J4xW+SzG/br8O+lPk
 KPJA==
X-Gm-Message-State: ACgBeo0u9dQR5mwOpgf2DlvIAKp235NdQ68l7G6Zn5a0h9jvnuG66ACo
 OwjFARXmUt+y9rP1wY+f8xGcnA==
X-Google-Smtp-Source: AA6agR67O2wZzDid/YuGzUXbFgsOqkXYqLAbCDrPMm/bfSKGvX7udXRZqcFoF0ciJOKhe89YFzn5yA==
X-Received: by 2002:a1c:3543:0:b0:3a5:3974:f0dd with SMTP id
 c64-20020a1c3543000000b003a53974f0ddmr2414688wma.171.1660137438165; 
 Wed, 10 Aug 2022 06:17:18 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a05600010c300b002206261cb6esm16018759wrx.66.2022.08.10.06.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:17:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D256B1FFB7;
 Wed, 10 Aug 2022 14:17:16 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-23-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 22/62] target/arm: Add secure parameter to
 get_phys_addr_pmsav8
Date: Wed, 10 Aug 2022 14:16:35 +0100
In-reply-to: <20220703082419.770989-23-richard.henderson@linaro.org>
Message-ID: <87fsi4kzkz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Remove the use of regime_is_secure from get_phys_addr_pmsav8.
> Since we already had a local variable named secure, use that.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index d424dec729..f7892a0c48 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1960,10 +1960,9 @@ void v8m_security_lookup(CPUARMState *env, uint32_=
t address,
>=20=20
>  static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
>                                   MMUAccessType access_type, ARMMMUIdx mm=
u_idx,
> -                                 GetPhysAddrResult *result,
> +                                 bool secure, GetPhysAddrResult
>  *result,

NIT: why not use is_secure like all the other functions (and reformat
the commit subject to match too).

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

