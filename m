Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B192E4A691B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 01:14:08 +0100 (CET)
Received: from localhost ([::1]:43088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF3Hj-0001Aq-BM
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 19:14:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEzrG-0000op-Mm
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 15:34:34 -0500
Received: from [2a00:1450:4864:20::330] (port=55106
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEzrB-000337-A3
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 15:34:34 -0500
Received: by mail-wm1-x330.google.com with SMTP id c192so13636606wma.4
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 12:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=kX/APOMTZT9B9dAN88pTnRh5A71LxrDbf7sUAwsed0M=;
 b=TyWVP0O+lLVt0Lrgy/CBP8aoBr3xTTc3JWbOIksbbVoxkWzM/24JX8ynlyLljdwz8N
 eUtH40tY0LLpCuv5tGmnuFASfulGXJ+INNXSD2Llo1QPY2rh2744Jw6yCp2OI+TIykSj
 XR/H7ruOdwHnlHPqeHOqHGu5TBsYM2pUxyJ9iLylo7syntr/zR9V/rs7LkkPMXdlcjyv
 cwwM/VIZy7R+Tf8XOjmgWlLJolRxFs+hFb1f3nCvTQhM7JC8Y7lJaV7wI/pg6l/TMkdX
 trw3lO8e8/SfFlNmiUQZ1gBWd1rj0uPUA+j8xRidYigS6eVCgQ+UhLoiSk/CP9C5ZFrv
 2NCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=kX/APOMTZT9B9dAN88pTnRh5A71LxrDbf7sUAwsed0M=;
 b=Sp7Gw2OzjNgOTfGg3DQkOaru1b/ZUiutO48anRdvg+o0bZadPqLgDPTpWSxu3rxj5/
 2t4e+lP3uiconeKHHt2C2RS+Mommq9fOmV9RvbDrqMiZQO1fuNBkL0c2npFu9q3usf6S
 SLGpqzSHALoQdDGHweSDmEBVs0eIqZKuS1Y958YPhsEQ6FXSEnltyxLztWyWIIZacDaQ
 ExOHr0BsV34CcuOvC3I/hRI5K347my1XaRd8Zobqdc0MPjqLK504t5SpFj4tCJw3IVII
 na4B8xvKlW5F3rYcQj8C00isPdPtK9w9X70G6ZpRJZ4kxA2yQDpz/vZl/QI+ZP/DBeFb
 NMrQ==
X-Gm-Message-State: AOAM532hyKOS1j2fe2oSY8iC70i+ee/dmTpuSpJcffw8ifitIfijiYsm
 8T5nvrFGRcw7Omhx02KyGStqlGsU4fWEVw==
X-Google-Smtp-Source: ABdhPJzPecRfYwroEdGuUlWYngfPpDLl6GtcBLJs0DaxkjqMf6QzYGRobHKBR5jv0yiSNtDtK+SfIg==
X-Received: by 2002:a05:600c:5027:: with SMTP id
 n39mr3269224wmr.14.1643747614143; 
 Tue, 01 Feb 2022 12:33:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 44sm15449118wrm.103.2022.02.01.12.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 12:33:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B91501FFB7;
 Tue,  1 Feb 2022 20:33:32 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-9-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 08/20] tcg/i386: Implement avx512 variable shifts
Date: Tue, 01 Feb 2022 20:33:29 +0000
In-reply-to: <20211218194250.247633-9-richard.henderson@linaro.org>
Message-ID: <87h79iwcmb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

> AVX512VL has VPSRAVQ, and
> AVX512BW has VPSLLVW, VPSRAVW, VPSRLVW.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tcg/i386/tcg-target.c.inc | 32 ++++++++++++++++++++++++--------
>  1 file changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index 316e550b38..7b9302fcc2 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -418,9 +418,13 @@ static bool tcg_target_const_match(int64_t val, TCGT=
ype type, int ct)
>  #define OPC_VPBROADCASTQ (0x59 | P_EXT38 | P_DATA16)
>  #define OPC_VPERMQ      (0x00 | P_EXT3A | P_DATA16 | P_VEXW)
>  #define OPC_VPERM2I128  (0x46 | P_EXT3A | P_DATA16 | P_VEXL)
> +#define OPC_VPSLLVW     (0x12 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
>  #define OPC_VPSLLVD     (0x47 | P_EXT38 | P_DATA16)
>  #define OPC_VPSLLVQ     (0x47 | P_EXT38 | P_DATA16 | P_VEXW)
> +#define OPC_VPSRAVW     (0x11 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
>  #define OPC_VPSRAVD     (0x46 | P_EXT38 | P_DATA16)
> +#define OPC_VPSRAVQ     (0x46 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
> +#define OPC_VPSRLVW     (0x10 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
>  #define OPC_VPSRLVD     (0x45 | P_EXT38 | P_DATA16)
>  #define OPC_VPSRLVQ     (0x45 | P_EXT38 | P_DATA16 | P_VEXW)
>  #define OPC_VZEROUPPER  (0x77 | P_EXT)
> @@ -2742,16 +2746,13 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpco=
de opc,
>          OPC_PMAXUB, OPC_PMAXUW, OPC_PMAXUD, OPC_UD2
>      };
>      static int const shlv_insn[4] =3D {
> -        /* TODO: AVX512 adds support for MO_16.  */
> -        OPC_UD2, OPC_UD2, OPC_VPSLLVD, OPC_VPSLLVQ
> +        OPC_UD2, OPC_VPSLLVW, OPC_VPSLLVD, OPC_VPSLLVQ
>      };
>      static int const shrv_insn[4] =3D {
> -        /* TODO: AVX512 adds support for MO_16.  */
> -        OPC_UD2, OPC_UD2, OPC_VPSRLVD, OPC_VPSRLVQ
> +        OPC_UD2, OPC_VPSRLVW, OPC_VPSRLVD, OPC_VPSRLVQ
>      };
>      static int const sarv_insn[4] =3D {
> -        /* TODO: AVX512 adds support for MO_16, MO_64.  */
> -        OPC_UD2, OPC_UD2, OPC_VPSRAVD, OPC_UD2
> +        OPC_UD2, OPC_VPSRAVW, OPC_VPSRAVD, OPC_VPSRAVQ
>      };
>      static int const shls_insn[4] =3D {
>          OPC_UD2, OPC_PSLLW, OPC_PSLLD, OPC_PSLLQ
> @@ -3242,9 +3243,24 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType typ=
e, unsigned vece)
>=20=20
>      case INDEX_op_shlv_vec:
>      case INDEX_op_shrv_vec:
> -        return have_avx2 && vece >=3D MO_32;
> +        switch (vece) {
> +        case MO_16:
> +            return have_avx512bw;
> +        case MO_32:
> +        case MO_64:
> +            return have_avx2;
> +        }
> +        return 0;
>      case INDEX_op_sarv_vec:
> -        return have_avx2 && vece =3D=3D MO_32;
> +        switch (vece) {
> +        case MO_16:
> +            return have_avx512bw;
> +        case MO_32:
> +            return have_avx2;
> +        case MO_64:
> +            return have_avx512vl;
> +        }
> +        return 0;
>      case INDEX_op_rotlv_vec:
>      case INDEX_op_rotrv_vec:
>          return have_avx2 && vece >=3D MO_32 ? -1 : 0;


--=20
Alex Benn=C3=A9e

