Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3E361027E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:16:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo9GF-0007J6-2d; Thu, 27 Oct 2022 16:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo9GC-0007Fw-Tg
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:13:52 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo9GB-0002Np-6v
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:13:52 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 v13-20020a17090a6b0d00b0021332e5388fso2514611pjj.1
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 13:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jYLCpW66Dhn+/oH2XYCYj5cV09PbjurarEZLVKrh8Mk=;
 b=qlprS38xxIt1FBbTcX1oYz9m9qiWwCBu6P1BqqjjguZaKceauXkxn4sjCojnM51LWc
 fDKBs3Ery3P24zVa2dG4s4EBk3riMlVfg+boDWqPXKBFLE6/6m9urz4hdjXKd3KYiszL
 2ZVpzxlvYvLPn1VSME+0B6U/I0ySjL7xapHkQiDFuQ52gBpEZ7rGSyf9t81dQdXXXoH/
 Yhx8CJgzOL5tXCIS4nAR+IxU0TY8gantfQqsyZ96PXh3lMyiHkPiAHm4kZpyOTJKnsAV
 Y2wkM6sUVXKoDzvPPHTkccATNq2wCdShP/2bp/kOocUirjfWX1lAYwzoJuHF8K/G2SQ6
 DuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jYLCpW66Dhn+/oH2XYCYj5cV09PbjurarEZLVKrh8Mk=;
 b=FzBu3pQfKPHGGOhpRm5AaGkcQ1KvfOWG9tize9Cda+f23T4jaFz4T4ol6dc/ap5SY4
 Mmp1CVGlM4Q8B48KM2R035Vuwb80BJWC7fO9GscwBmcV93webzSQ/hmZeo6m9ZYFYKTh
 wBB3xF6+eiflhCv1GL0co9u6aSiix8l+pKOgQPvTgQnZgB5PMe7Rvb7HS7DMKHm3xjJj
 R5ff0AkiC1AkSYj3+PHFEw9xKlYz2Cucgdsv9dXtx7Di4Zgjxzv8XV8dYLdSOnNAwUTc
 uuiP6rxSJHR0jCFpXx/6JljdWPo6EVeHWSRCjV99GI61A/M7ZqoSW/xAHtEZU0mmuYBe
 bC/A==
X-Gm-Message-State: ACrzQf3viXjHPVSIBXgWzaaokstfucLHVKpFFuYXKqAxr4TaeEajGp4j
 YGuVkDyStkWWPymw8pf4My9Prw==
X-Google-Smtp-Source: AMsMyM4rDz/aYqujxYsvuyDOvpUm28ysN8unIRhiHBcgP6sOMXVzW684bSPsbDLFDLxqkjnbJK37iw==
X-Received: by 2002:a17:90a:e7c4:b0:213:32a5:a772 with SMTP id
 kb4-20020a17090ae7c400b0021332a5a772mr12391719pjb.72.1666901629346; 
 Thu, 27 Oct 2022 13:13:49 -0700 (PDT)
Received: from ?IPV6:2001:8003:501a:d301:93c4:c1c9:4368:47fa?
 ([2001:8003:501a:d301:93c4:c1c9:4368:47fa])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a170902ea0800b001869ba04c83sm1608347plg.245.2022.10.27.13.13.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 13:13:48 -0700 (PDT)
Message-ID: <dd3250c2-b6c3-cb7b-142e-ee4a69c0b1e4@linaro.org>
Date: Fri, 28 Oct 2022 06:13:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/6] target/i386: Use cpu_unwind_state_data for tpr
 access
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20221027100254.215253-1-richard.henderson@linaro.org>
 <20221027100254.215253-3-richard.henderson@linaro.org>
 <9705b542-d81b-5299-9aba-098dc335d5ef@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9705b542-d81b-5299-9aba-098dc335d5ef@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/27/22 22:22, Claudio Fontana wrote:
> On 10/27/22 12:02, Richard Henderson wrote:
>> +    /* Per x86_restore_state_to_opc. */
>> +    if (TARGET_TB_PCREL) {
>> +        return (env->eip & TARGET_PAGE_MASK) | data[0];
>> +    } else {
>> +        return data[0] - env->segs[R_CS].base;
> 
> here we switch from taking cs_base from the TranslationBlock to taking it from env-> .
> 
> I traced the tb->cs_base use back to
> 
> cpu_exec() and cpu_exec_step_atomic()
> 
> and from there it seems ok, as the sequence is
> 
> cpu_get_tb_cpu_state(cpu->env_ptr, &pc, &cs_base, &flags), which gets it from env,
> 
> followed by
> 
> tb_gen_code(...cs_base) which sets the TranslationBlock cs_base, and tb->cs_base does
> not seem to change again.
Correct.  I wondered if I'd made a mistake by not returning the TB located during the 
search, but it doesn't seem to have mattered for the two users.

> I mention this in the case there can be some weird situation in which env and tb can
> end up not being consistent, does a TranslationBlock that is initialized with a certain
> cs_base from the env that contains user code to load / change the CS segment base
> potentially constitute a problem?
The only way to load/change a CS segment base is a branch instruction, which will of 
course end the TB.  There should be no way to change CS that continues the TB.


r~

