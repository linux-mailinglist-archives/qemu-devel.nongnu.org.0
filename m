Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF76D2C79
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 03:27:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piQ0d-0006yt-GY; Fri, 31 Mar 2023 21:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piQ0b-0006yS-OP
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 21:26:21 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piQ0Z-00057D-P8
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 21:26:21 -0400
Received: by mail-pl1-x62f.google.com with SMTP id kq3so22957469plb.13
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 18:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680312378;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nY00X0HMPxDVDCSPkpLxcS7tx72Oms0YBZm9GeGj/Hc=;
 b=YXsPICpOoe8vmcRUK06hC2JFhk95EPWTwg4WNAZpRQ77bWHfSoGb3I5XqNOiEtlPbA
 EZ0Cag3iV0rRw2LlCM4ez1DRCw5YbaLnqhkEhSVnl0lTQ9di66TyYeS6iPHLf3V9s42X
 3OXZBZ+RWl55uh9bhg70TcU4Dx+riSU1kx4yGC/3ZKjrrqoTRV+bwkellzvXIbkMnvxZ
 Smh1bIZ7VJ7elljXw+ewH2c+ojEZ3a8X/A9j6FXgkPDoLY5Lklyma0CaJvblcjhOu+YZ
 PxZamk8p0hAi0+PuB9+GbGGO5ebckg2GG8JOZwTWr3cmXqApCZe66J9PCeKcpISt/ke2
 Q0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680312378;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nY00X0HMPxDVDCSPkpLxcS7tx72Oms0YBZm9GeGj/Hc=;
 b=jXlG1pOd7IYZzzYbDQU69KskEZvjP4B6MbOLuQKLtlx48Cpku8uQgJeh3Tv2kyLxJ1
 Ao1LYUBPo5rtD7KcjHySSejNTxeqJh+wkfG0OsD6V8Mcwbz0hJyizJ1DcsZB7OEmvbwc
 mGXW772814knqanCZhVfpnc9RgyI/8UpP63ryzRAINQi6ApsjpajcvYTowErMNz2+R6h
 AfyZMXGQf8yQmuJ+QJEZRDiXy7vGKCNMSzxMGBFsYz+f9tg1gVDiYDhANM5kD/wxk9sN
 IgGrRD2lL33d2oEBUalL5s7zeaRptQOajelijg3ApmpaQrU+0o85Tq2lBMGkdrJckig1
 hugQ==
X-Gm-Message-State: AAQBX9cPlm2APdnN5h8O7FSS2zmqBJvYsEl3FmaWbhSpZyhbM6zhtf6G
 ngL362/fpmnc2IslooRhSNeVOw==
X-Google-Smtp-Source: AKy350YEkKZZU+Z6oaM4ONQOhfRLbYvB2nS/tUz9zIy4R52Or9dw09KhqlmrZG9Mvoksftu+Zq+YOg==
X-Received: by 2002:a17:90b:17c2:b0:23d:9ae:a49a with SMTP id
 me2-20020a17090b17c200b0023d09aea49amr33465720pjb.30.1680312377791; 
 Fri, 31 Mar 2023 18:26:17 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a631a0f000000b00502e7115cbdsm2118352pga.51.2023.03.31.18.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 18:26:17 -0700 (PDT)
Message-ID: <3cf2469f-fd47-544d-1343-663a5e6c5b8d@linaro.org>
Date: Fri, 31 Mar 2023 18:26:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 6/8] accel/tcg: Fix tb mis-matched problem when
 CF_PCREL is enabled
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230331150609.114401-1-liweiwei@iscas.ac.cn>
 <20230331150609.114401-7-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331150609.114401-7-liweiwei@iscas.ac.cn>
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

On 3/31/23 08:06, Weiwei Li wrote:
> A corner case is triggered  when tb block with first_pc = 0x80000008
> and first_pc = 0x800000200 has the same jump cache hash, and share
> the same tb entry with the same tb information except PC.
> The executed sequence is as follows:
> tb(0x80000008) -> tb(0x80000008)-> tb(0x800000200) -> tb(0x80000008)
> 
> 1. At the first time tb for 0x80000008 is loaded, tb in jmp_cache is
> filled, however pc is not updated.
> 2. At the second time tb for 0x80000008 is looked up in tb_lookup(),
> pc in jmp cache is set to 0x80000008.
> 3. when tb for 0x800000200 is loaded, tb for jmp cache is updated to
> this block, however pc is not updated, and remains to be 0x80000008.
> 4. Finally at the last time tb for 0x80000008 is looked up, tb for
> 0x800000200 is mismatched.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   accel/tcg/cpu-exec.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index c815f2dbfd..faff413f42 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -983,6 +983,9 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
>                   h = tb_jmp_cache_hash_func(pc);
>                   /* Use the pc value already stored in tb->pc. */
>                   qatomic_set(&cpu->tb_jmp_cache->array[h].tb, tb);
> +                if (cflags & CF_PCREL) {
> +                    qatomic_set(&cpu->tb_jmp_cache->array[h].pc, pc);
> +                }

Good catch on the bug, but incorrect fix.  Need

if (cflags & CF_PCREL) {
     qatomic_set(&cpu->tb_jmp_cache->array[h].pc, pc);
     qatomic_store_release(&cpu->tb_jmp_cache->array[h].tb, tb);
} else {
     /* Use the pc value already stored in tb->pc. */
     qatomic_set(&cpu->tb_jmp_cache->array[h].tb, tb);
}


r~




