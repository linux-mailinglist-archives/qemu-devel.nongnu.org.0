Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F08234BE47
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 20:37:01 +0200 (CEST)
Received: from localhost ([::1]:46158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQaHU-00085E-88
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 14:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQaFO-0007UW-6s
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:34:50 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:33561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQaFJ-0004ji-WC
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:34:49 -0400
Received: by mail-oi1-x22b.google.com with SMTP id w70so11139659oie.0
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 11:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EMiaHPk9UBs1qynCpOsiMnYcdAGYv5aSwr2qJ7XZkpg=;
 b=RKszZj+RByLWaExzz+5i0ASD0yz4JwONDfCqJNpi6vAih5BpBnCBGy8rVFUgwn58S4
 Qe25YSJDqHQ+n26hSTRWHs+scKPCLSX+wy5ZMDs4gJuQIe2WNHWv4eAHtgMTt04rhagi
 fVm65ltAPvvC3ohxoL7e0gXIPMaIso6D24S62YbjJZlsiWOP5eHgcgbpmnKZqsCUU7xm
 va1TNEUPJ5meK6byLtVYG2z+TQ5nxkTQ5D5zw9POJQgc00GIA7Dtm+iChfuW4VFIUbAh
 fVZ+bHLeWn8MRd8kPucS1OPki/LK+D1YMghuulzKXs2uWWgh2r/HuU4FKm4L8MF6pC5A
 TeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EMiaHPk9UBs1qynCpOsiMnYcdAGYv5aSwr2qJ7XZkpg=;
 b=c2ZA7SwjNYISbVRufaUHkthrKVTXFtG3BGfJcm6lnJPhXvGMVa6SrdMYPK5jr4koQS
 NZGWld5elh//poWi+qDW6epNyT7zBdJj8ilI2PhHHVRJqnrQIXNCfViyzouVCSvB+Seq
 dxLKoDt7H+mLltXPRwlW+KQYuc0/3/3NAGziLQdOL6wmMo2AH/oz6U11I1bGsuIHzQ+y
 Tf4HoIzzOG0XSih55g0gSqnb0J+EnHzuK6i9FgD5GKZT/96Mpj/pLxOxQmKuL4qnR23i
 FL2mihZmQd1bjvmwt6/RcMaGGCVJWsQUxQFVQ5CsOfvCH+DFqghOvpp9QPHnK9UW+CgV
 vumw==
X-Gm-Message-State: AOAM532opLp3wsf3DvSKJlp0r9sqthdjAoy8jVpKsbtvTUNmWfixKcot
 6k/h3AZdXSE4d4nFFQtWy6JcdA==
X-Google-Smtp-Source: ABdhPJzvhl6BQJZTzABplhF6Kz5tN1Jju0iRT3ddGRbSQPt+E02a/k3l0fwDKzjDnO4W5xDsgdtXZw==
X-Received: by 2002:aca:4a95:: with SMTP id x143mr16170287oia.59.1616956485005; 
 Sun, 28 Mar 2021 11:34:45 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id j72sm3088161oih.46.2021.03.28.11.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 11:34:44 -0700 (PDT)
Subject: Re: [RFC v12 53/65] target/arm: restrict rebuild_hflags_a64 to
 TARGET_AARCH64
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-54-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <595e3b23-9503-21ac-6ad7-6b7c70d1bb9f@linaro.org>
Date: Sun, 28 Mar 2021 12:34:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-54-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> @@ -1084,6 +1084,8 @@ static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
>       return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
>   }
>   
> +#ifdef TARGET_AARCH64
> +
>   static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>                                      ARMMMUIdx mmu_idx)
>   {
> @@ -1204,6 +1206,16 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>       return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
>   }
>   
> +#else
> +
> +static inline uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
> +                                          ARMMMUIdx mmu_idx)
> +{
> +    return 0;
> +}
> +/
> +#endif /* TARGET_AARCH64 */

Is this even necessary?  Isn't it removed by the is_a64 test?

r~

