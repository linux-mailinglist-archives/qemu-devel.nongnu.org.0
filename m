Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90B238F28F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:51:25 +0200 (CEST)
Received: from localhost ([::1]:51384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEjc-0001Sm-Uo
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1llEGE-0003Pi-LM
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:21:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1llEG6-0002WD-MC
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621876852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cW3iplRO+PZ812be6NY6ikF31wHCMMLm3oXuGdhstOM=;
 b=JTHMPnOoxHyg/2pYwS/T5Cp7OqUchXQr4rBt8oKY/ShAVQcjlIBiyDGiAF41AezptSITlN
 3tiovgGjUqnXTJmOrzggZ4yBxve24OArSW/yPh3VAsUee+FC2kzObLZ0gIG/H6lFI5wQ9A
 fBsPN+VDSzCwy/PpFzkYgJTYbV4OPGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-G7HzX08oOwaNu7PYjoCB2g-1; Mon, 24 May 2021 13:20:44 -0400
X-MC-Unique: G7HzX08oOwaNu7PYjoCB2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC00C8030A1;
 Mon, 24 May 2021 17:20:42 +0000 (UTC)
Received: from localhost (unknown [10.40.208.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E56335D9FC;
 Mon, 24 May 2021 17:20:39 +0000 (UTC)
Date: Mon, 24 May 2021 19:20:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 0/9] Initial support for machine creation via QMP
Message-ID: <20210524192037.765d0239@redhat.com>
In-Reply-To: <CABgObfZxq1RDP12d3aCmV8drU3qFbhcUbxe4+9K_gNhXcFT-ug@mail.gmail.com>
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <93ae82d3-f9a7-f347-a013-54ae5cdc95f7@redhat.com>
 <5210646b-c661-882d-6c8d-0fd1772342d2@greensocs.com>
 <61071d36-b700-8546-c19b-09c4e582bdfe@redhat.com>
 <YJ6jSeu3Uz4g6cCK@redhat.com>
 <CABgObfZxq1RDP12d3aCmV8drU3qFbhcUbxe4+9K_gNhXcFT-ug@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On Fri, 14 May 2021 20:32:22 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Il ven 14 mag 2021, 18:20 Daniel P. Berrang=C3=A9 <berrange@redhat.com> h=
a
> scritto:
>=20
> > My gut feeling though is accel-set would be more logical being done
> > first, as that also influences the set of features available in other
> > areas of QEMU configuration. Was there a reason you listed it after
> > machine-set ?
> > =20
>=20
> That was also my initial gut feeling, but actually right now the machine
> influences the accelerator more than the other way round. For example the
> initialization of the accelerator takes a machine so that for example on
> x86 the per-architecture KVM knows whether to set up SMM. Also different
> machines could use different modes for KVM (HV vs PR for ppc), and some
> machines may not be virtualizable at all so they require TCG.
>=20
> The host CPU these days is really a virtualization-only synonym for -cpu
> max, which works for TCG as well. But you're right that x86 CPU flags are
> dictated by the accelerator rather than the machine, so specifying it in
> machine-set would be clumsy. On the other hand on ARM it's a bit of both:
> for KVM it's basically always -cpu host so the accelerator is important;
> but some machines may have an M profile CPU and some may have an A.
and some do not support -cpu/-smp/or rather ignore it and go ahead with har=
dcoded one/


> I don't have the sources at hand to check in which phase CPUs are created=
,
> but it's definitely after ACCEL_CREATED. Adding a third command
> cpu-model-set is probably the easiest way to proceed.


a naive question,
why not ditch -cpu completely and instantiate CPUs with

device_add cpu-foo,flagX=3Don/off

the former is just a kluge for making CLI based -smp initial_nr_cpu/-cpu fo=
o, work.
I'd move that logic to CLI compat wrapper translating that to a series of d=
evice_add calls
for QMP based QEMU.

Also I maybe wrong, but I thought that -cpu nowadays does nothing except of=
 translating
legacy cpu model name to cpu-type and flags to a bunch of '-global', which =
are applied
automatically when CPUa are created at board_init() time or later on when d=
evice_add is used.

> Paolo
>=20
>=20
> > Regards,
> > Daniel
> > --
> > |: https://berrange.com      -o-
> > https://www.flickr.com/photos/dberrange :|
> > |: https://libvirt.org         -o-
> > https://fstop138.berrange.com :|
> > |: https://entangle-photo.org    -o-
> > https://www.instagram.com/dberrange :|
> >
> > =20


