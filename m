Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE84C3A2D1A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:32:13 +0200 (CEST)
Received: from localhost ([::1]:39134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKn6-0006Cu-I6
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrKl2-0004LU-R3
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:30:04 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:39491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrKl0-0001dL-50
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:30:04 -0400
Received: by mail-pf1-x429.google.com with SMTP id k15so1631335pfp.6
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ki6JLcyj919EUFRUctRJZvUCun3KFEovFArpfVKfjMs=;
 b=yxuuGPv1TBvrukInkBt+UvKMyq7KkKwCje469yoryk+b/X2FebyD8rCu31GZYMsf8L
 xEjFnoQoKi3JRlL5Np+hygmMYG7bLWDdzuY8ed9A8/GJimNZZXqxU5NJeKue/xYCM9Tr
 kMqpx9Q/l1QWMwTkX9nuGkLCQn69WGEZIBjO7+g7A2662RzhXeN1DK5BWKw8ElPvyLej
 AMphGXTsX2JJANO8+fkfa8PNRZb44jzo20EjUJVcM9BE8PgXsb1h9fabN50JBpRRyFgJ
 KqZjVHYgeHSoRVhv9879+w3nxfghdbps2+rtvJm3/xdi8iJ6YkwDVl9M/iPUOzoLvtE7
 8kjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ki6JLcyj919EUFRUctRJZvUCun3KFEovFArpfVKfjMs=;
 b=SZ6zYIPnm+AG+S9pr4KFeVYktgnO5mj4s1O8/Be4vNxYXWYFSkuKnF72ggZ2sCIWBP
 k9g8KyTlJA1XI6V4OsRghSxvFyFpGLexor13M1c7OILYzq3qWS2XorD93we732vjiYoB
 sqOinZimryPMr4aG5dwgHigtrcxDj5bZkNmijhXPzR2xrwRoHhu6E8UxLXV1ytppukHw
 32ygNbNcIW4tmcvJDzO0QFIooOl8Ed/aOhxrTSAqVRpwAvE2YDSLrgUr45hd+XbFqXMr
 IPBNYLsBLGSPoGlGwAAXVmGkpJwFfRAq4FZGwhyvk7O/TRADam+lQ+usbOPYSMfs2AgL
 DVLg==
X-Gm-Message-State: AOAM5330dntXdfyj8lAnjaL33x1s5Zj/AuTXvz80IUT4dQvk0F039HvW
 8D4tvrEjAhIsi8arMgWwzWdaSA==
X-Google-Smtp-Source: ABdhPJyK93H3F7jg7LWF5eIG7WWMZF7modi/HviYIdtJexeVcMG4Ui8F9RuFiL9In7iXPiPxq3kGVw==
X-Received: by 2002:a63:4c41:: with SMTP id m1mr4928647pgl.394.1623331798299; 
 Thu, 10 Jun 2021 06:29:58 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a9sm2499119pfo.69.2021.06.10.06.29.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 06:29:57 -0700 (PDT)
Subject: Re: TCG op for 32 bit only cpu on qemu-riscv64
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, QEMU Developers
 <qemu-devel@nongnu.org>, "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <97935519-42c8-71c8-3d87-30aa4cafc909@c-sky.com>
 <618e9348-c420-b560-1f67-3608023985a7@linaro.org>
 <7ac5990e-5f87-3d96-d8b5-bd7997fac0ee@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eb54d2d9-db15-e2d7-e245-f61587b0ca4e@linaro.org>
Date: Thu, 10 Jun 2021 06:29:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7ac5990e-5f87-3d96-d8b5-bd7997fac0ee@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 6:43 PM, LIU Zhiwei wrote:
> 1)First a multiply instruction, if the source value big enough, it will return 
> a result with some bits not zero in MSW 32-bit.

Multiply is fine.  Input bits outside the low 32 cannot appear in the low 32 of 
the output.  Multiply-high-part on the other hand will require sign- or 
zero-extension of inputs.

> 2)If next instruction is a divide instruction,  the MSW 32-bit will influence 
> the divide instruction result.

Yes, division requires extension too.

> So I think use *_tl can't satisfy the need to run 32-bit program on qemu-riscv64.

I said some operations will require extra work -- I gave right-shift as an example.

You just have to be careful about deciding what extra work to do.  I am 
suggesting that truncation to *_i32 is almost always not the correct answer.

Perhaps make it easier by changing gen_get_gpr and gen_set_gpr:

/* Return sign-extended version of gpr. */
static void get_gpr_s(DisasContext *ctx, TCGv t, int reg_num)
{
     if (reg_num == 0) {
         tcg_gen_movi_tl(t, 0);
     } else if (is_32bit(ctx)) {
         tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
     } else {
         tcg_gen_mov_tl(t, cpu_gpr[reg_num]);
     }
}

/* Return zero-extended version of gpr. */
static void get_gpr_u(DisasContext *ctx, TCGv t, int reg_num);
{
     if (reg_num == 0) {
         tcg_gen_movi_tl(t, 0);
     } else if (is_32bit(ctx)) {
         tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
     } else {
         tcg_gen_mov_tl(t, cpu_gpr[reg_num]);
     }
}

/* Return gpr with undefined high bits (which will be ignored). */
static void get_gpr_x(TCGv t, int reg_num);
{
     if (reg_num == 0) {
         tcg_gen_movi_tl(t, 0);
     } else {
         tcg_gen_mov_tl(t, cpu_gpr[reg_num]);
     }
}

And similarly for set.


r~

