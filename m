Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE7C43E502
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:24:04 +0200 (CEST)
Received: from localhost ([::1]:34908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7G7-0006DR-7c
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7Bj-0001SK-ES
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:19:32 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg7Bh-0002D1-E8
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:19:31 -0400
Received: by mail-pg1-x530.google.com with SMTP id l186so6683145pge.7
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jzLdy2T9f1krzAH6izlZNYapwlNKhJWudWp4jBFMMto=;
 b=Aw0u5w+7KsQ0TiPVzPPxGV2EREySzp/LiosS4vXBVNY3N5VmCxxn3zvPMlOyf9tU5C
 tEh8M9oNn80eZQCaRs3gKobpiV51vCc6LLzy+uSscOmxD1DOyqLHrxu+2ugWS7N28LFn
 E7So2DZ7jX6/c5YUyMFkdlHFBO6UvjVrVeRw0TmoKiwldTrZ1tBaizh7RUFYUSNJrPKe
 Xw8ycVkbV0nApmE0fYuLYuDnQNLPcBn1xqtjCpweJYQRuA2dVBBBvdluPnHDIJMPUkbd
 yvwqPna3qu3hqTMMTv7w/VL+wabpNaPi98v24NlT+4QgjCIrK7cayWZ/ZlHEP0PpAK0c
 D1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jzLdy2T9f1krzAH6izlZNYapwlNKhJWudWp4jBFMMto=;
 b=k0M4/WLqALIpzc9KscFdObMHMFj6++Hy95qb/9UzQJofMOBtl1ivXmCIG90sIS4jah
 mhDrGFKtyiSFEam+Btr1vRGYIk5sKOx0dHuh67vo+/lFrkDxCLNJZGbNqKHoRzWLavw+
 CvPKq4GKU0GGrC/hdipyxQEI1KWyGifC2ZNuuAWbGNBO7Ks9CzDvl0M/Lcf2gcUbJGVN
 LzP7u9K9vexRpQ9/KHz+FDmq8t9a/1d6h0+IIe1rTJxDae/F8ZdK134STmce4xel7zzj
 2ln5ogpVcr4PRDjLzj+oX2t1l9cHMq0bmfjdrfOjm98A2ePk9jWrjOBINk8pvW/udCaM
 MFFg==
X-Gm-Message-State: AOAM531VGQEB/iU+DSJH3y1Flv7LptTmDXqM6yPmLZVZpQ1XHKyIxsZR
 OpAGOIHPAhpeehRUXxmOQevfLw==
X-Google-Smtp-Source: ABdhPJyyforXBYZyt842pwWsJHbNPyQ/odp/7TjTJo96vfbLoc2Z8Z+y4vjYY6oLOcvgXHH1RTQ+5w==
X-Received: by 2002:a63:7742:: with SMTP id s63mr3651774pgc.375.1635434368120; 
 Thu, 28 Oct 2021 08:19:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id 141sm3128232pge.23.2021.10.28.08.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:19:27 -0700 (PDT)
Subject: Re: [PATCH 07/24] bsd-user/arm/target_arch_cpu.h: Implment trivial
 EXCP exceptions
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-8-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bd450847-b625-75e9-4a65-a1c2829b7720@linaro.org>
Date: Thu, 28 Oct 2021 08:19:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-8-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Klye Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Mika=c3=abl_Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> +        case EXCP_DEBUG:
> +            {
> +
> +                info.si_signo = TARGET_SIGTRAP;
> +                info.si_errno = 0;
> +                info.si_code = TARGET_TRAP_BRKPT;
> +                queue_signal(env, info.si_signo, &info);
> +            }

Usually this gets si_addr set too.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

