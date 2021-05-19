Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8106E389354
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:11:40 +0200 (CEST)
Received: from localhost ([::1]:35052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljOnL-0005EM-92
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljOlT-0003hk-Qb
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:09:43 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932]:39493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljOlR-000509-A8
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:09:43 -0400
Received: by mail-ua1-x932.google.com with SMTP id f20so595401uax.6
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 09:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=icOHmN6t2i0MlzgRobRuqALQTB7dKgtD5XSwsFfE3b8=;
 b=PrpjTFYcTkAjm94b3XNpAqPma88B3+gZUvUFQmUo69NyBBuVVzP8z83IetMt7pOW82
 exYocWOaf+dmbK9SlRMCOEuf2iQrA6qpXSi2nyZJKsA7lnFdI0bk1qtdTrNeyWzTlC5k
 rdP/DysA7udLORcWj0T2UnJOMYdbilrqPgcSP377NSiLuqxsFpx1m8k47E4irSjNncq+
 bg2DaGRjbS2i0q3AaJ0BFyBVL9T7eqDkRBOX6ex5/JV+tTcEUETNmdWATEnxJttNlMRl
 DudiUGLvCbwvdaZ3Zgoz6s+VWxS6auotyMZvtxaYI60aregIP/FVtSvxqK23yY2ZU9y6
 xoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=icOHmN6t2i0MlzgRobRuqALQTB7dKgtD5XSwsFfE3b8=;
 b=l87l5Uu2gXjcHuCNGJPeYNaNjQBMqiAgZUI8KaN6pzq/2vrPH6LXtilqZRP3g3nCLW
 SsFFGHTwYiCAYvREsOgjbXmJDv6P/nE4AB26NBiJ4sbWoT0rWYPmMFCtx/eiKySEtFgP
 JqUCjIIledlPF90cvEO7cs5YHP/m36XnJjTN1U9GCYwhXUL052cXEujuMfZ4fILom6H1
 wyqd8+yLNsNF+txz871nqB7YGDBidyDiH7OjV+wB6/3XEIiXdT12uUYXCXbEhM2Dq5qY
 CI8q2ubkH8CFdh8VyFKDceEyzqj1Ad9J3e9gUOE2bfm1ctcPHpCa6y0e/u0b8rj0cIzE
 f5Fg==
X-Gm-Message-State: AOAM531KE8fLIrAdRUCvSXbtmrACrPZ0YywldYQseqP5SUhOdBp4Wwu0
 PNJtKpdFX0ShAqQYEdrLDcZiLg==
X-Google-Smtp-Source: ABdhPJyvYOEffO+XNuF1lQEy851GsgFHtOlCttP41O7X/3rK9e+qvHm9U2thsD525YIjZavEErtRmw==
X-Received: by 2002:ab0:6586:: with SMTP id v6mr135389uam.114.1621440579582;
 Wed, 19 May 2021 09:09:39 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id g72sm13846vke.0.2021.05.19.09.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 09:09:39 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] target/ppc: wrapped some TCG only logic with ifdefs
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210518150515.57983-1-bruno.larsen@eldorado.org.br>
 <20210518150515.57983-8-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6d2d649-3176-7821-e64b-a418a287e90a@linaro.org>
Date: Wed, 19 May 2021 11:09:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518150515.57983-8-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=richard.henderson@linaro.org; helo=mail-ua1-x932.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 10:05 AM, Bruno Larsen (billionai) wrote:
> -        if (i == 2 && (mas_mask & (1 << i)) && (env->insns_flags & PPC_64B)) {
> -            uea_write = &spr_write_generic;
> -        }
>           if (mas_mask & (1 << i)) {
>               spr_register(env, mas_sprn[i], mas_names[i],
>                            SPR_NOACCESS, SPR_NOACCESS,
> -                         &spr_read_generic, uea_write,
> +                         &spr_read_generic,
> +                         (i == 2 && (mas_mask & (1 << i)) &&
> +                         (env->insns_flags & PPC_64B))
> +                         ? &spr_write_generic : &spr_write_generic32,

The mas_mask test is replicated, and the second version inside the ?: can be 
dropped.


r~

