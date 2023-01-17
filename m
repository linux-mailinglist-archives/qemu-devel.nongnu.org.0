Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C09B66E627
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 19:35:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHqny-0004bG-VA; Tue, 17 Jan 2023 13:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqnm-0004KB-IH
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:35:27 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHqnk-00085K-Ul
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 13:35:18 -0500
Received: by mail-wr1-x434.google.com with SMTP id e3so22338196wru.13
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 10:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Beu7YnXQZqa6GdICBNlvRKBxMYle/r3EQ32yoKk4yoI=;
 b=ssd95jTRDAP7HqzU6zSB3niL/Sgg9c7IBfT4HhGdheCyT4yFSQzhrLRCGl20IA0+6V
 I91eowiSZtzgM+dERuEtoPJgtM8nxLYy76i2S6+f0eziROGCqShlXwrqXQwx76ag6gwC
 k0PXVrtfrZN6c7ef6QGTPF4mU2N6PNqdGl51S1bTaX43JmLhHL7HnQhg/0VYn/oKVCXX
 l09/HqnUJCPqAD8YGqwi6Nhm8vBNNoPFXI7W9mLu0Dw9ivZsAQNSGU8rcp8zzHerYR84
 atZ8XoYwgfQptM8FAYlSfBVaj2BVbNIjphVAd/hKVxZp94wDy57sNmP3stdj8HxynuNU
 y7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Beu7YnXQZqa6GdICBNlvRKBxMYle/r3EQ32yoKk4yoI=;
 b=wGcoe/a1m/aJRyXvAUVlDxDGbNg7nwtpQuSp9epTb7TZsu8w2o7Vq6xF5uqgDgA9sH
 fkkMGG+uyzZux+1tsTmJbqClBMlpFaCwYwBSk+VyBd7f3zdgwEs2QsxQ4deQgchNUy3d
 vwahHL9nUCxai5cwBwKmD7GifF+Sg84vf/yJF50VFC4L6SGrU5rRhVbulHPNMOEl1S3I
 Ms5IdjwMCdlgT5cwmlKr8g0PP7DzWynjicXY4GyDtJhZ6WN5iMC3FzIjaE103g2WhREv
 fayGFvs2ey1IXq7DKneMyubjAm/Ap7fGd5EouiZSKSET/jUmpVJs8u4nzFud2Ass6BSU
 cA7g==
X-Gm-Message-State: AFqh2kqF0VemMVzv4LLu3Ckhyuc518AYy2RjJlGi3T8xWiEf+3cQ0evq
 O8LcuL84j3h+I9zMW3YPK4cWhFxr+t+8/5Sp
X-Google-Smtp-Source: AMrXdXvUXt2ezgXGzm6lKZa71cK5W0bQuUdsgqlKzUjX9DrqeLHbA8A5BL5rFn+0N9SaY/oFHlIIfw==
X-Received: by 2002:a5d:66c6:0:b0:2bd:d966:7fff with SMTP id
 k6-20020a5d66c6000000b002bdd9667fffmr4182565wrw.20.1673980515272; 
 Tue, 17 Jan 2023 10:35:15 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a05600018ab00b002be2279f100sm2475985wri.96.2023.01.17.10.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 10:35:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 89C431FFB7;
 Tue, 17 Jan 2023 18:35:14 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-22-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 21/22] tcg/riscv: Introduce OPC_NOP
Date: Tue, 17 Jan 2023 18:35:08 +0000
In-reply-to: <20230109014248.2894281-22-richard.henderson@linaro.org>
Message-ID: <878ri1102l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/riscv/tcg-target.c.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 136fe54d4b..82ca86431e 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -267,6 +267,7 @@ typedef enum {
>  #endif
>=20=20
>      OPC_FENCE =3D 0x0000000f,
> +    OPC_NOP   =3D OPC_ADDI,   /* nop =3D addi r0,r0,0 */
>  } RISCVInsn;
>=20=20
>  /*
> @@ -403,7 +404,7 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int co=
unt)
>  {
>      int i;
>      for (i =3D 0; i < count; ++i) {
> -        p[i] =3D encode_i(OPC_ADDI, TCG_REG_ZERO, TCG_REG_ZERO, 0);
> +        p[i] =3D OPC_NOP;

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

