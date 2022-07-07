Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB9E56AD58
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 23:20:03 +0200 (CEST)
Received: from localhost ([::1]:46928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Yuo-0004zr-7q
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 17:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o9Ytu-0004Jp-LN
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 17:19:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o9Yts-0000Uh-NI
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 17:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657228744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W89Oxywcu+y0KOWqKPU+abz6mwu273vjHG0r5TYqP44=;
 b=cCsL6xmVmgm4Brv6IjmLJQGTuaokN6Irp+f4MtPbtcYnubspEPwWSSQfN+I9h6V9akMIdf
 yyQbnfn1+iKAfCyB3FOxszJjJLTeA4YQ6kr5Ods11hDUocx0VpFDbJWDY6ip4OZl/j3j08
 FTNQUVbDlVmKlcEhF7oFv290q0cQ5y8=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-SKl_J24XNqywZWvlhzdgrg-1; Thu, 07 Jul 2022 17:18:56 -0400
X-MC-Unique: SKl_J24XNqywZWvlhzdgrg-1
Received: by mail-vk1-f200.google.com with SMTP id
 m63-20020a1fee42000000b0036c8981d9bdso5739314vkh.16
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 14:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=W89Oxywcu+y0KOWqKPU+abz6mwu273vjHG0r5TYqP44=;
 b=uhz7RWVdCwVOCSUmsugapXoLtbuzm1LT5oKU4GxyANPBpkzW147JWMtznY5w+okk63
 W4IaA6j69zQcsTv4omcXl+un9zHw0D2QECP001go1Wxj/gy23w9qzhw/rzDoKbfumkAr
 qq0joHOof2a1Bp7Wu5EhLBV4hKzS0wg0Z+NCPP8WPC/n2gTwTF8q0d87utmrIFlYd3yu
 +Re2krnjb9EWGLqOOtxGjwdtBkr8nsoVE6Mtkj/XG3GhyzNCGu1OZwlBDMHy0txQuCVo
 bzMzCJnjIm8rWu8bqfv8kLeC+U4cfED5IgnVoGC3wb5GL6JovCwxP3DOf+Gu/iRg/wDt
 Glyw==
X-Gm-Message-State: AJIora9NdsOu1zwLIXTZ8yQO5piRghZtWdQvgdtDnaK8lnHnk9Q6ohWj
 ixk8DzITVU+CqON6fMeQblkbnTYyXmn4uaDfMPuuuXp+GqpmcmjKjhMAS+kgJdeJETY0/yVxAX2
 ll5VVxC5UwbDwuUE=
X-Received: by 2002:a05:6102:a34:b0:354:4268:c2d4 with SMTP id
 20-20020a0561020a3400b003544268c2d4mr26760267vsb.21.1657228725777; 
 Thu, 07 Jul 2022 14:18:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sxjYeeq+dMbRQKxAdysunBn6BmF/ejPUkPJZraIYkjTQV/ywOpfqGm6o165y0i/JwxJaHGfA==
X-Received: by 2002:a05:6102:a34:b0:354:4268:c2d4 with SMTP id
 20-20020a0561020a3400b003544268c2d4mr26760251vsb.21.1657228725529; 
 Thu, 07 Jul 2022 14:18:45 -0700 (PDT)
Received: from ?IPv6:2804:431:c7ec:44c:8a5c:6c79:3007:b149?
 ([2804:431:c7ec:44c:8a5c:6c79:3007:b149])
 by smtp.gmail.com with ESMTPSA id
 2-20020a670702000000b0035434a68658sm10329343vsh.14.2022.07.07.14.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:18:44 -0700 (PDT)
Message-ID: <cbca16586126e2bf1034477f907446a3cf1f4594.camel@redhat.com>
Subject: Re: [PATCH v3 3/3] migration/multifd: Warn user when zerocopy not
 working
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Juan
 Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Date: Thu, 07 Jul 2022 18:18:41 -0300
In-Reply-To: <Ysc80LAUttN/7QRZ@xz-m1.local>
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-4-leobras@redhat.com> <YsceXwzZGaWBBe5D@xz-m1.local>
 <CAJ6HWG7d_v1Zc9wKZJrGYb7U3JXx08-adyWATDiQ9gjvsjU6ow@mail.gmail.com>
 <Ysc80LAUttN/7QRZ@xz-m1.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2022-07-07 at 16:06 -0400, Peter Xu wrote:
> On Thu, Jul 07, 2022 at 04:59:22PM -0300, Leonardo Bras Soares Passos wro=
te:
> > Hello Peter,
> >=20
> > On Thu, Jul 7, 2022 at 2:56 PM Peter Xu <peterx@redhat.com> wrote:
> > >=20
> > > On Mon, Jul 04, 2022 at 05:23:15PM -0300, Leonardo Bras wrote:
> > > > Some errors, like the lack of Scatter-Gather support by the network
> > > > interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail o=
n
> > > > using
> > > > zero-copy, which causes it to fall back to the default copying
> > > > mechanism.
> > > >=20
> > > > After each full dirty-bitmap scan there should be a zero-copy flush
> > > > happening, which checks for errors each of the previous calls to
> > > > sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy, =
then
> > > > increment dirty_sync_missed_zero_copy migration stat to let the use=
r
> > > > know
> > > > about it.
> > > >=20
> > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > > ---
> > > > =C2=A0migration/ram.h=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> > > > =C2=A0migration/multifd.c | 2 ++
> > > > =C2=A0migration/ram.c=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++++
> > > > =C2=A03 files changed, 9 insertions(+)
> > > >=20
> > > > diff --git a/migration/ram.h b/migration/ram.h
> > > > index ded0a3a086..d3c7eb96f5 100644
> > > > --- a/migration/ram.h
> > > > +++ b/migration/ram.h
> > > > @@ -87,4 +87,6 @@ void ram_write_tracking_prepare(void);
> > > > =C2=A0int ram_write_tracking_start(void);
> > > > =C2=A0void ram_write_tracking_stop(void);
> > > >=20
> > > > +void dirty_sync_missed_zero_copy(void);
> > > > +
> > > > =C2=A0#endif
> > > > diff --git a/migration/multifd.c b/migration/multifd.c
> > > > index 684c014c86..3909b34967 100644
> > > > --- a/migration/multifd.c
> > > > +++ b/migration/multifd.c
> > > > @@ -624,6 +624,8 @@ int multifd_send_sync_main(QEMUFile *f)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if (ret < 0) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_report_err(err);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 } else if (ret =3D=3D 1) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 dirty_sync_missed_zero_copy();
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 }
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > >=20
> > > I know that Juan is working on some patch to only do
> > > multifd_send_sync_main() for each dirty sync, but that's not landed,
> > > right?
> >=20
> > That's correct, but I am hoping it should land before the release, so
> > the numbers will match.
> >=20
> >=20
> > >=20
> > > Can we name it without "dirty-sync" at all (so it'll work before/afte=
r
> > > Juan's patch will be applied)?=C2=A0 Something like "zero-copy-send-f=
allbacks"?
> >=20
> > It initially was something like that, but on the v2 thread there was
> > some discussion on
> > the topic, and it was suggested the number would not mean much to the
> > user, unless
> > it was connected to something else.
> >=20
> > Markus suggested the connection to @dirty-sync-count right in the
> > name, and Daniel suggested the above name, which sounds fine to me.
>=20
> Ah okay.
>=20
> But then I suggest we make sure it lands only after Juan's.. or it won't
> really match.=C2=A0 Also when Juan's patch ready, we'd also double check =
it will
> be exactly called once per iteration, or we can get confusing numbers.=C2=
=A0 I
> assume Juan will take care of that then.
>=20
> >=20
> > >=20
> > > The other thing is the subject may need to be touched up as right now=
 with
> > > the field we don't warn the user anymore on zero-copy-send fallbacks.
> >=20
> > Ok, Warning sounds misleading here.
> > What do you think about 'report' instead?
>=20
> Looks good.=C2=A0 Thanks,

Thank you for reviewing, Peter!

Leo

>=20


