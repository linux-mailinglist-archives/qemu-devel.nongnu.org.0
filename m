Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0BE5A1DC4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 02:42:49 +0200 (CEST)
Received: from localhost ([::1]:53424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRNQu-0000lG-2o
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 20:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRNPY-0007pm-Kg
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 20:41:24 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRNPW-00080N-Gp
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 20:41:24 -0400
Received: by mail-pl1-x634.google.com with SMTP id x19so255783plc.5
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 17:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=WOF8LPJh+e4twYlydRwRR9Wh91UN+3PC1Wccwd5owvQ=;
 b=JlXCvt1+jowY+ep3NwbudjVG0U7768urxX7qvBYRvtVJzQW3WdUvb3TYGvb36io1Ex
 ZaXekiXcCSHfj+aTEoPyInJsxicsTIVuBm7hlIQEQlYrYijiwcSl7GSeDod1yVArCV8S
 KkWy1jXByv3QM3Gt1Wr0dKbtChRQXrPE9rYkyeVRA//tl8q7Api3Ymw2l0UFJE4ztuaH
 UUhYLcxgZiQQ27Xt4WfHd5henA8YNBzBEjZx/ozB2vZYX2YgvSTrUeU7bc9lN67xelPl
 ooiYxBDFH+8HluKDJn/CNHhnpmZHYu8WV5Qx/LPNPkVBTo+wTDZEIvO4P0lp6szcim/+
 zDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=WOF8LPJh+e4twYlydRwRR9Wh91UN+3PC1Wccwd5owvQ=;
 b=4llHXa8XW75KXNzdIuuPuN0sjGxDYCg6Zk6efDCEQ71HrO0ap4c4VKxeMjP7zNFWbP
 kYFYGEPl1IV6qzHgcvukJAzItSSau3BBRgEoyU75S/PA09hVONSC2BFVfwyc4Rwjs0Hk
 netDGE9oNJL77HYEwpNgkjZuioXzxM7Ha1NnJyJflPPq89WCqNFq/zeXy7nFynSZgeIP
 fcCb9B/eG+B0N5rC+oD1z6cyZ6cUaaTAirTDH+M+A/L8glfvG+Zl96aAb+qSc07QrL+B
 /whgz+QjrHe8ghkci5chE+IEVb6ttoG1PbXAZRpnTZlGWkXui/hwbOxhPXcR53VBrmLZ
 RnoQ==
X-Gm-Message-State: ACgBeo0aFzfwszFvrEC5KYI3P0QSCIZ+0CUTQW1RbHQKryoCI+fMvPS6
 rzQdhxe8LxzxAsSBCjHKOHfrJw==
X-Google-Smtp-Source: AA6agR6u1c7fEz7hwdC+zTM8mxxNK97qFrBLD94GhP20TmVgbDF/P9z7jfRH8Vs1ubpzP/dSImQ0ng==
X-Received: by 2002:a17:90b:3810:b0:1fb:307f:7cc6 with SMTP id
 mq16-20020a17090b381000b001fb307f7cc6mr1619939pjb.223.1661474480504; 
 Thu, 25 Aug 2022 17:41:20 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:345c:4a6c:31b:1fca?
 ([2602:47:d49d:ec01:345c:4a6c:31b:1fca])
 by smtp.gmail.com with ESMTPSA id
 t187-20020a6281c4000000b00525343b5047sm251849pfd.76.2022.08.25.17.41.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 17:41:19 -0700 (PDT)
Message-ID: <e48905c6-ee39-4075-34c0-5d87cec0c9c7@linaro.org>
Date: Thu, 25 Aug 2022 17:41:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 09/18] i386: Destructive vector helpers for AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-10-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-10-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/25/22 15:14, Paolo Bonzini wrote:
>   void glue(helper_pshufd, SUFFIX)(Reg *d, Reg *s, int order)
>   {
> -    Reg r;
> +    uint32_t r0, r1, r2, r3;
>   
> -    r.L(0) = s->L(order & 3);
> -    r.L(1) = s->L((order >> 2) & 3);
> -    r.L(2) = s->L((order >> 4) & 3);
> -    r.L(3) = s->L((order >> 6) & 3);
> -    MOVE(*d, r);
> +    SHUFFLE4(L, s, s, 0);
> +#if SHIFT ==  2
> +    SHUFFLE4(L, s, s, 4);
> +#endif
>   }

Why the if and not a loop?

     for (int offset = 0; offset < 2 << SHIFT; offset += 4) {
         SHUFFLE4(L, s, s, offset);
     }

Most of the other shuffles haven't been updated for ymm.
Perhaps this too should be deferred to the future patch?


> +#if SHIFT == 0
> +#define PACK_WIDTH 4
> +#else
> +#define PACK_WIDTH 8
> +#endif
>   
....
> +#define PACK4(F, to, reg, from) do {        \
> +    r[to + 0] = F((int16_t)reg->W(from + 0));   \
> +    r[to + 1] = F((int16_t)reg->W(from + 1));   \
> +    r[to + 2] = F((int16_t)reg->W(from + 2));   \
> +    r[to + 3] = F((int16_t)reg->W(from + 3));   \
> +    } while (0)

...

> +
> +#define PACK_HELPER_B(name, F) \
> +void glue(helper_pack ## name, SUFFIX)(CPUX86State *env, \
> +        Reg *d, Reg *s)                         \
> +{                                               \
> +    Reg *v = d;                                 \
> +    uint8_t r[PACK_WIDTH * 2];                  \
> +    int i;                                      \
> +    PACK4(F, 0, v, 0);                          \
> +    PACK4(F, PACK_WIDTH, s, 0);                 \
> +    XMM_ONLY(                                   \
> +        PACK4(F, 4, v, 4);                      \
> +        PACK4(F, 12, s, 4);                     \
> +        )                                       \

The 4 in PACK4 looks suspiciously like it should be PACK_WIDTH --
that would eliminate the XMM_ONLY bit here.


>   void glue(helper_packssdw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
>   {
> +    Reg *v = d;
> +    uint16_t r[PACK_WIDTH];
> +    int i, j, k;
>   
> +    for (i = 0, j = 0; i <= 2 << SHIFT; i += 8, j += 4) {
> +        r[0] = satsw(v->L(j));
> +        r[1] = satsw(v->L(j + 1));
> +        r[PACK_WIDTH / 2 + 0] = satsw(s->L(j));
> +        r[PACK_WIDTH / 2 + 1] = satsw(s->L(j + 1));
> +#if SHIFT >= 1
> +        r[2] = satsw(v->L(j + 2));
> +        r[3] = satsw(v->L(j + 3));
> +        r[6] = satsw(s->L(j + 2));
> +        r[7] = satsw(s->L(j + 3));
>   #endif
> +        for (k = 0; k < PACK_WIDTH; k++) {
> +            d->W(i + k) = r[k];
> +        }
> +    }

Hmm.  Better with nested loops?

     for (j = 0; j <= 1 << SHIFT; j += 4) {
         for (k = 0; k < PACK_WIDTH / 2; ++k) {
             r[k] = satsw(v->L(j + k));
         }
         for (k = 0; k < PACK_WIDTH / 2; ++k) {
             r[PACK_WIDTH / 2 + k] = satsw(s->L(j + k));
         }
         for (k = 0; k < PACK_WIDTH; k++) {
             d->W(j * 2 + k) = r[k];
         }
     }


>   #define UNPCK_OP(base_name, base)                                       \
>                                                                           \
>       void glue(helper_punpck ## base_name ## bw, SUFFIX)(CPUX86State *env,\
> -                                                        Reg *d, Reg *s) \
> +                                                Reg *d, Reg *s) \
>       {                                                                   \
> -        Reg r;                                                          \
> +        Reg *v = d;                                                     \
> +        uint8_t r[PACK_WIDTH * 2];                                      \
> +        int i;                                                          \
>                                                                           \
> -        r.B(0) = d->B((base << (SHIFT + 2)) + 0);                       \
> -        r.B(1) = s->B((base << (SHIFT + 2)) + 0);                       \
> -        r.B(2) = d->B((base << (SHIFT + 2)) + 1);                       \
> -        r.B(3) = s->B((base << (SHIFT + 2)) + 1);                       \
> -        r.B(4) = d->B((base << (SHIFT + 2)) + 2);                       \
> -        r.B(5) = s->B((base << (SHIFT + 2)) + 2);                       \
> -        r.B(6) = d->B((base << (SHIFT + 2)) + 3);                       \
> -        r.B(7) = s->B((base << (SHIFT + 2)) + 3);                       \
> +        r[0] = v->B((base * PACK_WIDTH) + 0);                           \
> +        r[1] = s->B((base * PACK_WIDTH) + 0);                           \
> +        r[2] = v->B((base * PACK_WIDTH) + 1);                           \
> +        r[3] = s->B((base * PACK_WIDTH) + 1);                           \
> +        r[4] = v->B((base * PACK_WIDTH) + 2);                           \
> +        r[5] = s->B((base * PACK_WIDTH) + 2);                           \
> +        r[6] = v->B((base * PACK_WIDTH) + 3);                           \
> +        r[7] = s->B((base * PACK_WIDTH) + 3);                           \
>           XMM_ONLY(                                                       \
> -                 r.B(8) = d->B((base << (SHIFT + 2)) + 4);              \
> -                 r.B(9) = s->B((base << (SHIFT + 2)) + 4);              \
> -                 r.B(10) = d->B((base << (SHIFT + 2)) + 5);             \
> -                 r.B(11) = s->B((base << (SHIFT + 2)) + 5);             \
> -                 r.B(12) = d->B((base << (SHIFT + 2)) + 6);             \
> -                 r.B(13) = s->B((base << (SHIFT + 2)) + 6);             \
> -                 r.B(14) = d->B((base << (SHIFT + 2)) + 7);             \
> -                 r.B(15) = s->B((base << (SHIFT + 2)) + 7);             \
> +                 r[8] = v->B((base * PACK_WIDTH) + 4);                  \
> +                 r[9] = s->B((base * PACK_WIDTH) + 4);                  \
> +                 r[10] = v->B((base * PACK_WIDTH) + 5);                 \
> +                 r[11] = s->B((base * PACK_WIDTH) + 5);                 \
> +                 r[12] = v->B((base * PACK_WIDTH) + 6);                 \
> +                 r[13] = s->B((base * PACK_WIDTH) + 6);                 \
> +                 r[14] = v->B((base * PACK_WIDTH) + 7);                 \
> +                 r[15] = s->B((base * PACK_WIDTH) + 7);                 \
>                                                                         ) \
> -        MOVE(*d, r);                                                    \
> +        for (i = 0; i < PACK_WIDTH * 2; i++) {                          \
> +            d->B(i) = r[i];                                             \
> +        }                                                               \
>       }                                                                   \

Surely better with loops, and more semi-conversions following.


r~

