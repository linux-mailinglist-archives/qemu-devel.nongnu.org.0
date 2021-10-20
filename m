Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E921743465C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 10:02:05 +0200 (CEST)
Received: from localhost ([::1]:57130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md6Y0-0003pi-Qd
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 04:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1md6Vg-00030C-VT
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:59:40 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:47447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1md6Vf-00052Z-1g
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:59:40 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-XzglGPe4OLOdV4j1Ny9r2g-1; Wed, 20 Oct 2021 03:59:36 -0400
X-MC-Unique: XzglGPe4OLOdV4j1Ny9r2g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 136FF362FC;
 Wed, 20 Oct 2021 07:59:35 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 175BC104253A;
 Wed, 20 Oct 2021 07:59:27 +0000 (UTC)
Date: Wed, 20 Oct 2021 09:59:26 +0200
From: Greg Kurz <groug@kaod.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/2] rcu: Introduce force_rcu notifier
Message-ID: <20211020095926.5a42076f@bahia.huguette>
In-Reply-To: <642435ff-975a-c46c-f73b-2dfb8aff0463@redhat.com>
References: <20211019055632.252879-1-groug@kaod.org>
 <20211019055632.252879-2-groug@kaod.org>
 <642435ff-975a-c46c-f73b-2dfb8aff0463@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: qemu-stable@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Oct 2021 13:26:25 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 19/10/21 07:56, Greg Kurz wrote:
> > The drain_rcu_call() function can be blocked as long as an RCU reader
> > stays in a read-side critical section. This is typically what happens
> > when a TCG vCPU is executing a busy loop. It can deadlock the QEMU
> > monitor as reported in https://gitlab.com/qemu-project/qemu/-/issues/65=
0 .
> >=20
> > This can be avoided by allowing drain_rcu_call() to enforce an RCU grac=
e
> > period. Since each reader might need to do specific actions to end a
> > read-side critical section, do it with notifiers.
> >=20
> > Prepare ground for this by adding a notifier list to the RCU reader
> > struct and use it in wait_for_readers() if drain_rcu_call() is in
> > progress. An API is added for readers to register their notifiers.
> >=20
> > This is largely based on a draft from Paolo Bonzini.
> >=20
> > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >   include/qemu/rcu.h | 16 ++++++++++++++++
> >   util/rcu.c         | 22 +++++++++++++++++++++-
> >   2 files changed, 37 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
> > index 515d327cf11c..d8c4fd8686b4 100644
> > --- a/include/qemu/rcu.h
> > +++ b/include/qemu/rcu.h
> > @@ -27,6 +27,7 @@
> >   #include "qemu/thread.h"
> >   #include "qemu/queue.h"
> >   #include "qemu/atomic.h"
> > +#include "qemu/notify.h"
> >   #include "qemu/sys_membarrier.h"
> >  =20
> >   #ifdef __cplusplus
> > @@ -66,6 +67,14 @@ struct rcu_reader_data {
> >  =20
> >       /* Data used for registry, protected by rcu_registry_lock */
> >       QLIST_ENTRY(rcu_reader_data) node;
> > +
> > +    /*
> > +     * NotifierList used to force an RCU grace period.  Accessed under
> > +     * rcu_registry_lock.  Note that the notifier is called _outside_
> > +     * the thread!
> > +     */
> > +    NotifierList force_rcu;
> > +    void *force_rcu_data;
>=20
> This is a bit ugly because the force_rcu_data is shared across all=20
> notifiers.  Sure right now we have only one, but still the data argument=
=20
> should be in rcu_register_thread rather than rcu_add_force_rcu_notifier.
>=20

I don't quite see why we'd need more than one notifier, but indeed
this isn't conceptually correct.

> It's a pity because I liked the Notifier local variable...  But after=20
> thinking about it more and deleting some suggestions that won't work,=20
> it's just easiest to have the notifier in CPUState.
>=20

Agreed.

> Maybe even move the unregistration to the existing function=20
> tcg_cpus_destroy, and add tcg_cpus_init that calls tcg_register_thread()=
=20
> and rcu_add_force_rcu_notifier().  This way you don't have to export=20
> tcg_cpus_force_rcu, and the tcg-accel-ops.h APIs are a bit more tidy.
>=20

I don't think we can do that because of round-robin : we only have one
thread in this case but tcg_cpus_destroy() must still be called for all
vCPUs. Also, a single notifier will work just fine no matter which
vCPU is running when wait_for_readers() is called if I understand
correctly how round-robin works.

> Paolo
>=20
> > +void rcu_add_force_rcu_notifier(Notifier *n, void *data)
> > +{
> > +    qemu_mutex_lock(&rcu_registry_lock);
> > +    notifier_list_add(&rcu_reader.force_rcu, n);
> > +    rcu_reader.force_rcu_data =3D data;
> > +    qemu_mutex_unlock(&rcu_registry_lock);
> > +}
> > +
> > +void rcu_remove_force_rcu_notifier(Notifier *n)
> > +{
> > +    qemu_mutex_lock(&rcu_registry_lock);
> > +    rcu_reader.force_rcu_data =3D NULL;
> > +    notifier_remove(n);
> > +    qemu_mutex_unlock(&rcu_registry_lock);
> > +}
> > +
> >   static void rcu_init_complete(void)
> >   {
> >       QemuThread thread;
> >=20
>=20


