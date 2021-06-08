Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0773A069B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 00:11:21 +0200 (CEST)
Received: from localhost ([::1]:35288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqjwO-00020l-8Q
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 18:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjvH-00013R-71
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 18:10:11 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:37810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjvE-00022c-Aj
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 18:10:11 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t9so17701776pgn.4
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 15:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=qmla/iJkFiJZsOei40yAxANrwaelAAoZhjbzL0ahZlY=;
 b=Lh6VpWkfzKO3v8yemnYOLRkH6WUAysr/mxdMLVteTej9t2xDW8ousTdfQFJkl6UKF0
 nFbKsAnpTBD/s0rdMfXK/MaEdUD5/kuHxg5CqSVKMkTZENs3gO5Kg2P4Z4EEw3TPMn5J
 JTK83QxrKGCRDyqBLmR11LEdDglsDgF298YkJeaQiAuJ0uhMNyyu3/kIJ3CzAJ+7opq3
 Xl1NubNHcmXVZChV4xkzT51zxMl0dOth0VhYhTkHi1jhf+BdtY+N+YuNuRiKamVzwRA3
 woE0eO2GD+FpVJzOPWwXMvGp9sfriLwOawb5WltAckarJomnm9QvUtxoqq9q82Fec7L1
 HP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qmla/iJkFiJZsOei40yAxANrwaelAAoZhjbzL0ahZlY=;
 b=gjTL/kFSnqiiJYZNMBCie8UeLnkhXEeWm3J+1k8Cd/07M/VDc1YAgImPg0CIsFPgAv
 0tktMkcsj34Te3aP30zwShQxjZtHw5O46XXZFPtUMLF+FHjAsCBIfSmCRrtk3rmC5wiK
 eoJfC5SKYykLqCODi1bx9LS76bEOnJ88rzvTFNSqH/IzuVn9x2pareNDztsVO2La7NE+
 GOXH15VRgAQX7UC2S6PTkjt1t0/jQw1i+7KYcHf8Jvk52x6REob/JQQbXMasG6+0Rj1R
 h5XhCbFg2hcCmq9Sq7o5dUwc6TYW74Zitydpx5eUYJ17o1HeQvduv9PdSuSQouMk9qHy
 540Q==
X-Gm-Message-State: AOAM532NwBOmBG5sARh5fQ/tAus3xGyPyHoiF+4QjSKtemUtwR0q4iO3
 TAnQN/Wr1AJ/oQiCmIqXE2N29atCM3oJcA==
X-Google-Smtp-Source: ABdhPJz3BPtDeDfv1WKZ6squIapuq364VR5pDR0RjkmhtBm6JAeeVoF8Z8940YnLRKZ3KOXwwgBYhQ==
X-Received: by 2002:a63:f955:: with SMTP id q21mr403834pgk.448.1623190206270; 
 Tue, 08 Jun 2021 15:10:06 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h12sm11742939pfh.9.2021.06.08.15.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 15:10:05 -0700 (PDT)
Subject: Re: [PATCH 13/55] target/arm: Implement MVE VCLZ
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b04dd492-0394-5b1a-5747-bb21d772e621@linaro.org>
Date: Tue, 8 Jun 2021 15:10:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the MVE VCLZ insn (and the necessary machinery
> for MVE 1-input vector ops).
> 
> Note that for non-load instructions predication is always performed
> at a byte level granularity regardless of element size (R_ZLSJ),
> and so the masking logic here differs from that used in the VLDR
> and VSTR helpers.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  4 ++++
>   target/arm/mve.decode      |  8 +++++++
>   target/arm/mve_helper.c    | 48 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 43 ++++++++++++++++++++++++++++++++++
>   4 files changed, 103 insertions(+)
> 
> diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
> index e47d4164ae7..c5c1315b161 100644
> --- a/target/arm/helper-mve.h
> +++ b/target/arm/helper-mve.h
> @@ -32,3 +32,7 @@ DEF_HELPER_FLAGS_3(mve_vldrh_uw, TCG_CALL_NO_WG, void, env, ptr, i32)
>   DEF_HELPER_FLAGS_3(mve_vstrb_h, TCG_CALL_NO_WG, void, env, ptr, i32)
>   DEF_HELPER_FLAGS_3(mve_vstrb_w, TCG_CALL_NO_WG, void, env, ptr, i32)
>   DEF_HELPER_FLAGS_3(mve_vstrh_w, TCG_CALL_NO_WG, void, env, ptr, i32)
> +
> +DEF_HELPER_FLAGS_3(mve_vclzb, TCG_CALL_NO_WG, void, env, ptr, ptr)
> +DEF_HELPER_FLAGS_3(mve_vclzh, TCG_CALL_NO_WG, void, env, ptr, ptr)
> +DEF_HELPER_FLAGS_3(mve_vclzw, TCG_CALL_NO_WG, void, env, ptr, ptr)
> diff --git a/target/arm/mve.decode b/target/arm/mve.decode
> index 3bc5f034531..24999bf703e 100644
> --- a/target/arm/mve.decode
> +++ b/target/arm/mve.decode
> @@ -20,13 +20,17 @@
>   #
>   
>   %qd 22:1 13:3
> +%qm 5:1 1:3
>   
>   &vldr_vstr rn qd imm p a w size l u
> +&1op qd qm size
>   
>   @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
>   # Note that both Rn and Qd are 3 bits only (no D bit)
>   @vldst_wn ... u:1 ... . . . . l:1 . rn:3 qd:3 . ... .. imm:7 &vldr_vstr
>   
> +@1op .... .... .... size:2 .. .... .... .... .... &1op qd=%qd qm=%qm
> +
>   # Vector loads and stores
>   
>   # Widening loads and narrowing stores:
> @@ -61,3 +65,7 @@ VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111101 .......   @vldr_vstr \
>                    size=1 p=1
>   VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111110 .......   @vldr_vstr \
>                    size=2 p=1
> +
> +# Vector miscellaneous
> +
> +VCLZ             1111 1111 1 . 11 .. 00 ... 0 0100 11 . 0 ... 0 @1op
> diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
> index 6a2fc1c37cd..b7c44f57c09 100644
> --- a/target/arm/mve_helper.c
> +++ b/target/arm/mve_helper.c
> @@ -196,3 +196,51 @@ DO_VSTR(vstrh_w, 4, stw, int32_t, H4)
>   
>   #undef DO_VLDR
>   #undef DO_VSTR
> +
> +/*
> + * Take the bottom bits of mask (which is 1 bit per lane) and
> + * convert to a mask which has 1s in each byte which is predicated.
> + */
> +static uint8_t mask_to_bytemask1(uint16_t mask)
> +{
> +    return (mask & 1) ? 0xff : 0;
> +}
> +
> +static uint16_t mask_to_bytemask2(uint16_t mask)
> +{
> +    static const uint16_t masks[] = { 0x0000, 0x00ff, 0xff00, 0xffff };
> +    return masks[mask & 3];
> +}
> +
> +static uint32_t mask_to_bytemask4(uint16_t mask)
> +{
> +    static const uint32_t masks[] = {
> +        0x00000000, 0x000000ff, 0x0000ff00, 0x0000ffff,
> +        0x00ff0000, 0x00ff00ff, 0x00ffff00, 0x00ffffff,
> +        0xff000000, 0xff0000ff, 0xff00ff00, 0xff00ffff,
> +        0xffff0000, 0xffff00ff, 0xffffff00, 0xffffffff,
> +    };

I'll note that

(1) the values for the mask_to_bytemask2 array overlap the first 4 values of 
the mask_to_bytemask4 array, and

(2) both of these overlap with the larger

static inline uint64_t expand_pred_b(uint8_t byte)

from SVE.  It'd be nice to share the storage, whatever the actual functional 
interface into the array.

> +#define DO_1OP(OP, ESIZE, TYPE, H, FN)                                  \
> +    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
> +    {                                                                   \
> +        TYPE *d = vd, *m = vm;                                          \
> +        uint16_t mask = mve_element_mask(env);                          \
> +        unsigned e;                                                     \
> +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
> +            TYPE r = FN(m[H(e)]);                                       \
> +            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \

Why uint64_t and not TYPE?  Or uint32_t?

> +    if (!mve_eci_check(s)) {
> +        return true;
> +    }
> +
> +    if (!vfp_access_check(s)) {
> +        return true;
> +    }

Not the first instance, but is it worth saving 4 lines per and combining these 
into one IF?

> +#define DO_1OP(INSN, FN)                                        \
> +    static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
> +    {                                                           \
> +        MVEGenOneOpFn *fns[] = {                                \

static const.


r~

