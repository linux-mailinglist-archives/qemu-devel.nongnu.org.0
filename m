Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 566255A1DE1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 02:58:39 +0200 (CEST)
Received: from localhost ([::1]:43158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRNgD-0007bD-Th
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 20:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRNeM-0005bG-QJ
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 20:56:42 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRNeL-0001sC-0k
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 20:56:42 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 t11-20020a17090a510b00b001fac77e9d1fso6597942pjh.5
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 17:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=xtWmK7lpXIT0uvKSS73c4fT6gIpGX/Jcf22xKe7LMZE=;
 b=BF053zGuYTRtC8agbqZsAkLVUFKdKZA/9w1FAE1eDvqCHS0gDR9KpattPWUZGvJzja
 cqGa+lIA4U4Lw+my1HzvUauDL0UWSecNKE1uw4dp+pNuhLT7KE/JPf4yV9YL08i/64J/
 +R/C7esnaINlZU2XK9lFobF2TkXaEDL6LEak6ki8o0rXVTwx28Mk/7xFOMgM7oSCsKal
 rBAhWyKPIF2dMRhJA6koGh1yvpIClRDJHd4tAh3eVgbtPg6/9YSXubJY7W5JmU96Zt7M
 i78UllHpJlAMTnOtOkD+v9vExKKd2GU2v/fzRY2d+YHkRv6QL4OGfGCOs9/h4JbhJ3Jr
 6PRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=xtWmK7lpXIT0uvKSS73c4fT6gIpGX/Jcf22xKe7LMZE=;
 b=uDgazcy6BbMQuDrjN6iqmGU66DYJdkq1ikvOyCg/0L7tpMIjWBgpm47/MxxPH5krdo
 ycWL3BECgqIivVOWWcYXnjRmlNj8uSYJd2BEyrQ8q51hCEerigLa0ugJPB2zdK9gL4Ol
 BwxZxVaECYW7hh4R/6OjRfwMhSKSZEABULd7ey/2oYM1DT5Dsp/dJTQeEGdd/LoTYGwI
 0k4b1VgChxrLkDY/tGzXMa5HUmfS0MUQl/JR86gn2fzZ66Z8X1o7ml0UrVz6RRYOC0/I
 GjCP2sCa73zxRkLV2btQuZ6QUYp3LH8tLRcjiV7kDUJ/3sdmxhgSCfPEB8tdhkuMTyKd
 wUgA==
X-Gm-Message-State: ACgBeo3il4Y/NF7vWbNokfAfItpy07SHGBK7YJ1NPCCgdfoarKJNRnTb
 /Y/HK3zb4VYlV+S8kAMxcDBbig==
X-Google-Smtp-Source: AA6agR4pRAPLMB80qsYsES5Xbz0332VIMdqu/mLZGgm3a89L8UOFBscxKkn/ZPRf7NEql9m7UqjHqQ==
X-Received: by 2002:a17:902:e887:b0:16e:ef31:416b with SMTP id
 w7-20020a170902e88700b0016eef31416bmr1530993plg.51.1661475399218; 
 Thu, 25 Aug 2022 17:56:39 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:345c:4a6c:31b:1fca?
 ([2602:47:d49d:ec01:345c:4a6c:31b:1fca])
 by smtp.gmail.com with ESMTPSA id
 s8-20020aa78bc8000000b0053617082752sm290362pfd.10.2022.08.25.17.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 17:56:38 -0700 (PDT)
Message-ID: <09608f4f-d9dd-9000-4135-ea7fe2020ceb@linaro.org>
Date: Thu, 25 Aug 2022 17:56:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 12/18] i386: reimplement AVX comparison helpers
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-13-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-13-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
> From: Paul Brook <paul@nowt.org>
> 
> AVX includes additional a more extensive set of comparison predicates,
> some of some of which our softfloat implementation does not expose directly.

Not quite right, that wording.  floatN_compare is the more general operation, directly 
exposed.

> +#define SSE_HELPER_CMP_P(name, F, C)                                    \
> +    void glue(helper_ ## name ## ps, SUFFIX)(CPUX86State *env,          \
> +                                             Reg *d, Reg *s)    \
>       {                                                                   \
> -        d->ZMM_L(0) = F(32, d->ZMM_S(0), s->ZMM_S(0));                  \
> -        d->ZMM_L(1) = F(32, d->ZMM_S(1), s->ZMM_S(1));                  \
> -        d->ZMM_L(2) = F(32, d->ZMM_S(2), s->ZMM_S(2));                  \
> -        d->ZMM_L(3) = F(32, d->ZMM_S(3), s->ZMM_S(3));                  \
> +        Reg *v = d;                                                     \
> +        int i;                                                          \
> +        for (i = 0; i < 2 << SHIFT; i++) {                              \
> +            d->ZMM_L(i) = F(32, C, v->ZMM_S(i), s->ZMM_S(i));           \
> +        }                                                               \

...

> +#define FPU_EQ(x) (x == float_relation_equal)
> +#define FPU_LT(x) (x == float_relation_less)
> +#define FPU_LE(x) (x <= float_relation_equal)
> +#define FPU_UNORD(x) (x == float_relation_unordered)
> +
> +#define FPU_CMPQ(size, COND, a, b) \
> +    (COND(float ## size ## _compare_quiet(a, b, &env->sse_status)) ? -1 : 0)
> +#define FPU_CMPS(size, COND, a, b) \
> +    (COND(float ## size ## _compare(a, b, &env->sse_status)) ? -1 : 0)

I think clearer with C unnested from F, i.e.

     d->ZMM_S(i) = C(F(32, v->ZMM_S(i), s->ZMM_S(i)));


Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

