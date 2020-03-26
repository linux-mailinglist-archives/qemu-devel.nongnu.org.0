Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AB6193EBA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 13:19:29 +0100 (CET)
Received: from localhost ([::1]:50622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHRTr-0000i8-Ra
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 08:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43898)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1jHRT0-000877-9u
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 08:18:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1jHRSz-0003dO-2H
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 08:18:34 -0400
Received: from 10.mo5.mail-out.ovh.net ([46.105.52.148]:54998)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1jHRSy-0003cg-SB
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 08:18:33 -0400
Received: from player687.ha.ovh.net (unknown [10.110.103.169])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id C32142753BC
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 13:18:30 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player687.ha.ovh.net (Postfix) with ESMTPSA id CBCBA10C5335F;
 Thu, 26 Mar 2020 12:18:25 +0000 (UTC)
Date: Thu, 26 Mar 2020 13:18:24 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC for-5.1 3/4] spapr: Fix failure path for attempting to hot
 unplug PCI bridges
Message-ID: <20200326131824.4601ae68@bahia.lan>
In-Reply-To: <20200326054009.454477-4-david@gibson.dropbear.id.au>
References: <20200326054009.454477-1-david@gibson.dropbear.id.au>
 <20200326054009.454477-4-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11355263512195733990
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudehiedgfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheikeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.52.148
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
Cc: aik@ozlabs.ru, qemu-ppc@nongnu.org, clg@kaod.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Mar 2020 16:40:08 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> For various technical reasons we can't currently allow unplug a PCI to PCI
> bridge on the pseries machine.  spapr_pci_unplug_request() correctly
> generates an error message if that's attempted.
> 
> But.. if the given errp is not error_abort or error_fatal,

Which is the always case when trying to unplug a device AFAICT:

void qdev_unplug(DeviceState *dev, Error **errp)
{
    DeviceClass *dc = DEVICE_GET_CLASS(dev);
    HotplugHandler *hotplug_ctrl;
    HotplugHandlerClass *hdc;
    Error *local_err = NULL;

    [...]
    hdc = HOTPLUG_HANDLER_GET_CLASS(hotplug_ctrl);
    if (hdc->unplug_request) {
        hotplug_handler_unplug_request(hotplug_ctrl, dev, &local_err);

And anyway, spapr_pci_unplug_request() shouldn't rely on the caller
passing &error_fatal or &error_abort to do the right thing. Calling
error_setg() without returning right away is a dangerous practice
since it would cause a subsequent call to error_setg() with the
same errp to abort QEMU.

> it doesn't actually stop trying to unplug the bridge anyway.
> 

This looks like a bug fix that could go to 5.0 IMHO.

Maybe add this tag ?

   Fixes: 14e714900f6b "spapr: Allow hot plug/unplug of PCI bridges and devices under PCI bridges"

> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 709a52780d..55ca9dee1e 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1663,6 +1663,7 @@ static void spapr_pci_unplug_request(HotplugHandler *plug_handler,
>  
>          if (pc->is_bridge) {
>              error_setg(errp, "PCI: Hot unplug of PCI bridges not supported");
> +            return;
>          }
>  
>          /* ensure any other present functions are pending unplug */


