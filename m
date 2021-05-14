Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61900380C2D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 16:46:45 +0200 (CEST)
Received: from localhost ([::1]:56210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZ5Q-0000MC-E3
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 10:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZ3R-0007iQ-M7
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:44:41 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:45752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZ3Q-0005br-50
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:44:41 -0400
Received: by mail-qt1-x829.google.com with SMTP id j11so22316262qtn.12
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 07:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=puMmP83fBR76L+InZ3wLAxfKjzR0D+V8PPO2dYQA5WE=;
 b=WYZhV9tmlWboVfmv6LvCLs/E/nIBHcepDwm3VyjN+oCeSK4kMWmPbUMc/ySwJf+dFu
 JFkSByfsnphncxBi9T4FDjEYUQabeyM9cWZ/EP7WRkzQFseRCAtKA0bP1vIAA81G9BMm
 Z6lpE1bMp1z9i7I9Tvn7466uPLJJRVRFAWVXga/p2TUFAXvgFVCGnUsegLRygrYq20yq
 rOTZGa0tm2L78P7QP1xgkKAA+ZCQ77ai+Zi/f24YVeJ+SFvYWAF0CVXFx6aCaSAH96nC
 BS0nQrGAjhhx2r2bVo419+ICZSBw2OQXvdgKWNfxmUcNYxZwptNWIv0j183md+DEpqig
 FHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=puMmP83fBR76L+InZ3wLAxfKjzR0D+V8PPO2dYQA5WE=;
 b=SXB1EJF/TiGM64Rqa+Pnmk7Le+2ycmrUXs/d/x3VSCSSDMoy4eEDo1VS9TiXO7klZo
 yCu5Q/xI44+/cnjqdApO9NRBHqZghiUpZzHQvVy0//6Ja+a2E2atINoSEls7J4MBK21c
 Pr/UcmCFx+2H/ihu5xWIG/wL2/eK1R2svXSntRH0Dr1XLLSCSrPQG6hE7riNZoxQ8PUa
 wBp8DbQxddeyHXgrRRkT9aa1TmqaEPUlSbqWi8O9+wDc+MYe/Mx8PL0pK/qK3lsib0hJ
 DbYMLOIQ9DrODRyLRK88SLVaW+M9qv8XzZELoKVADgXunK76PlCNKRkMc4DSI4EwrGFt
 gjvw==
X-Gm-Message-State: AOAM530ixDShwm1EF0DTt6fnd7OrcUhrcwnjUhYloZQUONeTadrOBHOy
 hnOrtAD5R/GnQ188aPEWAe2alw==
X-Google-Smtp-Source: ABdhPJzR2ZGVDV/nBq5bM+Vlfxf8eDuFStAqdj/yNupqdy97EW8cWn2CADL2VGzuYLryjZJdtqK1+Q==
X-Received: by 2002:ac8:5f0b:: with SMTP id x11mr30163665qta.160.1621003478965; 
 Fri, 14 May 2021 07:44:38 -0700 (PDT)
Received: from [192.168.183.76] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id r186sm4847054qke.97.2021.05.14.07.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 07:44:38 -0700 (PDT)
Subject: Re: [RFC PATCH 08/11] target/ppc: wrapped some TCG only logic with
 ifdefs
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-9-bruno.larsen@eldorado.org.br>
 <40d53a3b-ca4b-0656-0b64-15ded89b3315@linaro.org>
 <4aab8498-580c-cdb3-9c87-b47d5e1ff33d@eldorado.org.br>
 <b5d3e93f-8324-c21f-4ec3-feb162be455b@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <81666d8f-e261-d13d-3f10-af52ea0edfa9@linaro.org>
Date: Fri, 14 May 2021 09:44:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b5d3e93f-8324-c21f-4ec3-feb162be455b@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 8:29 AM, Bruno Piazera Larsen wrote:
> 
> On 12/05/2021 15:57, Bruno Piazera Larsen wrote:
>> On 12/05/2021 15:33, Richard Henderson wrote:
>>> On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
>>>> diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
>>>> index ba100793a7..ce287222ee 100644
>>>> --- a/include/exec/helper-proto.h
>>>> +++ b/include/exec/helper-proto.h
>>>> @@ -38,7 +38,9 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), 
>>>> dh_ctype(t3), \
>>>>   #define IN_HELPER_PROTO
>>>>     #include "helper.h"
>>>> +#ifdef CONFIG_TCG
>>>>   #include "trace/generated-helpers.h"
>>>> +#endif
>>>>   #include "accel/tcg/tcg-runtime.h"
>>>>   #include "accel/tcg/plugin-helpers.h"
>>>
>>> Um.. this file is exclusively TCG already.
>>> Are you missing some use of helper_foo()?
>> A lot of files that we are compiling (mainly mmu-*, excp_helper and gdbstub 
>> IIRC). We could comb through all of them and remove all declarations of 
>> helpers and wrap the inclusion of helper-proto itself in ifdefs, but it felt 
>> unnecessarily long. If it is preferable, we can do it.
>>
> So, I just looked and we'd need to change excp_helper.c and mmu-hash64.c, 
> encasing 14 and 8 helper_foo() declarations. Is it better to work on those 2 
> files, or to change helper-proto?

Let's work on excp_helper.c and mmu-hash64.c.

For excp_helper.c, ideally everything in there would be tcg related.  Either 
explicitly as helper_foo() or by being one of the TCGCPUOps functions like 
ppc_cpu_exec_interrupt.

For mmu-hash64.c... I guess the easiest thing in the short term is to put big 
ifdefs around helper_slbi{a,e,eg}.  Or they could be moved to mmu_helper.c, 
with slb_lookup declared in mmu-hash64.h.


r~

