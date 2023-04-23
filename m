Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522326EC1B2
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 21:02:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqexB-0000By-AM; Sun, 23 Apr 2023 15:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqeww-0008Ux-55
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 15:00:44 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqewr-0004Oa-Ls
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 15:00:36 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-2f87c5b4635so3340027f8f.1
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 12:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682276431; x=1684868431;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fDqD0NOgFd+BDN54u+N4JXur4xZq9Wg0xLr3FJPuaEI=;
 b=ziKFRL4U2vxHLji5I6jJd2bm3TDlFzKWvcG3MTr3EoWup/7VDxJQ37Ej1EpJdOwWqP
 Z/n4v5NQjoZJe+IXYmX2AfeAjyO1kaeV6/W9HvP7m9PeaXjoE/2a2YSKIpE7VxSv0Rsc
 81TbJqUi/2pl99KL2D8OH9AASnbT/yw746mAPGbabpW51+XOS6DMPH2x0oQyFowZUkSR
 B8JkD2BTLEmSo1zHrVwFsrG8ZfhkqILsEklopoouOxMzzdPX7jzNxrgRzeVTe9SjYMH0
 Tzt/Lo3Vex9dDhEFbvuvTZysM8DmJIIsBr84pXem4agep7Q1BIBjgv6id6uFGLcOjXWn
 XyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682276431; x=1684868431;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fDqD0NOgFd+BDN54u+N4JXur4xZq9Wg0xLr3FJPuaEI=;
 b=OphoQpxLLGubImH8jxdJ/cpH9wloDu+jHJ33BSaBK43LD6bI602rN03Fu4CpACKkU0
 qYca4OsQFWSwgUFVONBbANJm6dSINcuwoLGIH+/wBRWLbef308jtBmwlhGu1Yr96Ta76
 HuPioq0HjUwUij4sVZ98YxCQgrAlJovvDrjgsAgKi8nlFwvcbyTmSe5Av7PD3QOhmvkd
 w5KsM7z3oNNhaBcW86lqvtB9jVG4Z+DpY2FgJ1L7YdF01rL2Nj90rRQr4qiUtcJGH99I
 SRBrK5a/X7UMENUZXCBn6hmhED33tux3+OBhmm85H0cIr5DzclN633HklROV7s9RsQwW
 gMsA==
X-Gm-Message-State: AAQBX9fQTzVNrdWbRw0q0VUuwA7+Aa/3kGTL6PayLM/0mJJVIN5dV9cI
 XU0rsZ5mRlNJIfUmVf0ksTlMFQ==
X-Google-Smtp-Source: AKy350bu+2ie2NKL8PtDqYl8W0l0IvkLai+l0jGfRSP9lpFnW0jK6rnlWBOJVPts75cFpMnGO6u5qg==
X-Received: by 2002:adf:e952:0:b0:2cf:e74f:2957 with SMTP id
 m18-20020adfe952000000b002cfe74f2957mr8405605wrn.33.1682276430708; 
 Sun, 23 Apr 2023 12:00:30 -0700 (PDT)
Received: from [192.168.109.175] (119.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.119]) by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c450e00b003f0a6a1f969sm13733628wmo.46.2023.04.23.12.00.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:00:30 -0700 (PDT)
Message-ID: <f382adb0-ba0d-be74-c426-7d9a66c18b51@linaro.org>
Date: Sun, 23 Apr 2023 20:43:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 22/54] tcg/arm: Rationalize args to tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 11/4/23 03:04, Richard Henderson wrote:
> Interpret the variable argument placement in the caller.
> Mark the argument registers const, because they must be passed to
> add_qemu_ldst_label unmodified.
> 
> Pass data_type instead of is_64.  We need to set this in
> TCGLabelQemuLdst, so plumb this all the way through from tcg_out_op.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/arm/tcg-target.c.inc | 115 ++++++++++++++++++++-------------------
>   1 file changed, 58 insertions(+), 57 deletions(-)


> -static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
> +static void tcg_out_qemu_ld(TCGContext *s,
> +                            const TCGReg datalo, const TCGReg datahi,
> +                            const TCGReg addrlo, const TCGReg addrhi,
> +                            const MemOpIdx oi, TCGType data_type)
>   {
> -    TCGReg addrlo, datalo, datahi, addrhi __attribute__((unused));
> -    MemOpIdx oi;
> -    MemOp opc;
> -#ifdef CONFIG_SOFTMMU
> -    int mem_index;
> -    TCGReg addend;
> -    tcg_insn_unit *label_ptr;
> -#else
> -    unsigned a_bits;
> -#endif
> -
> -    datalo = *args++;
> -    datahi = (is64 ? *args++ : 0);
> -    addrlo = *args++;
> -    addrhi = (TARGET_LONG_BITS == 64 ? *args++ : 0);
> -    oi = *args++;
> -    opc = get_memop(oi);
> +    MemOp opc = get_memop(oi);
>   
>   #ifdef CONFIG_SOFTMMU
> -    mem_index = get_mmuidx(oi);
> -    addend = tcg_out_tlb_read(s, addrlo, addrhi, opc, mem_index, 1);
> +    TCGReg addend= tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 1);

Missing space before '=', and while here s/1/true/.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


