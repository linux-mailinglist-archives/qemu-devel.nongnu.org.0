Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87576CC20F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 16:29:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phAIQ-0003sL-OZ; Tue, 28 Mar 2023 10:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phAIP-0003sD-2O
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 10:27:33 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phAIN-00066k-Af
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 10:27:32 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 p13-20020a17090a284d00b0023d2e945aebso1843052pjf.0
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680013649;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YMzvtR7zOi30A1asfD03npxLrp/0Ow60Jhr+qcqSW3g=;
 b=RGh9Tn3W5dpgI+5gtWqd7PERhJG0vDoR6r3o3XzFD4enoc+mdkaOotzpM+rb6kmGVs
 Tvfst06gZiTtR1uYADzZvsJ3rIYA+0yaV3hA46zo8XDGrNRbN/PwR/c+NoNJyeWUoCMf
 edReakJweHLS1UcMUMRM1RyFcOmaD3CXxa8FfOkinLa0x8fj+52SHTVpBDG66HhGkT/Q
 CHDLmiwYSV7PANNZfSN3ExfjGR24D6QA3xNUfbzX4XVxojlMKP9y4g/XbyoDNVraIh3O
 qgiUOgWJtz9xhSGrfdkso7aGabDCpUfGnRnXQgq4gqIDuD27JDLPk8ARFyFHo0H5oCU1
 /eFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680013649;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YMzvtR7zOi30A1asfD03npxLrp/0Ow60Jhr+qcqSW3g=;
 b=6zmUQLwgVKFB3pAn3fWKr9qobGrjfxO8hUt0Hb2jqPOjMsdVU4p7DIdlMmIQ4+tLKS
 al8uVJuw3jiGExXIXGOBQGgT2F5TvPpwVKtl10SwOhvX+DL02t1/ew0lMBvB8tQ8Fy8h
 Ug7rGIypdiSZOM2MENQqAomSYbZnr5IKhMqnh5APm7fFjytTtdm9N/9vpygR7n+FjZJC
 U72RdjGUXMJdCRDOW0OidNXg36QnEstAGq8/BOffkX+HxJrbThhftIaIy1HDj+BoQDME
 p8mej9Mizi1QYQJGfvxSrUq6clvo3k85SiBi00UYuiEDGJj6n2G98yHnwsbBFoY4+sf2
 cZ7g==
X-Gm-Message-State: AAQBX9dDmxbWdRzpx59/M2gae2T/1MlOCVJZRXa3wxJknWN+c7VxhCmD
 rgO+V5lAbM9B7nDdNoXxQpRtuQ==
X-Google-Smtp-Source: AKy350YI7vgGDw8APMHXhtHhMtWtF/ueBHNGMLI3EnfLWU9C6ir0rlrjvz9R/pqv84+rjldykrpSYw==
X-Received: by 2002:a17:902:ea06:b0:1a2:7d:17ea with SMTP id
 s6-20020a170902ea0600b001a2007d17eamr20076600plg.56.1680013649423; 
 Tue, 28 Mar 2023 07:27:29 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a17090276c100b00195f0fb0c18sm21184293plt.31.2023.03.28.07.27.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 07:27:29 -0700 (PDT)
Message-ID: <dfaa1ef2-c5c4-58ab-cd1a-0cd75bdf03f1@linaro.org>
Date: Tue, 28 Mar 2023 07:27:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 13/25] target/riscv: Introduce mmuidx_priv
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-14-richard.henderson@linaro.org>
 <a4e87eab-aace-a17b-fef5-5c5b1118a561@linux.alibaba.com>
 <6b21f385-96fd-78f4-bdba-ed552bf2464a@linaro.org>
 <075a0bde-0d28-75e1-097f-f5218403b23d@linux.alibaba.com>
 <61c3d6d1-e242-f256-7d68-51a2155dc62a@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <61c3d6d1-e242-f256-7d68-51a2155dc62a@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 3/27/23 18:54, LIU Zhiwei wrote:
>>>> Can we remove the PRIV from the tb flags after we have this function?
>>>
>>> No, because this is the priv of the memory operation as modified by e.g. MPRV, not the 
>>> true cpu priv.
>>
>> For this implementation, we explicitly use the tb flags for mmu index. I think it is the 
>> reason why we have to maintain the redundant privilege in tb flags.
>> It may be better to only store machine states into tb flags. Can we just pass everything 
>> that we need, for example, the priv and sum, and then implicitly
>> calculate the ctx->mem_idx in disas_init_fn?
>>
>> I remember that you give the similar suggestion in the comment process
>>
>> https://mail.gnu.org/archive/html/qemu-riscv/2023-03/msg00566.html
>>
>> Best Regards,
>> Zhiwei
>>
> To make this comment clear, I paste a simple implementatioin here. But it is just for 
> discussing, not a normal patch for merging.
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 623288e6f9..d4506be5be 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -632,12 +632,10 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
>   target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>   void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
> 
> -#define TB_FLAGS_PRIV_MMU_MASK                3
> -#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
> -
>   #include "exec/cpu-all.h"
> 
> -FIELD(TB_FLAGS, MEM_IDX, 0, 3)
> +FIELD(TB_FLAGS, PRIV, 0, 2)
> +FIELD(TB_FLAGS, SUM, 2, 1)

We would need to include MPRV, MPP, MPV, VIRT_ENABLED as well.  With SUM, that would be 6 
bits in tb_flags instead of 3 bits for MEM_IDX.


r~

