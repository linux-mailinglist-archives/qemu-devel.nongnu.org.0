Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B947C47E422
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 14:34:20 +0100 (CET)
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0OEd-0003kx-CT
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 08:34:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n0Nhw-0006vn-Hl
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 08:00:32 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:33571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1n0Nht-0001yg-7T
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 08:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=nXdg5MbcLq2vy7OUuyW9V3Htw72X0+BMEzGAljEB01o=; b=gP36dz/Zahsp6t4O+7s+zEPb9V
 OPGdJJ7dMrWi7sNH8NmHmv43VqiqMfuzBYROwvRzdFD1piJxP7g+MR2IKM07n5fxKZtWgSTMzUarY
 2rHEgenVgFsMQy5dPNmetMuGD/NCr72kX0l9CupTOvFKBQ4puOs5mWhaJTyRegEE7a4L0/AmW2YNh
 tW7wVRQvs1lkBUGXy6S1slhP8WOiPwZrpJTOQ/kLP45BkJZQQUgNsJCnL9d8ilrElKXfsvggadatc
 y5J1BOmU5EbOIdzj/F06ro8/pNIfO9PDPqK9opVSieBicCclSNcuiZYRV/RjcKemGXKc02qJzDNHC
 rBw0FR1pba6UB8kR0KsQYKnlVIWogs+dlTASyGOzMuTZa9/J5rZa8knLP/PS5TuGbVr6xQNDoJJXH
 D4RfdCAy2KfsOdwCaD6V0FpMhNBd9YwZ7U/Z1fBu3kB6i9X8B4vXZIoE4zt+BRKbG3dg2Wbv5kyu2
 EQpKxCaepJi9vfvzy7Ux4BT4pkl8Ln/Ug16HNYB8NmgxNvuMnSs9mrZmrqJMwUzyjj/HAKObRURz2
 NERryINyCH/Oao2NpWAVWApiRNMBpObZEIjMwyNO/PGMGInF09bY08TqdKcDx81K8KHhhczM+ERCL
 FH0q5j+IgKeDR/pYLzjJCNntNohlHf9ZZrtFJEIy4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Alexandre Ratchov <alex@caoua.org>,
 Brad <brad@comstyle.com>,
 Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH v2] audio: Add sndio backend
Date: Thu, 23 Dec 2021 14:00:24 +0100
Message-ID: <4387409.znE8pAOnUE@silver>
In-Reply-To: <2493750.jclyaLVk8g@silver>
References: <YbxamMLKHp3IbtlW@moule.localdomain> <2493750.jclyaLVk8g@silver>
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

On Montag, 20. Dezember 2021 16:41:31 CET Christian Schoenebeck wrote:
> On Freitag, 17. Dezember 2021 10:38:32 CET Alexandre Ratchov wrote:
> > sndio is the native API used by OpenBSD, although it has been ported to
> > other *BSD's and Linux (packages for Ubuntu, Debian, Void, Arch, etc.).
> > 
> > Signed-off-by: Brad Smith <brad@comstyle.com>
> > Signed-off-by: Alexandre Ratchov <alex@caoua.org>
> > ---
> > 
> > Thank you for the reviews and all the comments. Here's a second diff
> > with all the suggested changes:
> > 
> > - Replace ISC license by SPDX-License-Identifier header
> > - Fix units (milli- vs micro-) in comment about SNDIO_LATENCY_US
> > - Drop outdated comment about the "size" argument of
> > sndio_get_buffer_out()
> > - Fix AUDIO_FORMAT_U32 handling (missing "break" statement)
> > - Set {read,write] methods to audio_generic_{read,write} (fixes craches)
> > - Check if backend is enabled in sndio_poll_event()
> > - Use https://sndio.org in description
> > - Mark options as available after 7.0 release (instead of 6.2)
> > - Describe sndio-specific options (dev, latency) in qemu-options.hx
> > - Add myself as reviewer to MAINTAINERS
> > - Style fixes: no space after function names, use 4-space indent
> > - Don't use "return foo()" if foo() returns void
> > - Include backend to audio_drivers_priority[]
> > 
> > Tested on OpenBSD, works as expected!
> > 
> >  MAINTAINERS            |   5 +
> >  audio/audio.c          |   1 +
> >  audio/audio_template.h |   2 +
> >  audio/meson.build      |   1 +
> >  audio/sndioaudio.c     | 555 +++++++++++++++++++++++++++++++++++++++++
> >  meson.build            |   9 +-
> >  meson_options.txt      |   4 +-
> >  qapi/audio.json        |  25 +-
> >  qemu-options.hx        |  16 ++
> >  tests/vm/freebsd       |   3 +
> >  10 files changed, 618 insertions(+), 3 deletions(-)
> >  create mode 100644 audio/sndioaudio.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 7543eb4d59..76bdad064f 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2307,6 +2307,7 @@ X: audio/jackaudio.c
> > 
> >  X: audio/ossaudio.c
> >  X: audio/paaudio.c
> >  X: audio/sdlaudio.c
> > 
> > +X: audio/sndio.c
> > 
> >  X: audio/spiceaudio.c
> >  F: qapi/audio.json
> > 
> > @@ -2349,6 +2350,10 @@ R: Thomas Huth <huth@tuxfamily.org>
> > 
> >  S: Odd Fixes
> >  F: audio/sdlaudio.c
> > 
> > +Sndio Audio backend
> > +R: Alexandre Ratchov <alex@caoua.org>
> > +F: audio/sndio.c
> > +
> 
> Thanks Alexandre for volunteering as reviewer!
> 
> Gerd, would it be OK to set you as maintainer for now until new
> maintainer(s) adopt audio sections? Or should this start with "S: Orphan"
> instead?

Alexandre, if Gerd does not reply in a week or so, then please add "S: Orphan" 
to MAINTAINERS for now to make it clear that there is no maintainer for sndio 
yet to increase the chance for somebody to adopt it.

From Volker's response I assume you will be posting a v3 anyway.

If nobody takes care to queue your patch then let me know. Maybe I can push it 
through my queue this time, provided that there are enough reviews. I also saw 
your patch just by coincidence BTW, so please CC maintainers of affected files 
as suggested by Volker.

Best regards,
Christian Schoenebeck



