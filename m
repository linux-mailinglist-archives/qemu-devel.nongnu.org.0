Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3834AAFA8F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 12:37:54 +0200 (CEST)
Received: from localhost ([::1]:49336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i800X-0001A1-B5
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 06:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54831)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i7zze-0000cg-8D
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 06:36:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i7zzd-0001g9-1G
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 06:36:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62184)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>)
 id 1i7zza-0001f1-7S; Wed, 11 Sep 2019 06:36:54 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2336F30A5408;
 Wed, 11 Sep 2019 10:36:53 +0000 (UTC)
Received: from work-vm (ovpn-117-243.ams2.redhat.com [10.36.117.243])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25BAF6017E;
 Wed, 11 Sep 2019 10:36:47 +0000 (UTC)
Date: Wed, 11 Sep 2019 11:36:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Beata Michalska <beata.michalska@linaro.org>
Message-ID: <20190911103645.GF2894@work-vm>
References: <20190910095610.4546-1-beata.michalska@linaro.org>
 <20190910095610.4546-4-beata.michalska@linaro.org>
 <20190910102601.GA2797@work-vm>
 <CADSWDzs_Cof-L8dGBeYVEY1dNx4Ot6sNcAKtCrvcxZW-3+KUvA@mail.gmail.com>
 <20190910131617.GC2797@work-vm>
 <CADSWDzuuWqBF9rP57Zv7jFPKUhFdVLq-O_uqs29i4dAFz+CgUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADSWDzuuWqBF9rP57Zv7jFPKUhFdVLq-O_uqs29i4dAFz+CgUA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 11 Sep 2019 10:36:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/4] migration: ram: Switch to ram block
 writeback
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
Cc: Peter Maydell <peter.maydell@linaro.org>, quintela@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Beata Michalska (beata.michalska@linaro.org) wrote:
> On Tue, 10 Sep 2019 at 14:16, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Beata Michalska (beata.michalska@linaro.org) wrote:
> > > On Tue, 10 Sep 2019 at 12:26, Dr. David Alan Gilbert
> > > <dgilbert@redhat.com> wrote:
> > > >
> > > > * Beata Michalska (beata.michalska@linaro.org) wrote:
> > > > > Switch to ram block writeback for pmem migration.
> > > > >
> > > > > Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> > > > > ---
> > > > >  migration/ram.c | 5 +----
> > > > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/migration/ram.c b/migration/ram.c
> > > > > index b01a37e7ca..8ea0bd63fc 100644
> > > > > --- a/migration/ram.c
> > > > > +++ b/migration/ram.c
> > > > > @@ -33,7 +33,6 @@
> > > > >  #include "qemu/bitops.h"
> > > > >  #include "qemu/bitmap.h"
> > > > >  #include "qemu/main-loop.h"
> > > > > -#include "qemu/pmem.h"
> > > > >  #include "xbzrle.h"
> > > > >  #include "ram.h"
> > > > >  #include "migration.h"
> > > > > @@ -4064,9 +4063,7 @@ static int ram_load_cleanup(void *opaque)
> > > > >      RAMBlock *rb;
> > > > >
> > > > >      RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
> > > > > -        if (ramblock_is_pmem(rb)) {
> > > > > -            pmem_persist(rb->host, rb->used_length);
> > > > > -        }
> > > > > +        qemu_ram_block_writeback(rb);
> > > >
> > > > ACK for migration
> > > >
> > > > Although I do worry that if you really have pmem hardware, is it better
> > > > to fail the migration if you don't have libpmem available?
> > >
> > > According to the PMDG man page, pmem_persist is supposed to be
> > > equivalent for the msync.
> >
> > OK, but you do define qemu_ram_block_writeback to fall back to fdatasync;
> > so that would be too little?
> 
> Actually it shouldn't. All will end-up in vfs_fsync_range; msync will
> narrow the range.
> fdatasync will trigger the same call just that with a wider range. At
> least for Linux.
> fdatasync will also fallback to fsync if it is not available.
> So it's going from the best case scenario (as of performance and range of mem
> to be synced) towards the worst case one.
> 
> I should probably double-check earlier versions of Linux.
> I'll also try to verify that for other host variants.

Well I guess it should probably follow whatever Posix says;  it's OK to
make Linux specific assumptions for Linux specific bits - but you can't
do it by code examination to guarantee it'll be right for other
platforms, especially if this is in code ifdef'd for portability.
Also it needs commenting to explain why it's safe to avoid someone else
asking this question.

> BTW: Thank you for having a look at the changes.

No problem.

Dave

> BR
> Beata
> 
> >
> > > It's just more performant. So in case of real pmem hardware it should
> > > be all good.
> > >
> > > [http://pmem.io/pmdk/manpages/linux/v1.2/libpmem.3.html]
> >
> > Dave
> >
> > >
> > > BR
> > > Beata
> > > >
> > > > Dave
> > > >
> > > > >      }
> > > > >
> > > > >      xbzrle_load_cleanup();
> > > > > --
> > > > > 2.17.1
> > > > >
> > > > --
> > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

