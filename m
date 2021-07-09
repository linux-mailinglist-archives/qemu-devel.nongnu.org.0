Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397D83C26F6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:37:27 +0200 (CEST)
Received: from localhost ([::1]:53942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1sZC-00036s-A1
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sYJ-0001dt-PI
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:36:31 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sYI-0001za-2F
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:36:31 -0400
Received: by mail-pg1-x533.google.com with SMTP id t9so10345706pgn.4
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 08:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jSFITZFjRwcnEjdPmjwkwvA2nORbym8nsvSG/06C/Lc=;
 b=EPJ6SV4Fq8i7nZoOqa44fVwuYrPi2dEMyz5rDGTIWhj4vNyUZ+u/fSG/Ze2nev9Nar
 Tp4a9kYgu05XzzqLULAMB1EzkfJS6dlyKobydUcPVDm39acQN6E7mWtcP5tK+eYX8nQX
 op6zKJOhihP/X/NXiKp9kGQiO//mriEhC/xD2y0SwmSqKvnjaljoxYIYmVAaKIzYa5ZI
 wgLrZQE1NNhYq44sYZH5S1iewogjXhiEWGZsXLuXcjL4JiLVINdbntWODAGgBtsQbdpi
 ox0FkTJhLJ5B4PISLn49MRB81lT9jE8Ynku9vxaO+S00XNhUrkyAM7u890Eipa79WPm2
 G+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jSFITZFjRwcnEjdPmjwkwvA2nORbym8nsvSG/06C/Lc=;
 b=FOlJJ3vI0wl5GuApXzZQq2v5Xw5fN0Zydwrnqn3DWhBdEQUMqQ+alqtXnDD4n36wK0
 n991Bp2+WXiXGAqQWvNpSSJPIZYooJ09vL6MjtXyNwnxFsU+qwOVHVz01a407B6tVQs/
 OgdU87XFRyUjAe9XFpQ7AJS0cQUMFAom72GqICZrvGEwgim5mPM97VL5hNvXSX/gArOZ
 mBu5wXewEhDb2p5VqgWJ0Ejn2HSl0C8ewLQVnoa3qHtSUhgWeNpSnAZ2OeoxV21ms3l2
 n5EfGNBfT5PRjIKBZMRvDfbZTRyO2LdUBv2YsPWGCk+tpLXQztcQiUbO2BbxY+fEd3eX
 BaAA==
X-Gm-Message-State: AOAM532TgqccMj06eyOIbq8cDJE6u3egKACmk1kHOKc39IPHvwSS35d8
 j2Wmw4bHbKbsDoKjMHXIK0s57Q==
X-Google-Smtp-Source: ABdhPJzcobLm+m3Js6mAWH9FR4SrHx8zoCwsZLlpEeWQ2cADMLH85Ev1FlLvOW6eA4nOU0IErqp84g==
X-Received: by 2002:a63:da0a:: with SMTP id c10mr38908258pgh.255.1625844988672; 
 Fri, 09 Jul 2021 08:36:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id t6sm13043993pjo.4.2021.07.09.08.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 08:36:28 -0700 (PDT)
Subject: Re: [PATCH v1 2/5] hw/intc: sifive_clint: Use RISC-V CPU GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
 <3a9be7f66702c6fb18ab09ad9db0fdd50b1a7df6.1625801410.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aaa5d8dd-d161-684e-4204-e5bb60a2627b@linaro.org>
Date: Fri, 9 Jul 2021 08:36:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3a9be7f66702c6fb18ab09ad9db0fdd50b1a7df6.1625801410.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 8:30 PM, Alistair Francis wrote:
> +typedef struct sifive_clint_callback {
> +    SiFiveCLINTState *s;
> +    int num;
> +} sifive_clint_callback;

Perhaps better to put "num", perhaps with a more descriptive name (hartid?), into 
SiFiveCLINTState itself?

It would avoid some amount of double-indirection, and some awkward memory allocation in 
sifive_clint_create.


>           } else if ((addr & 0x3) == 0) {
> -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MSIP, BOOL_TO_MASK(value));
> +            if (value) {
> +                qemu_irq_raise(clint->soft_irqs[hartid]);
> +            } else {
> +                qemu_irq_lower(clint->soft_irqs[hartid]);
> +            }

You should use qemu_irq_set here.


r~

