Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A3933AF32
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:47:11 +0100 (CET)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjoc-0004IC-5h
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lLjmT-0003K5-6h
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:44:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:46836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lLjmR-0008Tg-0a
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:44:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A1CFFAF0B;
 Mon, 15 Mar 2021 09:44:51 +0000 (UTC)
Subject: Re: [PATCH v16 00/23] i386 cleanup PART 2
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210204163931.7358-1-cfontana@suse.de>
 <5f185a27-6140-9426-f915-ce09609b7962@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <a8dd803b-ff0a-c456-14b5-1e2dffbf2120@suse.de>
Date: Mon, 15 Mar 2021 10:44:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5f185a27-6140-9426-f915-ce09609b7962@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Alistair Francis <alistair.francis@wdc.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 3/14/21 1:00 AM, Philippe Mathieu-Daudé wrote:
> Hi Claudio,
> 
> On 2/4/21 5:39 PM, Claudio Fontana wrote:
>> v15 -> v16:
>>
>> * cpu: Move synchronize_from_tb() to tcg_ops:
>>   - adjusted comments (Alex)
>>
>> * cpu: tcg_ops: move to tcg-cpu-ops.h, keep a pointer in CPUClass:
>>   - remove forward decl. of AccelCPUClass, should be in a later patch. (Alex)
>>   - simplified comment about tcg_ops in struct CPUClass (Alex)
>>   - remove obsolete comment about ARM blocking TCGCPUOps from being const.
>>     (Alex)
>>
>> * accel: replace struct CpusAccel with AccelOpsClass:
>>   - reworded commit message to be clearer about the objective (Alex)
>>
>> * accel: introduce AccelCPUClass extending CPUClass
>>   - reworded commit message to be clearer about the objective (Alex)
>>
>> * hw/core/cpu: call qemu_init_vcpu in cpu_common_realizefn:
>>   - dropped this patch (Alex, Philippe)
>>
>>   will try again later, also in the context of:
>>   https://www.mail-archive.com/qemu-devel@nongnu.org/msg686480.html
>>
>> * accel: introduce new accessor functions
>>   - squashed comments in previous patch introducing accel-cpu.h. (Philippe)
>>
>> * accel-cpu: make cpu_realizefn return a bool
>>   - split in two patches, separating the change to the phys_bits check
>>     (Philippe)
> 
> I am looking at this code:
> 
> $ git grep tcg_ softmmu/physmem.c
> softmmu/physmem.c:153:static void
> tcg_log_global_after_sync(MemoryListener *listener);
> softmmu/physmem.c:154:static void tcg_commit(MemoryListener *listener);
> softmmu/physmem.c:161: * @tcg_as_listener: listener for tracking changes
> to the AddressSpace
> softmmu/physmem.c:167:    MemoryListener tcg_as_listener;
> softmmu/physmem.c:590:static void tcg_iommu_unmap_notify(IOMMUNotifier
> *n, IOMMUTLBEntry *iotlb)
> softmmu/physmem.c:606:static void tcg_register_iommu_notifier(CPUState *cpu,
> softmmu/physmem.c:640:                            tcg_iommu_unmap_notify,
> softmmu/physmem.c:654:void tcg_iommu_free_notifier_list(CPUState *cpu)
> softmmu/physmem.c:668:void tcg_iommu_init_notifier_list(CPUState *cpu)
> softmmu/physmem.c:698:        tcg_register_iommu_notifier(cpu, iommu_mr,
> iommu_idx);
> softmmu/physmem.c:761:    if (tcg_enabled()) {
> softmmu/physmem.c:762:
> newas->tcg_as_listener.log_global_after_sync = tcg_log_global_after_sync;
> softmmu/physmem.c:763:        newas->tcg_as_listener.commit = tcg_commit;
> softmmu/physmem.c:764:
> memory_listener_register(&newas->tcg_as_listener, as);
> softmmu/physmem.c:891:    assert(tcg_enabled());
> softmmu/physmem.c:904:    if (cc->tcg_ops->adjust_watchpoint_address) {
> softmmu/physmem.c:906:        addr =
> cc->tcg_ops->adjust_watchpoint_address(cpu, addr, len);
> softmmu/physmem.c:927:                if (wp->flags & BP_CPU &&
> cc->tcg_ops->debug_check_watchpoint &&
> softmmu/physmem.c:928:
> !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
> softmmu/physmem.c:1004:    assert(tcg_enabled());
> softmmu/physmem.c:1059:    if (dirty && tcg_enabled()) {
> softmmu/physmem.c:1107:    if (tcg_enabled()) {
> softmmu/physmem.c:2605:static void
> tcg_log_global_after_sync(MemoryListener *listener)
> softmmu/physmem.c:2634:        cpuas = container_of(listener,
> CPUAddressSpace, tcg_as_listener);
> softmmu/physmem.c:2639:static void tcg_commit(MemoryListener *listener)
> softmmu/physmem.c:2644:    assert(tcg_enabled());
> softmmu/physmem.c:2647:    cpuas = container_of(listener,
> CPUAddressSpace, tcg_as_listener);
> softmmu/physmem.c:2700:        assert(tcg_enabled());
> softmmu/physmem.c:3000:    if (tcg_enabled()) {
> 
> which reminded me the starter generic part of your effort
> (already merged).
> 
> Do you have plans for this code?
> 
> Similarly:
> 
> $ git grep kvm_ softmmu/physmem.c
> softmmu/physmem.c:752:    assert(asidx == 0 || !kvm_enabled());
> softmmu/physmem.c:1295:    if (kvm_enabled())
> softmmu/physmem.c:1296:        kvm_flush_coalesced_mmio_buffer();
> softmmu/physmem.c:1566:    if (kvm_enabled()) {
> softmmu/physmem.c:2046:    if (kvm_enabled() && !kvm_has_sync_mmu()) {
> 
> Thanks,
> 
> Phil.
> 

Hi Phil,

indeed it is a juicy target for splitting things between TCG-only and non-TCG code,
specifically as we discovered that we don't need any of the watchpoint stuff outside of TCG.

I think I am tied up in the ARM code for a while,
so if you are asking because you want to start there, just go ahead,
I'll try to review, otherwise I'll get back to it (and to i386) later on.

Ciao,

Claudio


