Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09306B53BE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:04:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakpw-0003OZ-VA; Fri, 10 Mar 2023 17:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pakpv-0003Ns-1X
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:03:39 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pakpt-0001hf-Co
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:03:38 -0500
Received: by mail-ed1-x529.google.com with SMTP id cw28so26282028edb.5
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 14:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678485816;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vl99VctdkI0Agtf4xJ9wv+ySYQZbxZQC7CwfwyNcZuw=;
 b=QOPIXpL6U1GZBYIadhs16dhm1esKPaOps5juR3QcsOKjBXDLeOq6tLBkYoh6bJ2WcM
 khUAi3kOKbrPBQ7oKNUakXkUBSjcfUWbDeJSb9DfKWGlbXIDdi04E9OeXehgHRcPbP6V
 SOFOnCweAuA/uG1uO56/LxeU7ofJLksxIzP1Z3LMsVhL1Z69PpXNNHqSdCQvbqiWfYIO
 ihB2S91UztWL7aSeVZEiBcvBhmPuNFoENoDY2L+UDWqFf+/mNiESt43e/OT5a0Mu4Dgi
 5SUJAMRPDG4V2pjfV6o1i5ECmqkFXwS/dVhWdv2bn6J+EsMQDjAZBkfJ2/6ki9cwewbp
 4x+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678485816;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vl99VctdkI0Agtf4xJ9wv+ySYQZbxZQC7CwfwyNcZuw=;
 b=g1mfwLE9RAajjNvO/p0UidbBfMW/Net4wmBC5HY+5/dHqXAOxc0Qs5Zuc0evfcKusa
 R9ap1LZvdFEBlDFerYdZ6GZQdn39/Ry7BaiOtQ/UnTiLuDoTxmWjBL9yuwwuVDeFlHmr
 j8LL9eYJ8Hesqc9sQo7dDmQEeQ0ahyKRIKVeAQKGp/OZC7ueoplGQm7qUXGbZ9JKTjBz
 VIQ0C2rp5On02lEqUlDUwxlM7pKYPGDDSNV1NnLtISnChtf4O1Epxa0r+pWwK8OkXC2U
 Nnwv7c9z40SavTRhvZapR0BgwU80Lj0uiKJoEiIbcTsCUnWRQB2e2eZ4GcVEaeJoA2mn
 VXQg==
X-Gm-Message-State: AO0yUKV7wiiCZZlo4S4mV40XtabOR7w14sI5YN33qLIP3boaTxyPB5d3
 byryXBaa03l5yF/dGz0yUjMFMQ==
X-Google-Smtp-Source: AK7set81HKZwptIDFoJCA2XY6Km6rvGkP7DaqBoquXRPq9JjGkioZUPODyKtYAsu7X/dqq+ssNekTw==
X-Received: by 2002:a17:907:a2cf:b0:884:c45f:1c04 with SMTP id
 re15-20020a170907a2cf00b00884c45f1c04mr28255655ejc.2.1678485815696; 
 Fri, 10 Mar 2023 14:03:35 -0800 (PST)
Received: from [192.168.1.115] (116.red-88-29-161.dynamicip.rima-tde.net.
 [88.29.161.116]) by smtp.gmail.com with ESMTPSA id
 hx12-20020a170906846c00b008f702684c51sm335802ejc.161.2023.03.10.14.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 14:03:35 -0800 (PST)
Message-ID: <3c786001-600c-5e3b-b519-e312a298b5ee@linaro.org>
Date: Fri, 10 Mar 2023 23:03:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 4/7] *: Add missing includes of qemu/error-report.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: cota@braap.org, alex.bennee@linaro.org
References: <20230310195252.210956-1-richard.henderson@linaro.org>
 <20230310195252.210956-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230310195252.210956-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 10/3/23 20:52, Richard Henderson wrote:
> This had been pulled in via qemu/plugin.h from hw/core/cpu.h,
> but that will be removed.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/accel-softmmu.c          | 2 +-
>   block/monitor/block-hmp-cmds.c | 1 +
>   dump/dump.c                    | 1 +
>   dump/win_dump.c                | 1 +
>   hw/arm/collie.c                | 2 ++
>   hw/arm/cubieboard.c            | 1 +
>   hw/arm/musicpal.c              | 2 ++
>   hw/arm/npcm7xx_boards.c        | 2 ++
>   hw/arm/nseries.c               | 2 ++
>   hw/arm/omap_sx1.c              | 2 ++
>   hw/arm/orangepi.c              | 1 +
>   hw/arm/palm.c                  | 2 ++
>   hw/core/machine-smp.c          | 2 ++
>   hw/i386/sgx.c                  | 1 +
>   hw/loongarch/acpi-build.c      | 1 +
>   hw/loongarch/virt.c            | 2 ++
>   hw/m68k/next-cube.c            | 1 +
>   hw/m68k/q800.c                 | 1 +
>   hw/m68k/virt.c                 | 1 +
>   hw/openrisc/boot.c             | 1 +
>   hw/ppc/spapr_softmmu.c         | 2 ++
>   hw/riscv/opentitan.c           | 1 +
>   hw/riscv/shakti_c.c            | 1 +
>   hw/riscv/virt-acpi-build.c     | 1 +
>   linux-user/elfload.c           | 1 +
>   target/i386/cpu.c              | 1 +
>   target/i386/host-cpu.c         | 1 +
>   target/s390x/cpu_models.c      | 1 +
>   target/s390x/diag.c            | 2 ++
>   29 files changed, 39 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


