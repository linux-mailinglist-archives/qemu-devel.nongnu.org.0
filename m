Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D422FB50E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 10:53:23 +0100 (CET)
Received: from localhost ([::1]:48364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1nhR-0001ko-Kd
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 04:53:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l1nf9-0000Kk-AI; Tue, 19 Jan 2021 04:50:59 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:44377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l1nf6-0000VP-Db; Tue, 19 Jan 2021 04:50:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.250])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 09C388380458;
 Tue, 19 Jan 2021 10:50:52 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 19 Jan
 2021 10:50:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006c73a047c-f59e-4ca2-af75-fa009ff5e471,
 9B6877A1159CEF26E29E5BE572491BB707B5295E) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Tue, 19 Jan 2021 10:50:49 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/1] spapr.c: always pulse guest IRQ in
 spapr_core_unplug_request()
Message-ID: <20210119105049.66a6a580@bahia.lan>
In-Reply-To: <20210118193035.2089474-2-danielhb413@gmail.com>
References: <20210118193035.2089474-1-danielhb413@gmail.com>
 <20210118193035.2089474-2-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 7d552b86-fa1b-4145-b171-944c16729c80
X-Ovh-Tracer-Id: 12356470005877741987
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtgddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvdefgfdtgeeluddujeejleffgffhhedtieeggffguddvgfekvefgfeettdejheevnecuffhomhgrihhnpehrvgguhhgrthdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepgihumhgrsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, 18 Jan 2021 16:30:35 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> Commit 47c8c915b162 fixed a problem where multiple spapr_drc_detach()
> requests were breaking QEMU. The solution was to just spapr_drc_detach()
> once, and use spapr_drc_unplug_requested() to filter whether we
> already detached it or not. The commit also tied the hotplug request
> to the guest in the same condition.
> 
> Turns out that there is a reliable way for a CPU hotunplug to fail. If
> a guest with one CPU hotplugs a CPU1, then offline CPU0s via
> 'echo 0 > /sys/devices/system/cpu/cpu0/online', then attempts to
> hotunplug CPU1, the kernel will refuse it because it's the last online
> CPU of the system. Given that we're pulsing the IRQ only in the first try,
> in a failed attempt, all other CPU1 hotunplug attempts will fail, regardless
> of the online state of CPU1 in the kernel, because we're simply not letting
> the guest know that we want to hotunplug the device.
> 
> Let's move spapr_hotplug_req_remove_by_index() back out of the
> "if (!spapr_drc_unplug_requested(drc))" conditional, allowing for multiple
> 'device_del' requests to the same CPU core to reach the guest, in case
> the CPU core didn't fully hotunplugged previously. Granted, this is not
> optimal because this can allow for multiple hotplug events queueing in the
> guest, like it was already possible before 47c8c915b162.
> 
> Other possible alternatives would be:
> 
> - check if the given CPU is the last online CPU in the guest before attempting
> to hotunplug. This can be done by checking 'cs->halted' and msr states of
> the core. Problem is, this approach will fail if the guest offlines/onlines
> a CPU while we're in the middle of the unplug request, given that we can't
> control whether the CPU core states will change in the kernel. This option
> sure makes it harder to allow a hotunplug failure to happen, but will never
> be enough to fully avoid it;
> 
> - let the user handled it. In this case, we would advise the user to reboot the
> guest and the CPU will be removed during machine reset.
> 

This is actually the only viable option since there's no way for the guest to
report an unplug request failure to QEMU. And this isn't specific to CPUs, eg.
Linux can also block unplug requests for DIMM devices if some LMB doesn't belong
to ZONE_MOVABLE. The solution for this is to tell linux to always put hot-plugged
memory in ZONE_MOVABLE.

Could something similar be done for CPUs ? For example, forbidding the off-lining
of CPU0 at the linux level : this would ensure all cores, except the one that has
CPU0, are always hot-unpluggable.

> None of the alternatives are clear winnners, so this patch goes for the approach
> makes the IRQ queue of the guest prone to multiple hotunplug requests for the
> same CPU, but at least the user can successfully hotunplug the CPU after a failed
> attempt, without the need of guest reboot.
> 
> Reported-by: Xujun Ma <xuma@redhat.com>
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1911414
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index e9e3816cd3..e2f12ce413 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3737,8 +3737,17 @@ void spapr_core_unplug_request(HotplugHandler *hotplug_dev, DeviceState *dev,
>  
>      if (!spapr_drc_unplug_requested(drc)) {
>          spapr_drc_detach(drc);
> -        spapr_hotplug_req_remove_by_index(drc);
>      }
> +
> +    /*
> +     * spapr_hotplug_req_remove_by_index is left unguarded, out of the
> +     * "!spapr_drc_unplug_requested" check, to allow for multiple IRQ
> +     * pulses removing the same CPU core. Otherwise, in an failed hotunplug
> +     * attempt (e.g. the kernel will refuse to remove the last online CPU
> +     * core), we will never attempt it again because unplug_requested will
> +     * still be 'true' in that case.
> +     */
> +    spapr_hotplug_req_remove_by_index(drc);

This not only fire the IRQ again, it also enqueues a new event... have
you tried hammering QEMU with CPU hot-plug/unplug requests. I seem to
remember that the troubles fixed by 47c8c915b162 had more to do with
the DRC state machine than the hot-plug event itself, but posting the
same event several times during a regular hot-unplug sequence could
maybe cause subtle bugs as well.

Honestly, this is still a band-aid : it doesn't fix anything, it just
gives an alternative solution to reboot when someone has done something
silly. I'd rather not loosen our sanity checks for such a corner case.

On the other side, the at-least-one-cpu thing is a linux limitation.
It seems fair that linux should provide a way to mitigate the effects.
Like suggested above, this could be the ability to elect an individual
vCPU to be always on-line. Since QEMU refuses the hotplug of the boot
core, QEMU could maybe tell the guest to elect CPU0 through some
flag in the DT, like we've done recently for LMBs.

>  }
>  
>  int spapr_core_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,


