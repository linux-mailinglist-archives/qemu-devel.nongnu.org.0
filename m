Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF3738F377
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 21:07:16 +0200 (CEST)
Received: from localhost ([::1]:42018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFv1-0006oX-IY
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 15:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1llFtA-0004vB-Nz
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:05:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1llFt6-0004s6-4S
 for qemu-devel@nongnu.org; Mon, 24 May 2021 15:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621883115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3YwG+4PMjJRo+0uuNElunm9kyBXQi/kNJPXLKatRTY=;
 b=NokrPv5kqjVtSOE0O52n4AH/5g5dfFxTFxJsf/yUe2TXCyR5d/t7lGY78EUU6zNN47ek2y
 FMJi6o9osjnlYVbVfwZn/7FJ7pb02IbtyI6SP5ogw9ax4Nz9OxDkktkMqOD/M0qA3BH6SF
 l+VCIdqwtnmojsfpqP95oQtqnBKnNUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-w66qJtX4OVGIWXX9B3Jg8A-1; Mon, 24 May 2021 15:05:08 -0400
X-MC-Unique: w66qJtX4OVGIWXX9B3Jg8A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D72CC73A0;
 Mon, 24 May 2021 19:05:07 +0000 (UTC)
Received: from localhost (unknown [10.40.208.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C87118401;
 Mon, 24 May 2021 19:05:05 +0000 (UTC)
Date: Mon, 24 May 2021 21:05:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 0/9] Initial support for machine creation via QMP
Message-ID: <20210524210503.1f75eabd@redhat.com>
In-Reply-To: <20210524192037.765d0239@redhat.com>
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <93ae82d3-f9a7-f347-a013-54ae5cdc95f7@redhat.com>
 <5210646b-c661-882d-6c8d-0fd1772342d2@greensocs.com>
 <61071d36-b700-8546-c19b-09c4e582bdfe@redhat.com>
 <YJ6jSeu3Uz4g6cCK@redhat.com>
 <CABgObfZxq1RDP12d3aCmV8drU3qFbhcUbxe4+9K_gNhXcFT-ug@mail.gmail.com>
 <20210524192037.765d0239@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel <qemu-devel@nongnu.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 24 May 2021 19:20:37 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Fri, 14 May 2021 20:32:22 +0200
> Paolo Bonzini <pbonzini@redhat.com> wrote:
>=20
> > Il ven 14 mag 2021, 18:20 Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 ha
> > scritto:
> >  =20
> > > My gut feeling though is accel-set would be more logical being done
> > > first, as that also influences the set of features available in other
> > > areas of QEMU configuration. Was there a reason you listed it after
> > > machine-set ?
> > >   =20
> >=20
> > That was also my initial gut feeling, but actually right now the machin=
e
> > influences the accelerator more than the other way round. For example t=
he
> > initialization of the accelerator takes a machine so that for example o=
n
> > x86 the per-architecture KVM knows whether to set up SMM. Also differen=
t
> > machines could use different modes for KVM (HV vs PR for ppc), and some
> > machines may not be virtualizable at all so they require TCG.
> >=20
> > The host CPU these days is really a virtualization-only synonym for -cp=
u
> > max, which works for TCG as well. But you're right that x86 CPU flags a=
re
> > dictated by the accelerator rather than the machine, so specifying it i=
n
> > machine-set would be clumsy. On the other hand on ARM it's a bit of bot=
h:
> > for KVM it's basically always -cpu host so the accelerator is important=
;
> > but some machines may have an M profile CPU and some may have an A. =20
> and some do not support -cpu/-smp/or rather ignore it and go ahead with h=
ardcoded one/
>=20
>=20
> > I don't have the sources at hand to check in which phase CPUs are creat=
ed,
> > but it's definitely after ACCEL_CREATED. Adding a third command
> > cpu-model-set is probably the easiest way to proceed. =20
>=20
>=20
> a naive question,
> why not ditch -cpu completely and instantiate CPUs with
>=20
> device_add cpu-foo,flagX=3Don/off
while writing my another reply to this thread, I realized we might need cpu=
 type
at least for 3 reasons:
 1. It would be hard/impossible to convert every board to create CPUs with
    device_add after board_init(), many boards depend on CPUs being availab=
le
    at that time to wire up another devices created at the same time.
 2. If we can postpone cpu creation after board_init() time, user would nee=
d
    query-hotpluggable-cpus command to get which CPU type and topology prop=
erties
    to use with device_add. (that's what libvirt uses curently)
 3. Recent work on ECPY cpu topology issues, showed that the topology, that=
 board
    generates from -smp might depends on CPU type (we got rid of that event=
ually but
    I wouldn't rule out possibility in the future).
   =20
What I would remove from -cpu behavior is resolving cpu-model to CPU type.
QMP command would use only cpu-type so it would be consistent with device_a=
dd
which already uses cpu-type, which user gets from query-hotpluggble-cpus.

All legacy cpu-model conversion can be pushed out into CLI compat binary or
up the stack to keep existing deployments running, and new VMs can use cpu =
types
directly.

Question is how user can query available (for given target/machine/accel) C=
PU types
using QMP, is there such command already?

> the former is just a kluge for making CLI based -smp initial_nr_cpu/-cpu =
foo, work.
> I'd move that logic to CLI compat wrapper translating that to a series of=
 device_add calls
> for QMP based QEMU.
>=20
> Also I maybe wrong, but I thought that -cpu nowadays does nothing except =
of translating
> legacy cpu model name to cpu-type and flags to a bunch of '-global', whic=
h are applied
> automatically when CPUa are created at board_init() time or later on when=
 device_add is used.
>=20
> > Paolo
> >=20
> >  =20
> > > Regards,
> > > Daniel
> > > --
> > > |: https://berrange.com      -o-
> > > https://www.flickr.com/photos/dberrange :|
> > > |: https://libvirt.org         -o-
> > > https://fstop138.berrange.com :|
> > > |: https://entangle-photo.org    -o-
> > > https://www.instagram.com/dberrange :|
> > >
> > >   =20
>=20
>=20


