Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C6B35F8E7
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:26:16 +0200 (CEST)
Received: from localhost ([::1]:41472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWiLH-0007zL-Rb
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWi4j-0005Uy-Ka
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 12:09:09 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:42777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWi4h-0005kc-SW
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 12:09:09 -0400
Received: by mail-pl1-x62b.google.com with SMTP id w8so8048048plg.9
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 09:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nVw+s5+0MLOyIBrmOx7e4eFg51l57eaa2D9tU0Rbr6Y=;
 b=wnn7CrPXzyziuImlMTcd8owhlLsnL41h8j4uir1+8qghhbVU7zDxv0CAA+YCQaXNhK
 xMan5+edFRzBirEg/Dj94I870NzTCpvCsllaD+hQVD0Thra6gMb72ryzxESvrE7waSPz
 ZH5rll4s5DjYN3S75LHjIKbHgeIfO7JkhwTZMYoMB6h3EDlDdSzhOirJBUqpVCZlI9C+
 3gV+vy3iWla6lkT7D0mBmeinO8+Lk9+r0Q+fw3+j+puEAikavAcxU31shWSRix3pl5UI
 o8qi7eA0BINxCZC4Sg4vddWfi6HGgwmxf11HKow590aosUzCsPV6Fb97k6fK1hmLXho6
 Hccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nVw+s5+0MLOyIBrmOx7e4eFg51l57eaa2D9tU0Rbr6Y=;
 b=Jv/IjXiB6GBeMv84CwbQ44aaZA1hlbBvMZKflAM3qLdorVffLBxLAvLJrdEie6ZlWL
 q9r7L4Qy1+GDYO5std7Y0ZvZesjS07LBt9QxXBtr2yYINhtn//SVlKVSUlj2iCiNC0KU
 FYOS5MzTM8ReRLWdyGvnhWkooKEhhwgSnl3Kffsb+etr1J8urgNoTrQCZv+Zh/3uIaw5
 919q2y75w5BtHHx0XOGqzcpt3HNw3GB4TSi4b2kN8UKOOJTtVInr6ovSpSjWVCytPyGT
 WP1yUn7HuE408L6RlvOgo9HjLmnoiwSZUzRDNNt84VXGwyDwh57uJMGbQkC3GOIwxBBo
 8wXg==
X-Gm-Message-State: AOAM533zTyTk39QpUUcxiSrInO4jJ+QFF2nTrOyYJG3C4yrQekhZXs46
 u/wBR1p5f3MCBgde96TCK1CiuQ==
X-Google-Smtp-Source: ABdhPJwKP5fnDs775vEbwlmRmbbhY76W4ATLQPP4d+dHt4yf1GyCz97ELkrGojs9TB01EjeaAW2nqg==
X-Received: by 2002:a17:902:ea0c:b029:eb:7b6:13ba with SMTP id
 s12-20020a170902ea0cb02900eb07b613bamr14840229plg.25.1618416545811; 
 Wed, 14 Apr 2021 09:09:05 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id g21sm5288773pjl.28.2021.04.14.09.09.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 09:09:05 -0700 (PDT)
Subject: Re: [PATCH 4/5] target/ppc: Base changes to allow 32/64-bit insns
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210413211129.457272-1-luis.pires@eldorado.org.br>
 <20210413211129.457272-5-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e70dd315-dfe4-cc84-cdb3-6591b1fa81bd@linaro.org>
Date: Wed, 14 Apr 2021 09:09:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413211129.457272-5-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 2:11 PM, Luis Pires wrote:
> @@ -7879,7 +7951,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>   {
>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
>       CPUPPCState *env = cs->env_ptr;
> -    int bound;
>   
>       ctx->exception = POWERPC_EXCP_NONE;
>       ctx->spr_cb = env->spr_cb;
> @@ -7961,8 +8032,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       msr_se = 1;
>   #endif
>   
> -    bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
> -    ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
> +    ctx->env = env;
>   }
>   

You've removed the logic that prevents translation from crossing a page 
boundary.  You need to replace it.

A good example of how to handle this properly is arm thumb, at the end of 
thumb_tr_translate_insn.

At the end of ppc_tr_translate_insn, you'd do something like

   if (dc->base.is_jmp == DISAS_NEXT
       && (dc->base.pc_next & (TARGET_PAGE_SIZE - 1))
          == (TARGET_PAGE_SIZE - 4)
       && ppc_peek_next_insn_size(ctx)) {
       dc->base.is_jmp = DISAS_TOO_MANY;
   }


r~

