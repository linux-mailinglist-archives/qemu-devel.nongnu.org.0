Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2656C82E5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 18:08:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfktt-00062g-32; Fri, 24 Mar 2023 13:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfktq-00060A-4s
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:08:22 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfkth-0000lW-JJ
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:08:15 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso5715827pjb.0
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 10:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679677693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cc8+s/Imy+zdxeqU8876M+NfC4b1zknCNyjvUxHPxLU=;
 b=qmD8A5JDH2NNZYgvxDAq1/DAbKMd2i7fr/NUlpeFr5fKBb8WuLpQc8rLUiOX2mBP/4
 BDA8fu4id3q3uboYyuat3XJLTi/0B24sbNG5dRXRwcrX5BgOPXdkUwB+LwbELWme6So5
 Y61OEXImRFzD/kM1INM+pfgJ5Le3BmFA7vGrq+blPHpEywZ0aYmOBCkWHSPLmwKv73yo
 wI/OLiuy7a7pSRvAUm0KUoSoAb4p3f6maLj1hlIPc8Ad1Fft/c+0gpmLwJbFv91ubdRH
 8U1Vg47UVZ2++fJBy4punrrpnUIEwgnIH1ioYrOKZVWYmOS6mKHU1C1JSHQMWovkMdg+
 iWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679677693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cc8+s/Imy+zdxeqU8876M+NfC4b1zknCNyjvUxHPxLU=;
 b=0sV1yjGj8D/7zCX2Ukko3U8aMNF9ahhdOxaKOiVXKF6y7u04PRQKhttRIrOrulsgeB
 cCiOU4lt0GJgRyz1CLjUAGOLuBmQZ/KNj1WC1wUrVt0nVtJJGBcl4j8aJQxqtbTTEz5m
 cLIEi+puaQZO8g9eCsRd9vj+ZjMS6FvZ7P80ss89epoy+97YSU/JJzTwFgyi3px90Tm4
 NvaJXC1siuiCytN2cKdDhIWx1D3wmuWSet225Ri1lrP1eO5mxUPwff1hGx3zymmFPjJU
 h47WsCPcTFVuCE4QSo4pDd82PZ1F2Gt2G1FjZ2utbfD/tUP/CsbO2yB47Aa1mb0Uk2RW
 NX9A==
X-Gm-Message-State: AAQBX9ej00MIFK8DsB+z2heamjethxH4SenfEVxAbkYjoqTGaKglhfRT
 rhi/krtpZ7rzjrcLd7fZWjQXmg==
X-Google-Smtp-Source: AKy350Y/VgWjjTCdYU3G6JdiGuuoeivKqBM0e3MzH4GlWckgwb+fXsvZS0vzv4JdouUNhOrp43qvMw==
X-Received: by 2002:a17:90b:4c0c:b0:233:d12f:f43a with SMTP id
 na12-20020a17090b4c0c00b00233d12ff43amr3668775pjb.1.1679677692805; 
 Fri, 24 Mar 2023 10:08:12 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 kq3-20020a17090aed0300b0023d0d50edf2sm122896pjb.42.2023.03.24.10.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 10:08:12 -0700 (PDT)
Message-ID: <b6f0dcb7-d4f0-cce1-4527-1b7720b04647@linaro.org>
Date: Fri, 24 Mar 2023 10:08:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 4/4] target/riscv: Add a tb flags field for vstart
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
References: <20230324143031.1093-1-zhiwei_liu@linux.alibaba.com>
 <20230324143031.1093-5-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324143031.1093-5-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 3/24/23 07:30, LIU Zhiwei wrote:
> Once we mistook the vstart directly from the env->vstart. As env->vstart is not
> a constant, we should record it in the tb flags if we want to use
> it in translation.
> 
> Reported-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>
> ---
>   target/riscv/cpu.h                      | 21 +++++++++++----------
>   target/riscv/cpu_helper.c               |  1 +
>   target/riscv/insn_trans/trans_rvv.c.inc | 14 +++++++-------
>   target/riscv/translate.c                |  4 ++--
>   4 files changed, 21 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

