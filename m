Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C183B31C0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 16:49:47 +0200 (CEST)
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQfq-0005t0-Kf
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 10:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>)
 id 1lwQer-0005BK-8z; Thu, 24 Jun 2021 10:48:45 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:48350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>)
 id 1lwQep-0002jd-3f; Thu, 24 Jun 2021 10:48:45 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4C3111FD8E;
 Thu, 24 Jun 2021 14:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624546119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EFGXOUFUmSSUzGx/8ldojTtG1QgZSRroxmVRwoCPfbM=;
 b=BAZAmhAksfvM8tlQ96c55K8ggjzwULtPKBRhPq8fO+AqXYUi3lilH4ahgPwya7pJjxx0Z3
 Lt5brKu551C6OxaB5CyMT5yTlKkCAFZZHVGmgEUYFXuPcEyyPzE/LLNNExnhHnAJfhsjZe
 siMqfVfR60V7cG1FH1IOHmwaAMj4Ivs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624546119;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EFGXOUFUmSSUzGx/8ldojTtG1QgZSRroxmVRwoCPfbM=;
 b=gQrrmrGcXDTqYIR2Yg44EmS/DY++VlZTCLZI+f/aVlmK7u9AKXc1TnBRBzbYYLWJWHMchJ
 5rrmdgDbhHIdVSDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 3B59B11A97;
 Thu, 24 Jun 2021 14:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624546119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EFGXOUFUmSSUzGx/8ldojTtG1QgZSRroxmVRwoCPfbM=;
 b=BAZAmhAksfvM8tlQ96c55K8ggjzwULtPKBRhPq8fO+AqXYUi3lilH4ahgPwya7pJjxx0Z3
 Lt5brKu551C6OxaB5CyMT5yTlKkCAFZZHVGmgEUYFXuPcEyyPzE/LLNNExnhHnAJfhsjZe
 siMqfVfR60V7cG1FH1IOHmwaAMj4Ivs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624546119;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EFGXOUFUmSSUzGx/8ldojTtG1QgZSRroxmVRwoCPfbM=;
 b=gQrrmrGcXDTqYIR2Yg44EmS/DY++VlZTCLZI+f/aVlmK7u9AKXc1TnBRBzbYYLWJWHMchJ
 5rrmdgDbhHIdVSDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id WLQmAECb1GBmDAAALh3uQQ
 (envelope-from <jziviani@suse.de>); Thu, 24 Jun 2021 14:48:32 +0000
Date: Thu, 24 Jun 2021 11:48:26 -0300
From: "Jose R. Ziviani" <jziviani@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 00/34] modules: add meta-data database
Message-ID: <YNSbOp+lDoJeRiqu@pizza.suse.cz>
References: <20210624103836.2382472-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yvkd5jsEePDpG+dX"
Content-Disposition: inline
In-Reply-To: <20210624103836.2382472-1-kraxel@redhat.com>
Received-SPF: pass client-ip=195.135.220.29; envelope-from=jziviani@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--yvkd5jsEePDpG+dX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Gerd,

Reviewed and tested successfully here. Thank you!

Reviewed-by: Jose R. Ziviani <jziviani@suse.de>


On Thu, Jun 24, 2021 at 12:38:02PM +0200, Gerd Hoffmann wrote:
> This patch series adds support for module meta-data.  Today this is
> either hard-coded in qemu (see qemu_load_module_for_opts) or handled
> with manually maintained lists in util/module (see module_deps[] and
> qom_modules[]).  This series replaced that scheme with annotation
> macros, so the meta-data can go into the module source code and -- for
> example -- the module_obj() annotations can go next to the TypeInfo
> struct for the object class.
>=20
> Patches 1-3 put the infrastructure in place:  Add the annotation macros,
> add a script to collect the meta-data, add a script to compile the
> meta-data into C source code which we can then add to qemu.
>=20
> Patch 4 - check module dependencies (Jose, new in v4).
>=20
> Patches 5-13 add annotations macros to the modules we have.
>=20
> Patches 14-16 put the modinfo database into use and remove the
> module_deps[] and qom_modules[] lists.
>=20
> Patch 16 adds two tracepoints for easier trouble-shooting.
>=20
> Patches 18-20 add support for target-specific modules.
>=20
> Patches 21-24 add documentation for all of the above (new in v4, was
> separate series).
>=20
> Patches 25-29 start building accelerators modular.  So far it is
> only qtest (all archs) and a small fraction of tcg (x86 only).
>=20
> Patches 30-34 add support for registering hmp commands so they can
> be implemented as module (new in v4, was separate series).
>=20
> take care,
>   Gerd
>=20
> Gerd Hoffmann (33):
>   modules: add modinfo macros
>   modules: collect module meta-data
>   modules: generate modinfo.c
>   modules: add qxl module annotations
>   modules: add virtio-gpu module annotations
>   modules: add chardev module annotations
>   modules: add audio module annotations
>   modules: add usb-redir module annotations
>   modules: add ccid module annotations
>   modules: add ui module annotations
>   modules: add s390x module annotations
>   modules: add block module annotations
>   modules: use modinfo for dependencies
>   modules: use modinfo for qom load
>   modules: use modinfo for qemu opts load
>   modules: add tracepoints
>   modules: check arch and block load on mismatch
>   modules: check arch on qom lookup
>   modules: target-specific module build infrastructure
>   modules: add documentation for module sourcesets
>   modules: add module_obj() note to QOM docs
>   modules: module.h kerneldoc annotations
>   modules: hook up modules.h to docs build
>   accel: autoload modules
>   accel: add qtest module annotations
>   accel: build qtest modular
>   accel: add tcg module annotations
>   accel: build tcg modular
>   monitor: allow register hmp commands
>   usb: drop usb_host_dev_is_scsi_storage hook
>   monitor/usb: register 'info usbhost' dynamically
>   usb: build usb-host as module
>   monitor/tcg: move tcg hmp commands to accel/tcg, register them
>     dynamically
>=20
> Jose R. Ziviani (1):
>   modules: check if all dependencies can be satisfied
>=20
>  scripts/modinfo-collect.py      |  67 +++++++++++
>  scripts/modinfo-generate.py     |  97 ++++++++++++++++
>  include/hw/usb.h                |   7 +-
>  include/monitor/monitor.h       |   3 +
>  include/qemu/module.h           |  74 ++++++++++++
>  accel/accel-common.c            |   2 +-
>  accel/accel-softmmu.c           |   2 +-
>  accel/qtest/qtest.c             |   2 +
>  accel/tcg/hmp.c                 |  29 +++++
>  accel/tcg/tcg-accel-ops.c       |   1 +
>  accel/tcg/tcg-all.c             |   1 +
>  audio/spiceaudio.c              |   2 +
>  block/iscsi-opts.c              |   1 +
>  chardev/baum.c                  |   1 +
>  chardev/spice.c                 |   4 +
>  hw/display/qxl.c                |   4 +
>  hw/display/vhost-user-gpu-pci.c |   1 +
>  hw/display/vhost-user-gpu.c     |   1 +
>  hw/display/vhost-user-vga.c     |   1 +
>  hw/display/virtio-gpu-base.c    |   1 +
>  hw/display/virtio-gpu-gl.c      |   3 +
>  hw/display/virtio-gpu-pci-gl.c  |   3 +
>  hw/display/virtio-gpu-pci.c     |   2 +
>  hw/display/virtio-gpu.c         |   1 +
>  hw/display/virtio-vga-gl.c      |   3 +
>  hw/display/virtio-vga.c         |   2 +
>  hw/ppc/spapr.c                  |   2 +-
>  hw/s390x/virtio-ccw-gpu.c       |   3 +
>  hw/usb/ccid-card-emulated.c     |   1 +
>  hw/usb/ccid-card-passthru.c     |   1 +
>  hw/usb/dev-storage-bot.c        |   1 +
>  hw/usb/dev-storage-classic.c    |   1 +
>  hw/usb/dev-uas.c                |   1 +
>  hw/usb/host-libusb.c            |  38 ++----
>  hw/usb/host-stub.c              |  45 -------
>  hw/usb/redirect.c               |   1 +
>  monitor/hmp.c                   |   7 ++
>  monitor/misc.c                  |  34 +++---
>  softmmu/vl.c                    |  24 ++--
>  stubs/module-opts.c             |   4 -
>  ui/egl-headless.c               |   4 +
>  ui/gtk.c                        |   4 +
>  ui/sdl2.c                       |   4 +
>  ui/spice-app.c                  |   3 +
>  ui/spice-core.c                 |   5 +
>  util/module.c                   | 200 ++++++++++++++++++--------------
>  accel/qtest/meson.build         |   8 +-
>  accel/tcg/meson.build           |   6 +-
>  docs/devel/build-system.rst     |  17 +++
>  docs/devel/index.rst            |   1 +
>  docs/devel/modules.rst          |   5 +
>  docs/devel/qom.rst              |   8 ++
>  hmp-commands-info.hx            |   3 -
>  hw/usb/meson.build              |  10 +-
>  meson.build                     |  82 +++++++++++++
>  util/trace-events               |   4 +
>  56 files changed, 624 insertions(+), 218 deletions(-)
>  create mode 100755 scripts/modinfo-collect.py
>  create mode 100755 scripts/modinfo-generate.py
>  create mode 100644 accel/tcg/hmp.c
>  delete mode 100644 hw/usb/host-stub.c
>  create mode 100644 docs/devel/modules.rst
>=20
> --=20
> 2.31.1
>=20
>=20
>=20

--yvkd5jsEePDpG+dX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVQB+DwLGVyv815sBaJ4wdCKKF5YFAmDUmzYACgkQaJ4wdCKK
F5bTqw//aGSB9CBU3LljVL8MVjHKCI8kfWAPoOuS7998Fq4XuudYQ95bo1RiBR4O
jgvR4oTCtjtviYooprmkmQy4jVCHv9fVgn74IJ7r/aC+nS2DYRPioHUHwS/6Q5nK
dce+Mg4khO8HGF2WttrLLQYunHt4lmvWbsQTTEVZp936QL1R5lkiDBJKeqiFz8d5
VJSqEoXmL/2F2e22kehvkBMeGZlVAEgQ0mCs1wQIWRqle/iLTyPWd8tscrJ8ZGgS
iG5v2HHDGOBimkR37/u6f3PL3eeBm6cc076i+2P81omNBLLeGJqJgdPA6uk0nCZu
LsDdYVQyfjf2kfHJ4W/H0e8AfZDs403jRYG+QPAqypafJW/6lwtqhP83e8z92En6
rsbkFcYZ3pzTPBP9gbjM06ORT6SXZLW9+JJfVIsb6H9siean8ugheTQTUtNCtdN2
0JCnxx/8OhthPOEJrFj+0e7VOVYp23PrTWH2sggckMtCjXWMripo6nBCSXPfdA/6
VkhqhboN1TWTVRSa6QgjKbmi1c3jGwAhwbBFIagB26Mi+gYa2ziwpdVYZvPbOQLo
l/eOKX1vEmytAI+38kY2DCytjBH+YRhkpic5tSDhhPYMU8A42UCyF9pWvrrAzvku
Tx9CCSsfK0aKuqFSqKO4L7Idq7ZeXUo7py+hVlFZqU6k7tUHGnA=
=ma8u
-----END PGP SIGNATURE-----

--yvkd5jsEePDpG+dX--

