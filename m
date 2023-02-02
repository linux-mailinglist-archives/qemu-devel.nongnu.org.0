Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31EE68759B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:52:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSVv-0006og-N6; Thu, 02 Feb 2023 00:52:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNSVm-0006o8-Qo
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:51:56 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNSVl-0000tw-AH
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:51:54 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso4563337pjj.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 21:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bWwOsmnkiU5DkoHvWuXEz7fEEUKM63lJMTeTpwd9aJ8=;
 b=YJybRbCPEFB017c9u1IIesQ5udQTW3dIATduTAr6Mb1g4opd4z1AXfoyFPTUk8wf3Y
 WdVMfCg7e/ezhi/K9F150cssduRernQr2KIPPpPMjBaCMBQGdoMq+Bgl4jmGE6LUsSIx
 OsLKIZinsc6XToqr+HhnPW4qa7FAF3o7RRpZFGdSSdOe/XVcMIM3qL22YHeraNkULEti
 mc/9l5FVz3Cdp2H5iKOZf6o24HawGkHwBngoJmzYRSY+pgxiV1OANrqP2UBT3hNepsJH
 GRvrOX7WPb1nq9qNR0h5aCqtW1dnO7yz1WsxAxG9y1Bt9bGrd4IS7K8rEdxo+aR5CbcR
 mStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bWwOsmnkiU5DkoHvWuXEz7fEEUKM63lJMTeTpwd9aJ8=;
 b=QoszNk/SGZ763JAlKhlHXru8wxb/uG7B+AfnYZz+AzQlWE8BXzLgtksYdOQ8pgmdSn
 vb9XCzVNN2185Izcls1yffSiQauZnUuwJAL6YIv5j/QlkKt4meqEDu64soxZ/jYXZO2x
 Jt/QoF5kIx9H/Nzp/RjqvhD6ItDkhz3PB31PZG9dFCP1oWhuzRB8mxaEA48ZAfXM+qD4
 27yU+rm/t6OzTu81c0SvlEQfZ5LpQUbGsrEMV7n3qhPusM+3pBErmObVZlQnKbVLkwV/
 oGRHTJiHrazJ4hRMNOhNrzil7qUx51vN5PPqZtS7tv/DADX27zvfc3Oe+8OFBX+S8iib
 cL8g==
X-Gm-Message-State: AO0yUKW4L9oAQQhWOP6xDPOQb5AKaBpfflX7fregVdcCOcB1TrZgJ5ZZ
 fXC3Uwe95z484crn43HRTdRWyw==
X-Google-Smtp-Source: AK7set8BvPx1eam5/SmczkqJyZIGjWsaHRP4tyH5xat6xUNYcsWEMM9FIi69r8TSo9IpyPKQRHA9Wg==
X-Received: by 2002:a17:903:41cb:b0:196:2bf1:b688 with SMTP id
 u11-20020a17090341cb00b001962bf1b688mr7110560ple.15.1675317111777; 
 Wed, 01 Feb 2023 21:51:51 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 k14-20020a170902c40e00b00189fd83eb95sm12828149plk.69.2023.02.01.21.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 21:51:51 -0800 (PST)
Message-ID: <03562708-93fd-7338-e842-8ac3bf32b518@linaro.org>
Date: Wed, 1 Feb 2023 19:51:46 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/1] target/loongarch: LL.{W/D} need writes val to dest
 register after sign extension
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: maobibo@loongson.cn, qiaochong@loongson.cn, yangxiaojuan@loongson.cn
References: <20230202031655.953888-1-gaosong@loongson.cn>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230202031655.953888-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/1/23 17:16, Song Gao wrote:
> The Manual 2.2.7.2:
>      'The LL.{W/D} instruction retrieves a word/double-word data from
>      the specified address of the memory and writes it to the general
>      register rd after sign extension.'
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/insn_trans/trans_atomic.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

The sign-extension is provided by

TRANS(ll_w, gen_ll, MO_TESL)
                     ^^^^^^^
this.

So what's the issue?


r~

> 
> diff --git a/target/loongarch/insn_trans/trans_atomic.c.inc b/target/loongarch/insn_trans/trans_atomic.c.inc
> index 6763c1c301..24fea558d6 100644
> --- a/target/loongarch/insn_trans/trans_atomic.c.inc
> +++ b/target/loongarch/insn_trans/trans_atomic.c.inc
> @@ -12,8 +12,8 @@ static bool gen_ll(DisasContext *ctx, arg_rr_i *a, MemOp mop)
>       tcg_gen_addi_tl(t0, src1, a->imm);
>       tcg_gen_qemu_ld_i64(dest, t0, ctx->mem_idx, mop);
>       tcg_gen_st_tl(t0, cpu_env, offsetof(CPULoongArchState, lladdr));
> +    gen_set_gpr(a->rd, dest, EXT_SIGN);
>       tcg_gen_st_tl(dest, cpu_env, offsetof(CPULoongArchState, llval));
> -    gen_set_gpr(a->rd, dest, EXT_NONE);
>       tcg_temp_free(t0);
>   
>       return true;


