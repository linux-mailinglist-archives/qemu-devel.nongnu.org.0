Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAF04A7378
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 15:44:14 +0100 (CET)
Received: from localhost ([::1]:43840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFGrf-0007OQ-3j
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 09:44:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFGNZ-0004jd-Bl
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:13:01 -0500
Received: from [2a00:1450:4864:20::535] (port=44939
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFGNW-0004cr-IO
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:13:01 -0500
Received: by mail-ed1-x535.google.com with SMTP id u24so41973696eds.11
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 06:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=whbUSRlj8aCoilxvk+rLNLTLvvPNOuHeHLdvc/0i6Ww=;
 b=Q64JoubV1Yv4FAT7LIuU2Ooim3XliBWj+ZHeFVVnSF5eIzl6Hlcd2MliSMQBkNMWKm
 mMgX6qwod7xBsnt9JPdZosCI2+8SybAxqR8Aiu197gR1qQ53dwoybQO6DsivmPM6JK5q
 6Ubsaxa338eAgXtY51/galJJReaDuARhSp8H72hX2xLSShSdWflCJNht9YJic+Ab1CJ1
 5JOym5eNNX0WDnpjbxHJ7buxhxm9+FXsV8NYXO6NraxEYbnqdIf+YsN81N4Ha0tYGgDx
 VE7ODOwZbpVKdnAEdtN+ziCT+3Yq9MWsTh/spNsRcUaS+/VS3tAvBNn+uqhX5aEwtW/V
 fNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=whbUSRlj8aCoilxvk+rLNLTLvvPNOuHeHLdvc/0i6Ww=;
 b=TqyOORAc29ryo/Zd5cAg60IDoaS91Yq/IklEhnpnHwDF9ogi+02WpXpOTxePEzd01L
 QV2udaomLk4ZfO5kSPfOW7EDnoQrjF3he6mDgvTkURya1Jk8qiWRLhL3wG6PAF1n1/w+
 M3oLHa1ZGXbQ0X9Xj5yrCZ4hog/dNEXMC0TX9c8xVbEw341Y+XXgpLsoHNlxySx0jKnU
 TEa2qJaY23YUdH/La4f7N7pKC8GM7ONk0CzUxXayushQPTGNjFsBBkWKId1pD51WKlFU
 ld/Tixa3zlwhPJvsjeNIj1n0NecFSvMwrKJNe62DkAY2C5OvJsV28BhdRgspoji3pCbn
 xi0w==
X-Gm-Message-State: AOAM5331z6iL61fJ3ziYHXPoEhnvRrAs6T6WhT7OKsh+bgKFcbAZ4rrN
 mVBmdXM2/1fgAGq8bT0f8jjp1A==
X-Google-Smtp-Source: ABdhPJxdPcBMXgyvc/v4wQkIxtC+ojx6Bajl2iVMPthxUpQYilAetiIiGQRdE9nYpLAajRHIH6Lqfw==
X-Received: by 2002:a05:6402:4411:: with SMTP id
 y17mr30355334eda.175.1643811176814; 
 Wed, 02 Feb 2022 06:12:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d2sm15731242ejw.79.2022.02.02.06.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 06:12:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2290C1FFB7;
 Wed,  2 Feb 2022 14:12:55 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-12-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 11/20] tcg/i386: Implement avx512 immediate rotate
Date: Wed, 02 Feb 2022 14:05:24 +0000
In-reply-to: <20211218194250.247633-12-richard.henderson@linaro.org>
Message-ID: <87wniduzko.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> AVX512VL has VPROLD and VPROLQ, layered onto the same
> opcode as PSHIFTD, but requires EVEX encoding and W.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target.h     |  2 +-
>  tcg/i386/tcg-target.c.inc | 15 +++++++++++++--
>  2 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
> index 12d098ad6c..38c09fd66c 100644
> --- a/tcg/i386/tcg-target.h
> +++ b/tcg/i386/tcg-target.h
> @@ -195,7 +195,7 @@ extern bool have_movbe;
>  #define TCG_TARGET_HAS_not_vec          0
>  #define TCG_TARGET_HAS_neg_vec          0
>  #define TCG_TARGET_HAS_abs_vec          1
> -#define TCG_TARGET_HAS_roti_vec         0
> +#define TCG_TARGET_HAS_roti_vec         have_avx512vl
>  #define TCG_TARGET_HAS_rots_vec         0
>  #define TCG_TARGET_HAS_rotv_vec         0
>  #define TCG_TARGET_HAS_shi_vec          1
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index c4e6f2e5ea..5ab7c4c0fa 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -361,7 +361,7 @@ static bool tcg_target_const_match(int64_t val, TCGTy=
pe type, int ct)
>  #define OPC_PSHUFLW     (0x70 | P_EXT | P_SIMDF2)
>  #define OPC_PSHUFHW     (0x70 | P_EXT | P_SIMDF3)
>  #define OPC_PSHIFTW_Ib  (0x71 | P_EXT | P_DATA16) /* /2 /6 /4 */
> -#define OPC_PSHIFTD_Ib  (0x72 | P_EXT | P_DATA16) /* /2 /6 /4 */
> +#define OPC_PSHIFTD_Ib  (0x72 | P_EXT | P_DATA16) /* /1 /2 /6 /4 */
>  #define OPC_PSHIFTQ_Ib  (0x73 | P_EXT | P_DATA16) /* /2 /6 /4 */
>  #define OPC_PSLLW       (0xf1 | P_EXT | P_DATA16)
>  #define OPC_PSLLD       (0xf2 | P_EXT | P_DATA16)
> @@ -2906,6 +2906,14 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcod=
e opc,
>              insn |=3D P_VEXW | P_EVEX;
>          }
>          sub =3D 4;
> +        goto gen_shift;
> +    case INDEX_op_rotli_vec:
> +        insn =3D OPC_PSHIFTD_Ib | P_EVEX;  /* VPROL[DQ] */
> +        if (vece =3D=3D MO_64) {
> +            insn |=3D P_VEXW;
> +        }
> +        sub =3D 1;
> +        goto gen_shift;

This could just be a /* fall-through */ although given the large amount
of gotos the switch statement is gathering I'm not sure it makes too
much difference.

Is there any reason why gen_shift couldn't be pushed into a helper
function so we just had:

    static void tcg_out_vec_shift(s, vece, insn, sub, a0, a1, a2) {
        tcg_debug_assert(vece !=3D MO_8);
        if (type =3D=3D TCG_TYPE_V256) {
            insn |=3D P_VEXL;
        }
        tcg_out_vex_modrm(s, insn, sub, a0, a1);
        tcg_out8(s, a2);
    }

    ...

    case INDEX_op_rotli_vec:
        insn =3D OPC_PSHIFTD_Ib | P_EVEX;  /* VPROL[DQ] */
        if (vece =3D=3D MO_64) {
            insn |=3D P_VEXW;
        }
        tcg_out_vec_shift(s, vece, insn, 1, a0, a1, a2);
        break;

Surely the compiler would inline if needed (and even if it didn't it the
code generation that critical we care about a few cycles)?


--=20
Alex Benn=C3=A9e

