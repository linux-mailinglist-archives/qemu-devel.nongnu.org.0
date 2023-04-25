Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 425FF6EE453
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 16:55:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prK4i-0003zW-8E; Tue, 25 Apr 2023 10:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1prK4f-0003x0-AB
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 10:55:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1prK4d-0003VP-8M
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 10:55:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682434517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vImvLEW41a3YhOKau3mpKQi0Fu1GW9i4phkgRjhJJrs=;
 b=dgCTgiOuxNM8+DgnIKVR8ZY16n8BkfXDfSKZoPxaEa9QolffMvfT/sU5l9Az9D1YU/layq
 rITknJIlBTGXPrwA59BctB/yTNERBzo01k2jhoOniwPJIA8O+OMquSs2U6Zw5C9nhP1YBP
 9jSOL3wh4DKUOTe0n90UiKb3GMOa8Lg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-dB2KejPvNhCRs2o_iTFPwQ-1; Tue, 25 Apr 2023 10:55:10 -0400
X-MC-Unique: dB2KejPvNhCRs2o_iTFPwQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a34d3e5ebso519080466b.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 07:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682434509; x=1685026509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vImvLEW41a3YhOKau3mpKQi0Fu1GW9i4phkgRjhJJrs=;
 b=g+g8PYeFoxlIE2WOZ8T3S2GnA9RZJOZzhC8AJ+7gPvRF/x2dkXiAasqAbH8S9t0em5
 54BAG5ZPdOZtXC4iFx7P+4rP4WiYqozhixNpxKn49lyShs9IkCu5bsujr5PpndDpd673
 wRhkLt/GXQ69cBIZ0X5VVfunoDQ2teRwjTzPh9fRKO8RgZXrbXiLzxEBXBfsJPkoJaDM
 6aleaKgzAiYszQy5e6Z7rvDjRSfTvw+8F6Q+HbvgWHPehk2ZfXZalrg/HzNoVuQfZofK
 DAVQm/EySz8YXfVJMtKoeZ8SxNWDWczx3RWqnNZJV8nFKqgvLSkvZHOhsxRYKOIoKUTg
 NCNw==
X-Gm-Message-State: AAQBX9fpqPjW3KcQ38u0+mACwd15H11UnBlcXo34z228F8hpEr3I4+PJ
 cGefrK3ZqR+wQvwWSMhHfiX+sXUQo4vd8pADdw3X8DRoNJWSAj/HnXypBjXO9HTiz1Jg/5HK6b3
 KHNVevk+iQgYBe8k=
X-Received: by 2002:a17:907:20d9:b0:94e:f8fe:78c with SMTP id
 qq25-20020a17090720d900b0094ef8fe078cmr12131185ejb.72.1682434509463; 
 Tue, 25 Apr 2023 07:55:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350aMN8ZG/2wvuxA9HQv/a5ure01klKOCqzIPC3jJOiqiL1sai5L5n4qA7d1GdICYkgXt96BMhg==
X-Received: by 2002:a17:907:20d9:b0:94e:f8fe:78c with SMTP id
 qq25-20020a17090720d900b0094ef8fe078cmr12131168ejb.72.1682434509177; 
 Tue, 25 Apr 2023 07:55:09 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 e6-20020a1709062c0600b0094ef2003581sm6856275ejh.153.2023.04.25.07.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 07:55:08 -0700 (PDT)
Date: Tue, 25 Apr 2023 16:55:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 david@redhat.com, peterx@redhat.com, pbonzini@redhat.com,
 den-plotnikov@yandex-team.ru, lersek@redhat.com, kraxel@redhat.com
Subject: Re: [PATCH 3/3] pci: ROM preallocation for incoming migration
Message-ID: <20230425165507.0eb52454@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230425093235-mutt-send-email-mst@kernel.org>
References: <20230425105603.137823-1-vsementsov@yandex-team.ru>
 <20230425105603.137823-4-vsementsov@yandex-team.ru>
 <20230425084121-mutt-send-email-mst@kernel.org>
 <12e32fad-f4a2-73df-8345-2ce7ac56aa35@yandex-team.ru>
 <56042897-8efc-d77d-68eb-9af94a8921a5@yandex-team.ru>
 <20230425093235-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 25 Apr 2023 09:32:54 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Apr 25, 2023 at 04:19:12PM +0300, Vladimir Sementsov-Ogievskiy wr=
ote:
> > On 25.04.23 16:07, Vladimir Sementsov-Ogievskiy wrote: =20
> > > On 25.04.23 15:43, Michael S. Tsirkin wrote: =20
> > > > On Tue, Apr 25, 2023 at 01:56:03PM +0300, Vladimir Sementsov-Ogievs=
kiy wrote: =20
> > > > > On incoming migration we have the following sequence to load opti=
on
> > > > > ROM:
> > > > >=20
> > > > > 1. On device realize we do normal load ROM from the file
> > > > >=20
> > > > > 2. Than, on incoming migration we rewrite ROM from the incoming R=
AM
> > > > > =C2=A0=C2=A0=C2=A0 block. If sizes mismatch we fail.
> > > > >=20
> > > > > This is not ideal when we migrate to updated distribution: we hav=
e to
> > > > > keep old ROM files in new distribution and be careful around romf=
ile
> > > > > property to load correct ROM file. Which is loaded actually just =
to
> > > > > allocate the ROM with correct length.
> > > > >=20
> > > > > Note, that romsize property doesn't really help: if we try to spe=
cify
> > > > > it when default romfile is larger, it fails with something like:
> > > > >=20
> > > > > romfile "efi-virtio.rom" (160768 bytes) is too large for ROM size=
 65536
> > > > >=20
> > > > > This commit brings new behavior for romfile=3D"",romsize=3DSIZE c=
ombination
> > > > > of options. Current behavior is just ignore romsize and not load =
or
> > > > > create any ROM.
> > > > >=20
> > > > > Let's instead preallocate ROM, not loading any file. This way we =
can
> > > > > migrate old vm to new environment not thinking about ROM files on
> > > > > destination host:
> > > > >=20
> > > > > 1. specify romfile=3D"",romsize=3DSIZE on target, with correct SI=
ZE
> > > > > =C2=A0=C2=A0=C2=A0 (actually, size of romfile on source aligned u=
p to power of two, or
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 just original romsize option on source)
> > > > >=20
> > > > > 2. On device realize we just preallocate ROM, and not load any fi=
le
> > > > >=20
> > > > > 3. On incoming migration ROM is filled from the migration stream
> > > > >=20
> > > > > As a bonus we avoid extra reading from ROM file on target.
> > > > >=20
> > > > > Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-tea=
m.ru> =20
> > > > why is this a bad idea:
> > > > - on source presumably user overrides romfile
> > > > - we have a general rule that source and destination flags must mat=
ch
> > > >=20
> > > > I propose instead to ignore romfile if qemu is incoming migration
> > > > and romsize has been specified.
> > > >  =20
> > >=20
> > > Hmm, that would work even better, as no additional options needed, th=
anks. I'll resend
> > >  =20
> >=20
> > romsize needed anyway, of course. =20
>=20
> yes but it can match on source and dest.

Aren't we pushin issue from QEMU(/how distro packages firmware/)
to mgmt layer(s) going this way?=20

>=20
> > --=20
> > Best regards,
> > Vladimir =20
>=20
>=20


