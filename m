Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13662C0125
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 09:11:35 +0100 (CET)
Received: from localhost ([::1]:38898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh6we-0007NK-W0
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 03:11:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kh6uG-0005FF-GI
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 03:09:04 -0500
Received: from 2.mo51.mail-out.ovh.net ([178.33.255.19]:39346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kh6uC-0006dS-E0
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 03:09:04 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.244])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id C02472390DE;
 Mon, 23 Nov 2020 09:05:54 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 23 Nov
 2020 09:04:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005dd73fef1-5c49-447c-bea4-62c1a9d32f82,
 AF84A700016AED6247F1F5B9AC1D14952D0C96A6) smtp.auth=clg@kaod.org
Subject: Re: [PATCH for-6.0 0/8] spapr: Address the confusion between IPI
 numbers and vCPU ids
To: Greg Kurz <groug@kaod.org>, <qemu-devel@nongnu.org>
References: <20201120174646.619395-1-groug@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <97e23014-efa1-4ea3-95dc-1686ef097cf5@kaod.org>
Date: Mon, 23 Nov 2020 09:04:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120174646.619395-1-groug@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2b73b67b-21f0-4cf7-9386-a058e130efcb
X-Ovh-Tracer-Id: 7861877575827229664
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeghedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedvieeufefgvdfgvdetvdefvdejtedukeetudfffeekgfdvvedvtefhffdugeegtdenucffohhmrghinhepqhgvmhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 6:46 PM, Greg Kurz wrote:
> A regression was recently fixed in the sPAPR XIVE code for QEMU 5.2
> RC3 [1]. It boiled down to a confusion between IPI numbers and vCPU
> ids, which happen to be numerically equal in general, but are really
> different entities that can diverge in some setups. When this happens,
> we end up misconfiguring XIVE in a way that is almost fatal for the
> guest.
> 
> The confusion comes from XICS which has historically assumed equality
> between interrupt server numbers and vCPU ids, as mentionned in a
> comment back from 2011 in the linux kernel icp_native_init_one_node()
> function:
> 
>     /* This code does the theorically broken assumption that the interrupt
>      * server numbers are the same as the hard CPU numbers.
>      * This happens to be the case so far but we are playing with fire...
>      * should be fixed one of these days. -BenH.
>      */
> 
> This assumption crept into QEMU through the "ibm,interrupt-server-ranges"
> property of the "interrupt-controller" node in the DT. This property
> contains ranges of consecutive vCPU ids defined as (first id, # of ids).
> In the case of QEMU, we define a single range starting from 0 up to the
> highest vCPU id, as returned by spapr_max_server_number(). This has
> always been associated to the "nr_servers" wording when naming variables
> or function arguments. When XIVE got added, we introduced an sPAPR IRQ
> abstraction to be able to control several interrupt controller backends.
> The sPAPR IRQ base class provides a dt() handler used to populate the
> "interrupt-controller" node in the DT. This handler takes an "nr_server"
> argument inherited from XICS and we ended up using it to populate the
> "ibm,xive-lisn-ranges" property used with XIVE, which has completely
> different semantics. It contain ranges of interrupt numbers that the
> guest can use for any purpose. Since one obvious purpose is IPI, its
> first range should just be able to accomodate all possible vCPUs.

To clarify, PAPR says it is a requirement :

  "The first range will contain at least one per possible thread in the 
   partition."

The regression showed that we were not initializing correctly this range 
in QEMU/KVM. I an not even sure it had the correct size either since
we were anyhow initializing 4096 IPIs.

> In the case of QEMU, we define a single range starting from 0 up
> to "nr_server" but we should rather size it to the number of vCPUs
> actually (ie. smp.max_cpus).

ah. And so spapr_max_server_number(spapr) is crap ? This is starting
to be complex to follow :/
 
> This series aims at getting rid of the "nr_server" argument in the
> sPAPR IC handlers. Since both the highest possible vCPU id and the
> maximum number of vCPUs are invariants for XICS and XIVE respectively,

What XIVE cares about is the number of possible IPIs and the number
of vCPUs since we deduced from that the number of event queue 
descriptors, which is another XIVE structure.

> let's make them device properties to be configured by the machine when
> it creates the interrupt controllers and use them where needed.
> 
> This doesn't cause any visible change to setups using the default
> VSMT machine settings. This changes "ibm,xive-lisn-ranges" for
> setups that mess with VSMT, but this is acceptable since linux
> only allocates one interrupt per vCPU and the higher part of the
> range was never used.

This range is only used for vCPUs. 

C.

> [1] https://git.qemu.org/?p=qemu.git;a=commit;h=6d24795ee7e3199d199d3c415312c93382ad1807
> 
> Greg Kurz (8):
>   spapr/xive: Turn some sanity checks into assertions
>   spapr/xive: Introduce spapr_xive_nr_ends()
>   spapr/xive: Add "nr-servers" property
>   spapr/xive: Add "nr-ipis" property
>   spapr/xics: Drop unused argument to xics_kvm_has_broken_disconnect()
>   spapr/xics: Add "nr-servers" property
>   spapr: Drop "nr_servers" argument of the sPAPR IC activate() operation
>   spapr: Drop "nr_servers" argument of the sPAPR IC dt() operation
> 
>  include/hw/ppc/spapr.h      |  4 +--
>  include/hw/ppc/spapr_irq.h  |  9 ++---
>  include/hw/ppc/spapr_xive.h | 25 ++++++++++++-
>  include/hw/ppc/xics_spapr.h | 23 +++++++++---
>  hw/intc/spapr_xive.c        | 72 ++++++++++++++++++++++---------------
>  hw/intc/spapr_xive_kvm.c    |  4 +--
>  hw/intc/xics_kvm.c          |  4 +--
>  hw/intc/xics_spapr.c        | 45 ++++++++++++++---------
>  hw/ppc/spapr.c              |  7 ++--
>  hw/ppc/spapr_irq.c          | 27 +++++++-------
>  10 files changed, 141 insertions(+), 79 deletions(-)
> 


