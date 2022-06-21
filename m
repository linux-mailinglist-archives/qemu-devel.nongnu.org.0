Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E503E55352B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:04:55 +0200 (CEST)
Received: from localhost ([::1]:53338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fR0-0006dF-Lo
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3fIE-0007dX-1P
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:55:50 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3fIC-0000cs-H1
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:55:49 -0400
Received: by mail-pf1-x429.google.com with SMTP id d17so4363804pfq.9
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 07:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=scCO5s8P/2Bpa1jIsrgGR4j4cKlH3GKPV6Ai/p2Ag0o=;
 b=BapHZHrueL+mT2w1Edk2Dv4dynExxVtBsoAJwIwUWTHMJNdTBFe0ADf2dN9fdSEoZ5
 +uK5cvO+5VPDIFaGyAnYGAoQvWNxRtFmSWyW4A+/Ki+EPJ3dMaGxcxRTCi62P9W7/vwf
 1wROTU6WrK6H4TnxKpwRAmQP1f6XQXQUp7zyp/LWcWbI8ht3CtkTnet3EJvAhC3cjKui
 4nX/4sh8j0bXtmFQTST0o8akWAxVNTh6jmGlIDbHSdCxfB26zd6kvBLF2+mA1LYHwVOx
 YuvNjvgdYvrtK41OT2R1lti4TcbGunipTqp3CRq2VvflnnWN9R2rg2qf+ku2NGRdD9uV
 C1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=scCO5s8P/2Bpa1jIsrgGR4j4cKlH3GKPV6Ai/p2Ag0o=;
 b=RS9u9PSGv+chHK/DyphNLkeZ7FpeqJnLU+OEn0478dqYk1apcefSRDA+WLwAnSS7L4
 HP2Y3edgJ4hcSTiXj27PD43Fzk2YZuNtRT2GMk8JjKjOwcf3SqTowrp/C/P+vzsTvYba
 /6KIUAJra/TSnpXQJXSIwPDXAIhBP1i0tIlj3tVJe9QjPJSzxp3Om3eviYoNSHviQDp/
 PmPDATAdL54WkGdUGefqf606IT0K0Sy0/+9j2Rrrrv10OvIxjvv9WjgVRhLMRYzN72Ff
 COLfaCaCac71GvuXY5LTUxbR9XhK2ipmv2AoDsLjyW7MXV0xkRsGYAPm8Dq+jWGEl4UY
 YHEA==
X-Gm-Message-State: AJIora/aflTo8vK+MGJtJZT7JXn+HeAN8qweYk5CZ8int816FkMQGlgU
 5GlOArC1dTa3Dp0J4g13msjEqA==
X-Google-Smtp-Source: AGRyM1u/yqY2rC2zZZ9Zb7tulz76OeoTVv+9k/8WroMo90rDmmwxw7yWdQWf/vh5qXyjJfmLX9apIw==
X-Received: by 2002:a65:6c08:0:b0:3f2:6a6a:98d with SMTP id
 y8-20020a656c08000000b003f26a6a098dmr26344973pgu.30.1655823346716; 
 Tue, 21 Jun 2022 07:55:46 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:8adc:a144:6ec2:4d71?
 ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 i65-20020a626d44000000b0051853e6617fsm11441983pfc.89.2022.06.21.07.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 07:55:46 -0700 (PDT)
Message-ID: <d2a9550e-28dc-bbd1-098c-ea16a4a031d5@linaro.org>
Date: Tue, 21 Jun 2022 07:55:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/6] configure, pc-bios/optionrom: pass cross CFLAGS
 correctly
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220621075147.36297-1-pbonzini@redhat.com>
 <20220621075147.36297-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220621075147.36297-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

On 6/21/22 00:51, Paolo Bonzini wrote:
> diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
> index ea89ce9d59..e90ca2e1c6 100644
> --- a/pc-bios/optionrom/Makefile
> +++ b/pc-bios/optionrom/Makefile
> @@ -11,7 +11,7 @@ CFLAGS = -O2 -g
>   quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
>   cc-option = $(if $(shell $(CC) $1 -c -o /dev/null -xc /dev/null >/dev/null 2>&1 && echo OK), $1, $2)
>   
> -override CFLAGS += -march=i486 -Wall -m16
> +override CFLAGS += -march=i486 -Wall $(EXTRA_CFLAGS) -m16

Hmm.  I'm not sure about this.  Given that EXTRA_CFLAGS is going to be e.g. -m32 or empty, 
being immediately overwritten to -m16, I don't quite see the point.

It seems like there should be a third cross-compiler "i386_m16" or something, with a 
different set of cflags at the configure level.  Overkill?


r~

