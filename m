Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D694179DA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:28:03 +0200 (CEST)
Received: from localhost ([::1]:36778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTozS-0005q7-9n
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mTolI-0002zE-Fs
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:13:24 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:54457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mTolG-0001KG-Nn
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:13:24 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-ENo2Fp9NO_qQ8kVL5nvJCQ-1; Fri, 24 Sep 2021 13:13:17 -0400
X-MC-Unique: ENo2Fp9NO_qQ8kVL5nvJCQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC007801E72;
 Fri, 24 Sep 2021 17:13:15 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4474618AD4;
 Fri, 24 Sep 2021 17:13:14 +0000 (UTC)
Date: Fri, 24 Sep 2021 19:13:13 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [RFC PATCH] spapr/xive: Allocate vCPU IPIs from local context
Message-ID: <20210924191313.36c9c8e9@bahia.huguette>
In-Reply-To: <6936294c-f236-2179-cd90-d45af74e7179@kaod.org>
References: <20210922144120.1277504-1-clg@kaod.org>
 <20210923111249.33c41068@bahia.huguette>
 <71b9a1a8-7d76-ff7c-db47-7c8e9b4d87b5@kaod.org>
 <20210924154906.59da27f7@bahia.huguette>
 <6936294c-f236-2179-cd90-d45af74e7179@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

On Fri, 24 Sep 2021 16:58:00 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> [ ... ]
>=20
> >> The changes only impact KVM support since we are deferring the IRQ
> >> initialization at the KVM level. What we have to be careful about is n=
ot
> >> accessing an ESB page of an interrupt that would not have been initili=
azed
> >> in the KVM device, else QEMU gets a sigbus.
> >>
> >=20
> > Ok, so this is just needed on a path that leads to xive_esb_rw() or
> > kvmppc_xive_esb_trigger(), right ?
> >=20
> > It seems that
> >=20
> > h_int_esb()
> >   kvmppc_xive_esb_rw()
> >=20
> > can get there with an lisn provided by the guest, and I don't see any
> > such check on the way : h_int_esb() only checks xive_eas_is_valid().
>=20
> This call is for LSI interrupts (device only) and not vCPU IPIs. see hcal=
l
> h_int_get_source_info(). I agree a hcall fuzzer could reach it.
>=20

Yes we tell the guest to use H_INT_ESB for LSIs only but I don't have
the impression that it is forbidden for the guest to call H_INT_ESB
for arbitrary interrupts.

> An alternative solution would be to claim the vCPU IPIs on demand, like
> we do for the MSIs, and not in spapr_irq_init(). It's a much bigger chang=
e
> tough, because the H_INT hcalls consider that the interrupt numbers have
> been claimed.
>=20

Maybe it would be simpler to call xive_source_is_initialized() instead of
xive_eas_is_valid() in cases like this, e.g. hcall code since it is shared
between emulation and KVM ?

> C.


