Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F22F337351
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 14:02:22 +0100 (CET)
Received: from localhost ([::1]:55718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKws-0001BX-0q
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 08:01:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lKKux-0000EE-Hx
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:59:55 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:55674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lKKut-00055S-UE
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:59:55 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07529251|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0803614-0.00606263-0.913576;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=2; RT=2; SR=0; TI=SMTPD_---.JjWKzyJ_1615467578; 
Received: from 30.225.208.101(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JjWKzyJ_1615467578)
 by smtp.aliyun-inc.com(10.147.43.230);
 Thu, 11 Mar 2021 20:59:38 +0800
Subject: Re: Question about edge-triggered interrupt
To: Peter Maydell <peter.maydell@linaro.org>
References: <b9b0e381-c045-bab1-eea7-b8112526e5e8@c-sky.com>
 <CAFEAcA_jnLzZN-nA+Cf_HwGjxvOaxUzZ44LYxqpcmw=3eAU6qg@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <3edf7903-94a7-c16e-2b9e-644e1a41a77d@c-sky.com>
Date: Thu, 11 Mar 2021 20:59:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_jnLzZN-nA+Cf_HwGjxvOaxUzZ44LYxqpcmw=3eAU6qg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------0721E2F3385F675042010655"
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------0721E2F3385F675042010655
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2021/3/11 17:33, Peter Maydell wrote:
> On Thu, 11 Mar 2021 at 02:59, LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>> Currently, I am writing an interrupt controller (CLIC) for RISC-V.  I can't find a good way to process edge-triggered interrupt.
>>
>> According to edge-triggered definition, if I select an edge-triggered  interrupt to serve , it will clean its pending status. However after serving the interrupt,  there is no chance to select other pending interrupts.
>>
>> I have two methods.
>>
>> One is to add a timer for interrupt controller, so that every pending interrupt can be served at some point.
>> The other is that  always pull a pending interrupt to serve at the interrupt return instruction.
> You should do what the hardware you're modelling does. I'm
> pretty sure it won't be using a timer, at any rate. Whether
> it does something on interrupt-return insns will depend on
> the architecture and how tightly the interrupt controller
> is integrated with the CPU.
>
> In general edge-triggered interrupts for an interrupt
> controller just mean "when it sees a 0->1 transition
> on its input line it does something, eg mark the interrupt
> pending", and also usually "when the guest OS acknowledges
> the interrupt (eg via a register write to the interrupt
> controller), mark the interrupt as no longer pending", and
> a "keep telling the OS that there is an available interrupt
> of some kind until all the interrupts are no longer pending".
Thanks very much. It solves the most problem. However, I still have a 
little one.


 From the specification, I find that software will not clean the pending 
bit on interrupt controller via a register write.

"When a vectored interrupt is selected and serviced, the hardware will automatically clear the

corresponding pending bit in edge-triggered mode. In this case, software does not need to clear

pending bit at all in the service routine."

Hardware can always select a pending interrupt as it is cycle-driven. 
But QEMU is event-driven.
I don't know if there is a chance to select other pending interrupts 
after serving the selected interrupt.

Look forward to your reply. Thanks very much.

Zhiwei
> The details of how this works depend entirely on the
> interrupt controller -- hopefully it has a specification
> document which will tell you the actual behaviour.
>
> thanks
> -- PMM


--------------0721E2F3385F675042010655
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2021/3/11 17:33, Peter Maydell
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFEAcA_jnLzZN-nA+Cf_HwGjxvOaxUzZ44LYxqpcmw=3eAU6qg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Thu, 11 Mar 2021 at 02:59, LIU Zhiwei <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@c-sky.com">&lt;zhiwei_liu@c-sky.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Currently, I am writing an interrupt controller (CLIC) for RISC-V.  I can't find a good way to process edge-triggered interrupt.

According to edge-triggered definition, if I select an edge-triggered  interrupt to serve , it will clean its pending status. However after serving the interrupt,  there is no chance to select other pending interrupts.

I have two methods.

One is to add a timer for interrupt controller, so that every pending interrupt can be served at some point.
The other is that  always pull a pending interrupt to serve at the interrupt return instruction.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You should do what the hardware you're modelling does. I'm
pretty sure it won't be using a timer, at any rate. Whether
it does something on interrupt-return insns will depend on
the architecture and how tightly the interrupt controller
is integrated with the CPU.

In general edge-triggered interrupts for an interrupt
controller just mean "when it sees a 0-&gt;1 transition
on its input line it does something, eg mark the interrupt
pending", and also usually "when the guest OS acknowledges
the interrupt (eg via a register write to the interrupt
controller), mark the interrupt as no longer pending", and
a "keep telling the OS that there is an available interrupt
of some kind until all the interrupts are no longer pending".
</pre>
    </blockquote>
    Thanks very much. It solves the most problem. However, I still have
    a little one.<br>
    <br>
    <br>
    From the specification, I find that software will not clean the
    pending bit on interrupt controller via a register write.<br>
    <pre>"When a vectored interrupt is selected and serviced, the hardware will automatically clear the</pre>
    <pre>corresponding pending bit in edge-triggered mode. In this case, software does not need to clear</pre>
    <pre>pending bit at all in the service routine."

</pre>
    Hardware can always select a pending interrupt as it is
    cycle-driven. But QEMU is event-driven.<br>
    I don't know if there is a chance to select other pending interrupts
    after serving the selected interrupt.<br>
    <br>
    Look forward to your reply. Thanks very much.<br>
    <br>
    Zhiwei<br>
    <blockquote type="cite"
cite="mid:CAFEAcA_jnLzZN-nA+Cf_HwGjxvOaxUzZ44LYxqpcmw=3eAU6qg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
The details of how this works depend entirely on the
interrupt controller -- hopefully it has a specification
document which will tell you the actual behaviour.

thanks
-- PMM
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------0721E2F3385F675042010655--

