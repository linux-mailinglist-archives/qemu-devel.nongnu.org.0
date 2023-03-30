Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAE26D0773
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 15:58:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phslo-0003Y9-WB; Thu, 30 Mar 2023 09:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phsln-0003Y0-IS
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:56:51 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phslm-0007IF-25
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 09:56:51 -0400
Received: by mail-wr1-x430.google.com with SMTP id r11so19171368wrr.12
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 06:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680184608;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ycfhwpk08qz+ShG1fifZ8B9BRdFq/RcBzTBMkadRfBo=;
 b=PLRG0gmG6wPkEKvZFhlxaMRwSfzJvpxKXKAsFSWZMNnfZ89aMciSM0dLSz7Uskb31S
 q1lbwasOeIEvxBssJon32dwzrohmgdnSmzUz6/AiRvB/RtR6/R6xHkFzaSsDVfUSp/zT
 cQM6BMGRFA/zzqX54R0oe5eXPbzbnnUWMYdQ1EJKrZ3v7fpv+DJqJZCMDlcyoS4fiVmx
 STD3m9iek6N08OWFybncuEkFnYJ6oBWm7740OiXBFdEdv2iJzQUBZNpVm0uEYra5+67g
 H/DUQMyQpaUbwUprvoANRZM/16U0Gg4sU77R5/rpbjMXdRkCCwc2dggUQk0xjSGUhDXS
 ZT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680184608;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ycfhwpk08qz+ShG1fifZ8B9BRdFq/RcBzTBMkadRfBo=;
 b=J+WrJSwvajnKeexgMqsD0Q/qrsOe+/Sz9gtN/7XZ/LG9K+bvWOL0y1N9M9FOr/3e6B
 eOw2yGYvDFGzn8AnCYGOdZ3zT8vEbkqMCy2tgPoaQsONWSHwwFx/Lz8a7N8iIok0bZZv
 esO2Y/cUfGQBLWQxMkwKo2VVkfqsbZOk108xCz0nadCUuaCKIxg/XUDLlqcMnDQHC8D2
 an2+YBisie4t7WyUdLDwG7bQmcqJ3okXHlhFQleAJ1Z48dHiS/cTVl75XZqxDlJwsi18
 eHw/BBgt/ZT0Rh3MtnyJBp6gTBF2b2k/q6mKYOKvVIs9dfKqaae4PUvvVxgKMnxIblT8
 39Zw==
X-Gm-Message-State: AAQBX9cPzBBSPM+rZp9wUT1IMtan70jPtHAS5fvUTh/HnxaI5gXHil9I
 Z0YoWOzz3/t9FX2C2SmjFGEnfA==
X-Google-Smtp-Source: AKy350YXlulhiKzvIe0rRPhtCHq0UUpHKfIIGEoIz4ta6bU+5pFVoLK7TUf2AVbuLldnCpIE3vMCmw==
X-Received: by 2002:a05:6000:1206:b0:2d6:4733:c36f with SMTP id
 e6-20020a056000120600b002d64733c36fmr19197323wrx.23.1680184608441; 
 Thu, 30 Mar 2023 06:56:48 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a5d4d52000000b002d1e49cff35sm32831921wru.40.2023.03.30.06.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 06:56:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CB9A21FFB7;
 Thu, 30 Mar 2023 14:56:47 +0100 (BST)
References: <20230330113806.1458040-1-tan_hong_ze@163.com>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: tan_hong_ze <tan_hong_ze@163.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] target/loongarch: Enables plugins to get instruction codes
Date: Thu, 30 Mar 2023 14:56:43 +0100
In-reply-to: <20230330113806.1458040-1-tan_hong_ze@163.com>
Message-ID: <87mt3uny00.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


tan_hong_ze <tan_hong_ze@163.com> writes:

> Signed-off-by: tan_hong_ze <tan_hong_ze@163.com>
> ---
>  target/loongarch/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
> index 3bb63bfb3e..50d6b62f39 100644
> --- a/target/loongarch/translate.c
> +++ b/target/loongarch/translate.c
> @@ -198,7 +198,7 @@ static void loongarch_tr_translate_insn(DisasContextB=
ase *dcbase, CPUState *cs)
>      CPULoongArchState *env =3D cs->env_ptr;
>      DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
>=20=20
> -    ctx->opcode =3D cpu_ldl_code(env, ctx->base.pc_next);
> +    ctx->opcode =3D translator_ldl(env, &ctx->base, ctx->base.pc_next);
>=20=20
>      if (!decode(ctx, ctx->opcode)) {
>          qemu_log_mask(LOG_UNIMP, "Error: unknown opcode. "

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

