Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CBF3379B7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:43:10 +0100 (CET)
Received: from localhost ([::1]:53682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKOOy-00019p-EF
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:43:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lKOLv-0007Rj-L3
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:39:59 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:56769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lKOLn-00024v-5O
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:39:59 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08002073|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.288338-0.00270184-0.70896;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047190; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=2; RT=2; SR=0; TI=SMTPD_---.Jjaqfg3_1615480778; 
Received: from 30.39.164.94(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Jjaqfg3_1615480778)
 by smtp.aliyun-inc.com(10.147.42.135);
 Fri, 12 Mar 2021 00:39:38 +0800
Subject: Re: Question about edge-triggered interrupt
To: Peter Maydell <peter.maydell@linaro.org>
References: <b9b0e381-c045-bab1-eea7-b8112526e5e8@c-sky.com>
 <CAFEAcA_jnLzZN-nA+Cf_HwGjxvOaxUzZ44LYxqpcmw=3eAU6qg@mail.gmail.com>
 <3edf7903-94a7-c16e-2b9e-644e1a41a77d@c-sky.com>
 <CAFEAcA8UqE65Qxy=c53CCPdYnVrwvBZGxU9SH9qk7Q6vGKDgyg@mail.gmail.com>
 <50fb9541-095d-18e8-1145-662f594600b6@c-sky.com>
 <CAFEAcA-zRB8t4h7eLsw5FbFtyBp6Ow16P4vvk2eA9t7Jcr42TQ@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <854d74fd-ef10-af51-93c0-2d66792e604c@c-sky.com>
Date: Fri, 12 Mar 2021 00:39:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-zRB8t4h7eLsw5FbFtyBp6Ow16P4vvk2eA9t7Jcr42TQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 2021/3/12 0:07, Peter Maydell wrote:
> On Thu, 11 Mar 2021 at 16:01, LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>> That's a case I can't understand.
>>
>> 1.  An device causes an edge-triggered interrupt A.
>> 2.  The interrupt controller sample the interrupt A, and setting pending
>> bit for A.
>> 3.  The interrupt controller select the interrupt  A to CPU and clean
>> the pending bit for A(according to the specification).
>> 4.  CPU start to execute the A's service routine.
>> 5.  Another device causes interrupt B.
>> 6.  The interrupt controller sample the interrupt B, and setting pending
>> bit for B.
>> 7.  As B's priority is lower than A, it can't preempt  A's service routine.
>> 8.  A's service routine return.
>> 9. No other interrupt comes after B.
>>
>> After the sequence, B is pending in interrupt controller, and has no
>> chance to be selected by interrupt controller.
>> A's service routine will neither write interrupt controller's register
>> nor device's register.
> I'm pretty sure that there is some interaction between the CPU and the
> interrupt controller on a return-from-interrupt that you are
> missing.
I have asked my CPU design workmates. They said, "you have to pull a 
pending interrupt at the interrupt return instruction".

But I don't want to do this way, because it influences the interrupt 
return instruction's behavior. The specification doesn't
point that explicitly. It's just our CPU implementation.

If I lock the iothread in interrupt return instruction helper function, 
and pull a pending interrupt. It really works, but I don't think
it will be appropriate for other CPU implementation.
> There are several ways to do it in principle;
I am curious about the ways. If you like, a simple list please.
> you need
> a risc-v expert to answer your question more specifically.
Thanks for your advice.

Zhiwei
>
> thanks
> -- PMM


