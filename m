Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE5B343373
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 17:30:50 +0100 (CET)
Received: from localhost ([::1]:44160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO0yW-0003UL-Jd
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 12:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1lO0wl-0002kF-J6; Sun, 21 Mar 2021 12:28:59 -0400
Received: from mail.csgraf.de ([85.25.223.15]:53562 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1lO0wj-0007C6-DG; Sun, 21 Mar 2021 12:28:59 -0400
Received: from Alexanders-Mac-mini.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id 4C69E6080612;
 Sun, 21 Mar 2021 17:28:49 +0100 (CET)
Message-ID: <cbf3a9a3-faac-e41b-c6d0-f1bd417904a1@csgraf.de>
Date: Sun, 21 Mar 2021 17:28:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:87.0)
 Gecko/20100101 Thunderbird/87.0
Subject: Re: [PATCH v6 09/11] arm/hvf: Add a WFI handler
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Peter Collingbourne <pcc@google.com>
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-10-agraf@csgraf.de>
 <CAFEAcA_KFzEERYJ9d8YbPjhCv1rt9O9w567xP=ECqixLie5nmQ@mail.gmail.com>
 <CAMn1gO4p4CDH7qVhNnTpOeo_q98iYBHgS2LLSe26q-3SQJX1Xg@mail.gmail.com>
 <CAFEAcA_zNdgAO-1eif_TO7cBD1uB09pbGnbjEhUz+RDX+k9vVA@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAFEAcA_zNdgAO-1eif_TO7cBD1uB09pbGnbjEhUz+RDX+k9vVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 10.02.21 23:17, Peter Maydell wrote:
> On Wed, 10 Feb 2021 at 20:25, Peter Collingbourne <pcc@google.com> wrote:
>> On Thu, Jan 28, 2021 at 8:25 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>>>> +                if (!seconds && nanos < 2000000) {
>>>> +                    break;
>>>> +                }
>>>> +
>>>> +                struct timespec ts = { seconds, nanos };
>>>> +                hvf_wait_for_ipi(cpu, &ts);
>>>> +            }
>>> Why doesn't the timer timeout manifest as an IPI ? (Put another way,
>>> why is the timer interrupt special?)
>> Timer timeouts result in an IPI (via HV_EXIT_REASON_VTIMER_ACTIVATED)
>> if they become due while in hv_vcpu_run(). But at this point we are
>> not in hv_vcpu_run() (due to the aforementioned difference in wait
>> behavior between x86 and ARM) so we need to "manually" wait for the
>> timer to become due, re-enter the guest, let it exit with
>> HV_EXIT_REASON_VTIMER_ACTIVATED and then trigger the IPI.
> But WFI doesn't just wait for a timer interrupt, it waits for
> any interrupt. So it doesn't seem right that the timer interrupt
> in particular is being handled specially here.


It waits for either an external interrupt (vcpu_kick() -> IPI -> signal 
-> pselect exits) or a vtimer (kept in the CPU thread, handled by hvf 
natively when vCPU is running, handled through the pselect timeout when 
in WFI mode).

In hvf on ARM, the vtimer is handled specially. It is owned by the 
kernel code when we're inside the CPU loop. We don't even get vtimer MSR 
exits. However when user space decides to not return to the kernel CPU 
loop, it needs to handle the vtimer expiry itself. We really only have 
that case on WFI.


Alex



