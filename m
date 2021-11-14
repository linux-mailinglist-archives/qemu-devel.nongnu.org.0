Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9527E44F808
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 14:21:07 +0100 (CET)
Received: from localhost ([::1]:58748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmFRS-0007wS-63
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 08:21:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mmFOp-0006Vz-BY
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 08:18:23 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:50037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mmFOj-00048Q-CM
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 08:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=41fqTssd1Yr2htSMS74dKwTljkEunl39B4yAhA8TC1w=; b=SNK5PZVUjDuZ8SVXwaDttiUcDp
 0FCx15MhRJa6JT01ZlgL0+1GxJGBO0S3YrmB+kYj8ry/GyhWEoUWMJWeoo8XUQxmPqh/4+dlGfYhL
 q3CDFut62y0UuOO2NJT2/FsmAp9YhlcenG2dTd7iiOuN1zF0Sddm9dgBiv0nv0gYEWCtuwG5zRfje
 fzLlOcNg+98o737AWn0pC8UoJDN4/Xho99rXneFuUnNg7qbXxwfFJrA90XA0Hcqij4dUFExvaOirh
 Zr2QV7ynLiyirqCwd/XuN6E+oltuZwhRhhwSvnk8JBGsd4SCZndfdHYfjSiH9fT78T4/m3fcsrSGT
 nb2C3XzL9Iyr1FLAOEa3+MBJEzyHaudF+kyPrxgedywPh9nX/vnHTgV2CfWVsgTx2TemRm+Yj9+HF
 B5A4AUmbbvV3OM7ESs7dXQMwZ7rcbLuaqUOz4O5a9KmppfgEtdD8ATpviO+ZCybVD4vgWWJdtX8Ff
 Z9Xi6K8aouuoXiztBaaq2GBIAU346DSc+fyoOdYvEEs81GroyA8820KQcK4AytIv45cMabMAnzZFO
 IYt/jeVxzYU9TaiwrezqrHkzGhFfCqKX1CNYjFDm4XUXqNdLQfSsJ5GH7N0tKNW5c81Ud3yCYM7nK
 kEZQpy7XdaLO7sEpSZrJDhFAp3C46Y7VtBuKVCjkU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexandre Ratchov <alex@caoua.org>
Subject: Re: [PATCH] audio: Add sndio backend
Date: Sun, 14 Nov 2021 14:18:10 +0100
Message-ID: <1891902.ENMEkzpEdO@silver>
In-Reply-To: <73252f43-1e30-7c0b-bcc7-1df399290e10@comstyle.com>
References: <YYdh3l1HTh+kpONa@humpty.home.comstyle.com>
 <2813395.O5pCCIcrDs@silver>
 <73252f43-1e30-7c0b-bcc7-1df399290e10@comstyle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Samstag, 13. November 2021 21:40:39 CET Brad Smith wrote:
> On 11/8/2021 8:03 AM, Christian Schoenebeck wrote:
> > On Sonntag, 7. November 2021 06:19:26 CET Brad Smith wrote:
> >> audio: Add sndio backend
> >> 
> >> Add a sndio backend.
> > 
> > Hi Brad!
> > 
> >> sndio is the native API used by OpenBSD, although it has been ported to
> >> other *BSD's and Linux (packages for Ubuntu, Debian, Void, Arch, etc.).
> >> 
> >> The C code is from Alexandre Ratchov <alex@caoua.org> and the rest of
> >> the bits are from me.
> > 
> > A Signed-off-by: line is mandatory for all QEMU patches:
> > https://wiki.qemu.org/Contribute/SubmitAPatch
> 
> Ah, I was not aware of that. I usually include it but it was an
> oversight this time.
> 
> > Also, it should be clear from the patches who did what exactly, either by
> > splitting the patches up and assigning the respective authors accordingly,
> > or by making the person with the most relevant work the patch author and
> > describing in the commit log additional authors and what they have added/
> > changed, along with their Signed-off-by: line:
> > 
> > Signed-off-by: Alexandre Ratchov <alex@caoua.org>
> > [Brad Smith: - Added foo
> > 
> >               - Some other change]
> > 
> > Signed-off-by: Brad Smith <brad@comstyle.com>
> 
> I think I'll go with this.
> 
> > http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/
> > Documentation/SubmittingPatches?
> > id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297
> > 
> > Please CC those involved authors.
> 
> Will do.

I added Alexandre Ratchov on CC as he seems to be the primary author of this 
patch series.

> >> ---
> >> 
> >>   audio/audio.c          |   1 +
> >>   audio/audio_template.h |   2 +
> >>   audio/meson.build      |   1 +
> >>   audio/sndioaudio.c     | 555 +++++++++++++++++++++++++++++++++++++++++
> >>   meson.build            |   7 +
> >>   meson_options.txt      |   4 +-
> >>   qapi/audio.json        |  25 +-
> >>   qemu-options.hx        |   8 +
> >>   tests/vm/freebsd       |   3 +
> >>   9 files changed, 604 insertions(+), 2 deletions(-)
> > 
> > An additional subsection for this backend should be added to MAINTAINERS.
> 
> I did not add anything here as I figured it implies a certain level of
> obligation. His time
> available varies quite a bit (especially at the current time) and I
> wasn't sure if it's
> appropriate listing him.

Yes, that's an unpleasant but legitimate question: will there be anybody 
caring for this sndio backend in QEMU or would it go orphaned right from the 
start?

It would be good to have at least somebody familiar with this code to 
volunteer as reviewer(s) ("R:" line(s) in MAINTAINERS file). Reviewers are 
automatically CCed, so that they can (optionally) give their feedback on 
future changes to the sndio backend, i.e. when somebody sends sndio patches to 
qemu-devel. This is voluntary and can be revoked at any time, and I do not 
expect that you would frequently get emailed for this either.

As this is a BSD-specific audio backend, it is not likely that an active QEMU 
developer would be able to care for it.


> >>   create mode 100644 audio/sndioaudio.c
> >> 
> >> diff --git a/audio/audio.c b/audio/audio.c
> >> index 54a153c0ef..bad1ceb69e 100644
> >> --- a/audio/audio.c
> >> +++ b/audio/audio.c
> >> @@ -2005,6 +2005,7 @@ void audio_create_pdos(Audiodev *dev)
> >> 
> >>           CASE(OSS, oss, Oss);
> >>           CASE(PA, pa, Pa);
> >>           CASE(SDL, sdl, Sdl);
> >> 
> >> +        CASE(SNDIO, sndio, );
> >> 
> >>           CASE(SPICE, spice, );
> >>           CASE(WAV, wav, );
> >> 
> >> diff --git a/audio/audio_template.h b/audio/audio_template.h
> >> index c6714946aa..ecc5a0bc6d 100644
> >> --- a/audio/audio_template.h
> >> +++ b/audio/audio_template.h
> >> @@ -337,6 +337,8 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_,
> >> TYPE)(Audiodev *dev) return
> >> qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.TYPE); case
> >> 
> >> AUDIODEV_DRIVER_SDL:
> >>           return
> >>           qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.TYPE);
> >> 
> >> +    case AUDIODEV_DRIVER_SNDIO:
> >> +        return dev->u.sndio.TYPE;
> >> 
> >>       case AUDIODEV_DRIVER_SPICE:
> >>           return dev->u.spice.TYPE;
> >>       
> >>       case AUDIODEV_DRIVER_WAV:
> >> diff --git a/audio/meson.build b/audio/meson.build
> >> index 462533bb8c..e24c86e7e6 100644
> >> --- a/audio/meson.build
> >> +++ b/audio/meson.build
> >> @@ -17,6 +17,7 @@ foreach m : [
> >> 
> >>     ['pa', pulse, files('paaudio.c')],
> >>     ['sdl', sdl, files('sdlaudio.c')],
> >>     ['jack', jack, files('jackaudio.c')],
> >> 
> >> +  ['sndio', sndio, files('sndioaudio.c')],
> >> 
> >>     ['spice', spice, files('spiceaudio.c')]
> >>   
> >>   ]
> >>   
> >>     if m[1].found()
> >> 
> >> diff --git a/audio/sndioaudio.c b/audio/sndioaudio.c
> >> new file mode 100644
> >> index 0000000000..204af07781
> >> --- /dev/null
> >> +++ b/audio/sndioaudio.c
> >> @@ -0,0 +1,555 @@
> >> +/*
> >> + * Copyright (c) 2019 Alexandre Ratchov <alex@caoua.org>
> >> + *
> > 
> > It is quite common for new source files in QEMU to have an authors list
> > 
> > section in the header here like:
> >    * Autors:
> >    *  Alexandre Ratchov <alex@caoua.org>
> 
> I was looking through the tree and all of the examples I came across
> were using this
> with a Copyright for a company as opposed to an individual. What would
> be the
> format?

There was nothing wrong with the copyright line. If it was an individual, then 
the copyright line is an individual. And like I said, it does not seem to be 
required in QEMU to have an "Authors:" block in the file header at all. So on 
doubt just ignore this.

Deflating the file header by using SPDX license identifier as suggested would 
make sense though.

> > That way scripts/get_maintainer.pl can suggest those people as well in
> > case
> > they are not explicitly listed in MAINTAINERS. Does not seem to be
> > mandatory for QEMU though. Just saying.

Best regards,
Christian Schoenebeck



