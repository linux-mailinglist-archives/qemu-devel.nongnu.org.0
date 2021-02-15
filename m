Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3029F31B784
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:46:11 +0100 (CET)
Received: from localhost ([::1]:37874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbOM-0003nf-8m
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:46:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lBbLK-0001wd-UR
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:43:03 -0500
Received: from mx2.suse.de ([195.135.220.15]:41244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lBbLJ-00062c-1D
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:43:02 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4CBC6AD29;
 Mon, 15 Feb 2021 10:42:59 +0000 (UTC)
Subject: Re: [RFC PATCH 6/6] softmmu: Restrict watchpoint handlers to TCG
 accelerator
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-7-f4bug@amsat.org>
 <56d3c4ca-8963-b1c3-8635-58f20fcb8e37@suse.de>
 <40633db0-62ac-4a17-cc20-0cab61bb5df6@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <e4defdd6-a9f9-94bd-1139-a5c6b949b2e4@suse.de>
Date: Mon, 15 Feb 2021 11:42:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <40633db0-62ac-4a17-cc20-0cab61bb5df6@amsat.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 10:36 AM, Philippe Mathieu-Daudé wrote:
> On 1/18/21 10:10 AM, Claudio Fontana wrote:
>> On 1/17/21 5:48 PM, Philippe Mathieu-Daudé wrote:
>>> Watchpoint funtions use cpu_restore_state() which is only
>>> available when TCG accelerator is built. Restrict them
>>> to TCG.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> I am doing some of this in my series, and I did not notice that
>> cpu_watchpoint_insert was also TCG only.
>>
>> Probably we should merge this somehow.
>>
>> I thought it was used by gdbstub.c as well, passing flags BP_GDB .
> 
> BP_MEM_ACCESS for watchpoint.
> 
>> I noticed that gdbstub does something else entirely for kvm_enabled(), ie, kvm_insert_breakpoint,
>> but what about the other accels, it seems that the code flows to the cpu_breakpoint_insert and watchpoint_insert..?
>>
>> should cpu_breakpoint_insert have the same fate then?
>>
>> And is this really all TCG specific?
>>
>> From gdbstub.c:1020:
>>
>> static int gdb_breakpoint_insert(int type, target_ulong addr, target_ulong len)
>> {
>>     CPUState *cpu;
>>     int err = 0;
>>
>>     if (kvm_enabled()) {
>>         return kvm_insert_breakpoint(gdbserver_state.c_cpu, addr, len, type);
> 
> Doh I missed that. I remember Peter and Richard explained it once
> but I forgot and couldn't find on the list, maybe it was on IRC.
> 
> See i.e. in target/arm/kvm64.c:
> 
>  312 int kvm_arch_insert_hw_breakpoint(target_ulong addr,
>  313                                   target_ulong len, int type)
>  314 {
>  315     switch (type) {
>  316     case GDB_BREAKPOINT_HW:
>  317         return insert_hw_breakpoint(addr);
>  318         break;
>  319     case GDB_WATCHPOINT_READ:
>  320     case GDB_WATCHPOINT_WRITE:
>  321     case GDB_WATCHPOINT_ACCESS:
>  322         return insert_hw_watchpoint(addr, len, type);
>  323     default:
>  324         return -ENOSYS;
>  325     }
>  326 }
> 
>>
>>> ---
>>> RFC because we could keep that code by adding an empty
>>>     stub for cpu_restore_state(), but it is unclear as
>>>     the function is named generically.
>>> ---
>>>  include/hw/core/cpu.h | 4 ++--
>>>  softmmu/physmem.c     | 4 ++++
>>>  2 files changed, 6 insertions(+), 2 deletions(-)
> 

Hello Philippe,

I have reached this issue again when working on the ARM part of the cleanup,
did we reach a conclusion on whether cpu_watchpoint_insert is TCG-specific or not,

and more in general about breakpoints and watchpoints?

The way I encountered this issue now is during the KVM/TCG split in target/arm.

there are calls in target/arm/cpu.c and machine.c of the kind:

hw_breakpoint_update_all()
hw_watchpoint_update_all()

is this all TCG-specific,

including also hw_watchpoint_update(), hw_breakpoint_update() ?

kvm64.c seems to have its own handling of breakpoints, including arrays:

GArray *hw_breakpoints, *hw_watchpoints;

while the TCG stuff relies on cpu->watchpoints in softmmu/physmem.c:

$ gid watchpoints
include/hw/core/cpu.h:139: * address before attempting to match it against watchpoints.
include/hw/core/cpu.h:388:    QTAILQ_HEAD(, CPUWatchpoint) watchpoints;
linux-user/main.c:210:    /* Clone all break/watchpoints.
linux-user/main.c:212:       BP_CPU break/watchpoints are handled correctly on clone. */
linux-user/main.c:214:    QTAILQ_INIT(&new_cpu->watchpoints);
linux-user/main.c:218:    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
softmmu/physmem.c:791:    /* keep all GDB-injected watchpoints in front */
softmmu/physmem.c:793:        QTAILQ_INSERT_HEAD(&cpu->watchpoints, wp, entry);
softmmu/physmem.c:795:        QTAILQ_INSERT_TAIL(&cpu->watchpoints, wp, entry);
softmmu/physmem.c:816:    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
softmmu/physmem.c:829:    QTAILQ_REMOVE(&cpu->watchpoints, watchpoint, entry);
softmmu/physmem.c:836:/* Remove all matching watchpoints.  */
softmmu/physmem.c:841:    QTAILQ_FOREACH_SAFE(wp, &cpu->watchpoints, entry, next) {
softmmu/physmem.c:868:/* Return flags for watchpoints that match addr + prot.  */
softmmu/physmem.c:874:    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
softmmu/physmem.c:906:    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
softmmu/physmem.c:911:                 * Don't process the watchpoints when we are
accel/tcg/cpu-exec.c:511:        QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
accel/tcg/cpu-exec.c:822:               after-access watchpoints.  Since this request should never
hw/core/cpu.c:361:    QTAILQ_INIT(&cpu->watchpoints);


Even in i386 there is a bit of confusion still, and I think sorting out this could improve the code on i386 as well..

Thanks for any comment,

Ciao,

CLaudio









