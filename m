Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFBB445B8C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 22:13:10 +0100 (CET)
Received: from localhost ([::1]:33706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mik2m-0000XX-Sv
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 17:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1mik1E-000807-Ec; Thu, 04 Nov 2021 17:11:32 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:50079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1mik1B-00074j-Md; Thu, 04 Nov 2021 17:11:31 -0400
Received: (Authenticated sender: jcd@tribudubois.net)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 7EEEBFF805;
 Thu,  4 Nov 2021 21:11:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------jC5hRl0UNJFFVHOI7HwStT30"
Message-ID: <c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net>
Date: Thu, 4 Nov 2021 22:11:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: Qemu and ARM secure state.
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
 <CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com>
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
In-Reply-To: <CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com>
Received-SPF: pass client-ip=217.70.183.199; envelope-from=jcd@tribudubois.net;
 helo=relay9-d.mail.gandi.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------jC5hRl0UNJFFVHOI7HwStT30
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/11/2021 à 12:11, Peter Maydell a écrit :
> On Wed, 3 Nov 2021 at 13:27, Jean-Christophe DUBOIS<jcd@tribudubois.net>  wrote:
>> I have a little application that is designed to work on the i.MX6UL processor.
>>
>> I developed it and tested it on the mcimx6ul-evk platform emulated by Qemu.
>>
>> This application used to work "flawlessly" on Qemu 5.0.50 and is working on Qemu 6.0.0 (available as a pre-built package on the latest Ubuntu).
>>
>> But when I try to run the exact same command line on a Qemu version I compile myself from main/latest of github (Qemu 6.1.50), my application fails to start.
>>
>> So a little background:
>>
>> My application expects to start in "secure" state and supervisor mode (which is the default state of i.MX6UL when booting barebone [without u-boot]).
>>
>>  From this state the application tries to get to "non secure" / hypervisor mode which imply going to the "secure" / monitor state before being able to drop to "non secure" / hypervisor. To do so is runs a "smc 0" operand (from "secure" / supervisor).
>>
>> This "smc" instruction is processed "as expected" by Qemu 5.0.50 and Qemu 6.0.0 (getting to "secure" / monitor mode) but on Qemu 6.1.50 (latest from github) it is as if the smc operand was a no-op. It doesn't trigger any exception and the processor just get to the next instruction after the "smc" instruction. So I am a bit puzzled.
>>
>> Is there something that changed in Qemu (since Qemu 6.0.0) when it comes to the "secure" world/state?
>> Is there some additional command line parameters to use (I search in the documentation but without luck) to get secure world behavior ?
>> Is it necessary to "adapt" the emulated platform (i.MX6UL/mcimx6ul-evk) in some way (it looks like the "virt" machine with "secure=on" does work for arm platform)?
> Could you try doing a bisect to find the QEMU commit that caused
> your guest to stop working ?

OK, I did the bisect and the commit that break the i.MX6UL behavior for 
my program is commit 9fcd15b9193e819b6cc2fd0a45e3506148812bb4 (arm: tcg: 
Adhere to SMCCC 1.3 section 5.2).

Before it the SMC instruction would trigger a monitor exception.

After it the SMC instruction is acting like a no-op.

Thanks

JC


>
> thanks
> -- PMM
>

--------------jC5hRl0UNJFFVHOI7HwStT30
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Le 04/11/2021 à 12:11, Peter Maydell a
      écrit :<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Wed, 3 Nov 2021 at 13:27, Jean-Christophe DUBOIS <a class="moz-txt-link-rfc2396E" href="mailto:jcd@tribudubois.net">&lt;jcd@tribudubois.net&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I have a little application that is designed to work on the i.MX6UL processor.

I developed it and tested it on the mcimx6ul-evk platform emulated by Qemu.

This application used to work "flawlessly" on Qemu 5.0.50 and is working on Qemu 6.0.0 (available as a pre-built package on the latest Ubuntu).

But when I try to run the exact same command line on a Qemu version I compile myself from main/latest of github (Qemu 6.1.50), my application fails to start.

So a little background:

My application expects to start in "secure" state and supervisor mode (which is the default state of i.MX6UL when booting barebone [without u-boot]).

From this state the application tries to get to "non secure" / hypervisor mode which imply going to the "secure" / monitor state before being able to drop to "non secure" / hypervisor. To do so is runs a "smc 0" operand (from "secure" / supervisor).

This "smc" instruction is processed "as expected" by Qemu 5.0.50 and Qemu 6.0.0 (getting to "secure" / monitor mode) but on Qemu 6.1.50 (latest from github) it is as if the smc operand was a no-op. It doesn't trigger any exception and the processor just get to the next instruction after the "smc" instruction. So I am a bit puzzled.

Is there something that changed in Qemu (since Qemu 6.0.0) when it comes to the "secure" world/state?
Is there some additional command line parameters to use (I search in the documentation but without luck) to get secure world behavior ?
Is it necessary to "adapt" the emulated platform (i.MX6UL/mcimx6ul-evk) in some way (it looks like the "virt" machine with "secure=on" does work for arm platform)?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Could you try doing a bisect to find the QEMU commit that caused
your guest to stop working ?</pre>
    </blockquote>
    <p>OK, I did the bisect and the commit that break the i.MX6UL
      behavior for my program is commit <span class="sha-block"><span
          class="sha user-select-contain">9fcd15b9193e819b6cc2fd0a45e3506148812bb4
          (</span></span>arm: tcg: Adhere to SMCCC 1.3 section 5.2).</p>
    <p>Before it the SMC instruction would trigger a monitor exception.</p>
    <p>After it the SMC instruction is acting like a no-op.<br>
    </p>
    <p>Thanks</p>
    <p>JC<br>
    </p>
    <p><span class="sha-block"><span class="sha user-select-contain"></span></span></p>
    <p><span class="sha-block"><span class="sha user-select-contain"><br>
        </span></span></p>
    <blockquote type="cite"
cite="mid:CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

thanks
-- PMM

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>
--------------jC5hRl0UNJFFVHOI7HwStT30--


