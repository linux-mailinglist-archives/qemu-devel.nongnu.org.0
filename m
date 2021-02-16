Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1DE31CD36
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:52:32 +0100 (CET)
Received: from localhost ([::1]:50398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2eM-0006sz-Gy
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lC2d6-0006NU-Ts
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:51:12 -0500
Received: from 2.mo52.mail-out.ovh.net ([178.33.105.233]:37432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lC2d3-0003yV-3w
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:51:12 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.42])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 919482411B6;
 Tue, 16 Feb 2021 16:51:05 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 16 Feb
 2021 16:51:03 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005ad1fba23-1b28-4b06-9e1b-7280bb190662,
 18E752744DD7A5F94FE4BC27DA0A342EBB233BD3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 91.175.254.3
Date: Tue, 16 Feb 2021 16:50:59 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v3 2/7] spapr_pci.c: simplify spapr_pci_unplug_request()
 function handling
Message-ID: <20210216165059.284d2a21@bahia.lan>
In-Reply-To: <20210211225246.17315-3-danielhb413@gmail.com>
References: <20210211225246.17315-1-danielhb413@gmail.com>
 <20210211225246.17315-3-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: fd8b34b2-e638-4605-9a71-34ce84500ec8
X-Ovh-Tracer-Id: 16855003080595839456
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrjedtgdekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=178.33.105.233; envelope-from=groug@kaod.org;
 helo=2.mo52.mail-out.ovh.net
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Feb 2021 19:52:41 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> When hotunplugging a PCI function we'll branch out the logic in two cases,
> function zero and non-zero. If non-zero, we'll call spapr_drc_detach() and
> nothing else. If it's function zero, we'll loop it once between all the
> functions in the slot to call spapr_drc_detach() on them, and afterwards
> we'll do another backwards loop where we'll signal the event to the guest.
> 
> We can simplify this logic. We can ignore all the DRC handling for non-zero
> functions, since we'll end up doing that regardless when unplugging function
> zero. And for function zero, everything can be done in a single loop, since
> tt doesn't matter if we end up marking the function DRCs as unplug pending in
> backwards order or not, as long as we call spapr_drc_detach() before issuing
> the hotunplug event to the guest.
> 
> This will also avoid a possible scenario where the user starts to hotunplug
> the slot, starting with a non-zero function, and then delays/forgets to
> hotunplug function zero afterwards. This would keep the function DRC marked
> as unplug requested indefinitely.
> 

... or until the guest is reset, which will no longer happen with this
patch applied, i.e. breaks the long standing policy that machine reset
causes pending hot-unplug requests to succeed. I don't see an obvious
reason to special case non-zero PCI functions.

> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr_pci.c | 44 ++++++++++++++++----------------------------
>  1 file changed, 16 insertions(+), 28 deletions(-)
> 
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index f1c7479816..1791d98a49 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1709,38 +1709,26 @@ static void spapr_pci_unplug_request(HotplugHandler *plug_handler,
>              return;
>          }
>  
> -        /* ensure any other present functions are pending unplug */
> -        if (PCI_FUNC(pdev->devfn) == 0) {
> -            for (i = 1; i < 8; i++) {
> -                func_drc = drc_from_devfn(phb, chassis, PCI_DEVFN(slotnr, i));
> -                func_drck = SPAPR_DR_CONNECTOR_GET_CLASS(func_drc);
> -                state = func_drck->dr_entity_sense(func_drc);
> -                if (state == SPAPR_DR_ENTITY_SENSE_PRESENT
> -                    && !spapr_drc_unplug_requested(func_drc)) {
> -                    /*
> -                     * Attempting to remove function 0 of a multifunction
> -                     * device will will cascade into removing all child
> -                     * functions, even if their unplug weren't requested
> -                     * beforehand.
> -                     */
> -                    spapr_drc_detach(func_drc);
> -                }
> -            }
> +        /*
> +         * The hotunplug itself will occur when unplugging function 0,
> +         * regardless of marking any other functions DRCs as pending
> +         * unplug beforehand (since 02a1536eee33).
> +         */
> +        if (PCI_FUNC(pdev->devfn) != 0) {
> +            return;
>          }
>  
> -        spapr_drc_detach(drc);
> +        for (i = 7; i >= 0; i--) {
> +            func_drc = drc_from_devfn(phb, chassis, PCI_DEVFN(slotnr, i));
> +            func_drck = SPAPR_DR_CONNECTOR_GET_CLASS(func_drc);
> +            state = func_drck->dr_entity_sense(func_drc);
>  
> -        /* if this isn't func 0, defer unplug event. otherwise signal removal
> -         * for all present functions
> -         */
> -        if (PCI_FUNC(pdev->devfn) == 0) {
> -            for (i = 7; i >= 0; i--) {
> -                func_drc = drc_from_devfn(phb, chassis, PCI_DEVFN(slotnr, i));
> -                func_drck = SPAPR_DR_CONNECTOR_GET_CLASS(func_drc);
> -                state = func_drck->dr_entity_sense(func_drc);
> -                if (state == SPAPR_DR_ENTITY_SENSE_PRESENT) {
> -                    spapr_hotplug_req_remove_by_index(func_drc);
> +            if (state == SPAPR_DR_ENTITY_SENSE_PRESENT) {
> +                /* Mark the DRC as requested unplug if needed. */
> +                if (!spapr_drc_unplug_requested(func_drc)) {
> +                    spapr_drc_detach(func_drc);
>                  }
> +                spapr_hotplug_req_remove_by_index(func_drc);
>              }
>          }
>      }


