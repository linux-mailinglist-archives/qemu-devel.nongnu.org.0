Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164E92D5CDD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:07:06 +0100 (CET)
Received: from localhost ([::1]:49846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMb3-0004OL-4x
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:07:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1knMKC-0003Mb-VM
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:49:40 -0500
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:54071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1knMK9-0002uW-6f
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:49:40 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.11])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 1717C2208AD;
 Thu, 10 Dec 2020 14:49:33 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 10 Dec
 2020 14:49:32 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00313cadeb1-a75a-4fc7-bbf8-9e7bc379a32d,
 7F90A86A4359BCD1ACB0618936AE64BD6AD86209) smtp.auth=groug@kaod.org
Date: Thu, 10 Dec 2020 14:49:31 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/1] spapr.c: set a 'kvm-type' default value instead of
 relying on NULL
Message-ID: <20201210144931.7127eb17@bahia.lan>
In-Reply-To: <c1bae366-135d-f240-ff03-2abc8967c908@gmail.com>
References: <20201208134536.1012045-1-danielhb413@gmail.com>
 <20201208153309.78825861@bahia.lan>
 <d142b41a-69c2-77de-861e-e68c3c0459b4@gmail.com>
 <20201210033736.GK2555@yekko.fritz.box>
 <ffee7463-13e9-0bd2-a3c3-c6239a861be8@redhat.com>
 <20201210134705.6adaf940@bahia.lan>
 <c1bae366-135d-f240-ff03-2abc8967c908@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: d987f858-63ac-418d-840a-8d17717950d8
X-Ovh-Tracer-Id: 2840645467092195747
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.37.156; envelope-from=groug@kaod.org;
 helo=8.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Dec 2020 10:10:21 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> 
> 
> On 12/10/20 9:47 AM, Greg Kurz wrote:
> > On Thu, 10 Dec 2020 13:34:59 +0100
> > Paolo Bonzini <pbonzini@redhat.com> wrote:
> > 
> >> To sum up everything:
> >>
> > 
> > LGTM
> 
> I just sent a v2 with a bit more done (e.g. added ignore case compare
> for 'auto'). Feel free to use that version or this one amended by this
> diff from Paolo.
> 

The "bit more done" in your v2 is very important as it prevents
spapr_kvm_type() to exit(1) if "auto" is explicitly passed on
the command line. So I think we should go ahead with yours.

> 
> Thanks,
> 
> 
> DHB
> 
> > 
> >> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> >> index 2d5aeeb45a..61f0963916 100644
> >> --- a/hw/ppc/spapr.c
> >> +++ b/hw/ppc/spapr.c
> >> @@ -3028,11 +3028,11 @@ static int spapr_kvm_type(MachineState *machine,
> >> const char *vm_type)
> >>            return 0;
> >>        }
> >>
> >> -    if (!strcmp(vm_type, "HV")) {
> >> +    if (!g_ascii_strcasecmp(vm_type, "hv")) {
> >>            return 1;
> >>        }
> >>
> >> -    if (!strcmp(vm_type, "PR")) {
> >> +    if (!g_ascii_strcasecmp(vm_type, "pr")) {
> >>            return 2;
> >>        }
> >>
> >> @@ -3132,16 +3132,6 @@ static char *spapr_get_kvm_type(Object *obj,
> >> Error **errp)
> >>    {
> >>        SpaprMachineState *spapr = SPAPR_MACHINE(obj);
> >>
> >> -    /*
> >> -     * In case the user didn't set 'kvm-type', return DEFAULT_KVM_TYPE
> >> -     * instead of NULL. This allows us to be more predictable with what
> >> -     * is expected to happen in spapr_kvm_type(), since we can stop relying
> >> -     * on receiving a 'NULL' parameter as a valid input there.
> >> -     */
> >> -    if (!spapr->kvm_type) {
> >> -        return g_strdup(DEFAULT_KVM_TYPE);
> >> -    }
> >> -
> >>        return g_strdup(spapr->kvm_type);
> >>    }
> >>
> >> @@ -3294,11 +3284,13 @@ static void spapr_instance_init(Object *obj)
> >>
> >>        spapr->htab_fd = -1;
> >>        spapr->use_hotplug_event_source = true;
> >> +
> >> +    spapr->kvm_type = g_strdup(DEFAULT_KVM_TYPE);
> >>        object_property_add_str(obj, "kvm-type",
> >>                                spapr_get_kvm_type, spapr_set_kvm_type);
> >>        object_property_set_description(obj, "kvm-type",
> >> -                                    "Specifies the KVM virtualization
> >> mode (HV, PR)."
> >> -                                    " If not specified, defaults to any
> >> available KVM"
> >> +                                    "Specifies the KVM virtualization
> >> mode (hv, pr, auto)."
> >> +                                    " auto is the default and allows
> >> any available KVM"
> >>                                        " module loaded in the host. In
> >> case both kvm_hv"
> >>                                        " and kvm_pr are loaded, kvm_hv
> >> takes precedence.");
> >>
> > 


