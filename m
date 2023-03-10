Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446206B50E4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:25:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paiLo-00009r-VH; Fri, 10 Mar 2023 14:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiLn-00009D-1k
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:24:23 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiLl-0006hg-Bv
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:24:22 -0500
Received: by mail-pj1-x102d.google.com with SMTP id x34so6334357pjj.0
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678476259;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UBRE6s7GHxjSljW5EAU7mc9VH/G0fjSePuIHBRIWKqg=;
 b=lTbXfdnEePv6fWG497aQVPdRDjR0WebQMdTMltCq7BtaFj0pi+P5W/R4sTusEVxiLP
 LvtOyNqLte9J2g/CSVGQJwSJ2xZpgVN2648rmfGFZBA2yIoJKtrAIbUM9ixchT5JeH5J
 1Aqu5bn2Z8tHeXzEuJaVh1q6XfWpS/+N8cIqsOWHaOhFyLTXndD1DllAoIn3KuZWVqL3
 HbirgAJFejFH1pHXstvZkDwYAKCRL41tOv93YjsSXJbkX69J3YwPd0b1NwVOAOMBdWi0
 m5rlqA3S4TRD4EQiyL91W0PHBH9QwMxezIa6m/h9TnS+rCdQ3qUycLWXoMqZpqLRFrzF
 G5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678476259;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UBRE6s7GHxjSljW5EAU7mc9VH/G0fjSePuIHBRIWKqg=;
 b=ryRBgrwzZgamboqjU3jWk1CbPfrgC/iMa6t3ly3OPZu32wDZGY7rxHGRoSHKdVNUNQ
 n3K6o3jWNjn/jNuu0wQtkzEQkgF0GohhXJqcyGn31wNBhGCqW4NjCgDR1biNIVWWWcUn
 Y7pTtj7sT73AH56TuGqPb7LO/N+CduBppMli7AKHpHWjMPzk8x9EoqmFFYhUXwldFLkn
 r3lbrINm34QUqi1zxu9dzpueQDwYr4Mh2oP/V0F2ogrOtbx2/crR4gBt7w7nIVz7q8Df
 NMN31c1Oq4raEfNoYcPHxYQJU7o5HBnN0Vrsk2VDwITNSqDv6ZZVeYbgA+DWsftozTKX
 cfxw==
X-Gm-Message-State: AO0yUKW74Dumgfp5ipCH85EH7Y1hbzK1/UEHUzXBrMeC0yafNk+BZRML
 lCnTtblzWhZZA+qubcCq/uqW+w==
X-Google-Smtp-Source: AK7set/EyCamWrNo2UmuB+6zr2ArBdwg1nmjSfoI8BoG/5+nTgf5CbSASnFTAOELkqazY/IzzLp8oQ==
X-Received: by 2002:a05:6a20:5481:b0:cc:c3f7:9178 with SMTP id
 i1-20020a056a20548100b000ccc3f79178mr33033537pzk.31.1678476259604; 
 Fri, 10 Mar 2023 11:24:19 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62?
 ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 x53-20020a056a000bf500b005b34d81b010sm176378pfu.91.2023.03.10.11.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 11:24:19 -0800 (PST)
Message-ID: <ac8534ad-6cf5-6ba6-d1a5-10f4135490b2@linaro.org>
Date: Fri, 10 Mar 2023 11:24:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 01/12] target/s390x: Handle branching to odd addresses
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Harold Grovesteen <h.grovsteen@tx.rr.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230310174223.944843-1-iii@linux.ibm.com>
 <20230310174223.944843-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230310174223.944843-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/10/23 09:42, Ilya Leoshkevich wrote:
> @@ -381,6 +382,14 @@ static inline int cpu_mmu_index(CPUS390XState *env, bool ifetch)
>   static inline void cpu_get_tb_cpu_state(CPUS390XState* env, target_ulong *pc,
>                                           target_ulong *cs_base, uint32_t *flags)
>   {
> +    if (env->psw.addr & 1) {
> +        /*
> +         * Instructions must be at even addresses.
> +         * This needs to be checked before address translation.
> +         */
> +        env->int_pgm_ilen = 2; /* see s390_cpu_tlb_fill() */
> +        tcg_s390_program_interrupt(env, PGM_SPECIFICATION, 0);
> +    }

This is incorrect placement.  You can't raise an exception from all of the places from 
which this is called.

You need to do this at the start of s390x_tr_translate_insn.
Compare aarch64_tr_translate_insn and the test for (pc & 3).


r~

