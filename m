Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E955E8D52
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 16:29:53 +0200 (CEST)
Received: from localhost ([::1]:47488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc6AD-0007vR-2P
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 10:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc67m-00053a-Sw
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:27:24 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:43881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc67l-0001tv-FI
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:27:22 -0400
Received: by mail-qt1-x836.google.com with SMTP id a20so1675215qtw.10
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 07:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=+0UfTMfKw1nhPlvjd2Z7SOnomp0saiqh939kTkrTF1c=;
 b=hnNZAqIxlGhSuQiTH/vb1XNM1ZKAg28q/vsqJLrk24Yefz0qeVHs6JrMtqte+xxLHn
 BnQ9o+hTkPlKzFgBY7vl3UZ+XFyZIT9vdfTtZrA6tclec4Oxir5mpf8ygb3zlJGBy7xv
 5IYEmJbejzXXCkQNuN1KNRd1InX78lTcDUQaq4TcYAyooUONn/EmilUcWydhX2ZUIqXi
 cw6VcD+UjUcsJRyaDSUI6m0jYU5ppaQ4OGJHGCAFYRcCTEC/BtbvYpHXhR8bm0j0MUEN
 WAXWVWg9xhFp35EZuYchXno3e31VcDssEpXTtuuLaBCsJklS1IEan/KGE6KREVm4cCPw
 IjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+0UfTMfKw1nhPlvjd2Z7SOnomp0saiqh939kTkrTF1c=;
 b=mMib8SlII32nbL9ni0cik3neGbdwD3biSFr7yKGrimr3Nl8bQqleCnZzVmwB7AXt3m
 M05xoOA6k3bHFUBiFcQneYztaZ36CWwEblqq2btKLU9L0eJaEJkVi+HlACJvx55yMJeu
 rIZRudCI5rP8D+x+JW+r0LgUrUz+6Vtdvfx76YzSOCpyWXbtr+ICIuntNGuwCSkzgyg5
 LcBU2e1JBb0nPa1T1mjo8U+7VpXicRWfIAbqhtfXgWneOUo3LYLtA1TaOTZK3EMyweEd
 HP6iI3NyCL6//cQh/fFY9407vuPvTw/BXkJQpIO1WXU8IXT9+WI3mfBKNCbeQ8226od0
 qcFA==
X-Gm-Message-State: ACrzQf3yYyU2N95FYWyNa0UK249WRSyHhoQJ0LfaJ/tj9vOgNOvbN7YE
 xK1QwzbbHXo8+Ff8axnfVDOUyA==
X-Google-Smtp-Source: AMsMyM5/NGFPY2L67tImgpUm1O2z88bYO41U7mzRGwESpgRL+gM8Ljs41MW7HCYRFf2nq2ufxtudcQ==
X-Received: by 2002:a05:622a:1111:b0:35c:b860:8468 with SMTP id
 e17-20020a05622a111100b0035cb8608468mr11299975qty.141.1664029638311; 
 Sat, 24 Sep 2022 07:27:18 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:880d:1e7d:befa:a019:1dbe?
 ([2605:ef80:80b2:880d:1e7d:befa:a019:1dbe])
 by smtp.gmail.com with ESMTPSA id
 dm52-20020a05620a1d7400b006ce3f1af120sm8881602qkb.44.2022.09.24.07.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 07:27:17 -0700 (PDT)
Message-ID: <dd64ff7d-0586-d3ab-5c62-7ee0c062988f@linaro.org>
Date: Sat, 24 Sep 2022 14:27:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/12] target/ppc: Move V(ADD|SUB)CUW to decodetree and
 use gvec
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
 <20220923214754.217819-4-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923214754.217819-4-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/23/22 21:47, Lucas Mateus Castro(alqotel) wrote:
> +static bool do_vx_vaddsubcuw(DisasContext *ctx, arg_VX *a, int add)
> +{
> +    static const TCGOpcode vecop_list[] = {
> +        INDEX_op_cmp_vec, 0
> +    };
> +
> +    static const GVecGen3 op[] = {
> +        {
> +            .fniv = gen_VSUBCUW,
> +            .fno = gen_helper_VSUBCUW,
> +            .opt_opc = vecop_list,
> +            .vece = MO_32
> +        },
> +        {
> +            .fniv = gen_VADDCUW,
> +            .fno = gen_helper_VADDCUW,
> +            .opt_opc = vecop_list,
> +            .vece = MO_32
> +        },

FWIW, you could implement the .fni4 hook and drop the helper, knowing that tcg won't 
choose to out-line 4x elements.


r~

