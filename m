Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93E73A306B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 18:20:51 +0200 (CEST)
Received: from localhost ([::1]:36378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrNQI-0000lL-Ki
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 12:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrNPD-0008PW-KA
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:19:43 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrNPC-0005Ih-24
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:19:43 -0400
Received: by mail-pl1-x634.google.com with SMTP id 11so1279997plk.12
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 09:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VC/T0KiKS5DZN9B9Ax69wcvjtew6dxXJWgZ1EagKsjE=;
 b=Il9tomG/pkn9DfxON4BsGD4GxpCkYGJt0GPfpdOowT4NTqQYeivT2pYM/B96JPvIB7
 GIza/LhJ6Ly0WsyU9o56kmIpo64CRZKlH8Beau593atdWVsvhYq4xV6xRc9VLD3orfJR
 6w8AFJPPA0HSRhVXsqMKKnP4JewXvg/87u1j8OEdI6r3gEX/HwuFKGT2NYq2gaSU4A+V
 IJEBgoA1wt3AWvM+TNYPehyW+UECKKigbwawY24G0Sbr1C0eRSKi1JzhbBrGRxo2U7RM
 uaMhbW/sxQzQ3Z1N5AJknMklmwPUyNJSad1Ug6AzVqvOdv4o2gQZaw0d+dQmXw8gHUdv
 cr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VC/T0KiKS5DZN9B9Ax69wcvjtew6dxXJWgZ1EagKsjE=;
 b=Kc1fCfHUm/3kzgfbU1T6hTEfGX8kACBIfh48HQyHmZArWVD/uGWUSBXCBM2UDdfzQ4
 lDAZ/9Gj/DI3isQEXcmK/9MlvzuP8JcSCkWhkI+un3HGga5nN++JgSSbNaNaNeM23nQ+
 oMBeoPU2N0lG3tAa8kfGsYFxRHgefWHNgNuD//zuS7jvuOFsknNPq0SyRcTTjl0a164D
 OrA9Mq1x1HQYkit7N23icOdt5JQvYYyUoCfP/t8H/glP0AeD8eM2+8LliwB/wcje80St
 Ix5+hMqsEZUVPccs0DYII42RAoPbKXW+zTz6mMMzzJxrpgTk0caGfUFZyaM4VReR9Jd3
 5Egw==
X-Gm-Message-State: AOAM530akVx6W7f5jaSa132HslVp34aOYivC+/FVfmo7FKrRsrjuTp51
 /ueQ2a6JE7HY+c+4mixyceNAMQ==
X-Google-Smtp-Source: ABdhPJyr+o230NK16u6Pf2KIMdNuJg2C6QbbgiUSxvn04biwM08wnJoTs1ChPV5OKVQ4TiOr39FIKw==
X-Received: by 2002:a17:902:8f8f:b029:107:810b:9ee5 with SMTP id
 z15-20020a1709028f8fb0290107810b9ee5mr5514951plo.4.1623341980371; 
 Thu, 10 Jun 2021 09:19:40 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 x3sm3311906pgx.8.2021.06.10.09.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 09:19:40 -0700 (PDT)
Subject: Re: [RFC PATCH v3 2/2] Adding preliminary custom/vendor CSR handling
 mechanism
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210610144424.8658-1-ruinland@andestech.com>
 <20210610144424.8658-3-ruinland@andestech.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c9d350fb-16bd-6dc6-41de-0516c046a244@linaro.org>
Date: Thu, 10 Jun 2021 09:19:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610144424.8658-3-ruinland@andestech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: bin.meng@windriver.com, alistair23@gmail.com, wangjunqiang@iscas.ac.cn,
 dylan@andestech.com, alankao@andestech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 7:44 AM, Ruinland Chuan-Tzu Tsai wrote:
> --- /dev/null
> +++ b/target/riscv/andes_cpu_bits.h
> @@ -0,0 +1,113 @@
> +/* ========= AndeStar V5 machine mode CSRs ========= */

> --- /dev/null
> +++ b/target/riscv/csr_andes.inc.c
> @@ -0,0 +1,153 @@
> +/* Andes Custom Registers */

> --- /dev/null
> +++ b/target/riscv/custom_cpu_bits.h
> @@ -0,0 +1,3 @@
> +//XXX Maybe we should introduce a configure option to toggle different vendor
> +// CSR bits definition ?
> +#include "andes_cpu_bits.h"

All new files must have copyright+license boilerplate.


r~

