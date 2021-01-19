Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B3F2FBCBE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:43:45 +0100 (CET)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1u6a-00056n-Tw
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:43:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l1tzT-0007Pp-Oc; Tue, 19 Jan 2021 11:36:23 -0500
Received: from 6.mo52.mail-out.ovh.net ([188.165.49.222]:47533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l1tzN-0007Nx-HF; Tue, 19 Jan 2021 11:36:23 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.68])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 6903A236187;
 Tue, 19 Jan 2021 17:36:12 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 19 Jan
 2021 17:36:11 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001593d7b9b-ee2e-4d1c-81e2-8b0731279994,
 9B6877A1159CEF26E29E5BE572491BB707B5295E) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Tue, 19 Jan 2021 17:36:09 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/1] spapr.c: always pulse guest IRQ in
 spapr_core_unplug_request()
Message-ID: <20210119173609.478a72c9@bahia.lan>
In-Reply-To: <a3e54c65-817d-57ef-4b63-36394ef22d70@gmail.com>
References: <20210118193035.2089474-1-danielhb413@gmail.com>
 <20210118193035.2089474-2-danielhb413@gmail.com>
 <20210119105049.66a6a580@bahia.lan>
 <a3e54c65-817d-57ef-4b63-36394ef22d70@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: e08f71fa-d162-4b20-99b9-9de3d9a0e76d
X-Ovh-Tracer-Id: 755478839086979491
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtgdeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvdefgfdtgeeluddujeejleffgffhhedtieeggffguddvgfekvefgfeettdejheevnecuffhomhgrihhnpehrvgguhhgrthdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopeiguhhmrgesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=188.165.49.222; envelope-from=groug@kaod.org;
 helo=6.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Xujun Ma <xuma@redhat.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jan 2021 10:11:19 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> 
> 
> On 1/19/21 6:50 AM, Greg Kurz wrote:
> > On Mon, 18 Jan 2021 16:30:35 -0300
> > Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> > 
> >> Commit 47c8c915b162 fixed a problem where multiple spapr_drc_detach()
> >> requests were breaking QEMU. The solution was to just spapr_drc_detach()
> >> once, and use spapr_drc_unplug_requested() to filter whether we
> >> already detached it or not. The commit also tied the hotplug request
> >> to the guest in the same condition.
> >>
> >> Turns out that there is a reliable way for a CPU hotunplug to fail. If
> >> a guest with one CPU hotplugs a CPU1, then offline CPU0s via
> >> 'echo 0 > /sys/devices/system/cpu/cpu0/online', then attempts to
> >> hotunplug CPU1, the kernel will refuse it because it's the last online
> >> CPU of the system. Given that we're pulsing the IRQ only in the first try,
> >> in a failed attempt, all other CPU1 hotunplug attempts will fail, regardless
> >> of the online state of CPU1 in the kernel, because we're simply not letting
> >> the guest know that we want to hotunplug the device.
> >>
> >> Let's move spapr_hotplug_req_remove_by_index() back out of the
> >> "if (!spapr_drc_unplug_requested(drc))" conditional, allowing for multiple
> >> 'device_del' requests to the same CPU core to reach the guest, in case
> >> the CPU core didn't fully hotunplugged previously. Granted, this is not
> >> optimal because this can allow for multiple hotplug events queueing in the
> >> guest, like it was already possible before 47c8c915b162.
> >>
> >> Other possible alternatives would be:
> >>
> >> - check if the given CPU is the last online CPU in the guest before attempting
> >> to hotunplug. This can be done by checking 'cs->halted' and msr states of
> >> the core. Problem is, this approach will fail if the guest offlines/onlines
> >> a CPU while we're in the middle of the unplug request, given that we can't
> >> control whether the CPU core states will change in the kernel. This option
> >> sure makes it harder to allow a hotunplug failure to happen, but will never
> >> be enough to fully avoid it;
> >>
> >> - let the user handled it. In this case, we would advise the user to reboot the
> >> guest and the CPU will be removed during machine reset.
> >>
> > 
> > This is actually the only viable option since there's no way for the guest to
> > report an unplug request failure to QEMU. And this isn't specific to CPUs, eg.
> > Linux can also block unplug requests for DIMM devices if some LMB doesn't belong
> > to ZONE_MOVABLE. The solution for this is to tell linux to always put hot-plugged
> > memory in ZONE_MOVABLE.
> 
> Indeed, the lack of a 'not going to comply with this unplug request' logic in
> PAPR is the source of a lot of bugs and code in QEMU. As I said to you offline,
> I had an old idea of proposing a PAPR change to add this mechanic, and then
> QEMU can be aware of unplug requests that are denied by the kernel right before
> all the DRC state transition occurs. This will demand some changes, but the net
> result is more predictability in all unplug operations.
> 

Yes, this could probably help if PowerVM also consider this change as
valuable. Not sure on the impact this would cause on the linux and QEMU
code though.

> Note that the new LMB DT attribte doesn't fix the problems for DRCs. It just makes
> it harder to occur. There's nothing holding the kernel back from refusing LMB unplug
> requests in stress conditions (e.g. a stress-ng workload overloading all the RAM).
> 

Indeed. The use of 'movable_node' itself can be an issue as it can cause OOM
more easily for kernel allocations that cannot go to ZONE_MOVABLE.

> > 
> > Could something similar be done for CPUs ? For example, forbidding the off-lining
> > of CPU0 at the linux level : this would ensure all cores, except the one that has
> > CPU0, are always hot-unpluggable.
> 
> I don't think so. LMBs has a strong case for that extra DT flag because the OS can
> expand the kernel space to the hotplugged DIMMs and so on. As you said in the v1
> review, PAPR already mentions that offlining all VCPUs should just terminate the
> partition, so why do we need a flag to forbid CPU offlining?
> 

Problem is that CPU teardown doesn't even allow to offline the last
CPU. I cannot think of a way to bypass that cleanly and get the last
CPU of linux guest to call RTAS "stop-self" anyway... I don't think
we can implement this _feature_ of PAPR. So we need something else.

> We're dealing with a kernel restriction (always need an online CPU) that PAPR doesn't
> predicts in the spec. Not only that, but it's also a dynamic restriction. The OS can
> deny hotunplug of any of the available CPUs, as long as it is the last online. This
> puts QEMU into this weird spot we are now: we can't guarantee that the vcpu state
> will remain in the guest during the unplug request.
> 
> x86 for instance forbids offlining CPU0. I'm not sure if it's an ACPI restriction or
> kernel design choice. But this would fix the issue we're having here. Of all the
> available choices for a fix, patching the pseries kernel to forbid offlining CPU0
> looks a very sane one in my estimation.
> 

AFAICT the limitation comes from ACPI. POWER doesn't have such a restriction,
on powernv and pseries, so we would introduce it artificially as a workaround
to avoid the issue this patch is trying to address. I understand from the above
that adding a new flag in PAPR for QEMU to control this behavior has poor chances
of success. So this could be hardcoded to CPU0.

> 
> > 
> >> None of the alternatives are clear winnners, so this patch goes for the approach
> >> makes the IRQ queue of the guest prone to multiple hotunplug requests for the
> >> same CPU, but at least the user can successfully hotunplug the CPU after a failed
> >> attempt, without the need of guest reboot.
> >>
> >> Reported-by: Xujun Ma <xuma@redhat.com>
> >> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1911414
> >> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> >> ---
> >>   hw/ppc/spapr.c | 11 ++++++++++-
> >>   1 file changed, 10 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> >> index e9e3816cd3..e2f12ce413 100644
> >> --- a/hw/ppc/spapr.c
> >> +++ b/hw/ppc/spapr.c
> >> @@ -3737,8 +3737,17 @@ void spapr_core_unplug_request(HotplugHandler *hotplug_dev, DeviceState *dev,
> >>   
> >>       if (!spapr_drc_unplug_requested(drc)) {
> >>           spapr_drc_detach(drc);
> >> -        spapr_hotplug_req_remove_by_index(drc);
> >>       }
> >> +
> >> +    /*
> >> +     * spapr_hotplug_req_remove_by_index is left unguarded, out of the
> >> +     * "!spapr_drc_unplug_requested" check, to allow for multiple IRQ
> >> +     * pulses removing the same CPU core. Otherwise, in an failed hotunplug
> >> +     * attempt (e.g. the kernel will refuse to remove the last online CPU
> >> +     * core), we will never attempt it again because unplug_requested will
> >> +     * still be 'true' in that case.
> >> +     */
> >> +    spapr_hotplug_req_remove_by_index(drc);
> > 
> > This not only fire the IRQ again, it also enqueues a new event... have
> > you tried hammering QEMU with CPU hot-plug/unplug requests. I seem to
> > remember that the troubles fixed by 47c8c915b162 had more to do with
> > the DRC state machine than the hot-plug event itself, but posting the
> > same event several times during a regular hot-unplug sequence could
> > maybe cause subtle bugs as well.
> 
> I tried hammering the guest with lots of IRQ events. Aside from the dmesg
> flood in the guest kernel everything went fine. No guest breakage of any
> sort.
> 
> It is also worth noticing that the unplug_request code is protected by
> BQL. It is not possible to spam the guest queue out of control.
> 

True.

> > 
> > Honestly, this is still a band-aid : it doesn't fix anything, it just
> > gives an alternative solution to reboot when someone has done something
> > silly. I'd rather not loosen our sanity checks for such a corner case.
> 
> It doesn't fix indeed. But documenting that the user shouldn't offline CPU0
> in the kernel because QEMU can't handle unplug properly isn't fixing anything
> either.
> 

Indeed but users know that they're walking on quicksand at least.

> Thing is, our spapr code is too optimistic, and not justifiable in my opinion,

PAPR is "too much something" in a lot of aspects and this certainly
had an impact on the code. ;-)

> in all unplug code for all devices. It assumes that everything will go as
> intended, but in reality we're hoping it will work. Otherwise, we're going to
> ask the user to reboot the guest so the unplug can happen in CAS.
> 
> This change I'm making makes the CPU unplug code way more pessimistic, and it
> can open a way for device_del abuse via an IRQ spam. But in the end it will
> alleviate he situation not only of this particular bug, but all "insert a random
> reason why the kernel denied a CPU hotunplug, and now I can't unplug the
> CPU anymore" bugs in the future as well. It gives the user the choice to try
> again if something didn't go as planned. As far as I'm concerned, we should
> fire up spapr_hotplug_req_remove_by_index() from all unplug_request() calls
> of all devices regardless of unplug_request being true or not.
> 

I agree that if we go for this approach, we should fix all our unplug_request()
handlers to be consistent. BTW, what do other archs do in similar situation ?


> And if we're concerned about abuse of device_del spam, we can document that
> device_del can't be spammed in a 'unplug until it works' fashion. I'd rather
> advice the user to use device_del properly than to tell the user "if you offline
> CPUs and enter this situation, you'll need to reboot the guest".
> 

It all boils down to what "use device_del properly" does mean exactly.

> > 
> > On the other side, the at-least-one-cpu thing is a linux limitation.
> > It seems fair that linux should provide a way to mitigate the effects.
> > Like suggested above, this could be the ability to elect an individual
> > vCPU to be always on-line. Since QEMU refuses the hotplug of the boot
> > core, QEMU could maybe tell the guest to elect CPU0 through some
> > flag in the DT, like we've done recently for LMBs.
> 
> 
> As I said above, I think that patching the kernel to avoid CPU0 offlining looks
> like a viable idea.
> 

My only concern is that I don't have a clear idea on CPU offlining use
cases that could break with such a change.

> 
> I still believe that this patch should go through regardless though. I'm convinced
> that we can't be optimistic about the CPU unplug process as a whole, and advising
> the user to not spam the guest IRQ is a better option than documenting that we
> need to reset the machine to handle the unplug, because the user did something
> that the kernel fully allows, but we can't deal with and won't even allow further
> attempts at it. I mean, what are we? Windows?
> 

David, any insight here ?

> 
> 
> Thanks,
> 
> 
> DHB
> 
> 
> 
> 
> > 
> >>   }
> >>   
> >>   int spapr_core_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
> > 


