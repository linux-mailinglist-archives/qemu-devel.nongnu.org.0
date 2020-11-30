Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED832C8AF6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 18:29:29 +0100 (CET)
Received: from localhost ([::1]:47666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjmzQ-0002xV-Ux
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 12:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kjmyd-0002RD-Jk
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 12:28:39 -0500
Received: from 7.mo52.mail-out.ovh.net ([188.165.59.253]:48432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kjmyb-0002X0-E6
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 12:28:39 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.158])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 7558521CF25;
 Mon, 30 Nov 2020 18:28:27 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 30 Nov
 2020 18:28:26 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003229ac7e2-7763-4df5-a7fd-618ae33fcdb5,
 54E7F54749740F6D21A4FFD7F03B08EA4E155DE3) smtp.auth=clg@kaod.org
Subject: Re: [PATCH for-6.0 v2 0/3] spapr: Address the confusion between IPI
 numbers and vCPU ids
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <20201130165258.744611-1-groug@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <be80ffd2-d18d-3a3a-4bcc-e5a806e417ec@kaod.org>
Date: Mon, 30 Nov 2020 18:28:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130165258.744611-1-groug@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7f1e149c-e78e-4d4f-95cb-ac8e59d62bcc
X-Ovh-Tracer-Id: 3151112367392197600
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeitddguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejffeifeeujefhgedvvedvvdelieekfeevleejgffhudejledvgeekhfelkeeukeenucffohhmrghinheplhgruhhntghhphgrugdrnhgvthenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/30/20 5:52 PM, Greg Kurz wrote:
> A regression was recently fixed in the sPAPR XIVE code for QEMU 5.2
> RC3 [1]. It boiled down to a confusion between IPI numbers and vCPU
> ids, which happen to be numerically equal in general, but are really
> different entities that can diverge in some setups. This was causing
> QEMU to misconfigure XIVE and to crash the guest.
> 
> The confusion comes from XICS actually. Interrupt presenters in XICS
> are identified by a "server number" which is a 1:1 mapping to vCPU
> ids. The range of these "server numbers" is exposed to the guest in
> the "ibm,interrupt-server-ranges" property. A xics_max_server_number()
> helper was introduced at some point to compute the upper limit of the
> range. When XIVE was added, commit 1a518e7693c9 renamed the helper to
> spapr_max_server_number(). It ended up being used to size a bunch of
> things in XIVE that are per-vCPU, such as internal END tables or
> IPI ranges presented to the guest. The problem is that the maximum
> "server number" can be much higher (up to 8 times) than the actual
> number of vCPUs when the VSMT mode doesn't match the number of threads
> per core in the guest:
> 
>     DIV_ROUND_UP(ms->smp.max_cpus * spapr->vsmt, ms->smp.threads);
> 
> Since QEMU 4.2, the default behavior is to set spapr->vsmt to
> ms->smp.threads. Setups with custom VSMT settings will configure XIVE
> to use more HW resources than needed. This is a bit unfortunate but
> not extremely harmful, 

Indeed. The default usage case (without vsmt) has no impact since 
it does not fragment the XIVE VP space more than needed.

> unless maybe if a lot of guests are running on the host. 

We can run 4K (-2) KVM guests today on a P9 system. To reach the 
internal limits, each should have 32 vCPUs. It's possible with a 
lot of RAM but it's not a common scenario. 

C.


> The sizing of the IPI range is more problematic though
> as it eventually led to [1].
> 
> This series first does some renaming to make it clear when we're
> dealing with vCPU ids. It then fixes the machine code to pass
> smp.max_cpus to XIVE where appropriate. Since these changes are
> guest/migration visible, a machine property is added to keep the
> existing behavior for older machine types. The series is thus based
> on Connie's recent patch that introduces compat machines for
> QEMU 6.0.
> 
> Based-on: 20201109173928.1001764-1-cohuck@redhat.com
> 
> Note that we still use spapr_max_vcpu_ids() when activating the
> in-kernel irqchip because this is what both XICS-on-XIVE and XIVE
> KVM devices expect.
> 
> [1] https://bugs.launchpad.net/qemu/+bug/1900241
> 
> v2: - comments on v1 highlighted that problems mostly come from
>       spapr_max_server_number() which got misused over the years.
>       Updated the cover letter accordingly.
>     - completely new approach. Instead of messing with device properties,
>       pass the appropriate values to the IC backend handlers.
>     - rename a few things using the "max_vcpu_ids" wording instead of
>       "nr_servers" and "max_server_number"
> 
> Greg Kurz (3):
>   spapr: Improve naming of some vCPU id related items
>   spapr/xive: Fix size of END table and number of claimed IPIs
>   spapr/xive: Fix the "ibm,xive-lisn-ranges" property
> 
>  include/hw/ppc/spapr.h      |  3 ++-
>  include/hw/ppc/spapr_irq.h  | 12 ++++++------
>  include/hw/ppc/spapr_xive.h |  2 +-
>  include/hw/ppc/xics_spapr.h |  2 +-
>  hw/intc/spapr_xive.c        |  9 +++++----
>  hw/intc/spapr_xive_kvm.c    |  4 ++--
>  hw/intc/xics_kvm.c          |  4 ++--
>  hw/intc/xics_spapr.c        | 11 ++++++-----
>  hw/ppc/spapr.c              | 12 ++++++++----
>  hw/ppc/spapr_irq.c          | 34 ++++++++++++++++++++++++----------
>  10 files changed, 57 insertions(+), 36 deletions(-)
> 


