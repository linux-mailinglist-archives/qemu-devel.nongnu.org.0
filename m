Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C126932C4
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 18:11:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQtOV-0002B1-DJ; Sat, 11 Feb 2023 12:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQtOU-0002AU-2D
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:10:34 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQtOS-0003g5-HK
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:10:33 -0500
Received: by mail-pj1-x1033.google.com with SMTP id d2so8320909pjd.5
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 09:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2by6DGFEysqlUsAw+KfJZWW4SgIdrI3aEKPR1QT7niA=;
 b=wNPWgUr/hOieUIjGWPBhqQjO6MnmbOLl3hZYTORGQ8+WIlQ1rUcfuEtO3dofiyuRUh
 +2UP20S8+z2/BHSb3Vo/9sAKROhbD9yks/EE67hYgeCs6r26krwIeXR/ZQiH1BNVm7mq
 xhzf/uTzFDK1DEv0XzEH27Xwr+kAyVcqx6/ZfIiG4HUhQV2/uxbUEubLhIHy+kWX6TKR
 HDVZ3IhhQcG3+rYbycjaAHeNs4P/EgH2YEagEkSyI2yVItYYlnwlaB/Djq2NnKoI543h
 kuku2lEpSGMAfBJqx0ahtuLdtSNw9v9ssWmmvPbzxlT4P4U04efYB4nHL6iJqYGo0pzG
 wbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2by6DGFEysqlUsAw+KfJZWW4SgIdrI3aEKPR1QT7niA=;
 b=zMQ+nP0Ek0aFICEkwdw2oNvDFg6jWSuEe1NtPCTg9du8Mhtsd26zeaLDt3gjFXecT5
 bzc7c9uG+Zvt+8SH2FwhQcrebGn7UoGm3Dob/8+x06FtnADZqkw8s7vmdm4IRSCJ5RPV
 A+7GVx3MwDohmPpePmZdFbfM987IHBoQTa02DSGrW/82/862rZkfyQp698Z8IuGthBSt
 YxKSkwm5iYOC75R0qbHTFJdJy/sbjE+TzBQbi1aVrOF46a3Y410CvhrYhTfIvwMxRS+K
 3SmVCHi4yKr0669n2c3N4RPYRo6DzFeWCkDp8jihbwFbEs4Gkq6sgfie5eripdKDWguN
 zhVg==
X-Gm-Message-State: AO0yUKXEXarx0+tq2Ux37age1tm1FhvlNmCE/E+Fwrt2Vkm8BqTMPdAh
 kcJ6/MZtW/9J6EcTYwfXlu11rxMhGB32iZvA1f0=
X-Google-Smtp-Source: AK7set+OQTsTFAL91Q4KueDMRIASNV7Znhw/s46vmg/bQV239LkfGTK8vtUMon1/b8yb9eVBAbPuww==
X-Received: by 2002:a17:90a:7f83:b0:230:a7e5:b42c with SMTP id
 m3-20020a17090a7f8300b00230a7e5b42cmr21100361pjl.17.1676135430764; 
 Sat, 11 Feb 2023 09:10:30 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 d16-20020a17090ad99000b001fde655225fsm238961pjv.2.2023.02.11.09.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 09:10:30 -0800 (PST)
Message-ID: <d1deba6d-a448-c9ce-12a6-3b0a53d441d2@linaro.org>
Date: Sat, 11 Feb 2023 07:10:26 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 02/11] hw/isa/i82378: Rename output IRQ as 'cpu_intr'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230210163744.32182-1-philmd@linaro.org>
 <20230210163744.32182-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210163744.32182-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/10/23 06:37, Philippe Mathieu-Daudé wrote:
> Commit a04ff94097 ("prep: Add i82378 PCI-to-ISA bridge
> emulation") aimed to model the 2 output IRQs: CPU intr
> and NMI. Commit 5039d6e235 ("i8257: remove cpu_request_exit
> irq") removed the NMI IRQ.
> Since this model only use the CPU interrupt, replace the
> 'out[2]' array by a single 'cpu_intr'.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/isa/i82378.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

