Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08405E91FE
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 12:09:38 +0200 (CEST)
Received: from localhost ([::1]:35572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocOZt-0002OA-Ev
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 06:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocOYs-0000vM-Ip
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:08:34 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:37420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocOYq-0002qe-Md
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:08:34 -0400
Received: by mail-qk1-x72b.google.com with SMTP id s9so2620640qkg.4
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=XM4WoK/mJYdpuAWH89giv/TlMg+kn78dZxzKbjrMK+c=;
 b=ScKtDMkmAV4fptOzXtwtf7q+xHZ5eKf2Dl3FPb+Ux11c/QoDqf/wZ65rzQsGDTSExl
 CDQ7aAG18ZxX8mCwZ04PCQ5RBT8yzmrbgy/AghHfIO+yv3XqBW1i/AYX1s3KFRWvetE9
 S8Ce764AIfSK9lg/MfnXkCzktHtcYEAsSJta97kIi8zCjlQPVAgF3Eq9Pm1J7e/M9mBl
 kIDyE2PxBdA5b5dSpiYWbmdeHozw+cENwxE6985ljDf11nnwOFla59OLqsaKyZC/sqGK
 32w6/yCWsddbA6wf2PnrIEn2SBtc6QSiySJcaZK8v+jlkQ45EPBRntuqhZypZjh/tj83
 D9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=XM4WoK/mJYdpuAWH89giv/TlMg+kn78dZxzKbjrMK+c=;
 b=JxnLzN/a/fAQTtwwJMmFIerjQ5sKDPSjKmvY6oRJ/OJ8IXCdIwdpz8HoWSr2bJuFoy
 lo1/XsIDLbiqFoafOtfrcFg0DR49T7nIPCRo1Nwim22UKKHZItSNHVoHn92clKKchfyc
 laoL60IbRQCS5QG/ROck2QmR+3ml5HbvvnD5kV2wWBNU775obhyWHyMxlNa0IE0DIGFM
 pWK4NNxBy3yXTplhyq12Hfc7wysPIFX7a3rcjumwZ/OOSN20LHVlyco8qWXo/Xyc96VB
 nmIsnlIzIrnxlnNV539IGfYJjWTLN3b/T78uRXeLmJdBxHi6b2VpHgdsRCzES5iqqilU
 7mtA==
X-Gm-Message-State: ACrzQf1pQ1ALoPq1lDkjmtWti73REX1Plmj9X6x44CfyoUBNnfphgpe6
 KM2hAvUmrsRJ+OZQ9UJtRsGRsw==
X-Google-Smtp-Source: AMsMyM5D7iWdTR7KxznaOKfZq72lM19+g9zcT9ftz5bl7DBpyiEm+diZ1nbQX/Cq6ROPmGjvOBvtoQ==
X-Received: by 2002:a05:620a:2409:b0:6ce:2440:9efd with SMTP id
 d9-20020a05620a240900b006ce24409efdmr10616002qkn.191.1664100511480; 
 Sun, 25 Sep 2022 03:08:31 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:413a:430d:cdd2:88af:d4b3?
 ([2605:ef80:80b2:413a:430d:cdd2:88af:d4b3])
 by smtp.gmail.com with ESMTPSA id
 z12-20020ac87f8c000000b0035ba7012724sm9451205qtj.70.2022.09.25.03.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 03:08:30 -0700 (PDT)
Message-ID: <15a379bf-39f2-5fc5-7a6f-3bdd39e5a2c3@linaro.org>
Date: Sun, 25 Sep 2022 10:08:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 1/9] hw: encode accessing CPU index in MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, Paolo Bonzini <pbonzini@redhat.com>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220922145832.1934429-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/22 14:58, Alex Bennée wrote:
> We currently have hacks across the hw/ to reference current_cpu to
> work out what the current accessing CPU is. This breaks in some cases
> including using gdbstub to access HW state. As we have MemTxAttrs to
> describe details about the access lets extend it to mention if this is
> a CPU access and which one it is.
> 
> There are a number of places we need to fix up including:
> 
>    CPU helpers directly calling address_space_*() fns
>    models in hw/ fishing the data out of current_cpu
> 
> I'll start addressing some of these in following patches.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - use separate field cpu_index
>    - bool for requester_is_cpu
> ---
>   include/exec/memattrs.h |  4 ++++
>   accel/tcg/cputlb.c      | 22 ++++++++++++++++------
>   hw/core/cpu-sysemu.c    | 17 +++++++++++++----
>   3 files changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 9fb98bc1ef..e83a993c21 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -43,6 +43,10 @@ typedef struct MemTxAttrs {
>        * (see MEMTX_ACCESS_ERROR).
>        */
>       unsigned int memory:1;
> +    /* Requester is CPU (or as CPU, e.g. debug) */
> +    bool requester_is_cpu:1;
> +    /* cpu_index (if requester_is_cpu) */
> +    unsigned int cpu_index:16;
>       /* Requester ID (for MSI for example) */
>       unsigned int requester_id:16;

I'm not keen on adding another field like this.

I don't think it addresses Peter's point about unique identifiers on e.g. the MSI bus. 
But addressing that is surely an problem for any host/pci bridge that supports PCI. 
Because we're already talking about two different busses -- PCI, and the one between the 
cpu and the bridge.

What bounds our max number of cpus at the moment?  We use "int" in struct CPUCore, but 
that's almost certainly for convenience.

target/s390x/cpu.h:#define S390_MAX_CPUS 248
hw/i386/pc_piix.c:    m->max_cpus = HVM_MAX_VCPUS;

hw/i386/pc_q35.c:    m->max_cpus = 288;

hw/arm/virt.c:    mc->max_cpus = 512;

hw/arm/sbsa-ref.c:    mc->max_cpus = 512;

hw/i386/microvm.c:    mc->max_cpus = 288;

hw/ppc/spapr.c:    mc->max_cpus = INT32_MAX;


Most of these are nicely bounded, but HVM_MAX_VCPUS is a magic number from Xen, and ppc 
appears to be prepared for 31 bits worth of cpus.


> @@ -1340,8 +1340,13 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>       uint64_t val;
>       bool locked = false;
>       MemTxResult r;
> +    MemTxAttrs attrs = iotlbentry->attrs;
>   
> -    section = iotlb_to_section(cpu, iotlbentry->addr, iotlbentry->attrs);
> +    /* encode the accessing CPU */
> +    attrs.requester_is_cpu = 1;
> +    attrs.cpu_index = cpu->cpu_index;


As I said before, we cannot set these generically, or MEMTXATTRS_UNSPECIFIED means 
nothing.  Furthermore, they should be set at the point we create the tlb entry, not while 
we're reading it.  Thus this must be done by each target's tlb_fill function.

> @@ -51,13 +51,22 @@ hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
>                                        MemTxAttrs *attrs)
>   {
>       CPUClass *cc = CPU_GET_CLASS(cpu);
> +    MemTxAttrs local = { };
> +    hwaddr res;
>   
>       if (cc->sysemu_ops->get_phys_page_attrs_debug) {
> -        return cc->sysemu_ops->get_phys_page_attrs_debug(cpu, addr, attrs);
> +        res = cc->sysemu_ops->get_phys_page_attrs_debug(cpu, addr, &local);
> +    } else {
> +        /* Fallback for CPUs which don't implement the _attrs_ hook */
> +        local = MEMTXATTRS_UNSPECIFIED;
> +        res = cc->sysemu_ops->get_phys_page_debug(cpu, addr);
>       }
> -    /* Fallback for CPUs which don't implement the _attrs_ hook */
> -    *attrs = MEMTXATTRS_UNSPECIFIED;
> -    return cc->sysemu_ops->get_phys_page_debug(cpu, addr);
> +
> +    /* debug access is treated as though it came from the CPU */
> +    local.requester_is_cpu = 1;
> +    local.cpu_index = cpu->cpu_index;
> +    *attrs = local;
> +    return res;

Again, I don't think it makes any sense to have .unspecified set, and anything else non-zero.


r~

