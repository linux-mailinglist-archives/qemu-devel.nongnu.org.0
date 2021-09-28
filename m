Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C9341A99F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 09:22:14 +0200 (CEST)
Received: from localhost ([::1]:36782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV7RN-0000T0-1h
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 03:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mV7Oq-0007mc-Ct
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 03:19:36 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:42136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mV7Op-0001iq-13
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 03:19:36 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-G6rjGigsMN2lHHvt4XY2Vg-1; Tue, 28 Sep 2021 03:19:28 -0400
X-MC-Unique: G6rjGigsMN2lHHvt4XY2Vg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1870718D6A25;
 Tue, 28 Sep 2021 07:19:27 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D353660C13;
 Tue, 28 Sep 2021 07:19:25 +0000 (UTC)
Date: Tue, 28 Sep 2021 09:19:24 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [RFC PATCH] spapr/xive: Allocate vCPU IPIs from local context
Message-ID: <20210928091924.2b57bec4@bahia.huguette>
In-Reply-To: <90e2ef32-8151-e65c-d64b-de58bb5337f1@kaod.org>
References: <20210922144120.1277504-1-clg@kaod.org>
 <20210923111249.33c41068@bahia.huguette>
 <71b9a1a8-7d76-ff7c-db47-7c8e9b4d87b5@kaod.org>
 <20210924154906.59da27f7@bahia.huguette>
 <6936294c-f236-2179-cd90-d45af74e7179@kaod.org>
 <20210924191313.36c9c8e9@bahia.huguette>
 <90e2ef32-8151-e65c-d64b-de58bb5337f1@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

On Mon, 27 Sep 2021 18:50:40 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 9/24/21 19:13, Greg Kurz wrote:
> > On Fri, 24 Sep 2021 16:58:00 +0200
> > C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >=20
> >> [ ... ]
> >>
> >>>> The changes only impact KVM support since we are deferring the IRQ
> >>>> initialization at the KVM level. What we have to be careful about is=
 not
> >>>> accessing an ESB page of an interrupt that would not have been initi=
liazed
> >>>> in the KVM device, else QEMU gets a sigbus.
> >>>>
> >>>
> >>> Ok, so this is just needed on a path that leads to xive_esb_rw() or
> >>> kvmppc_xive_esb_trigger(), right ?
> >>>
> >>> It seems that
> >>>
> >>> h_int_esb()
> >>>    kvmppc_xive_esb_rw()
> >>>
> >>> can get there with an lisn provided by the guest, and I don't see any
> >>> such check on the way : h_int_esb() only checks xive_eas_is_valid().
> >>
> >> This call is for LSI interrupts (device only) and not vCPU IPIs. see h=
call
> >> h_int_get_source_info(). I agree a hcall fuzzer could reach it.
> >>
> >=20
> > Yes we tell the guest to use H_INT_ESB for LSIs only but I don't have
> > the impression that it is forbidden for the guest to call H_INT_ESB
> > for arbitrary interrupts.
> >=20
> >> An alternative solution would be to claim the vCPU IPIs on demand, lik=
e
> >> we do for the MSIs, and not in spapr_irq_init(). It's a much bigger ch=
ange
> >> tough, because the H_INT hcalls consider that the interrupt numbers ha=
ve
> >> been claimed.
> >>
> >=20
> > Maybe it would be simpler to call xive_source_is_initialized() instead =
of
> > xive_eas_is_valid() in cases like this, e.g. hcall code since it is sha=
red
> > between emulation and KVM ?
>=20
> Yes but we need a better check than :
>=20
>      if (lisn < SPAPR_XIRQ_BASE) {
>          return !!xive_get_field64(EAS_END_INDEX, xive->eat[lisn].w);
>      }
>=20
> This is more an heuristic than a precise test on the "validity" of
> a source at the KVM level.
>=20

I guess we should be able to get kvmppc_xive_irq_state::valid from
KVM by making the KVM_DEV_XIVE_GRP_SOURCE attribute readable. Would
that be enough ?

>=20
> Thanks,
>=20
> C.


