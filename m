Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAA32C9024
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 22:42:35 +0100 (CET)
Received: from localhost ([::1]:50142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjqwM-0005wy-GI
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 16:42:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kjqum-0005GE-M7; Mon, 30 Nov 2020 16:40:56 -0500
Received: from mail.csgraf.de ([188.138.100.120]:34110
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kjquj-00020w-Ir; Mon, 30 Nov 2020 16:40:55 -0500
Received: from Alexanders-MacBook-Air.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with ESMTPSA id 096F93900111;
 Mon, 30 Nov 2020 22:40:49 +0100 (CET)
Subject: Re: [PATCH 2/8] hvf: Move common code out
To: Peter Collingbourne <pcc@google.com>, Frank Yang <lfy@google.com>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-3-agraf@csgraf.de>
 <20201127200054.GC56950@SPB-NB-133.local>
 <392c2465-157e-e15a-0a2c-2e3faa166d22@csgraf.de>
 <CAEkmjvUArgL+Mcvy6nUhfJrdX3OaF=U8UdWia7ZDo9GWk0VF=g@mail.gmail.com>
 <CAEkmjvVJ5zup4NR2+DStt_NvV2cV7+7dj2=fJ3DQBkth8pAfcw@mail.gmail.com>
 <cecd20d0-278b-0a4b-ba9c-0207504c99d7@csgraf.de>
 <CAEkmjvVOAYP6wJyVpAtZE3d=iNOOWGZeHptQ9xJDGcTi4qQ0hQ@mail.gmail.com>
 <CAMn1gO7jqjsqJHtSaV7F+2qmtfF-YFDJwo=O8ot2iem+Uz4Zrw@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <6975b4a3-1568-df40-8594-bfcf488ac425@csgraf.de>
Date: Mon, 30 Nov 2020 22:40:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAMn1gO7jqjsqJHtSaV7F+2qmtfF-YFDJwo=O8ot2iem+Uz4Zrw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 30.11.20 22:08, Peter Collingbourne wrote:
> On Mon, Nov 30, 2020 at 12:56 PM Frank Yang <lfy@google.com> wrote:
>>
>>
>> On Mon, Nov 30, 2020 at 12:34 PM Alexander Graf <agraf@csgraf.de> wrote:
>>> Hi Frank,
>>>
>>> Thanks for the update :). Your previous email nudged me into the right direction. I previously had implemented WFI through the internal timer framework which performed way worse.
>> Cool, glad it's helping. Also, Peter found out that the main thing keeping us from just using cntpct_el0 on the host directly and compare with cval is that if we sleep, cval is going to be much < cntpct_el0 by the sleep time. If we can get either the architecture or macos to read out the sleep time then we might be able to not have to use a poll interval either!
>>> Along the way, I stumbled over a few issues though. For starters, the signal mask for SIG_IPI was not set correctly, so while pselect() would exit, the signal would never get delivered to the thread! For a fix, check out
>>>
>>>    https://patchew.org/QEMU/20201130030723.78326-1-agraf@csgraf.de/20201130030723.78326-4-agraf@csgraf.de/
>>>
>> Thanks, we'll take a look :)
>>
>>> Please also have a look at my latest stab at WFI emulation. It doesn't handle WFE (that's only relevant in overcommitted scenarios). But it does handle WFI and even does something similar to hlt polling, albeit not with an adaptive threshold.
> Sorry I'm not subscribed to qemu-devel (I'll subscribe in a bit) so
> I'll reply to your patch here. You have:
>
> +                    /* Set cpu->hvf->sleeping so that we get a
> SIG_IPI signal. */
> +                    cpu->hvf->sleeping = true;
> +                    smp_mb();
> +
> +                    /* Bail out if we received an IRQ meanwhile */
> +                    if (cpu->thread_kicked || (cpu->interrupt_request &
> +                        (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
> +                        cpu->hvf->sleeping = false;
> +                        break;
> +                    }
> +
> +                    /* nanosleep returns on signal, so we wake up on kick. */
> +                    nanosleep(ts, NULL);
>
> and then send the signal conditional on whether sleeping is true, but
> I think this is racy. If the signal is sent after sleeping is set to
> true but before entering nanosleep then I think it will be ignored and
> we will miss the wakeup. That's why in my implementation I block IPI
> on the CPU thread at startup and then use pselect to atomically
> unblock and begin sleeping. The signal is sent unconditionally so
> there's no need to worry about races between actually sleeping and the
> "we think we're sleeping" state. It may lead to an extra wakeup but
> that's better than missing it entirely.


Thanks a bunch for the comment! So the trick I was using here is to 
modify the timespec from the kick function before sending the IPI 
signal. That way, we know that either we are inside the sleep (where the 
signal wakes it up) or we are outside the sleep (where timespec={} will 
make it return immediately).

The only race I can think of is if nanosleep does calculations based on 
the timespec and we happen to send the signal right there and then.

The problem with blocking IPIs is basically what Frank was describing 
earlier: How do you unset the IPI signal pending status? If the signal 
is never delivered, how can pselect differentiate "signal from last time 
is still pending" from "new signal because I got an IPI"?


Alex


