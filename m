Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305056D0C53
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 19:09:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phvkf-0002Ap-J8; Thu, 30 Mar 2023 13:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phvkc-00029y-Vg
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 13:07:51 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phvkb-0004nF-CB
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 13:07:50 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso22642562pjb.3
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 10:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680196067;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=33ISq6fHBq1gQz2kqR4zb/6dFLQ/8VDamxNnpOcpXQE=;
 b=C7vJ0HiohpsxZ3TFos9eSYz72yrHP6tyE3NOr4Yf/IDB3tvSkkdzuUbpQcE9rjxWMD
 f7vUS3M+U8ds2/K9mZS/B6W9BzbEfXhCKk65ZXMKaoPJkfFOWf9EIHvMUbQWA2FaNYw5
 /1RA2RFT009r98vdch6PpThhScZ/dHwq74Z5s51yAgLRdcbxy22G5vzX4DUUtDUFcxnC
 C2h0VZPQXkwBT+hNwbyVA+55I2ItyIvwDbzItMAvRiRiTmcq4RQAvpH/8xHfj6gCalPP
 cPvl8/KWAkhq2+TjRCKqbrlbof0iOYHSZKsK1D6BNQ7Ie88Lxjo8AjLYmPk2368OdeQE
 B3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680196067;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=33ISq6fHBq1gQz2kqR4zb/6dFLQ/8VDamxNnpOcpXQE=;
 b=Mw+RO+HuKv0aGSDvnejz3DcwmmH8J+Hz7nnog7o3TmsPM2QngZJjGD0UlrOI21Oren
 9s9pGDNDg1zcHmtHRirrctPF9+D9yYS2+5O9Kqoc7BnFUEmNxyWkQNC9IZ+kJno6E1V0
 hw6W4CpA6aEwbouAIFMOqQ1EuH/PKrFkhrEOVHTczpWrqZ6KhCVo0dqkYuXPM1/NiVfy
 OBF+UwEZ88AgoGw4bAXQhMZt0cF25bQkmXO94lVOQdgWlNHgRQROTK4KuIt93LqHbwAa
 EL1UjKBNDYX7eYAXcWyp370Bnfr+btusaUV3i39KaTlHMoRU3SkFDOej20xdZwv3uJa/
 8wEA==
X-Gm-Message-State: AAQBX9cLGxT8tv8+aWTGJK4VEG6khGNuVP02oPp9TZMxTsu+4BxMHg/E
 1Zi1A0/z5NksbN0zZmNwFvJ49A==
X-Google-Smtp-Source: AKy350ZYNRzjuPXRTZS+19pQzK07ue+jvjj6vpgjupjOmB83xhCzdOA9ENE2C/D9AYzu5hmuz4mVVA==
X-Received: by 2002:a17:90b:4f48:b0:22c:59c3:8694 with SMTP id
 pj8-20020a17090b4f4800b0022c59c38694mr26686062pjb.44.1680196067251; 
 Thu, 30 Mar 2023 10:07:47 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:7fc3:bb75:1c52:e14c?
 ([2602:ae:1541:f901:7fc3:bb75:1c52:e14c])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a17090a948100b0023d386e4806sm3423354pjo.57.2023.03.30.10.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 10:07:46 -0700 (PDT)
Message-ID: <b23f854c-34b6-298f-ea74-6e9f1b6ca16e@linaro.org>
Date: Thu, 30 Mar 2023 10:07:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/5] target/riscv: Add support for PC-relative
 translation
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230329032346.55185-1-liweiwei@iscas.ac.cn>
 <20230329032346.55185-5-liweiwei@iscas.ac.cn>
 <08b81942-a356-51c2-9de1-6e057a2ca8b1@linaro.org>
 <3fdf9a33-767a-53f9-c222-ef9cd39f0689@iscas.ac.cn>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <3fdf9a33-767a-53f9-c222-ef9cd39f0689@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 3/29/23 18:09, liweiwei wrote:
>>> @@ -51,26 +59,43 @@ static bool trans_jal(DisasContext *ctx, arg_jal *a)
>>>   static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>>>   {
>>>       TCGLabel *misaligned = NULL;
>>> +    TCGv succ_pc = tcg_temp_new();
>>
>> succ_pc can by null for !CF_PCREL...
> I think this is OK since it's only used for CF_PCREL.

It allocates an unused temp.  Not a bug per se, but an easily fixable mistake.

>> ... or initialized like
>>
>>        } else {
>>            succ_pc = tcg_constant_tl(ctx->pc_succ_insn);
>>        }

If you do this, you can avoid the test/set/seti later.

>>>       if (misaligned) {
>>>           gen_set_label(misaligned);
>>> -        gen_exception_inst_addr_mis(ctx);
>>> +        gen_exception_inst_addr_mis(ctx, target_pc);
>>>       }
>>
>> This is what I expected from patch 3: cpu_pc is unchanged, with the new (incorrect) 
>> address passed to inst_addr_mis for assigning to badaddr.  Bug being fixed here, thus 
>> should really be a separate patch.
> 
> It's OK to update cpu_pc before gen_exception_inst_addr_mis() since it will restore the 
> current pc by gen_set_pc_imm() after update cpu_pc into badaddr.

True, but I think it's confusing to set cpu_pc for it's mere use in copying to badaddr, 
and rely on generate_exception to reset cpu_pc to the correct value.

> However, after PC-relative translation is enabled, we cannot use gen_set_pc to directly 
> update cpu_pc in above case, since gen_set_pc() will break the pc_save, and make 
> gen_set_pc_imm() in gen_exception_inst_addr_mis() failed. So we introduce a temp target_pc 
> instead of cpu_pc to compute the destination pc and use it to do misaligned check.

Exactly.

Which is why I think it is better to simply pass gen_exception_inst_addr_mis the value to 
use with badaddr in a normal temp (or constant).  And do this always, not simply in the 
one case where it is absolutely required to not clobber cpu_pc.


r~

