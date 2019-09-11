Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D261EAF708
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 09:37:49 +0200 (CEST)
Received: from localhost ([::1]:47460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7xCG-00080p-TB
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 03:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1i7xBL-0007Tj-56
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 03:36:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1i7xBJ-00027a-Vh
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 03:36:50 -0400
Received: from 10.mo178.mail-out.ovh.net ([46.105.76.150]:50642)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1i7xBJ-00025s-Pr
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 03:36:49 -0400
Received: from player718.ha.ovh.net (unknown [10.109.160.106])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id EFD0978617
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 09:36:47 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player718.ha.ovh.net (Postfix) with ESMTPSA id 3EACB99A0F45;
 Wed, 11 Sep 2019 07:36:39 +0000 (UTC)
Date: Wed, 11 Sep 2019 09:36:38 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20190911093638.6e829814@bahia.lan>
In-Reply-To: <20190911040452.8341-4-david@gibson.dropbear.id.au>
References: <20190911040452.8341-1-david@gibson.dropbear.id.au>
 <20190911040452.8341-4-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11821667547947833830
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrtddugdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.76.150
Subject: Re: [Qemu-devel] [PATCH 3/7] spapr: Fixes a leak in CAS
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, clg@kaod.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Sep 2019 14:04:48 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> From: Alexey Kardashevskiy <aik@ozlabs.ru>
> 
> Add a missing g_free(fdt) if the resulting tree is bigger
> than the space allocated by SLOF.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index e03e874d94..d93dacd483 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1024,6 +1024,7 @@ int spapr_h_cas_compose_response(SpaprMachineState *spapr,
>      _FDT((fdt_pack(fdt)));
>  
>      if (fdt_totalsize(fdt) + sizeof(hdr) > size) {
> +        g_free(fdt);
>          trace_spapr_cas_failed(size);
>          return -1;
>      }


