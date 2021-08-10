Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058D43E8380
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 21:17:43 +0200 (CEST)
Received: from localhost ([::1]:50088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDXFt-0002ND-Io
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 15:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDXEO-0001gn-A9
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 15:16:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mDXEJ-0003tI-Uk
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 15:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628622962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qEkbXV0ZhqnmOHhDu2GWJhBwdMdFk0KeTT04D3apWto=;
 b=DX1EkAAsijXFt00zMuFVDAlHfgvZ/PDEK79cxIDMLIk28RqbmgEV4jchwxCYzgJzU+728T
 WwZxMArSBr6UumyaX0pazNsFdc0pwgsML9DxwDuGXQj4SPBFCXTY7YYo2Qwl32PBR8kyqz
 qRYzfcc7fUba+0Fgown3SQwlW+ouNwk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-kVjniY-iMOaPXdxjF92rrA-1; Tue, 10 Aug 2021 15:16:00 -0400
X-MC-Unique: kVjniY-iMOaPXdxjF92rrA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k15-20020a5d628f0000b029015501bab520so1011349wru.16
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 12:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qEkbXV0ZhqnmOHhDu2GWJhBwdMdFk0KeTT04D3apWto=;
 b=UmhNetMpVU+l//CmJz0DRFe7BpzbcoUwe3kTI3D6vTyubTbyeyCAMjHUC1UdcrwsDI
 nxRvIu0radlIid/4EUJ5v0MO6c9HOdaFgLo3DkjaMzSxHIIQOD4O9vsHcPQyMxubuIsq
 qok8SCOQ+JUJUeRoEqXdgHz/uiRq1maw7actWX6BrZyyJHxU99UHeBiSC+MkuQ3+u0cw
 JJqcG6Lo0fcXlyuG4C7Cjuwl6i4WN6cxU1jpkQ02m7Bdhigyadgdz4AxERlv6qY/HI4m
 PBksUfCvDywn/eDwYAkCUKa23SgCgv88Je8jNABMQQ5Nld4oJe1l/sVpkMc3mb74rhsN
 Y8IQ==
X-Gm-Message-State: AOAM532I3ZHbD2/BmDGuEX/1LupVmTqVsbCOTT5+MGtkAhfzBVAJa99W
 gjBqqPagCOVXBNOD8ntKYI8QyKSGPb4e9XeFsXzWcYuUuIoKH8EsinwmOyviEJWmMUuVvPwuqsK
 Sjqyfilzh/fTwtbQ=
X-Received: by 2002:adf:f2ca:: with SMTP id d10mr11125419wrp.149.1628622957379; 
 Tue, 10 Aug 2021 12:15:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDUCIn8Z6A9u4PMtuW1YTbxMnf9kMSSXbWUCY/OhJdOKPdIJkeJdcx74GsacwC+h0z7fj1jA==
X-Received: by 2002:adf:f2ca:: with SMTP id d10mr11125384wrp.149.1628622957068; 
 Tue, 10 Aug 2021 12:15:57 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id 104sm24764806wrc.4.2021.08.10.12.15.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 12:15:56 -0700 (PDT)
Subject: Re: [PATCH v14] qapi: introduce 'query-x86-cpuid' QMP command.
To: Valeriy Vdovin <valery.vdovin.s@gmail.com>, qemu-devel@nongnu.org
References: <20210810065131.2849-1-valery.vdovin.s@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <685150fb-8f53-97f4-b04c-e90fd09934b3@redhat.com>
Date: Tue, 10 Aug 2021 21:15:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810065131.2849-1-valery.vdovin.s@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Denis Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/21 8:51 AM, Valeriy Vdovin wrote:
> From: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
> 
> Introducing new QMP command 'query-x86-cpuid'. This command can be used to
> get virtualized cpu model info generated by QEMU during VM initialization in
> the form of cpuid representation.
> 
> Diving into more details about virtual CPU generation: QEMU first parses '-cpu'
> command line option. From there it takes the name of the model as the basis for
> feature set of the new virtual CPU. After that it uses trailing '-cpu' options,
> that state if additional cpu features should be present on the virtual CPU or
> excluded from it (tokens '+'/'-' or '=on'/'=off').
> After that QEMU checks if the host's cpu can actually support the derived
> feature set and applies host limitations to it.
> After this initialization procedure, virtual CPU has it's model and
> vendor names, and a working feature set and is ready for identification
> instructions such as CPUID.
> 
> To learn exactly how virtual CPU is presented to the guest machine via CPUID
> instruction, new QMP command can be used. By calling 'query-x86-cpuid'
> command, one can get a full listing of all CPUID leaves with subleaves which are
> supported by the initialized virtual CPU.
> 
> Other than debug, the command is useful in cases when we would like to
> utilize QEMU's virtual CPU initialization routines and put the retrieved
> values into kernel CPUID overriding mechanics for more precise control
> over how various processes perceive its underlying hardware with
> container processes as a good example.
> 
> The command is specific to x86. It is currenly only implemented for KVM acceleator.
> 
> Output format:
> The output is a plain list of leaf/subleaf argument combinations, that
> return 4 words in registers EAX, EBX, ECX, EDX.
> 
> Use example:
> qmp_request: {
>   "execute": "query-x86-cpuid"
> }
> 
> qmp_response: {
>   "return": [
>     {
>       "eax": 1073741825,
>       "edx": 77,
>       "in-eax": 1073741824,
>       "ecx": 1447775574,
>       "ebx": 1263359563
>     },
>     {
>       "eax": 16777339,
>       "edx": 0,
>       "in-eax": 1073741825,
>       "ecx": 0,
>       "ebx": 0
>     },
>     {
>       "eax": 13,
>       "edx": 1231384169,
>       "in-eax": 0,
>       "ecx": 1818588270,
>       "ebx": 1970169159
>     },
>     {
>       "eax": 198354,
>       "edx": 126614527,
>       "in-eax": 1,
>       "ecx": 2176328193,
>       "ebx": 2048
>     },
>     ....
>     {
>       "eax": 12328,
>       "edx": 0,
>       "in-eax": 2147483656,
>       "ecx": 0,
>       "ebx": 0
>     }
>   ]
> }
> 
> Signed-off-by: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
> ---
> v2: - Removed leaf/subleaf iterators.
>     - Modified cpu_x86_cpuid to return false in cases when count is
>       greater than supported subleaves.
> v3: - Fixed structure name coding style.
>     - Added more comments
>     - Ensured buildability for non-x86 targets.
> v4: - Fixed cpu_x86_cpuid return value logic and handling of 0xA leaf.
>     - Fixed comments.
>     - Removed target check in qmp_query_cpu_model_cpuid.
> v5: - Added error handling code in qmp_query_cpu_model_cpuid
> v6: - Fixed error handling code. Added method to query_error_class
> v7: - Changed implementation in favor of cached cpuid_data for
>       KVM_SET_CPUID2
> v8: - Renamed qmp method to query-kvm-cpuid and some fields in response.
>     - Modified documentation to qmp method
>     - Removed helper struct declaration
> v9: - Renamed 'in_eax' / 'in_ecx' fields to 'in-eax' / 'in-ecx'
>     - Pasted more complete response to commit message.
> v10:
>     - Subject changed
>     - Fixes in commit message
>     - Small fixes in QMP command docs
> v11:
>     - Added explanation about CONFIG_KVM to the commit message.
> v12:
>     - Changed title from query-kvm-cpuid to query-x86-cpuid
>     - Removed CONFIG_KVM ifdefs
>     - Added detailed error messages for some stub/unimplemented cases.
> v13:
>     - Tagged with since 6.2
> v14:
>     - Rebased to latest master 632eda54043d6f26ff87dac16233e14b4708b967
>     - Added note about error return cases in api documentation.
> 
>  qapi/machine-target.json   | 46 ++++++++++++++++++++++++++++++++++
>  softmmu/cpus.c             |  2 +-
>  target/i386/kvm/kvm-stub.c | 10 ++++++++
>  target/i386/kvm/kvm.c      | 51 ++++++++++++++++++++++++++++++++++++++
>  tests/qtest/qmp-cmd-test.c |  1 +
>  5 files changed, 109 insertions(+), 1 deletion(-)
> 
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index e7811654b7..71648a4f56 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -329,3 +329,49 @@
>  ##
>  { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
>    'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> +
> +##
> +# @CpuidEntry:
> +#
> +# A single entry of a CPUID response.
> +#
> +# One entry holds full set of information (leaf) returned to the guest
> +# in response to it calling a CPUID instruction with eax, ecx used as
> +# the arguments to that instruction. ecx is an optional argument as
> +# not all of the leaves support it.
> +#
> +# @in-eax: CPUID argument in eax
> +# @in-ecx: CPUID argument in ecx
> +# @eax: CPUID result in eax
> +# @ebx: CPUID result in ebx
> +# @ecx: CPUID result in ecx
> +# @edx: CPUID result in edx
> +#
> +# Since: 6.2
> +##
> +{ 'struct': 'CpuidEntry',
> +  'data': { 'in-eax' : 'uint32',
> +            '*in-ecx' : 'uint32',
> +            'eax' : 'uint32',
> +            'ebx' : 'uint32',
> +            'ecx' : 'uint32',
> +            'edx' : 'uint32'
> +          },
> +  'if': 'defined(TARGET_I386)' }
> +
> +##
> +# @query-x86-cpuid:
> +#
> +# Returns raw data from the emulated CPUID table for the first VCPU.
> +# The emulated CPUID table defines the response to the CPUID
> +# instruction when executed by the guest operating system.
> +# 
> +#
> +# Returns: a list of CpuidEntry. Returns error when qemu is configured with
> +# --disable-kvm flag or if qemu is run with any other accelerator than KVM.
> +#
> +# Since: 6.2
> +##
> +{ 'command': 'query-x86-cpuid',
> +  'returns': ['CpuidEntry'],
> +  'if': 'defined(TARGET_I386)' }
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 071085f840..8501081897 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -129,7 +129,7 @@ void hw_error(const char *fmt, ...)
>  /*
>   * The chosen accelerator is supposed to register this.
>   */
> -static const AccelOpsClass *cpus_accel;
> +const AccelOpsClass *cpus_accel;
>  
>  void cpu_synchronize_all_states(void)
>  {
> diff --git a/target/i386/kvm/kvm-stub.c b/target/i386/kvm/kvm-stub.c
> index f6e7e4466e..9eb04d908f 100644
> --- a/target/i386/kvm/kvm-stub.c
> +++ b/target/i386/kvm/kvm-stub.c
> @@ -12,6 +12,7 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "kvm_i386.h"
> +#include "qapi/error.h"
>  
>  #ifndef __OPTIMIZE__
>  bool kvm_has_smm(void)
> @@ -44,3 +45,12 @@ bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
>  {
>      abort();
>  }
> +
> +typedef struct CpuidEntryList CpuidEntryList;

Isn't the typedef QAPI-generated?

> +CpuidEntryList *qmp_query_x86_cpuid(Error **errp);
> +
> +CpuidEntryList *qmp_query_x86_cpuid(Error **errp)
> +{
> +    error_setg(errp, "Not implemented in --disable-kvm configuration");
> +    return NULL;
> +}
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index e69abe48e3..28e79cd0cf 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -20,11 +20,13 @@
>  
>  #include <linux/kvm.h>
>  #include "standard-headers/asm-x86/kvm_para.h"
> +#include "qapi/qapi-commands-machine-target.h"
>  
>  #include "cpu.h"
>  #include "host-cpu.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/hw_accel.h"
> +#include "sysemu/accel-ops.h"
>  #include "sysemu/kvm_int.h"
>  #include "sysemu/runstate.h"
>  #include "kvm_i386.h"
> @@ -1540,6 +1542,51 @@ static Error *invtsc_mig_blocker;
>  
>  #define KVM_MAX_CPUID_ENTRIES  100
>  
> +struct kvm_cpuid2 *cpuid_data_cached;
> +extern const AccelOpsClass *cpus_accel;

Nack. Declarations go in headers.

You might want to look at
https://www.mail-archive.com/qemu-devel@nongnu.org/msg827317.html
and rebase your series on it.

> +
> +static inline int is_kvm_accel(AccelOpsClass *class)
> +{
> +    ObjectClass *parent_class;
> +
> +    parent_class = &class->parent_class;
> +    return strcmp(object_class_get_name(parent_class),
> +        "kvm-accel-ops") == 0;
> +}
> +
> +CpuidEntryList *qmp_query_x86_cpuid(Error **errp)
> +{
> +    int i;
> +    struct kvm_cpuid_entry2 *kvm_entry;
> +    CpuidEntryList *head = NULL, **tail = &head;
> +    CpuidEntry *entry;
> +
> +    if (!cpuid_data_cached) {
> +         if (cpus_accel && !is_kvm_accel((AccelOpsClass *)cpus_accel))
> +             error_setg(errp, "Not implemented for non-kvm accel");
> +         else
> +             error_setg(errp, "VCPU was not initialized yet");
> +         return NULL;
> +    }
> +
> +    for (i = 0; i < cpuid_data_cached->nent; ++i) {
> +        kvm_entry = &cpuid_data_cached->entries[i];
> +        entry = g_malloc0(sizeof(*entry));
> +        entry->in_eax = kvm_entry->function;
> +        if (kvm_entry->flags & KVM_CPUID_FLAG_SIGNIFCANT_INDEX) {
> +            entry->in_ecx = kvm_entry->index;
> +            entry->has_in_ecx = true;
> +        }
> +        entry->eax = kvm_entry->eax;
> +        entry->ebx = kvm_entry->ebx;
> +        entry->ecx = kvm_entry->ecx;
> +        entry->edx = kvm_entry->edx;
> +        QAPI_LIST_APPEND(tail, entry);
> +    }
> +
> +    return head;
> +}
> +
>  int kvm_arch_init_vcpu(CPUState *cs)
>  {
>      struct {
> @@ -1923,6 +1970,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      if (r) {
>          goto fail;
>      }
> +    if (!cpuid_data_cached) {
> +        cpuid_data_cached = g_malloc0(sizeof(cpuid_data));
> +        memcpy(cpuid_data_cached, &cpuid_data, sizeof(cpuid_data));
> +    }
>  
>      if (has_xsave) {
>          env->xsave_buf_len = sizeof(struct kvm_xsave);
> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
> index c98b78d033..bd883f7f52 100644
> --- a/tests/qtest/qmp-cmd-test.c
> +++ b/tests/qtest/qmp-cmd-test.c
> @@ -46,6 +46,7 @@ static int query_error_class(const char *cmd)
>          { "query-balloon", ERROR_CLASS_DEVICE_NOT_ACTIVE },
>          { "query-hotpluggable-cpus", ERROR_CLASS_GENERIC_ERROR },
>          { "query-vm-generation-id", ERROR_CLASS_GENERIC_ERROR },
> +        { "query-x86-cpuid", ERROR_CLASS_GENERIC_ERROR },
>          { NULL, -1 }
>      };
>      int i;
> 


