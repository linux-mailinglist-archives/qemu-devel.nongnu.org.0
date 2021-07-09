Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55813C2700
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:42:01 +0200 (CEST)
Received: from localhost ([::1]:58808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1sdc-0006WC-QR
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sbQ-00046o-K3
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:39:44 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sbO-0003K2-HG
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:39:44 -0400
Received: by mail-pf1-x432.google.com with SMTP id a127so9035988pfa.10
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 08:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NFwnakV+V8OJ3JgO/gtSFRQvUYspz8I5OlFkrdejyf4=;
 b=ro45QXng6uvPBFdkzTluL2ZYnUZDc9kZbDmWtzn0Or+RPqh88wPQ04KE3BbkXlkdpO
 7EwY6JD/2HckfYOzHrrwm4IRdOJWmHoyvfXLmVHpFSexJI9db+tHHWBXRFy9UB9u5zzU
 R+esfgtwSN97mbwnTYEvbnZV5ThrkqbUiN2gRY3N+pj4if1CZ1WHrteauQGH/vZCc/N8
 S0KCVSOgRAHgrF1ajxbS4bfvF9QxKZEbH5U3TPcwxXxw4lbUJJC023T4eZXirvxQfZZm
 lDKg6c+iBh5/aBVSjuWtmIPYY7y92U2M+JgsQq0oyqiJ6gypBnp7KBXbw3QZSNRZSr90
 50pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NFwnakV+V8OJ3JgO/gtSFRQvUYspz8I5OlFkrdejyf4=;
 b=nsXrA7PAtodLrkJXmnNUjQKkGJfHXXTE/dIieNThhxNEBFkp2/q8h85O3WjNkezPZy
 c5PZJ6sLTSvS4unMJorMrVIMT8mAEjEA1YCbCbCeBaxb7dZWmHeK8u/2p86SCncqfxyT
 H9SCM9w/fAZz5m1XMzsc9hwtK2r+UBJZRc1sWYkHba+vdxxtz8HrgqGQBuPVJbs4CkaG
 w6xr55l3riH3nICNqmV5Gq+Cge9Zb7WiOyqUN1RU5gQPbYv5nhgQ+EYtKYQ+JCP7ZC2V
 y6Khc1S7fm/r44FBfvxfwlNEmNnrT1ayQle/v247K8hIarf5FAVsS0ODf5PZ1dV4C6ZV
 3xqw==
X-Gm-Message-State: AOAM531G2KCqMphIW+g3DZGJEZ9fn98c9QIgpXniS57TUC/N4i6x02yu
 +EVKcCmpUT3v6bnlU63KlBumAbkRkS7Jhg==
X-Google-Smtp-Source: ABdhPJwSk0con1yOr4DsHN2/sznqu+3oJQz66X8AJaC1RrwH9jQAqxYWcVLm/WRED/22oL3diWab/w==
X-Received: by 2002:a63:1041:: with SMTP id 1mr22052422pgq.274.1625845177278; 
 Fri, 09 Jul 2021 08:39:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id ck22sm6028119pjb.26.2021.07.09.08.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 08:39:37 -0700 (PDT)
Subject: Re: [PATCH v1 3/5] hw/intc: ibex_plic: Convert the PLIC to use RISC-V
 CPU GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
 <d3e146a837ee7de3a7b74c7b6ad9021a4a7e6633.1625801410.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3e762b0-54d7-6d02-9878-6588196de0c2@linaro.org>
Date: Fri, 9 Jul 2021 08:39:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d3e146a837ee7de3a7b74c7b6ad9021a4a7e6633.1625801410.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 8:31 PM, Alistair Francis wrote:
> +        if (ibex_plic_irqs_pending(s, 0)) {
> +            qemu_irq_raise(s->external_irqs[i]);
> +        } else {
> +            qemu_irq_lower(s->external_irqs[i]);
>           }
> -
> -        level = ibex_plic_irqs_pending(s, 0);
> -
> -        riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(level));

Use qemu_irq_set.  Whether you retain the level variable is up to you.

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

