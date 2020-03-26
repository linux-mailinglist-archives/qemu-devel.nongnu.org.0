Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CF3193ED7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 13:28:50 +0100 (CET)
Received: from localhost ([::1]:50710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHRcv-0004Sv-PF
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 08:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45054)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1jHRc1-0003mc-5n
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 08:27:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1jHRc0-0000um-5Z
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 08:27:53 -0400
Received: from 8.mo3.mail-out.ovh.net ([87.98.172.249]:44604)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1jHRby-0000tO-B6
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 08:27:50 -0400
Received: from player746.ha.ovh.net (unknown [10.108.54.36])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 7E0B6241B42
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 13:27:46 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id 5E30610E36D51;
 Thu, 26 Mar 2020 12:27:41 +0000 (UTC)
Date: Thu, 26 Mar 2020 13:27:40 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC for-5.1 4/4] spapr: Don't allow unplug of NVLink2 devices
Message-ID: <20200326132740.6f305012@bahia.lan>
In-Reply-To: <20200326054009.454477-5-david@gibson.dropbear.id.au>
References: <20200326054009.454477-1-david@gibson.dropbear.id.au>
 <20200326054009.454477-5-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11511763599024888294
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudehiedggedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejgeeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.172.249
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

On Thu, 26 Mar 2020 16:40:09 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> Currently, we can't properly handle unplug of NVLink2 devices, because we
> don't have code to tear down their special memory resources.  There's not
> a lot of impetus to implement that. Since hardware NVLink2 devices can't
> be hot unplugged, the guest side drivers don't usually support unplug
> anyway.
> 
> Therefore, simply prevent unplug of NVLink2 devices.
> 

This could maybe considered as a valid fix for 5.0 since this prevents
guest crashes IIUC. But since this requires the two preliminary cleanup
patches, I understand you may prefer to postpone that to 5.1.

> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_pci.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 55ca9dee1e..5c8262413a 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1666,6 +1666,11 @@ static void spapr_pci_unplug_request(HotplugHandler *plug_handler,
>              return;
>          }
>  
> +        if (spapr_phb_is_nvlink_dev(pdev, phb)) {
> +            error_setg(errp, "PCI: Cannot unplug NVLink2 devices");
> +            return;
> +        }
> +
>          /* ensure any other present functions are pending unplug */
>          if (PCI_FUNC(pdev->devfn) == 0) {
>              for (i = 1; i < 8; i++) {


