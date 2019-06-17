Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F09847C76
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 10:27:14 +0200 (CEST)
Received: from localhost ([::1]:45088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcmyv-0002OW-9H
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 04:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42556)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <groug@kaod.org>) id 1hcmxB-0001qh-Gt
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 04:25:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1hcmx7-0003MP-Pf
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 04:25:23 -0400
Received: from 2.mo173.mail-out.ovh.net ([178.33.251.49]:59196)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1hcmx7-0003IK-6J
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 04:25:21 -0400
Received: from player762.ha.ovh.net (unknown [10.109.160.153])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id C0AB1100C53
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 10:25:15 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player762.ha.ovh.net (Postfix) with ESMTPSA id 40AF26E99357;
 Mon, 17 Jun 2019 08:25:11 +0000 (UTC)
Date: Mon, 17 Jun 2019 10:25:10 +0200
From: Greg Kurz <groug@kaod.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <20190617102510.341d71a5@bahia.lan>
In-Reply-To: <20190612020723.96802-1-aik@ozlabs.ru>
References: <20190612020723.96802-1-aik@ozlabs.ru>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 5650610159675742709
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudeijedgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.251.49
Subject: Re: [Qemu-devel] [Qemu-ppc] [PATCH qemu REPOST] spapr/rtas: Force
 big endian compile for rtas
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Jun 2019 12:07:23 +1000
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

> At the moment the rtas's Makefile uses generic QEMU rules which means
> that when QEMU is compiled on a little endian system, the spapr-rtas.bin
> is compiled as little endian too which is incorrect as it is always
> executed in big endian mode.
> 

I'm naively thinking that executing code compiled as little endian
in big endian mode would result in an exception... Can you explain
how/why this ever worked ?

> This enforces -mbig by defining %.o:%.S rule as spapr-rtas.bin is
> a standalone guest binary which should not depend on QEMU flags anyway.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  pc-bios/spapr-rtas/Makefile | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/pc-bios/spapr-rtas/Makefile b/pc-bios/spapr-rtas/Makefile
> index f26dd428b79e..4b9bb1230658 100644
> --- a/pc-bios/spapr-rtas/Makefile
> +++ b/pc-bios/spapr-rtas/Makefile
> @@ -14,8 +14,11 @@ $(call set-vpath, $(SRC_PATH)/pc-bios/spapr-rtas)
>  
>  build-all: spapr-rtas.bin
>  
> +%.o: %.S
> +	$(call quiet-command,$(CCAS) -mbig -c -o $@ $<,"CCAS","$(TARGET_DIR)$@")
> +
>  %.img: %.o
> -	$(call quiet-command,$(CC) -nostdlib -o $@ $<,"Building","$(TARGET_DIR)$@")
> +	$(call quiet-command,$(CC) -nostdlib -mbig -o $@ $<,"Building","$(TARGET_DIR)$@")
>  
>  %.bin: %.img
>  	$(call quiet-command,$(OBJCOPY) -O binary -j .text $< $@,"Building","$(TARGET_DIR)$@")


