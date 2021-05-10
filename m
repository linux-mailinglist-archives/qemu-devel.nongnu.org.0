Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19543780C4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 12:01:25 +0200 (CEST)
Received: from localhost ([::1]:42418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg2j6-0006IB-Ll
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 06:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg2h2-0004aO-MD
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:59:16 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg2gz-00081U-HJ
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:59:16 -0400
Received: by mail-wr1-x435.google.com with SMTP id m9so15957584wrx.3
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 02:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=zPNWc4X4FK6X3x99af10sClDtLEIcEmS14p9xGiAG5s=;
 b=ObEG4zLJhNCW7XrUzCDtj0rF9lELOe0ummvo3nYvZrKbZRT2e3miKxgRzYjAOKQlr7
 8WqVWcInt9qPMqctFWTbE2s69thLEgYtac4u/vzcZ5l3hYocQWIuOlddprgL5igSDMNf
 GHjcHEsGNOPKcwY3Ce1HPjI0e4SNFavs3jBYQKHjOwv8Fyroe8InZqCx0nsYYUd/gMef
 IcXSqzXtKPuLCe9yDnT4KKGLTbRx7t0+LFWZqMdHwZHoA86aArKhnEgJSWeUbRU2ypCE
 ynZh8mPfFR58NoP0EdOtveoreOy5PAPptzD2gS/xlIAxxEKoCby3MdtuIpbuYJTqYpte
 k9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=zPNWc4X4FK6X3x99af10sClDtLEIcEmS14p9xGiAG5s=;
 b=o/Zf8RU0emQlvz1zWBipZeMB/u42QeWI00rFqIXEmIyQke5jo0ZW/PYbS1JYpibuuf
 wXuGwynPCaw5lwBWHqZz3gDuP5XRGnzvqRcR5M/riDXiHfqnEhEBQp5x9NTX0QRNGQll
 OdzYmDzh0hQeaD487UctWuzFkrKgCvKRphs5npCfP5GUJdlyIBwl8kwHaYPYW6g0gBko
 ik+G+hsMvHXG+FkZtDA2/72PwzClAaLkqf7FFQa/9tJqJKCViW/qwCsr4K/mzDU1xp1j
 lNZXCi6y60fN4yMuOMaMyzBlV5CF71KnGQ1TQO/W1M/a1Aq/fC0R53XZtkm2/ETLH1Ov
 8WmA==
X-Gm-Message-State: AOAM531fBvYVMDaXzAZllTWDyvpVqSI6/y/BPFkt2PQ4O8ghe0AHJ2mH
 5vr4LBb0Kya5eeVT4NpH5M9kfQ==
X-Google-Smtp-Source: ABdhPJzRzDHjUOKfSYnd6Sfu2tfrJiMUwpvvI8lhnLcQqfVJChOt38QWE+jkqUmxjDgW8feXtdYaug==
X-Received: by 2002:adf:e9c2:: with SMTP id l2mr28865288wrn.323.1620640752105; 
 Mon, 10 May 2021 02:59:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o62sm58104574wmo.3.2021.05.10.02.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 02:59:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 687001FF7E;
 Mon, 10 May 2021 10:59:10 +0100 (BST)
References: <20200930145523.71087-1-david@redhat.com>
 <20200930145523.71087-2-david@redhat.com> <87o8lnnt3m.fsf@linaro.org>
 <1294d810-64a7-7e4d-fb73-238378e2197c@redhat.com>
 <87a6x6nl3q.fsf@linaro.org>
 <8ba9536d-dec1-54a2-d3e1-157beff16502@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 01/20] softfloat: Implement
 float128_(min|minnum|minnummag|max|maxnum|maxnummag)
Date: Mon, 10 May 2021 10:57:16 +0100
In-reply-to: <8ba9536d-dec1-54a2-d3e1-157beff16502@redhat.com>
Message-ID: <87sg2uyknl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


David Hildenbrand <david@redhat.com> writes:

> On 01.10.20 15:15, Alex Benn=C3=A9e wrote:
>> David Hildenbrand <david@redhat.com> writes:
>>=20
>>> On 30.09.20 18:10, Alex Benn=C3=A9e wrote:
>>>>
>>>> David Hildenbrand <david@redhat.com> writes:
>>>>
>>>>> Implementation inspired by minmax_floats(). Unfortuantely, we don't h=
ave
>>>>> any tests we can simply adjust/unlock.
>>>>>
>>>>> Cc: Aurelien Jarno <aurelien@aurel32.net>
>>>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>>>> Cc: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>> ---
>>>>>   fpu/softfloat.c         | 100 +++++++++++++++++++++++++++++++++++++=
+++
>>>>>   include/fpu/softfloat.h |   6 +++
>>>>>   2 files changed, 106 insertions(+)
>>>>>
>>>>> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
>>>>> index 9af75b9146..9463c5ea56 100644
>>>>> --- a/fpu/softfloat.c
>>>>> +++ b/fpu/softfloat.c
>>>>> @@ -621,6 +621,8 @@ static inline FloatParts float64_unpack_raw(float=
64 f)
>>>>>       return unpack_raw(float64_params, f);
>>>>>   }
>>>>>   +static void float128_unpack(FloatParts128 *p, float128 a,
>>>>> float_status *status);
>>>>> +
>>>>>   /* Pack a float from parts, but do not canonicalize.  */
>>>>>   static inline uint64_t pack_raw(FloatFmt fmt, FloatParts p)
>>>>>   {
>>>>> @@ -3180,6 +3182,89 @@ static FloatParts minmax_floats(FloatParts a, =
FloatParts b, bool ismin,
>>>>>       }
>>>>>   }
>>>>
>>>> It would be desirable to share as much logic for this as possible with
>>>> the existing minmax_floats code. I appreciate at some point we end up
>>>> having to deal with fractions and we haven't found a good way to
>>>> efficiently handle dealing with FloatParts and FloatParts128 in the sa=
me
>>>> unrolled code, however:
>>>>
>>>>>   +static float128 float128_minmax(float128 a, float128 b, bool
>>>>> ismin, bool ieee,
>>>>> +                                bool ismag, float_status *s)
>>>>> +{
>>>>> +    FloatParts128 pa, pb;
>>>>> +    int a_exp, b_exp;
>>>>> +    bool a_less;
>>>>> +
>>>>> +    float128_unpack(&pa, a, s);
>>>>> +    float128_unpack(&pb, b, s);
>>>>> +
>>>>
>>>>  From here:
>>>>> +    if (unlikely(is_nan(pa.cls) || is_nan(pb.cls))) {
>>>>> +        /* See comment in minmax_floats() */
>>>>> +        if (ieee && !is_snan(pa.cls) && !is_snan(pb.cls)) {
>>>>> +            if (is_nan(pa.cls) && !is_nan(pb.cls)) {
>>>>> +                return b;
>>>>> +            } else if (is_nan(pb.cls) && !is_nan(pa.cls)) {
>>>>> +                return a;
>>>>> +            }
>>>>> +        }
>>>>> +
>>>>> +        /* Similar logic to pick_nan(), avoiding re-packing. */
>>>>> +        if (is_snan(pa.cls) || is_snan(pb.cls)) {
>>>>> +            s->float_exception_flags |=3D float_flag_invalid;
>>>>> +        }
>>>>> +        if (s->default_nan_mode) {
>>>>> +            return float128_default_nan(s);
>>>>> +        }
>>>>
>>>> to here is common logic - is there anyway we could share it?
>>>
>>> I can try to factor it out, similar to pickNaN() - passing weird boolean
>>> flags and such. It most certainly won't win in a beauty contest, that's
>>> for sure.
>>>>
>>>> Likewise I wonder if there is scope for a float_minmax_exp helper that
>>>> could be shared here?
>>>
>>> I'll try, but I have the feeling that it might make the code harder to
>>> read than actually help. Will give it a try.
>> Give it a try - if it really does become harder to follow then we'll
>> stick with the duplication however if we can have common code you'll
>> know at least the nan handling and minmax behaviour for float128 will be
>> partially tested by the 16/32/64 float code.
>
> (finally had time to look into this)
>
> What about something like this:
>

I was just about to look this morning but I see Richard has posted his
mega series:

  From: Richard Henderson <richard.henderson@linaro.org>
  Subject: [PATCH 00/72] Convert floatx80 and float128 to FloatParts
  Date: Fri,  7 May 2021 18:46:50 -0700
  Message-Id: <20210508014802.892561-1-richard.henderson@linaro.org>

which I think also includes the
float128_(min|minnum|minnummag|max|maxnum|maxnummag) functions. I'm
going to have a look at that first if that's ok.

>
>
> From dd6cf176c840fc34a095cb2a158032a994aca5ef Mon Sep 17 00:00:00 2001
> From: David Hildenbrand <david@redhat.com>
> Date: Tue, 29 Sep 2020 14:36:26 +0200
> Subject: [PATCH] softfloat: Implement
>  float128_(min|minnum|minnummag|max|maxnum|maxnummag)
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>
> Implementation inspired by minmax_floats(). Unfortuantely, we don't have
> any tests we can simply adjust/unlock.
>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  fpu/softfloat.c         | 141 ++++++++++++++++++++++++++++++++--------
>  include/fpu/softfloat.h |   6 ++
>  2 files changed, 120 insertions(+), 27 deletions(-)
>
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index db7d3a39db..f1014f6d47 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -525,6 +525,18 @@ typedef struct {
>      bool sign;
>  } FloatParts128;
>  +static inline FloatParts128 floatparts64_to_128(FloatParts a)
> +{
> +    FloatParts128 res =3D {
> +        .frac0 =3D a.frac,
> +        .exp =3D a.exp,
> +        .cls =3D a.cls,
> +        .sign =3D a.sign,
> +    };
> +
> +    return res;
> +}
> +
>  #define DECOMPOSED_BINARY_POINT    (64 - 2)
>  #define DECOMPOSED_IMPLICIT_BIT    (1ull << DECOMPOSED_BINARY_POINT)
>  #define DECOMPOSED_OVERFLOW_BIT    (DECOMPOSED_IMPLICIT_BIT << 1)
> @@ -621,6 +633,8 @@ static inline FloatParts float64_unpack_raw(float64 f)
>      return unpack_raw(float64_params, f);
>  }
>  +static void float128_unpack(FloatParts128 *p, float128 a,
> float_status *status);
> +
>  /* Pack a float from parts, but do not canonicalize.  */
>  static inline uint64_t pack_raw(FloatFmt fmt, FloatParts p)
>  {
> @@ -3093,6 +3107,14 @@ bfloat16 uint16_to_bfloat16(uint16_t a, float_stat=
us *status)
>      return uint64_to_bfloat16_scalbn(a, 0, status);
>  }
>  +typedef enum MinMaxRes {
> +    MINMAX_RES_A,
> +    MINMAX_RES_B,
> +    MINMAX_RES_SILENCE_A,
> +    MINMAX_RES_SILENCE_B,
> +    MINMAX_RES_DEFAULT_NAN,
> +} MinMaxRes;
> +
>  /* Float Min/Max */
>  /* min() and max() functions. These can't be implemented as
>   * 'compare and pick one input' because that would mishandle
> @@ -3109,27 +3131,36 @@ bfloat16 uint16_to_bfloat16(uint16_t a, float_sta=
tus *status)
>   * minnummag() and maxnummag() functions correspond to minNumMag()
>   * and minNumMag() from the IEEE-754 2008.
>   */
> -static FloatParts minmax_floats(FloatParts a, FloatParts b, bool ismin,
> -                                bool ieee, bool ismag, float_status *s)
> +static MinMaxRes minmax_floats128(FloatParts128 a, FloatParts128 b, bool=
 ismin,
> +                                  bool ieee, bool ismag, float_status *s)
>  {
>      if (unlikely(is_nan(a.cls) || is_nan(b.cls))) {
> -        if (ieee) {
> -            /* Takes two floating-point values `a' and `b', one of
> -             * which is a NaN, and returns the appropriate NaN
> -             * result. If either `a' or `b' is a signaling NaN,
> -             * the invalid exception is raised.
> -             */
> -            if (is_snan(a.cls) || is_snan(b.cls)) {
> -                return pick_nan(a, b, s);
> -            } else if (is_nan(a.cls) && !is_nan(b.cls)) {
> -                return b;
> +        if (ieee && !is_snan(a.cls) && !is_snan(b.cls)) {
> +            if (is_nan(a.cls) && !is_nan(b.cls)) {
> +                return MINMAX_RES_B;
>              } else if (is_nan(b.cls) && !is_nan(a.cls)) {
> -                return a;
> +                return MINMAX_RES_A;
>              }
>          }
> -        return pick_nan(a, b, s);
> +
> +        /* Similar logic to pick_nan(), avoiding re-packing. */
> +        if (is_snan(a.cls) || is_snan(b.cls)) {
> +            s->float_exception_flags |=3D float_flag_invalid;
> +        }
> +        if (s->default_nan_mode) {
> +            return MINMAX_RES_DEFAULT_NAN;
> +        }
> +        if (pickNaN(a.cls, b.cls,
> +                    a.frac0 > b.frac0 ||
> +                    (a.frac0 =3D=3D b.frac0 && a.frac1 > b.frac1) ||
> +                    (a.frac0 =3D=3D b.frac0 && a.frac1 =3D=3D b.frac1 &&
> +                     a.sign < b.sign), s)) {
> +            return is_snan(b.cls) ? MINMAX_RES_SILENCE_B : MINMAX_RES_B;
> +        }
> +        return is_snan(a.cls) ? MINMAX_RES_SILENCE_A : MINMAX_RES_A;
>      } else {
>          int a_exp, b_exp;
> +        bool a_less;
>            switch (a.cls) {
>          case float_class_normal:
> @@ -3160,23 +3191,44 @@ static FloatParts minmax_floats(FloatParts a, Flo=
atParts b, bool ismin,
>              break;
>          }
>  -        if (ismag && (a_exp !=3D b_exp || a.frac !=3D b.frac)) {
> -            bool a_less =3D a_exp < b_exp;
> -            if (a_exp =3D=3D b_exp) {
> -                a_less =3D a.frac < b.frac;
> +        a_less =3D a_exp < b_exp;
> +        if (a_exp =3D=3D b_exp) {
> +            a_less =3D a.frac0 < b.frac0;
> +            if (a.frac0 =3D=3D b.frac0) {
> +                a_less =3D a.frac1 < b.frac1;
>              }
> -            return a_less ^ ismin ? b : a;
>          }
>  -        if (a.sign =3D=3D b.sign) {
> -            bool a_less =3D a_exp < b_exp;
> -            if (a_exp =3D=3D b_exp) {
> -                a_less =3D a.frac < b.frac;
> -            }
> -            return a.sign ^ a_less ^ ismin ? b : a;
> -        } else {
> -            return a.sign ^ ismin ? b : a;
> +        if (ismag &&
> +            (a_exp !=3D b_exp || a.frac0 !=3D b.frac0 || a.frac1 !=3D b.=
frac1)) {
> +            return a_less ^ ismin ? MINMAX_RES_B : MINMAX_RES_A;
> +        } else if (a.sign =3D=3D b.sign) {
> +            return a.sign ^ a_less ^ ismin ? MINMAX_RES_B : MINMAX_RES_A;
>          }
> +        return a.sign ^ ismin ? MINMAX_RES_B : MINMAX_RES_A;
> +    }
> +}
> +
> +static FloatParts minmax_floats(FloatParts a, FloatParts b, bool ismin,
> +                                bool ieee, bool ismag, float_status *s)
> +{
> +    FloatParts128 ta =3D floatparts64_to_128(a);
> +    FloatParts128 tb =3D floatparts64_to_128(b);
> +    MinMaxRes res =3D minmax_floats128(ta, tb, ismin, ieee, ismag, s);
> +
> +    switch(res) {
> +    case MINMAX_RES_A:
> +        return a;
> +    case MINMAX_RES_B:
> +        return b;
> +    case MINMAX_RES_SILENCE_A:
> +        return parts_silence_nan(a, s);
> +    case MINMAX_RES_SILENCE_B:
> +        return parts_silence_nan(b, s);
> +    case MINMAX_RES_DEFAULT_NAN:
> +        return parts_default_nan(s);
> +    default:
> +        g_assert_not_reached();
>      }
>  }
>  @@ -3233,6 +3285,41 @@ BF16_MINMAX(maxnummag, false, true, true)
>    #undef BF16_MINMAX
>  +#define F128_MINMAX(name, ismin, isiee, ismag)
> \
> +float128 float128_ ## name(float128 a, float128 b, float_status *s)     \
> +{                                                                       \
> +    FloatParts128 pa, pb;                                               \
> +    MinMaxRes res;                                                      \
> +                                                                        \
> +    float128_unpack(&pa, a, s);                                         \
> +    float128_unpack(&pb, b, s);                                         \
> +    res =3D minmax_floats128(pa, pb, ismin, isiee, ismag, s);           =
  \
> +                                                                        \
> +    switch(res) {                                                       \
> +    case MINMAX_RES_A:                                                  \
> +        return a;                                                       \
> +    case MINMAX_RES_B:                                                  \
> +        return b;                                                       \
> +    case MINMAX_RES_SILENCE_A:                                          \
> +        return float128_silence_nan(a, s);                              \
> +    case MINMAX_RES_SILENCE_B:                                          \
> +        return float128_silence_nan(b, s);                              \
> +    case MINMAX_RES_DEFAULT_NAN:                                        \
> +        return float128_default_nan(s);                                 \
> +    default:                                                            \
> +        g_assert_not_reached();                                         \
> +    }                                                                   \
> +}
> +
> +F128_MINMAX(min, true, false, false)
> +F128_MINMAX(minnum, true, true, false)
> +F128_MINMAX(minnummag, true, true, true)
> +F128_MINMAX(max, false, false, false)
> +F128_MINMAX(maxnum, false, true, false)
> +F128_MINMAX(maxnummag, false, true, true)
> +
> +#undef F128_MINMAX
> +
>  /* Floating point compare */
>  static FloatRelation compare_floats(FloatParts a, FloatParts b, bool is_=
quiet,
>                                      float_status *s)
> diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
> index a38433deb4..4fab2ef6f4 100644
> --- a/include/fpu/softfloat.h
> +++ b/include/fpu/softfloat.h
> @@ -1201,6 +1201,12 @@ float128 float128_muladd(float128, float128, float=
128, int,
>  float128 float128_sqrt(float128, float_status *status);
>  FloatRelation float128_compare(float128, float128, float_status *status);
>  FloatRelation float128_compare_quiet(float128, float128, float_status *s=
tatus);
> +float128 float128_min(float128, float128, float_status *status);
> +float128 float128_max(float128, float128, float_status *status);
> +float128 float128_minnum(float128, float128, float_status *status);
> +float128 float128_maxnum(float128, float128, float_status *status);
> +float128 float128_minnummag(float128, float128, float_status *status);
> +float128 float128_maxnummag(float128, float128, float_status *status);
>  bool float128_is_quiet_nan(float128, float_status *status);
>  bool float128_is_signaling_nan(float128, float_status *status);
>  float128 float128_silence_nan(float128, float_status *status);
> --=20
> 2.30.2


--=20
Alex Benn=C3=A9e

