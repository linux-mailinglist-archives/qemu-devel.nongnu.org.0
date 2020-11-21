Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76D12BC1BD
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 20:40:31 +0100 (CET)
Received: from localhost ([::1]:43892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgYkI-0002EV-HW
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 14:40:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYjD-0001ob-1C
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:39:23 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:46925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYjB-0002vW-BB
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:39:22 -0500
Received: by mail-pf1-x444.google.com with SMTP id v12so11100141pfm.13
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 11:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RhHyLUoVTNGeqlM10IsU60yhoodDpxWItWqwMLRZwcs=;
 b=q5f0KIFECbajequPHigVDhHYZy4d9EDGbEuCbyQmkjNTbpqVd/toiaT+/ybGB/5Q7E
 +hL0nT/n5AESXeOz+66F/hQAahxyqwDO+Sg38R9g2orzHyfQ69amM9tU7sjlLJjaUtVd
 6l5q+Fu9uzmPcqYzCS6Fhi+PDwIW4lHLo8NoueTWc6Z1IGgYHcn8oh+Yu3WcrCJtHMuC
 z5yWqbZBLjRtxxYcJIJ8bmtr7+nca6camFWK+R+zPJcpF5hb2ooJjcy6WMaUyRjNeWRt
 E0t5gyH+I9CXYY7Po16JNDMTt5oI0N7bQEDGDtQKF5s8USu+WPE8VEmRcKFo4ZMu5PUv
 mNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RhHyLUoVTNGeqlM10IsU60yhoodDpxWItWqwMLRZwcs=;
 b=jnPDWZbryxUorOtk0ZFJkgEa2PhJKectQRUdLnGiEQkPF2R/hOkuoSRdOJWN8yHUJp
 iH4Xy21ORM2i3GxrZ5yjfyKjePatgrpw+cD8eZgfGXVjWo902hRjjTMkNgdL5A53m9yQ
 5v7IumyMTi+EdjRCyXNoagyJu37jadsIrfKCdnUnNATvCaFje+mHTAYy+OFp/qmEFTV8
 5M/5P83+/+QYg7ztDyNRVzOhGT2SnC1MWjoHIvpSB6fRilsvxHwbKgJMWNkFUmqa2NLd
 9j9qGPQ6jFZSvXTCFnQtrAo8vLaDhhog3eryMc4nQRXka4CoDvaly2UW2teHKUV7RZ1g
 9VLg==
X-Gm-Message-State: AOAM532B69Dc3dW0nGzkZ25MXf6V8BpwF8KFaAh+GLk0fXVFIYnf2wfC
 DhvSZ9hIy5g/Qw2I7+74Bts2Gg==
X-Google-Smtp-Source: ABdhPJxUDrVJ11lHpTZQvVurai2g7YkCQ4cuZeY4wSN5m9jG6iNRPegG6OTzZK3T3YSilrQ0VY5QNQ==
X-Received: by 2002:a17:90a:6b0d:: with SMTP id
 v13mr17003383pjj.206.1605987559500; 
 Sat, 21 Nov 2020 11:39:19 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x30sm6781148pgc.86.2020.11.21.11.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 11:39:18 -0800 (PST)
Subject: Re: [PATCH 01/26] target/mips: Extract FPU helpers to 'fpu_helper.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <663f897c-9ae2-49d0-89a3-1224a7f56c93@linaro.org>
Date: Sat, 21 Nov 2020 11:39:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> Extract FPU specific helpers from "internal.h" to "fpu_helper.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/fpu_helper.h   | 50 ++++++++++++++++++++++++++++++++++++++
>  target/mips/internal.h     | 42 --------------------------------
>  linux-user/mips/cpu_loop.c |  1 +
>  target/mips/fpu_helper.c   |  1 +
>  target/mips/gdbstub.c      |  1 +
>  target/mips/kvm.c          |  1 +
>  target/mips/machine.c      |  1 +
>  target/mips/msa_helper.c   |  1 +
>  target/mips/translate.c    |  1 +
>  9 files changed, 57 insertions(+), 42 deletions(-)
>  create mode 100644 target/mips/fpu_helper.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +extern unsigned int ieee_rm[];

Note for future cleanup: const FloatRoundMode.



