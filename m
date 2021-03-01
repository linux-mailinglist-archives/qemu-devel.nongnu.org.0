Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC9E327B5A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 10:58:52 +0100 (CET)
Received: from localhost ([::1]:36806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGfKE-0004zk-PM
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 04:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lGfJK-0004Tt-5M; Mon, 01 Mar 2021 04:57:54 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:39647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lGfJH-0004En-VT; Mon, 01 Mar 2021 04:57:53 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 505868BFE692;
 Mon,  1 Mar 2021 10:57:40 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Mar 2021
 10:57:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00198da9973-a254-42e9-b991-e50043e81002,
 479CA1392526D135F52AAC0E93683906E8F354F3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 1 Mar 2021 10:57:36 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/1] qemu_timer.c: add timer_deadline_ms() helper
Message-ID: <20210301105736.794f4c87@bahia.lan>
In-Reply-To: <20210225212914.366462-1-danielhb413@gmail.com>
References: <20210225212914.366462-1-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: aa89fa0b-568f-4051-b51a-9129a3b7a4d8
X-Ovh-Tracer-Id: 13444089313879234979
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrleekgddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepphgsohhniihinhhisehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Feb 2021 18:29:14 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> The pSeries machine is using QEMUTimer internals to return the timeout
> in seconds for a timer object, in hw/ppc/spapr.c, function
> spapr_drc_unplug_timeout_remaining_sec().
> 
> Create a helper in qemu-timer.c to retrieve the deadline for a QEMUTimer
> object, in ms, to avoid exposing timer internals to the PPC code.
> 
> CC: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
> 
> This patch is applicable on top of David's ppc-for-6.0.
> 
>  hw/ppc/spapr_drc.c   |  5 ++---
>  include/qemu/timer.h |  8 ++++++++
>  util/qemu-timer.c    | 13 +++++++++++++
>  3 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 8c4997d795..98b626acf9 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -421,9 +421,8 @@ void spapr_drc_unplug_request(SpaprDrc *drc)
>  
>  int spapr_drc_unplug_timeout_remaining_sec(SpaprDrc *drc)
>  {
> -    if (drc->unplug_requested && timer_pending(drc->unplug_timeout_timer)) {
> -        return (qemu_timeout_ns_to_ms(drc->unplug_timeout_timer->expire_time) -
> -                qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL)) / 1000;
> +    if (drc->unplug_requested) {
> +        return timer_deadline_ms(drc->unplug_timeout_timer) / 1000;
>      }

Nice improvement. This also removes a dependency on QEMU_CLOCK_VIRTUAL
that we shouldn't need since we've already passed it to timer_new_ms()
during realize.

It seems that spapr_drc_start_unplug_timeout_timer() ...

static void spapr_drc_start_unplug_timeout_timer(SpaprDrc *drc)
{
    SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);

    if (drck->unplug_timeout_seconds != 0) {
        timer_mod(drc->unplug_timeout_timer,
                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) +
                  drck->unplug_timeout_seconds * 1000);
    }
}

...  could be simplified as well with a timer_mod_deadline_ms() helper,
but this can go to another patch.

>  
>      return 0;
> diff --git a/include/qemu/timer.h b/include/qemu/timer.h
> index 1678238384..5e76e3f8c2 100644
> --- a/include/qemu/timer.h
> +++ b/include/qemu/timer.h
> @@ -795,6 +795,14 @@ static inline int64_t get_max_clock_jump(void)
>      return 60 * NANOSECONDS_PER_SECOND;
>  }
>  
> +/**
> + * timer_deadline_ms:
> + *
> + * Returns the remaining miliseconds for @timer to expire, or zero
> + * if the timer is no longer pending.
> + */
> +int64_t timer_deadline_ms(QEMUTimer *timer);
> +
>  /*
>   * Low level clock functions
>   */
> diff --git a/util/qemu-timer.c b/util/qemu-timer.c
> index 81c28af517..3a03a63daa 100644
> --- a/util/qemu-timer.c
> +++ b/util/qemu-timer.c
> @@ -243,6 +243,19 @@ int64_t timerlist_deadline_ns(QEMUTimerList *timer_list)
>      return delta;
>  }
>  
> +/*
> + * Returns the time remaining for the deadline, in ms.
> + */
> +int64_t timer_deadline_ms(QEMUTimer *timer)
> +{
> +    if (timer_pending(timer)) {
> +        return qemu_timeout_ns_to_ms(timer->expire_time) -
> +               qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);

This is assuming that the timer belongs to the QEMU_CLOCK_VIRTUAL
clock, which looks awkward for a presumably generic function.

Correct clock type can be accessed through ->timer_list :

	qemu_clock_get_ms(timer->timer_list->clock->type)

> +    }
> +
> +    return 0;
> +}
> +
>  /* Calculate the soonest deadline across all timerlists attached
>   * to the clock. This is used for the icount timeout so we
>   * ignore whether or not the clock should be used in deadline


