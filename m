Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F225A2BCF
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:59:47 +0200 (CEST)
Received: from localhost ([::1]:57110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbkD-0006j5-39
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRbe6-0006Rh-EN
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:53:27 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:42601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRbe4-0003h2-Hh
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:53:21 -0400
Received: by mail-pf1-x434.google.com with SMTP id 72so1915146pfx.9
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 08:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=6Q5pDZjBovcMblnYvEJzaORBQ0GS+aqanA/AkHk4mT4=;
 b=dTLuqZNQGy0R3JWzclhEQ6LZYvG48EkQt68txCLRYrDnX7lByUq7JrVqJN6UF/FBW4
 pM/OBmjdw5yECWvFzOEEWAJBtmLwFYpt9mm/dIK/lWWCDcFZRqP/Aj2jXZyyLS9+cFcu
 OMJ1CxMN51gX0qQPriaz7BUB7aUieg/LCBabwi+JzlKy11czDYP3wqkvnxbCGxLeRnsw
 w/iwEizcrONpAZRUWgBRf0Qzgez17YhRkYZKY4uQm23oY0hxU49DrjMGNU/8FMn6RvFR
 655OgCPWl8zBohx3mR+PDThVlsT6H+anaZsZVFAOuGLTklin39D78aLucmRlhGTB6qaa
 yFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=6Q5pDZjBovcMblnYvEJzaORBQ0GS+aqanA/AkHk4mT4=;
 b=BdXKqisG3k8gr0e16ZxQIzOPt5m7mLqgT3lJxiKGV6bNKz6uS+ypXSagGuM3UZFoWI
 Hm0+TTAVMJKEzpE5zeHeMzfOn9aXvaBqUWxamshEh+a3PaASUVZmxgWexW9lXV2LHpWZ
 reDuA5QXDYYIVVAfjkj/zD0im/uwfOifsZtioe8Cge3Du1kSgCs1LFUWzTml8R2oPL0p
 h5W2d3N99MbL5ndeXGfCKQaDxwxnzDx7k/XoNKoc/iFo1OJOXRlHIODJ0XNZDx68KKoy
 ViURRVclWXJCYEdH7mADpiVaXgncBvJqjohcGv54abxw1AWDp4e2z/iIOfSoblcYPvbq
 3wlQ==
X-Gm-Message-State: ACgBeo0nJ+lseKSJ8o6hpETs/9iURnOOBZwjuXsLlZIJA7Wf7g8R9Ru0
 JQxygDbq8IH9svQr+j1DoO+m1g==
X-Google-Smtp-Source: AA6agR7JM72IzlcI0YWqxBOU13y2C5U0DcQvAqPg9HCNbf6r+7Hkhk/4cUbf0sOxymEDzul8WF8M6A==
X-Received: by 2002:a05:6a00:850:b0:52e:d1c1:df48 with SMTP id
 q16-20020a056a00085000b0052ed1c1df48mr4344021pfk.75.1661529198416; 
 Fri, 26 Aug 2022 08:53:18 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f?
 ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a170903124d00b0016bb24f5d19sm1756909plh.209.2022.08.26.08.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 08:53:17 -0700 (PDT)
Message-ID: <1362b75b-c9d7-5aaf-47ce-d038d88811a2@linaro.org>
Date: Fri, 26 Aug 2022 08:53:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 16/18] i386: Rewrite blendv helpers
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-17-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-17-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
> +#define BLEND_I128(elem, num, F, b) do {                                    \
> +    d->elem(b + 0) = F(v->elem(b + 0), s->elem(b + 0), ((imm >> 0) & 1));   \
> +    d->elem(b + 1) = F(v->elem(b + 1), s->elem(b + 1), ((imm >> 1) & 1));   \
> +    if (num > 2) {                                                          \
> +        d->elem(b + 2) = F(v->elem(b + 2), s->elem(b + 2), ((imm >> 2) & 1)); \
> +        d->elem(b + 3) = F(v->elem(b + 3), s->elem(b + 3), ((imm >> 3) & 1)); \
> +    }                                                                       \
> +    if (num > 4) {                                                          \
> +        d->elem(b + 4) = F(v->elem(b + 4), s->elem(b + 4), ((imm >> 4) & 1)); \
> +        d->elem(b + 5) = F(v->elem(b + 5), s->elem(b + 5), ((imm >> 5) & 1)); \
> +        d->elem(b + 6) = F(v->elem(b + 6), s->elem(b + 6), ((imm >> 6) & 1)); \
> +        d->elem(b + 7) = F(v->elem(b + 7), s->elem(b + 7), ((imm >> 7) & 1)); \
> +    }                                                                       \
> +    } while (0)

Unused?  It certainly seems redundant with...

>   #define SSE_HELPER_I(name, elem, num, F)                                \
> +    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,   \
> +                            uint32_t imm)                               \
>       {                                                                   \
> +        Reg *v = d;                                                     \
> +        int i;                                                          \
> +        for (i = 0; i < num; i++) {                                     \
> +            int j = i & 7;                                              \
> +            d->elem(i) = F(v->elem(i), s->elem(i), (imm >> j) & 1);     \
>           }                                                               \
>       }

... this.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

