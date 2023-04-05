Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E84C6D75E5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 09:52:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjxvU-0000uS-KP; Wed, 05 Apr 2023 03:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjxvH-0000sS-ED
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 03:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pjxvE-0008Jw-PR
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 03:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680681071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DBEIT7dwEZdmHTEQLW/eajYnQk6si81aebMLhSmcG6o=;
 b=W1RP3XBo1zCt1rUqpncFU0L5xBLuOIEei6FuRp0DlkAeQlqaOQtvOw2latFmULCF1ZakZq
 d4izzNQJnmlZOOdPHmD4hSY1Z/msZIxLtDljz3fuzIPbXKIBZ5kKnAyNjLHFbCSrfEHpAS
 +8ZQRuriiFcW30Nz3TtOtMlxGfnFX5U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590--nqQ9JyLP22WgS4reMBa0g-1; Wed, 05 Apr 2023 03:51:10 -0400
X-MC-Unique: -nqQ9JyLP22WgS4reMBa0g-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-501d484e26aso833071a12.0
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 00:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680681069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DBEIT7dwEZdmHTEQLW/eajYnQk6si81aebMLhSmcG6o=;
 b=HBS78t/KH78vBVfvEryVQt2Qw4qqZGCihylzxjzM564GOBXKi2LVA2HT1yiTCDdnaL
 ZqRL2or2tbGLxeswBQMjTwelwY7eXuGikdN4saI8GLiqiyS06v7VbuFOQpo2mXQ69Mud
 N3xIEh3h1dcg7gJNTjAeO/IW8KJ0bayOYbm/4YgShrxcjcxaLPjOVNzUcQQpEf5sheHU
 /Luv6di00nRdue/vZfoyW+FT3AB6YxgdgWHEy8T3uI/StHy2j2s71uum6qleJnyTdTYL
 h2BOL3qPFah/qNmk50YArFJkftIcqmraoaknAF138kh8Obh+1P3z2WmFNSIoEuJ5VImx
 fYyw==
X-Gm-Message-State: AAQBX9fwKN2GKIu7/H7flZ+8PJthQIvp1bRgoVvU9NKGFkBPBfAbu/1R
 ENRqCQZF1srGf0E3SysGnhLZu/L2dMxsE+h7Ec0TFVAKYOtQ8w4Rai2NJAecurcAQotjdKU0v2K
 Isdn1Jw4+8U4Wvbk=
X-Received: by 2002:a05:6402:84f:b0:4b6:821e:1859 with SMTP id
 b15-20020a056402084f00b004b6821e1859mr867531edz.7.1680681069055; 
 Wed, 05 Apr 2023 00:51:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350YbARkbZT8S5hMeRLUMPNy1oCHW5vySuNg58Olj9px8bHSpIoOP8ZBT7xjX7490bA4eOj1FZA==
X-Received: by 2002:a05:6402:84f:b0:4b6:821e:1859 with SMTP id
 b15-20020a056402084f00b004b6821e1859mr867519edz.7.1680681068759; 
 Wed, 05 Apr 2023 00:51:08 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 dn25-20020a05640222f900b004be11e97ca2sm6756898edb.90.2023.04.05.00.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 00:51:08 -0700 (PDT)
Date: Wed, 5 Apr 2023 09:51:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Yu Zhang <yu.zhang@ionos.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Jinpu Wang <jinpu.wang@ionos.com>, Elmar Gerdes <elmar.gerdes@ionos.com>
Subject: Re: an issue for device hot-unplug
Message-ID: <20230405095107.19367c7e@imammedo.users.ipa.redhat.com>
In-Reply-To: <CAHEcVy5xSvOWXNV99DTQ0dBMEATZzEgjw2exKMk5wUstjmR3Kw@mail.gmail.com>
References: <CAHEcVy5SV34jaubY5F-q=H+smvMVOzKbb=rTaNJDNXyGdFaLZg@mail.gmail.com>
 <94e21f89-0a3e-701b-7171-7398dff9ce46@redhat.com>
 <CAHEcVy5TiQwYofhCe3RpdFopYzYWbGnL7EO5nE_HQTAVEeaqAg@mail.gmail.com>
 <CAMGffE=cxQzMrT+wbPazApmsGfgAx6z8O0DzEJfWyMQaGFs80w@mail.gmail.com>
 <20230404142553.31030bb7@imammedo.users.ipa.redhat.com>
 <CAHEcVy5xSvOWXNV99DTQ0dBMEATZzEgjw2exKMk5wUstjmR3Kw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 4 Apr 2023 18:00:06 +0200
Yu Zhang <yu.zhang@ionos.com> wrote:

> > this patch targets corner case of early boot where
> > guest hasn't initialized ACPI subsystem yet and 'broken'
> > management asking to unplug device too early which leads
> > to device stuck in being unplugged state due to regression
> > in QEMU.
> > However, It doesn't apply to fully booted guest. =20
>=20
> by adding a few debug lines I see that in
> acpi_pcihp_device_unplug_request_cb(),
>=20
>     pdev->qdev.pending_deleted_event =3D true;
>=20
> was executed, which then directly triggered the error in:

If you do repeat unplug request right away after the 1st one,
then getting this error is expected behavior
(as guest needs time to react and unplug device).

> void qmp_device_del(const char *id, Error **errp)
> {
>     DeviceState *dev =3D find_device_state(id, errp);
>     if (dev !=3D NULL) {
>         if (dev->pending_deleted_event &&
>             (dev->pending_deleted_expires_ms =3D=3D 0 ||
>              dev->pending_deleted_expires_ms >
> qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL))) {
>             error_setg(errp, "Device %s is already in the "
>                              "process of unplug", id);
>             return;
>         }
>=20
>         qdev_unplug(dev, errp);
>     }
> }
>=20
> In QEMU code, there are 6 lines where this flag is changed:
>=20
> hw/core/qdev.c:564:        dev->pending_deleted_event =3D false;
> hw/core/qdev.c:601:        dev->pending_deleted_event =3D true;
> hw/acpi/pcihp.c:219:                    qdev->pending_deleted_event =3D f=
alse;
> hw/acpi/pcihp.c:359:    pdev->qdev.pending_deleted_event =3D true;
> hw/pci/pcie.c:516:        dev->qdev.pending_deleted_event =3D false;
> hw/pci/pcie.c:573:    dev->pending_deleted_event =3D true;
>=20
> Considering the complexity of the code, the logic for setting and clearing
> this flag
> seems not quite straightforward. I doubt that the setting of
> pending_deleted_event in
> acpi_pcihp_device_unplug_request_cb() is the appropriate approach to
> accomplish its target.

It's true that pending_deleted_event is abused by failover and later by
pci hotplug.
see comment 15 where Paolo suggest how to fix it
   https://bugzilla.redhat.com/show_bug.cgi?id=3D1878659#c15

and than see comment 17, explaining that cleaning up pending_deleted_event
usage won't change current behavior.

Anyways, clean up patches are welcome if you wish to follow up
on Paolo's suggestion.

> On Tue, Apr 4, 2023 at 2:25=E2=80=AFPM Igor Mammedov <imammedo@redhat.com=
> wrote:
>=20
> > On Tue, 4 Apr 2023 08:45:54 +0200
> > Jinpu Wang <jinpu.wang@ionos.com> wrote:
> > =20
> > > Hi Yu,
> > >
> > > On Mon, Apr 3, 2023 at 6:59=E2=80=AFPM Yu Zhang <yu.zhang@ionos.com> =
wrote: =20
> > > >
> > > > Dear Laurent,
> > > >
> > > > Thank you for your quick reply. We used qemu-7.1, but it is =20
> > reproducible with qemu from v6.2 to the recent v8.0 release candidates.=
 =20
> > > > I found that it's introduced by the commit  9323f892b39 (between =20
> > v6.2.0-rc2 and v6.2.0-rc3). =20
> > > >
> > > > If it doesn't break anything else, it suffices to remove the line =
=20
> > below from acpi_pcihp_device_unplug_request_cb(): =20
> > > >
> > > >     pdev->qdev.pending_deleted_event =3D true;
> > > >
> > > > but you may have a reason to keep it. First of all, I'll open a bug=
 in =20
> > the bug tracker and let you know. =20
> > > >
> > > > Best regards,
> > > > Yu Zhang =20
> > > This patch from Igor Mammedov seems relevant,
> > > =20
> > https://lore.kernel.org/qemu-devel/20230403131833-mutt-send-email-mst@k=
ernel.org/T/#t
> >
> > this patch targets corner case of early boot where
> > guest hasn't initialized ACPI subsystem yet and 'broken'
> > management asking to unplug device too early which leads
> > to device stuck in being unplugged state due to regression
> > in QEMU.
> > However, It doesn't apply to fully booted guest.
> >
> > [...]
> > =20
> > > >> > The purpose is for detecting the end of the PCI device hot-unplu=
g. =20
> > However, we feel the =20
> > > >> > error confusing. How is it possible that a disk "is already in t=
he =20
> > process of unplug" =20
> > > >> > during the first hot-unplug attempt? So far as I know, the issue=
 =20
> > was also encountered by =20
> > > >> > libvirt, but they simply ignored it:
> > > >> >
> > > >> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1878659
> > > >> > <https://bugzilla.redhat.com/show_bug.cgi?id=3D1878659> =20
> > see my other reply email/BZ comment 17.
> >
> > [...]
> >
> > =20


