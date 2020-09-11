Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9297265B88
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 10:26:17 +0200 (CEST)
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGeNs-0007An-Rf
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 04:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kGeND-0006ks-6b; Fri, 11 Sep 2020 04:25:35 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:36943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kGeNB-0000CI-5g; Fri, 11 Sep 2020 04:25:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.249])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 847E159E918F;
 Fri, 11 Sep 2020 10:25:02 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 11 Sep
 2020 10:25:01 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0068ceae081-2b1b-4941-91b9-dacf139958c7,
 864FBEA0465FE1F0C66A9C6AC37977A76827B8ED) smtp.auth=groug@kaod.org
Date: Fri, 11 Sep 2020 10:25:00 +0200
From: Greg Kurz <groug@kaod.org>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH] spapr: Handle HPT allocation failure in nested guest
Message-ID: <20200911102500.1315ca5c@bahia.lan>
In-Reply-To: <20200911043123.204162-1-farosas@linux.ibm.com>
References: <20200911043123.204162-1-farosas@linux.ibm.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: cbde035a-5fbe-4591-874c-84fb515fb15d
X-Ovh-Tracer-Id: 3773453541982968288
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudehledgtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 02:19:56
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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

On Fri, 11 Sep 2020 01:31:23 -0300
Fabiano Rosas <farosas@linux.ibm.com> wrote:

> The nested KVM code does not yet support HPT guests. Calling the
> KVM_CAP_PPC_ALLOC_HTAB ioctl currently leads to KVM setting the guest
> as HPT and erroneously executing code in L1 that should only run in
> hypervisor mode, leading to an exception in the L1 vcpu thread when it
> enters the nested guest.
> 
> This can be reproduced with -machine max-cpu-compat=power8 in the L2
> guest command line.
> 
> The KVM code has since been modified to fail the ioctl when running in

Well, this isn't technically true for now. The KVM patch hasn't been merged
yet, but I guess it's okay to merge the QEMU patch anyway since it shouldn't
break older KVMs.

> a nested environment so QEMU needs to be able to handle that. This
> patch provides an error message informing the user about the lack of
> support for HPT in nested guests.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  hw/ppc/spapr.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 9bce1892b5..ea2c755310 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1483,6 +1483,12 @@ void spapr_reallocate_hpt(SpaprMachineState *spapr, int shift,
>      spapr_free_hpt(spapr);
>  
>      rc = kvmppc_reset_htab(shift);
> +
> +    if (rc == -EOPNOTSUPP) {

As noted on the kvm-ppc list, from a POSIX standpoint it seems that
ENOTSUP would be more appropriate... but since linux only knows
about EOPNOTSUPP and it has an unrelated and poorly named ENOTSUPP,
I guess it is okay to keep EOPNOTSUPP for the sake of consistency.

Reviewed-by: Greg Kurz <groug@kaod.org>

> +        error_setg(errp, "HPT not supported in nested guests");
> +        return;
> +    }
> +
>      if (rc < 0) {
>          /* kernel-side HPT needed, but couldn't allocate one */
>          error_setg_errno(errp, errno,


