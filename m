Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43BD6DF1D6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 12:20:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmXYv-0003hx-HX; Wed, 12 Apr 2023 06:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmXYs-0003hf-9Y
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:18:46 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmXYq-0000ua-Fh
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:18:46 -0400
Received: by mail-wr1-x430.google.com with SMTP id s12so1862812wrb.1
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 03:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681294723; x=1683886723;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xubp/UHJkutcl3IvIxJS81UUBiExW/az4s4kh4yQCyU=;
 b=IPLzabwlNoAiuhuCQ/yQElp0PoecSw9MOxXU8Mg+VaM8gLnsHm4b45ic9kKDjDgx5X
 z8VDlwFfHh9p0WaKgtWh9fdHUWfmrjCZ8gucVcKpflO36Zy+mQx8aYOIOQEM/7JOFKp8
 4YyS010r4/6nKEX8vvkGrvBqKpoImqaTgmpcS/ZQduXbvxgXBzgXesgeJOjM6NVBqi0w
 8icyjntelINgPG8S9qZ7cwXbuNwMMPygWYNEnZmaqQ8EVPVBwypIqTSYtDrWSfu8TDYV
 FzBaCPe8ktGo8MHkj3BAO9DjxTq2C0bZSSlj1F9MQVjyB9uo9KADY86/vprqd+Kcg06M
 xN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681294723; x=1683886723;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xubp/UHJkutcl3IvIxJS81UUBiExW/az4s4kh4yQCyU=;
 b=lUz8wTrbZZSSxWUg6eOpxxAv/Ke0SExQQYiPHwxrESVhJT3jSJs97Hc/c72icV3M21
 X/mQHl9Jeg0f/L+VYQuV/DPU0w+vOG5rAVkVkJweBsaZ2KhDMJ8/KIcm7Axfwsm53qTW
 Y/2v6RxKvKi+m2+/oC2dFTgiEGvcQy/M0a6hZWOxQOrtIMlxaJoCwcbQEtexD2lvAeXz
 IA1a1B2C0QbOYO11FFXeamcv2XJoHt5dxfP0nZPIUddHsqjrw/p7UeTBFz4/DdB34n2K
 by0XiTX3ws5ys4gRKDckMdrwaUyhRLEL6AVqjXC4Yl/Yx/7qCaeXobQHXuWyodltQ563
 4P/A==
X-Gm-Message-State: AAQBX9fUWqDspv3nIyfll36zd1i90+j9IPSPRpCalpVWbOhEbD5HpmlS
 VI4LySGwug4zl7hu0GE2Zm8mdg==
X-Google-Smtp-Source: AKy350aCsRFyEL6MFaghP9VnjRznavZun09F3E9nmci/EpldAThNFWSBiM6pVZucN8eKZ6BB0V745Q==
X-Received: by 2002:a5d:424f:0:b0:2f2:79af:3303 with SMTP id
 s15-20020a5d424f000000b002f279af3303mr6484699wrr.60.1681294722738; 
 Wed, 12 Apr 2023 03:18:42 -0700 (PDT)
Received: from [10.0.2.69] (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 s10-20020a5d6a8a000000b002efdf3e5be0sm10717523wru.44.2023.04.12.03.18.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 03:18:42 -0700 (PDT)
Message-ID: <c558a047-e289-3c44-78dc-b9930262ebc4@linaro.org>
Date: Wed, 12 Apr 2023 12:18:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 3/3] target/riscv: add TYPE_RISCV_DYNAMIC_CPU
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230411183511.189632-1-dbarboza@ventanamicro.com>
 <20230411183511.189632-4-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230411183511.189632-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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

On 4/11/23 20:35, Daniel Henrique Barboza wrote:
> This new abstract type will be used to differentiate between static and
> non-static CPUs in query-cpu-definitions.
> 
> All generic CPUs were changed to be of this type. Named CPUs are kept as
> TYPE_RISCV_CPU and will still be considered static.
> 
> This is the output of query-cpu-definitions after this change for the
> riscv64 target:
> 
> $ ./build/qemu-system-riscv64 -S -M virt -display none -qmp stdio
> {"QMP": {"version": (...)}
> {"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
> {"return": {}}
> {"execute": "query-cpu-definitions"}
> {"return": [
> {"name": "rv64", "typename": "rv64-riscv-cpu", "static": false, "deprecated": false},
> {"name": "sifive-e51", "typename": "sifive-e51-riscv-cpu", "static": true, "deprecated": false},
> {"name": "any", "typename": "any-riscv-cpu", "static": false, "deprecated": false},
> {"name": "x-rv128", "typename": "x-rv128-riscv-cpu", "static": false, "deprecated": false},
> {"name": "shakti-c", "typename": "shakti-c-riscv-cpu", "static": true, "deprecated": false},
> {"name": "thead-c906", "typename": "thead-c906-riscv-cpu", "static": true, "deprecated": false},
> {"name": "sifive-u54", "typename": "sifive-u54-riscv-cpu", "static": true, "deprecated": false}
> ]}
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu-qom.h        |  2 +-
>   target/riscv/cpu.c            | 20 ++++++++++++++++----
>   target/riscv/riscv-qmp-cmds.c |  4 ++++
>   3 files changed, 21 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

