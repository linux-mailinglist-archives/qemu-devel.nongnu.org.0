Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7EB50B976
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 16:05:14 +0200 (CEST)
Received: from localhost ([::1]:51406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtuK-0003mi-AQ
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 10:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhtpE-0008Ul-8d
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:59:56 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhtpC-0006Jm-N5
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:59:55 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x18so11237676wrc.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 06:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PdHNXEcoqI/vc0q6rhL59Z2Wxh9z47HofcxA3yPmCgc=;
 b=lopu5j/znHimn2uXZGvTL10rQt4JfWrTu93+VEHtqjfYtqcd85usBzzobnypQeh2g0
 0kyJz5jz/M88qn8IeAOv2WaLAA486PLDVvqIN9GOLerkEvgpaPpxf6AAckfW1bIM4Aa9
 ejTlR05wzf+a1mtVZp39Z9eNLOq+E2PHFVv7o3T1vtN/0dv948nzBCHme68gATB1zqx4
 t+G/ykiXJO+l0d2JKQ/+fe8mmd7Re71jMHt7jqDK2n30kJOFN1B7pGL0w68eZtTR+rvA
 /+/N8OoXw0+U3HeSWMtWuJWbHhqe6s/PvD+b7S+Ca/mq/LjA2qExTtSW+XJF7M+tPAIG
 X8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PdHNXEcoqI/vc0q6rhL59Z2Wxh9z47HofcxA3yPmCgc=;
 b=TE9AoVREJ6lE6S/FKNKbR+WJ/gExlGKz5nTkMHI2BZ1px6q+Sv4yEB8AOdOvYHe372
 ztBkcvv/SMTJcRdUxLtf8taanssl3l3g8uxtNfOKmq4N3os1JEdAiOklEKQJZLHECvYy
 dx0eBKs3dESY14bQwhOYAR5a+GiOjM8zFLANFe5Z6w9Axs2Np8G8u7ttMzNzPREA4S8R
 d9gqICHtFyU/OQR13tdKONuzOao1mVF8e4B8LN6nDkC5XnfaNOIH5qkvedKJld3i7XLj
 G85N5K8eCZyS6mopJpJZY0XuTK5UTqU7rQ6FsqL8Lpk0CcOfZVApp3EzJFBKNmQyeQUE
 gOtw==
X-Gm-Message-State: AOAM531pi2wExfIQJcUfXvyPvTaeegcFygl5X6HeclIZoz1Mp7/F0lU/
 LCMKP4MW2NkvuhRT84PUthWWPA==
X-Google-Smtp-Source: ABdhPJz6ShA9gnv2Tq1twi7gFIsr3oJV5UBHYM28mJj5iEwgaHMe0GFsCQ/U1Ico4NoGXGdcu9awbA==
X-Received: by 2002:adf:da49:0:b0:204:1548:2a58 with SMTP id
 r9-20020adfda49000000b0020415482a58mr3886817wrl.664.1650635993094; 
 Fri, 22 Apr 2022 06:59:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 20-20020a05600c22d400b0038c8dbdc1a3sm1703028wmg.38.2022.04.22.06.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 06:59:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E151D1FFB7;
 Fri, 22 Apr 2022 14:59:50 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-9-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 08/60] target/arm: Change DisasContext.thumb to bool
Date: Fri, 22 Apr 2022 14:59:19 +0100
In-reply-to: <20220417174426.711829-9-richard.henderson@linaro.org>
Message-ID: <875yn1uskp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

> Bool is a more appropriate type for this value.
> Move the member down in the struct to keep the
> bool type members together and remove a hole.

Does gcc even attempt to pack bools? Aren't they basically int types?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h     | 2 +-
>  target/arm/translate-a64.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index 8b7dd1a4c0..050d80f6f9 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -30,7 +30,6 @@ typedef struct DisasContext {
>      bool eci_handled;
>      /* TCG op to rewind to if this turns out to be an invalid ECI state =
*/
>      TCGOp *insn_eci_rewind;
> -    int thumb;
>      int sctlr_b;
>      MemOp be_data;
>  #if !defined(CONFIG_USER_ONLY)
> @@ -65,6 +64,7 @@ typedef struct DisasContext {
>      GHashTable *cp_regs;
>      uint64_t features; /* CPU features bits */
>      bool aarch64;
> +    bool thumb;
>      /* Because unallocated encodings generate different exception syndro=
me
>       * information from traps due to FP being disabled, we can't do a si=
ngle
>       * "is fp access disabled" check at a high level in the decode tree.
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 4dad23db48..be7283b966 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -14670,7 +14670,7 @@ static void aarch64_tr_init_disas_context(DisasCo=
ntextBase *dcbase,
>       */
>      dc->secure_routed_to_el3 =3D arm_feature(env, ARM_FEATURE_EL3) &&
>                                 !arm_el_is_aa64(env, 3);
> -    dc->thumb =3D 0;
> +    dc->thumb =3D false;
>      dc->sctlr_b =3D 0;
>      dc->be_data =3D EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
>      dc->condexec_mask =3D 0;


--=20
Alex Benn=C3=A9e

