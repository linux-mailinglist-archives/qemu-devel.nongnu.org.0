Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F763FCCE4
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 20:19:42 +0200 (CEST)
Received: from localhost ([::1]:33668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL8MH-0001LI-9q
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 14:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL8LB-0000LV-KQ
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 14:18:33 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:38618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL8L9-0001oM-9w
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 14:18:33 -0400
Received: by mail-pl1-x636.google.com with SMTP id u1so7362835plq.5
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 11:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8cXqG7hwNLUorhBWxpBYz9ixly3llfVPwv5TrbFx0Sk=;
 b=GB07wFdAgHJekl7rFRloHVRMds9dDKzXWvPVHy8sPHYIzwbMJo+sCPeeaj0msWhq+8
 RzFOYVj1huiybKr6H6wfqw69VThuTyUdxSVKtkzo+zytiA3jC3wE2ogiSC2q43bO/x2C
 H4F//fwDoeLMKu/uFD/DxMcrSBnkbF0YA0Lppao28HDC3quNn1yppTTkYt7StIN0wVnR
 QfMgTIN/aEN8KNUeA7yW9b2tmXSLxF7Wu34R5/MJOnlvNiulpq9wVhnvo7OgNFvnyB6i
 EuMO+MuOLGRhJ0rbjG0zxHUmfz3V98SWsyPJHFxvY9UDUJ7OP38XPfrUfrxI7B4pvvOk
 tJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8cXqG7hwNLUorhBWxpBYz9ixly3llfVPwv5TrbFx0Sk=;
 b=DPUs+gdzQAScvtagYM1aSjHnNoQYJ7c0wgJoFgWNBfsyFGyrYPxWmY2hFhZYUd7Yxv
 8yfHftD1NBvV1V3ILlv0lmbdjH0hlyc1Fws74vy05TFHUHf8/ByC7fpPQxFqXE2IjMK8
 9GoMzDTnJnC4elv0OQ87/7XSrYIGGp7Qrb08mDp8R2zf36sLiun4SGt6xmJzMeZIJNvy
 CVOiHQoFQzRJWQATqctmIvbZWixw6zPtqhMXycmu6TFkP7f+zUrwQuizmy2yHvaJuste
 tS8DbfuNCXlCiDjnu+w/aBMRkWUrWDzqfgb0b4hy9qKOdjXuO5nzuhGJhNXmXSIiYnlO
 jukg==
X-Gm-Message-State: AOAM5315dxhkDNS5hITn6O/4KPkXH/uLQsALDTGsnGJFETm4FdDt9dKP
 z8MbODL6SrAeVVjp0+t9Lh4Cmg==
X-Google-Smtp-Source: ABdhPJxrQqMar8OkblI6N8Rt6h81e0uwnKfPC124imYV8GcwXx2MdXhpSbgGmPTE25I5M5V0F0silA==
X-Received: by 2002:a17:902:6b09:b029:129:c61e:e31a with SMTP id
 o9-20020a1709026b09b0290129c61ee31amr5713874plk.57.1630433909707; 
 Tue, 31 Aug 2021 11:18:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id z131sm18496287pfc.159.2021.08.31.11.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 11:18:29 -0700 (PDT)
Subject: Re: [PATCH v2 09/19] target/ppc: Implement DCFFIXQQ
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
 <20210831164007.297781-10-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8950469-9db5-b110-f1ef-1cb0b23a5ed6@linaro.org>
Date: Tue, 31 Aug 2021 11:18:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831164007.297781-10-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/21 9:39 AM, Luis Pires wrote:
> +DEF_HELPER_3(DCFFIXQQ, void, env, fprp, avr)

Shouldn't be upcase.  None of the others are.

> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 5489b4b6e0..c3739f7370 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7422,7 +7422,12 @@ static inline void set_avr64(int regno, TCGv_i64 src, bool high)
>   /*
>    * Helpers for decodetree used by !function for decoding arguments.
>    */
> -static int times_4(DisasContext *ctx, int x)
> +static inline int times_2(DisasContext *ctx, int x)
> +{
> +    return x * 2;
> +}
> +
> +static inline int times_4(DisasContext *ctx, int x)

Don't add the inlines.
The compiler will decide for itself, and this hides unused function errors under gcc that 
are diagnosed by clang.


r~

