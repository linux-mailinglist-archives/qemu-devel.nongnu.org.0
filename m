Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EEF2F2DCE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:22:47 +0100 (CET)
Received: from localhost ([::1]:35860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHl8-0003Or-2G
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kzH5m-0004yw-Eb
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:40:02 -0500
Received: from 3.mo51.mail-out.ovh.net ([188.165.32.156]:34556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kzH5j-0001XI-8K
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:40:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.98])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 1B305256F17;
 Tue, 12 Jan 2021 11:39:51 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 12 Jan
 2021 11:39:50 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0064082f10f-1a97-47d7-b54e-cbd194b2417e,
 D7A3512486C53AB1907B5452A8D2CB06296403FA) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Tue, 12 Jan 2021 11:39:47 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v6 04/13] confidential guest support: Move side effect
 out of machine_set_memory_encryption()
Message-ID: <20210112113947.4419cca2@bahia.lan>
In-Reply-To: <20210112044508.427338-5-david@gibson.dropbear.id.au>
References: <20210112044508.427338-1-david@gibson.dropbear.id.au>
 <20210112044508.427338-5-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 4600777d-acbe-4a0f-a9be-16b23e926f56
X-Ovh-Tracer-Id: 8968637186831391071
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvdehgedgudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepjhhunhdrnhgrkhgrjhhimhgrsehinhhtvghlrdgtohhm
Received-SPF: pass client-ip=188.165.32.156; envelope-from=groug@kaod.org;
 helo=3.mo51.mail-out.ovh.net
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

On Tue, 12 Jan 2021 15:44:59 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> When the "memory-encryption" property is set, we also disable KSM
> merging for the guest, since it won't accomplish anything.
> 
> We want that, but doing it in the property set function itself is
> thereoretically incorrect, in the unlikely event of some configuration
> environment that set the property then cleared it again before
> constructing the guest.
> 
> More importantly, it makes some other cleanups we want more difficult.
> So, instead move this logic to machine_run_board_init() conditional on
> the final value of the property.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/core/machine.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index de3b8f1b31..8909117d80 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -437,14 +437,6 @@ static void machine_set_memory_encryption(Object *obj, const char *value,
>  
>      g_free(ms->memory_encryption);
>      ms->memory_encryption = g_strdup(value);
> -
> -    /*
> -     * With memory encryption, the host can't see the real contents of RAM,
> -     * so there's no point in it trying to merge areas.
> -     */
> -    if (value) {
> -        machine_set_mem_merge(obj, false, errp);
> -    }
>  }
>  
>  static bool machine_get_nvdimm(Object *obj, Error **errp)
> @@ -1166,6 +1158,15 @@ void machine_run_board_init(MachineState *machine)
>                      cc->deprecation_note);
>      }
>  
> +    if (machine->memory_encryption) {
> +        /*
> +         * With memory encryption, the host can't see the real
> +         * contents of RAM, so there's no point in it trying to merge
> +         * areas.
> +         */
> +        machine_set_mem_merge(OBJECT(machine), false, &error_abort);
> +    }
> +
>      machine_class->init(machine);
>      phase_advance(PHASE_MACHINE_INITIALIZED);
>  }


