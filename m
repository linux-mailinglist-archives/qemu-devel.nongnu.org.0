Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A99B3995D3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 00:20:49 +0200 (CEST)
Received: from localhost ([::1]:38906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loZEG-0002QJ-1o
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 18:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loZCw-0001aZ-GV
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 18:19:26 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loZCu-0005lW-Qv
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 18:19:26 -0400
Received: by mail-pg1-x532.google.com with SMTP id 6so3482794pgk.5
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 15:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fcaz6V6yQMwee8HYp+cmxx/PVQ7N3tswV6x99A/9nhE=;
 b=EiBx38evshsP8TKGDhD8qW0nT/9HGr2m5C6I7YiahoIoO6O1DyKP5Ic7nw14VzfkXc
 c4x9ZshWlMgt0HGtGKro1c60C2Yf1EGXpyFU37w14oIxZLQfHKg4TCTkNXYmFIMcIC2T
 Yk4Gj96YE8CSvzLD9CF9tuDPJRqIzmYRxlwd6/TvJQLlU/bu5ddbV/edvOcAICuIHizy
 cUmGL8V5Fo5P4M9oKhQ5HHHfsFxbYjQeW9tByvYU6PDUx5nuofdEfGJr3xt5D7zw8iQk
 JsO8cWZmEtVo1ZU9Y1FRsB+Qa0y0pB9+dnv0epRXrdtOuIDufgn2F6Ixdoq8sG52+dD4
 OqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fcaz6V6yQMwee8HYp+cmxx/PVQ7N3tswV6x99A/9nhE=;
 b=BP5ivjRtIGaZB4Q7K42xC6rP86rKF4NeBql2A2sX7DQmsT83ehSKJ+kdwvGC5O0Tvf
 VRjwX8wlbjUXAUj9W9jMtGSeNC9I5fqsFO3NAawbXwGrdhr0ReWSH+LtynkxLrhkIdy0
 c3pfokVROzEfHoJT3tOcX0OIotwL5ucgy9m+sSzpmJk6W8565eRY2zN2XkHJdrm0gUoG
 27e9gcI+vZ87lxFHaVAxxn3m9KQn2lSgm/qZqK3oHCsF9q6ddvcYypARCctEhlw9t6NR
 v8ugPaw8V5EcZSfr6v3ay9X6YS41i+NNl3h151/FQjnodj9WhSPGH9eGVC4e4oZe+KJ6
 dMTQ==
X-Gm-Message-State: AOAM530rP9O/5ucbxac6Gp1BUWZXzYqmoYjLQ9T326rQO030UF/3EuTi
 UbMG5w8FpR22OwOnwYuQ5cW85A==
X-Google-Smtp-Source: ABdhPJz3m+UxIRZ8aEkhFuFvNNw1P4Eh8Kgil2nUK5GgYoHXoAVP5rqHld26APiqb8LHBBHCAvRZ0w==
X-Received: by 2002:a63:104a:: with SMTP id 10mr36383135pgq.66.1622672363016; 
 Wed, 02 Jun 2021 15:19:23 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 65sm487965pfu.159.2021.06.02.15.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 15:19:22 -0700 (PDT)
Subject: Re: [RFC PATCH] target/ppc: fix address translation bug for hash
 table mmus
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210602191822.90182-1-bruno.larsen@eldorado.org.br>
 <d7139129-428a-f6c9-c6e2-e540208d62aa@linaro.org>
 <39c92ce9-46b8-4847-974c-647c7a5ca2ae@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b689bdd0-4d75-7c4e-189e-922738208dc0@linaro.org>
Date: Wed, 2 Jun 2021 15:19:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <39c92ce9-46b8-4847-974c-647c7a5ca2ae@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 12:58 PM, Bruno Piazera Larsen wrote:
>> For the use from ppc_cpu_get_phys_page_debug, you'd pass in 
>> cpu_mmu_index(env, false).
> 
> ppc_cpu_get_phys_page_debug has 2 calls to ppc_xlate, one using the data MMU, 
> the other using the instruction MMU. I'm guessing I should pass both, right?

Yes.

> But here we have another bit that confuses me: cpu_mmu_index returns 0 if in 
> user mode, or uses the information stored in env to get it, so I don't see how 
> that would be different from getting directly. Unless the point is to have 
> ppc_*_xlate be generic and pc_*_debug knows the info in env is correct. Is that it?

The issue is that

(1) ppc_*_xlate should perform the lookup requested, and mmu_idx
     does not *necessarily* correspond to the current contents of
     env->msr et al.  See (2).

(2) There is a secondary call to ppc_radix64_partition_scoped_xlate
     for which the second stage page table should be read
     with hypervisor permissions, and not the permissions of the
     original memory access.

     Note that ppc_radix64_check_prot checks msr_pr directly.

     Thus the second stage lookup should use mmu_idx = 5
     (HV kernel virtual mode).  If I understand things correctly...

> 
>>
>>
>>> +    const short HV = 1, IR = 2, DR = 3;
>>> +    bool MSR[3];
>>> +    MSR[HV] = dmmu_idx & 2,
>>> +    MSR[IR] = immu_idx & 4,
>>> +    MSR[DR] = dmmu_idx & 4;
>>
>> There's no point in the array.  Just use three different scalars (real_mode, 
>> hv, and pr (note that pr is the major portion of the bug as reported)). 
>> Additionally, you'll not be distinguishing immu_idx and dmmu_idx, but using 
>> the single idx that's given.
> 
> Ah, yeah, that's the "more complex than necessary, but it was easy for me to 
> read" part. Scalars are a good solution. In this function in specific, PR 
> doesn't actually show up anywhere, so I would actually only need 2. Anyway, 
> will start working on this.

Oh, I'll note that your constants above are wrong.  I think that you should 
have some common routines in (mmu-)internal.h:

/*
  * These correspond to the mmu_idx values computed in
  * hreg_compute_hflags_value.  See the tables therein.
  */
static inline bool mmuidx_pr(int idx) { return idx & 1; }
static inline bool mmuidx_real(int idx) { return idx & 2; }
static inline bool mmuidx_hv(int idx) { return idx & 4; }

because you'll want to use these past mmu-radix64.c.

Then you also have a single place to adjust if the mmu_idx are reordered at a 
later date.


r~

