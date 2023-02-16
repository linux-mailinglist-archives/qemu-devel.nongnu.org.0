Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5C56993AE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:54:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pScpg-0004ej-SL; Thu, 16 Feb 2023 06:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pScpe-0004eT-Si
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:53:47 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pScpd-0006ch-4G
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:53:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=jwEdLDHQe15QIUHO7OT14hHjOF+tXhOpjM6ETTpwY8E=; b=rXBA1h4Rr+/27VWT5SWo6z6xQk
 jgxbYhxmHqydz2fziCZMc4LgHTXz0MNV9z+4JF93Bi3sjhHKgzxPSortACfIfo/c/38bD/T02OKYC
 fb1oPlNvr0W6tJpzcuYzvbLJTKlFboT41rmqRhfROMe4i5JhkCO0YeSqzDRI54EFga5bEgYKPFSoj
 GsOdP5TrvtYkvlSp6B35pfdTfANoe/9p/xOswm60z4TIEyzX4rMHGrNtXcvWAF3VfyWzP2o8CFKAa
 o/eRGx3CA9x2v450x6UKR4KZCeL2lSuM/L5q9V9QzkIcyj+AcQRu39aprirYPFyvNruB/Sbc9oExy
 AY7sITldf/UzwsZ75H2kZ5zQN5yYcTLVLV7aEHTuadfeVLpNjVUUnIVmWwqKZgeLtJng6IiA95aXU
 S3b88nP5r2naQpXolkRrW03SAINIvzDdKnStumB0iaBJ5bqxSwru4qRYfuCrnXBlDNiGi4A0VURNE
 gY2NEvc/C5cC17NYcrzZ5PfHG+1q8dMmpOj6BsWc23/QgIRTFExClRM3JYP9SPZgfCJ4Bz45+tr/B
 7lbnXf0N3pylYVZZRGe15izfOf7y0Tde3n83kIQeLXCCM7TILp/PQJ+jz/olTh1IqFSVE9Tmc+s09
 ea3+9Q4NStW4+KQr6u2chd7wWpi207TZ2cLResXS4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Cc: Dorinda Bassey <dbassey@redhat.com>, qemu-devel@nongnu.org,
 kraxel@redhat.com, armbru@redhat.com, pbonzini@redhat.com,
 wtaymans@redhat.com,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] audio/pwaudio.c: Add Pipewire audio backend for QEMU
Date: Thu, 16 Feb 2023 12:53:41 +0100
Message-ID: <3423015.TuE8vhHZVa@silver>
In-Reply-To: <Y+0BcwxQ2INww8dN@redhat.com>
References: <20230215085102.415053-1-dbassey@redhat.com>
 <CAJ+F1CL0_OAj5-jsyCVY5aF=qoSoPx2Mu=q8Z7mpp3mesRi6=Q@mail.gmail.com>
 <Y+0BcwxQ2INww8dN@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Wednesday, February 15, 2023 4:59:47 PM CET Daniel P. Berrang=E9 wrote:
> On Wed, Feb 15, 2023 at 05:18:50PM +0400, Marc-Andr=E9 Lureau wrote:
> > Hi
> >=20
> > On Wed, Feb 15, 2023 at 12:51 PM Dorinda Bassey <dbassey@redhat.com> wr=
ote:
> > >
> > > This commit adds a new audiodev backend to allow QEMU to use Pipewire=
 as both an audio sink and source. This backend is available on most system=
s.
> > >
> >=20
> > Hmm, I would rather have less audio (and ui) backends in QEMU. (for
> > audio, if I could introduce and keep only one, that would be
> > GStreamer: to remove the others..)
>=20
> Even if we take this patch, and don't have a gstreamer impl,
> it feels like we've scope for cutting down the backends.
>=20
> The 'oss' driver for example ?  On Linux that's long obsolete,
> with alsa or one of the higher level APIs available.  OSS was
> also use on freebsd, but IIUC,  sndio is better choice there
> now too ?  Deprecate (and later remove) 'oss' now ?

There is indeed little reason to still use OSS nowadays IMO. At least marki=
ng
OSS as deprecated would not hurt.

> The 'sdl' driver is setup in meson.build as our lowest priority
> impl, we'll pick any other driver ahead of sdl. Is there any
> compelling reason why we must give users the option of 'sdl'
> for audio when we have soo many other choices available ?
> Even if using SDL for graphics, it seems like we can use any
> other backend for audio. Deprecate (and later remove) 'sdl'
> for audio ?
>=20
> IIUC, pipewire is positioned to replace pulseaudio. So if we
> take a pipewire backend, once pipewire is available in enough
> distros we could deprecate the pulseaudio backend and eventually
> remove it. Maybe the same applies for 'jack' ?

AFAIK Pipewire is Linux only, whereas PulseAudio and JACK are available for
Windows and macOS, too. And in it's current version (provided QEMU Pipewire
patch), I don't see it as a full replacement for the JACK driver yet.

> IOW, could we get to
>=20
>  - Windows: dsound
>  - MacOS: coreaudio
>  - (Open|Net|Free)BSD: sndio
>  - Linux: alsa/pipewire
>=20
> ?
>=20
> With regards,
> Daniel
>=20



