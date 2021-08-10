Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375FC3E7E34
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 19:29:29 +0200 (CEST)
Received: from localhost ([::1]:59870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDVZA-0004if-3W
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 13:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDVXU-0003y3-KP
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:27:44 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDVXT-0003iK-2m
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:27:44 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 cp15-20020a17090afb8fb029017891959dcbso5289892pjb.2
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 10:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h8fR39GuIuhzhy5UC/p3pzNFOuAHGfqWr8tSc5+q7F0=;
 b=MB57z8QCWGyjn8FUbBkW5Sgq8Jlle0X0UPeXr5CZOqs8n6zeZYBwqulxGDeVDd6XF/
 SBu4sQAWzyvyoI5PDkvS07knCtCOTTtRLsXlE12PxliG4QzKR5/Cki0yD1snh58IDVcD
 FuY+7Wdu5wDIFM9lgXYCzkGca9zYLf5jd9+ez9lvdJcmUE0mjUl95/8tASVkmrDV4Mfm
 M2JYFniQb4VgArQCz6+vxHxnV+stTczIg5cHNtgGHlHKWBHmWtdNE3lNg7gMK76qGqgm
 ntNKkCSGjb6USY9y9Va9wAVUt3uGBHC/5CFVeafy2zkVXbBNCMUMPKYSSgqw7VPFsoil
 1JdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h8fR39GuIuhzhy5UC/p3pzNFOuAHGfqWr8tSc5+q7F0=;
 b=Br7MpS+3BOZNoXfQNdhDPqaIqJhjAE/FL5lfiaBzmibr2cIEvjFM6gpI2wVfA4+swd
 HbZXLUk5CZBJDwJP1N9SvnWyEhUzupQ9XUopZEX5KGia/qosf+QSYDfgDKYbQtMd1+h/
 8GMz7uj2MBiEGMyagmoH3G1Cv1P4J9MG36mprWOPfU05Chz5DT5MozStCcww6ttEB6Ad
 DHdS0T3sCaR62KBhBM9X0ZGl5UcnBK3n+FBV8RkPeMlaFwDy7RmlouL8suLQA0QbJRgF
 7DOspPRmRAADKwP/aynAtJL6abGzw9zPIgsD8/yR3jOypwpN04hQ2w6VnxpKlfIqrtS/
 Q8pA==
X-Gm-Message-State: AOAM532T0wDhCn81sI1IyJ3QwE+4enjKht9XdjLTF+764uMq5GwQts4/
 fvlhrwemeu6dEZjr4rtsKG32jq0WSj5gIw==
X-Google-Smtp-Source: ABdhPJwd8sY1vF56tp/Oz78dGlJxEYze1jsqC0YHRiIDukid8gOR4znvQ/oE621m/nFrwUZvnMhxEA==
X-Received: by 2002:a17:90b:23d6:: with SMTP id
 md22mr5876976pjb.149.1628616461349; 
 Tue, 10 Aug 2021 10:27:41 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id h16sm24073858pfn.215.2021.08.10.10.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 10:27:36 -0700 (PDT)
Subject: Re: [PATCH for 6.2 42/49] bsd-user: add stubbed out core dump support
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-43-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <714d699e-029a-1efb-d58e-48fd0bc3ccbb@linaro.org>
Date: Tue, 10 Aug 2021 07:27:31 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-43-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh <imp@FreeBSD.org>
> 
> Add a stubbed-out version of the bsd-user fork's core dump support. This
> allows elfload.c to be almost the same between what's upstream and
> what's in qemu-project upstream w/o the burden of reviewing the core
> dump support.
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> 
> Sponsored by:		Netflix
> ---
>   bsd-user/elfcore.c | 10 ++++++++++
>   bsd-user/elfload.c | 24 ++++++++++++++++++++++--
>   bsd-user/qemu.h    |  6 ++++++
>   3 files changed, 38 insertions(+), 2 deletions(-)
>   create mode 100644 bsd-user/elfcore.c
> 
> diff --git a/bsd-user/elfcore.c b/bsd-user/elfcore.c
> new file mode 100644
> index 0000000000..e3c161942d
> --- /dev/null
> +++ b/bsd-user/elfcore.c
> @@ -0,0 +1,10 @@
> +/* Stubbed out version of core dump support, explicitly in public domain */
> +
> +static int elf_core_dump(int signr, CPUArchState *env)
> +{
> +    struct elf_note en;
> +
> +    bswap_note(&en);
> +
> +    return 0;
> +}

No warnings from this, e.g. uninitialized variable?
If you have a chance, run this through clang-12 (mainline).
It it getting much better at identifying such stuff.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

