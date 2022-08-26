Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E92C5A1D7B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 02:06:27 +0200 (CEST)
Received: from localhost ([::1]:58752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRMri-0003QS-7I
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 20:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRMn7-00012M-O0
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 20:01:42 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRMn4-0001xd-2D
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 20:01:40 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 w88-20020a17090a6be100b001fbb0f0b013so3503249pjj.5
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 17:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=6qtqq77ZiF9lwpYmo8ZoMvAaUtuFJZgVRqt9bdQsVh0=;
 b=iMnG+FrXggFlHVBZcz+fYfMxFhN/MaFfRf3jt/X6Wj2osTlIXP55DS05CI8dPUZ1at
 KoEaU3GLRBUVYz5Sjga8FoHPkZBcduySee8mAT3sxLSzfA7fCUdE38K81hbXwagFbJGd
 UN59Wo/Pb32isyqS355qeOSyeLJ1ai4vMbP+wVObXWu069qgn7yQZnaTGIYHJaF3fiv3
 fIBdDdQtavHRpyssnojCdNU2ENK+1vi/GE0d9BT6ppTu2R9GmET3Mlt3a607+cFPuCuD
 8pAepVHWGYu66peSj/p+nz829DgR3tKeR+gD1ls3W/CZPsWIixq2JnixYoNkzmvVoUWm
 Vmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=6qtqq77ZiF9lwpYmo8ZoMvAaUtuFJZgVRqt9bdQsVh0=;
 b=X19S+HldZXmsfPXTKSTT4m8A2QGxHR1dGJdrbdeYpsy5VwWVz/uFUIOpqAkShP6dv1
 EhHFeTpoUzFqviH/cw1s+WqIJIzp0DXtT7C3/fGaSwf+eiCHv52WI/rIl2NxQ/wOfFmX
 HaPxJJx1yj8D7df2LXX+MuTEFcyyd7G8tz+A6MRxRlPwSOMhCMXLk4wo9W59tu3USaqc
 IXOSahjWn7QJ3G3+h1Am8i0uDU9gjYr5bfvj8eq1iZmoYBPeiksSO3VIEhrOZdP4W4nP
 G9vnDx+9HoI3vjX6HFxqVONebpDW3A97V6wTcQ6LiohVaB98NyA68yXFToWOOsm/djGo
 nSFw==
X-Gm-Message-State: ACgBeo3dpptzFgPjh1qC0DHxS79AOQ6H3gf7XdxQP7poX2H9IGzLl/wi
 cLUeyx9F6aj1v8HXBydc8E1mmA==
X-Google-Smtp-Source: AA6agR614/o1Cfn/4vI8YfKx2ZM5SEpnqncG9AEL8zqzlRFsE5ltneWthjb0+MlD8xH0hqxTjqNRiQ==
X-Received: by 2002:a17:90a:3b4c:b0:1fb:166f:2437 with SMTP id
 t12-20020a17090a3b4c00b001fb166f2437mr1594743pjf.151.1661472096598; 
 Thu, 25 Aug 2022 17:01:36 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:345c:4a6c:31b:1fca?
 ([2602:47:d49d:ec01:345c:4a6c:31b:1fca])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a17090301cb00b001712c008f99sm159842plh.11.2022.08.25.17.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 17:01:35 -0700 (PDT)
Message-ID: <520eb01b-fcf0-a5f4-a2cb-50881bcfd281@linaro.org>
Date: Thu, 25 Aug 2022 17:01:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/18] i386: Rewrite simple integer vector helpers
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-8-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-8-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
> +#define SSE_HELPER_2(name, elem, num, F)                        \
> +    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)   \
> +    {                                                           \
> +	Reg *v = d;                                             \
> +        int n = num;                                            \

Indentation off.

> @@ -400,12 +373,19 @@ SSE_HELPER_W(helper_pcmpeqw, FCMPEQ)
>   SSE_HELPER_L(helper_pcmpeql, FCMPEQ)
>   
>   SSE_HELPER_W(helper_pmullw, FMULLW)
> -#if SHIFT == 0
> -SSE_HELPER_W(helper_pmulhrw, FMULHRW)
> -#endif
>   SSE_HELPER_W(helper_pmulhuw, FMULHUW)
>   SSE_HELPER_W(helper_pmulhw, FMULHW)
>   
> +#if SHIFT == 0
> +void glue(helper_pmulhrw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
> +{
> +    d->W(0) = FMULHRW(d->W(0), s->W(0));
> +    d->W(1) = FMULHRW(d->W(1), s->W(1));
> +    d->W(2) = FMULHRW(d->W(2), s->W(2));
> +    d->W(3) = FMULHRW(d->W(3), s->W(3));
> +}
> +#endif

Why?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

