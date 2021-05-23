Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C8038DC34
	for <lists+qemu-devel@lfdr.de>; Sun, 23 May 2021 19:33:30 +0200 (CEST)
Received: from localhost ([::1]:45836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkryi-0005mM-MW
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 13:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lkrwU-0004V1-NS
 for qemu-devel@nongnu.org; Sun, 23 May 2021 13:31:10 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:48507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lkrwN-0001j5-CD
 for qemu-devel@nongnu.org; Sun, 23 May 2021 13:31:10 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B863574570E;
 Sun, 23 May 2021 19:30:56 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7FA0774570D; Sun, 23 May 2021 19:30:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7E403745709;
 Sun, 23 May 2021 19:30:56 +0200 (CEST)
Date: Sun, 23 May 2021 19:30:56 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Watson <scrameta@googlemail.com>
Subject: Re: notdirty_write thrashing in simple for loop
In-Reply-To: <CAOG2ctxj9toCpfiyrfTJ3VgM49ADCLcp_1CD3bkaQU-ug5mXTg@mail.gmail.com>
Message-ID: <f2c2b3d9-432-92a3-1421-c249e1a1b5a@eik.bme.hu>
References: <CAOG2ctwMt9hpqu425+J5cCR_KCt1d2iSxMcbx6ENB41BNMqZ6g@mail.gmail.com>
 <60d91249-621-a6e8-e94b-24f73fbb7825@eik.bme.hu>
 <CAOG2ctxj9toCpfiyrfTJ3VgM49ADCLcp_1CD3bkaQU-ug5mXTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 23 May 2021, Mark Watson wrote:
> Hi
>
> On Sun, 23 May 2021 at 15:41, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> I think you need to be more specific about details or even better provide
>> a way to reproduce it without your hardware if possible otherwise people
>> will not get what you're seeing. From the above it's not clear to me if
>> you're emulating an fpga hardware in QEMU or actually run with the fpga
>> (supposedly implementing the Amiga chipset) in the virtual machine's
>> memory so accesses to some addresses will do something in hardware (in
>> which case it may be difficult to reproduce without it and also could be
>> the source of problems so hard to tell what might be causing your issue.)
>
> I managed to reproduce now locally without the fpga, on my x86 system.
>
> The issue seems to be the layout of where the Amiga puts code and the
> stack. It does not use virtual memory and each program seems to get the
> stack just below the code. So whenever the code increments i, it writes to
> the page and qemu does a lookup in a map to potentially invalidate the
> code.

That's probably enough for people who can give advice to understand the 
problem. I think I get it but can't help more as I don't know TCG or QEMU 
internals very well.

>> (Is this related to pistorm or something based on that for full Amiga
>> emulation without Amiga hardware? Just insterested, unrelated to this
>> thread.)
>>
> The minimig is a recreation of the Amiga hardware in the FPGA. In addition
> to its own dedicated board, it has been ported to many boards: Turbo
> Chameleon, Mist, MiSTer (DE10 Nano with expansion). In the MiSTer an SOC
> FPGA chip is used, which has dual arm codes and an fpga on the same
> silicon, with high performance bridges beween them.
> Pistorm and Buffee are fairly similar, in that they are replacing the 68K
> cpu with an emulated cpu, but with intefaces to real hardware. As I
> undetstand it, the former uses Musashi and the latter they are writing
> their own JIT.

I see. Interesting idea if you already have such an fpga SoC, then you 
can make good use of the ARM cores that way.

>> So you do nothing in the loop just test for the loop variable and this
>> sometimes runs slow?
>>
> Yes in fact even without the test in the loop. Just a loop incrementing i,
> where i is on the stack. As I now found out it seems to be an issue if the
> code and the variable i are in the same page.
>
> Now I could try to modify the software on the amiga to split stack and
> code. I do wonder if some kind of caching layer could be added to qemu so
> that repeated invalidates do not take so much cpu time.

I don't know but added maintainers of accel/tcg/cputlb.c to cc to get 
their attention. You can get this info from MAINTAINERS file and more 
easily with:

scripts/get_maintainer.pl -f accel/tcg/cputlb.c

For reference and more backfround info here's a link to Mark's original 
message:

https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg05581.html

Regards,
BALATON Zoltan

>> Also verify that these excessive calls to notdirty_write does
>> only happen when it's running slow so it's really the source of the
>> problems and not something normal otherwise.
>>
> I have now confirmed this, I enable the trace_event on the notdirty to
> confirm.
>
> Many thanks for the qemu and dgb debugging tips, much appreciated. I will
> real them.
>
> Mark Watson
>

