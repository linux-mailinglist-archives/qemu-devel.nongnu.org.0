Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FDD44C01B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 12:24:52 +0100 (CET)
Received: from localhost ([::1]:55820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mklil-0005AU-FU
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 06:24:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklhg-0004Lj-Qf
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 06:23:44 -0500
Received: from [2a00:1450:4864:20::42e] (port=44872
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklhf-0005oF-9i
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 06:23:44 -0500
Received: by mail-wr1-x42e.google.com with SMTP id n29so3352002wra.11
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 03:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3PEVz65ReO3xTGcGDsOJ3dE2df8dU/qtSolagATOL7Y=;
 b=AOCeQ4WnFfrecNgTgHVLn+6IdfLmiL83T6vB0k79ZOdX1/wZ5ETRIYIQBP799lRm1h
 hmx6axhwbWHJiCc6ddiiKgtSaIQuEPeXxkOKQpuK7luROAeV+1Pw1ep+neXCtNcaP7Hd
 Qka7QkpN4mlwoaPqX0UR+J5NIZuKiUgevW1vg9AP0IO0Pu61X9U+tOOPMH3V9/ytyM+W
 1MUGYVQkWfz2sdprXy7zHo4hYB8QEVyKJdGbUbVTAJZFgcTwEaR5Aa1qwk3Fw2Exp3IK
 5MSqCQw2PkLtmR8ewlaS+1WhfT4deiYGr/tFSQfker021PijjznbP4jUj2rQxj4ITEOT
 4bpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3PEVz65ReO3xTGcGDsOJ3dE2df8dU/qtSolagATOL7Y=;
 b=gnwcHBiop+hMT6/Z+I0Pp/M5vY/5LuYRcAUC9JjY4COLEs1kgajl2o1Ha2L4TkZX0m
 PS/vJxHevw8v/CH/smTP79TeV6zR21SQ0UFW+vNVr1qZGBysH9+gT5L1Po3Pvm2mEAKv
 ehw1UW0tL/lNglrC6kYdcI4wZm1Xt7evt6q7sBUSyf2z7Ss2nU0ZkDEu1wZYOG5CjMgD
 03pz+3am4UDe8X/5ZHNKCUBc+EO7B/RbvK5W7SArQyparj74bAVzztm5lFfekqMRJKE2
 X7TdkSMaeKrNXD6W4zUrQU5jKyr8qciChB0SqpqkMYLLa61menPSEdbuh+kV90BrU7x+
 KmxQ==
X-Gm-Message-State: AOAM532st200vHlAmon5aYn8IS/DRt2JahV0vtdgZsj/vU9jwmQvU1xX
 kqy1/NYfy7nLc27pDoAr6FwqLA==
X-Google-Smtp-Source: ABdhPJy0RtLwhvcHKSNuRzseHFOtfdWR6FT9LVqfvXkDm8v7YB4H3QJ/pzKqNoKM3pUpPUJYcwAVgA==
X-Received: by 2002:adf:cd06:: with SMTP id w6mr18081256wrm.431.1636543421602; 
 Wed, 10 Nov 2021 03:23:41 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id e12sm28350712wrq.20.2021.11.10.03.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 03:23:41 -0800 (PST)
Subject: Re: [PATCH v2 12/14] target/riscv: Split out the vill from vtype
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-13-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <df7ad986-8430-9994-83ac-33db2ec1f2e3@linaro.org>
Date: Wed, 10 Nov 2021 12:23:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110070452.48539-13-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 8:04 AM, LIU Zhiwei wrote:
> We need not specially process vtype when XLEN changes.
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/cpu.h           |  1 +
>   target/riscv/csr.c           | 15 ++++++++++++++-
>   target/riscv/machine.c       |  1 +
>   target/riscv/vector_helper.c |  7 ++-----
>   4 files changed, 18 insertions(+), 6 deletions(-)

This patch should come before patch 6, which is over-complicated.

> +    target_ulong vill;

This could be bool, though there's no good place to slot it that does not result in unused 
padding.  Comments should be added to show that this bit is now missing from vtype.

> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 19e982d3f0..cc4dda4b93 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -104,6 +104,7 @@ static const VMStateDescription vmstate_vector = {
>               VMSTATE_UINTTL(env.vl, RISCVCPU),
>               VMSTATE_UINTTL(env.vstart, RISCVCPU),
>               VMSTATE_UINTTL(env.vtype, RISCVCPU),
> +            VMSTATE_UINTTL(env.vill, RISCVCPU),
>               VMSTATE_END_OF_LIST()

This will need a bump to version.

> @@ -45,11 +45,8 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>       }
>       if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
>           /* only set vill bit. */
> -        if (xlen < TARGET_LONG_BITS) {
> -            env->vtype = FIELD_DP64(0, VTYPE, VILL_XLEN32, 1);
> -        } else {
> -            env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
> -        }
> +        env->vill = 1;
> +        env->vtype = 0;

This is fine.

You're missing the updates to cpu_get_tb_cpu_state.


r~

