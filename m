Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14BF184840
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 14:35:50 +0100 (CET)
Received: from localhost ([::1]:58902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCkTe-0004G8-1c
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 09:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59281)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jCkSs-0003qu-6K
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 09:35:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1jCkSp-0006ea-Gy
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 09:35:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20301
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1jCkSp-0006Xy-58
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 09:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584106498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EbO2XW29MTb/l1T07/sWDQ2OndnyYd01avw4tAwRFGc=;
 b=B7Lrqtc29BgBuYLOX3PGuKW6pi+Ofj7imeJgcbGIqeTL9dhBY+LpLGruzTHyuZh1YBDFIV
 Fh5OFaCx1FIaGoqEjyTesWUWtTMxez5R85gMwzUrD+GcoXYr+BWXWoYtRi/AhTY0LhMLQc
 ykc9ZCy9ZxGI0NOffrYbNOqZCt5hV+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-I77e2eLPPxaRmAii7tl7xA-1; Fri, 13 Mar 2020 09:34:56 -0400
X-MC-Unique: I77e2eLPPxaRmAii7tl7xA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F19DB1005512;
 Fri, 13 Mar 2020 13:34:54 +0000 (UTC)
Received: from work-vm (ovpn-117-92.ams2.redhat.com [10.36.117.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C61215D9CA;
 Fri, 13 Mar 2020 13:34:53 +0000 (UTC)
Date: Fri, 13 Mar 2020 13:34:51 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] exec/rom_reset: Free rom data during inmigrate skip
Message-ID: <20200313133451.GD3581@work-vm>
References: <20200313123014.206828-1-dgilbert@redhat.com>
 <CAFEAcA8KPovUiycEr2hHb4LP0SL-hBCTNgkA9KFKMb6FQTceuQ@mail.gmail.com>
 <CAFEAcA9pBMC0W9cHKmq5nttPcA9qpYofSvkZEnmkGuS2g_vPTA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9pBMC0W9cHKmq5nttPcA9qpYofSvkZEnmkGuS2g_vPTA@mail.gmail.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yan Vugenfirer <yvugenfi@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Fri, 13 Mar 2020 at 13:21, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> >
> > On Fri, 13 Mar 2020 at 12:31, Dr. David Alan Gilbert (git)
> > <dgilbert@redhat.com> wrote:
> > >
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > >
> > > Commit 355477f8c73e9 skips rom reset when we're an incoming migration
> > > so as not to overwrite shared ram in the ignore-shared migration
> > > optimisation.
> > > However, it's got an unexpected side effect that because it skips
> > > freeing the ROM data, when rom_reset gets called later on, after
> > > migration (e.g. during a reboot), the ROM does get reset to the origi=
nal
> > > file contents.  Because of seabios/x86's weird reboot process
> > > this confuses a reboot into hanging after a migration.
> > >
> > > Fixes: 355477f8c73e9 ("migration: do not rom_reset() during incoming =
migration")
> > > https://bugzilla.redhat.com/show_bug.cgi?id=3D1809380
> > >
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > ---
> > >  hw/core/loader.c | 23 ++++++++++++++---------
> > >  1 file changed, 14 insertions(+), 9 deletions(-)
> > >
> >
> > >      QTAILQ_FOREACH(rom, &roms, next) {
> > >          if (rom->fw_file) {
> > >              continue;
> > >          }
> > > +        /*
> > > +         * We don't need to fill in the RAM with ROM data because we=
'll fill
> > > +         * the data in during the next incoming migration in all cas=
es.  Note
> > > +         * that some of those RAMs can actually be modified by the g=
uest on ARM
> > > +         * so this is probably the only right thing to do here.
> > > +         */
> > > +        if (runstate_check(RUN_STATE_INMIGRATE) && rom->data) {
> > > +            /*
> > > +             * Free it so that a rom_reset after migration doesn't o=
verwrite a
> > > +             * potentially modified 'rom'.
> > > +             */
> > > +            rom_free_data(rom);
> >
> > Shouldn't this condition match the condition in rom_reset()
> > for when we call rom_free_data()? You want the behaviour
> > on a subsequent reset to match the behaviour you'd get
> > if you did a reset on the source end without the migration.
>=20
> Wait, this *is* rom_reset(). Now I'm really confused.

The exsiting rom_reset gets called multiple times:
  a) During init
      This actually copies the ROMs and then calls rom_free_data

  b) During a subsequent reboot
      This is mostly skipped because rom->data is now free because
      of the prior call to rom_free_data during (a)

During an inbound migrate, (a) happens before the migration, and
(b) happens during a reboot after the migration.

The problem is that 355477f8c73e9 caused (a) to be skipped
then when (b) happens it actually overwrites the ROM because
the rom_free_data had been skipped.  What I'm doing here is=20
doing the rom_free_data(..) which causes it to then skip this
iteration during (a) AND causes it to skip it during (b).

Dave

> thanks
> -- PMM
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


