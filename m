Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95C26727C5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 20:03:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIDh9-000761-HW; Wed, 18 Jan 2023 14:01:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIDh6-000757-2j
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 14:01:56 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIDh4-0001hP-1L
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 14:01:55 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 7-20020a17090a098700b002298931e366so3125487pjo.2
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 11:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/k89b5Z2Ac8Ya5icS0puj1BpWvgAYj/fNxfmLVTRJSo=;
 b=Qc3cWwP1QloRx+zGqPjs5C5+JazzxYfoQ0wRj9WBFE3slgWtRJJllydfN/w0cRu4dr
 SPXJDchtNxX8ZleoX+KoSkQ/BMkA8nt2gqZgvzKwaq68S6i+WuOJi1XRGxD/otCMb8mm
 7TiN8JRHKUQhw7wV6slenOK2H9irO7IoYbEnuuffDYQGkoJs61GFBc9NeT9VbFWScLXU
 s22WiDT7IS2TmjO4Y5P/iMtgTI85Mo8IfhcuhhtOQmH2aqJydrMkzMbCKhzcWWfhMRe5
 hX8DrrEX6gYZs9sxiVp4key2hUZ6gYLja5fcaBp9v5e3+0UoeAi3UQdpme+A1hILClTb
 lczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/k89b5Z2Ac8Ya5icS0puj1BpWvgAYj/fNxfmLVTRJSo=;
 b=0fR0fdzFz+qQFL8e1i2iMMZaQfbjeCyMjdp4pfGIAognRRacKC9hvviw3bhxiOw4g/
 hTCwjJdRRF76jLQf7zxh40C71gxFTCkDXTv7zmyrU7G+ougbeafoFFIG+f3j/qXwRkPb
 aY6hP19t3KI0knWRERS/il2fZ0CnVciKMqBuWgz2yE+TTFA9ZaG2wPfdOZ5C5BmGuwQO
 dzsi1cZU+M28CO3VHWwmRNUqyby9mc1S+Et76CgB2GLy2EYel/953l4+mZYH4cmQ5G0n
 KMabusGDKpAZlmYvU1A5Bj2gjmGXOvXKD4Gf3/2YRqjTa/6JLGLqiUKs/FhVCWsSiQS6
 LJiw==
X-Gm-Message-State: AFqh2krSWHkRsGhTwHdX9VvaUlSRDOhFmaZ2miAco6FejVGXfI6zb1yL
 I0uVo42hrs8YipF/dLIzLj+CYQ==
X-Google-Smtp-Source: AMrXdXsBVqvlbHV8ix7StsPwzpQINDQP/H2bEq1IPfZ+CSmKXcvNZiCcQezrW2XAfY1vmiKehNLd+A==
X-Received: by 2002:a17:902:9688:b0:192:55ab:88fe with SMTP id
 n8-20020a170902968800b0019255ab88femr7779232plp.56.1674068512349; 
 Wed, 18 Jan 2023 11:01:52 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 j5-20020a170902758500b00192d9258512sm23458419pll.154.2023.01.18.11.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 11:01:51 -0800 (PST)
Message-ID: <50ed4971-3fe4-327f-932f-51c0be6acb7a@linaro.org>
Date: Wed, 18 Jan 2023 09:01:48 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] target/tricore: Remove unused fields from
 CPUTriCoreState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20230118093322.49307-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230118093322.49307-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 1/17/23 23:33, Philippe Mathieu-Daudé wrote:
> Remove dead code:
> - unused fields in CPUTriCoreState
> - (unexisting) tricore_def_t structure
> - forward declaration of tricore_boot_info structure
>    (declared in "hw/tricore/tricore.h", used once in
>     hw/tricore/tricore_testboard.c).
> 
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> Reviewed-by: Bastian Koppelmann<kbastian@mail.uni-paderborn.de>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> v2: Do not remove 'hflags' in case it used:
>      https://lore.kernel.org/qemu-devel/20230118090319.32n4uto7ogy3gfr6@schnipp.zuhause/

No, remove it, I don't expect it would ever be used.


r~


