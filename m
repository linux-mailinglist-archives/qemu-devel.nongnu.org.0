Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E87733792F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:22:56 +0100 (CET)
Received: from localhost ([::1]:47930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKO5P-0001kw-I9
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:22:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lKNl3-0000Of-0Z
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:01:54 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:38986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lKNkx-0003bP-Nc
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:01:52 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0762218|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.123387-0.00262218-0.873991;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047212; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=2; RT=2; SR=0; TI=SMTPD_---.JjaB.wh_1615478497; 
Received: from 30.39.164.94(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JjaB.wh_1615478497)
 by smtp.aliyun-inc.com(10.147.42.135);
 Fri, 12 Mar 2021 00:01:38 +0800
Subject: Re: Question about edge-triggered interrupt
To: Peter Maydell <peter.maydell@linaro.org>
References: <b9b0e381-c045-bab1-eea7-b8112526e5e8@c-sky.com>
 <CAFEAcA_jnLzZN-nA+Cf_HwGjxvOaxUzZ44LYxqpcmw=3eAU6qg@mail.gmail.com>
 <3edf7903-94a7-c16e-2b9e-644e1a41a77d@c-sky.com>
 <CAFEAcA8UqE65Qxy=c53CCPdYnVrwvBZGxU9SH9qk7Q6vGKDgyg@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <50fb9541-095d-18e8-1145-662f594600b6@c-sky.com>
Date: Fri, 12 Mar 2021 00:01:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8UqE65Qxy=c53CCPdYnVrwvBZGxU9SH9qk7Q6vGKDgyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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



On 2021/3/11 21:17, Peter Maydell wrote:
> On Thu, 11 Mar 2021 at 12:59, LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>  From the specification, I find that software will not clean the pending bit on interrupt controller via a register write.
>>
>> "When a vectored interrupt is selected and serviced, the hardware will automatically clear the
>>
>> corresponding pending bit in edge-triggered mode. In this case, software does not need to clear
>>
>> pending bit at all in the service routine."
>>
>> Hardware can always select a pending interrupt as it is cycle-driven. But QEMU is event-driven.
>> I don't know if there is a chance to select other pending interrupts after serving the selected interrupt.
> Something must change that the hardware (and thus the model) can use to
> determine that it needs to do something else. The interrupt controller
> must be able to tell when the interrupt is "selected and serviced"
> somehow.
That's a case I can't understand.

1.  An device causes an edge-triggered interrupt A.
2.  The interrupt controller sample the interrupt A, and setting pending 
bit for A.
3.  The interrupt controller select the interrupt  A to CPU and clean 
the pending bit for A(according to the specification).
4.  CPU start to execute the A's service routine.
5.  Another device causes interrupt B.
6.  The interrupt controller sample the interrupt B, and setting pending 
bit for B.
7.  As B's priority is lower than A, it can't preempt  A's service routine.
8.  A's service routine return.
9. No other interrupt comes after B.

After the sequence, B is pending in interrupt controller, and has no 
chance to be selected by interrupt controller.
A's service routine will neither write interrupt controller's register 
nor device's register.

In my RTOS case, the interrupt A here is really a software interrupt. 
Just for clarity here.

Thanks for sharing your ideas.

Zhiwei
>
> thanks
> -- PMM


