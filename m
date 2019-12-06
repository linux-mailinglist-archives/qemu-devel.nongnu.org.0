Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF0511570C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 19:18:38 +0100 (CET)
Received: from localhost ([::1]:43156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idIBZ-00005y-0R
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 13:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39439)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1idGwL-0005A1-1N
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 11:58:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1idGwI-0007pi-SN
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 11:58:48 -0500
Received: from 8.mo178.mail-out.ovh.net ([46.105.74.227]:47681)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1idGwI-0007j8-Kr
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 11:58:46 -0500
Received: from player711.ha.ovh.net (unknown [10.108.16.68])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 10F8A84B9B
 for <qemu-devel@nongnu.org>; Fri,  6 Dec 2019 17:58:43 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player711.ha.ovh.net (Postfix) with ESMTPSA id EBFDACE26FC2;
 Fri,  6 Dec 2019 16:58:41 +0000 (UTC)
Date: Fri, 6 Dec 2019 17:58:40 +0100
From: Greg Kurz <groug@kaod.org>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] exec: Remove the duplicated check in parse_cpu_option()
Message-ID: <20191206175840.06507c32@bahia.w3ibm.bluemix.net>
In-Reply-To: <20191206063337.39764-1-gshan@redhat.com>
References: <20191206063337.39764-1-gshan@redhat.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9854720412128156054
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudekfedgledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.74.227
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  6 Dec 2019 17:33:37 +1100
Gavin Shan <gshan@redhat.com> wrote:

> The @cpu_option shouldn't be NULL, otherwise assertion from g_strsplit()
> should be raised as below message indicates. So it's meaningless to validate
> @model_pices[0] in parse_cpu_option() as it shouldn't be NULL either.
> 
>    qemu-system-aarch64: GLib: g_strsplit: assertion 'string != NULL' failed
> 
> This just removes the check and unused message.
> 

Hrm... the check isn't about @cpu_option being NULL. It is about filtering out
invalid syntaxes like:

-cpu ''

or

-cpu ,some-prop

> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  exec.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/exec.c b/exec.c
> index ffdb518535..3cff459e43 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -963,11 +963,6 @@ const char *parse_cpu_option(const char *cpu_option)
>      const char *cpu_type;
>  
>      model_pieces = g_strsplit(cpu_option, ",", 2);
> -    if (!model_pieces[0]) {
> -        error_report("-cpu option cannot be empty");
> -        exit(1);
> -    }
> -
>      oc = cpu_class_by_name(CPU_RESOLVING_TYPE, model_pieces[0]);
>      if (oc == NULL) {
>          error_report("unable to find CPU model '%s'", model_pieces[0]);


