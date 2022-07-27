Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D013058224A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 10:40:20 +0200 (CEST)
Received: from localhost ([::1]:55336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGcaY-00074V-Ju
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 04:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oGcMs-00059z-Al
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:26:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oGcMo-0001TC-N2
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658910364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ICpaEiSxojxXFzhdsxw1apYjlgzn3uwKsV6RQrtOq2M=;
 b=I3sJ6Eqg/DgtwfZZQDbG9GXGAyPbzN/FdGIXk/wbZGfa3+oU/u0QiRfQD3ndJr2nsgkZgX
 /0YkwGNamh5jh3URNlWdRqUx7Ifar52AhEnh36ReWJJPm2oQuqSEeu3qtHXKwaYc2VQMUT
 fDtXnb3pMH5r1QpP+/putsKFAV4WIg8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-w0heT01kPz-kiQkPu5iF-g-1; Wed, 27 Jul 2022 04:26:03 -0400
X-MC-Unique: w0heT01kPz-kiQkPu5iF-g-1
Received: by mail-ed1-f69.google.com with SMTP id
 f18-20020a056402355200b0043be3af7a63so6096362edd.6
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 01:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ICpaEiSxojxXFzhdsxw1apYjlgzn3uwKsV6RQrtOq2M=;
 b=tUVOBb1foUcC5xfusqsDZSu/CmjVTXOK+4SlXufjCQvbac6wT5kw3hGdalQTU0Y0KG
 OAhDKatjOOswMqKSOq+VNRS3TmGbAKj+cDMF/fR9FR6DekxlU5+g/i0O0oNwvPU5+GzP
 2JBAsN/AQVHEYlKWG0te5ROLWSirktTn8ysKMS2Zz4kKH+ld9XYuo2GtIMWxR/yOVFyE
 ub0dWNbelueClOWikDYmaiZEHUE6gxqb24GzPImzNzxdINJWiid2QG+mVQbQWmvxcyDE
 z/hBPCqK4XMVqOa51k9WoYfgLdYLjdBe9QPbRRfIFhkSdWANh9VR2kij3jQ7A/mX1nUg
 Nx8Q==
X-Gm-Message-State: AJIora/6kf1bXXPSE9V/vrzmjY97IXY8luJ6g6lR2y0AGHQpU21zkdO1
 t1QM/+riB+DLRYPh3BQpRs0Vuuo/xTvsKagH4zCzWt/hGwoibcUi1T3tCn4dxZzzQo5P6RPt2EI
 8ChIA+MgOU9sTLgY=
X-Received: by 2002:a17:907:9803:b0:72e:ec55:b2a5 with SMTP id
 ji3-20020a170907980300b0072eec55b2a5mr16724878ejc.347.1658910362283; 
 Wed, 27 Jul 2022 01:26:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ueb+WnphRSBL0aTK4YbtWw6KbU0Ia03bZNQbklY0H0RJXGFG9JWwUo/5JxOCaagBtPL0KbnQ==
X-Received: by 2002:a17:907:9803:b0:72e:ec55:b2a5 with SMTP id
 ji3-20020a170907980300b0072eec55b2a5mr16724853ejc.347.1658910362048; 
 Wed, 27 Jul 2022 01:26:02 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a170906314200b0072b3406e9c2sm7338364eje.95.2022.07.27.01.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 01:26:01 -0700 (PDT)
Date: Wed, 27 Jul 2022 10:26:00 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Roman Kagan
 <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, yc-core@yandex-team.ru, Paolo Bonzini
 <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Message-ID: <20220727102600.0528cdcb@redhat.com>
In-Reply-To: <630f6dd4-7bb2-0023-9c9a-542e1ce3e0b9@yandex-team.ru>
References: <20220720102555.874394-1-rvkagan@yandex-team.ru>
 <Ytfcivbtj8+JnLfz@redhat.com> <YtfgQN+BQ8Egn0ha@rvkaganb>
 <YtfhWgayuGKNVjGq@redhat.com>
 <630f6dd4-7bb2-0023-9c9a-542e1ce3e0b9@yandex-team.ru>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 25 Jul 2022 16:59:21 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:

> On 7/20/22 14:04, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, Jul 20, 2022 at 02:00:16PM +0300, Roman Kagan wrote: =20
> >> On Wed, Jul 20, 2022 at 11:44:26AM +0100, Daniel P. Berrang=C3=A9 wrot=
e: =20
> >>> On Wed, Jul 20, 2022 at 01:25:55PM +0300, Roman Kagan wrote: =20
> >>>> It's possible to create non-working configurations by attaching a de=
vice
> >>>> to a derivative of PCIe slot (pcie-root-port, ioh3420, etc) and
> >>>> specifying a slot number other that zero, e.g.:
> >>>>
> >>>>      -device pcie-root-port,id=3Ds0,... \
> >>>>      -device virtio-blk-pci,bus=3Ds0,addr=3D4,...
> >>>>
> >>>> Make QEMU reject such configurations and only allow addr=3D0 on the
> >>>> secondary bus of a PCIe slot. =20
> >>>
> >>> What do you mean by 'non-working' in this case.  The guest OS boots
> >>> OK, but I indeed don't see the device in the guest, but IIUC it was
> >>> said that was just because Linux doesn't scan for a non-zero slot. =20
> >>
> >> Right.  I don't remember if it was Linux or firmware or both but indeed
> >> at least Linux guests don't see devices if attached to a PCIe slot at
> >> addr !=3D 0.  (Which is kinda natural for a thing called "slot", isn't=
 it?) =20
> >=20
> > I vaguely recall there was an option to tell linux to scan all slots,
> > not just slot 0, not sure if that's applicable here.
> >  =20
> >> =20
> >>> That wouldn't be a broken config from QEMU's POV though, merely a
> >>> guest OS limitation ? =20
> >>
> >> Strictly speaking it wouldn't, indeed.  But we've had created such a
> >> configuration (due to a bug in our management layer) and spent
> >> non-negligible time trying to figure out why the attached device didn't
> >> appear in the guest.  So I thought it made sense to reject a
> >> configuration which is known to confuse guests.  Doesn't it? =20
> >=20
> > If a configuration is a permissible per the hardware design / spec, then
> > QEMU should generally allow it.  We don't want to constrain host side
> > configs based on the current limitations of guest OS whose behaviour can
> > change over time, or where a different guest OS may have a different PO=
V.
> >  =20
>=20
> If I understand correctly further answers the configration that we try to=
 forbid is not permissible by PCIe spec. So seems valid to forbid it. We st=
ill need to mention specification in commit message and in the comment.
>=20
> If we still afraid to forbid at once that invalid configuration that was =
previously allowed, may be we can proceed with some of the following:
>=20
> 1. Make a deprecation period of three releases and print only warning dur=
ing this period. And forbid the invalid configuration three releases later.=
 Still I'm not sure that someone will see these warnings in logs..
>=20
> 2. Make a boolean config option, like CONFIG_PCIE_STRICT, which forbids i=
nvalid configurations. This way we keep default behavior, that allows to te=
st something unusual, but add an option that we can use for production solu=
tion where it's important to reduce number of possibilities to break the VM.
>=20
> What do you think?
Given that non zero slots are used only on broken hardware/firmware and it's
just workaround for those in linux kernel.
I wouldn't bother with 1 or 2 (I think just a note on change log should
be sufficient)



