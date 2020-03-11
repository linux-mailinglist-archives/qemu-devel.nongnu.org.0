Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F121C181D0D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:56:10 +0100 (CET)
Received: from localhost ([::1]:54782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3iM-0000Fq-2z
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33565)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Babu.Moger@amd.com>) id 1jC3hH-0006OO-HL
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:55:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Babu.Moger@amd.com>) id 1jC3hF-0007Yo-OH
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:55:03 -0400
Received: from mail-mw2nam10on2071.outbound.protection.outlook.com
 ([40.107.94.71]:34133 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Babu.Moger@amd.com>) id 1jC3hF-0007We-9U
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:55:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbfSNczm2bAdT/xhTem6lYfsXRrWFdljXQvCI1U43WBXArUwcbUF9glvdewuA76ym4rUvSoQinw1cD7NIFf/A7pEgNR9JwdEcT6HQJF+fLlsqNXrWgFHGDc3T1117GiE8HYqBI10rgzb5kqvCdwJg20wE4R2Mhpi9wd6wpXzOi3lngEgQ2PQ5c964e4pjsw7YtsDmskzGCUT+b63LVejr1Rzgdd7YKg1NVoELeDL5H4zhqaCR+zsqkUYgKl0xVLWPGO+YKDsTyhRGHlMI6gEQcYEM3eaVWD9NKz7VoYrFqVMch2+NAIt/0rxVJQ/8iWqG4suoIHxa5Xh5ra+kPf22A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMQVdD/3b4eUo0xHTCXQ+bflZqUr6QvKTPsqbWvIEPI=;
 b=UxTeWlczYUK5KDeXyx2yVp9PkCCDxSu0bwxPsEEjU6zEytU2VPzxihkdnHhFsXTDOYM+o3rsqMLtWdPVTJWcrXN8ighlTDFgsv6ukK/b5qHKh3r5t5gyFfOVBBiOXCW+goEnu45ZtatmFCPnrspB9DK6SWRzF+Qzv4BZCXbW2f9IDZFgRiAw85MrUaiX4i2IlxRCNlFqk+KDB+NENNeIM9i+qU2uPj+HPRtCcudQPZU0PwpE962I58zXjNnnK5us4kLqyLYHWTvtBz0MhQOCCKagy4dijEUcqyHV09whWMEXGabMRHqvHXKG9vXwr5laEKD+tHrj2XKZBrmOXZNiDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMQVdD/3b4eUo0xHTCXQ+bflZqUr6QvKTPsqbWvIEPI=;
 b=EixhahLcd0VAR7NwkXidQ7FP+H9FwcoG6rhYiXFg0PuVZ5jUYbwtuTitVicnfDAVGYBuK2QqF2PLJXiYNLsLe8IFwRGGjldbrfxErXke0jJdVG6Qm/3tF3KRRAy/uNqjM2g+xQzBJN0X4CrsDWLZ7GnlorjZToYiKAzvgBTGKEM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Babu.Moger@amd.com; 
Received: from SN1PR12MB2560.namprd12.prod.outlook.com (2603:10b6:802:26::19)
 by SN1PR12MB2397.namprd12.prod.outlook.com (2603:10b6:802:27::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Wed, 11 Mar
 2020 15:54:58 +0000
Received: from SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::382f:640c:215f:be93]) by SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::382f:640c:215f:be93%5]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 15:54:58 +0000
Subject: Re: [PATCH v6 10/13] i386: Check for apic id encoding
To: Igor Mammedov <imammedo@redhat.com>
References: <158389385028.22020.7608244627303132902.stgit@naples-babu.amd.com>
 <158389406581.22020.12203992175835061363.stgit@naples-babu.amd.com>
 <20200311131712.35ac421b@redhat.com>
 <c9920837-cb72-08b0-ecea-a060fc88f4e5@amd.com>
 <20200311164841.3f861611@redhat.com>
From: Babu Moger <babu.moger@amd.com>
Message-ID: <4609368e-a239-48f0-4c05-fd7b68753a36@amd.com>
Date: Wed, 11 Mar 2020 10:54:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <20200311164841.3f861611@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0062.namprd05.prod.outlook.com
 (2603:10b6:803:41::39) To SN1PR12MB2560.namprd12.prod.outlook.com
 (2603:10b6:802:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.30.87] (165.204.77.1) by
 SN4PR0501CA0062.namprd05.prod.outlook.com (2603:10b6:803:41::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.6 via Frontend
 Transport; Wed, 11 Mar 2020 15:54:58 +0000
X-Originating-IP: [165.204.77.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eff7da06-686a-46a5-36e7-08d7c5d48cd8
X-MS-TrafficTypeDiagnostic: SN1PR12MB2397:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2397FCAAF847ED9B23D1486B95FC0@SN1PR12MB2397.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(199004)(5660300002)(2906002)(81156014)(478600001)(53546011)(81166006)(66556008)(66476007)(6486002)(6916009)(66946007)(16526019)(956004)(52116002)(186003)(8936002)(2616005)(16576012)(8676002)(316002)(26005)(31696002)(4326008)(36756003)(44832011)(86362001)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2397;
 H:SN1PR12MB2560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hrLP7tMbqBH7WQ98kWOuVjJD/mgCIiBAWg2/S3JTPHB1WEnaDUzkkBcEV4ERfhQZ5I8Wl7BUC4YGLWapUPWP88rJfRNcBF9VCeSDsFdlRKkT06z44sxFY+t3i5RmZeAcshlWphxsCRxvdHaRLkBeQr2Ki6s3UESA7utPC0GuHyIVYyb4NWPfPjfHZxL7xhe8fejz+EHBSMxfQArQHaXL2SdM9ACBbKTps3W+4oDjKblMjmIz8SGbaNnU+xVY4ZZ0Gc89nmgteG8t+YmUyOBS71WsLxHAeTlkqKnD3aPj5eXhK+wRav+l3KxAuKnQm4sIYQb0YeUIqzxETHMV26kr0pWkrw/J3ppO0YyrK1i+5PamB+9117p0X6fnc43knzovgKCj5QaiMVsisnJ79UMnPWly4eNH6/8XhGV4rjo+sZOANVthbiX/D4xlaHHBVvj3
X-MS-Exchange-AntiSpam-MessageData: vwFZ9pcSffbFFo9ZWRGjblFSkzMgVr/2F7O5qhZXfnc55kJJjNAwtBGvdH/xRT3LxHlm1M1y23q/w2sR2UzrCVNGTh3uANEeQN36hP/9OxJIpG2xHnqxhyKjmIdbWXETzSU6Y1CJZA2Oz56+W6o15w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff7da06-686a-46a5-36e7-08d7c5d48cd8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 15:54:58.4982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QrwleeFbqJuPjpaGfZqxnz7n2j92/r0l0BLTmbhw8/OrPZx1RY2uI3A23A/1f8X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2397
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.94.71
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
Cc: ehabkost@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/11/20 10:48 AM, Igor Mammedov wrote:
> On Wed, 11 Mar 2020 09:50:04 -0500
> Babu Moger <babu.moger@amd.com> wrote:
> 
>> On 3/11/20 7:17 AM, Igor Mammedov wrote:
>>> On Tue, 10 Mar 2020 21:34:25 -0500
>>> Babu Moger <babu.moger@amd.com> wrote:
>>>   
>>>> Check X86CPUDefinition if use_epyc_apic_id_encoding is enabled. If enabled
>>>> update X86MachineState with EPYC mode apic_id encoding handlers.
>>>>
>>>> Also update the calling convention to use apic_id handlers from X86MachineState.
>>>>
>>>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>  
>>> usually tags are not retained in case patch is changed significantly
>>>   
>> Ok.
>>
>>> see more below
>>>   
>>>> ---
>>>>  hw/i386/pc.c      |    6 +++---
>>>>  hw/i386/x86.c     |   32 +++++++++++++++++++++++++++-----
>>>>  target/i386/cpu.c |   11 +++++++++++
>>>>  target/i386/cpu.h |    1 +
>>>>  4 files changed, 42 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>>> index 98ee763f68..2d7d611184 100644
>>>> --- a/hw/i386/pc.c
>>>> +++ b/hw/i386/pc.c
>>>> @@ -1580,14 +1580,14 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
>>>>          topo_ids.die_id = cpu->die_id;
>>>>          topo_ids.core_id = cpu->core_id;
>>>>          topo_ids.smt_id = cpu->thread_id;
>>>> -        cpu->apic_id = x86_apicid_from_topo_ids(&topo_info, &topo_ids);
>>>> +        cpu->apic_id = x86ms->apicid_from_topo_ids(&topo_info, &topo_ids);
>>>>      }
>>>>  
>>>>      cpu_slot = pc_find_cpu_slot(MACHINE(pcms), cpu->apic_id, &idx);
>>>>      if (!cpu_slot) {
>>>>          MachineState *ms = MACHINE(pcms);
>>>>  
>>>> -        x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
>>>> +        x86ms->topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
>>>>          error_setg(errp,
>>>>              "Invalid CPU [socket: %u, die: %u, core: %u, thread: %u] with"
>>>>              " APIC ID %" PRIu32 ", valid index range 0:%d",
>>>> @@ -1608,7 +1608,7 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
>>>>      /* TODO: move socket_id/core_id/thread_id checks into x86_cpu_realizefn()
>>>>       * once -smp refactoring is complete and there will be CPU private
>>>>       * CPUState::nr_cores and CPUState::nr_threads fields instead of globals */
>>>> -    x86_topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
>>>> +    x86ms->topo_ids_from_apicid(cpu->apic_id, &topo_info, &topo_ids);
>>>>      if (cpu->socket_id != -1 && cpu->socket_id != topo_ids.pkg_id) {
>>>>          error_setg(errp, "property socket-id: %u doesn't match set apic-id:"
>>>>              " 0x%x (socket-id: %u)", cpu->socket_id, cpu->apic_id,
>>>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>>>> index 7dc237c014..ad85347142 100644
>>>> --- a/hw/i386/x86.c
>>>> +++ b/hw/i386/x86.c
>>>> @@ -68,6 +68,25 @@ inline void init_topo_info(X86CPUTopoInfo *topo_info,
>>>>      topo_info->threads_per_core = ms->smp.threads;
>>>>  }
>>>>  
>>>> +/*
>>>> + * Check for APIC ID encoding
>>>> + *
>>>> + * AMD uses different apic id encoding for their EPYC based cpus.
>>>> + * Check if we need to use different handlers than the default.  
>>> comment is not valid, cpu_x86_use_epyc_apic_id_encoding() does the checking
>>> but this function actually overrides it.
>>>
>>> it would be better to name it properly and amend comment, something like
>>>
>>> if (cpu_x86_use_epyc_apic_id_encoding(machine->cpu_type)) {
>>>    set_epyc_topo_handlers()
>>> }  
>>
>> Ok. Will fix it. I will move the assignment to new function
>> set_epyc_topo_handlers() and fix the comment.
>>
>>>   
>>>> + */
>>>> +static void x86_check_apic_id_encoding(MachineState *machine)
>>>> +{
>>>> +    X86MachineState *x86ms = X86_MACHINE(machine);
>>>> +
>>>> +    if (cpu_x86_use_epyc_apic_id_encoding(machine->cpu_type)) {
>>>> +        x86ms->apicid_from_cpu_idx = x86_apicid_from_cpu_idx_epyc;
>>>> +        x86ms->topo_ids_from_apicid = x86_topo_ids_from_apicid_epyc;
>>>> +        x86ms->topo_ids_from_idx = x86_topo_ids_from_idx_epyc;
>>>> +        x86ms->apicid_from_topo_ids = x86_apicid_from_topo_ids_epyc;
>>>> +        x86ms->apicid_pkg_offset = apicid_pkg_offset_epyc;
>>>> +    }
>>>> +}
>>>> +
>>>>  /*
>>>>   * Calculates initial APIC ID for a specific CPU index
>>>>   *
>>>> @@ -86,7 +105,7 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
>>>>  
>>>>      init_topo_info(&topo_info, x86ms);
>>>>  
>>>> -    correct_id = x86_apicid_from_cpu_idx(&topo_info, cpu_index);
>>>> +    correct_id = x86ms->apicid_from_cpu_idx(&topo_info, cpu_index);
>>>>      if (x86mc->compat_apic_id_mode) {
>>>>          if (cpu_index != correct_id && !warned && !qtest_enabled()) {
>>>>              error_report("APIC IDs set in compatibility mode, "
>>>> @@ -158,8 +177,8 @@ int64_t x86_get_default_cpu_node_id(const MachineState *ms, int idx)
>>>>     init_topo_info(&topo_info, x86ms);
>>>>  
>>>>     assert(idx < ms->possible_cpus->len);
>>>> -   x86_topo_ids_from_apicid(ms->possible_cpus->cpus[idx].arch_id,
>>>> -                            &topo_info, &topo_ids);
>>>> +   x86ms->topo_ids_from_apicid(ms->possible_cpus->cpus[idx].arch_id,
>>>> +                               &topo_info, &topo_ids);
>>>>     return topo_ids.pkg_id % ms->numa_state->num_nodes;
>>>>  }
>>>>  
>>>> @@ -179,6 +198,9 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
>>>>          return ms->possible_cpus;
>>>>      }
>>>>  
>>>> +    /* Check for apicid encoding */
>>>> +    x86_check_apic_id_encoding(ms);  
>>>
>>> that might crash if user used legacy -numa node,cpus= option
>>> option parser would call reach here before machine->cpu_type is set
>>>
>>> it's better to put this call into x86_cpus_init() like it was done
>>> in previous versions  
>>
>> I have tested with legacy -numa option. It works fine. I can remove this
>> call from here but I need to call the function x86_topo_ids_from_apicid(or
>> x86_topo_ids_from_idx) directly. I cannot use the callback here(because
>> x86_cpus_init has not happened at this point). Is that fine?
> That's fine.
ok. thanks

> x86_topo_ids_from_idx() is the only one that could work correctly early,
> since x86_topo_ids_from_idx_epyc() depends on all numa nodes being already parsed.
> 
> which rises a question do we really need topo_ids_from_idx() callback and x86_topo_ids_from_idx_epyc()?
> I don't see why it's necessary.

yes. We don't need topo_ids_from_idx callback anymore. I will remove it.


> 
>>
>>>   
>>>>      ms->possible_cpus = g_malloc0(sizeof(CPUArchIdList) +
>>>>                                    sizeof(CPUArchId) * max_cpus);
>>>>      ms->possible_cpus->len = max_cpus;
>>>> @@ -192,8 +214,8 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
>>>>          ms->possible_cpus->cpus[i].vcpus_count = 1;
>>>>          ms->possible_cpus->cpus[i].arch_id =
>>>>              x86_cpu_apic_id_from_index(x86ms, i);
>>>> -        x86_topo_ids_from_apicid(ms->possible_cpus->cpus[i].arch_id,
>>>> -                                 &topo_info, &topo_ids);
>>>> +        x86ms->topo_ids_from_apicid(ms->possible_cpus->cpus[i].arch_id,
>>>> +                                    &topo_info, &topo_ids);
>>>>          ms->possible_cpus->cpus[i].props.has_socket_id = true;
>>>>          ms->possible_cpus->cpus[i].props.socket_id = topo_ids.pkg_id;
>>>>          if (x86ms->smp_dies > 1) {
>>>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>>>> index a3051524a2..19de79d01c 100644
>>>> --- a/target/i386/cpu.c
>>>> +++ b/target/i386/cpu.c
>>>> @@ -1615,6 +1615,10 @@ typedef struct X86CPUDefinition {
>>>>      FeatureWordArray features;
>>>>      const char *model_id;
>>>>      CPUCaches *cache_info;
>>>> +
>>>> +    /* Use AMD EPYC encoding for apic id */
>>>> +    bool use_epyc_apic_id_encoding;
>>>> +
>>>>      /*
>>>>       * Definitions for alternative versions of CPU model.
>>>>       * List is terminated by item with version == 0.
>>>> @@ -1656,6 +1660,13 @@ static const X86CPUVersionDefinition *x86_cpu_def_get_versions(X86CPUDefinition
>>>>      return def->versions ?: default_version_list;
>>>>  }
>>>>  
>>>> +bool cpu_x86_use_epyc_apic_id_encoding(const char *cpu_type)
>>>> +{
>>>> +    X86CPUClass *xcc = X86_CPU_CLASS(object_class_by_name(cpu_type));  
>>>
>>> assert(xcc)  
>>
>> will add and I need to check for cpudef also.
>>
>>>   
>>>> +
>>>> +    return xcc->model->cpudef->use_epyc_apic_id_encoding;
>>>> +}
>>>> +
>>>>  static CPUCaches epyc_cache_info = {
>>>>      .l1d_cache = &(CPUCacheInfo) {
>>>>          .type = DATA_CACHE,
>>>> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>>>> index 7e9e963d78..6e522fcd34 100644
>>>> --- a/target/i386/cpu.h
>>>> +++ b/target/i386/cpu.h
>>>> @@ -1897,6 +1897,7 @@ void cpu_clear_apic_feature(CPUX86State *env);
>>>>  void host_cpuid(uint32_t function, uint32_t count,
>>>>                  uint32_t *eax, uint32_t *ebx, uint32_t *ecx, uint32_t *edx);
>>>>  void host_vendor_fms(char *vendor, int *family, int *model, int *stepping);
>>>> +bool cpu_x86_use_epyc_apic_id_encoding(const char *cpu_type);
>>>>  
>>>>  /* helper.c */
>>>>  bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>>>  
>>>   
>>
> 

