Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEFD4D9933
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 11:45:30 +0100 (CET)
Received: from localhost ([::1]:51748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU4gD-00076k-G1
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 06:45:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nU4ei-0005a0-5Q
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:43:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nU4ee-0007ta-8F
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 06:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647341031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T+k7uQ6WtV7yhaA42MJD+YAdmlTXfTk+f4cIKAvIza4=;
 b=XNtk6go6uY/dtzvBOTetqYhVf7ljDz7ILrdhqidmFszV04kql30tSVCC/9TV7KKHyF+8zS
 RXYYAA450wG4lgDwmzS4+tFx82SV/dI13EmUW34kTiMDFZ25jhIAtq9KusZ2XFWYVfXHPG
 pV6pFTsAzA/53I4lDwhVgRKyuDj2kac=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-6gVA3BbyNeqtNDun-w7uHw-1; Tue, 15 Mar 2022 06:43:49 -0400
X-MC-Unique: 6gVA3BbyNeqtNDun-w7uHw-1
Received: by mail-wm1-f71.google.com with SMTP id
 14-20020a05600c104e00b003897a167353so987293wmx.8
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 03:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=szu3VzBEQA9gfUQ8pqi80bsBAU7gK32PcyblI4Wjskg=;
 b=E2BHlsoqaTbWHFX/DHNE8XGe3QTs4lB+HxuunC0Mr9SQPE2j5TCDfc9LHGX9Oqf5RL
 pNNXo9OE9AhJHlyKGLnT8D/KVZVB/o/YVBw+6Z/aNE7lhH7KAiyDZYV99J3h52dFsxaQ
 BNeEbNnZs6WfQIu6GPfKfEqqmmddwkVm+NfxPovXJteHB6UU2nj6wk51eBwFLxs10cUd
 y/FtRUr+ZQt3rf9nvkC0yMmQcvx3gQ6wu8U1eigdP5Gd2dqQzp02yXH79zmuooNHs/cE
 YgkQ7nWII40+ksCUwh6foYm0c1G8re1iHqr7Y0TIqQEl87gKiXMWg4ha78nUbPtdOrUj
 NG7A==
X-Gm-Message-State: AOAM533Tq4n6et8n6geVPRWpMJ9HfvdfoWmyX4QNvWzKEmJ6OEzUhwS2
 Q8IzphIlVZ0HVxmuKWMS9lULifPVtCczf2e05b5dpN+rvUWQZVq2t8lymkve9PhqFW4IaEua76f
 AApjsjH22Rp339sI=
X-Received: by 2002:a05:600c:34c9:b0:38c:15a1:eb7c with SMTP id
 d9-20020a05600c34c900b0038c15a1eb7cmr630218wmq.191.1647341028545; 
 Tue, 15 Mar 2022 03:43:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLhv3DVqpMb3MzRJbONy/bYEDy/Sn4eprlm4Fyr6fpkLrn1tBgCzyEYrI1Et1KGS8d+tdnzQ==
X-Received: by 2002:a05:600c:34c9:b0:38c:15a1:eb7c with SMTP id
 d9-20020a05600c34c900b0038c15a1eb7cmr630195wmq.191.1647341028178; 
 Tue, 15 Mar 2022 03:43:48 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o6-20020a5d6846000000b001f044a8e214sm15046270wrw.107.2022.03.15.03.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 03:43:47 -0700 (PDT)
Date: Tue, 15 Mar 2022 10:43:45 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: Time to introduce a migration protocol negotiation (Re: [PATCH
 v2 00/25] migration: Postcopy Preemption)
Message-ID: <YjBt4XqD1bg/JJx1@work-vm>
References: <20220301083925.33483-1-peterx@redhat.com>
 <Yh3mo5VFQ3gT1Gd7@redhat.com> <Yh3yzbmOqAVV9iM9@xz-m1.local>
 <Yh30/nPtWyvqp8xo@redhat.com> <Yh37hLn5Dlffm13P@xz-m1.local>
 <Yh5O/eq4If4MYpTq@work-vm> <Yi+ONfiZlQD2LoHX@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yi+ONfiZlQD2LoHX@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrang=E9 (berrange@redhat.com) wrote:
> On Tue, Mar 01, 2022 at 04:51:09PM +0000, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > On Tue, Mar 01, 2022 at 10:27:10AM +0000, Daniel P. Berrang=E9 wrote:
> > > > > I also didn't know whether there's other limitations of it.  For =
example,
> > > > > will a new socket pair be a problem for any VM environment (eithe=
r a
> > > > > limitation from the management app, container, and so on)?  I thi=
nk it's
> > > > > the same to multifd in that aspect, but I never explored.
> > > >=20
> > > > If it needs extra sockets that is something apps will need to be aw=
are
> > > > of unfortunately and explicitly opt-in to :-( Migration is often
> > > > tunnelled/proxied over other channels, so whatever does that needs =
to
> > > > be aware of possibility of seeing extra sockets.
> > >=20
> > > Ah, then probably it can never be the default.  But for sure it could=
 be
> > > nice that higher level can opt-in and make it a default at some point=
 as
> > > long as it knows the network topology is safe to do so.
> > >=20
> > > >=20
> > > > > > > TODO List
> > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > >=20
> > > > > > > TLS support
> > > > > > > -----------
> > > > > > >=20
> > > > > > > I only noticed its missing very recently.  Since soft freeze =
is coming, and
> > > > > > > obviously I'm still growing this series, so I tend to have th=
e existing
> > > > > > > material discussed. Let's see if it can still catch the train=
 for QEMU 7.0
> > > > > > > release (soft freeze on 2022-03-08)..
> > > > > >=20
> > > > > > I don't like the idea of shipping something that is only half f=
inished.
> > > > > > It means that when apps probe for the feature, they'll see pree=
mpt
> > > > > > capability present, but have no idea whether they're using a QE=
MU that
> > > > > > is broken when combined with TLS or not. We shouldn't merge som=
ething
> > > > > > just to meet the soft freeze deadline if we know key features a=
re broken.
> > > > >=20
> > > > > IMHO merging and declaring support are two problems.
> > > > >=20
> > > > > To me, it's always fine to merge the code that implemented the fu=
ndation of a
> > > > > feature.  The feature can be worked upon in the future.
> > > > >=20
> > > > > Requiring a feature to be "complete" sometimes can cause burden t=
o not only
> > > > > the author of the series but also reviewers.  It's IMHO not neces=
sary to
> > > > > bind these two ideas.
> > > > >=20
> > > > > It's sometimes also hard to define "complete": take the TLS as ex=
ample, no
> > > > > one probably even noticed that it won't work with TLS and I just =
noticed it
> > > > > merely these two days..  We obviously can't merge partial patchse=
t, but if
> > > > > the patchset is well isolated, then it's not a blocker for mergin=
g, imho.
> > > > >=20
> > > > > Per my understanding, what you worried is when we declare it supp=
orted but
> > > > > later we never know when TLS will be ready for it.  One solution =
is I can
> > > > > rename the capability as x-, then after the TLS side ready I drop=
 the x-
> > > > > prefix.  Then Libvirt or any mgmt software doesn't need to suppor=
t this
> > > > > until we drop the x-, so there's no risk of compatibility.
> > > > >=20
> > > > > Would that sound okay to you?
> > > >=20
> > > > If it has an x- prefix then we can basically ignore it from a mgmt =
app
> > > > POV until it is actually finished.
> > > >=20
> > > > > I can always step back and work on TLS first before it's merged, =
but again
> > > > > I don't think it's required.
> > > >=20
> > > > Apps increasingly consider use of TLS to be a mandatory feature for
> > > > migration, so until that works, this preempt has to be considered
> > > > unsupported & unfinished IMHO. So either TLS should be ready when
> > > > it merges, or it should be clearly marked unsupported at the QAPI
> > > > level.
> > >=20
> > > Yes, I fully agree with it, and for huge vm migrations I think TLS is=
 in
> > > many cases mandatory.
> > >=20
> > > I do plan to work on it right afterwards if this series land, but as =
the
> > > series grows I just noticed maybe we should start landing some codes =
that's
> > > already solid.  Landing the code as another benefit that I want to ma=
ke
> > > sure the code merged at least won't affect the existing features.
> > >=20
> > > So what I'm curious is why TLS is getting quite some attentions in th=
e past
> > > few years but I didn't even see any selftests included in migration-t=
est on
> > > tls.  That's something I wanted to look into, maybe even before addin=
g the
> > > preempt+tls support. But maybe I just missed something, as I didn't u=
se tls
> > > a lot in the past.
> >=20
> > Hmm, I think it's worth getting TLS working before putting the full
> > series in, because it might impact the way you wire the channels up -
> > it's going to take some care; but lets see which parts we can/should
> > take.
>=20
> Taking a step back here and looking at the bigger picture of
> migration protocol configuration....

OK, but lets keep that as a separate discussion and not bog down Peter's
improvement in a different overhaul.

> Almost every time we add a new feature to migration, we end up
> having to define at least one new migration parameter, then wire
> it up in libvirt, and then the mgmt app too, often needing to
> ensure it is turn on for both client and server at the same time.
>=20
>=20
> For some features, requiring an explicit opt-in could make sense,
> because we don't know for sure that the feature is always a benefit.
> These are things that can be thought of as workload sensitive
> tunables.
>=20
>=20
> For other features though, it feels like we would be better off if
> we could turn it on by default with no config. These are things
> that can be thought of as migration infrastructre / transport
> architectural designs.
>=20
>=20
> eg it would be nice to be able to use multifd by default for
> migration. We would still want a tunable to control the number
> of channels, but we ought to be able to just start with a default
> number of channels automatically, so the tunable is only needed
> for special cases.

Right, I agree in part - but we do need those tunables to exist; we rely
on being able to turn things on or off, or play with the tunables
to debug and get performance.  We need libvirt to enumerate the tunables
from qemu rather than having to add code to libvirt every time.
They're all in QAPI definitions anyway - libvirt really shouldn't be
adding code each time.   Then we could have a  virsh migrate --tunable
rather than having loads of extra options which all have different names
from qemu's name for the same feature.

> This post-copy is another case.  We should start off knowing
> we can switch to post-copy at any time. We should further be
> able to add pre-emption if we find it available. IOW, we should
> not have required anything more than 'switch to post-copy' to
> be exposed to mgmtm apps.

Some of these things are tricky; for example knowing whether or not you
can do postcopy depends on your exact memory configuration; some of that
is tricky to probe.

> Or enabling zero copy on either send or receive side.
>=20
> Or enabling kernel-TLS offload

Will kernel-TLS be something you'd want to automatically turn on?
We don't know yet whether it's a good idea if you don't have hardware
support.

> Or ..insert other interesting protocol feature...
>=20
>=20
>=20
> All this stems from our current migration protocol that started
> as a single unidirectional channel, which goes straight into
> the migration data stream, with no protocol handshake  and
> thus no feature negotiation either.
>=20
> We've offloaded feature negotiation to libvirt and in turn to
> the mgmt app and this is awful, for thue layers above, but
> also awful for QEMU. Because multifd requires mgmt app opt-in,
> we can wait 10 years and there will still be countless apps
> using single-fd mode because they've not been updated to
> opt-in.  If we negotiated features at QEMU level we could
> have everything using multifd in a few years, and have dropped
> single-fd mode a few years later.
>=20
>=20
> So rather than following our historical practice, anjd adding
> yet another migration parameter for a specific feature, I'd
> really encourage us to put a stop to it and future proof
> ourselves.
>=20
>=20
> Introduce one *final-no-more-never-again-after-this* migration
> capability called "protocol-negotiation".
>=20
>=20
> When that capability is set, first declare that henceforth the
> migration transport is REQUIRED to support **multiple**,
> **bi-directional** channels. We might only use 1 TCP channel
> in some cases, but it declares our intent that we expect to be
> able to use as many channels as we see fit henceforth.
>=20
> Now define a protocol handshake. A 5 minute thought experiment
> starts off with something simple:
>=20
>    dst -> src:  Greeting Message:
>                   Magic: "QEMU-MIGRATE"  12 bytes
>                   Num Versions: 1 byte
>                   Version list: 1 byte * num versions
>                   Num features: 4 bytes
>                   Feature list: string * num features
>=20
>    src -> dst:  Greeting Reply:
>                   Magic: "QEMU-MIGRATE" 12 bytes
>                   Select version: 1 byte
>                   Num select features: 4 bytes
>                   Selected features: string * num features  =20
>=20
>    .... possibly more src <-> dst messages depending on
>         features negotiated....
>=20
>    src -> dst:  start migration
> =20
>     ...traditional migration stream runs now for the remainder
>        of this connection ...

Don't worry about designing the bytes; we already have a command
structure; we just need to add a MIG_CMD_FEATURES and a=20
MIG_RP_MSG_FEATURES
(I'm not sure what we need to do for RDMA; or what we do for exec: or
savevm)

> I suggest "dst" starts first, so that connecting to a dst lets you
> easily debug whether QEMU is speaking v2 or just waiting for the
> client to send something as traditionally the case.
>=20
> This shouldn't need very much code, and it gives us flexibility
> to do all sorts of interesting things going forward with less
> overhead for everyone involved.
>=20
> We can layer in a real authentication system like SASL after
> the greeting without any libvirt / mgmt app support
>=20
> We can enable zero-copy at will. We can enable kernel-TLS at
> will. We can add new TCP connections for clever feature XYZ.
>=20
> We get a back channel every time, so dst can pass info back
> to the src to optimize behaviour.
>=20
> We can experiment with features and throw them away again
> later without involving the mgmt app, since we negotiate
> their use.
>=20
>=20
> With regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>=20
--=20
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


