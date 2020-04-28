Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1D01BB427
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 04:48:39 +0200 (CEST)
Received: from localhost ([::1]:39982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTGIY-0007sq-72
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 22:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43678)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <colin.xu@intel.com>) id 1jTGH7-0006Qa-Iq
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 22:47:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <colin.xu@intel.com>) id 1jTGH6-0002YA-IK
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 22:47:09 -0400
Received: from mga01.intel.com ([192.55.52.88]:37145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <colin.xu@intel.com>)
 id 1jTGH5-0002XH-VM
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 22:47:08 -0400
IronPort-SDR: f8koptirKTZlN29KvWVJYtgkm9/H9S5fyY5/WmSM9bsIQfXtcBbSmHlHLl7mv0a5Y4cfP/aQBI
 FQS4jPaJaLKQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 19:47:06 -0700
IronPort-SDR: KIiMdq11fqcrSkuC/lF1jPNyE0gKIZ+Ls0CmGqNz0ZRgVbnfTORlqo+kbI0tTQuGvugnQmkQUy
 jP7VNhTuOEFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,326,1583222400"; d="scan'208";a="257476983"
Received: from unknown (HELO coxu-arch-shz) ([10.239.160.120])
 by orsmga003.jf.intel.com with ESMTP; 27 Apr 2020 19:47:04 -0700
Date: Tue, 28 Apr 2020 10:47:03 +0800 (CST)
From: Colin Xu <colin.xu@intel.com>
X-X-Sender: coxu_arch@coxu-arch-shz
To: Colin Xu <colin.xu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] hax: Dynamic allocate vcpu state structure
In-Reply-To: <alpine.LNX.2.22.419.2004201131070.21524@coxu-arch-shz>
Message-ID: <alpine.LNX.2.22.419.2004281046360.5289@coxu-arch-shz>
References: <20200406070642.3005-1-bowen.wang@intel.com>
 <alpine.LNX.2.22.419.2004201131070.21524@coxu-arch-shz>
User-Agent: Alpine 2.22 (LNX 419 2020-04-12)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=192.55.52.88; envelope-from=colin.xu@intel.com;
 helo=mga01.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/27 21:04:21
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 192.55.52.88
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
Cc: WangBowen <bowen.wang@intel.com>, qemu-devel@nongnu.org,
 wenchao.wang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


And this one. 3 patches for HAX.

Thanks in advance.
--
Best Regards,
Colin Xu

On Mon, 20 Apr 2020, Colin Xu wrote:

>
> Looks good to me.
>
> Reviewed-by: Colin Xu <colin.xu@intel.com>
>
> --
> Best Regards,
> Colin Xu
>
> On Mon, 6 Apr 2020, WangBowen wrote:
>
>> Dynamic allocating vcpu state structure according to smp value to be
>> more precise and safe. Previously it will alloccate array of fixed size
>> HAX_MAX_VCPU.
>> 
>> This is achieved by using g_new0 to dynamic allocate the array. The
>> allocated size is obtained from smp.max_cpus in MachineState. Also, the
>> size is compared with HAX_MAX_VCPU when creating the vm. The reason for
>> choosing dynamic array over linked list is because the status is visited
>> by index all the time.
>> 
>> This will lead to QEMU checking whether the smp value is larger than the
>> HAX_MAX_VCPU when creating vm, if larger, the process will terminate,
>> otherwise it will allocate array of size smp to store the status.
>> 
>> Signed-off-by: WangBowen <bowen.wang@intel.com>
>> ---
>> target/i386/hax-all.c  | 25 +++++++++++++++++++------
>> target/i386/hax-i386.h |  5 +++--
>> 2 files changed, 22 insertions(+), 8 deletions(-)
>> 
>> diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
>> index a8b6e5aeb8..a22adec5da 100644
>> --- a/target/i386/hax-all.c
>> +++ b/target/i386/hax-all.c
>> @@ -232,10 +232,10 @@ int hax_init_vcpu(CPUState *cpu)
>>     return ret;
>> }
>> 
>> -struct hax_vm *hax_vm_create(struct hax_state *hax)
>> +struct hax_vm *hax_vm_create(struct hax_state *hax, int max_cpus)
>> {
>>     struct hax_vm *vm;
>> -    int vm_id = 0, ret;
>> +    int vm_id = 0, ret, i;
>>
>>     if (hax_invalid_fd(hax->fd)) {
>>         return NULL;
>> @@ -259,6 +259,17 @@ struct hax_vm *hax_vm_create(struct hax_state *hax)
>>         goto error;
>>     }
>> 
>> +    if (max_cpus > HAX_MAX_VCPU) {
>> +        fprintf(stderr, "Maximum VCPU number QEMU supported is %d\n", 
>> HAX_MAX_VCPU);
>> +        goto error;
>> +    }
>> +
>> +    vm->numvcpus = max_cpus;
>> +    vm->vcpus = g_new0(struct hax_vcpu_state *, vm->numvcpus);
>> +    for (i = 0; i < vm->numvcpus; i++) {
>> +        vm->vcpus[i] = NULL;
>> +    }
>> +
>>     hax->vm = vm;
>>     return vm;
>> 
>> @@ -272,12 +283,14 @@ int hax_vm_destroy(struct hax_vm *vm)
>> {
>>     int i;
>> 
>> -    for (i = 0; i < HAX_MAX_VCPU; i++)
>> +    for (i = 0; i < vm->numvcpus; i++)
>>         if (vm->vcpus[i]) {
>>             fprintf(stderr, "VCPU should be cleaned before vm clean\n");
>>             return -1;
>>         }
>>     hax_close_fd(vm->fd);
>> +    vm->numvcpus = 0;
>> +    g_free(vm->vcpus);
>>     g_free(vm);
>>     hax_global.vm = NULL;
>>     return 0;
>> @@ -292,7 +305,7 @@ static void hax_handle_interrupt(CPUState *cpu, int 
>> mask)
>>     }
>> }
>> 
>> -static int hax_init(ram_addr_t ram_size)
>> +static int hax_init(ram_addr_t ram_size, int max_cpus)
>> {
>>     struct hax_state *hax = NULL;
>>     struct hax_qemu_version qversion;
>> @@ -324,7 +337,7 @@ static int hax_init(ram_addr_t ram_size)
>>         goto error;
>>     }
>> 
>> -    hax->vm = hax_vm_create(hax);
>> +    hax->vm = hax_vm_create(hax, max_cpus);
>>     if (!hax->vm) {
>>         fprintf(stderr, "Failed to create HAX VM\n");
>>         ret = -EINVAL;
>> @@ -352,7 +365,7 @@ static int hax_init(ram_addr_t ram_size)
>> 
>> static int hax_accel_init(MachineState *ms)
>> {
>> -    int ret = hax_init(ms->ram_size);
>> +    int ret = hax_init(ms->ram_size, (int)ms->smp.max_cpus);
>>
>>     if (ret && (ret != -ENOSPC)) {
>>         fprintf(stderr, "No accelerator found.\n");
>> diff --git a/target/i386/hax-i386.h b/target/i386/hax-i386.h
>> index 54e9d8b057..7d988f81da 100644
>> --- a/target/i386/hax-i386.h
>> +++ b/target/i386/hax-i386.h
>> @@ -47,7 +47,8 @@ struct hax_state {
>> struct hax_vm {
>>     hax_fd fd;
>>     int id;
>> -    struct hax_vcpu_state *vcpus[HAX_MAX_VCPU];
>> +    int numvcpus;
>> +    struct hax_vcpu_state **vcpus;
>> };
>> 
>> #ifdef NEED_CPU_H
>> @@ -58,7 +59,7 @@ int valid_hax_tunnel_size(uint16_t size);
>> /* Host specific functions */
>> int hax_mod_version(struct hax_state *hax, struct hax_module_version 
>> *version);
>> int hax_inject_interrupt(CPUArchState *env, int vector);
>> -struct hax_vm *hax_vm_create(struct hax_state *hax);
>> +struct hax_vm *hax_vm_create(struct hax_state *hax, int max_cpus);
>> int hax_vcpu_run(struct hax_vcpu_state *vcpu);
>> int hax_vcpu_create(int id);
>> int hax_sync_vcpu_state(CPUArchState *env, struct vcpu_state_t *state,
>> -- 
>> 2.24.1
>> 
>> 
>

