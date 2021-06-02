Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D49539937E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 21:28:17 +0200 (CEST)
Received: from localhost ([::1]:57320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loWXI-0005uh-D8
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 15:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loWVo-0004S6-Hk
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 15:26:44 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loWVm-0002PK-FN
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 15:26:44 -0400
Received: by mail-pg1-x532.google.com with SMTP id t9so3113818pgn.4
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 12:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3WhqCNkMqkpLLtW660FTFsfnPlA6aJHp5YH9MYVugPM=;
 b=JiWA+E60FryKqaoIBOmlZoF7clTFCUKOoQLTwj6Ubni3RTGin5O3rtkuZe5C3zsoYI
 08e5omza3g9FlCZyviF0vNywymBjQxk4g0O7XtEEi/p+2BNr4yi8YPcZ1rLyLb6WlWxz
 5Cm14ndWGMwH3TvJ/in42LeX+s4vJ/ZbcigzpTgV7eQOZ2PgxJCmRthLfMTGvuI7gkx8
 Fc9KI1uaeMBykrTkkxhd8LlJSR2+IXEMmare3jzmSkAzTptaniYyms5d0jtw2b2uwf+R
 tBlQ0yXUXUwtbNTFLzIYGuLXrU7klMVfj/Cie/Aadi041lF5wRxnu+SEhJ823hsTh2/C
 +6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3WhqCNkMqkpLLtW660FTFsfnPlA6aJHp5YH9MYVugPM=;
 b=eX7ELlzy9W0UibUDg6C4HiNmzRlSgtHEq3XRQ92fP0AXVhsCEI+U2v/sDk1oUBgQMP
 6B+uuwosj2UpO3FAEJ9I4r9c9YHylQ15j7Ek69fyjvg7LTi+TQqeADkB6iJ6dBVJaXXy
 YieRBiuiEvg39+D39Rjuwj59CaWtNydnvV8uaPXzTZXtDzIynP8wXQnq38C1KJGnfxu2
 xLYD7BNtA/rbidQ3wNX6FA66Xl2azt/QHotRPopAXX9EgTbZNhQMRSA95+LVSv4KbCuf
 hWK+GU4ERcSvyeOcC0QAzcULdhF9nlAE45XsdInqc5PvSsblcfnuXL3GpLWJTGl7UWlV
 +RKA==
X-Gm-Message-State: AOAM531WiUmjR4deACML9GrJHNjydOQuVr3kLI1zbrK85rG5kZJwNcO/
 dv3Z7QBTnByCThAMJEy4qFWY5A==
X-Google-Smtp-Source: ABdhPJwV8WjZ1cLmXhZPbTAXCE+v+c2/Og5cL5f0RERHpdZ7e1kayPFjAlh9+lzyAvqmrabVC5pbHw==
X-Received: by 2002:a63:dd42:: with SMTP id g2mr4716950pgj.338.1622662000363; 
 Wed, 02 Jun 2021 12:26:40 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m2sm464437pgu.85.2021.06.02.12.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 12:26:39 -0700 (PDT)
Subject: Re: [RFC PATCH] target/ppc: fix address translation bug for hash
 table mmus
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210602191822.90182-1-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d7139129-428a-f6c9-c6e2-e540208d62aa@linaro.org>
Date: Wed, 2 Jun 2021 12:26:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210602191822.90182-1-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 6/2/21 12:18 PM, Bruno Larsen (billionai) wrote:
> Based-on: <20210518201146.794854-1-richard.henderson@linaro.org>
> 
> This commit attempts to implement a first draft of a solution to the
> first bug mentioned by Richard Henderson in this e-mail
> https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06247.html
> The second bug was not touched, which is basically implementing the
> solution C
> 
> To sumarize the first bug here, from my understanding, when an address
> translation is asked of a 64bit mmu that uses hashtables, the code
> attempts to check some permission bits, but checks them from the wrong
> location.
> 
> The solution implemented here is more complex than necessary on
> purpose, to make it more readable (and make sure I understand what is
> going on). If that would really fix the problem, I'll move to
> implementing an actual solution, and to all affected functions.
> 
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/mmu-hash64.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index c1b98a97e9..63f10f1be7 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -887,6 +887,14 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
>       int exec_prot, pp_prot, amr_prot, prot;
>       int need_prot;
>       hwaddr raddr;
> +    unsigned immu_idx, dmmu_idx;
> +    immu_idx = (env->hflags >> HFLAGS_IMMU_IDX) & 7;
> +    dmmu_idx = (env->hflags >> HFLAGS_DMMU_IDX) & 7;

This doesn't help at all with the reported bug. You're still reading from env. 
You need the mmu_idx that was passed to ppc_cpu_tlb_fill.

For the use from ppc_cpu_get_phys_page_debug, you'd pass in cpu_mmu_index(env, 
false).


> +    const short HV = 1, IR = 2, DR = 3;
> +    bool MSR[3];
> +    MSR[HV] = dmmu_idx & 2,
> +    MSR[IR] = immu_idx & 4,
> +    MSR[DR] = dmmu_idx & 4;

There's no point in the array.  Just use three different scalars (real_mode, 
hv, and pr (note that pr is the major portion of the bug as reported)). 
Additionally, you'll not be distinguishing immu_idx and dmmu_idx, but using the 
single idx that's given.

> -    if (access_type == MMU_INST_FETCH ? !msr_ir : !msr_dr) {
> +    if (access_type == MMU_INST_FETCH ? !MSR[IR] : !MSR[DR]) {

Which simplifies this condition to just a single test.


r~

