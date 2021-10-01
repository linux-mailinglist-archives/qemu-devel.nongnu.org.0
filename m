Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB4F41EB82
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 13:13:02 +0200 (CEST)
Received: from localhost ([::1]:41860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWGTN-0004Tk-4C
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 07:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mWGSC-0003Yv-DI
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 07:11:48 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:33633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mWGSA-0005y4-1K
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 07:11:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BB8B5C18AD6F;
 Fri,  1 Oct 2021 13:11:41 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 1 Oct
 2021 13:11:41 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0030fcabdda-fcc6-46a0-8762-c378b72c7da7,
 4BD1923EFCE0A2D5FFEE921A78BF2E0F2CE6D79C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8d528746-d893-13df-2054-5febb0d51bb9@kaod.org>
Date: Fri, 1 Oct 2021 13:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] spapr/xive: Allocate vCPU IPIs from local context
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>
References: <20210922144120.1277504-1-clg@kaod.org>
 <20210923111249.33c41068@bahia.huguette>
 <71b9a1a8-7d76-ff7c-db47-7c8e9b4d87b5@kaod.org>
 <20210924154906.59da27f7@bahia.huguette>
 <6936294c-f236-2179-cd90-d45af74e7179@kaod.org>
 <20210924191313.36c9c8e9@bahia.huguette>
 <90e2ef32-8151-e65c-d64b-de58bb5337f1@kaod.org>
 <20210928091924.2b57bec4@bahia.huguette>
 <3e375254-1f6f-f630-77f0-a73d50d3b7df@kaod.org>
 <20211001123807.296ea878@bahia.huguette>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211001123807.296ea878@bahia.huguette>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 41466f4b-21da-472c-b133-b76e763e65ec
X-Ovh-Tracer-Id: 17072301764527754147
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudekiedgfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.127,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 12:38, Greg Kurz wrote:
> On Fri, 1 Oct 2021 11:59:45 +0200
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>>>>> Maybe it would be simpler to call xive_source_is_initialized() instead of
>>>>> xive_eas_is_valid() in cases like this, e.g. hcall code since it is shared
>>>>> between emulation and KVM ?
>>>>
>>>> Yes but we need a better check than :
>>>>
>>>>        if (lisn < SPAPR_XIRQ_BASE) {
>>>>            return !!xive_get_field64(EAS_END_INDEX, xive->eat[lisn].w);
>>>>        }
>>>>
>>>> This is more an heuristic than a precise test on the "validity" of
>>>> a source at the KVM level.
>>>>
>>>
>>> I guess we should be able to get kvmppc_xive_irq_state::valid from
>>> KVM by making the KVM_DEV_XIVE_GRP_SOURCE attribute readable. Would
>>> that be enough ?
>>
>> A bit slow may be. Or an extra bit in the XiveSource 'status' field
>> to reflect KVM initialization.
>>
>> C.
>>
> 
> Something like this ?

Yes.

we need to add is/set/clr wrappers for the ASSERTED bit first. It
would clarify the code. Then add the KVM bit.

C.

> 
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index 42f72b68fc00..6eba58b0ff10 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -232,6 +232,7 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, int srcno, Error **errp)
>   {
>       SpaprXive *xive = SPAPR_XIVE(xsrc->xive);
>       uint64_t state = 0;
> +    int ret;
>   
>       assert(xive->fd != -1);
>   
> @@ -242,8 +243,15 @@ int kvmppc_xive_source_reset_one(XiveSource *xsrc, int srcno, Error **errp)
>           }
>       }
>   
> -    return kvm_device_access(xive->fd, KVM_DEV_XIVE_GRP_SOURCE, srcno, &state,
> -                             true, errp);
> +    ret = kvm_device_access(xive->fd, KVM_DEV_XIVE_GRP_SOURCE, srcno, &state,
> +                            true, errp);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    xsrc->status[srcno] |= XIVE_STATUS_KVM;
> +
> +    return 0;
>   }
>   
>   static int kvmppc_xive_source_reset(XiveSource *xsrc, Error **errp)
> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
> index 445eccfe6b73..d85520beb64a 100644
> --- a/include/hw/ppc/xive.h
> +++ b/include/hw/ppc/xive.h
> @@ -252,6 +252,7 @@ static inline hwaddr xive_source_esb_mgmt(XiveSource *xsrc, int srcno)
>    * When doing an EOI, the Q bit will indicate if the interrupt
>    * needs to be re-triggered.
>    */
> +#define XIVE_STATUS_KVM       0x8  /* Set when initialized in KVM */
>   #define XIVE_STATUS_ASSERTED  0x4  /* Extra bit for LSI */
>   #define XIVE_ESB_VAL_P        0x2
>   #define XIVE_ESB_VAL_Q        0x1
> 


