Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161094AC05E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:02:37 +0100 (CET)
Received: from localhost ([::1]:55320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH4bE-0005f9-6K
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:02:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nH3tJ-0002Q6-82
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:17:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nH3tE-0001kB-Es
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 08:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644239827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwHU/qG2BDkNPelA1+jPs0nbE+zz0xw3g0ZPg2k27GA=;
 b=T6efmoqC/H2/6ga9KnO/c43ToARqwDpXTBOV5b7bjifo2Qae9mChei+h+QLJ5B+RVi5ILe
 eML8NXXxNnnV5vX1uTZaRqLyzw10NiFrmEGeyLFYO5EVy5h8JN4qpCUBIpEnJR2SwLW804
 Jc+HswM5R5OJpRCy1dBJU37BtldT0bk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-W4LPfCnBOmikn_4ci72eiA-1; Mon, 07 Feb 2022 08:17:06 -0500
X-MC-Unique: W4LPfCnBOmikn_4ci72eiA-1
Received: by mail-ed1-f69.google.com with SMTP id
 k11-20020a50c8cb000000b0040f84c5bc66so911212edh.4
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 05:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Od0Il9C+bLcVgExLKn5jtMcriByTk4waGgzOzzKj0S8=;
 b=NzKEdv8JiL5BsxW6PCbUcWCm1DGaNtY68ggyHh+BllSc8WtMAbCxmmKdtL+cxlquMn
 3n1W2/gfdRxxzrdTjxPdTtu6GCflrlQ/4RhCwvE3QkB8mfRKWnBe4LMPNreoq3L+iSQE
 ASLXgNFBMwjGDcOETFiXMhKq8Q4s6hT34M9/HhWDuxnG+qRKZNaN/aStg2b+TAlKK03h
 rHFP/PIRFcMNaAkMu1Ab2RlUZOQTXy2Z24vSgGrRfMnEtvcoCSdqQtkfT7Vmuum9oD80
 q4B0D+5U2e3u+SgKJeoGMpY6fjZouNDmfgFl8vZqVLaxW5FjecwXvus6aAsO4bd+HLIG
 hIVQ==
X-Gm-Message-State: AOAM532hi/4dRoMnuIGiakxSHVz/ieiyl5tBs2Pj8AbW2OIUa6vxHYs2
 39du0gykpdzKMMUludSqueV7qKiJ90mkf+08FtJl54OGiqxr+dSvQhylHAznfmA7Xj6D0Rl0tGW
 tHsxSWWAfX67RXnc=
X-Received: by 2002:a05:6402:d0d:: with SMTP id
 eb13mr13937120edb.24.1644239824892; 
 Mon, 07 Feb 2022 05:17:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmR4E8fC2LGKdF6P0cOf6g3MPVvHGP4PSH6w/GqKWTkVJzt1xlhFn0LBAy6mJBDupYO6EyYg==
X-Received: by 2002:a05:6402:d0d:: with SMTP id
 eb13mr13937064edb.24.1644239824330; 
 Mon, 07 Feb 2022 05:17:04 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id j2sm3667529ejc.223.2022.02.07.05.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 05:17:03 -0800 (PST)
Date: Mon, 7 Feb 2022 14:17:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH v4 2/4] hw/i386: Attach CPUs to machine
Message-ID: <20220207141702.57dc96c4@redhat.com>
In-Reply-To: <YgEHC81neFAk4dHk@redhat.com>
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-3-f4bug@amsat.org>
 <20220207091437.52cf36b1@redhat.com>
 <20220207101843.259f517c@redhat.com>
 <YgDoKlkP9Isdjnv8@angien.pipo.sk>
 <20220207122222.58903ec7@redhat.com> <YgEHC81neFAk4dHk@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yang Zhong <yang.zhong@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Peter Krempa <pkrempa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 11:48:27 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, Feb 07, 2022 at 12:22:22PM +0100, Igor Mammedov wrote:
> > On Mon, 7 Feb 2022 10:36:42 +0100
> > Peter Krempa <pkrempa@redhat.com> wrote:
> >  =20
> > > On Mon, Feb 07, 2022 at 10:18:43 +0100, Igor Mammedov wrote: =20
> > > > On Mon, 7 Feb 2022 09:14:37 +0100
> > > > Igor Mammedov <imammedo@redhat.com> wrote:
> > > >    =20
> > > > > On Sat,  5 Feb 2022 13:45:24 +0100
> > > > > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> > > > >    =20
> > > > > > Previously CPUs were exposed in the QOM tree at a path
> > > > > >=20
> > > > > >   /machine/unattached/device[nn]
> > > > > >=20
> > > > > > where the 'nn' of the first CPU is usually zero, but can
> > > > > > vary depending on what devices were already created.
> > > > > >=20
> > > > > > With this change the CPUs are now at
> > > > > >=20
> > > > > >   /machine/cpu[nn]
> > > > > >=20
> > > > > > where the 'nn' of the first CPU is always zero.     =20
> > > > >=20
> > > > > Could you add to commit message the reason behind the change?   =
=20
> > > >=20
> > > > regardless, it looks like unwarranted movement to me
> > > > prompted by livirt accessing/expecting a QOM patch which is
> > > > not stable ABI. I'd rather get it fixed on libvirt side.
> > > >=20
> > > > If libvirt needs for some reason access a CPU instance,
> > > > it should use @query-hotpluggable-cpus to get a list of CPUs
> > > > (which includes QOM path of already present CPUs) instead of
> > > > hard-codding some 'well-known' path as there is no any guarantee=20
> > > > that it will stay stable whatsoever.   =20
> > >=20
> > > I don't disagree with you about the use of hardcoded path, but the wa=
y
> > > of using @query-hotpluggable-cpus is not really aligning well for how
> > > it's being used.
> > >
> > > To shed a bit more light, libvirt uses the following hardcoded path
> > >=20
> > > #define QOM_CPU_PATH  "/machine/unattached/device[0]"
> > >=20
> > > in code which is used to query CPU flags. That code doesn't care at a=
ll
> > > which cpus are present but wants to get any of them. So yes, calling
> > > query-hotpluggable-cpus is possible but a bit pointless. =20
> >=20
> > Even though query-hotpluggable-cpus is cumbersome
> > it still lets you avoid hardcodding QOM path and let you
> > get away with keeping "_400 QMP calls" probing while
> > something better comes along.
> >=20
> >  =20
> > > In general the code probing cpu flags via qom-get is very cumbersome =
as
> > > it ends up doing ~400 QMP calls at startup of a VM in cases when we d=
eem
> > > it necessary to probe the cpu fully.
> > >=20
> > > It would be much better (And would sidestep the issue altoghether) if=
 we
> > > had a more sane interface to probe all cpu flags in one go, and ideal=
ly
> > > the argument specifying the cpu being optional.
> > >=20
> > > Libvirt can do the adjustment, but for now IMO the path to the first =
cpu
> > > (/machine/unattached/device[0]) became de-facto ABI by the virtue tha=
t
> > > it was used by libvirt and if I remember correctly it was suggested b=
y
> > > the folks dealing with the CPU when the code was added originally. =
=20
> > I would've argued against that back then as well,
> > there weren't any guarantee and I wouldn't like precedent of
> > QOM abuse becoming de-facto ABI.
> > Note: this patch breaks this so called ABI as well and introduces
> > yet another harcodded path without any stability guarantee whatsoever. =
=20
>=20
> AFAIK, we've never defined anything about QOM paths wrt ABI one way
> or the other ? In the absence of guidelines then it comes down to

not written in docs anyways (all I have is vague recollection that
we really didn't want to make of QOM path/tree an ABI).
For more on this topic see the comment at the end.

> what are reasonable expectations of the mgmt app. These expectations
> will be influenced by what it is actually possible to acheive given
> our API as exposed.
>=20
> I think it is unreasonable to expect /machine/unattached to be
> stable because by its very nature it is just a dumping ground
> for anything where the dev hasn't put in any thought to the path
> placement.  IOW, it was/is definitely a bad idea for libvirt to
> rely on /machine/unattached in any way. That we're liable to be
> broken is not nice, but its really our own fault - we should=20
> have asked for a better solution from day one here.
>=20
>=20
> I think it is somewhat reasonable to expect other QOM paths to
> be stable as there's been some degree of thought put into their
> placement. If we don't want apps to be considering other
> paths to be stable, then we need to explain exactly what they
> can and can't rely on, and most importantly actually provide
> a way for them to do what they need
>=20
>=20
> For example, libvirt needs a QOM path to query memory balloon
> stats. All libvirt knows is that it set 'id=3Dballoon0' when
> creating it on the CLI. To find the balloon device in QOM it
> then looks for all paths under '/machine/peripheral', and
> tries to find one called 'child<$ID>' where $ID is the id=3Dxxx
> value from the CLI.
>=20
> We do the same dance when we need to find out where thue
> default VGA device we created lives.
>=20
> This all feels kinda silly as we're going through a dance to
> dynamically find the device, but in practice it is no better
> than just hardcoding it.
>=20
> The problem we face in these examp\les is that as an input we
> are giving QMEU a device 'id' but at runtime we're needing to
> then use a QOM path instead of the 'id'. So we need a way to
> translate an 'id' to a QOM path. What is the right way to do
> this in a supported manner without making any assumptions
> about QOM paths ?

Maybe we should have a QMP command that could find object
instance by ID?
=20
> For the CPUs cases, we don't have any 'id' on the CLI since
> CPUs aren't configured that way, so we just hardcoded the
> full path. You've pointed out query-hotpluggable-cpus which
> is a possible solution.
>=20
> In another case we're assuming that '/machine' has a property
> called 'rtc-time'. IMHO it is reasonable to assume that
> '/machine' as a QOM path is stable.

/machine probably will stay stable, but I wouldn't bet any money
on that either. But, don't we have a QMP interface to query machine
properties?
(if there were a need with a good for QEMU justification to change
/machine, it most likely would've been merged as long as it doesn't
break QEMU itself, same goes for other QOM paths)

> It isn't as simple as just saying "all QOM paths are unstable".
>=20
> I struggle to come up with a good rule to explain what apps can
> / can't rely on wrt QOM paths, other than stay far away from
> anything with '/unattached'.

If I recall right, the main reason against declaring QOM path
as stable ABI, was maintenance headache QEMU side would get
with that as we wanted to have an ability to change tree
freely without breaking external users. My fear is that
making QOM path a stable ABI, will eventually dig us
trap similar to CLI interface, only more deeply embedded into
the code.

What this series does is trying to introduce an alternative
management API on top of exiting QMP one (willfully changing
child parent relations), that's fine if that's a way to go
forward, but it should be thought over and documented before
we go this route.

I always assumed that if a stable interface was necessary
for external users, the QMP was the way to go.

(it's easy to (ab)use direct QMP access, as usually it gives
one the access to the feature since the day it was merged,
but then it backfires, when QEMU changes unexpectedly,
since no one has been any paying attention to path stability
nor adds any compat knobs when it happens)
=20
Anyways, we should discuss QOM path ABI topic again and makeup
our mind on this (and preferably documenting it somewhere)
to avoid wildly different assumptions about it.

> Regards,
> Daniel


