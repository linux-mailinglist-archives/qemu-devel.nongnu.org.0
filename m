Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB2B37F470
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 10:51:28 +0200 (CEST)
Received: from localhost ([::1]:50184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh743-0003GN-75
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 04:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh6x6-0004mN-MZ
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:44:16 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh6x4-0003ir-Mg
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:44:16 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 b11-20020a7bc24b0000b0290148da0694ffso986587wmj.2
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 01:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Fkrc2NJretOOUV5Ntme5wds6sfjrwnbukiglr/agDl0=;
 b=xdmIOz0Pe3Fs5tVp03W19NEgsoAuy9GlNxSxbicPqTwRpU2xXE9N0HoXpAn5d+CYMn
 IzTIUEGbiGEpWgPRc4IuR/IvQ2GaRrkpp32a7G8Yzry+rzUY1BlzLeksju/ZrBMkIcbr
 4K6TYfelKBAtwMR/BDvvkOhrQcpYQlRL+cch71aNz+8HxhbrZM0aB7KjTSrsYkWcN1p6
 G/WS2yxQ0By5siRLuB+N0Xr9/6MejhnHmYpsUnJ/B5pVtNV7FAxbCakXHvmlBynwqXfy
 c4FJcSCTuA87g2zVBLMi9jAcsGunT8CITPMd/u0ztd2BtATGbbmXepu9XNcv31ytWpLF
 BaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Fkrc2NJretOOUV5Ntme5wds6sfjrwnbukiglr/agDl0=;
 b=C0hb835NHYwtkC4HkLyC+XOjr94yF1Kpjug2+0TXECl7k95FTrjKigngmWXd3oIRNp
 S/0/EJX3wVzuuBt5jJywi/R+G4YgL3doO0q5DW9/XgppV98CaaGW9sB2aTkFsGjamoBH
 foy4RN0z2DCEpKGRj648KO1CbffHIdCIE70QJ58jYlhWM5HyNDyg3Gtyl8tTOUdpmih/
 7d3NKKku4l06wer9uDjbBsj19FlQs2nMdOoIHUrmqBLY6uOOAoCt2LlmDgliJ6zUyQtp
 vIHvQoDVyRll+iqLOiggef9kz20IFPXx1iiB7ACr2VAyQYr+UX+6EkZtjzG03k9+kaXW
 vmIw==
X-Gm-Message-State: AOAM533PbBc14sqJyCZidPseQ9TTixxsOwjIKqdnxIjBy5PkGyBxTmno
 zZ2ZvX/FHXC3g3GBZPCOzeGuoA==
X-Google-Smtp-Source: ABdhPJxHJNNgVGXrMcliNq/10oZs/LbreIEz/C1UNpRVvU103pxX+ULWOcI2qrUVkAqxImwTy3B+8A==
X-Received: by 2002:a1c:9842:: with SMTP id a63mr2625085wme.125.1620895452085; 
 Thu, 13 May 2021 01:44:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n12sm1630569wmq.29.2021.05.13.01.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 01:44:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D5A7C1FF7E;
 Thu, 13 May 2021 09:44:09 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-27-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 26/72] softfloat: Convert float128_silence_nan to parts
Date: Thu, 13 May 2021 09:34:27 +0100
In-reply-to: <20210508014802.892561-27-richard.henderson@linaro.org>
Message-ID: <8735urf2g6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This is the minimal change that also introduces float128_params,
> float128_unpack_raw, and float128_pack_raw without running into
> unused symbol Werrors.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  fpu/softfloat.c                | 96 +++++++++++++++++++++++++++++-----
>  fpu/softfloat-specialize.c.inc | 25 +++------
>  2 files changed, 89 insertions(+), 32 deletions(-)
>
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 2d6f61ee7a..073b80d502 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -500,14 +500,12 @@ static inline __attribute__((unused)) bool is_qnan(=
FloatClass c)
>  }
>=20=20
>  /*
> - * Structure holding all of the decomposed parts of a float. The
> - * exponent is unbiased and the fraction is normalized. All
> - * calculations are done with a 64 bit fraction and then rounded as
> - * appropriate for the final format.
> + * Structure holding all of the decomposed parts of a float.
> + * The exponent is unbiased and the fraction is normalized.
>   *
> - * Thanks to the packed FloatClass a decent compiler should be able to
> - * fit the whole structure into registers and avoid using the stack
> - * for parameter passing.
> + * The fraction words are stored in big-endian word ordering,
> + * so that truncation from a larger format to a smaller format
> + * can be done simply by ignoring subsequent elements.
>   */
>=20=20
>  typedef struct {
> @@ -526,6 +524,15 @@ typedef struct {
>      };
>  } FloatParts64;
>=20=20
> +typedef struct {
> +    FloatClass cls;
> +    bool sign;
> +    int32_t exp;
> +    uint64_t frac_hi;
> +    uint64_t frac_lo;
> +} FloatParts128;
> +
> +/* These apply to the most significant word of each FloatPartsN. */
>  #define DECOMPOSED_BINARY_POINT    63
>  #define DECOMPOSED_IMPLICIT_BIT    (1ull << DECOMPOSED_BINARY_POINT)
>=20=20
> @@ -561,11 +568,11 @@ typedef struct {
>      .exp_bias       =3D ((1 << E) - 1) >> 1,                           \
>      .exp_max        =3D (1 << E) - 1,                                  \
>      .frac_size      =3D F,                                             \
> -    .frac_shift     =3D DECOMPOSED_BINARY_POINT - F,                   \
> -    .frac_lsb       =3D 1ull << (DECOMPOSED_BINARY_POINT - F),         \
> -    .frac_lsbm1     =3D 1ull << ((DECOMPOSED_BINARY_POINT - F) - 1),   \
> -    .round_mask     =3D (1ull << (DECOMPOSED_BINARY_POINT - F)) - 1,   \
> -    .roundeven_mask =3D (2ull << (DECOMPOSED_BINARY_POINT - F)) - 1
> +    .frac_shift     =3D (-F - 1) & 63,                                 \
> +    .frac_lsb       =3D 1ull << ((-F - 1) & 63),                       \
> +    .frac_lsbm1     =3D 1ull << ((-F - 2) & 63),                       \
> +    .round_mask     =3D (1ull << ((-F - 1) & 63)) - 1,                 \
> +    .roundeven_mask =3D (2ull << ((-F - 1) & 63)) - 1
>

I have to admit I find the switch to (-F - 1) & 63 a little black
magical. Isn't the shift always going to end up a factor of the number
of exponent bits we need to move past and the natural size of the
original float?

Anyway my personal brain twisting aside it obviously works and
everything else looks fine so:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

