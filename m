Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1C31FCC8E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 13:40:06 +0200 (CEST)
Received: from localhost ([::1]:50546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlWQH-0001vm-3a
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 07:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jlWPA-0001Gz-38
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 07:38:57 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jlWP7-0002L6-Hq
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 07:38:55 -0400
Received: by mail-wr1-x442.google.com with SMTP id a6so10537wrm.4
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 04:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eKJDl/qcRCeVzc5vrbNJgr7kSv8io0a9G4yfVitCrek=;
 b=dbM0uFvix+VpWUIzy6IAjA3+lyufVihEoerPOGO6OyETIn+mOgOpfPmGHzT9et0+S+
 L0zo3YlqWV6sOcbBGW1WSMKwRj+OoeoHfhp/vM3cZUeBtfLS2QnD5qTzykvm8cSDBRog
 DU3aXbEtkou+qVz7cPEwoJqsIQD1sVA0lORhRuQAE07QPk4CjIQlRZb5Pg7WwL/sYPa/
 xeGgmK0loVY2Aroyse4GQepGKtaXlgWTmkBWH4WDQBKWr6xRxsB3N0R41ny6/V7uWvJp
 uS+zkFPYK2f4N4edZ/gy+TK3LCnfIXgQx+fc51qCrfcfOGQ+5R9X7vPgcWwWGgKLJ5Qz
 gvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eKJDl/qcRCeVzc5vrbNJgr7kSv8io0a9G4yfVitCrek=;
 b=aorubzRkNUHvQOyI2ILC6bUEHH7tRdLaQ647CGmc1HjnRJ7q0tO0LEbTSNjDdwzoMT
 x4vVxR05895Fu1Oz4UHrMTqVfsColepG/j28hafcNiTNtFb3axSZi71KiQXXXhgM+2oD
 67yRBk8hEX/RT4q4MFZlO4V5Lr/7KFQwhWU71+Y3PlxFjQhyrkIC4CcrYdF0m2NaSYrl
 q96rbhuMmbYIXpTjq7TTkRCjyXvWkuPKhh0orICcVffCVoQC64+8B1SBtJ7y7a5UYTNX
 iuQto9ZzRuHbLYZYtEKOoHO2yhFLtak2s8Z9qVBi0+Y0t+Q+vySPO/hJtOX3adDbB9bg
 Vt9g==
X-Gm-Message-State: AOAM533CjTkDRAcJ+aKrQV14TclnNRtXSayvmzPMd0HUJ9djfmJH4tfI
 FeNJfPqi0ODmsaCIV2xMwNk=
X-Google-Smtp-Source: ABdhPJxRFrC579rQqddMx6p3WOn62gUsUjrUiucQId4YmpAGY3IlyZOS6HNzlTMh3Fy51Fskb6aX4A==
X-Received: by 2002:a5d:5389:: with SMTP id d9mr8611065wrv.77.1592393931912;
 Wed, 17 Jun 2020 04:38:51 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id d16sm30397wmd.42.2020.06.17.04.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 04:38:50 -0700 (PDT)
Date: Wed, 17 Jun 2020 12:38:48 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2] hw/virtio/vhost: re-factor vhost-section and allow
 DIRTY_MEMORY_CODE
Message-ID: <20200617113848.GB1728005@stefanha-x1.localdomain>
References: <20200604134022.10564-1-alex.bennee@linaro.org>
 <20200605090334.GB59930@stefanha-x1.localdomain>
 <87o8px4xxp.fsf@linaro.org>
 <20200609111044.GD92564@stefanha-x1.localdomain>
 <87v9k04he8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Content-Disposition: inline
In-Reply-To: <87v9k04he8.fsf@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2020 at 12:18:07PM +0100, Alex Benn=E9e wrote:
>=20
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>=20
> > On Fri, Jun 05, 2020 at 11:19:30AM +0100, Alex Benn=E9e wrote:
> >>=20
> >> Stefan Hajnoczi <stefanha@redhat.com> writes:
> >>=20
> >> > On Thu, Jun 04, 2020 at 02:40:22PM +0100, Alex Benn=E9e wrote:
> >> >> The purpose of vhost_section is to identify RAM regions that need to
> >> >> be made available to a vhost client. However when running under TCG
> >> >> all RAM sections have DIRTY_MEMORY_CODE set which leads to problems
> >> >> down the line.
> >> >>=20
> >> >> Re-factor the code so:
> >> >>=20
> >> >>   - steps are clearer to follow
> >> >>   - reason for rejection is recorded in the trace point
> >> >>   - we allow DIRTY_MEMORY_CODE when TCG is enabled
> >> >>=20
> >> >> We expand the comment to explain that kernel based vhost has specif=
ic
> >> >> support for migration tracking.
> >> >>=20
> >> >> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> >> >> Cc: Michael S. Tsirkin <mst@redhat.com>
> >> >> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >> >> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> >> >>=20
> >> >> ---
> >> >> v2
> >> >>   - drop enum, add trace_vhost_reject_section
> >> >>   - return false at any fail point
> >> >>   - unconditionally add DIRTY_MEMORY_CODE to handled cases
> >> >>   - slightly re-word the explanatory comment and commit message
> >> >> ---
> >> >>  hw/virtio/vhost.c      | 55 ++++++++++++++++++++++++++++++--------=
----
> >> >>  hw/virtio/trace-events |  3 ++-
> >> >>  2 files changed, 41 insertions(+), 17 deletions(-)
> >> >>=20
> >> >> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> >> >> index aff98a0ede5..120c0cc747b 100644
> >> >> --- a/hw/virtio/vhost.c
> >> >> +++ b/hw/virtio/vhost.c
> >> >> @@ -27,6 +27,7 @@
> >> >>  #include "migration/blocker.h"
> >> >>  #include "migration/qemu-file-types.h"
> >> >>  #include "sysemu/dma.h"
> >> >> +#include "sysemu/tcg.h"
> >> >>  #include "trace.h"
> >> >> =20
> >> >>  /* enabled until disconnected backend stabilizes */
> >> >> @@ -403,26 +404,48 @@ static int vhost_verify_ring_mappings(struct =
vhost_dev *dev,
> >> >>      return r;
> >> >>  }
> >> >> =20
> >> >> +/*
> >> >> + * vhost_section: identify sections needed for vhost access
> >> >> + *
> >> >> + * We only care about RAM sections here (where virtqueue can live)=
=2E If
> >> >
> >> > It's not just the virtqueue. Arbitrary guest RAM buffers can be plac=
ed
> >> > into the virtqueue so we need to pass all guest RAM to the vhost dev=
ice
> >> > backend.
> >> >
> >> >> + * we find one we still allow the backend to potentially filter it=
 out
> >> >> + * of our list.
> >> >> + */
> >> >>  static bool vhost_section(struct vhost_dev *dev, MemoryRegionSecti=
on *section)
> >> >>  {
> >> >> -    bool result;
> >> >> -    bool log_dirty =3D memory_region_get_dirty_log_mask(section->m=
r) &
> >> >> -                     ~(1 << DIRTY_MEMORY_MIGRATION);
> >> >> -    result =3D memory_region_is_ram(section->mr) &&
> >> >> -        !memory_region_is_rom(section->mr);
> >> >> -
> >> >> -    /* Vhost doesn't handle any block which is doing dirty-trackin=
g other
> >> >> -     * than migration; this typically fires on VGA areas.
> >> >> -     */
> >> >> -    result &=3D !log_dirty;
> >> >> +    MemoryRegion *mr =3D section->mr;
> >> >> +
> >> >> +    if (memory_region_is_ram(mr) && !memory_region_is_rom(mr)) {
> >> >> +        uint8_t dirty_mask =3D memory_region_get_dirty_log_mask(mr=
);
> >> >> +        uint8_t handled_dirty;
> >> >> +
> >> >> +        /*
> >> >> +         * Kernel based vhost doesn't handle any block which is do=
ing
> >> >> +         * dirty-tracking other than migration for which it has
> >> >> +         * specific logging support. However for TCG the kernel ne=
ver
> >> >> +         * gets involved anyway so we can also ignore it's
> >> >> +         * self-modiying code detection flags.
> >> >> +         */
> >> >> +        handled_dirty =3D (1 << DIRTY_MEMORY_MIGRATION);
> >> >> +        handled_dirty |=3D (1 << DIRTY_MEMORY_CODE);
> >> >
> >> > Wait, how is vhost going to support TCG self-modifying code detectio=
n?
> >> >
> >> > It seems like this change will allow vhost devices to run, but now Q=
EMU
> >> > will miss out on self-modifying code. Do we already enable vhost dir=
ty
> >> > memory logging for DIRTY_MEMORY_CODE memory somehwere?
> >>=20
> >> Well any guest code running will still trigger the SMC detection. It's
> >> true we currently don't have a mechanism if the vhost-user client
> >> updates an executable page.
> >
> > Seems like a problem. If it didn't matter we could get rid of
> > DIRTY_MEMORY_CODE entirely.
> >
> > If an exception is being made here because I/O devices aren't expected
> > to trigger SMC in real-world guests, please document it.
>=20
> In the comment here or somewhere in the docs?

If it's a user-visible limitation (e.g. DMA from vhost-user devices
bypasses TCG SMC checks and could result in behavior that differs from
built-in virtio device models), then the docs would be a good place.

Stefan

--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl7qAMgACgkQnKSrs4Gr
c8glsAf8CUYPVpAMAd6eq+1vkBVvZeJ1wmynP82fuPm22KlK0iXO9Y/yDCYPcWJH
gVToq+5loKDRcclRBuDXOOES4ibzel3DWbFvJUwCJviXeq2+3YqIoeSbHpCtNaRx
1vySVhEpLYDV7uFPqhFccr32wy2j+sWDvZaraiNBqa5mbLfEXrZeF52SVVGeN7pJ
HEeewsWNcCy/NiTf2dsijujEWd/6rONEY9h6421OmJs2mMffWGjgPK4ISjVp8cyU
ZHAoGc+2/I1mAPfQBAEyglXeNtMI0NBsV7jYMiu8YkLKh8mlm6OaT8hV6cow5N9c
SDdSzYG0rj/Tb9fhdwgmanDClHMhHA==
=NNo1
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--

