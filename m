Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D3F6D4568
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:13:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjJzC-000258-S5; Mon, 03 Apr 2023 09:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjJzA-00024a-2O
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:12:36 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjJz8-0007N9-DT
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:12:35 -0400
Received: by mail-wr1-x432.google.com with SMTP id q19so26232992wrc.5
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680527552;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y7tHL/IfRHcA10XetAwyq4ROklU2LkCbb8o3g9E+gfk=;
 b=VwZ90rwzLtKiJccc1OvBoNyS6JfPmpxICSa2Htm9NrOBAtdKrX+lTSt8o9FKSZF0Wx
 243xJDV7Sb6dw5Mvn1WrXI2Dz4D/Nd6r3oiC8Kyv0NY4HIsRbZXrnHVHTCFYiUkWzjss
 x8Ui7QClFg9EKyJsg9l4M9XbLuVNnFdffB0enFYhIMIfPEpveKFaVOJ1wwcE2Uk9mKYU
 ueEPZu/jgFl7ILbpmZQPN6QhNPHpaDPYIPv/NvdvjaYhmxOYTjh5SJVkKyfv/s4LiN9v
 Arif0GH/dFIpEgp9kqWMVWBLro0P4h/mtUS8xnuY5WcRK5UMpzSzf/PL7NL97JaqCTRb
 Q8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680527552;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=y7tHL/IfRHcA10XetAwyq4ROklU2LkCbb8o3g9E+gfk=;
 b=JeGw7S3Vk9W0IvhLXYBlDxSf8wuvGVINBfSjPDuI3ZpV0jKfNflqx4WcueyNDtIg33
 soQ8HQQWnVNJa15y30B8dOYtOMAM88QTin3mkyd/XMunAXT1uueWlxaMhuXzAN/HN9dw
 di885fbAkVIVWzajXzLho+V8T13pIHEPb/3kI5MrPIcq5afl8H1o7Jv+XNr0/0X6Fk82
 eIfZEAfE5jE4aegOzvY68X4zpN8W9WlDqp+GkAXzdPWmO1vdARz9iiBNuPXIkPjiNXBQ
 FvJNLCOFdsVuUXy8UBT6k0uRkQRlMBtseRMute88N8dTv+fLIPyhn/oNVsimngdICXlL
 dDbQ==
X-Gm-Message-State: AAQBX9esZUig6xoTcU8uwyBoDZkXGgYPaHWjoZ8vDHL9asAF6KdcTQhv
 EuR/g74pcX/uhQAR5ao7cn+J0UvX+ZSCyk841UA=
X-Google-Smtp-Source: AKy350ZclOeoOL09EWTv0xk+tYdluZeDHouKU8fGc2oXhUp3u+BYxBrxB1IW4ZkffqGDcgvTwL9Riw==
X-Received: by 2002:a5d:4cc1:0:b0:2e4:abb1:3e8b with SMTP id
 c1-20020a5d4cc1000000b002e4abb13e8bmr10576148wrt.25.1680527552478; 
 Mon, 03 Apr 2023 06:12:32 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a5d5606000000b002c71b4d476asm9625757wrv.106.2023.04.03.06.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 06:12:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C6CAF1FFB7;
 Mon,  3 Apr 2023 14:12:31 +0100 (BST)
References: <20230330124600.1523026-1-tanhongze@loongson.cn>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: tanhongze <tanhongze@loongson.cn>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] target/loongarch: Enables plugins to get instruction
 codes
Date: Mon, 03 Apr 2023 14:11:56 +0100
In-reply-to: <20230330124600.1523026-1-tanhongze@loongson.cn>
Message-ID: <87r0t1m7nk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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


tanhongze <tanhongze@loongson.cn> writes:

> Signed-off-by: tanhongze <tanhongze@loongson.cn>

It looks like you've missed the review tags from the last posting.

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

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


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

