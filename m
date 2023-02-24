Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09566A23DC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 22:35:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVfi6-0001Bu-6l; Fri, 24 Feb 2023 16:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVfi0-0001BA-Ai
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:34:28 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVfhy-0001A7-Eo
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:34:27 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so632421pjz.1
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 13:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yQPF4QRg+Y6u3cCwj84l/KgLy9yLpA+J7Spud4VsUrQ=;
 b=YHMSE3e9xp5wPKRx9i3EMA5h3x/cd+Nf5Nmxm2yeIwsZROigSAHWvyTf4BqBhmDU2B
 TN28TEvqjbBHbo9aOMkBvCHgDkUcMZFPa7lioujm6j+RtKPlm9YHol9l7L/GexXoHruL
 3o2WiVktBLGqEb+GN45u8LP4D6D11WymSrRfrJkqafCRr4ll4d4QC/rb7wY5s6vIM/0F
 VkuMK8e3D9MX2RTGaa22hdrKx95igD/Q0enOPbiZ4yDssDx9pZixVerZw+TdSA8CmEb2
 asnryUKwrqJ294MHVfBVp0ERbHSLWo9s8RGE1IvSkRO75Cl2RGA8EwFxSksxbHS5LbPU
 /WtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yQPF4QRg+Y6u3cCwj84l/KgLy9yLpA+J7Spud4VsUrQ=;
 b=ozjv6waDXHhYE/8Y3Kmh6D2JsxDGMYmaPX9pQW3Si0cdYkS2y0Gob8tRSDnuoCQjHF
 T9OMqCMq3TyHZJClIBinPVlOWzxQB3mDZmEuGl/tQKRAApdthteW4dY/xXOt0V0xvRgn
 ibgFZj/1tsXumvGfnbw/eE8oc0wexVOs5hDCZuomSlw2sQjkQYqInkqseG1PbnBKe8RZ
 f3g7EQ3ks/L0W8ibRs/KmhlkYY9YtVaLCrs5hmYqBzOQabzd4IIAymKD7tTQz8AwiGPC
 ydAqTszweqhXugfNdC9jTSP9Ae8N1mzcABnXhuHqzhGrZ72wZXUgHiVggF/uGEPbuegq
 ICgA==
X-Gm-Message-State: AO0yUKXBQqaSUvoH5hposPIFKO7GV5mfX7LFh8wSB7Hx1qB558ZVnpGt
 NX2s31Irz/cf1Akubm+c3p75Cw==
X-Google-Smtp-Source: AK7set/SpVI4KtiKqz33mkBiC/eRf3dGgL3olwBlpEHtX0rn0mgxD7y7Je6wdlCKY8fXHVqf3spqpQ==
X-Received: by 2002:a17:90b:4a4d:b0:231:284:ea4d with SMTP id
 lb13-20020a17090b4a4d00b002310284ea4dmr19629268pjb.22.1677274447041; 
 Fri, 24 Feb 2023 13:34:07 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 p6-20020a17090ac00600b002366c766ef4sm1943498pjt.33.2023.02.24.13.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 13:34:06 -0800 (PST)
Message-ID: <d2b57ebe-791a-74bc-1ba0-5909d36e6910@linaro.org>
Date: Fri, 24 Feb 2023 11:34:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/4] RISCVCPUConfig related cleanups
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230224174520.92490-1-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230224174520.92490-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 2/24/23 07:45, Daniel Henrique Barboza wrote:
> Hi,
> 
> These cleanups were suggested by LIU Zhiwei during the review of the
> RISCV_FEATURE_* cleanups, currently on version 7 [1].
> 
> These are dependent on the patch "[PATCH v7 01/10] target/riscv: introduce
> riscv_cpu_cfg()" from [1] because we use the riscv_cpu_cfg() API.

If you add

Based-on: <message-id>

to the cover letter, then patchew can stitch the two patch sets together in its git 
repository.


r~

