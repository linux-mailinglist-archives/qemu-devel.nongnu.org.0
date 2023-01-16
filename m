Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E393466CF84
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 20:26:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHV6y-0003sC-Hv; Mon, 16 Jan 2023 14:25:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHV6s-0003r0-C8
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 14:25:36 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHV6q-0000J2-Ps
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 14:25:34 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso34882083pjt.0
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 11:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eyYkCjv1JhpI0P/XGbq0il4pxA2JZBl0fYf6DerZDr4=;
 b=VCg3IVuDoDmeX2FE2U0Taghfp0lTK0mgPqSquyYUmQGCq3TL7q1PENRu6aC8xIy1rq
 rNOfaVEP4nf8SswK/0ZUc7Ao85qG52R5FOA5qQWhEXAKXToGQhX6JoBVk9LcFv90a1JB
 OgpU86pTsmE8lvy5jFEeTPpfGA3CJAn/tA0qUAXIh3iRMuFKdH0WrL/bR0JRWyGkaJD2
 D0zu00CturcNUMhjTQmIo0C6bh+2S+WusmVqMSEAQrebDkFiSW8WJEf3OhiNL68VRbEC
 LI4DusyPARG+3igoiOndMJbrUfbWb0kIKAVtO2oG0T1BE/EBgifTnxRoHtxyarklsrxl
 4MBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eyYkCjv1JhpI0P/XGbq0il4pxA2JZBl0fYf6DerZDr4=;
 b=6Ep3wLNEk5Xb5jSA9eHWj49gVblJyyuGhFnm4iWtXyztEPmFMrmZxK4hEXzqXR4O/o
 rPEcfG6w03HNJR5vg7nEL1e/OEKIE9ro9TfLJW0q5UN0470JOwDksqSrIVo4/zVGnnNS
 NRrAJ4tVasA6LaO2dWiElDhxSVd+5k/AhyjdpExd8Cr0/6u+9JdjM4NvAJIg3TQeQZaQ
 ehXEnczBUiEJrk/dymzCiGfabYUKo8NBej/XaCBmitSgAWsU/kuomFZ1ogg5PAOyJEhL
 i4tNv6rzlP/Fu3BKXf8j4W7YL5955iiFMqVfV5nlHQjsEhTsF+TStoVanwXkmuKRJHM3
 FbFg==
X-Gm-Message-State: AFqh2kqBgH/VTbu4CgU5J7OhiAhJHAvCUsUMeFtCGDInERIRh53EaOqX
 qiECModFGHi7L65jvBzIi2HGhpyhbekvE28u
X-Google-Smtp-Source: AMrXdXtXbDC+ntB7uAkdbXVoCIOXeH+6VtR3BQXHzxiAHddJ2jmZzKWHpCZBhjIt+KPacx3lWKNxEA==
X-Received: by 2002:a17:90a:5b0c:b0:229:2458:4b2d with SMTP id
 o12-20020a17090a5b0c00b0022924584b2dmr414508pji.12.1673897130928; 
 Mon, 16 Jan 2023 11:25:30 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 u3-20020a17090a890300b00218cd71781csm17142097pjn.51.2023.01.16.11.25.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 11:25:30 -0800 (PST)
Message-ID: <ad966746-62c3-0e96-ae43-b6ddd7dd8ce1@linaro.org>
Date: Mon, 16 Jan 2023 09:25:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH] tests/tcg: skip the vma-pthread test on CI
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230116173233.2948746-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230116173233.2948746-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/16/23 07:32, Alex Bennée wrote:
> diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
> index e7213af492..ae8b3d7268 100644
> --- a/tests/tcg/multiarch/Makefile.target
> +++ b/tests/tcg/multiarch/Makefile.target
> @@ -42,6 +42,15 @@ munmap-pthread: LDFLAGS+=-pthread
>   vma-pthread: CFLAGS+=-pthread
>   vma-pthread: LDFLAGS+=-pthread
>   
> +# The vma-pthread seems very sensitive on gitlab and we currently
> +# don't know if its exposing a real bug or the test is flaky.
> +ifneq ($(GITLAB_CI),)
> +run-vma-pthread: vma-pthread
> +	$(call skip-test, $<, "flaky on CI?")
> +run-plugin-vma-pthread-with-%: vma-pthread
> +	$(call skip-test, $<, "flaky on CI?")
> +endif
> +

Ok I guess.  I'd have thought the ifdef around the entire mention of the test would be 
better -- no point in even building it.  But,

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

