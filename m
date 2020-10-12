Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF6228C249
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 22:26:20 +0200 (CEST)
Received: from localhost ([::1]:38868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS4Oh-0007sc-PE
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 16:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kS4NR-0006sA-89; Mon, 12 Oct 2020 16:25:01 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:46841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kS4NP-0001Kw-5j; Mon, 12 Oct 2020 16:25:00 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.173])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7E55764E867D;
 Mon, 12 Oct 2020 22:24:55 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 12 Oct
 2020 22:24:54 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0068884dd26-cfac-440c-9282-1c09ebc94eac,
 830CACE26F9FD03FB18D3405BC9B9D6A151429CC) smtp.auth=groug@kaod.org
Date: Mon, 12 Oct 2020 22:24:53 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 4/4] spapr: Make spapr_cpu_core_unrealize() idempotent
Message-ID: <20201012222453.054dbbf8@bahia.lan>
In-Reply-To: <160251600753.796881.11787439223917154767.stgit@bahia.lan>
References: <160251562222.796881.8197386060416409319.stgit@bahia.lan>
 <160251600753.796881.11787439223917154767.stgit@bahia.lan>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 574e15e8-89a2-4d1b-9b24-85b1545b11b2
X-Ovh-Tracer-Id: 13517272808485067229
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrheejgdduheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 16:24:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Oct 2020 17:20:07 +0200
Greg Kurz <groug@kaod.org> wrote:

> spapr_cpu_core_realize() has an err_unrealize label which partially
> duplicates the code of spapr_cpu_core_realize().
> 
> Let's make spapr_cpu_core_unrealize() idempotent and call it instead.
> The registration and unregistration of the reset handler are moved
> around to simplify the code even more.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---

Hmmm... this one need some more care because spapr_unrealize_vcpu()
because isn't idempotent. Please ignore it.

>  hw/ppc/spapr_cpu_core.c |   21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index cffd74f542ba..e3fd81eb9741 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -227,11 +227,13 @@ static void spapr_cpu_core_unrealize(DeviceState *dev)
>      CPUCore *cc = CPU_CORE(dev);
>      int i;
>  
> -    qemu_unregister_reset(spapr_cpu_core_reset_handler, sc);
> -
>      for (i = 0; i < cc->nr_threads; i++) {
> -        spapr_unrealize_vcpu(sc->threads[i], sc);
> +        if (sc->threads[i]) {
> +            spapr_unrealize_vcpu(sc->threads[i], sc);
> +        }
>      }
> +
> +    qemu_unregister_reset(spapr_cpu_core_reset_handler, sc);
>  }
>  
>  static bool spapr_realize_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr,
> @@ -326,19 +328,14 @@ static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
>          }
>      }
>  
> +    qemu_register_reset(spapr_cpu_core_reset_handler, sc);
> +
>      for (j = 0; j < cc->nr_threads; j++) {
>          if (!spapr_realize_vcpu(sc->threads[j], spapr, sc, errp)) {
> -            goto err_unrealize;
> +            spapr_cpu_core_unrealize(dev);
> +            return;
>          }
>      }
> -
> -    qemu_register_reset(spapr_cpu_core_reset_handler, sc);
> -    return;
> -
> -err_unrealize:
> -    while (--j >= 0) {
> -        spapr_unrealize_vcpu(sc->threads[j], sc);
> -    }
>  }
>  
>  static Property spapr_cpu_core_properties[] = {
> 
> 
> 


