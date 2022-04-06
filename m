Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2885C4F627B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 17:01:52 +0200 (CEST)
Received: from localhost ([::1]:56332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc7AN-0005o6-6u
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 11:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xueshuai@linux.alibaba.com>)
 id 1nc6lN-00053S-18
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 10:36:01 -0400
Received: from out199-18.us.a.mail.aliyun.com ([47.90.199.18]:32043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xueshuai@linux.alibaba.com>)
 id 1nc6lF-0004pD-74
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 10:35:55 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=xueshuai@linux.alibaba.com;
 NM=1; PH=DS; RN=1; SR=0; TI=SMTPD_---0V9MKsRy_1649255427; 
Received: from 30.240.121.50(mailfrom:xueshuai@linux.alibaba.com
 fp:SMTPD_---0V9MKsRy_1649255427) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 06 Apr 2022 22:30:29 +0800
Message-ID: <3dc5add1-1353-584b-b655-a9546743df1c@linux.alibaba.com>
Date: Wed, 6 Apr 2022 22:30:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
To: qemu-devel@nongnu.org
Content-Language: en-US
From: Shuai Xue <xueshuai@linux.alibaba.com>
Subject: [BUG]QEMU jump into interrupt when single-stepping on aarch64
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=47.90.199.18;
 envelope-from=xueshuai@linux.alibaba.com; helo=out199-18.us.a.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 06 Apr 2022 10:54:29 -0400
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

Dear, folks,

I try to debug Linux kernel with QEMU in single-stepping mode on aarch64 platform,
the added breakpoint hits but after I type `step`, the gdb always jumps into interrupt.

My env:

	gdb-10.2
	qemu-6.2.0
	host kernel: 5.10.84
	VM kernel: 5.10.84

The steps to reproduce:
	# host console: run a VM with only one core, the import arg: <qemu:arg value='-s'/>
	# details can be found here: https://www.redhat.com/en/blog/debugging-kernel-qemulibvirt
	virsh create dev_core0.xml
	
	# run gdb client
	gdb ./vmlinux

	# gdb client on host console
	(gdb) dir ./usr/src/debug/kernel-5.10.84/linux-5.10.84-004.alpha.ali5000.alios7.aarch64
	(gdb) target remote localhost:1234
	(gdb) info b
	Num     Type           Disp Enb Address            What
	1       breakpoint     keep y   <MULTIPLE>
	1.1                         y   0xffff800010361444 mm/memory-failure.c:1318
	1.2                         y   0xffff800010361450 in memory_failure
                                                   at mm/memory-failure.c:1488
	(gdb) c
	Continuing.

	# console in VM, use madvise to inject a hwposion at virtual address vaddr,
	# which will hit the b inmemory_failur: madvise(vaddr, pagesize, MADV_HWPOISON);
	# and the VM pause
	./run_madvise.c

	# gdb client on host console
	(gdb)
	Continuing.
	Breakpoint 1, 0xffff800010361444 in memory_failure () at mm/memory-failure.c:1318
	1318                    res = -EHWPOISON;
	(gdb) n
	vectors () at arch/arm64/kernel/entry.S:552
	552             kernel_ventry   1, irq                          // IRQ EL1h
	(gdb) n
	(gdb) n
	(gdb) n
	(gdb) n
	gic_handle_irq (regs=0xffff8000147c3b80) at drivers/irqchip/irq-gic-v3.c:721
	# after several step, I got the irqnr
	(gdb) p irqnr
	$5 = 8262

Sometimes, the irqnr is 27， which is used for arch_timer.

I was wondering do you have any comments on this? And feedback are welcomed.

Thank you.

Best Regards.
Shuai
	
	

