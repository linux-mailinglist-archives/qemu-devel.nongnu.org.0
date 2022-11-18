Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B331962FC48
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 19:17:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow5tT-000576-De; Fri, 18 Nov 2022 13:15:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ow5tN-00056l-V6
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 13:15:09 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ow5tM-0007Qc-EU
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 13:15:09 -0500
Received: by mail-pl1-x62f.google.com with SMTP id p12so5255559plq.4
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 10:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1cGgST06xt/arvH0sLsxOqHZvH2mcGsLLZ/U9QPctQw=;
 b=htSSWmEL2f+gg/vKYN+/9ajLKQBqjQWh2hMJdhMUt6pF0Z8u2fUBqSF90yzPOamON2
 KcO0m5nROjKnLrnz8y0cSBsJ8poWs2zvo0jjU1BKlUwI3Uc3GW9rMXb01OgQyV4jUwBI
 f5OcByuG7WMV2L07JqnDVg+tT/cs6CNnE1AdkryQu25XI37YJVZ5zU4ALQhnfDlOIVIR
 nqRsPb5BsFwnCDEuE1bo5j/ddpgIn7TUk9EK8e7LKcq3MbdAymCC9pfIhZPV5lyzJnHV
 9wvFX92+3Sgy3WudW6Q+C9pvx8aQzaU77RHI9A9SBy+Y7UV68cQ5Ui+rsIO8YF9zvvT5
 wJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1cGgST06xt/arvH0sLsxOqHZvH2mcGsLLZ/U9QPctQw=;
 b=iKgN7PLQlRwlaKnmfRlEgOk/bUv2gwr0bBWTZw/rPmirOMRa1JGGcURISK9oG+bK4S
 YiSZHX+qc1o+edgQlgd13z4YxT0CuO+ldc7mFp2ZwBGRl9FvX57vQ2NT5qwX/JQ8QDpl
 tn8sMvNUp98Xf5PxdCKAq77+3Uq3TvUZFZho4oMI3iq4/jduj4eAZ/vR9ihgl0MFfzwJ
 9FIYLHrvJ9nrMjm/T8B9/WNp48kynR2mreTTDDlA4T7d86LUkIKDyn28sBK2yCitcTc5
 NLxbm+U+TdNvywKOZy22e7bOURobnb/LyQk/ywCOUHD+8uiTP2NCGYlqXHZiuWf9NFBO
 8o3A==
X-Gm-Message-State: ANoB5pmAau28xsi4oTgjbSCYZ1xUgOw6Qjgw+ktNczfmXSoDKgy2/Ic4
 QVpTugAQAuVjBBb0rG49BvWLXQ==
X-Google-Smtp-Source: AA0mqf6Ql6RZntzx/7JXx+YkAKjX4wPGWWOpflliCr36RGBzy7ObeFijJlO669gvx576/e1ZzHBt4A==
X-Received: by 2002:a17:903:2112:b0:172:f5b1:e73b with SMTP id
 o18-20020a170903211200b00172f5b1e73bmr677695ple.58.1668795306499; 
 Fri, 18 Nov 2022 10:15:06 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:4328:d05:e646:9f25?
 ([2602:47:d48a:1201:4328:d05:e646:9f25])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a170902780200b0017a018221e2sm4015706pll.70.2022.11.18.10.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 10:15:05 -0800 (PST)
Message-ID: <806e83c2-f630-6aec-257d-45ceebba9e94@linaro.org>
Date: Fri, 18 Nov 2022 10:15:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 7/9] target/riscv: add support for Zcmt extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221118123728.49319-1-liweiwei@iscas.ac.cn>
 <20221118123728.49319-8-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221118123728.49319-8-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

On 11/18/22 04:37, Weiwei Li wrote:
> Add encode, trans* functions and helper functions support for Zcmt
> instrutions
> Add support for jvt csr
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu.h                        |  4 ++
>   target/riscv/cpu_bits.h                   |  7 +++
>   target/riscv/csr.c                        | 38 +++++++++++++++-
>   target/riscv/helper.h                     |  3 ++
>   target/riscv/insn16.decode                |  7 ++-
>   target/riscv/insn_trans/trans_rvzce.c.inc | 28 +++++++++++-
>   target/riscv/machine.c                    | 19 ++++++++
>   target/riscv/meson.build                  |  3 +-
>   target/riscv/zce_helper.c                 | 55 +++++++++++++++++++++++
>   9 files changed, 159 insertions(+), 5 deletions(-)
>   create mode 100644 target/riscv/zce_helper.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

