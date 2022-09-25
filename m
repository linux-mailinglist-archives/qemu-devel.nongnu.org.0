Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A275E9350
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 15:14:59 +0200 (CEST)
Received: from localhost ([::1]:45638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocRTG-0006Tj-Q6
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 09:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocRRA-00029e-Pe
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 09:12:49 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocRR8-0004J7-JC
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 09:12:48 -0400
Received: by mail-wr1-x430.google.com with SMTP id bq9so6547389wrb.4
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 06:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=NJxdiTLXuZzJR16lVVCXoXCgKKoZCawDc9l6d4xTbME=;
 b=gNkeOeBwHPzrjZHyta0y/pA8YQ9b4SZGoe8bdn4UHbdshXgt3lau3WrACDiVjaVnDP
 Wmt7aUzhqHVCw1AyOrwoZxQ4LUtxOrEePdc6/PZpE9UKxYzB0wD2txJjIXaH/yxgFlWV
 yz3eaZeC2SpFOIe22ERPd568YjEwB0I1Mz/bo/fpS8+jja6emUNvsOo/BF8ecnH0hnlm
 M2t4EW93Kaikr+r/9svaUwL7uG/L9YGNmqYa9DM2EegR8AcRNFapej/ZmiwTdjBUmm0B
 +qng1AtWbZRANKOPtX8dv6BQudeSxEPqsyN6dNoKhRUFYeL/4LVmPT3VD+wezNI+0H4b
 BEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=NJxdiTLXuZzJR16lVVCXoXCgKKoZCawDc9l6d4xTbME=;
 b=ElR0gHB1SQSXrZTS3jWJBSoj7P17TBVMgORyjU+uis4pxE5PYrTs97o3VilFO43e6X
 TLb2CDhLf3wT1LvFnhYcln9BDiRauim0+lGovljueNkm7fUkbSj90kdp9jvmoL1NFZ6U
 GYEXEzZvz9q2YVMBpHSKWjUDQx21rWxP87b501ZCBY1Lfqs1oCsaQFaol4IuLW4m4Dia
 F0Cno0F0VuPOVxzJaaMt16NemsWpG3hqvzXeATnRiI6/fJCAdNvnAorOI4eOvQR//nKw
 tzDxHCxzd4rbMIMDOlH3NKMUH/MbUx9cYX5JD6FA/zJDfQhPVsi8tjlPQkX+tg6QDH3z
 cwbw==
X-Gm-Message-State: ACrzQf0m0LnHpy5iOAcIBNjqkbKjh9ljmqa7ap1IyT+qrtvmapyIvXWf
 eeIrsCLMN0Ncpkkyirc2qUylsQ==
X-Google-Smtp-Source: AMsMyM6tQAI4Zm90uItFYNB37x6vFvb1UUi/9Cy82BgORw0vaGHyQILCuY6fCx8qtwcLZuWekI5c8g==
X-Received: by 2002:a5d:47a8:0:b0:226:f124:ad74 with SMTP id
 8-20020a5d47a8000000b00226f124ad74mr11068974wrb.18.1664111564214; 
 Sun, 25 Sep 2022 06:12:44 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a05600c35c800b003a84375d0d1sm8406425wmq.44.2022.09.25.06.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 06:12:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6B4A11FFB7;
 Sun, 25 Sep 2022 14:12:42 +0100 (BST)
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-2-alex.bennee@linaro.org>
 <15a379bf-39f2-5fc5-7a6f-3bdd39e5a2c3@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH v1 1/9] hw: encode accessing CPU index in MemTxAttrs
Date: Sun, 25 Sep 2022 14:02:23 +0100
In-reply-to: <15a379bf-39f2-5fc5-7a6f-3bdd39e5a2c3@linaro.org>
Message-ID: <87h70vha2d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 9/22/22 14:58, Alex Benn=C3=A9e wrote:
>> We currently have hacks across the hw/ to reference current_cpu to
>> work out what the current accessing CPU is. This breaks in some cases
>> including using gdbstub to access HW state. As we have MemTxAttrs to
>> describe details about the access lets extend it to mention if this is
>> a CPU access and which one it is.
>> There are a number of places we need to fix up including:
>>    CPU helpers directly calling address_space_*() fns
>>    models in hw/ fishing the data out of current_cpu
>> I'll start addressing some of these in following patches.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>> v2
>>    - use separate field cpu_index
>>    - bool for requester_is_cpu
>> ---
>>   include/exec/memattrs.h |  4 ++++
>>   accel/tcg/cputlb.c      | 22 ++++++++++++++++------
>>   hw/core/cpu-sysemu.c    | 17 +++++++++++++----
>>   3 files changed, 33 insertions(+), 10 deletions(-)
>> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
>> index 9fb98bc1ef..e83a993c21 100644
>> --- a/include/exec/memattrs.h
>> +++ b/include/exec/memattrs.h
>> @@ -43,6 +43,10 @@ typedef struct MemTxAttrs {
>>        * (see MEMTX_ACCESS_ERROR).
>>        */
>>       unsigned int memory:1;
>> +    /* Requester is CPU (or as CPU, e.g. debug) */
>> +    bool requester_is_cpu:1;
>> +    /* cpu_index (if requester_is_cpu) */
>> +    unsigned int cpu_index:16;
>>       /* Requester ID (for MSI for example) */
>>       unsigned int requester_id:16;
>
> I'm not keen on adding another field like this.

Hmm I thought it was unavoidable from Edgar's comment:

  "CPU's can also have a Master-IDs (Requester IDs) which are unrelated to
  the Clusters CPU index. This is used for example in the Xilinx ZynqMP
  and Xilinx Versal and the XMPU (Memory Protection Units).

  Anyway, I think this approach is an improvement from the current state
  but would rather see a new separate field from requester_id. Overloading
  requester_id will break some of our use-cases (in the Xilinx tree)..."

Of course we don't have to care about external use cases but it seemed
to indicate we might need both.

> I don't think it addresses Peter's point about unique identifiers on
> e.g. the MSI bus. But addressing that is surely an problem for any
> host/pci bridge that supports PCI. Because we're already talking about
> two different busses -- PCI, and the one between the cpu and the
> bridge.

We can return to overloading requester_id with a enum to indicate the
type of bus.

> What bounds our max number of cpus at the moment?  We use "int" in
> struct CPUCore, but that's almost certainly for convenience.
>
> target/s390x/cpu.h:#define S390_MAX_CPUS 248
> hw/i386/pc_piix.c:    m->max_cpus =3D HVM_MAX_VCPUS;
>
> hw/i386/pc_q35.c:    m->max_cpus =3D 288;
>
> hw/arm/virt.c:    mc->max_cpus =3D 512;
>
> hw/arm/sbsa-ref.c:    mc->max_cpus =3D 512;
>
> hw/i386/microvm.c:    mc->max_cpus =3D 288;
>
> hw/ppc/spapr.c:    mc->max_cpus =3D INT32_MAX;
>
>
> Most of these are nicely bounded, but HVM_MAX_VCPUS is a magic number
> from Xen, and ppc appears to be prepared for 31 bits worth of cpus.

From 5642e4513e (spapr.c: do not use MachineClass::max_cpus to limit
CPUs) I think it is being a little optimistic. Even with the beefiest
hosts you start to see diminishing returns by ~12 vCPUs and it won't
take long before each extra vCPU just slows you down.

>
>
>> @@ -1340,8 +1340,13 @@ static uint64_t io_readx(CPUArchState *env, CPUIO=
TLBEntry *iotlbentry,
>>       uint64_t val;
>>       bool locked =3D false;
>>       MemTxResult r;
>> +    MemTxAttrs attrs =3D iotlbentry->attrs;
>>   -    section =3D iotlb_to_section(cpu, iotlbentry->addr,
>> iotlbentry->attrs);
>> +    /* encode the accessing CPU */
>> +    attrs.requester_is_cpu =3D 1;
>> +    attrs.cpu_index =3D cpu->cpu_index;
>
>
> As I said before, we cannot set these generically, or
> MEMTXATTRS_UNSPECIFIED means nothing.  Furthermore, they should be set
> at the point we create the tlb entry, not while we're reading it.
> Thus this must be done by each target's tlb_fill function.

I was confused by the last comment because I forgot the TLBs are not
shared between cores. So I can just bang:

    MemTxAttrs attrs =3D { .cpu_index =3D cs->cpu_index };

into arm_cpu_tlb_fill and be done with it? Or only when we know it is an
IOTLB being filled?

>
>> @@ -51,13 +51,22 @@ hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, =
vaddr addr,
>>                                        MemTxAttrs *attrs)
>>   {
>>       CPUClass *cc =3D CPU_GET_CLASS(cpu);
>> +    MemTxAttrs local =3D { };
>> +    hwaddr res;
>>         if (cc->sysemu_ops->get_phys_page_attrs_debug) {
>> -        return cc->sysemu_ops->get_phys_page_attrs_debug(cpu, addr, att=
rs);
>> +        res =3D cc->sysemu_ops->get_phys_page_attrs_debug(cpu, addr, &l=
ocal);
>> +    } else {
>> +        /* Fallback for CPUs which don't implement the _attrs_ hook */
>> +        local =3D MEMTXATTRS_UNSPECIFIED;
>> +        res =3D cc->sysemu_ops->get_phys_page_debug(cpu, addr);
>>       }
>> -    /* Fallback for CPUs which don't implement the _attrs_ hook */
>> -    *attrs =3D MEMTXATTRS_UNSPECIFIED;
>> -    return cc->sysemu_ops->get_phys_page_debug(cpu, addr);
>> +
>> +    /* debug access is treated as though it came from the CPU */
>> +    local.requester_is_cpu =3D 1;
>> +    local.cpu_index =3D cpu->cpu_index;
>> +    *attrs =3D local;
>> +    return res;
>
> Again, I don't think it makes any sense to have .unspecified set, and any=
thing else non-zero.
>
>
> r~


--=20
Alex Benn=C3=A9e

