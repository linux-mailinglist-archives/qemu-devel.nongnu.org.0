Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6B2474630
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 16:18:06 +0100 (CET)
Received: from localhost ([::1]:52432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9Z6-0008Qw-RR
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 10:18:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mx9Y1-0006sM-Ek
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:16:57 -0500
Received: from mail.xen0n.name ([115.28.160.31]:52714
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mx9Xx-0003Wm-55
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 10:16:57 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 2C8A5600B0;
 Tue, 14 Dec 2021 23:16:46 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1639495006; bh=04uMh18bN33dgWVKLHrWeljfLYjtYAdBNxYVmoSY+Ro=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cmwgAucmjPsBg1XpyFeuAGSLG3W8nrO9vZz22G6bk87ORSAqPVe6ZukFf5353H40S
 ihtL2qreRo85Q1xQYKJxLxGjVB42yRwVQO5e2fKKkI8E92TAGnQbpb/Vkkp+LvrEB9
 d5LEpVhtnecOndYPx9S2lu8f2IDbkcWQ45FzWs8k=
Message-ID: <c2fc44e2-3551-35e9-6cd7-39290a7b71b7@xen0n.name>
Date: Tue, 14 Dec 2021 23:16:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
Subject: Re: [PATCH v9 28/31] common-user: Add safe syscall handling for
 loongarch64 hosts
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211214080154.196350-1-git@xen0n.name>
 <20211214080154.196350-29-git@xen0n.name>
 <f6218922-c386-e1bf-e1d7-9766aa4d675a@amsat.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <f6218922-c386-e1bf-e1d7-9766aa4d675a@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.962,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 12/14/21 21:29, Philippe Mathieu-Daudé wrote:
> On 12/14/21 09:01, WANG Xuerui wrote:
>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   .../host/loongarch64/safe-syscall.inc.S       | 81 +++++++++++++++++++
>>   1 file changed, 81 insertions(+)
>>   create mode 100644 common-user/host/loongarch64/safe-syscall.inc.S
>>
>> diff --git a/common-user/host/loongarch64/safe-syscall.inc.S b/common-user/host/loongarch64/safe-syscall.inc.S
>> new file mode 100644
>> index 0000000000..61dc6554eb
>> --- /dev/null
>> +++ b/common-user/host/loongarch64/safe-syscall.inc.S
>> @@ -0,0 +1,81 @@
>> +/*
>> + * safe-syscall.inc.S : host-specific assembly fragment
>> + * to handle signals occurring at the same time as system calls.
>> + * This is intended to be included by common-user/safe-syscall.S
>> + *
>> + * Ported to LoongArch by WANG Xuerui <git@xen0n.name>
>> + *
>> + * Based on safe-syscall.inc.S code for every other architecture,
>> + * originally written by Richard Henderson <rth@twiddle.net>
>> + * Copyright (C) 2018 Linaro, Inc.
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +        .global safe_syscall_base
>> +        .global safe_syscall_start
>> +        .global safe_syscall_end
>> +        .type   safe_syscall_base, @function
>> +        .type   safe_syscall_start, @function
>> +        .type   safe_syscall_end, @function
>> +
>> +        /*
>> +         * This is the entry point for making a system call. The calling
>> +         * convention here is that of a C varargs function with the
>> +         * first argument an 'int *' to the signal_pending flag, the
>> +         * second one the system call number (as a 'long'), and all further
>> +         * arguments being syscall arguments (also 'long').
>> +         */
>> +safe_syscall_base:
>> +        .cfi_startproc
>> +        /*
>> +         * The syscall calling convention is nearly the same as C:
>> +         * we enter with a0 == &signal_pending
>> +         *               a1 == syscall number
>> +         *               a2 ... a7 == syscall arguments
>> +         *               and return the result in a0
>> +         * and the syscall instruction needs
>> +         *               a7 == syscall number
>> +         *               a0 ... a5 == syscall arguments
>> +         *               and returns the result in a0
>> +         * Shuffle everything around appropriately.
>> +         */
>> +        move    $t0, $a0        /* signal_pending pointer */
>> +        move    $t1, $a1        /* syscall number */
>> +        move    $a0, $a2        /* syscall arguments */
>> +        move    $a1, $a3
>> +        move    $a2, $a4
>> +        move    $a3, $a5
>> +        move    $a4, $a6
>> +        move    $a5, $a7
>> +        move    $a7, $t1
>> +
>> +        /*
>> +         * This next sequence of code works in conjunction with the
>> +         * rewind_if_safe_syscall_function(). If a signal is taken
>> +         * and the interrupted PC is anywhere between 'safe_syscall_start'
>> +         * and 'safe_syscall_end' then we rewind it to 'safe_syscall_start'.
>> +         * The code sequence must therefore be able to cope with this, and
>> +         * the syscall instruction must be the final one in the sequence.
>> +         */
>> +safe_syscall_start:
>> +        /* If signal_pending is non-zero, don't do the call */
>> +        ld.w    $t1, $t0, 0
>> +        bnez    $t1, 2f
>> +        syscall 0
>> +safe_syscall_end:
>> +        /* code path for having successfully executed the syscall */
>> +        li.w    $t2, -4096
>> +        bgtu    $a0, $t2, 0f
>> +        jr      $ra
>> +
>> +        /* code path setting errno */
>> +0:      sub.d   $a0, $zero, $a0
>> +        b       safe_syscall_set_errno_tail
>> +
>> +        /* code path when we didn't execute the syscall */
>> +2:      li.w    $a0, QEMU_ERESTARTSYS
>> +        b       safe_syscall_set_errno_tail
>> +        .cfi_endproc
>> +        .size   safe_syscall_base, .-safe_syscall_base
>>
> Why not rename 0 -> set_errno and 2 -> syscall_not_executed
> for readability? (and eventually drop the comments).
This is directly taken from the RISC-V version; aside from that, this is 
similar to all other architectures' adaptation, so maybe a future 
refactor should touch all these other files as well, if we do? I 
personally find the readability to be good, because when you look up 0 
or 2 below you can't miss the comments placed close to the labels.
>
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

