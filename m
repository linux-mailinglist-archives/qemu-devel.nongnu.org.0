Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A716662127C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 14:34:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osOj2-00087d-T2; Tue, 08 Nov 2022 08:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1osOin-00086g-3R
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:32:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1osOil-0007lF-6t
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:32:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667914373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kXgfp1WLlMpEjF3HUtVC7sCD/OOvdVoiOVN0QJ2whK4=;
 b=Pc0Ia+swYUajiMK+saW70A2wZqNyq6slufD+5PE4ylCbRUTfFwv91AnAv9jG7Kh66oWHGu
 CmRyFlqhyz5ez0xso/eIAmwmu7xQ3tuYhNjezxVq0RnZG8ccylvIDyCLAT+dIQXEHQj6y5
 fsDpRUxz/qoXsjj1SxCtXECm8miO6B0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-20-Sij3VmVgNb6Fnr0nU0RR2Q-1; Tue, 08 Nov 2022 08:32:52 -0500
X-MC-Unique: Sij3VmVgNb6Fnr0nU0RR2Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 q13-20020a056402518d00b00462b0599644so10740812edd.20
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 05:32:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kXgfp1WLlMpEjF3HUtVC7sCD/OOvdVoiOVN0QJ2whK4=;
 b=Q26bfD+gBOMLgo9wgP0bqKEPQlybdKRkLTN23ACABiZj7VCb8Z5t8eLNsoloSRUwXd
 lJv2Y0aoaa9fkgQejUVP4U6AKb/tXVuMxrbOaHIhNnElYMnTeqrO5IamFKVXpz5Z9iKA
 dy2U4xAqBzGh0QUAXtJlEAsK91EWywmFPGQN2svfMFiEwmG6yNgiJ14V2fOMyo55c1Sr
 kPkaTLqHqvpUIZ2OoV9zOOXOB26YNLFQvwDxC/jg/Dl9aQyhD8kfeYBYPq9SRMu507GX
 53VUYxy1EpSNRwltJBgpF8OqK8H/Ht0DdBcEvQ3MaQO6xo7fUJBk4rHijy0Y+wXWguQG
 Ya0g==
X-Gm-Message-State: ACrzQf1L/Toe68uIHKCQIbWHgvCgq0GbN1Iq3ETQVnBbIQAOco+yWuHR
 8evcZE9QSFp9G1rWVLww6P6s+PXd4nAJ99O5H2qFWpXt0xQAu66lCGcE4GPtfmwSvpAkHg5db5T
 L9y7L6uvSEWy2+Fs=
X-Received: by 2002:a17:907:2c74:b0:7a1:d333:f214 with SMTP id
 ib20-20020a1709072c7400b007a1d333f214mr54019170ejc.14.1667914370490; 
 Tue, 08 Nov 2022 05:32:50 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5oLCuaR98UnTF9/+RqJbXsDxKxIvqva9UzkeMTnIN62wC+wM06BdcmSIY+KyeOb+gPV8BP+g==
X-Received: by 2002:a17:907:2c74:b0:7a1:d333:f214 with SMTP id
 ib20-20020a1709072c7400b007a1d333f214mr54019154ejc.14.1667914370256; 
 Tue, 08 Nov 2022 05:32:50 -0800 (PST)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a170906135000b007ae32daf4b9sm4640891ejb.106.2022.11.08.05.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 05:32:49 -0800 (PST)
Date: Tue, 8 Nov 2022 14:32:48 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org, Peter
 Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v3 00/81] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <20221108143248.4b3042f7@fedora>
In-Reply-To: <20221107072411-mutt-send-email-mst@kernel.org>
References: <20221105171116.432921-1-mst@redhat.com>
 <CAJSP0QW8cYteo8aeDkg0ZZs=6oebdtfGGVnN74pW+gaK10=HSQ@mail.gmail.com>
 <20221107072411-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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

On Mon, 7 Nov 2022 07:30:03 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Nov 07, 2022 at 05:43:44AM -0500, Stefan Hajnoczi wrote:
> > Hi Michael and Igor,
> > Looks like the ACPI commits broken the virtio-vga module:
> >  =20
> > >>> QTEST_QEMU_IMG=3D./qemu-img MALLOC_PERTURB_=3D60 G_TEST_DBUS_DAEMON=
=3D/builds/qemu-project/qemu/tests/dbus-vmstate-daemon.sh QTEST_QEMU_BINARY=
=3D./qemu-system-or1k QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/q=
emu-storage-daemon /builds/qemu-project/qemu/build/tests/qtest/device-intro=
spect-test --tap -k =20
> > =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80 =E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95
> > stderr:
> > failed to open module:
> > /builds/qemu-project/qemu/build/qemu-bundle/usr/local/lib64/qemu/hw-dis=
play-virtio-vga.so:
> > undefined symbol: aml_return
> > qemu-system-or1k: ../util/error.c:59: error_setv: Assertion `*errp =3D=
=3D
> > NULL' failed.
> > Broken pipe
> > ../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from
> > signal 6 (Aborted) (core dumped)
> > TAP parsing error: Too few tests run (expected 6, got 0)
> > (test program exited with status code -6)
> > =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95
> > 154/274 qemu:qtest+qtest-or1k / qtest-or1k/machine-none-test OK 0.05s
> > 1 subtests passed
> > 155/274 qemu:qtest+qtest-or1k / qtest-or1k/qmp-test OK 0.19s 4 subtests=
 passed
> > 156/274 qemu:qtest+qtest-or1k / qtest-or1k/qmp-cmd-test ERROR 1.72s
> > killed by signal 6 SIGABRT =20
> > >>> QTEST_QEMU_IMG=3D./qemu-img G_TEST_DBUS_DAEMON=3D/builds/qemu-proje=
ct/qemu/tests/dbus-vmstate-daemon.sh QTEST_QEMU_BINARY=3D./qemu-system-or1k=
 QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-storage-daemon MA=
LLOC_PERTURB_=3D53 /builds/qemu-project/qemu/build/tests/qtest/qmp-cmd-test=
 --tap -k =20
> > =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80 =E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95
> > stderr:
> > failed to open module:
> > /builds/qemu-project/qemu/build/qemu-bundle/usr/local/lib64/qemu/hw-dis=
play-virtio-vga.so:
> > undefined symbol: aml_return
> > qemu-system-or1k: ../util/error.c:59: error_setv: Assertion `*errp =3D=
=3D
> > NULL' failed.
> > Broken pipe
> > ../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from
> > signal 6 (Aborted) (core dumped)
> > TAP parsing error: Too few tests run (expected 62, got 31)
> > (test program exited with status code -6)
> > =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95
> >=20
> > https://gitlab.com/qemu-project/qemu/-/jobs/3281425457
> >=20
> > Stefan =20
>=20
>=20
> Hmm it passed for me:
>=20
> https://gitlab.com/mstredhat/qemu/-/jobs/3279401710

I'm sorry, I was 'out of service' yesterday.
I see that Ani already fixed the issue, thanks!

>=20
> Igor you did make a change around VGA:
>=20
> commit 03d525c27ab0b268cf375d8823f05e91509222b8
> Author: Igor Mammedov <imammedo@redhat.com>
> Date:   Mon Oct 17 12:21:36 2022 +0200
>=20
>     acpi: pc: vga: use AcpiDevAmlIf interface to build VGA device descrip=
tors
>    =20
>     Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>     Message-Id: <20221017102146.2254096-2-imammedo@redhat.com>
>     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>     NB: we do not expect any functional change in
>     any ACPI tables with this change. It's only a refactoring.
>    =20
>     Reviewed-by: Ani Sinha <ani@anisinha.ca>
>=20
>=20
> can you take a look pls?
> How bad is it if I drop that patch?

It can't be dropped without dropping whole series
which heavily depends on it.



