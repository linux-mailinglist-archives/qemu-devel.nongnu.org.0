Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C388331B782
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:45:23 +0100 (CET)
Received: from localhost ([::1]:35536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbNa-0002nr-Rh
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:45:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lBbIo-00070d-65; Mon, 15 Feb 2021 05:40:26 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:38703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lBbIm-0004op-6Z; Mon, 15 Feb 2021 05:40:25 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3070A869EDC7;
 Mon, 15 Feb 2021 11:40:12 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 15 Feb
 2021 11:40:10 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00469742324-fe3a-403a-9987-24d75ddb5031,
 7BA4A18A5455BE1304545F2468463C09DCDC86E8) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 15 Feb 2021 11:40:06 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 1/7] spapr_drc.c: do not call spapr_drc_detach() in
 drc_isolate_logical()
Message-ID: <20210215114006.52bf0a8d@bahia.lan>
In-Reply-To: <20210211225246.17315-2-danielhb413@gmail.com>
References: <20210211225246.17315-1-danielhb413@gmail.com>
 <20210211225246.17315-2-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: aaa81b40-981b-4136-9e2e-fa4e30ebcd2e
X-Ovh-Tracer-Id: 5731674953862453728
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrieekgdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeggedvvdethfdttddvhfeiudetvdfgjedtudetgfevheeijeeileevffegkeehnecuffhomhgrihhnpehqvghmuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_RP_RNBL=1.31, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Feb 2021 19:52:40 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> drc_isolate_logical() is used to move the DRC from the "Configured" to the
> "Available" state, erroring out if the DRC is in the unexpected "Unisolate"
> state and doing nothing (with RTAS_OUT_SUCCESS) if the DRC is already in
> "Available" or in "Unusable" state.
> 
> When moving from "Configured" to "Available", the DRC is moved to the
> LOGICAL_AVAILABLE state, a drc->unplug_requested check is done and, if true,
> spapr_drc_detach() is called.
> 
> What spapr_drc_detach() does then is:
> 
> - set drc->unplug_requested to true. In fact, this is the only place where
> unplug_request is set to true;
> - does nothing else if drc->state != drck->empty_state. If the DRC state
> is equal to drck->empty_state, spapr_drc_release() is called. For logical
> DRCs, drck->empty_state = LOGICAL_UNUSABLE.
> 
> In short, calling spapr_drc_detach() in drc_isolate_logical() does nothing. It'll
> set unplug_request to true again ('again' since it was already true - otherwise the
> function wouldn't be called), and will return without calling spapr_drc_release()
> because the DRC is not in LOGICAL_UNUSABLE, since drc_isolate_logical() just
> moved it to LOGICAL_AVAILABLE. The only place where the logical DRC is released
> is when called from drc_set_unusable(), when it is moved to the "Unusable" state.
> As it should, according to PAPR.
> 
> Even though calling spapr_drc_detach() in drc_isolate_logical() is benign, removing
> it will avoid further thought about the matter. So let's go ahead and do that.
> 

Good catch. This path looks useless for logical DRCs indeed.

> As a note, this logic was introduced in commit bbf5c878ab76. Since then, the DRC
> handling code was refactored and enhanced, and PAPR itself went through some
> changes in the DRC area as well. It is expected that some assumptions we had back
> then are now deprecated.
> 

As specified in [1]:

Please do not use lines that are longer than 76 characters in your
commit message (so that the text still shows up nicely with "git show"
in a 80-columns terminal window).

[1] https://wiki.qemu.org/Contribute/SubmitAPatch#Write_a_meaningful_commit_message

> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr_drc.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 8571d5bafe..84bd3c881f 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -132,19 +132,6 @@ static uint32_t drc_isolate_logical(SpaprDrc *drc)
>  
>      drc->state = SPAPR_DRC_STATE_LOGICAL_AVAILABLE;
>  
> -    /* if we're awaiting release, but still in an unconfigured state,
> -     * it's likely the guest is still in the process of configuring
> -     * the device and is transitioning the devices to an ISOLATED
> -     * state as a part of that process. so we only complete the
> -     * removal when this transition happens for a device in a
> -     * configured state, as suggested by the state diagram from PAPR+
> -     * 2.7, 13.4
> -     */
> -    if (drc->unplug_requested) {
> -        uint32_t drc_index = spapr_drc_index(drc);
> -        trace_spapr_drc_set_isolation_state_finalizing(drc_index);

I was expecting a change in hw/ppc/trace-events to ditch this trace,
but it is still called by drc_isolate_physical(), so we're good.

Reviewed-by: Greg Kurz <groug@kaod.org>

> -        spapr_drc_detach(drc);
> -    }
>      return RTAS_OUT_SUCCESS;
>  }
>  


