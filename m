Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DB67567B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 20:00:38 +0200 (CEST)
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqi2f-0002yM-My
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 14:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45071)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hqi2L-00023S-2Z
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 14:00:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hqi2J-00014D-MK
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 14:00:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51334)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>)
 id 1hqi2G-0000v3-5p; Thu, 25 Jul 2019 14:00:12 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4DA2A81F0F;
 Thu, 25 Jul 2019 18:00:11 +0000 (UTC)
Received: from work-vm (ovpn-117-187.ams2.redhat.com [10.36.117.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E93C4145;
 Thu, 25 Jul 2019 18:00:09 +0000 (UTC)
Date: Thu, 25 Jul 2019 19:00:07 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190725180007.GN2656@work-vm>
References: <20190725163710.11703-1-peter.maydell@linaro.org>
 <20190725163710.11703-3-peter.maydell@linaro.org>
 <20190725172712.GM2656@work-vm>
 <CAFEAcA-jGvNS4N4qobLekHYdV82qSUWVQOvTRQbrpcCRF0Yvwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-jGvNS4N4qobLekHYdV82qSUWVQOvTRQbrpcCRF0Yvwg@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 25 Jul 2019 18:00:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-4.1? 2/2] vmstate.h: Type check
 VMSTATE_STRUCT_VARRAY macros
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 25 Jul 2019 at 18:27, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > The VMSTATE_STRUCT_VARRAY_UINT32 macro is intended to handle
> > > migrating a field which is an array of structs, but where instead of
> > > migrating the entire array we only migrate a variable number of
> > > elements of it.
> > >
> > > The VMSTATE_STRUCT_VARRAY_POINTER_UINT32 macro is intended to handle
> > > migrating a field which is of pointer type, and points to a
> > > dynamically allocated array of structs of variable size.
> > >
> > > We weren't actually checking that the field passed to
> > > VMSTATE_STRUCT_VARRAY_UINT32 really is an array, with the result that
> > > accidentally using it where the _POINTER_ macro was intended would
> > > compile but silently corrupt memory on migration.
> > >
> > > Add type-checking that enforces that the field passed in is
> > > really of the right array type. This applies to all the VMSTATE
> > > macros which use flags including VMS_VARRAY_* but not VMS_POINTER.
> > >
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > > ---
> > >  include/migration/vmstate.h | 27 +++++++++++++++++++++------
> > >  1 file changed, 21 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> > > index ca68584eba4..2df333c3612 100644
> > > --- a/include/migration/vmstate.h
> > > +++ b/include/migration/vmstate.h
> > > @@ -227,8 +227,19 @@ extern const VMStateInfo vmstate_info_bitmap;
> > >  extern const VMStateInfo vmstate_info_qtailq;
> > >
> > >  #define type_check_2darray(t1,t2,n,m) ((t1(*)[n][m])0 - (t2*)0)
> > > +/* Check that t2 is an array of t1 of size n */
> > >  #define type_check_array(t1,t2,n) ((t1(*)[n])0 - (t2*)0)
> >
> > I'd have to admit I don't understand why that does what you say;
> > I'd expected something to index a t2 pointer with [n].
> 
> Note that this is just a comment describing what the existing
> macro does, as a way to distinguish its job from that of the
> new macro I'm adding.
> 
> What happens here is that t2 is a type like "foo [32]", ie
> it is an array type already. t1 is the base 'foo' type; so the macro
> is checking that t1[n] matches t2, where n is passed in to us
> and must match the declared array size of the field (32 in
> my example). (In C the size of the array is carried around as
> part of its type, and must match on both sides of the expression;
> so if you pass in the name of an array field that's the wrong size the
> type check will fail, which is what we want.)

Ah, OK that makes sense; what it really needs is that example to make
me realise that t2 was already the array.

Dave

> > However, for the rest of it, from migration I'm happy:
> >
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >
> > given it's just fixing an ARM bug, and given it'll blow up straight away
> > I think it's OK for 4.1; the only risk is if we find a compiler we don't
> > like.
> 
> thanks
> -- PMM
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

