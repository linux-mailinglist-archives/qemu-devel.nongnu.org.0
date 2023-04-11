Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5CA6DCF88
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:53:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm3CE-0003vC-5r; Mon, 10 Apr 2023 21:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm3C3-0003uH-N0
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:53:13 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm3C1-0004lX-Rt
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:53:11 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-632384298b3so3187070b3a.0
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681177985;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dd45i7UxeHdZFsQWRLgzsaEnolrq61z3ps7V9Tm8oxw=;
 b=XAq6gWJuxtMaUHLps1Zxl9tUm3dPB3irXD0FB3FO5C8pJ/U9F61q0szCttxJVXEbCc
 QcHsRkZ1v2q96zJ+5iQrkPGMuVUAh2y9dnYXWe/N5x2gAODvhnlirDSTAHpVF1kx1E4z
 bgNeXhUutXb26EvJ7/5l1JIGWw3omUedfapc7KH+A7MyqPgUmtmfK9jwbBOWv3REZlDh
 dxhrDzxIN72gmWuBFY2EohItmP7w4Cx4Q21oGNaQvEmYl6RNTCLwhfw7WcGV+qUDywob
 R61BEPGOwSJLnEoruQwLOkplZwgMs+6R8K4AYpKbhfvk4nheGeTw9vwQ1FV2RLgP8kbJ
 MFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681177985;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dd45i7UxeHdZFsQWRLgzsaEnolrq61z3ps7V9Tm8oxw=;
 b=BIiKA0k3hcUqERWP20torrRUqMUSldbh23+SXiMWQ+lkkex+5ACXGidio93yBEy+TO
 SwAoVx5krMkcmlYJ0AMi24qFIBi4/aiLW/2NOG0gL94eusrIge2mfEucIXdESoA3NHY9
 R9Ripun5bi8I/Scxl67EGEr3MCfEbDCYbb1k2w6Q5rxvUfsXmizii1uVbb4RxPiH+WOL
 64j0/6gBMPTDYEqHma0oGVHjGZ6JRRO4sV106H2JJLWLnF5hcvC6aL+FiCgp4NAz4RIr
 hKkJ6UeGa+AGf4f4Bs/6SVya/MPVpGSs2574pskibXMuoguWrlyRs9qGfNczbkzFyJa/
 nOXQ==
X-Gm-Message-State: AAQBX9cPF6diuiTMnIF9+kfXT+AAmWZsmuChCFCessfW5BSmhjoGtkWh
 lffpe6Yu/R4ni71XY1Q/4edp8w==
X-Google-Smtp-Source: AKy350aZJPDTQJHfP5KQmZ2BgdEx+HM5Vm2qL+0LZZ8tWBQ+e6mELSQTPkZiWHDG0FHT6L7xrP7l7A==
X-Received: by 2002:a05:6a00:244a:b0:63a:4ef:ae31 with SMTP id
 d10-20020a056a00244a00b0063a04efae31mr3366532pfj.3.1681177985649; 
 Mon, 10 Apr 2023 18:53:05 -0700 (PDT)
Received: from [10.1.0.142] (h146.238.133.40.static.ip.windstream.net.
 [40.133.238.146]) by smtp.gmail.com with ESMTPSA id
 13-20020aa7914d000000b00627fafe49f9sm8459042pfi.106.2023.04.10.18.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 18:53:05 -0700 (PDT)
Message-ID: <9592dac6-2ba7-533a-1d70-2244ecc59761@linaro.org>
Date: Mon, 10 Apr 2023 18:52:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 3/4] target/riscv: check smstateen fcsr flag
Content-Language: en-US
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com
Cc: Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn
References: <20230410141316.3317474-1-mchitale@ventanamicro.com>
 <20230410141316.3317474-4-mchitale@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230410141316.3317474-4-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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

On 4/10/23 07:13, Mayuresh Chitale wrote:
> +#ifndef CONFIG_USER_ONLY
> +#define smstateen_fcsr_check(ctx) do { \
> +    if (!ctx->smstateen_fcsr_ok) { \
> +        if (ctx->virt_enabled) { \
> +            generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT); \
> +        } else { \
> +            generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST); \
> +        } \
> +        return true; \
> +    } \
> +} while (0)
> +#else
> +#define smstateen_fcsr_check(ctx)
> +#endif
> +
> +#define REQUIRE_ZFINX_OR_F(ctx) do { \
> +    if (!has_ext(ctx, RVF)) { \
> +        if (!ctx->cfg_ptr->ext_zfinx) { \
> +            return false; \
> +        } \
> +        smstateen_fcsr_check(ctx); \
>       } \
>   } while (0)

As a matter of style, I strongly object to a *nested* macro returning from the calling 
function.  These should all be changed to normal functions of the form

     if (!require_xyz(ctx) || !require_abc(ctx)) {
         return something;
     }

etc.  insn_trans/trans_rvv.c.inc is much much cleaner in this respect.


r~

