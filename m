Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17443D2FF3
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 00:48:26 +0200 (CEST)
Received: from localhost ([::1]:38384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6hUP-00081l-S9
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 18:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6hTX-0007La-C3
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 18:47:31 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:42938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6hTV-0005eO-Q9
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 18:47:31 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 hg12-20020a17090b300cb02901736d9d2218so1343584pjb.1
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 15:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bL0MeK9PXNev2GmghdiLPneJ/nZzzyamOIEI+pPtGlk=;
 b=DaYsLGfdVuG9Jp20ieET2ZVH6ec8B4kEQya84Ce+9hixCYDgFMvX3urUx6AQX092uL
 ROIWjNECLZ4lsftH88z9rkoHH3OIDURNXYa17xikrfGtrClFRK+JzA3hkEnZm9bHuEtk
 gTRCHQqhrBokYZY2HWq3VwLG0d6YV0KNDNs+kOEodipNxVctLrLnhqY9JAj1eTT2d9Bv
 1tb3unzsbLndmeYzMmvirK6DFHZEr+GAgFcHKGdDMm80ZmajKPJ/Y7T1QgPNG6c8dLQE
 I8DeUoqbtsxcVEZXFy9Ho5+yYliZhiSBJqoQzADVP6TSlXG4er/nwSO9tDjvwnXr8Xa5
 EJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bL0MeK9PXNev2GmghdiLPneJ/nZzzyamOIEI+pPtGlk=;
 b=lD2Xx7GgdxuJBzN/2lnMAhiZ0RPMb+1/LwAGbeoeHcyGmDHV4b6Rpqp+dZhjcYXkmz
 mr12MI3yXZDDCtvAji+xBQXldrkCCabi8FtdD8Qh1wnkPTmCOfrU2qPojx6iMPVQAurv
 b3/Gvbc5ZNm5dwgCOa4WNqmkwT34HLrn9cEZ+H5zSZ5+Vswp/pqrAHYU6Th/uMx2ONLk
 jo0ko2fwWbueD5KDPAnfkt4bIQdQ3GLcOPTUKc8f304/gkNwB+1p+QT/Ebgn/YRGO2+N
 pkJhfYRg/+xFJZzw5re+Of90X9OWpv6GyuW05gnpxN1OqBjv6/svgOxclMEAscdk3+ma
 T+lQ==
X-Gm-Message-State: AOAM533xhKTPElOTrhbA05pNnSU0cj1xJuEfp4mnJbS+zYOnD3+Qf3C4
 nYhJZLSbR+zFcZ419eEpEPqQqw==
X-Google-Smtp-Source: ABdhPJxL5b+dB9FqplrAOMLw5rOKzTpYiuzgg8ZeVnACrquGxcxdDwWvUcfBhmV8C7XJDCz2kSuJYw==
X-Received: by 2002:a63:dc15:: with SMTP id s21mr2077800pgg.281.1626994048217; 
 Thu, 22 Jul 2021 15:47:28 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id kz18sm26659162pjb.49.2021.07.22.15.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 15:47:27 -0700 (PDT)
Subject: Re: [PATCH v2 04/22] target/loongarch: Add interrupt handling support
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-5-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc0364e8-8cf3-da3a-a264-d82f3959b279@linaro.org>
Date: Thu, 22 Jul 2021 12:47:23 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-5-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, laurent@vivier.eu,
 maobibo@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:53 PM, Song Gao wrote:
> +bool loongarch_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> +{
> +    if (interrupt_request & CPU_INTERRUPT_HARD) {
> +        LoongArchCPU *cpu = LOONGARCH_CPU(cs);
> +        CPULoongArchState *env = &cpu->env;
> +
> +        if (cpu_loongarch_hw_interrupts_enabled(env) &&
> +            cpu_loongarch_hw_interrupts_pending(env)) {
> +            cs->exception_index = EXCP_INTE;
> +            env->error_code = 0;
> +            loongarch_cpu_do_interrupt(cs);
> +            return true;
> +        }
> +    }
> +    return false;
> +}

Not sure what you're doing here, with user-only.  None of these conditions apply.


r~

