Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AC469D381
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:57:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBLN-00035o-P0; Mon, 20 Feb 2023 13:56:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBLI-00034x-H8
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:56:54 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBLE-00079y-3V
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:56:52 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so1509284pjn.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=59OILGZq1goYLb2j3kwFEicXFGE7Rhg80OG1p6jumeQ=;
 b=ZDwMz41aGShLfkpPEMa8JdfvXNTJZAO5IZg6Lr7BRg2s94deJ/lwBUyzGwpWBkSKqM
 qbFCfxcJBn4tBiS7K0Js1S08M7DGMwgDd0EE96oVza7/2PJIP8Djn3KF2Bdl0t67Zsw6
 NR156NpRYD1irTqwytVD2OhEoShPMcxwQudxMoLPplyksQdU6TvkC8ndrPxZfFejetsP
 II/PQPOyDMtLAV7i4lLM4pdcfvAnhVuE68ebPOA1PFxQhgK6l1ICWN1znNKpYb/ZguhN
 +u/lCOBfCc8NTJHFp1P1OoDVGwjApLNL8jyY8FHhqA2q4DZB43eUWURXOxDvc3lWZVYi
 IRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=59OILGZq1goYLb2j3kwFEicXFGE7Rhg80OG1p6jumeQ=;
 b=GC8dAJAKnJOQdk4yUsMBNIK6DUoW4Z7VPKO4NCWLZf27rs4Ks29x2dIjHFHUwnb1qD
 MYRzQf6yUsqsO8Z8kL5EBS1ZefHVpkUS7F1VyTrXJxFEVNJkwIotbRUCKuFKzvzwzTAy
 p6Lex+c0oOeqpyfy30rEuGzYvqS5jO/TRRgXkn1ve816vrNfFfSqGeHlj+UmD0QQvjfB
 Jcg+jWKrvn+et9xajLIvMTToL/esOFaZHp/caeEF7DSfuHaGEvlB30CYGX5yYR+BD5dJ
 /hynYYQiW129fWtADJTcGJf5aAYmELPCvSKQYFjLNkCeejy0cZuJkmxgCxaQ0dGU4jDv
 gcbQ==
X-Gm-Message-State: AO0yUKUoWAUx+L3iDQE4KG6tIFcjCoPJPuVotMWVlHJceuyZ9YgpxguQ
 Uo67ekEGZzOK7C7AE2cj4mpkKw==
X-Google-Smtp-Source: AK7set/PJV9ouQ56llf/QqpfQ7F81dBhwyn4pgpg/cZT/xh8Ag1g0dvHULwYy8E87MKLErehfseyyA==
X-Received: by 2002:a17:903:280e:b0:19b:c6a:6bbf with SMTP id
 kp14-20020a170903280e00b0019b0c6a6bbfmr2122370plb.8.1676919405869; 
 Mon, 20 Feb 2023 10:56:45 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 h7-20020a170902680700b0019a60b7cc0esm8206217plk.248.2023.02.20.10.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 10:56:45 -0800 (PST)
Message-ID: <0c394e48-0a03-7152-69ce-cd5e034dae91@linaro.org>
Date: Mon, 20 Feb 2023 08:56:41 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/8] hw/char/xilinx_uartlite: Open-code
 xilinx_uartlite_create()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20230220115114.25237-1-philmd@linaro.org>
 <20230220115114.25237-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220115114.25237-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/20/23 01:51, Philippe Mathieu-Daudé wrote:
> Open-code the single use of xilinx_uartlite_create().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/microblaze/petalogix_s3adsp1800_mmu.c |  7 +++++--
>   include/hw/char/xilinx_uartlite.h        | 20 --------------------
>   2 files changed, 5 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

