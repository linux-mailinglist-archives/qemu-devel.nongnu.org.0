Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475BF4759B1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 14:31:57 +0100 (CET)
Received: from localhost ([::1]:34322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxUNw-0006nb-Cq
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 08:31:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mxTqg-00040q-Gp
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:57:34 -0500
Received: from mail.xen0n.name ([115.28.160.31]:36984
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mxTqd-00057n-GY
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:57:34 -0500
Received: from [100.100.35.147] (unknown [58.34.185.106])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B9E5F600B0;
 Wed, 15 Dec 2021 20:57:18 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1639573038; bh=AmeyALJc+CxU0vtMVpRh+ut6h/x4tb3iUj4OTzGqbMU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xsZ3c+7iHCBMOaAoZlzVDlb6XgxQABqEsYfE+wD7vy7dJRk+9jLOfwLCzSTRlkWSM
 0i+nPEEDNhaSgPbDcXeZR2Afrcpooljv9F/au5b6fTSbKYe5VeWxnJyyvvEnNLPqk6
 iyh71BV6Ka71UuwtTgring/eOCf71oQsW12asZ/o=
Message-ID: <a686e6e1-06ad-6f9c-ae5b-72675cbc0bbc@xen0n.name>
Date: Wed, 15 Dec 2021 20:57:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:95.0)
 Gecko/20100101 Thunderbird/95.0a1
Subject: Re: [PATCH v9 28/31] common-user: Add safe syscall handling for
 loongarch64 hosts
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211214080154.196350-1-git@xen0n.name>
 <20211214080154.196350-29-git@xen0n.name>
 <fce709e8-f122-f410-0c62-4d14f46ed999@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <fce709e8-f122-f410-0c62-4d14f46ed999@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.64,
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
 XiaoJuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 2021/12/15 03:29, Richard Henderson wrote:
> On 12/14/21 12:01 AM, WANG Xuerui wrote:
>> +        move    $t0, $a0        /* signal_pending pointer */
> ...
>> +safe_syscall_start:
>> +        /* If signal_pending is non-zero, don't do the call */
>> +        ld.w    $t1, $t0, 0
>> +        bnez    $t1, 2f
>> +        syscall 0
>
> We need a non-syscall clobbered register for signal_pending, per the
> bug fixed in 5d9f3ea0817215ad4baac5aa30414e9ebbaaf0d6.
>
> In the case of riscv, because of the way exceptions are delivered,
> there are no syscall-clobbered registers (by the time syscall is
> distinguished from interrupt, all registers have been saved).
>
> In the case of mips, there are no non-syscall-clobbered registers that
> are not also call-saved or syscall arguments, so I had to allocate a
> stack frame and save/restore s0.
>
> For loongarch64, according to glibc,
>
> #define __SYSCALL_CLOBBERS \
>   "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7", "$t8", "memory"
>
> which does suggest that a6 is unused, saved across the syscall, and
> also call-clobbered (so we don't have to allocate a stack frame).
>
> I've had a browse through the loongarch kernel code and that seems to
> be all true. (Curiously, loongarch restores more registers than it
> saves on the way out of handle_syscall.  There may be a subtle reason
> for that, or room for improvement.)

Of course I completely forgot the fact that LoongArch looks more like
MIPS than RISC-V in kernel land (facepalm)

I've checked the LoongArch kernel sources too and yeah using a6 is ideal
and unlikely to break in the future (we're not allowing any more
7-argument syscalls into the kernel after all). I've just sent v10 with
some other minor changes.

>
>
> r~

