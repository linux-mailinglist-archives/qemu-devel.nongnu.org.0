Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B651D4D07F3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:50:25 +0100 (CET)
Received: from localhost ([::1]:57856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJNA-0001DC-KK
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:50:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRJKW-0008FK-Op
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 14:47:42 -0500
Received: from [2607:f8b0:4864:20::102e] (port=32816
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRJKT-0002KR-R0
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 14:47:39 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 v1-20020a17090a088100b001bf25f97c6eso536361pjc.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 11:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RsjFmltG6XPTEHCuqFU+fqMd4YvMQYil6AdGLsQM38g=;
 b=byP1xru52IyS1opKDyPWie2eLgINkYMgBieTSRKySbkSWkyrp2kthgzWyZU52uQpOD
 pdLy3WdS/cL9iOrvzptrFgEzekqrJFXECf4DBDPtPngHTikDnjbxrLsuBuPAIV908429
 nzLyvq9VImPyIIzJPIq3+dCWDvNBeKJHd9Awxs2OWkrFgY+NtoZ0udkO5rVQdwRVhOjz
 Bia+gyeE/PKoSMNkOQDQt3Jl/Gqsi5T19V3jJcM6CuxrX3xIUVY5hxXWQ/NOQbCTVGLZ
 8LN3lrFcOlhfxmqimzZOGWz+dsFGm7TzJ33fcnfLX/vm8nsTJ4sd4Q0laEPQm+LxzOgv
 0J9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RsjFmltG6XPTEHCuqFU+fqMd4YvMQYil6AdGLsQM38g=;
 b=zAQw8NWVt9k/DFvaOCjdst7JNgRi4MKbbL+uMkbpWbj6Pvxrfb3Vc/SvdbwfbyKOb8
 pFcsgeMyufknU3xQmR0J6jhXm+Z9YOsxRw6S+SHoqtlLRCOZHh3TneOoMyLFkam7GKDg
 AHj2dqJbdtlVRpaexGAapooaXcxsIW5DDXQoAs6QLgOVtghON3KWuTkhsnfHwFQRmAPH
 c8J715DGkuJktDay1oHxpbXl7FMPZpARiRlIYQNd3uXKomnX4oEWw2GF+pXmhQ9fi4p2
 yQE8Xu86ezYpARo14RUy7yWvPRSQk4ugcrnqp7Uyi5EsVizZQi+v9vXD3VVjUOTZh3r7
 jx1A==
X-Gm-Message-State: AOAM530F3PvDz+1SV9/6gXfsGSfDiVKSuLec4RfX7sZ5qyBuA8ItZIdl
 T0amNNHA2Q+/feNhlgYAQqXraA==
X-Google-Smtp-Source: ABdhPJytD31iWDPd6U27xUsZejlzzgl/Y2ylcQT/J3q+wUMiD9KJV4Gq/muZEezxCrdYfRab07v4EA==
X-Received: by 2002:a17:902:ce86:b0:151:a78b:44fe with SMTP id
 f6-20020a170902ce8600b00151a78b44femr13277346plg.159.1646682455410; 
 Mon, 07 Mar 2022 11:47:35 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 d10-20020a63360a000000b0037947abe4bbsm12818715pga.34.2022.03.07.11.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 11:47:34 -0800 (PST)
Message-ID: <4a6212f0-9491-7260-01e0-e0c0659a1aab@linaro.org>
Date: Mon, 7 Mar 2022 09:47:31 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] target/i386: for maximum rounding precision for fildll
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220307184446.3149199-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220307184446.3149199-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 incoming+7b48dc26643084f29a2bbb8c07f757b1@incoming.gitlab.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 08:44, Alex Bennée wrote:
> The instruction description says "It is loaded without rounding
> errors." which implies we should have the widest rounding mode
> possible.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/888
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/i386/tcg/fpu_helper.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
> index cdd8e9f947..d986fd5792 100644
> --- a/target/i386/tcg/fpu_helper.c
> +++ b/target/i386/tcg/fpu_helper.c
> @@ -250,11 +250,15 @@ void helper_fildl_ST0(CPUX86State *env, int32_t val)
>   void helper_fildll_ST0(CPUX86State *env, int64_t val)
>   {
>       int new_fpstt;
> +    FloatX80RoundPrec old = get_floatx80_rounding_precision(&env->fp_status);
> +    set_floatx80_rounding_precision(floatx80_precision_x, &env->fp_status);
>   
>       new_fpstt = (env->fpstt - 1) & 7;
>       env->fpregs[new_fpstt].d = int64_to_floatx80(val, &env->fp_status);
>       env->fpstt = new_fpstt;
>       env->fptags[new_fpstt] = 0; /* validate stack entry */
> +
> +    set_floatx80_rounding_precision(old, &env->fp_status);
>   }

Yep.

Need a similar fix for fildl_ST0, for the case floatx80_precision_s is currently set 
(int32_t has more than the 23 bits of single-precision).


r~

