Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C12138DB47
	for <lists+qemu-devel@lfdr.de>; Sun, 23 May 2021 15:42:43 +0200 (CEST)
Received: from localhost ([::1]:47884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkoNN-0005n2-Uv
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 09:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lkoMP-000586-Al
 for qemu-devel@nongnu.org; Sun, 23 May 2021 09:41:41 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:34442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lkoML-0004bg-Or
 for qemu-devel@nongnu.org; Sun, 23 May 2021 09:41:40 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B5F4C745709;
 Sun, 23 May 2021 15:41:32 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 84390745708; Sun, 23 May 2021 15:41:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8325D7456B4;
 Sun, 23 May 2021 15:41:32 +0200 (CEST)
Date: Sun, 23 May 2021 15:41:32 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Watson <scrameta@googlemail.com>
Subject: Re: notdirty_write thrashing in simple for loop
In-Reply-To: <CAOG2ctwMt9hpqu425+J5cCR_KCt1d2iSxMcbx6ENB41BNMqZ6g@mail.gmail.com>
Message-ID: <60d91249-621-a6e8-e94b-24f73fbb7825@eik.bme.hu>
References: <CAOG2ctwMt9hpqu425+J5cCR_KCt1d2iSxMcbx6ENB41BNMqZ6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 10%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Tue, 18 May 2021, Mark Watson wrote:
> I'm trying to implement my own machine for amiga emulation using a software
> cpu and fpga hardware. For this I have built my own machine which consists
> of a large malloced ram block and some fpga hardware mmapped elsewhere into
> the memory space.
>
> I'm using qemu to emulate a 68040 on an arm cortex a9 host in system mode.
>
> It is working, though I'm investigating a strange performance issue.
>
> I'm looking for advice on where to look next in debugging this from the
> specialist(s) of accel/tcg/cputlb.c please.

I think you need to be more specific about details or even better provide 
a way to reproduce it without your hardware if possible otherwise people 
will not get what you're seeing. From the above it's not clear to me if 
you're emulating an fpga hardware in QEMU or actually run with the fpga 
(supposedly implementing the Amiga chipset) in the virtual machine's 
memory so accesses to some addresses will do something in hardware (in 
which case it may be difficult to reproduce without it and also could be 
the source of problems so hard to tell what might be causing your issue.)

(Is this related to pistorm or something based on that for full Amiga 
emulation without Amiga hardware? Just insterested, unrelated to this 
thread.)

> To investigate the performance issue I tried to break it down to the
> simplest possible case. I can reproduce it with a simple for loop (compiled
> without optimisation).
>        for (int i=0;i!=0xffffff;++i)
> {
> if ((i&0xffff)==0)
> {
> }
> }

So you do nothing in the loop just test for the loop variable and this 
sometimes runs slow?

> Running it in user mode on the same host it takes ~0.6 seconds. In the
> built-in 'virtual' m68k machine running linux it takes 1.3 seconds.
> However in my machine under amigaos I'm seeing it typically taking 5 and a
> half minutes! Occasionally it seems to run at the correct speed of <2
> seconds, though I have yet to identify why. These are the logs of the
> captured code before it goes into the main chain loop.
> qemu_slow_stuck_fragment.log
> <http://www.64kib.com/qemu_slow_stuck_fragment.log>

The log does not make much sense to me but I'm also not an expert on TCG 
and ARM. Why do you have faults while running a simple empty loop and what 
are those? Is something flushing the TLB for some reason or is this just 
becuase of the debug logging? I think there are some -d oprions for mmu 
debugging that may give more info on TLB usage.

> I have verified that this performance change is not due to slow fpga memory
> area access, i.e. there are no accesses to that memory region during this.

OK so then it should be possible to reproduce without that hardware? If so 
that would help people to understand the issue and give advice but I 
see that reproducing may need understanding the issue first.

> I took a look in gdb while running this loop to see what is going on.
> Initially I was surprised that I didn't find the code in 'OUT:', however I
> guess it makes sense that it has to call into the framework for memory
> access. I noticed that a lot of calls to glib are made and see

I rarely use gdb with QEMU so not sure but normally with TCG in_asm and 
out_asm debug you'll only see these when the TB is first translated not 
when you run it later because then the translated code is run from the TB 
cache. I think you can kind of disable this with -singlestep that makes 
TBs just a single instruction and may change caching. At least with that I 
see all instructions all the time in -d in_asm so this may help debugging 
although it makes things much slower.

> g_tree_lookup called a lot. This is caused by notdirty_write being called
> '000s of times and each time going into the page_collection_lock and
> tb_invalidate_phys_page_fast. I presume this is happening each time that
> "i" is incremented on the stack, which clearly has a huge overhead.

There are only a few places notdirty_write is called from so you should be 
able to identify which of those is firing (if all else fails you could add 
debug logs but there may be trace points to enable too). Once we get which 
place it's coming from then maybe people could tell why that could happen. 
Don't know if you already know QEMU debug options, I have some things 
collected here that I've used while implementing machine emulation here:

https://osdn.net/projects/qmiga/wiki/DeveloperTips

> Even being able to get a proper stack trace from gdb would be very helpful
> to understand this. I tried to configure qemu with '--enable-debug' but
> still do not get a proper stack if i attach to it. I'm not sure if this is
> the case due to it running dynamically compiled code before calling into
> this.

The --enable-debug adds debug symbols to QEMU but if it's called from 
generated code then you'll probably see that as the source of the calls so 
hard to tell what has put that there. Yet it may help if you could show 
some back traces you got in case that makes sense to somebody who knows 
about TCG. Also verify that these excessive calls to notdirty_write does 
only happen when it's running slow so it's really the source of the 
problems and not something normal otherwise.

Sorry I can't give any more useful advice but maybe the above give you 
some idea on how to debug this further.

Regards,
BALATON Zoltan

