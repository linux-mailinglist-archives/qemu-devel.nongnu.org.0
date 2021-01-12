Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41002F2E5D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:49:48 +0100 (CET)
Received: from localhost ([::1]:55110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIBH-0002SB-P1
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kzHzQ-000433-Ji
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:37:32 -0500
Received: from 1.mo52.mail-out.ovh.net ([178.32.96.117]:47751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kzHzM-00043M-VY
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 06:37:32 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.188])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id C2B0D2317C8;
 Tue, 12 Jan 2021 12:37:23 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 12 Jan
 2021 12:37:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006fca78d1a-b2a6-41f2-850c-1da42999bbeb,
 D7A3512486C53AB1907B5452A8D2CB06296403FA) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Tue, 12 Jan 2021 12:37:21 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v6 11/13] spapr: PEF: prevent migration
Message-ID: <20210112123721.17c1ded7@bahia.lan>
In-Reply-To: <20210112044508.427338-12-david@gibson.dropbear.id.au>
References: <20210112044508.427338-1-david@gibson.dropbear.id.au>
 <20210112044508.427338-12-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 932dcdc1-67fa-47fd-b135-d95bb538165a
X-Ovh-Tracer-Id: 9940288802613991775
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvdehgedgudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepjhhunhdrnhgrkhgrjhhimhgrsehinhhtvghlrdgtohhm
Received-SPF: pass client-ip=178.32.96.117; envelope-from=groug@kaod.org;
 helo=1.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pair@us.ibm.com, Marcelo Tosatti <mtosatti@redhat.com>,
 brijesh.singh@amd.com, kvm@vger.kernel.org, david@redhat.com,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, pragyansri.pathi@intel.com,
 mst@redhat.com, mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, andi.kleen@intel.com,
 thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 richard.henderson@linaro.org, dgilbert@redhat.com, qemu-s390x@nongnu.org,
 jun.nakajima@intel.com,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021 15:45:06 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> We haven't yet implemented the fairly involved handshaking that will be
> needed to migrate PEF protected guests.  For now, just use a migration
> blocker so we get a meaningful error if someone attempts this (this is the
> same approach used by AMD SEV).
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/pef.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/ppc/pef.c b/hw/ppc/pef.c
> index b227dc6905..822668d9ae 100644
> --- a/hw/ppc/pef.c
> +++ b/hw/ppc/pef.c
> @@ -38,6 +38,8 @@ struct PefGuestState {
>  };
>  
>  #ifdef CONFIG_KVM
> +static Error *pef_mig_blocker;
> +
>  static int kvmppc_svm_init(Error **errp)
>  {
>      if (!kvm_check_extension(kvm_state, KVM_CAP_PPC_SECURE_GUEST)) {
> @@ -54,6 +56,11 @@ static int kvmppc_svm_init(Error **errp)
>          }
>      }
>  
> +    /* add migration blocker */
> +    error_setg(&pef_mig_blocker, "PEF: Migration is not implemented");
> +    /* NB: This can fail if --only-migratable is used */
> +    migrate_add_blocker(pef_mig_blocker, &error_fatal);
> +
>      return 0;
>  }
>  


