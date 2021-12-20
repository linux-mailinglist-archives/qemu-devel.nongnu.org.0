Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F58C47B3DF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:42:12 +0100 (CET)
Received: from localhost ([::1]:58306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzOXz-0007Sr-My
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:42:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzOVE-000513-Np
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 14:39:20 -0500
Received: from [2607:f8b0:4864:20::42c] (port=45696
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzOVC-00066P-Sp
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 14:39:20 -0500
Received: by mail-pf1-x42c.google.com with SMTP id u20so4698721pfi.12
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 11:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4kVwmEHEmH6r99st4Q92PqMdtWDnuzKRYiqcng4XJjA=;
 b=xXA/wFRogaH8k9YdlJUB0CwllxxzbZ2Fh3eMjRRQF+UiTgye0weMbaCEhu0QC27ok9
 htOcHCBv4edJD8EjDqsdwRumlmddgFUU/pr+MpxpuOo2eeNSWWZrbpl6RopFaHUzAJcC
 AtwjOOWIy1NKZY89nISmhnH69I9u7sgLadY0cgwmCIHF5+IN80L4jJMwTsI56KmCSYEF
 TGC9rv8KoDgXuKLNiBX+7TUoHYb1dQDdBdZ4O+iisWh//dbHVyAokiD6X+rKRLUQ84zh
 wtyefdjldyc6xSfHeB+EFUzqbu3kKcIMwU2YeG1YK8/aTbQ8Kz3tTwAw4bb+ZS2gfCYW
 1EKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4kVwmEHEmH6r99st4Q92PqMdtWDnuzKRYiqcng4XJjA=;
 b=4G352xytmYmhYrfI8wtzzvOXHOnoQuh24BlbRQDgD2TjxXYiRVk69fyS0lnm9QX7oe
 zqx8P7vUrS6/zdXWFYhNjKLVHNH1OAiv6+Rx+FWUCWvtCGuKJ+51JLXjZfPq0XPM5Zst
 fIzEA+Ol5XTKb9P3xKB5fJAO6xPQO55bp90YCr4duBqmq/kpwKdhhW6rCApvSWCnrArB
 OSzBMsmq/zKLh76QHgELMDITuI4NSwoOju/6PVO87W/G3+ApCt3IjaJ2It8BEgOATtrP
 Xtob12Wj239LQ9fQFuvNIApXY1oDcQbQNlHbTYBm1BrBYXOMztn2Lu8rg56/yQ6ozMaN
 9AtQ==
X-Gm-Message-State: AOAM533U0LCvh0r4X2cGE79pc18bzeRMecZS6q7iFyplPb05gWSpZ06F
 kozofr+SGBqPnDAy8VyPUPk+6w==
X-Google-Smtp-Source: ABdhPJx8mw8Ep+UESign8gSNX+Tko5bb3h+/MMUCtdoMo78idsxYMnyVAoqYpD9gTCpLeITPFZfQ5w==
X-Received: by 2002:a63:1b0a:: with SMTP id b10mr16451943pgb.183.1640029157498; 
 Mon, 20 Dec 2021 11:39:17 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id h5sm20968902pfc.113.2021.12.20.11.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 11:39:17 -0800 (PST)
Subject: Re: [PATCH v4 3/3] target/riscv: Implement the stval/mtval illegal
 instruction
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
 <20211220064916.107241-4-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a82115c-363b-f747-a628-8161429d0b97@linaro.org>
Date: Mon, 20 Dec 2021 11:39:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211220064916.107241-4-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 bmeng.cn@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/21 10:49 PM, Alistair Francis wrote:
> From: Alistair Francis<alistair.francis@wdc.com>
> 
> The stval and mtval registers can optionally contain the faulting
> instruction on an illegal instruction exception. This patch adds support
> for setting the stval and mtval registers.
> 
> The RISC-V spec states that "The stval register can optionally also be
> used to return the faulting instruction bits on an illegal instruction
> exception...". In this case we are always writing the value on an
> illegal instruction.
> 
> This doesn't match all CPUs (some CPUs won't write the data), but in
> QEMU let's just populate the value on illegal instructions. This won't
> break any guest software, but will provide more information to guests.
> 
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.h        | 2 ++
>   target/riscv/cpu_helper.c | 3 +++
>   target/riscv/translate.c  | 3 +++
>   3 files changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

