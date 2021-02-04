Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4655E30EFEC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 10:48:20 +0100 (CET)
Received: from localhost ([::1]:52034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7bFL-0003GH-CS
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 04:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7bDI-0001mr-Fh
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:46:14 -0500
Received: from mx2.suse.de ([195.135.220.15]:40798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7bDE-0002HO-Ul
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:46:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99B55AD5C;
 Thu,  4 Feb 2021 09:46:07 +0000 (UTC)
Subject: Re: [PATCH v15 00/23] i386 cleanup PART 2
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210201100903.17309-1-cfontana@suse.de>
 <87v9b9qe78.fsf@linaro.org> <76d623a9-90e3-31bc-5998-1e159fe25b04@suse.de>
 <CAHDbmO1yhjYt9qUU6a6Lo2-v9yXg+E=YJ8N0=mM+mbP99Vsk_Q@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <0be3c3d9-3dfe-3ffb-a725-a8a5ba5c4c77@suse.de>
Date: Thu, 4 Feb 2021 10:46:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAHDbmO1yhjYt9qUU6a6Lo2-v9yXg+E=YJ8N0=mM+mbP99Vsk_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.178,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 11:07 PM, Alex Bennée wrote:
> For patch 17 on onwards it was just seeing what the actual benefit of
> the derived class was - I think I get it later on but you should
> mention it up front.
> 
> I do think we need to address the ordering constraint in 21 - are we
> introducing one or just formalising what has been created? If we are
> introducing one then can we a) do it a better way with the structuring
> of QOM or b) enforce it so new models don't run into unexpected bugs.


What patch 21 tried to do is to improve on the existing call method of "realizefn" for cpus.
To be honest it ended up not really achieving the goal, only removing one open call to qemu_init_vcpu in the target code.

The actual problem of the completely freak call order of realizefn, where the object model and device model interactions just really get in the way and create more problems than they solve,
remains largely untouched.

The problem is everything that has been plugged on top of realizing cpus now, which depends on the existing call order, which makes it almost impossible in my view to untangle properly.
As an example, the addition of a new cpu (cpu_list_add) should theoretically be done in the common cpu code, but it can't, due to the web of dependencies of the cpu_index being already updated before the common code is reached (tcg plugins are also a blocker there IIRC, but it is by no means the only one).

cpu_exec_realizefn then remains the place where this is done, which is called directly inside the target/xxx/cpu.c code.
Add to it the fact that we cannot do all framework operations in hw/core/cpu.c, because of the common_ss / specific_ss code split necessity,
and you get a web of constraints that is likely impossible to navigate.

To answer your questions:

a) we are introducing a more strict order in this patch, in the sense that implementations in target/xxx/cpu.c are not free to call qemu_init_vcpu where they please, instead the call is included in common code, triggered by the parent_realize() call.

b) this is basically automatically enforced by the fact that the call is not in target/ anymore


--

As can be seen by the patch, for some targets, in particular the ones requiring a cpu_reset() after qemu_init_vcpu, this slightly changes the initialization,
as between qemu_init_vcpu and cpu_reset() you now have the common code:

    /* qdev_get_machine() can return something that's not TYPE_MACHINE                                                                      
     * if this is one of the user-only emulators; in that case there's                                                                      
     * no need to check the ignore_memory_transaction_failures board flag.                                                                  
     */
    if (object_dynamic_cast(machine, TYPE_MACHINE)) {
        ObjectClass *oc = object_get_class(machine);
        MachineClass *mc = MACHINE_CLASS(oc);

        if (mc) {
            cpu->ignore_memory_transaction_failures =
                mc->ignore_memory_transaction_failures;
        }
    }

    if (dev->hotplugged) {
        cpu_synchronize_post_init(cpu);
        cpu_resume(cpu);
    }

which was executed later before.

--

Only as a result of your comment I now noticed the last part about hotplug, which looks a bit scary tbh.
I wonder if there is some automated test that covers cpu device hotplug?

And regardless of the fact that I could not see any issue, I am tempted to drop patch 21 entirely now.

Let me know what you think,

Thanks,

Claudio




> 
> On Wed, 3 Feb 2021 at 17:10, Claudio Fontana <cfontana@suse.de> wrote:
>>
>> Hi Alex,
>>
>> thanks for your review,
>>
>> On 2/3/21 5:57 PM, Alex Bennée wrote:
>>>
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>> <snip>
>>>
>>> Final comments. I think overall this series is looking pretty good
>>> although I got a bit lost at the end when we started expanding on the
>>> AccelClass.
>>> The main yuck was the start-up ordering constraint which
>>
>> To be sure, are you referring to tcg_accel_ops_init(), ie your comments towards the end of PATCH 17?
>>
>> Ciao,
>>
>> Claudio
>>
>>> would be nice to remove or failing that catch with some asserts so weird
>>> bugs don't get introduced.
>>>
>>> Paolo, is it worth picking up some of the early patches to reduce the
>>> patch delta going forward?
>>>
>>
> 
> 


