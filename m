Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8329F5578B6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 13:30:19 +0200 (CEST)
Received: from localhost ([::1]:33880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4L2Q-00050J-38
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 07:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4KxN-000349-DU
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 07:25:09 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:36837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4KxJ-0008BQ-1k
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 07:25:03 -0400
Received: by mail-yb1-xb29.google.com with SMTP id u9so25127149ybq.3
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 04:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AOH6eIuL0aIpPL+ItqXK2B9mSn8bjv/xgbmvR4pYTiU=;
 b=WkRznGrv59P/wrtQR62iESf/26lcWdObJsnXgSz9a81vytwuU1zDuLU+VHzOz9vE20
 fiQhOWU+21aClmxpLcufpjaBL95LPx4zCJdgHyAFDUpza+ry95I4qnpny52SMT/ZKYhi
 AVU9/nOM3rJ6eIh98HWY7gvUag8FPnG6or60gyHi2FaGj3QKxd1UDE5dBWE3bblu3L31
 xD2hbciIjBFtzUvg7JElRXJ0rvPhYXqPDgzXL1MnTGkYEminvdk5neupgbMtI6DyuMYA
 b6PwnoMPN3/nxXxFSWlvqOm5LjYHADx5gYtHfTHHMKzoosAaiORdyrldWu+p41H/TuuL
 swaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AOH6eIuL0aIpPL+ItqXK2B9mSn8bjv/xgbmvR4pYTiU=;
 b=DwIOOubsJtpefGU+EM3UpJaSvMLGMcdMyZYW5OwoFxZNdN3QqcjM9qaz4xsIA7gSQ3
 bA1RjodOvS2qNhnK2nhI3Hc99kzALIx+rvjSx4riptYAJqqRD/JgjBy59C2BGSn8ofeQ
 EPHA2foFNFsxaMQSRuR5jM+JGZ6rQ3VpB04rAjeK1OsmCGxrgp9b44Xdup203pTltqrU
 QPudpPxEDYuLZX57Cmb1XcLZBAL+0I2F07n/MRWhCfn5preN1ALAM1WmQ0IvgpyYPoMG
 3p5jQPRe0NlK7rZrtnTm2DuF+Of+rLg/XYYM8tuSUq+Pfe47tFqwSLMz/RrkRcgu7IOg
 LYLg==
X-Gm-Message-State: AJIora+NrxnR9VbgSHlmUXX0UxcCUJaTqgpEFcMzosU1dqtr5V1X9I3I
 lcovNmUB72GTt1o7ahpETEp+esT4JEKF2byceou6PA==
X-Google-Smtp-Source: AGRyM1sE63Ei8AHBDiGXfuu0DdqdNZb6YiDhGsVivC0yMNoofN8E9jJAni9ztzLuMKRyVyJVgL1Kvt1JAnHajDCzTos=
X-Received: by 2002:a05:6902:1505:b0:668:c93b:d1d0 with SMTP id
 q5-20020a056902150500b00668c93bd1d0mr8764321ybu.140.1655983499639; Thu, 23
 Jun 2022 04:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-26-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 12:24:48 +0100
Message-ID: <CAFEAcA-_Cof12Oe=4HTJx_4Nmtfq1Oj7BRdFmzv989H13kUVTg@mail.gmail.com>
Subject: Re: [PATCH v3 25/51] target/arm: Implement SME MOVA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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

On Mon, 20 Jun 2022 at 19:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We can reuse the SVE functions for implementing moves to/from
> horizontal tile slices, but we need new ones for moves to/from
> vertical tile slices.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sme.h    |  11 ++++
>  target/arm/helper-sve.h    |   2 +
>  target/arm/translate-a64.h |   9 +++
>  target/arm/translate.h     |   5 ++
>  target/arm/sme.decode      |  15 +++++
>  target/arm/sme_helper.c    | 110 ++++++++++++++++++++++++++++++++++++-
>  target/arm/sve_helper.c    |  12 ++++
>  target/arm/translate-a64.c |  19 +++++++
>  target/arm/translate-sme.c | 105 +++++++++++++++++++++++++++++++++++
>  9 files changed, 287 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
> index c4ee1f09e4..600346e08c 100644
> --- a/target/arm/helper-sme.h
> +++ b/target/arm/helper-sme.h
> @@ -21,3 +21,14 @@ DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
>  DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
>
>  DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
> +
> +DEF_HELPER_FLAGS_4(sme_mova_avz_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(sme_mova_zav_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)

What do the 'avz' and 'zav' stand for here? I thought that
'zav' might mean "from the ZA storage to a Vector", but
then what is 'avz' ?


> +static TCGv_ptr get_tile_rowcol(DisasContext *s, int esz, int rs,
> +                                int tile_index, bool vertical)
> +{
> +    int tile = tile_index >> (4 - esz);
> +    int index = esz == MO_128 ? 0 : extract32(tile_index, 0, 4 - esz);
> +    int pos, len, offset;
> +    TCGv_i32 t_index;
> +    TCGv_ptr addr;
> +
> +    /* Resolve tile.size[index] to an untyped ZA slice index. */
> +    t_index = tcg_temp_new_i32();
> +    tcg_gen_trunc_tl_i32(t_index, cpu_reg(s, rs));
> +    tcg_gen_addi_i32(t_index, t_index, index);
> +
> +    len = ctz32(s->svl) - esz;
> +    pos = esz;
> +    offset = tile;
> +
> +    /*
> +     * Horizontal slice.  Index row N, column 0.
> +     * The helper will iterate by the element size.
> +     */
> +    if (!vertical) {
> +        pos += ctz32(sizeof(ARMVectorReg));
> +        offset *= sizeof(ARMVectorReg);
> +    }
> +    offset += offsetof(CPUARMState, zarray);
> +
> +    tcg_gen_deposit_z_i32(t_index, t_index, pos, len);
> +    tcg_gen_addi_i32(t_index, t_index, offset);
> +
> +    /*
> +     * Vertical tile slice.  Index row 0, column N.
> +     * The helper will iterate by the row spacing in the array.
> +     * Need to adjust addressing for elements smaller than uint64_t for BE.
> +     */
> +    if (HOST_BIG_ENDIAN && vertical && esz < MO_64) {
> +        tcg_gen_xori_i32(t_index, t_index, 8 - (1 << esz));
> +    }
> +
> +    addr = tcg_temp_new_ptr();
> +    tcg_gen_ext_i32_ptr(addr, t_index);
> +    tcg_temp_free_i32(t_index);
> +    tcg_gen_add_ptr(addr, addr, cpu_env);
> +
> +    return addr;
> +}

This is too confusing -- I spent half an hour looking at it and
couldn't figure out if it was correct or not. I can see roughly
what it's supposed to be doing but I don't really want to try
to reverse engineer the details from the sequence of operations.
Eg the way we sometimes just add in the tile number and sometimes
add in the tile number * the size of a vector reg looks very
strange; I figured out that the deposit op is doing the equivalent
of the pseudocode's "MOD dim" on the slice index but it doesn't
say so and the calculation of len and pos is kind of obscure to me.

Perhaps (a) more commentary and (b) separating out the
horizontal and vertical cases would help ?

thanks
-- PMM

