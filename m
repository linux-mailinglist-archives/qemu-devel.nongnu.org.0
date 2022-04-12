Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B814FE140
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 14:56:03 +0200 (CEST)
Received: from localhost ([::1]:58786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neG3u-0006ac-AL
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 08:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xueshuai@linux.alibaba.com>)
 id 1neG1A-0005i5-Sd
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:53:12 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:49155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xueshuai@linux.alibaba.com>)
 id 1neG10-0001bB-QK
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:53:05 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R611e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=xueshuai@linux.alibaba.com;
 NM=1; PH=DS; RN=2; SR=0; TI=SMTPD_---0V9uw5OK_1649766744; 
Received: from 30.240.121.177(mailfrom:xueshuai@linux.alibaba.com
 fp:SMTPD_---0V9uw5OK_1649766744) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 12 Apr 2022 20:32:24 +0800
Message-ID: <84e0c8eb-a857-2a9c-917e-9c0583e7dd45@linux.alibaba.com>
Date: Tue, 12 Apr 2022 20:32:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [BUG]QEMU jump into interrupt when single-stepping on aarch64
Content-Language: en-US
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <3dc5add1-1353-584b-b655-a9546743df1c@linux.alibaba.com>
 <0fe68d69-1b9c-2bac-4fd4-5e31e84eaac2@linaro.org>
 <3036a482-33f5-c283-9ca2-93de1a4f2165@linux.alibaba.com>
In-Reply-To: <3036a482-33f5-c283-9ca2-93de1a4f2165@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.133;
 envelope-from=xueshuai@linux.alibaba.com;
 helo=out30-133.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

在 2022/4/7 PM12:10, Shuai Xue 写道:
> 在 2022/4/7 AM12:57, Richard Henderson 写道:
>> On 4/6/22 09:30, Shuai Xue wrote:
>>> Dear, folks,
>>>
>>> I try to debug Linux kernel with QEMU in single-stepping mode on aarch64 platform,
>>> the added breakpoint hits but after I type `step`, the gdb always jumps into interrupt.
>>>
>>> My env:
>>>
>>>     gdb-10.2
>>>     qemu-6.2.0
>>>     host kernel: 5.10.84
>>>     VM kernel: 5.10.84
>>>
>>> The steps to reproduce:
>>>     # host console: run a VM with only one core, the import arg: <qemu:arg value='-s'/>
>>>     # details can be found here: https://www.redhat.com/en/blog/debugging-kernel-qemulibvirt
>>>     virsh create dev_core0.xml
>>>     
>>>     # run gdb client
>>>     gdb ./vmlinux
>>>
>>>     # gdb client on host console
>>>     (gdb) dir ./usr/src/debug/kernel-5.10.84/linux-5.10.84-004.alpha.ali5000.alios7.aarch64
>>>     (gdb) target remote localhost:1234
>>>     (gdb) info b
>>>     Num     Type           Disp Enb Address            What
>>>     1       breakpoint     keep y   <MULTIPLE>
>>>     1.1                         y   0xffff800010361444 mm/memory-failure.c:1318
>>>     1.2                         y   0xffff800010361450 in memory_failure
>>>                                                     at mm/memory-failure.c:1488
>>>     (gdb) c
>>>     Continuing.
>>>
>>>     # console in VM, use madvise to inject a hwposion at virtual address vaddr,
>>>     # which will hit the b inmemory_failur: madvise(vaddr, pagesize, MADV_HWPOISON);
>>>     # and the VM pause
>>>     ./run_madvise.c
>>>
>>>     # gdb client on host console
>>>     (gdb)
>>>     Continuing.
>>>     Breakpoint 1, 0xffff800010361444 in memory_failure () at mm/memory-failure.c:1318
>>>     1318                    res = -EHWPOISON;
>>>     (gdb) n
>>>     vectors () at arch/arm64/kernel/entry.S:552
>>>     552             kernel_ventry   1, irq                          // IRQ EL1h
>>
>> The 'n' command is not a single-step: use stepi, which will suppress interrupts.
>> Anyway, not a bug.
>>
>> r~
> 
> Hi, Richard,
> 
> Thank you for your quick reply, I also try `stepi`, but it does NOT work either.
> 
> 	(gdb) c
> 	Continuing.
> 
> 	Breakpoint 1, memory_failure (pfn=1273982, flags=1) at mm/memory-failure.c:1488
> 	1488    {
> 	(gdb) stepi
> 	vectors () at arch/arm64/kernel/entry.S:552
> 	552             kernel_ventry   1, irq                          // IRQ EL1h
> 
> According to QEMU doc[1]: the default single stepping behavior is step with the IRQs
> and timer service routines off. I checked the MASK bits used to control the single
> stepping IE on my machine as bellow:
> 
> 	# gdb client on host (x86 plafrom)
> 	(gdb) maintenance packet qqemu.sstepbits
> 	sending: "qqemu.sstepbits"
> 	received: "ENABLE=1,NOIRQ=2,NOTIMER=4"
> 
> The sstep MASK looks as expected, but does not work as expected.
> 
> I also try the same kernel and qemu version on X86 platform:
>>>     gdb-10.2
>>>     qemu-6.2.0
>>>     host kernel: 5.10.84
>>>     VM kernel: 5.10.84
> 
> 
> The command `n` jumps to the next instruction.
> 
> 	# gdb client on host (x86 plafrom)
> 	(gdb) b memory-failure.c:1488
> 	Breakpoint 1, memory_failure (pfn=1128931, flags=1) at mm/memory-failure.c:1488
> 	1488    {
> 	(gdb) n
> 	1497            if (!sysctl_memory_failure_recovery)
> 	(gdb) stepi
> 	0xffffffff812efdbc      1497            if (!sysctl_memory_failure_recovery)
> 	(gdb) stepi
> 	0xffffffff812efdbe      1497            if (!sysctl_memory_failure_recovery)
> 	(gdb) n
> 	1500            p = pfn_to_online_page(pfn);
> 	(gdb) l
> 	1496
> 	1497            if (!sysctl_memory_failure_recovery)
> 	1498                    panic("Memory failure on page %lx", pfn);
> 	1499
> 	1500            p = pfn_to_online_page(pfn);
> 	1501            if (!p) {
> 
> Best Regrades,
> Shuai
> 
> 
> [1] https://github.com/qemu/qemu/blob/master/docs/system/gdb.rst

Hi, Richard,

I was wondering that do you have any comments to this?

Best Regrades,
Shuai

