Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A8B5B57FB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 12:14:24 +0200 (CEST)
Received: from localhost ([::1]:49900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXgSM-0004O1-3J
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 06:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXgLE-0004K3-Ts
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:07:00 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXgL9-0004jw-AB
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:07:00 -0400
Received: by mail-wr1-x433.google.com with SMTP id bj14so14463271wrb.12
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 03:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=VMNfXg/uvtaVB42YN1RIHlLDyNduIcP7Ru2TKIT9/4A=;
 b=BlrKyTKRqM4PDLUAeozcYNl2y/fyYft7gaW//aY50yUV4hIKLku0/7iSIH/WttUd0c
 wfimTXQM7LISF2f4h29eauIfzM3JzFe/luJAEL4eTxZNtXnvTrD4BBrnXtYe+ATbbvoK
 9OTgisz3fVrpp5L1rR5PB1BK8LAo3DCwsXkjlNcA/IBO3AZNcO+HXak8yF7WLiW/kpKB
 P8u8/5xcAnkkHpF0dkV4nlzplcI4l55qc08gkVOr5HMFM0MdfR+QnIbKTpaMy9pb9DAw
 cBo0BW5pTPEY0UKuFaf+JHtOvjBGRk53qPtIJFJt4qOPAfkALgcLXk6pzO4ASAjSIhyJ
 BqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=VMNfXg/uvtaVB42YN1RIHlLDyNduIcP7Ru2TKIT9/4A=;
 b=Y6eiEH0gCrbBL1y/Wcf393HqajNl2TyuyBZqlqwr/PQe7Flt10EJgJV2ZVB8+h9xcQ
 4cv4hapsG4WHG2eeMAdnR3PyAohTAyFoHhYTfcnip5hP4UqYaf+xdK16nPKKGgb7SO1/
 tg904RxzVoKjaSqF7x7Biarm1AeCkTLlRdG9PPIGoDA0Pi/H3JYKQRnkwIz2fEtkOjp3
 oE1WdSSg4y7iJk2rkSokosQD3xIIk2INBeJU0Fz03i3ur1OrbMSk2uOwv2tuMCSG+48J
 4VsujCSwyFavA3sPan++4u2lmNhsfdk/hHGwW16igRNcogJrjMFpJK0zM050YeW9HNA9
 mZFA==
X-Gm-Message-State: ACgBeo3KMI7LMtWwvn1i3ficOTvbgJTD7Yccf3jj4f6otKYb2lKRTag8
 cBY7ahf+R+uXe6hZST8QmTg66pz365TOGkAK
X-Google-Smtp-Source: AA6agR5dkETfELsTgzz5AS9XO1DR3nqJbHkuL1cL4NQMXRqQKEhcaowHoS9wkHsh0c0N3U/uNYQHRg==
X-Received: by 2002:a05:6000:178a:b0:22a:2c1d:f563 with SMTP id
 e10-20020a056000178a00b0022a2c1df563mr11778304wrg.384.1662977212740; 
 Mon, 12 Sep 2022 03:06:52 -0700 (PDT)
Received: from [192.168.44.231] ([89.101.193.70])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a05600000c300b00228d6edade0sm6893547wrx.46.2022.09.12.03.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 03:06:52 -0700 (PDT)
Message-ID: <c9168e45-3006-af7a-9850-9ee5c0b0abb0@linaro.org>
Date: Mon, 12 Sep 2022 11:06:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 09/37] target/i386: add AVX_EN hflag
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-10-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-10-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.101,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 9/12/22 00:03, Paolo Bonzini wrote:
> From: Paul Brook<paul@nowt.org>
> 
> Add a new hflag bit to determine whether AVX instructions are allowed
> 
> Signed-off-by: Paul Brook<paul@nowt.org>
> Message-Id:<20220424220204.2493824-4-paul@nowt.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/cpu.h            |  3 +++
>   target/i386/helper.c         | 12 ++++++++++++
>   target/i386/tcg/fpu_helper.c |  1 +
>   3 files changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

